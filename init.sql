CREATE TABLE categories (
    id UUID PRIMARY KEY,
    name VARCHAR(30),
    description VARCHAR,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE games (
    id UUID PRIMARY KEY,
    name VARCHAR(30),
    description VARCHAR,
    is_active BOOLEAN DEFAULT TRUE,
    average_score NUMERIC(5, 2),
    is_adult_only BOOLEAN NOT NULL,
    category_id UUID NOT NULL
);

CREATE TABLE games_comments (
    id UUID PRIMARY KEY,
    message VARCHAR,
    game_id UUID NOT NULL,
    user_id UUID NOT NULL
);

CREATE TABLE games_marks (
    id UUID PRIMARY KEY,
    score NUMERIC(5, 2),
    game_id UUID NOT NULL,
    user_id UUID NOT NULL
);

CREATE TABLE tags (
    id UUID PRIMARY KEY,
    name VARCHAR(30),
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE games_tags (
    game_id UUID NOT NULL REFERENCES games(id),
    tag_id UUID NOT NULL REFERENCES tags(id),
	PRIMARY KEY (game_id, tag_id)
);

CREATE TABLE users_identities (
    id UUID PRIMARY KEY,
    password_hash BYTEA NOT NULL,
    password_salt BYTEA NOT NULL
);


CREATE TABLE users (
    id UUID PRIMARY KEY,
    identity_id UUID UNIQUE NOT NULL,
    email VARCHAR(30) NOT NULL,
    nick VARCHAR(30) NOT NULL,
    birth_date DATE NOT NULL,
    is_adult BOOLEAN NOT NULL,
    role VARCHAR NOT NULL
);


ALTER TABLE games ADD FOREIGN KEY(category_id) REFERENCES categories(id);
ALTER TABLE users ADD FOREIGN KEY(identity_id) REFERENCES users_identities (id);
ALTER TABLE games_comments ADD FOREIGN KEY(game_id) REFERENCES games(id);
ALTER TABLE games_comments ADD FOREIGN KEY(user_id) REFERENCES users(id);
ALTER TABLE games_marks ADD FOREIGN KEY(game_id) REFERENCES games(id);
ALTER TABLE games_marks ADD FOREIGN KEY(user_id) REFERENCES users(id);

CREATE EXTENSION unaccent;


INSERT INTO categories (id, name, description)
    VALUES ('dfb56a10-15d1-4c8e-b27f-d6f6a83d1e1b', 'RPG', 'Po prostu RPG');
INSERT INTO categories (id, name, description)
    VALUES ('c5e30c58-7360-49b8-8f04-26e0c3de3722', 'Strategie', 'Pokonywanie przeciwników nie jest wcale łatwe');
INSERT INTO categories (id, name, description)
    VALUES ('fd3f2c76-df8c-42bc-9c79-57f6e4e19c2b', 'Wyścigowe', 'Kto pierwszy ten lepszy');

INSERT INTO games (id, name, description, category_id, is_adult_only)
    VALUES ('8e83f86b-220c-4501-840d-d46909938ea8', 'Wiedźmin 3 Dziki Gon', 'Wiedźmin 3 Dziki Gon jest grą z otwartym światem', 'dfb56a10-15d1-4c8e-b27f-d6f6a83d1e1b', true);
INSERT INTO games (id, name, description, category_id, is_adult_only)
    VALUES ('dae7f75c-4e1e-4be9-b691-ec8050f3f9ec', 'Civilizacja VI', 'Civilizacja VI jest jedną z najlepszych gier strategicznych', 'c5e30c58-7360-49b8-8f04-26e0c3de3722', false);
INSERT INTO games (id, name, description, category_id, is_adult_only)
    VALUES ('40e905db-26d7-4a40-9691-969b648fe12e', 'Twierdza', 'Twierdza jest jedną z najlepszych gier, w których budujesz zamki', 'c5e30c58-7360-49b8-8f04-26e0c3de3722', false);
INSERT INTO games (id, name, description, category_id, is_adult_only)
    VALUES ('86a05fed-95ee-4d3c-90e6-24e135070600', 'Colin Mcrae Rally 2005', 'Colin Mcrae Rally 2005 jest jedną z najlepszych gier wyścigowych', 'fd3f2c76-df8c-42bc-9c79-57f6e4e19c2b', false);
INSERT INTO games (id, name, description, category_id, is_adult_only)
    VALUES ('82d238ed-ff7d-47e4-80eb-194b53fe11c3', 'Gothic 2', 'Gothic 2 gra niesamowicie popularna w Polsce', 'dfb56a10-15d1-4c8e-b27f-d6f6a83d1e1b', true);

