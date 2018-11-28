CREATE TABLE jwmember(
	id			VARCHAR(10)	 NOT NULL,
	passwd		VARCHAR(20)	 NOT NULL,
	mname		VARCHAR(20)	 NOT NULL,
	tel			VARCHAR(14)	 NULL,
	email		VARCHAR(50)	 NOT NULL UNIQUE,
	zipcode		VARCHAR(7)	 NULL,
	address1	VARCHAR(150) NULL,
	address2	VARCHAR(50)  NULL,
	mdate		DATE		 NOT NULL,
	fname		VARCHAR(50)  DEFAULT 'member.jpg',
	grade		CHAR(1)		 DEFAULT 'H',
	PRIMARY KEY(id)
)
delete from jwmember where id='Lotte';
delete from jwbbs
select * from jwmember
update JWMEMBER set grade = 'A' where ID='admin';

SELECT id, passwd, mname, tel, email, zipcode, address1, address2, mdate, fname, grade
FROM jwmember
WHERE id = 'person1';

select count(*) from member where id='admin' and passwd='1234';

INSERT INTO jwmember(id, passwd, mname, tel, email, zipcode, address1, address2, mdate, fname, grade)
VALUES('person2', '123', '123', '123', 'person2@mail.com', '123', '123', '123', sysdate, '', 'H');
INSERT INTO jwmember(id, passwd, mname, tel, email, zipcode, address1, address2, mdate, fname, grade) ");
VALUES('?', '?', '?', '?', '?', '?', '?', '?', sysdate, '?', 'H') ");