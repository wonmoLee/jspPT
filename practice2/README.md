#### 반응형 웹 연습2

##오라클 18C 사용자 생성
```SQL

ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;  
CREATE USER practice IDENTIFIED BY bitc5600;

GRANT CREATE SESSION TO practice;
GRANT CREATE TABLESPACE TO practice;
GRANT CREATE TABLE TO practice;
GRANT CREATE SEQUENCE TO practice;
--GRANT SELECT, INSERT, DELETE, UPDATE ON practice.PLAYER TO practice;
ALTER USER practice DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;
```

##테이블 생성
```SQL

CREATE TABLE SCTEAMS (
    ID NUMBER PRIMARY KEY,
    TEAMNAME VARCHAR2(100) NOT NULL UNIQUE
);

CREATE TABLE SCPLAYERS(
	ID NUMBER PRIMARY KEY,
    NAME VARCHAR2(100) NOT NULL,
    BACK_NUM NUMBER NOT NULL,
    TEAM VARCHAR2(100) NOT NULL,
    POSITION VARCHAR2(100) NOT NULL,
    CONSTRAINT FK_TEAM
    FOREIGN KEY(TEAM)
    REFERENCES SCTEAMS(TEAMNAME)
    ON DELETE CASCADE
);

```

##시퀀스 생성
```SQL

CREATE SEQUENCE SCTEAMS_SEQ
START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE SCPLAYERS_SEQ
START WITH 1 INCREMENT BY 1;

```



##튜플 생성
```SQL

--SCTEMAS TABLE
INSERT INTO SCTEAMS(ID, TEAMNAME) VALUES(SCTEAMS_SEQ.NEXTVAL, '레알 마드리드');
INSERT INTO SCTEAMS(ID, TEAMNAME) VALUES(SCTEAMS_SEQ.NEXTVAL, '바르셀로나');
INSERT INTO SCTEAMS(ID, TEAMNAME) VALUES(SCTEAMS_SEQ.NEXTVAL, '파리 생제르망');
INSERT INTO SCTEAMS(ID, TEAMNAME) VALUES(SCTEAMS_SEQ.NEXTVAL, '맨체스터 유나이티드');


--SCPLAYERS TABLE
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '크리스티아누 호날두', 7, '레알 마드리드', 'LF');
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '가레스 베일', 11, '레알 마드리드', 'RF');
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '카렘 벤제마', 9, '레알 마드리드', 'ST');
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '이스코', 22, '레알 마드리드', 'RWM');
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '루카 모드리치', 10, '레알 마드리드', 'LWM');
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '마르셀로', 12, '레알 마드리드', 'LWB');
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '리오넬 메시', 10, '바르셀로나', 'ST');
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '루이스 수아레즈', 9, '바르셀로나', 'ST');
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '세르히오 부스케츠', 5, '바르셀로나', 'DM');
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '세르지 로베르토', 20, '바르셀로나', 'CB');
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '알트로 비달', 22, '바르셀로나', 'WM');
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '티아고 실바', 2, '파리 생제르망', 'RB');
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '네이마르', 10, '파리 생제르망', 'LF');
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '에딘손 카바니', 9,  '파리 생제르망', 'ST');
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '후안 마타', 8, '맨체스터 유나이티드', 'LWM');
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '안드레아스 페레이라', 15, '맨체스터 유나이티드', 'DM');
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '알렉시스 산체스', 7, '맨체스터 유나이티드', 'LF');
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '앙토니 마르시알', 9, '맨체스터 유나이티드', 'ST');
INSERT INTO SCPLAYERS(ID, NAME, BACK_NUM, TEAM, POSITION) VALUES(SCPLAYERS_SEQ.NEXTVAL, '마르쿠스 래시포드', 10, '맨체스터 유나이티드', 'RF');

```