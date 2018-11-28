drop table reply;
drop table jwreply;
create table reply(
	rnum 		number 			not null,
	content 	varchar(500)	 not null,
	regdate 	date not		 null,
	id 			varchar(10)	 not null,
	bbsno 		number(7) 	not null,
	primary key(rnum),
	foreign key(bbsno)  references bbs(bbsno)
);
create table jwreply(
	rnum 		number 			not null,
	content 	varchar(500)	 not null,
	regdate 	date not		 null,
	id 			varchar(10)	 not null,
	bbsno 		number(7) 	not null,
	primary key(rnum),
	foreign key(bbsno)  references jwbbs(bbsno)
);
drop table reply
--create(댓글등록)
select * from MEMBER;
select * from bbs;
select * from jwreply;
select * from reply;
 
select nvl(max(rnum),0)+1 from reply;
 
insert into jwreply(rnum, content, regdate, id, bbsno)
values((select nvl(max(rnum),0)+1 from jwreply),
'의견입니다.',sysdate,'user2',3
);
 
 
--read(댓글 내용)
select * from reply;
 
--update(댓글 수정)
update reply
set content = '새로운 의견을 올립니다.'
where rnum = 1;
 
--delete(댓글 삭제)
delete from REPLY
where rnum = 1;
 
--deleteAll(댓글이 달린 글 삭제시 그 글에 달려있는 댓글 전체 삭제)
delete from reply
where bbsno = #{bbsno}

--list(목록)
select rnum, content, to_char(regdate,'yyyy-mm-dd') regdate, id, bbsno, r
FROM(
	select rnum, content, regdate, id, bbsno, rownum r
	FROM(
		select rnum, content, regdate, id, bbsno
		from REPLY
		order by rnum DESC
   	)
)WHERE r >= 1 and r <= 5;

 
--total(목록)
select count(*) from reply;



   create table breply(
rnum number not null,
content varchar(500) not null,
regdate date not null,
id varchar(10) not null,
num number(7) not null,
primary key(rnum),
foreign key(num)  references board(num)
 
);