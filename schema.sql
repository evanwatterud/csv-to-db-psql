DROP TABLE IF EXISTS ingredient_table;

-- Define your schema here:

CREATE TABLE ingredient_table (
  id SERIAL PRIMARY KEY,
  ingredient VARCHAR(255)
);
