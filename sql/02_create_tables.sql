USE bookmyshow_db;

CREATE TABLE theatre (
    theatre_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    theatre_name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    pincode VARCHAR(10) NOT NULL
);

CREATE TABLE screen (
    screen_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    theatre_id BIGINT NOT NULL,
    screen_name VARCHAR(50) NOT NULL,

    CONSTRAINT fk_screen_theatre
        FOREIGN KEY (theatre_id)
        REFERENCES theatre(theatre_id),

    CONSTRAINT uq_screen_name
        UNIQUE (theatre_id, screen_name)
);

CREATE TABLE seat (
    seat_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    screen_id BIGINT NOT NULL,
    seat_row VARCHAR(10) NOT NULL,
    seat_number INT NOT NULL,
    seat_type VARCHAR(30) NOT NULL,

    CONSTRAINT fk_seat_screen
        FOREIGN KEY (screen_id)
        REFERENCES screen(screen_id),

    CONSTRAINT uq_seat_position
        UNIQUE (screen_id, seat_row, seat_number),

    CONSTRAINT chk_seat_number
        CHECK (seat_number > 0)
);

CREATE TABLE movie (
    movie_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    movie_name VARCHAR(200) NOT NULL,
    duration_minutes INT NOT NULL,
    language VARCHAR(50) NOT NULL,
    certificate VARCHAR(10) NOT NULL,
    release_date DATE NOT NULL,

    CONSTRAINT chk_movie_duration
        CHECK (duration_minutes > 0)
);

CREATE TABLE `show` (
    show_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    screen_id BIGINT NOT NULL,
    movie_id BIGINT NOT NULL,
    show_start DATETIME NOT NULL,
    show_end DATETIME NOT NULL,

    CONSTRAINT fk_show_screen
        FOREIGN KEY (screen_id)
        REFERENCES screen(screen_id),

    CONSTRAINT fk_show_movie
        FOREIGN KEY (movie_id)
        REFERENCES movie(movie_id),

    CONSTRAINT chk_show_time
        CHECK (show_end > show_start),

    CONSTRAINT uq_screen_show_start
        UNIQUE (screen_id, show_start)
);