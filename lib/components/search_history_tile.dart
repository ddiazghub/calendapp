import 'package:flutter/material.dart';

class SearchHistoryTile extends StatelessWidget {
  const SearchHistoryTile({
    super.key,
    this.icon = Icons.access_time,
    required this.search,
    required this.address,
  });

  final IconData icon;
  final String search;
  final String address;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(search),
      subtitle: Text(address),
      onTap: () {},
    );
  }
}
