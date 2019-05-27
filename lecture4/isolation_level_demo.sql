# 
localhost wgforge@wgforge=> SHOW transaction_isolation;        
┌───────────────────────┐
│ transaction_isolation │
├───────────────────────┤
│ read committed        │
└───────────────────────┘



# read commited
# first shell
localhost wgforge@wgforge=> BEGIN;
BEGIN
Time: 0.252 ms
localhost wgforge@wgforge=> SELECT * from money;
┌────┬───────────┬───────────────┬────────┬───────────────────────────┬───────────────────────────┐
│ id │ player_id │ currency_code │ amount │          created          │          updated          │
├────┼───────────┼───────────────┼────────┼───────────────────────────┼───────────────────────────┤
│ 38 │        53 │ silver        │   1100 │ 2019-05-27 03:55:19.09664 │ 2019-05-27 03:55:19.09664 │
│ 39 │        53 │ gold          │  91000 │ 2019-05-27 03:55:19.09664 │ 2019-05-27 03:55:19.09664 │
└────┴───────────┴───────────────┴────────┴───────────────────────────┴───────────────────────────┘
(2 rows)


# second shell
localhost wgforge@wgforge=> SELECT id as player1_id from player where nickname='vasya' \gset
localhost wgforge@wgforge=> BEGIN;
BEGIN
Time: 0.133 ms
UPDATE money SET amount=amount + 1000 where player_id=:player1_id and currency_code='gold';



Time: 0.350 ms
localhost wgforge@wgforge=> SELECT * from money;
┌────┬───────────┬───────────────┬────────┬───────────────────────────┬───────────────────────────┐
│ id │ player_id │ currency_code │ amount │          created          │          updated          │
├────┼───────────┼───────────────┼────────┼───────────────────────────┼───────────────────────────┤
│ 38 │        53 │ silver        │   1100 │ 2019-05-27 03:55:19.09664 │ 2019-05-27 03:55:19.09664 │
│ 39 │        53 │ gold          │  92000 │ 2019-05-27 03:55:19.09664 │ 2019-05-27 03:55:19.09664 │
└────┴───────────┴───────────────┴────────┴───────────────────────────┴───────────────────────────┘



# first shell
localhost wgforge@wgforge=> SELECT * from money;
┌────┬───────────┬───────────────┬────────┬───────────────────────────┬───────────────────────────┐
│ id │ player_id │ currency_code │ amount │          created          │          updated          │
├────┼───────────┼───────────────┼────────┼───────────────────────────┼───────────────────────────┤
│ 38 │        53 │ silver        │   1100 │ 2019-05-27 03:55:19.09664 │ 2019-05-27 03:55:19.09664 │
│ 39 │        53 │ gold          │  91000 │ 2019-05-27 03:55:19.09664 │ 2019-05-27 03:55:19.09664 │
└────┴───────────┴───────────────┴────────┴───────────────────────────┴───────────────────────────┘
(2 rows)

# second shell
localhost wgforge@wgforge=> COMMIT;
COMMIT
Time: 0.252 ms


# first shell
localhost wgforge@wgforge=> SELECT * from money;
┌────┬───────────┬───────────────┬────────┬───────────────────────────┬───────────────────────────┐
│ id │ player_id │ currency_code │ amount │          created          │          updated          │
├────┼───────────┼───────────────┼────────┼───────────────────────────┼───────────────────────────┤
│ 38 │        53 │ silver        │   1100 │ 2019-05-27 03:55:19.09664 │ 2019-05-27 03:55:19.09664 │
│ 39 │        53 │ gold          │  92000 │ 2019-05-27 03:55:19.09664 │ 2019-05-27 03:55:19.09664 │
└────┴───────────┴───────────────┴────────┴───────────────────────────┴───────────────────────────┘
(2 rows)

# first shell
localhost wgforge@wgforge=> BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
BEGIN
Time: 0.463 ms
localhost wgforge@wgforge=> SHOW transaction_isolation;
┌───────────────────────┐
│ transaction_isolation │
├───────────────────────┤
│ repeatable read       │
└───────────────────────┘
(1 row)

