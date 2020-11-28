SELECT user_id,room_id,CAST(joined_at AS DATE)
FROM participations
LEFT JOIN users
ON participations.user_id = users.id
LEFT JOIN rooms
ON participations.room_id = rooms.id
WHERE users.is_deleted = 0 AND rooms.is_deleted = 0
ORDER BY joined_at ASC;