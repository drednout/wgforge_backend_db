DROP TABLE IF EXISTS player;
CREATE TABLE IF NOT EXISTS player
(
    id BIGINT NOT NULL,
    nickname TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    dead_crystal_count INTEGER NOT NULL,
    game_crystal_count INTEGER NOT NULL,
    auth_token TEXT,
    auth_token_expiration_date timestamp without time zone,
    achievement1_name TEXT NOT NULL,
    achievement1_count INTEGER DEFAULT 0,
    achievement2_name TEXT NOT NULL,
    achievement2_count INTEGER DEFAULT 0,
    dead_crystal_earn_count INTEGER DEFAULT 0,
    game_crystal_earn_count INTEGER DEFAULT 0,
    created timestamp without time zone DEFAULT timezone('UTC'::text, now()),
    updated timestamp without time zone DEFAULT timezone('UTC'::text, now()),

    CONSTRAINT player_id_pkey PRIMARY KEY (id),
    CONSTRAINT player_nickname_key UNIQUE (nickname)
);


DROP TABLE IF EXISTS log_action;
CREATE TABLE IF NOT EXISTS log_action
(
    id BIGINT NOT NULL,
    player_id BIGINT NOT NULL,
    is_login BOOLEAN,
    is_registration BOOLEAN,
    is_battle BOOLEAN,
    is_win BOOLEAN,
    earn_dead_crystal_count INTEGER,
    earn_game_crystal_count INTEGER,
    is_achievement1 BOOLEAN,
    is_achievement2 BOOLEAN,
    created timestamp without time zone DEFAULT timezone('UTC'::text, now()),

    CONSTRAINT log_action_id_pkey PRIMARY KEY (id)
);
CREATE INDEX IF NOT EXISTS log_action_player_idx ON log_action (player_id);
