import 'package:flutter/material.dart';

class SearchBarWithDropdown extends StatefulWidget {
  const SearchBarWithDropdown({super.key});

  @override
  _SearchBarWithDropdownState createState() => _SearchBarWithDropdownState();
}

class _SearchBarWithDropdownState extends State<SearchBarWithDropdown> {
  final TextEditingController _controller = TextEditingController();
  OverlayEntry? _overlayEntry;
  List<String> _hotSearchTerms = ["热门搜索1", "热门搜索2", "热门搜索3", "热门搜索4"];
  final LayerLink _layerLink = LayerLink();

  void _showOverlay(BuildContext context) {
    final OverlayState overlayState = Overlay.of(context);
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            left: offset.dx + 2,
            top: offset.dy + size.height + 3,
            width: size.width,
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _hotSearchTerms.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        _controller.text = _hotSearchTerms[index];
                        _hideOverlay();
                        print("用户触发搜索"); // 点击下拉列表项时触发搜索
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                        child: Text(_hotSearchTerms[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
    );
    overlayState.insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8,left: 8), // 右侧组件的右边距
      child: CompositedTransformTarget(
        link: _layerLink,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: '搜索',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  onTap: () => _showOverlay(context),
                  onSubmitted: (String value) {
                    print("用户触发搜索"); // 按下回车键时触发搜索
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.clear, color: Colors.grey),
                onPressed: () {
                  _controller.clear();
                  _hideOverlay();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _hideOverlay();
    _controller.dispose();
    super.dispose();
  }
}
