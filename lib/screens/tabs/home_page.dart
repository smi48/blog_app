import 'package:blog_app/provider/appstate.dart';
import 'package:blog_app/constans/styles/text_styles_const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../components/blog_item.dart';
import '../../components/home_category.dart';
import '../../models/blog_model.dart';
import '../../models/category_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<BlogModel> blogs = [];
  List<BlogModel> filtredList = [];
  bool isFiltred = false;
  bool isAllLoading = false;
  bool isPartialLoading = false;
  changeAllLoading() => setState(() => isAllLoading = !isAllLoading);
  changePartialLoading() =>
      setState(() => isPartialLoading = !isPartialLoading);
  final String urlBlogs = "http://test20.internative.net/Blog/GetBlogs";

  @override
  void initState() {
    // var app = Provider.of<AppState>(context, listen: false);
    super.initState();
    initPage(context: context, willGetCats: true);
  }

  initPage({required BuildContext context, bool willGetCats = false}) async {
    willGetCats ? changeAllLoading() : changePartialLoading();
    var app = Provider.of<AppState>(context, listen: false);
    if (willGetCats) await app.getCategories();
    await app.getBlogs();
    willGetCats ? changeAllLoading() : changePartialLoading();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = Provider.of<AppState>(context, listen: false).queryWidth;
    var screenHeight =
        Provider.of<AppState>(context, listen: false).queryHeight;

    return Scaffold(
        appBar: AppBar(title: const Text("Home"), centerTitle: true),
        body: Consumer<AppState>(
          builder: (context, state, child) {
            return isAllLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      SizedBox(
                        height: screenHeight * 130 / 700,
                        child: state.categories == null
                            ? const Text("data")
                            : ListView.builder(
                                padding: const EdgeInsets.only(left: 11),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isFiltred = !isFiltred;
                                        filtredList = state.blogs!.data
                                            .where((element) =>
                                                element.categoryId ==
                                                state
                                                    .categories!.data[index].id)
                                            .toList();
                                      });
                                    },
                                    child: buildCategory(
                                        screenHeight,
                                        screenWidth,
                                        index,
                                        state.categories!.data[index].title,
                                        state.categories!.data[index].image),
                                  );
                                },
                                itemCount: state.categories!.data.length),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, top: 28, bottom: 16),
                        child: Text(
                          isFiltred == false
                              ? "Blog - All"
                              : filtredList.isEmpty
                                  ? "Blog - All"
                                  : "Blog ${filtredList[1].title}"
                                      .replaceAll("What is Lorem Ipsum?", ""),
                          style: BlogAppTextStyles.pageTitle,
                        ),
                      ),
                      Expanded(
                        child: state.blogs == null
                            ? const Center(child: Text("error"))
                            : GridView.builder(
                                padding: const EdgeInsets.all(16),
                                itemCount: isFiltred == false
                                    ? state.blogs!.data.length
                                    : filtredList.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 16,
                                        childAspectRatio: 174 / 266),
                                itemBuilder: (context, index) {
                                  return isFiltred == false
                                      ? buildBlogItem(
                                          context,
                                          state.blogs!.data[index].title,
                                          index,
                                          state.blogs!.data[index].image,
                                          state.blogs!.data[index].content,
                                        )
                                      : buildBlogItem(
                                          context,
                                          filtredList[index].title,
                                          index,
                                          filtredList[index].image,
                                          filtredList[index].content,
                                        );
                                },
                              ),
                      ),
                    ],
                  );
          },
        ));
  }
}
