CREATE TABLE users(
    id                  INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    mail                VARCHAR(100) NOT NULL UNIQUE,
    password            VARCHAR(100) NOT NULL, 
    user_name           VARCHAR(100) NOT NULL UNIQUE,
    introduction        VARCHAR(1000),
    work_phone_number   VARCHAR(13) NOT NULL,
    cell_phone_number   VARCHAR(13) NOT NULL,
    is_deleted          TINYINT(1) DEFAULT 0 NOT NULL,
    created_at          DATETIME NOT NULL,
    updated_at          DATETIME NOT NULL
);

CREATE TABLE participations(
    user_id     INTEGER(11) REFERENCES users(id),
    room_id     INTEGER(11) REFERENCES rooms(id),
    joined_at   DATETIME NOT NULL,
    PRIMARY KEY(user_id,room_id)
);

CREATE TABLE rooms(
    id                                  INTEGER(11) PRIMARY KEY REFERENCES participations(rooms_id) AUTO_INCREMENT,
    room_name                           VARCHAR(100) NOT NULL UNIQUE,
    summary                             VARCHAR(1000),
    is_enabled_to_upload                TINYINT(1) DEFAULT 0 NOT NULL,
    is_direct_chat                      TINYINT(1) DEFAULT 0 NOT NULL,
    is_deleted                          TINYINT(1) DEFAULT 0 NOT NULL,
    created_at                          DATETIME NOT NULL,
    create_user_id                      INTEGER(11) NOT NULL,
    updated_at                          DATETIME NOT NULL,
    update_user_id                      INTEGER(11) NOT NULL
);

CREATE TABLE tasks(
    id              INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    room_id         INTEGER(11) REFERENCES rooms(id),
    content         VARCHAR(1000) NOT NULL,
    staff_id        INTEGER(11) NOT NULL,
    deadline        DATETIME,
    is_done         TINYINT(1) DEFAULT 0 NOT NULL,
    is_deleted      TINYINT(1) DEFAULT 0 NOT NULL,
    created_at      DATETIME NOT NULL,
    create_user_id  INTEGER(11) NOT NULL,
    updated_at      DATETIME NOT NULL,
    update_user_id  INTEGER(11) NOT NULL
);

CREATE TABLE posts(
    id              INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
    room_id         INTEGER(11) REFERENCES rooms(id),
    content         VARCHAR(1000) NOT NULL,
    file_name       VARCHAR(100),
    is_deleted      TINYINT(1) NOT NULL,
    posted_at       DATETIME NOT NULL,
    post_user_id    INTEGER(11) NOT NULL,
    updated_at      DATETIME NOT NULL,
    update_user_id  INTEGER(11) NOT NULL
);