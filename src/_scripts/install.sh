#!/usr/bin/env bash

rm -r _site
jekyll build
cp -r _site/* ..
