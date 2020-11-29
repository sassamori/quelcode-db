BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE tasks
SET is_done = 1,update_user_id = 1,updated_at = NOW()
WHERE created_at >= '2020/04/26 09:00:00' AND created_at <= '2020/04/26 11:30:00' AND is_deleted = 0;
COMMIT;