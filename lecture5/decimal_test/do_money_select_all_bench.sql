select currency_code, SUM(amount)  from money GROUP BY currency_code;
