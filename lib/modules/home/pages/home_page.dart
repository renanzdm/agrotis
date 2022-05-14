import 'package:agrotis/core/widgets/snack_bar_error.dart';
import 'package:agrotis/modules/home/models/image_model.dart';
import 'package:agrotis/modules/home/pages/controller/home_store.dart';
import 'package:agrotis/modules/home/pages/widgets/app_bar_custom.dart';
import 'package:agrotis/modules/home/pages/widgets/drawer_widget.dart';
import 'package:agrotis/modules/home/pages/widgets/header_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/controller/theme_store.dart';
import '../../../core/http_client/http_client_impl.dart';
import '../repositories/get_photo_repository_impl.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => HomeStore(
          getPhotoRepository:
              GetPhotoRepositoryImpl(httpClient: HttpClientImpl())),
      child: const HomePageContent(),
    );
  }
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<HomeStore>().getPhotos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      drawer: const DrawerWidget(),
      body: Observer(builder: (context) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: context.read<ThemeStore>().isDark
                ? null
                : const LinearGradient(colors: [
                    Color(0xFF15AE95),
                    Colors.white,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            return Observer(builder: (context) {
              if (context.read<HomeStore>().loading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (context.read<HomeStore>().errorMessage.isNotEmpty) {
                SnackBarError.showError(context);
                return const SizedBox();
              } else {
                return Container(
                  width: constraints.maxWidth * .95,
                  height: constraints.maxHeight * .95,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      HeaderPage(
                        width: constraints.maxWidth * .9,
                      ),
                      Expanded(
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(minHeight: constraints.maxHeight),
                          child: Visibility(
                            visible: context.read<ThemeStore>().isGrade,
                            replacement: ListView.builder(
                              itemCount:
                                  context.read<HomeStore>().images.length,
                              itemBuilder: ((context, index) => PhotoWidget(
                                    model:
                                        context.read<HomeStore>().images[index],
                                  )),
                            ),
                            child: GridView.builder(
                              itemCount:
                                  context.read<HomeStore>().images.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemBuilder: ((context, index) => PhotoWidget(
                                    model:
                                        context.read<HomeStore>().images[index],
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            });
          }),
        );
      }),
    );
  }
}

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ImageModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            useSafeArea: true,
            builder: (context) {
              return Center(
                child: SizedBox(
                  height: 500,
                  child: Image.network(
                    model.imageLargeQuality,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              );
            });
      },
      child: Container(
        margin: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        height: 400,
        width: 200,
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  model.imageMediumQuality,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  },
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                bottom: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 112, 112, 112),
                          offset: Offset(.5, 2),
                          blurRadius: 2.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: context.read<ThemeStore>().isDark
                          ? const Color.fromARGB(255, 85, 83, 83)
                          : const Color.fromARGB(255, 81, 213, 158)),
                  child: const Icon(
                    Icons.zoom_in,
                    color: Colors.white,
                    size: 40,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
