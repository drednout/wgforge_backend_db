--DROP TABLE IF EXISTS player;
CREATE TABLE IF NOT EXISTS player
(
    id BIGINT NOT NULL,
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
    id BIGINT NOT NULL,
    player_id BIGINT NOT NULL,
    currency_code TEXT NOT NULL,
    amount BIGINT NOT NULL,
    created timestamp without time zone DEFAULT timezone('UTC'::text, now()),
    updated timestamp without time zone DEFAULT timezone('UTC'::text, now()),

    CONSTRAINT money_id_pkey PRIMARY KEY (id),
    CONSTRAINT money_unique_key UNIQUE (player_id, currency_code)
);



CREATE TABLE IF NOT EXISTS achievement
(
    id BIGINT NOT NULL,
    player_id BIGINT NOT NULL,
    achievement_code TEXT NOT NULL,
    amount BIGINT NOT NULL,
    created timestamp without time zone DEFAULT timezone('UTC'::text, now()),
    updated timestamp without time zone DEFAULT timezone('UTC'::text, now()),

    CONSTRAINT achievement_id_pkey PRIMARY KEY (id),
    CONSTRAINT achievement_unique_key UNIQUE (player_id, achievement_code)
);



CREATE TABLE IF NOT EXISTS auth_token
(
    id BIGINT NOT NULL,
    player_id BIGINT NOT NULL,
    token TEXT NOT NULL,
    expired_at timestamp without time zone,
    created timestamp without time zone DEFAULT timezone('UTC'::text, now()),
    updated timestamp without time zone DEFAULT timezone('UTC'::text, now()),

    CONSTRAINT auth_token_id_pkey PRIMARY KEY (id),
    CONSTRAINT auth_token_unique_key UNIQUE (player_id, token)
);


CREATE TYPE log_action_type AS ENUM('loging', 'registration', 'battle', 'achievement', 'battle_win', 'money_earn');
CREATE TABLE IF NOT EXISTS log_action
(
    id BIGINT NOT NULL,
    player_id BIGINT NOT NULL,
    action_type log_action_type,
    action_data JSONB,
    created timestamp without time zone DEFAULT timezone('UTC'::text, now()),

    CONSTRAINT log_action_id_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS rating_by_money_earn
(
    id BIGINT NOT NULL,
    player_id BIGINT NOT NULL,
    currency_code TEXT NOT NULL,
    amount BIGINT NOT NULL,
    created timestamp without time zone DEFAULT timezone('UTC'::text, now()),
    updated timestamp without time zone DEFAULT timezone('UTC'::text, now()),

    CONSTRAINT rating_by_money_id_pkey PRIMARY KEY (id),
    CONSTRAINT rating_by_money_unique_key UNIQUE (player_id, currency_code)
);

