import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/features/details/details.dart';
import 'package:rick_and_morty/features/characters/characters.dart';

class CharactersList extends StatefulWidget {
  const CharactersList({super.key});

  @override
  State<CharactersList> createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  final _scrollController = ScrollController();
  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<CharactersBloc>().add(CharactersFetched());
  }

  void onTap(int id) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CharacterDetailsPage(id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
      switch (state.status) {
        case CharactersStatus.initial:
          return const Center(child: CircularProgressIndicator());
        case CharactersStatus.success:
          if (state.chars.isEmpty) {
            return const Center(child: Text('No chars :()'));
          }
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return index >= state.chars.length
                  ? const BottomLoader()
                  : CharacterListItem(state.chars[index], onTap);
            },
            itemCount: state.hasReachedMax
                ? state.chars.length
                : state.chars.length + 1,
            controller: _scrollController,
          );
        case CharactersStatus.failure:
          return const Center(child: Text('Failed to fetch characters'));
      }
    });
  }
}
