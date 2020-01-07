#!/bin/bash

pushd temp

java -jar /Users/max/sdks/air/33.0.2.338/lib/adt.jar \
  -package \
  -storetype pkcs12 \
  -keystore /Users/max/cert/rozd.selfsigned.p12 \
  -storepass Vopli1982 \
  -tsa http://timestamp.apple.com/ts01 \
  -target ane com.github.rozd.bugs.dyfmwk.ane ../extension.xml \
  -swc swc/default/dyfmwk.swc \
  -platform iPhone-ARM -platformoptions ../platform-ios.xml -C ios/ . \
  -platform iPhone-x86 -platformoptions ../platform-ios.xml -C ios-simulator/ . \
  -platform Android-ARM -platformoptions ../platform-android.xml -C android/ . \
  -platform Android-x86 -platformoptions ../platform-android.xml -C android/ . \
  -platform default -C default/ .

popd
