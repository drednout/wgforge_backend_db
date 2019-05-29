CREATE TABLE IF NOT EXISTS player
(
    id BIGSERIAL NOT NULL,
    nickname TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    created timestamp without time zone DEFAULT timezone('UTC'::text, now()),
    updated timestamp without time zone DEFAULT timezone('UTC'::text, now()),

    CONSTRAINT player_id_pkey PRIMARY KEY (id),
    CONSTRAINT player_nickname_key UNIQUE (nickname)
);

CREATE TABLE IF NOT EXISTS money
(
    id BIGSERIAL NOT NULL,
    player_id BIGINT NOT NULL,
    currency_code TEXT NOT NULL,
    amount BIGINT NOT NULL,
    created timestamp without time zone DEFAULT timezone('UTC'::text, now()),
    updated timestamp without time zone DEFAULT timezone('UTC'::text, now()),
    
    CONSTRAINT money_id_pkey PRIMARY KEY (id),
    CONSTRAINT money_unique_key UNIQUE (player_id, currency_code)
);
