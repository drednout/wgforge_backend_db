ALTER TABLE money ADD CONSTRAINT money_positive_amount CHECK (amount > 0);

BEGIN;
SELECT id as player1_id from player where nickname='vasya' \gset
UPDATE MONEY set amount=0 where player_id=:player1_id and currency_code='silver';
UPDATE MONEY set amount=-1 where player_id=:player1_id and currency_code='gold';
ROLLBACK;
-- or COMMIT;
