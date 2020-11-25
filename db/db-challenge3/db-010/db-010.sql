SELECT posts1.post_user_id,users.name AS ユーザー名,posts1.posted_at,posts1.room_id,rooms.name AS ルーム名
FROM posts AS posts1
LEFT JOIN users
ON posts1.post_user_id = users.id
LEFT JOIN rooms
ON posts1.room_id = rooms.id
WHERE users.is_deleted = 0 AND posts1.is_deleted = 0 AND posts1.post_user_id = (
    SELECT posts2.post_user_id
    FROM posts AS posts2 
    WHERE posts1.room_id = posts2.room_id AND posts2.is_deleted = 0
    ORDER BY posts2.posted_at DESC
    LIMIT 1
)
ORDER BY posts1.room_id ASC;