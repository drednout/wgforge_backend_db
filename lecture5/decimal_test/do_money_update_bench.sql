UPDATE money SET amount=amount + 1 where player_id=(SELECT id FROM player TABLESAMPLE SYSTEM (5) LIMIT 1);
