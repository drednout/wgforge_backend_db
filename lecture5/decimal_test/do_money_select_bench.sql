select currency_code, amount  from money where player_id=(SELECT id FROM player TABLESAMPLE SYSTEM (5) LIMIT 1);
