import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'cubit_post/cubit_post.dart';
import 'for post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NewPost extends StatelessWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          "New Post",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ImageCubit, ImageState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ForPost()));
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(
                                color: Colors.indigo.shade900, fontSize: 20),
                          )),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Colors.indigo[900])),
                    onPressed: () {
                      context.read<ImageCubit>().pickImages();
                    },
                    child: Text('Select Images'),
                  ),
                  SizedBox(height: 20),
                  if (state.selectedImages.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.selectedImages.length,
                        itemBuilder: (context, index) {
                          return Image.file(
                            state.selectedImages[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

