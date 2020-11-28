SELECT id,name,summary,
    CASE is_enabled_to_upload   WHEN 0 THEN '禁止'
                                WHEN 1 THEN '許可'
    END,
    is_direct_chat,is_deleted,create_user_id,created_at,update_user_id,updated_at
FROM rooms
WHERE is_deleted = 0 AND RIGHT(summary,9) = 'ダイレクトチャット'
ORDER BY id ASC;