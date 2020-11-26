SELECT posts.room_id,rooms.name AS チャットルーム名,COUNT(*) AS 投稿数
FROM posts
LEFT JOIN rooms
ON posts.room_id = rooms.id
LEFT JOIN users
ON posts.post_user_id = users.id
WHERE posts.is_deleted = 0 AND users.is_deleted = 0
GROUP BY posts.room_id
ORDER BY 投稿数 DESC;