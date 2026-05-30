# 사립대 사학재단 재정 구조 대시보드

하네스 뉴스룸 탐사 보도 시리즈의 인터랙티브 대시보드.
사립대학의 법인전입금·수익용 기본재산·적립금을 학교알리미·대학정보공시 데이터로 추적한다.

**기준 자료** · 2024 회계연도, 한국사학진흥재단 「사립대학재정통계연보」, 대학교육연구소 「2024년 사립대 적립금 분석」.

## 구성

- KPI · 누적 적립금 11.6조, 법인전입금 비율 3.9%, 적립금 100억+ 증액 17곳 중 16곳 등록금 인상
- 14년 추세 · 등록금 의존율, 법인전입금 비율 분포, 17개 대학 증액 막대, 인출 vs 적립 집행률
- 의존형 vs 축적형 두 모델 비교 표
- 누적 적립금 상위 10 정렬 가능 테이블
- 제도가 허용해 온 통로 셋 인포그래픽
- 두 입장 인용 (사총협 · 한국사학진흥재단)
- 조사 방법·한계

## 로컬에서 보기

```bash
cd university-dashboard
python3 -m http.server 8000
# 또는
npx serve .
```

브라우저에서 `http://localhost:8000` 열기.

## GitHub 새 repo로 올리고 Pages 배포

### 1. GitHub에서 새 repo 생성

[github.com/new](https://github.com/new) — 이름 `university-dashboard`, public, README/`.gitignore`/license 모두 체크 해제 (이미 폴더에 있음).

### 2. 로컬에서 푸시

```bash
cd /Users/leejeonghwan/work/harness/university-dashboard
git init
git add .
git commit -m "init: 사립대 사학재단 재정 구조 대시보드"
git branch -M main
git remote add origin git@github.com:<USERNAME>/university-dashboard.git
git push -u origin main
```

SSH 키 미설정 시 HTTPS로:

```bash
git remote add origin https://github.com/<USERNAME>/university-dashboard.git
```

### 3. GitHub Pages 활성

repo 페이지 → Settings → Pages → Source: **Deploy from a branch**, Branch: **main**, Folder: **`/ (root)`** → Save.

수 분 뒤 `https://<USERNAME>.github.io/university-dashboard/` 에서 접근.

> `.nojekyll` 파일이 함께 푸시되므로 Jekyll 파이프라인을 거치지 않고 그대로 정적 호스팅된다.

## 데이터 출처

- 대학교육연구소 「2024년 사립대 적립금 분석」(2025-09-08) — [khei.re.kr/post/3269](http://khei.re.kr/post/3269)
- 경향신문 「전입금 '쥐꼬리'... 14년간 3.9% 동결」(2025-02-09) — [khan.co.kr](https://www.khan.co.kr/article/202502092004015)
- 한국대학신문 「사립대 재정, 어디에 쓰였나」(2025-12-29) — [unn.net](https://news.unn.net/news/articleView.html?idxno=588118)
- 한국대학신문 2020 국감 「사립학교법인 310개 법정부담금 전가」 — [unn.net](https://news.unn.net/news/articleView.html?idxno=235449)
- 메트로신문 「법정부담금 등록금으로 2,912억」(2020-11-09) — [metroseoul.co.kr](https://www.metroseoul.co.kr/article/20201109500279)
- 베리타스알파 「상위 15개대 교비 적립금 이대 6,328억 5년째 톱」 — [veritas-a.com](https://www.veritas-a.com/news/articleView.html?idxno=578588)
- 베리타스알파 「사립대 법정부담금 부담액 1위 연세대」 — [veritas-a.com](https://www.veritas-a.com/news/articleView.html?idxno=306030)
- 대학지성 In&Out — [unipress.co.kr](https://www.unipress.co.kr/news/articleView.html?idxno=6410)
- 뉴시스 「등록금 의존율 48.1%」(2025-12-31) — [newsis.com](https://www.newsis.com/view/NISX20251231_0003461610)
- 한국사학진흥재단 사립대학재정통계연보 — [uniarlimi.kasfo.or.kr](https://uniarlimi.kasfo.or.kr/)
- 대학알리미 — [academyinfo.go.kr](https://www.academyinfo.go.kr)
- 국가법령정보센터 사립학교법 — [law.go.kr](https://www.law.go.kr/LSW//lsInfoP.do?lsiSeq=273349)

## 한계

- 본·분교 합산/분리 기준에 따라 적립금 1위가 홍익↔이대로 바뀐다.
- 2024년 9월 「대학설립·운영 규정」 개정 이후 수익용 기본재산 확보율의 시계열 직접 비교가 어렵다.
- 법정부담금 전가의 정확한 특례규칙 조·항 번호, 박정원(대교연)의 직함, 사총협 입장문 원문은 후속 확인 권고 사항.

## 라이선스

데이터는 출처 매체·기관에 귀속. 코드(HTML/CSS/JS)는 MIT.

## 관련 산출물

탐사 보도 6단계 산출물 전체는 `_workspace/*_20260530_sahak.md`에 있다.

- `desk_brief_20260530_sahak.md` — 데스크 브리프
- `reporter_notes_20260530_sahak.md` — 비트 리포터 취재 노트
- `insight_report_20260530_sahak.md` — 애널리스트 인사이트
- `draft_20260530_sahak.md` — 라이터 초안
- `factcheck_result_20260530_sahak.md` — 팩트체크 결과
- `final_article_20260530_sahak.md` — 최종 기사

— 하네스 뉴스룸 · 2026.05.30
