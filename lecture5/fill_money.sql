insert into money(player_id, currency_code, amount)  SELECT player_id, 'gold', 100 FROM (SELECT  generate_series(1,10000000) as player_id) gen;
insert into money(player_id, currency_code, amount)  SELECT player_id, 'silver', 1000 FROM (SELECT  generate_series(1,10000000) as player_id) gen;
