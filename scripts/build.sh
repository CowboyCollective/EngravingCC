#!/bin/sh


set -e

echo "Generating TrueType Fonts"
fontmake  -o ttf --output-dir ../fonts/ttf2/ -u ../sources/UFO/EngravingCC.ufo ../sources/UFO/EngravingShadedCC.ufo ../sources/UFO/EngravingUnshadedCC.ufo

echo "Hot Fixes"
gftools fix-dsig -f ../fonts/ttf2/*.ttf

mkdir -p ../fonts/ttf

ttfautohint -n ../fonts/ttf2/EngravingCC.ttf ../fonts/ttf/EngravingCC.ttf
ttfautohint -n ../fonts/ttf2/EngravingShadedCC.ttf ../fonts/ttf/EngravingShadedCC.ttf
ttfautohint -n ../fonts/ttf2/EngravingUnshadedCC.ttf ../fonts/ttf/EngravingUnshadedCC.ttf

gftools fix-hinting ../fonts/ttf/EngravingCC.ttf
gftools fix-hinting ../fonts/ttf/EngravingShadedCC.ttf
gftools fix-hinting ../fonts/ttf/EngravingUnshadedCC.ttf

echo "Cleaning Directory Up"
rm ../fonts/ttf/*.ttf

mv ../fonts/ttf/EngravingCC.ttf.fix ../fonts/ttf/EngravingCC.ttf
mv ../fonts/ttf/EngravingShadedCC.ttf.fix ../fonts/ttf/EngravingShadedCC.ttf
mv ../fonts/ttf/EngravingUnshadedCC.ttf.fix ../fonts/ttf/EngravingUnshadedCC.ttf

rm ../fonts/ttf2/*.ttf
rmdir ../fonts/ttf2

echo "Generating OpenType Fonts"
fontmake  -o otf --output-dir ../fonts/otf/ -u ../sources/UFO/EngravingCC.ufo ../sources/UFO/EngravingUnshadedCC.ufo

fontmake -o otf --output-dir ../fonts/otf/ -u ../sources/UFO/EngravingShadedCC.ufo --optimize-cff 0

echo "All Done!"
