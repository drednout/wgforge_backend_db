DROP TABLE IF EXISTS player;
CREATE TABLE IF NOT EXISTS denormalized.player
(
    id BIGINT NOT NULL,
    nickname TEXT NOT NULL,
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    dead_crystal_count INTEGER NOT NULL,
    game_crystal_count INTEGER NOT NULL,
    current_auth_token TEXT,
    achievement1_count INTEGER DEFAULT 0,
    achievement2_count INTEGER DEFAULT 0,
    dead_crystal_earn_count INTEGER DEFAULT 0,
    game_crystal_earn_count INTEGER DEFAULT 0,
    created timestamp without time zone DEFAULT timezone('UTC'::text, now()),
    updated timestamp without time zone DEFAULT timezone('UTC'::text, now()),

    CONSTRAINT player_id_pkey PRIMARY KEY (id),
    CONSTRAINT player_nickname_key UNIQUE (nickname)
);


--DROP TABLE IF EXISTS log_action;
CREATE TABLE IF NOT EXISTS denormalized.log_action
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
CREATE INDEX IF NOT EXISTS log_action_player_idx ON denormalized.log_action (player_id);
