CREATE TABLE categories (
    id UUID PRIMARY KEY,
    name VARCHAR(30),
    description VARCHAR,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE games
(
    id UUID PRIMARY KEY,
    name VARCHAR(30),
    description VARCHAR,
    is_active BOOLEAN DEFAULT TRUE,
    average_score NUMERIC(5, 2),
    is_adult_only BOOLEAN,
    category_id UUID NOT NULL
);

ALTER TABLE games ADD FOREIGN KEY(category_id) REFERENCES categories(id);