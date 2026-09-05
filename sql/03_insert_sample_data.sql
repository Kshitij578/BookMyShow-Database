USE bookmyshow_db;

INSERT INTO theatre
    (theatre_name, address, city, state, pincode)
VALUES
    ('PVR Phoenix Mall', 'Viman Nagar', 'Pune', 'Maharashtra', '411014'),
    ('INOX Amanora', 'Hadapsar', 'Pune', 'Maharashtra', '411028');

INSERT INTO screen
    (theatre_id, screen_name)
VALUES
    (1, 'Screen 1'),
    (1, 'Screen 2'),
    (1, 'Screen 3'),
    (2, 'Screen 1');

INSERT INTO seat
    (screen_id, seat_row, seat_number, seat_type)
VALUES
    (1, 'A', 1, 'REGULAR'),
    (1, 'A', 2, 'REGULAR'),
    (1, 'A', 3, 'REGULAR'),
    (1, 'B', 1, 'PREMIUM'),
    (1, 'B', 2, 'PREMIUM'),
    (2, 'A', 1, 'REGULAR'),
    (2, 'A', 2, 'REGULAR'),
    (2, 'B', 1, 'RECLINER'),
    (2, 'B', 2, 'RECLINER');

INSERT INTO movie
    (movie_name, duration_minutes, language, certificate, release_date)
VALUES
    ('Avengers: Endgame', 181, 'English', 'U/A', '2019-04-26'),
    ('Interstellar', 169, 'English', 'U/A', '2014-11-07'),
    ('3 Idiots', 170, 'Hindi', 'U', '2009-12-25');

INSERT INTO `show`
    (screen_id, movie_id, show_start, show_end)
VALUES
    (1, 1, '2026-09-05 10:00:00', '2026-09-05 13:01:00'),
    (1, 1, '2026-09-05 14:00:00', '2026-09-05 17:01:00'),
    (2, 2, '2026-09-05 11:30:00', '2026-09-05 14:19:00'),
    (2, 2, '2026-09-05 18:30:00', '2026-09-05 21:19:00'),
    (3, 3, '2026-09-05 15:00:00', '2026-09-05 17:50:00'),
    (1, 3, '2026-09-06 12:00:00', '2026-09-06 14:50:00');