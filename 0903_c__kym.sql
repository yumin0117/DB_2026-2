-- DDL(데이터 정의어)
-- 테이블 변경

-- 컬럼(속성) 추가
ALTER TABLE 고객
    ADD 가입날짜 DATE;

-- 컬럼(속성) 삭제
ALTER TABLE 고객
    DROP COLUMN 가입날짜;
    
-- 제약조건 추가
ALTER TABLE 고객
    ADD CONSTRAINT CHECK_AGE CHECK(나이>=20);
    
-- 제약조건 삭제
ALTER TABLE 고객
    DROP CONSTRAINT CHECK_AGE;
    
-- 테이블 삭제
DROP TABLE 배송업체;

-- DML (데이터 조작어) 
-- INSERT (테이블에 더이터를 삽입)

-- 고객 테이블에 데이터행 삽입
-- 모든 컬럼에 값이 삽입
-- 1번 방법: 테이블명 ()안에 모든 컬럼리스트를 나열
INSERT INTO 고객(고객아이디, 고객이름, 나이, 등급, 직업, 적립금)
    VALUES('banana', '강선우', 25, 'vip', '간호사', 2500);
    
-- 2번 방법: 테이블명 ()안에 모든 컬럼리스트 생략
INSERT INTO 고객
    VALUES('carrot', '고명석', 28, 'gold', '교사', 4500);
    
-- 3번 방법: 컬럼의 순서를 변경
INSERT INTO 고객(고객아이디, 고객이름, 직업, 등급, 적립금, 나이)
    VALUES('orange', '김용욱', '학생', 'silver', 0,22);
    
-- 4번 방법: 컬럼 일부를 리스트에서 생략, NOT NULL 제약조건이 없는 컬럼만 생략 가능
INSERT INTO 고객(고객아이디, 고객이름, 등급, 직업)
    VALUES('melon', '성원용', 'gold', '회사원');
    
INSERT INTO 고객(고객아이디, 고객이름, 등급, 직업, 적립금)
    VALUES('peach', '오형준', 'silver', '의사', 300);
    
INSERT INTO 고객
    VALUES('pear', '채광준', 31, 'silver', '회사원', 500);
    
INSERT INTO 고객
    VALUES('strawberry', '최유경', 30, 'vip', '공무원', 100);
    
SELECT * FROM 고객;

-- INSERT INTO 테이블명 (컬럼1, 컬럼2, 컬럼3)
-- VALUES
--      ('값A1', '값A2' '값A3')
--      ('값B1', '값B2' '값B3')
--      ('값C1', '값C2' '값C3')
-- 이건 MYSQL 에서만 가능 ORACLE 불가!

-- 제품 테이블에 데이터 삽입

INSERT INTO 제품 VALUES ('P02', '매운쫄면', 2500, 5500, '대한식품');
INSERT INTO 제품 VALUES ('P03', '쿵떡파이', 3600, 2600, '민국푸드');
INSERT INTO 제품 VALUES ('P04', '맛난초컬릿', 1250, 2500, '한빛제과');
INSERT INTO 제품 VALUES ('P05', '얼큰라면', 2200, 1200, '대한식품');
INSERT INTO 제품 VALUES ('P06', '통통우동', 1000, 1550, '민국푸드');
INSERT INTO 제품 VALUES ('P07', '달콤비스킷', 1650, 1500, '한빛제과');

SELECT * FROM 제품;

-- 주문 테이블에 데이터 삽입

INSERT INTO 주문 VALUES ('o03', 'banana', 'P06', 45, '경기도 부천시', '26/09/01');
INSERT INTO 주문 VALUES ('o04', 'carrot', 'P02', 8, '부산시 금정구', '26/07/30');
INSERT INTO 주문 VALUES ('o05', 'melon', 'P06', 36, '경기도 용인시', '26/08/01');
INSERT INTO 주문 VALUES ('o06', 'banana', 'P01', 19, '충청북도 보은군', '26/07/07');
INSERT INTO 주문 VALUES ('o07', 'apple', 'P03', 22, '서울시 영등포구', '26/09/03');
INSERT INTO 주문 VALUES ('o08', 'pear', 'P02', 50, '강원도 춘천시', '26/06/03');
INSERT INTO 주문 VALUES ('o09', 'banana', 'P04', 15, '전라남도 목포시', '26/07/08');
INSERT INTO 주문 VALUES ('o10', 'carrot', 'P03', 20, '경기도 안양시', '26/08/20');

SELECT * FROM 주문;