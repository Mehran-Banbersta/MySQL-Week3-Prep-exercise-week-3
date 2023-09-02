-- Was your database already in 2NF / 3 NF?
--  My database schema follows 2NF with separate       relationship tables (RecipeCategory and RecipeIngredient) to delete or avoid partial dependencies.
-- What changes did you have to do to normalize your database?
-- I added recipe_ingredient_id INT NOT NULL AUTO_INCREMENT
-- and recipe_category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
/*
 tables:
 +----------------------+
 | Tables_in_foodrecipe |
 +----------------------+
 
 | Recipes              |
 recipes_id | recipes_name
 --------------------------------
 1          | No-Bake Cheesecake
 2          | Roasted Brussels Sprouts
 3          | Mac & Cheese
 4          | Tamagoyaki Japanese Omelette
 
 | Category             |
 category_id | category_name
 --------------------------
 1           | Cake
 2           | No-Bake
 3           | Vegetarian
 4           | Vegan
 5           | Gluten-Free
 6           | Japanese
 
 | Ingredient           | 
 ingredient_id | ingredient_name
 -----------------------------------
 1            | Condensed milk
 2            | Cream Cheese
 3            | Lemon Juice
 4            | Pie Crust
 5            | Cherry Jam   
 
 | Steps                |
 steps_id | steps_description
 ------------------------------------
 1        | Beat Cream Cheese
 2        | Add condensed Milk and blend
 3        | Add Lemon Juice and blend
 4        | Add the mix to the pie crust
 5        | Spread the Cherry Jam
 
 | Recipe_Category      |
 recipe_id | category_id
 --------------------
 1         | 1
 1         | 2
 1         | 3
 2         | 4
 2         | 5
 
 | Recipe_Ingredient    |
 recipe_id | ingredient_id
 ------------------------
 1         | 1
 1         | 2
 1         | 3
 1         | 4
 1         | 5
 
 | Recipe_Steps         |
 recipe_id | steps_id | steps_order
 --------------------------------
 1         | 1        | 1
 1         | 2        | 2
 1         | 3        | 3
 1         | 4        | 4
 
 
 +----------------------+
 */
-- recipes
CREATE TABLE Recipes (
  recipes_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  recipes_name VARCHAR(255) NOT NULL
);
-- category
CREATE TABLE Category (
  category_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(255) NOT NULL
);
-- ingredient
CREATE TABLE Ingredient (
  ingredient_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ingredient_name VARCHAR(255) NOT NULL
);
-- steps
CREATE TABLE Steps (
  steps_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  steps_description VARCHAR(255) NOT NULL
);
-- recipe_category
CREATE TABLE Recipe_Category (
  recipe_category_id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  recipe_id INT,
  category_id INT,
  PRIMARY KEY (recipe_id, category_id),
  FOREIGN KEY (recipe_id) REFERENCES Recipes(recipes_id),
  FOREIGN KEY (category_id) REFERENCES Category(category_id)
);
-- recipe_ingredient
CREATE TABLE Recipe_Ingredient (
  recipe_ingredient_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  recipe_id INT,
  ingredient_id INT,
  PRIMARY KEY (recipe_id, ingredient_id),
  FOREIGN KEY (recipe_id) REFERENCES Recipes(recipes_id),
  FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id)
);
-- recipe_steps
CREATE TABLE Recipe_Steps (
  recipe_id INT,
  steps_id INT,
  steps_order INT,
  PRIMARY KEY (recipe_id, steps_id),
  FOREIGN KEY (recipe_id) REFERENCES Recipes(recipes_id),
  FOREIGN KEY (steps_id) REFERENCES Steps(steps_id)
);
-- Insert into recipes table
INSERT INTO Recipes (recipes_id, recipes_name)
VALUES (1, 'No-Bake Cheesecake'),
  (2, 'Roasted Brussels Sprouts'),
  (3, 'Mac & Cheese'),
  (4, 'Tamagoyaki Japanese Omelette');
-- Insert into category table
INSERT INTO Category (category_id, category_name)
VALUES (1, 'Cake'),
  (2, 'No-Bake'),
  (3, 'Vegetarian'),
  (4, 'Vegan'),
  (5, 'Gluten-Free'),
  (6, 'Japanese');
