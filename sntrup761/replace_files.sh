
function rmln () {
    rm -rf $1
    ln -s $2
}

LIST=(type api.h crypto_kem.h crypto_kem_sntrup761.h kem.c params.h paramsmenu.h poly_mask.c poly_mask.h poly_mulmod.c poly_mulmod.h \
      poly_recip.c poly_recip.h sntrup_core.c sntrup_core.h \
      Decode.c Decode.h Encode.c Encode.h hash.c hash.h poly_encode_decode.c poly_encode_decode.h poly_rand.c poly_rand.h poly_type.h \
      test.c testvectors.c speed.c speed_hash.c speed_rand.c speed_sort.c speed_arith.c speed_encode_decode.c)

SRC_PATH=../aarch64_gt_rader_bruun


cd aarch64_gt_schönhage
for i in "${LIST[@]}"
do
    rmln $i $SRC_PATH/$i
done
cd ../


