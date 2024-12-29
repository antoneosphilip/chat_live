import 'package:flutter/material.dart';

class PaginatedListWidget extends StatefulWidget {
  final ScrollController scrollController;
  final Function(int? page) onPaginate;
  final bool isLoading;
  final int? page;
  final Widget itemView;
  final bool enabledPagination;
  const PaginatedListWidget({
    super.key,
    required this.scrollController,
    required this.onPaginate,
    this.isLoading = false,
    required this.itemView,
    this.enabledPagination = true,
    this.page,
  });

  @override
  State<PaginatedListWidget> createState() => _PaginatedListWidgetState();
}

class _PaginatedListWidgetState extends State<PaginatedListWidget> {
  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels ==
              widget.scrollController.position.maxScrollExtent &&
          !widget.isLoading &&
          widget.enabledPagination) {
        if (mounted) {
          _paginate();
        }
      }
    });
  }

  void _paginate() async {
    await widget.onPaginate(widget.page);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
      widget.itemView,
      widget.isLoading
          ? const Center(
              child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  )))
          : const SizedBox(),
      const SizedBox(
        height: 60,
      )
    ]);
  }
}
