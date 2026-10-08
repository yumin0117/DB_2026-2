-- 그룹별 검색
-- 주문테이블에서 주문고객별로 주문한 제품의 총주문수량을 검색하시오.
SELECT 주문고객, SUM(수량) 총주문수량
FROM 주문
GROUP BY 주문고객;

-- 주문테이블에서 각 주문고객이 주문한 제품의 총주문수량을 주문제품별로 검색하시오.
SELECT 주문제품, 주문고객, SUM(수량) 총주문수량
FROM 주문
GROUP BY 주문고객, 주문제품
ORDER BY 주문제품;

-- 조인(JOIN) 검색
-- 주문, 제품테이블 조인(부모테이블의 외래키(FK)와 자식테이블의 기본키(PK) 속성)
-- 주문테이블과 제품테이블을 조인 검색하시오.
-- 자연조인(NATURAL JOIN)
SELECT *
FROM 주문, 제품
WHERE 주문제품 = 제품번호;

-- 주문테이블과 제품테이블을 조인검색하시오.(주문번호, 주문고객, 제품명, 단가, 제조업체만 출력)
SELECT 주문번호, 주문고객, 제품명, 단가, 제조업체
FROM 주문, 제품
WHERE 주문제품 = 제품번호;

-- 주문테이블과 제품, 고객 테이블을 조인검색하시오.(주문번호, 주문고객, 고객이름, 제품명, 단가, 수량, 제조업체만 출력)
SELECT 주문번호, 주문고객, 고객이름, 제품명, 단가, 수량, 제조업체
FROM 주문, 제품, 고객
WHERE 주문.주문제품 = 제품.제품번호 AND 고객.고객아이디 = 주문.주문고객
ORDER BY 주문번호;

-- apple 고객이 주문한 제품의 이름을 검색하시오.
SELECT 제품명
FROM 주문, 제품
WHERE 주문고객 = 'apple' AND 주문제품 = 제품번호;

-- 그냥만두를 주문한 고객의 이름을 검색하시오.
SELECT DISTINCT 고객이름
FROM 고객, 제품, 주문
WHERE 주문제품 = 제품번호 AND 고객아이디 = 주문고객 AND 제품명 = '감자만두';

SELECT 고객아이디, 고객이름, 나이, 등급, 직업, 적립금, 제품번호, 제품명, 단가, 수량, 배송지, 주문일자
FROM 고객, 제품, 주문
WHERE 주문제품 = 제품번호 AND 고객아이디 = 주문고객 AND 제품명 = '감자만두';

-- 나이가 25세이상인 고객이 주문한 제품의 번호, 주문일자, 고객이름을 검색하시오.
SELECT 주문제품, 주문일자, 고객이름
FROM 고객, 주문
WHERE 나이 >= 25 AND 고객아이디 = 주문고객
ORDER BY 주문제품;

-- 고명석 고객이 주문한 제품의 제품명을 검색하시오.
SELECT 제품명
FROM 고객, 제품, 주문
WHERE 주문제품 = 제품번호 AND 주문고객 = 고객아이디 AND 고객이름='고명석';

-- 정소화 고객이 주문한 제품의 제품명을 검색하시오.
SELECT DISTINCT 제품명
FROM 고객, 제품, 주문
WHERE 주문제품 = 제품번호 AND 주문고객 = 고객아이디 AND 고객이름='정소화';

-- 내부조인(INNER JOIN)
-- FROM 테이블1 INNER JOIN 테이블2 IN 테이블1 인스턴스 = 테이블2 인스턴스

-- 고객이 주문한 제품의 번호와 주문일자를 검색하시오.(단, 내부조인으로 작성하시오.)
SELECT 고객이름, 주문제품, 주문일자
FROM 고객 INNER JOIN 주문 ON 고객아이디 = 주문고객
ORDER BY 고객이름;

-- 고객의 성이 정 또는 김 또는 고인 고객이 주문한 제품의 번호와 주문일자를 검색하시오.(단, 내부조인으로 작성하시오.)
SELECT 고객이름, 주문제품, 주문일자
FROM 고객 INNER JOIN 주문 ON 고객아이디 = 주문고객
WHERE 고객이름 LIKE '정%' OR 고객이름 LIKE '강%' OR 고객이름 LIKE '고%'
ORDER BY 고객이름;

-- 외부조인 (OUTER JOIN)
-- 주문하지 않은 고객도 포함해서 고객이름, 주문제품, 주문일자를 검색하시오.
SELECT 고객이름, 주문제품, 주문일자
FROM 고객 LEFT OUTER JOIN 주문 ON 고객아이디 = 주문고객;

-- 자연조인
SELECT 고객이름, 주문제품, 주문일자
FROM 고객 
WHERE 고객아이디 = 주문고객;

-- 왼쪽 외부조인
SELECT 고객이름, 주문제품, 주문일자
FROM 고객 LEFT OUTER JOIN 주문 ON 고객아이디 = 주문고객;

-- 오른쪽 외부조인
SELECT 고객이름, 주문제품, 주문일자
FROM 고객 RIGHT OUTER JOIN 주문 ON 고객아이디 = 주문고객;

-- Sub Query(부속질의문)
-- 단일행 결과 부속질의문
-- 달콤비스킷을 생산한 제조업체가 만든 제품들이 제품명과 단가를 검색하시오.
SELECT 제품명, 단가
FROM 제품
WHERE 제조업체 = (SELECT 제조업체 FROM 제품 WHERE 제품명 = '달콤비스킷');

-- 집계함수를 이용한 Sub Query
-- 적립금이 가장 적은 고객의 고객이름과 적립금을 검색하시오.
SELECT MIN(적립금)
FROM 고객;

SELECT 고객이름, 적립금
FROM 고객
WHERE 적립금 = (SELECT MIN(적립금) FROM 고객);

-- 다중행 부속질의문
-- banana 고객이 주문한 제품의 제품명, 제조업체를 검색하시오.
SELECT 주문제품
FROM 주문
WHERE 주문고객 = 'banana';  // 다중행 결과

SELECT 제품명, 제조업체 
FROM 제품
WHERE 제품번호 IN(SELECT 주문제품 FROM 주문 WHERE 주문고객 = 'banana');

-- banana 고객이 주문하지 않은 제품의 제품명, 제조업체를 검색하시오.
SELECT 제품명, 제조업체 
FROM 제품
WHERE 제품번호 NOT IN(SELECT 주문제품 FROM 주문 WHERE 주문고객 = 'banana');

-- 대한식품이 제조한 모든 제품의 단가보다 비싼 제품의 제품명, 단가, 제조업체를 검색하시오.
SELECT 단가
FROM 제품
WHERE 제조업체 = '대한식품';

SELECT 제품명, 단가, 제조업체
FROM 제품
WHERE 단가 > ALL(SELECT 단가 FROM 제품 WHERE 제조업체 = '한빛제과');