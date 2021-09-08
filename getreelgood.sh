#!/bin/bash

# Script to search for movies in the reelgood website.
# Go to the web site, select action and adventure and sort on the IMDB ratings, because that's the movies I would like to watch.
# https://reelgood.com/movies/genre/action-and-adventure?filter-sort=2
# TO DO : Once this script prints the names of the movies - then another script to go to YouTube and see if this movie exists.
 

curl -s https://reelgood.com/movies/genre/action-and-adventure/on-imdb_tv?filter-sort=8 > reelgood.html

# Perl Regular Expressions to use.
# .*?  means: . = any character except new line, * =  match 0 or more times, ? = shortest path. or else it will search for the end.

# The whole movies are in one big line in the HTML file below.

# Useful link:
# https://jkorpela.fi/perl/regexp.html 

perl -lane 'print "$1  $2\n" while ( m/(\"title\":\".*?,).*?(\"imdb_rating\".*?,)/g)' <reelgood.html 
#perl -lane 'print "$1  $2\n" while ( m/(\"title\":\".*?,).*?(\"imdb_rating\".*?,)/g)' <somefile.html 


# The movie and the rating are in one big line - only a snippet is shown here.
#@global":{"title":"Minority Report","released_on":"2002-06-20T00:00:00","imdb_rating":7.6,
