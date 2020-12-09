INSERT INTO foodtypes (name) VALUES
    ('Carbohydrate'),
    ('Sugar');

INSERT INTO qtytypes (name) VALUES
    ('Slice'),
    ('Spread'),
    ('Cup'),
    ('Spoon'),
    ('Portion'),
    ('Bowl');

INSERT INTO ingredients (name, mass_per_unit, price_per_unit, portions_per_unit, foodtypeid, qtytypeid, cals_per_portion) VALUES
    ('Spaghetti', 500, 0.34, 5, (SELECT id FROM foodtypes WHERE name = 'Carbohydrate'), (SELECT id FROM qtytypes WHERE name = 'Bowl'), 100);

INSERT INTO stock (ingredientid, qty, expiry) VALUES
    ((SELECT id FROM ingredients WHERE name = 'Spaghetti'), 4, '2022-01-01 00:00:00');

INSERT INTO recipes (name, instructions) VALUES
    ('Plain pasta', 'Boil');
    
INSERT INTO recipe_ingredient (recipeid, ingredientid, qty, qtytypeid) VALUES
    ((SELECT id FROM recipes WHERE name = 'Plain pasta'), (SELECT id FROM ingredients WHERE name = 'Spaghetti'), 1, (SELECT id FROM qtytypes WHERE name = 'Portion'));
    
INSERT INTO households (name, budget, currentmoney, payday, discordgroupid) VALUES
    ('Our house', 200.00, 200.00, 21, 'aaa');

INSERT INTO users (name, householdid, discorduserid) VALUES
    ('Dan', (SELECT id FROM households WHERE name = 'Our house'), 'aaaa'),
    ('Raven', (SELECT id FROM households WHERE name = 'Our house'), 'bbbb');

INSERT INTO users_ingredients (userid, ingredientid) VALUES
    ((SELECT id FROM users WHERE name = 'Raven'), (SELECT id FROM ingredients WHERE name = 'Spaghetti'));

INSERT INTO reminders (userid, time, days) VALUES
    ((SELECT id FROM users WHERE name = 'Raven'), '09:00', 127);