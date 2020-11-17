CREATE TABLE users(
    id                  INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    mail                VARCHAR(100) NOT NULL UNIQUE,
    password            VARCHAR(100) NOT NULL, 
    name                VARCHAR(100) NOT NULL UNIQUE,
    introduction        VARCHAR(1000),
    work_phone_number   VARCHAR(13) NOT NULL,
    cell_phone_number   VARCHAR(13) NOT NULL,
    is_deleted          TINYINT(1) DEFAULT 0 NOT NULL,
    created_at          DATETIME NOT NULL,
    updated_at          DATETIME NOT NULL
);

CREATE TABLE rooms(
    id                      INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    name                    VARCHAR(100) NOT NULL UNIQUE,
    summary                 VARCHAR(1000),
    is_enabled_to_upload    TINYINT(1) DEFAULT 1 NOT NULL,
    is_direct_chat          TINYINT(1) DEFAULT 0 NOT NULL,
    is_deleted              TINYINT(1) DEFAULT 0 NOT NULL,
    created_at              DATETIME NOT NULL,
    create_user_id          INTEGER(11) NOT NULL,
    updated_at              DATETIME NOT NULL,
    update_user_id          INTEGER(11) NOT NULL
);

CREATE TABLE participations(
    user_id     INTEGER(11),
    room_id     INTEGER(11),
    joined_at   DATETIME NOT NULL,
    PRIMARY KEY(user_id,room_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (room_id) REFERENCES rooms(id)
);

CREATE TABLE tasks(
    id              INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    room_id         INTEGER(11),
    content         VARCHAR(1000) NOT NULL,
    task_staff_id   INTEGER(11) NOT NULL,
    deadline        DATETIME,
    is_done         TINYINT(1) DEFAULT 0 NOT NULL,
    is_deleted      TINYINT(1) DEFAULT 0 NOT NULL,
    created_at      DATETIME NOT NULL,
    create_user_id  INTEGER(11) NOT NULL,
    updated_at      DATETIME NOT NULL,
    update_user_id  INTEGER(11) NOT NULL,
    FOREIGN KEY (room_id) REFERENCES rooms(id)
);

CREATE TABLE posts(
    id              INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    room_id         INTEGER(11),
    content         VARCHAR(1000) NOT NULL,
    file_name       VARCHAR(100),
    is_deleted      TINYINT(1) NOT NULL,
    posted_at       DATETIME NOT NULL,
    post_user_id    INTEGER(11) NOT NULL,
    updated_at      DATETIME NOT NULL,
    update_user_id  INTEGER(11) NOT NULL,
    FOREIGN KEY (room_id) REFERENCES rooms(id)
);