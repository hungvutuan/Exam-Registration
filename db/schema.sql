USE examreg;

DROP TABLE IF EXISTS ENROLL;
DROP TABLE IF EXISTS TEACH;
DROP TABLE IF EXISTS SIGN;
DROP TABLE IF EXISTS EXAM_REG;
DROP TABLE IF EXISTS EXAM;
DROP TABLE IF EXISTS SESSION;
DROP TABLE IF EXISTS MODULE;
DROP TABLE IF EXISTS SEMESTER;
DROP TABLE IF EXISTS STUDENT;
DROP TABLE IF EXISTS LECTURER;
DROP TABLE IF EXISTS ASSISTANT;
DROP TABLE IF EXISTS ACCOUNT;

CREATE TABLE ACCOUNT
(
    id       INT AUTO_INCREMENT,
    username VARCHAR(25)  NOT NULL UNIQUE,
    password VARCHAR(128) NOT NULL,
    fname    VARCHAR(50)  NOT NULL,
    lname    VARCHAR(50)  NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ASSISTANT
(
    account INT,
    FOREIGN KEY (account) REFERENCES ACCOUNT (id) ON DELETE RESTRICT,
    PRIMARY KEY (account)
);

CREATE TABLE LECTURER
(
    account INT,
    FOREIGN KEY (account) REFERENCES ACCOUNT (id) ON DELETE RESTRICT,
    PRIMARY KEY (account)
);

CREATE TABLE STUDENT
(
    code    CHAR(8) UNIQUE,
    account INT,
    FOREIGN KEY (account) REFERENCES ACCOUNT (id) ON DELETE RESTRICT,
    PRIMARY KEY (account)
);

CREATE TABLE SEMESTER
(
    id    INT AUTO_INCREMENT,
    start DATE NOT NULL,
    end   DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE MODULE
(
    id       INT AUTO_INCREMENT,
    name     VARCHAR(50) NOT NULL, #TODO move to another table?
    code     VARCHAR(8)  NOT NULL,
    semester INT         NOT NULL,
    FOREIGN KEY (semester) REFERENCES SEMESTER (id) ON DELETE RESTRICT,
    PRIMARY KEY (id)
);

CREATE TABLE SESSION
(
    id     INT AUTO_INCREMENT,
    module INT  NOT NULL,
    date   DATE NOT NULL,
    start  TIME NOT NULL,
    end    TIME NOT NULL,
    FOREIGN KEY (module) REFERENCES MODULE (id) ON DELETE CASCADE,
    PRIMARY KEY (id),
    UNIQUE (module, date, start)
);

CREATE TABLE EXAM
(
    id       INT AUTO_INCREMENT,
    module   INT  NOT NULL,
    date     DATE NOT NULL,
    deadline DATE NOT NULL,
    start    TIME NOT NULL,
    end      TIME NOT NULL,
    FOREIGN KEY (module) REFERENCES MODULE (id) ON DELETE CASCADE,
    PRIMARY KEY (id),
    UNIQUE (module, date)
);

CREATE TABLE EXAM_REG
(
    student INT,
    exam    INT,
    date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student) REFERENCES STUDENT (account) ON DELETE CASCADE,
    FOREIGN KEY (exam) REFERENCES EXAM (id) ON DELETE CASCADE,
    PRIMARY KEY (student, exam)
);

CREATE TABLE SIGN
(
    student INT,
    session INT,
    date    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student) REFERENCES STUDENT (account) ON DELETE CASCADE,
    FOREIGN KEY (session) REFERENCES SESSION (id) ON DELETE CASCADE,
    PRIMARY KEY (student, session)
);

CREATE TABLE TEACH
(
    module   INT,
    lecturer INT,
    FOREIGN KEY (module) REFERENCES MODULE (id) ON DELETE CASCADE,
    FOREIGN KEY (lecturer) REFERENCES LECTURER (account) ON DELETE CASCADE,
    PRIMARY KEY (module, lecturer)
);

CREATE TABLE ENROLL
(
    student INT,
    module  INT,
    FOREIGN KEY (student) REFERENCES STUDENT (account) ON DELETE CASCADE,
    FOREIGN KEY (module) REFERENCES MODULE (id) ON DELETE CASCADE,
    PRIMARY KEY (student, module)
);
