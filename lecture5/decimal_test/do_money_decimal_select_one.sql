select currency_code, sum(amount) from money_decimal where player_id=1 group by currency_code;
