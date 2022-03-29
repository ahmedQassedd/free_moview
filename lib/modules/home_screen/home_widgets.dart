import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_movies/modules/details_screen/details_screen.dart';
import 'package:free_movies/shared/components.dart';
import 'package:free_movies/shared/cubit/app_cubit.dart';

Widget moviesList(context) => ConditionalBuilder(
      condition: (AppCubit.get(context).moviesModel != null),
      builder: (context) => Container(
        padding: const EdgeInsets.all(18),
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  navigateTo(context, DetailsScreen(index));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag:
                          "${AppCubit.get(context).moviesModel?.results?[index].id}",
                      child: Container(
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/original${AppCubit.get(context).moviesModel?.results?[index].posterPath}',
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${AppCubit.get(context).moviesModel?.results?[index].title}',
                              maxLines: 3,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                      overflow: TextOverflow.ellipsis),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Release Date:  ${AppCubit.get(context).moviesModel?.results?[index].releaseDate}',
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Vote Average:  ${AppCubit.get(context).moviesModel?.results?[index].voteAverage}',
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Vote Count:  ${AppCubit.get(context).moviesModel?.results?[index].voteCount}',
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Original Language:  ${AppCubit.get(context).moviesModel?.results?[index].originalLanguage}',
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.all(20.0),
                  child: Container(
                    height: 1.0,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                ),
            itemCount: AppCubit.get(context).moviesModel!.results!.length),
      ),
      fallback: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

AppBar appBar() => AppBar(
      title: const Text(
        'All Movies',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
    );
