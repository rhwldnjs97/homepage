CREATE TABLE jwcomment(
	num	 		NUMBER NOT NULL,	-- 댓글 글 번호
	bno 		NUMBER NOT NULL,	-- 게시글 글 번호
	ID			VARCHAR(15),		-- 댓글 작성자
	cdate			DATE,			-- 댓글 작성일
	parent			NUMBER,			-- 부모글
	content			VARCHAR(1000)	NOT NULL,	-- 댓글 내용
	CONSTRAINT PK_comment PRIMARY KEY(num),
	CONSTRAINT FK_comment FOREIGN KEY(bno) REFERENCES jwbbs(bbsno)
);

create sequence COMMENT_SEQ;