-- Insert into ingredient table
INSERT INTO Ingredient (ingredient_id, ingredient_name)
VALUES (1, 'Condensed milk'),
  (2, 'Cream Cheese'),
  (3, 'Lemon Juice'),
  (4, 'Pie Crust'),
  (5, 'Cherry Jam'),
  (6, 'Brussels Sprouts'),
  (7, 'Sesame seeds'),
  (8, 'Pepper'),
  (9, 'Salt'),
  (10, 'Olive oil'),
  (11, 'Macaroni'),
  (12, 'Butter'),
  (13, 'Flour'),
  (14, 'Milk'),
  (15, 'Shredded Cheddar cheese'),
  (16, 'Eggs'),
  (17, 'Soy sauce'),
  (18, 'Sugar'),
  (19, 'Soy sauce'),
  (20, 'Sugar');
-- Insert into steps table
INSERT INTO Steps (steps_id, steps_description)
VALUES (1, 'Beat Cream Cheese'),
  (2, 'Add condensed Milk and blend'),
  (3, 'Add Lemon Juice and blend'),
  (4, 'Add the mix to the pie crust'),
  (5, 'Spread the Cherry Jam'),
  (6, 'Place in refrigerator for 3h.'),
  (7, 'Preheat the oven'),
  (8, 'Mix the ingredients in a bowl'),
  (9, 'Spread the mix on a baking sheet'),
  (10, 'Bake for 30 minutes'),
  (11, 'Cook Macaroni for 8 minutes'),
  (12, 'Melt butter in a saucepan'),
  (13, 'Add flour, salt, pepper and mix'),
  (14, 'Add Milk and mix'),
  (15, 'Cook until mix is smooth'),
  (16, 'Add cheddar cheese'),
  (17, 'Add the macaroni'),
  (18, 'Beat the eggs'),
  (19, 'Add soya sauce, sugar, and salt'),
  (20, 'Add oil to a saucepan'),
  (21, 'Bring to medium heat'),
  (22, 'Add some mix to the saucepan'),
  (23, 'Let it cook for 1 minute'),
  (24, 'Add oil to a saucepan'),
  (25, 'Add some mix to the saucepan'),
  (26, 'Let it cook for 1 minute'),
  (27, 'Remove pan from fire');
-- Insert into recipe_category table
INSERT INTO Recipe_Category (recipe_id, category_id)
VALUES (1, 1),
  -- cake
  (1, 2),
  -- No cake
  (1, 3),
  -- vegetarian
  (2, 4),
  -- Vegan
  (2, 5),
  -- Gluten-Free
  (3, 3),
  -- Vegetarian
  (4, 3),
  -- Vegetarian
  (4, 6);
-- Japanese
-- Insert into recipe_ingredient table 
INSERT INTO Recipe_Ingredient (recipe_id, ingredient_id)
VALUES (1, 1),
  -- Condensed milk
  (1, 2),
  -- Cream Cheese
  (1, 3),
  -- Lemon Juice
  (1, 4),
  -- Pie Crust
  (1, 5),
  -- Cherry Jam
  (2, 6),
  -- Brussels Sprouts
  (2, 7),
  -- Sesame seeds
  (2, 8),
  -- Pepper
  (2, 9),
  -- Salt
  (2, 10),
  -- Olive oil
  (3, 11),
  -- Macaroni
  (3, 12),
  -- Butter
  (3, 13),
  -- Flour
  (3, 14),
  -- Salt
  (3, 15),
  -- Pepper
  (3, 16),
  -- Milk
  (3, 17),
  -- Shredded Cheddar cheese
  (4, 18),
  -- Eggs
  (4, 19),
  -- Soy sauce
  (4, 20),
  -- Sugar
  (4, 9),
  -- Salt
  (4, 10);
-- Insert into Recipe_Steps table
INSERT INTO Recipe_Steps (recipe_id, steps_id, steps_order)
VALUES (1, 1, 1),
  (1, 2, 2),
  (1, 3, 3),
  (1, 4, 4),
  (1, 5, 5),
  (1, 6, 6),
  (2, 7, 1),
  (2, 8, 2),
  (2, 9, 3),
  (2, 10, 4),
  (3, 11, 1),
  (3, 12, 2),
  (3, 13, 3),
  (3, 14, 4),
  (3, 15, 5),
  (3, 16, 6),
  (3, 17, 7),
  (4, 18, 1),
  (4, 19, 2),
  (4, 20, 3),
  (4, 9, 4),
  (4, 10, 5);
--