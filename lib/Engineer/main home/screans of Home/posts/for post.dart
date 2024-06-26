import 'package:flutter/material.dart';
import '../home_comunity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit_post/cubit_post.dart';


class ForPost extends StatelessWidget {
  const ForPost({Key? key}) : super(key: key);

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
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  if (state.selectedImages.isNotEmpty)
                    Expanded(
                      flex: 5,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4,
                        ),
                        itemCount: state.selectedImages.length,
                        itemBuilder: (context, index) {
                          return Image.file(
                            state.selectedImages[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30, top: 20),
                          child: MaterialButton(
                            elevation: .5,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Colors.indigo[900],
                            onPressed: () {

                              BlocProvider.of<ImageCubit>(context) .postImages();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CommunityPage(),
                                  ));

                            },
                            minWidth: 90,
                            child: Text(
                              'Post',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
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

