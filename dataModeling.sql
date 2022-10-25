CREATE TABLE occasion (
  id SERIAL PRIMARY KEY,
  name VARCHAR(32)
  );
  
CREATE TABLE ingredients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(35)
    );

CREATE TABLE public_recipes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(35)
  );

CREATE TABLE user_info (   
  id SERIAL PRIMARY KEY,   
  email VARCHAR(255) NOT NULL,   
  password VARCHAR(255) NOT NULL,   
  ingredients_id INT REFERENCES ingredients(id),   
  public_recipes_id INT REFERENCES public_recipes(id),   
  occasion_name INT REFERENCES occasion(id)
);

CREATE TABLE recipe_table (
  id SERIAL PRIMARY KEY,
  instructions VARCHAR,
  public BOOLEAN,
  user_id INT REFERENCES user_info(id),
  ingredients_id INT REFERENCES ingredients(id),
  name VARCHAR(255)
  );

CREATE TABLE user_recipe (
  id SERIAL PRIMARY KEY,
  recipe_id INT REFERENCES recipe_table(id),
  user_id INT REFERENCES user_info(id),
  ingredients_id INT REFERENCES ingredients(id),
  occasion_id INT REFERENCES occasion(id)
  );
  
  CREATE TABLE grocery_list (
    id SERIAL PRIMARY KEY,
    ingredient_id INT REFERENCES ingredients(id),
    user_recipe_id INT REFERENCES user_recipe(id)
    );