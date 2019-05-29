select currency_code, sum(amount) from money where player_id=1 group by currency_code;
