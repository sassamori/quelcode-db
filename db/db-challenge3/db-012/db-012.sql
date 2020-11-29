BEGIN;
UPDATE rooms
SET is_enabled_to_upload = 0,update_user_id = 1,updated_at = NOW()
WHERE rooms.id NOT IN (SELECT DISTINCT room_id FROM participations WHERE user_id = 1) AND rooms.is_deleted = 0;
COMMIT;