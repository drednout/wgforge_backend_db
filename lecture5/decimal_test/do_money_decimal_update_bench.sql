UPDATE money_decimal SET amount=amount + '1.00' where player_id=(SELECT id FROM player TABLESAMPLE SYSTEM (5) LIMIT 1);
