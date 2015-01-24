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
