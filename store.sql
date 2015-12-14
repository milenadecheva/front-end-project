CREATE TABLE USERS(
USER_ID NUMBER NOT NULL,
USERNAME VARCHAR2(20) NOT NULL,
USER_PASSWORD VARCHAR2(20) NOT NULL,
USER_EMAIL VARCHAR2(40),
USER_ADDRESS VARCHAR2(200),
USER_PHONE NUMBER NOT NULL,
IS_SUPERVISOR VARCHAR2(1),
CONSTRAINT USER_PK PRIMARY KEY(USER_ID)
);

CREATE TABLE CATEGORIES(
CATEGORY_ID NUMBER NOT NULL,
CATEGORY_NAME VARCHAR2(50),
CONSTRAINT CATEGORIES_PK PRIMARY KEY(CATEGORY_ID)
);

CREATE TABLE PRODUCT(
PRODUCT_ID NUMBER NOT NULL,
PRODUCT_NAME VARCHAR2(100) NOT NULL,
PRODUCT_IMG VARCHAR2(100) NOT NULL,
PRODUCT_PRICE FLOAT NOT NULL,
PRODUCT_DESCRIPTION VARCHAR2(500),
CATEGORY_ID NUMBER,
CONSTRAINT PRODUCT_PK PRIMARY KEY(PRODUCT_ID),
CONSTRAINT category_fk FOREIGN KEY(CATEGORY_ID) 
            REFERENCES CATEGORIES (CATEGORY_ID)
);

CREATE TABLE USER_BOUGHT(
USER_ID NUMBER NOT NULL,
PRODUCT_ID NUMBER NOT NULL,
BUY_DATE TIMESTAMP,
CONSTRAINT USER_BOUGHT_PK PRIMARY KEY(USER_ID,PRODUCT_ID,BUY_DATE)
);

CREATE TABLE USER_LIKED_PRODUCT(
USER_ID NUMBER NOT NULL,
CATEGORY_ID NUMBER NOT NULL,
CONSTRAINT USER_LIKED_CATEGORIES_PK PRIMARY KEY(USER_ID,CATEGORY_ID)
);

CREATE TABLE PRODUCT_IN_CART(
USER_ID NUMBER NOT NULL,
PRODUCT_ID NUMBER NOT NULL,
CONSTRAINT PRODUCT_IN_CART_PK PRIMARY KEY(USER_ID,PRODUCT_ID)
);

CREATE SEQUENCE USERS_SEQUENCE;
CREATE SEQUENCE PRODUCTS_SEQUENCE;
CREATE SEQUENCE CATEGORIES_SEQUENCE;

CREATE TRIGGER before_insert_user
BEFORE INSERT ON USERS FOR EACH ROW
BEGIN
  SELECT USERS_SEQUENCE.NEXTVAL
  INTO :new.USER_ID
  FROM dual;
END;
/
CREATE TRIGGER before_insert_product
BEFORE INSERT ON PRODUCT FOR EACH ROW
BEGIN
  SELECT PRODUCTS_SEQUENCE.NEXTVAL
  INTO :new.PRODUCT_ID
  FROM dual;
END;
/
CREATE TRIGGER before_insert_categories
BEFORE INSERT ON CATEGORIES FOR EACH ROW
BEGIN
  SELECT CATEGORIES_SEQUENCE.NEXTVAL
  INTO :new.CATEGORY_ID
  FROM dual;
END;
/

INSERT INTO USERS(USERNAME,USER_PASSWORD,USER_PHONE,IS_SUPERVISOR)
VALUES('ADMIN','ADMIN',0896697323,'T');
