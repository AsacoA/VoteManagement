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

INSERT INTO tbl_vote_202005 VALUES('9901011000001', '������', '1' , '0930', '��1��ǥ��', 'N');
INSERT INTO tbl_vote_202005 VALUES('8901012000002', '������', '2' , '0930', '��1��ǥ��', 'N');
INSERT INTO tbl_vote_202005 VALUES('6901011000003', '������', '3' , '0930', '��1��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('5901012000004', 'ȫ����', '4' , '0930', '��1��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('7901011000005', '������', '5' , '0930', '��1��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('8901012000006', '������', '1' , '0930', '��1��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('5901011000007', '������', '1' , '0930', '��1��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('4901012000008', '������', '3' , '0930', '��1��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('7901011000009', '������', '3' , '0930', '��1��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('8901012000010', '������', '4' , '0930', '��1��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('9901011000011', '������', '5' , '0930', '��1��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('7901012000012', '������', '1' , '1330', '��1��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('6901011000013', '������', '4' , '1330', '��2��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('8901011000014', '������', '2' , '1330', '��2��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('9901011000015', '������', '3' , '1330', '��2��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('7901011000016', '������', '2' , '1330', '��2��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('8901011000017', '������', '4' , '1330', '��2��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('9901011000018', '������', '2' , '1330', '��2��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('9901011000019', '������', '4' , '1330', '��2��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('7901011000020', 'Ȳ����', '5' , '1330', '��2��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('6901011000021', '������', '3' , '1330', '��2��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('7901011000022', '������', '3' , '1330', '��2��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('9901011000023', '������', '1' , '1330', '��2��ǥ��', 'Y');
INSERT INTO tbl_vote_202005 VALUES('5901011000024', '������', '3' , '1330', '��2��ǥ��', 'Y');

INSERT INTO tbl_member_202005 VALUES('1', '���ĺ�', 'P1', '1', '6603011999991', '����ȭ��');
INSERT INTO tbl_member_202005 VALUES('2', '���ĺ�', 'P2', '3', '5503011999992', '�ε鷡��');
INSERT INTO tbl_member_202005 VALUES('3', '���ĺ�', 'P3', '2', '7703011999993', '���Ȳɵ�');
INSERT INTO tbl_member_202005 VALUES('4', '���ĺ�', 'P4', '2', '8803011999994', '���޷���');
INSERT INTO tbl_member_202005 VALUES('5', '���ĺ�', 'P5', '3', '9903011999995', '��������');

INSERT INTO tbl_party_202005 VALUES('P1', 'A����', '2010-01-01', '����ǥ', '02', '1111', '0001');
INSERT INTO tbl_party_202005 VALUES('P2', 'B����', '2010-02-01', '���ǥ', '02', '1111', '0002');
INSERT INTO tbl_party_202005 VALUES('P3', 'C����', '2010-03-01', '���ǥ', '02', '1111', '0003');
INSERT INTO tbl_party_202005 VALUES('P4', 'D����', '2010-04-01', '����ǥ', '02', '1111', '0004');
INSERT INTO tbl_party_202005 VALUES('P5', 'E����', '2010-05-01', '�Ӵ�ǥ', '02', '1111', '0005');


SELECT 
	m.M_NO AS "�ĺ���ȣ",
	m.M_NAME AS "�̸�",
	p.P_NAME AS "�Ҽ�����",
	DECODE(m.P_SCHOOL, '1', '����', '2', '�л�', '3', '����', '4', '�ڻ�') AS "�����з�",
	SUBSTR(m.M_JUMIN, 1, 6) || '-' || SUBSTR(m.M_JUMIN, 7,7) "�ֹι�ȣ",
	M_CITY "������",
	p.P_TEL1 || '-' || p.P_TEL2 || '-' || p.P_TEL3 AS "��ǥ��ȭ"
FROM tbl_member_202005 m 
	JOIN tbl_party_202005 p ON m.P_CODE = p.P_CODE
ORDER BY 1 ASC;

SELECT
	V_NAME AS "����",
	TO_CHAR(
		TO_DATE(
			DECODE(SUBSTR(V_JUMIN, 7, 1),
				'1', '19' || SUBSTR(V_JUMIN, 1, 6),
				'2', '19' || SUBSTR(V_JUMIN, 1, 6),
				'3', '20' || SUBSTR(V_JUMIN, 1, 6),
				'4', '20' || SUBSTR(V_JUMIN, 1, 6)), 'YYYY-MM-DD'), 'YYYY"��"MM"��"DD"�ϻ�"') AS "�������",
	'�� ' ||
	TRUNC(
		MONTHS_BETWEEN(TRUNC(SYSDATE),
			TO_DATE(
				DECODE(SUBSTR(V_JUMIN, 7, 1),
					'1', '19' || SUBSTR(V_JUMIN, 1, 6),
					'2', '19' || SUBSTR(V_JUMIN, 1, 6),
					'3', '20' || SUBSTR(V_JUMIN, 1, 6),
					'4', '20' || SUBSTR(V_JUMIN, 1, 6)), 'YYYY-MM-DD')) / 12) || '��' AS "����",
	DECODE(SUBSTR(V_JUMIN, 7, 1), '1', '��', '2', '��', '3', '��', '4', '��') AS "����",
	M_NO AS "�ĺ���ȣ",
	TO_CHAR(TO_DATE(V_TIME, 'HH24:MI'),'HH24:MI')  AS "��ǥ�ð�",
	DECODE(V_CONFIRM, 'Y', 'Ȯ��', 'N', '��Ȯ��') AS "������Ȯ��"
FROM tbl_vote_202005;
	
SELECT
	m.M_NO AS "�ĺ���ȣ",
	m.M_NAME AS "����",
	COUNT(
	CASE WHEN v.V_CONFIRM = 'Y'
	THEN v.M_NO
	END) AS "����ǥ�Ǽ�"
FROM
	tbl_vote_202005 v
	JOIN tbl_member_202005 m ON v.M_NO = m.M_NO
GROUP BY m.M_NO, m.M_NAME
ORDER BY 3 DESC;
	
