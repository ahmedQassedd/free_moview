import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget movieDetails(context, title, releaseDate, voteAverage, voteCount,
        language, popularity, moviePoster, story, tagId) =>
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
              tag: "$tagId",
              child: Image.network(
                  'https://image.tmdb.org/t/p/original$moviePoster')),
          Container(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Movie Details: ',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                const SizedBox(
                  height: 35,
                ),
                Text('Movie Name:  $title',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '$story',
                  maxLines: 10,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text('Release Date:  $releaseDate'),
                const SizedBox(
                  height: 20,
                ),
                Text('Vote Average:  $voteAverage '),
                const SizedBox(
                  height: 20,
                ),
                Text('Vote Count:  $voteCount '),
                const SizedBox(
                  height: 20,
                ),
                Text('Original Language:  $language'),
                const SizedBox(
                  height: 20,
                ),
                Text('Popularity:  $popularity'),
              ],
            ),
          ),
        ],
      ),
    );

AppBar appBar(context) => AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black54,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
    );
