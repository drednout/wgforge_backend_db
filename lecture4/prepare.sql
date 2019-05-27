BEGIN
insert into player (nickname, email, password) values ('vasya', 'vasya@tut.by', '123') RETURNING id AS player1_id \gset
INSERT  into money (player_id, currency_code, amount) values (:player1_id, 'silver', 1000);
INSERT  into money (player_id, currency_code, amount) values (:player1_id, 'gold', 100);

-- UPDATE money SET amount=10000000000000000000000000000000000000 WHERE player_id=:player_id AND currency_code='gold':
-- ROLLBACK

COMMIT
