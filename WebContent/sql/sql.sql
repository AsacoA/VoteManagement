DROP TABLE tbl_vote_202005;
DROP TABLE tbl_member_202005;
DROP TABLE tbl_party_202005;


CREATE TABLE tbl_vote_202005(
	V_JUMIN CHAR(13) PRIMARY KEY,
	V_NAME VARCHAR2(20),
	M_NO CHAR(1),
	V_TIME CHAR(4),
	V_AREA CHAR(20),
	V_CONFIRM CHAR(1)
);

CREATE TABLE tbl_member_202005(
	M_NO CHAR(1) PRIMARY KEY,
	M_NAME VARCHAR2(20),
	P_CODE CHAR(2),
	P_SCHOOL CHAR(1),
	M_JUMIN CHAR(13),
	M_CITY VARCHAR2(20)
);

CREATE TABLE tbl_party_202005(
	P_CODE CHAR(2) PRIMARY KEY,
	P_NAME VARCHAR2(20),
	P_INDATE DATE,
	P_READER VARCHAR2(20),
	P_TEL1 VARCHAR2(3),
	P_TEL2 VARCHAR2(4),
	P_TEL3 VARCHAR2(4)
);

INSERT INTO tbl_vote_202005 VALUES('9901011000001', '김유권', '1' , '0930', '제1투표장', 'N');
INSERT INTO tbl_vote_202005 VALUES('8901012000002', '이유권', '2' , '0930', '제1투표장', 'N');
INSERT INTO tbl_vote_202005 VALUES('6901011000003', '박유권', '3' , '0930', '제1투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('5901012000004', '홍유권', '4' , '0930', '제1투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('7901011000005', '조유권', '5' , '0930', '제1투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('8901012000006', '최유권', '1' , '0930', '제1투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('5901011000007', '지유권', '1' , '0930', '제1투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('4901012000008', '장유권', '3' , '0930', '제1투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('7901011000009', '정유권', '3' , '0930', '제1투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('8901012000010', '강유권', '4' , '0930', '제1투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('9901011000011', '신유권', '5' , '0930', '제1투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('7901012000012', '오유권', '1' , '1330', '제1투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('6901011000013', '현유권', '4' , '1330', '제2투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('8901011000014', '왕유권', '2' , '1330', '제2투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('9901011000015', '유유권', '3' , '1330', '제2투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('7901011000016', '한유권', '2' , '1330', '제2투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('8901011000017', '문유권', '4' , '1330', '제2투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('9901011000018', '양유권', '2' , '1330', '제2투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('9901011000019', '구유권', '4' , '1330', '제2투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('7901011000020', '황유권', '5' , '1330', '제2투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('6901011000021', '배유권', '3' , '1330', '제2투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('7901011000022', '전유권', '3' , '1330', '제2투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('9901011000023', '고유권', '1' , '1330', '제2투표장', 'Y');
INSERT INTO tbl_vote_202005 VALUES('5901011000024', '권유권', '3' , '1330', '제2투표장', 'Y');

INSERT INTO tbl_member_202005 VALUES('1', '김후보', 'P1', '1', '6603011999991', '수선화동');
INSERT INTO tbl_member_202005 VALUES('2', '이후보', 'P2', '3', '5503011999992', '민들래동');
INSERT INTO tbl_member_202005 VALUES('3', '박후보', 'P3', '2', '7703011999993', '나팔꽃동');
INSERT INTO tbl_member_202005 VALUES('4', '조후보', 'P4', '2', '8803011999994', '진달래동');
INSERT INTO tbl_member_202005 VALUES('5', '최후보', 'P5', '3', '9903011999995', '개나리동');

INSERT INTO tbl_party_202005 VALUES('P1', 'A정당', '2010-01-01', '위대표', '02', '1111', '0001');
INSERT INTO tbl_party_202005 VALUES('P2', 'B정당', '2010-02-01', '명대표', '02', '1111', '0002');
INSERT INTO tbl_party_202005 VALUES('P3', 'C정당', '2010-03-01', '기대표', '02', '1111', '0003');
INSERT INTO tbl_party_202005 VALUES('P4', 'D정당', '2010-04-01', '옥대표', '02', '1111', '0004');
INSERT INTO tbl_party_202005 VALUES('P5', 'E정당', '2010-05-01', '임대표', '02', '1111', '0005');


SELECT 
	m.M_NO AS "후보번호",
	m.M_NAME AS "이름",
	p.P_NAME AS "소속정당",
	DECODE(m.P_SCHOOL, '1', '고졸', '2', '학사', '3', '석사', '4', '박사') AS "최종학력",
	SUBSTR(m.M_JUMIN, 1, 6) || '-' || SUBSTR(m.M_JUMIN, 7,7) "주민번호",
	M_CITY "지역구",
	p.P_TEL1 || '-' || p.P_TEL2 || '-' || p.P_TEL3 AS "대표전화"
FROM tbl_member_202005 m 
	JOIN tbl_party_202005 p ON m.P_CODE = p.P_CODE
ORDER BY 1 ASC;

SELECT
	V_NAME AS "성명",
	TO_CHAR(
		TO_DATE(
			DECODE(SUBSTR(V_JUMIN, 7, 1),
				'1', '19' || SUBSTR(V_JUMIN, 1, 6),
				'2', '19' || SUBSTR(V_JUMIN, 1, 6),
				'3', '20' || SUBSTR(V_JUMIN, 1, 6),
				'4', '20' || SUBSTR(V_JUMIN, 1, 6)), 'YYYY-MM-DD'), 'YYYY"년"MM"월"DD"일생"') AS "생년월일",
	'만 ' ||
	TRUNC(
		MONTHS_BETWEEN(TRUNC(SYSDATE),
			TO_DATE(
				DECODE(SUBSTR(V_JUMIN, 7, 1),
					'1', '19' || SUBSTR(V_JUMIN, 1, 6),
					'2', '19' || SUBSTR(V_JUMIN, 1, 6),
					'3', '20' || SUBSTR(V_JUMIN, 1, 6),
					'4', '20' || SUBSTR(V_JUMIN, 1, 6)), 'YYYY-MM-DD')) / 12) || '세' AS "나이",
	DECODE(SUBSTR(V_JUMIN, 7, 1), '1', '남', '2', '여', '3', '남', '4', '여') AS "성별",
	M_NO AS "후보번호",
	TO_CHAR(TO_DATE(V_TIME, 'HH24:MI'),'HH24:MI')  AS "투표시간",
	DECODE(V_CONFIRM, 'Y', '확인', 'N', '미확인') AS "유권자확인"
FROM tbl_vote_202005;
	
SELECT
	m.M_NO AS "후보번호",
	m.M_NAME AS "성명",
	COUNT(
	CASE WHEN v.V_CONFIRM = 'Y'
	THEN v.M_NO
	END) AS "총투표건수"
FROM
	tbl_vote_202005 v
	JOIN tbl_member_202005 m ON v.M_NO = m.M_NO
GROUP BY m.M_NO, m.M_NAME
ORDER BY 3 DESC;
	
