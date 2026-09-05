USE bookmyshow_db;

-- ============================================
-- P2: LIST ALL SHOWS FOR A THEATRE ON A DATE
-- ============================================

SELECT
    t.theatre_name,
    m.movie_name,
    s.screen_name,
    sh.show_start,
    sh.show_end
FROM `show` sh
JOIN screen s
    ON sh.screen_id = s.screen_id
JOIN theatre t
    ON s.theatre_id = t.theatre_id
JOIN movie m
    ON sh.movie_id = m.movie_id
WHERE t.theatre_id = 1
  AND sh.show_start >= '2026-09-05 00:00:00'
  AND sh.show_start <  '2026-09-06 00:00:00'
ORDER BY sh.show_start;