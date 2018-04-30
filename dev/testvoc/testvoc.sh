#!/bin/bash
echo "==Romanian->Catalan==========================";

bash inconsistency.sh ron-cat ../../../apertium-ron/apertium-ron.ron.dix > /tmp/ron-cat.testvoc; bash inconsistency-summary.sh /tmp/ron-cat.testvoc ron-cat; grep ' #' /tmp/ron-cat.testvoc > testvoc-errors.ron-cat.txt; grep '@' /tmp/ron-cat.testvoc >> testvoc-errors.ron-cat.txt;

if [[ $1 = "-u" ]];
then
  echo "Looking for bidix entries missing from Romanian monodix …";
  pushd ../../ > /dev/null; bash dev/testvoc/bidix-unknowns.sh ron | grep -v ":<:" | grep -v "REGEX" > dev/testvoc/testvoc-missing.ron.txt; popd > /dev/null;
  echo "Entries missing from monodix: "$(wc -l < testvoc-missing.ron.txt) | tee -a testvoc-summary.ron-cat.txt;
fi
echo "";


echo "==Catalan->Romanian==========================";

bash inconsistency.sh cat-ron ../../../apertium-cat/apertium-cat.cat.dix > /tmp/cat-ron.testvoc; bash inconsistency-summary.sh /tmp/cat-ron.testvoc cat-ron; grep ' #' /tmp/cat-ron.testvoc > testvoc-errors.cat-ron.txt; grep '@' /tmp/cat-ron.testvoc >> testvoc-errors.cat-ron.txt;

if [[ $1 = "-u" ]];
then
  echo "Looking for bidix entries missing from Catalan monodix …";
  pushd ../../ > /dev/null; bash dev/testvoc/bidix-unknowns.sh cat | grep -v ":<:" | grep -v "REGEX" > dev/testvoc/testvoc-missing.cat.txt; popd > /dev/null;
  echo "Entries missing from monodix: "$(wc -l < testvoc-missing.cat.txt) | tee -a testvoc-summary.cat-ron.txt;
fi
