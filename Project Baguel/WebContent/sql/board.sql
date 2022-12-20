CREATE TABLE board (
    boardNum INT NOT NULL PRIMARY KEY,--1
    eventFrom VARCHAR2(20) NOT NULL,--2
    eventTo VARCHAR2(20) NOT NULL,--3
    eventPlace VARCHAR2(60) NOT NULL,--4한글 띄어쓰기 없이 20자 가능, 영어 띄어쓰기 없이 60자/띄어쓰기는 1바이트
    eventType VARCHAR2(30) NOT NULL,--5
    event VARCHAR2(300) NOT NULL,--6 한글 띄어쓰기 없이 100자 가능
    writeDate VARCHAR2(20) NOT NULL,--7
    editDate VARCHAR2(20) NOT NULL,--8
    eventDesc VARCHAR2(1200),--9 한글 띄어쓰기 없이 400자 가능
    adminMSG VARCHAR2(1200),--10 한글 띄어쓰기 없이 400자 가능
    ID VARCHAR2(20) NOT NULL,--11
    viewcount INT,--12
    approval CHAR(1) CONSTRAINT board_approval_CK CHECK(approval IN ('0', '1')),--13(1: 처리완료 / 0: 처리전)
    status CHAR(1) CONSTRAINT board_status_CK CHECK(status IN ('0', '1')),--14(1: 정상 / 0: 삭제된 게시물)
    
    CONSTRAINT FK_ID FOREIGN KEY(ID)
    REFERENCES members(ID) -- 외래키 지정(MEMBERS에 ID가 없으면 INSERT 되지 않음)
);

CREATE SEQUENCE board_seq
START WITH 1
INCREMENT BY 1
ORDER; --요청 순서로 값을 생성

insert into board values(board_seq.nextval, '2022-12-08', '2023-05-07', '서울시립미술관 서소문본관', '전시회', '최민 컬렉션: 다르게 보기', TO_char(SYSDATE,'YYYY-MM-DD HH:MI'), TO_char(SYSDATE,'YYYY-MM-DD HH:MI'), '', '', 'user001', 0, 0, 1);
insert into board values(board_seq.nextval, '2022-12-03', '2022-12-18', '이화여자대학교 삼성홀', '공연(뮤지컬, 연극)', 'Heize 1st Concert Heize City in Seoul', TO_char(SYSDATE,'YYYY-MM-DD HH:MI'), TO_char(SYSDATE,'YYYY-MM-DD HH:MI'), '', '', 'user003', 0, 0, 1);
insert into board values(board_seq.nextval, '2022-12-15', '2023-03-12', '서울시립미술관 서소문본관', '전시회', '키키 스미스 ― 자유낙하', TO_char(SYSDATE,'YYYY-MM-DD HH:MI'), TO_char(SYSDATE,'YYYY-MM-DD HH:MI'), '', '', 'user002', 0, 0, 1);
insert into board values(board_seq.nextval, '2023-01-28', '2023-01-29', '올림픽공원 SK핸드볼경기장', '공연', '(G)I-DLE OFFICIAL FAN CLUB NEVERLAND 3RD FAN MEETING［행운의 편지］', TO_char(SYSDATE,'YYYY-MM-DD HH:MI'), TO_char(SYSDATE,'YYYY-MM-DD HH:MI'), '', '', 'user002', 0, 0, 1);
insert into board values(board_seq.nextval, '2022-11-06', '2023-04-09', '국립현대미술관 서울관', '전시회', '프로젝트 해시태그 2022', TO_char(SYSDATE,'YYYY-MM-DD HH:MI'), TO_char(SYSDATE,'YYYY-MM-DD HH:MI'), '', '', 'user002', 0, 0, 1);
insert into board values(board_seq.nextval, '2022-10-21', '2023-03-12', '국립현대미술관 서울관', '전시회', '임옥상: 여기, 일어서는 땅', TO_char(SYSDATE,'YYYY-MM-DD HH:MI'), TO_char(SYSDATE,'YYYY-MM-DD HH:MI'), '', '', 'user002', 0, 0, 1);
insert into board values(board_seq.nextval, '2022-11-15', '2023-01-15', '올림픽공원 내 우리금융아트홀', '공연(뮤지컬, 연극)', '뮤지컬 [드라큘라]', TO_char(SYSDATE,'YYYY-MM-DD HH:MI'), TO_char(SYSDATE,'YYYY-MM-DD HH:MI'), '', '', 'user002', 0, 0, 1);
insert into board values(board_seq.nextval, '2022-12-20', '2023-03-12', '예스24스테이지 1관', '공연(뮤지컬, 연극)', '뮤지컬 〈루드윅 : 베토벤 더 피아노〉', TO_char(SYSDATE,'YYYY-MM-DD HH:MI'), TO_char(SYSDATE,'YYYY-MM-DD HH:MI'), '', '', 'user002', 0, 0, 1);

select boardNum, LENGTHB(eventplace) BYTE
from board;

select rownum, eventplace, event, writedate, id FROM board where rownum > 0 AND rownum < 13 AND status not in '0' order by boardnum; 
-- 게시글 보여주기 (writedate는 substring 처리)

select count(event) COUNT
FROM BOARD
WHERE status = '1'; --삭제된 게시물들 제외하고 총 갯수 구하기

select  boardnum as,event, eventfrom
from board
where rownum > 0 AND status not in '0'
order by boardnum; --삭제된 게시물들 제외, boardnum으로 정렬하고, 1~10 select

-- 리스트 불러오기
SELECT rownum+0 as rownumber, writedate, eventplace, event, id, approval FROM (select rownum AS rn, board.* from board where status = '1' order by boardnum) WHERE rn BETWEEN 1 AND 10;

select rownum + 10 as rownumber, writedate, eventplace, event, id, approval
from (select rownum AS rn, board.* from board where status = '1' order by boardnum)
where rn BETWEEN 11 AND 20;

select rownum+20 as rownumber, writedate, eventplace, event, id, approval
from (select rownum AS rn, board.* from board where status = '1' order by boardnum)
where rn BETWEEN 21 AND 30;

drop table board;
drop sequence board_seq;