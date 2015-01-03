#!/bin/bash
#
# Runs diff for each test, passing dated directory name
diffjson.sh detect EN $1
diffjson.sh detect ES $1
diffjson.sh detect RU $1
diffjson.sh detect FA $1
diffjson.sh mapping EN $1
diffjson.sh mapping ES $1
diffjson.sh mapping RU $1
diffjson.sh mapping FA $1
diffjson.sh source EN $1
diffjson.sh source ES $1
diffjson.sh source RU $1
diffjson.sh source FA $1
diffjson.sh affect EN $1
diffjson.sh affect ES $1
diffjson.sh affect RU $1
diffjson.sh affect FA $1
