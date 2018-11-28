CREATE TABLE jwbbs(
	bbsno	NUMBER(7)		NOT NULL, 	-- 게시글 번호
	id		VARCHAR(20) 	NOT NULL, 	-- 사용자 ID
	fname	VARCHAR(30)		NULL,		-- 등록된 사진 이름
	title	VARCHAR(100)	NOT NULL,	-- 글 제목
	content	VARCHAR(4000)	NOT NULL,	-- 글 내용
	passwd	VARCHAR(15)		NOT NULL,	-- 글 비밀번호
	viewcnt	NUMBER(5)		DEFAULT 0,	-- 조회 수
	wdate	DATE			NOT NULL,	-- 등록 일자
	grpno	NUMBER(7)		DEFAULT 0,	-- 
	indent	NUMBER(2)		DEFAULT 0,	--
	ansnum	NUMBER(5)		DEFAULT 0,	--
	recom	NUMBER(5)		DEFAULT 0,	-- 추천 수 였지만 ...
	div		VARCHAR(20)		NOT NULL,	-- 글 분류 (판매 / 구매 / 공지사항 등등) 
	fin		NUMBER(5)		DEFAULT 0,	-- 거래 완료 확인
	hide 	NUMBER(5)		DEFAULT 0,	-- 거래 완료 확인
	filesize NUMBER	default 0,			--
	PRIMARY KEY(bbsno),
	FOREIGN KEY(id) REFERENCES jwmember(id)
);
INSERT INTO JWBBS
VALUES()

delete from JWBBS

alter table jwbbs
add fin	VARCHAR(2) null

alter table jwbbs
add hide VARCHAR(2) null

alter table jwbbs
drop column fin

alter table jwBBS
add(filename varchar(30), filesize number default 0)
alter table jwbbs add (refnum number default 0);

Alter table jwBBS
drop column filename
drop table jwbbs

INSERT INTO jwbbs(bbsno, wname, title, content, passwd, wdate, grpno)
VALUES((SELECT NVL(MAX(bbsno),0)+1 as max FROM bbs), (select id from jwmember where id='user1'), '제목', '내용', '123', sysdate, (SELECT NVL(MAX(grpno),0)+1 as max FROM bbs));

select * from jwbbs


select * from jwbbs where div='A01';

SELECT bbsno, title, id, wdate, viewcnt, fin, indent, r 	
from( SELECT bbsno, title, id, wdate, viewcnt, fin, indent, rownum as r 
from ( 
SELECT bbsno, title, id, to_char(wdate,'yyyy-mm-dd') as wdate, viewcnt, fin, indent 
FROM jwbbs where DIV='A01' 
ORDER BY grpno DESC, ansnum ) 
) where r>=1 and r<=10

select * from reply
