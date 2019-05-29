select currency_code, amount  from money_decimal where player_id=(SELECT id FROM player TABLESAMPLE SYSTEM (5) LIMIT 1);
