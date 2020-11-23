SELECT
    CASE room_id WHEN 1 THEN 'りんご'
                 WHEN 2 THEN 'ごりら'
                 WHEN 3 THEN 'らっぱ'
                 WHEN 4 THEN 'ぱんだ'
                 WHEN 5 THEN 'ごま'
                 WHEN 6 THEN 'まり'
                 WHEN 7 THEN 'りす'
                 WHEN 8 THEN 'かめ'
    END
    ,COUNT(*) AS 投稿数
FROM posts
GROUP BY room_id
ORDER BY 投稿数 DESC;