CREATE TABLE IF NOT EXISTS money_decimal
(
    id BIGSERIAL NOT NULL,
    player_id BIGINT NOT NULL,
    currency_code TEXT NOT NULL,
    amount DECIMAL(20, 2) NOT NULL,
    created timestamp without time zone DEFAULT timezone('UTC'::text, now()),
    updated timestamp without time zone DEFAULT timezone('UTC'::text, now()),

    CONSTRAINT money_decimal_id_pkey PRIMARY KEY (id),
    CONSTRAINT money_decimal_unique_key UNIQUE (player_id, currency_code)
);
