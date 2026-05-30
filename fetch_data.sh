#!/usr/bin/env bash
# 한국사학진흥재단 대학재정알리미 통합공시 API 호출 스크립트
# 사용: ./fetch_data.sh
set -e
BASE="https://uniarlimi.kasfo.or.kr/totalAnno/properties/property/search"
REF="https://uniarlimi.kasfo.or.kr/totalAnno/properties/property"
mkdir -p raw_data
# 4년제 일반대학(gradeDiv=10)
# searchType: 1=확보율, 2=수익률, 3=학교운영경비 부담
# searchKind: year=연도별 평균, school=학교별 전체

# 11년치 연도별 평균 시계열
for st in 1 3; do
  TAG=$([ "$st" = "1" ] && echo "cover" || echo "burden")
  for y in 2016 2017 2018 2019 2020 2021 2022 2023 2024; do
    curl -sL -X POST "$BASE" \
      -H "Content-Type: application/x-www-form-urlencoded" -H "Referer: $REF" \
      --data-urlencode "data=json" --data-urlencode "putYear=$y" \
      --data-urlencode "searchType=$st" --data-urlencode "searchKind=year" \
      --data-urlencode "gradeDiv=10" --data-urlencode "schoolEach=ALL" \
      --data-urlencode "schNm=" -o "raw_data/ts_${TAG}_${y}.json"
  done
done

# 학교별 5년치 (2020~2024)
for st in 1 2 3; do
  TAG=$([ "$st" = "1" ] && echo "cover" || ([ "$st" = "2" ] && echo "rev" || echo "burden"))
  for y in 2020 2021 2022 2023 2024; do
    curl -sL -X POST "$BASE" \
      -H "Content-Type: application/x-www-form-urlencoded" -H "Referer: $REF" \
      --data-urlencode "data=json" --data-urlencode "putYear=$y" \
      --data-urlencode "searchType=$st" --data-urlencode "searchKind=school" \
      --data-urlencode "gradeDiv=10" --data-urlencode "schoolEach=ALL" \
      --data-urlencode "schNm=" -o "raw_data/sch_${TAG}_${y}.json"
  done
done

echo "Done. files in raw_data/"
