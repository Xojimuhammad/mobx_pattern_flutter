import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/post_model.dart';
import '../stores/home_store/home_store.dart';

Widget itemsOfPost(HomeStore store, Post post, BuildContext context) {
  return Slidable(
    key: UniqueKey(),
    startActionPane: ActionPane(
      extentRatio: 0.5,
      dismissible: DismissiblePane(onDismissed: () {
        store.apiPostDelete(context, post);
      }),
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (context) {
            store.apiPostDelete(context, post).then((value) => {
              if(value!) store.apiPostList(context),
            });
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete_outline,
        ),
      ],
    ),
    child: Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        children: [
          Text(
            post.title.toUpperCase(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            post.body,
            style: const TextStyle(color: Colors.black),
          )
        ],
      ),
    ),
  );
}

