CREATE TABLE foodtypes (
    id SERIAL NOT NULL UNIQUE,
    name TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE qtytypes (
    id SERIAL NOT NULL UNIQUE,
    name TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE ingredients (
    id SERIAL NOT NULL UNIQUE,
    name TEXT NOT NULL,
    mass_per_unit INT NOT NULL,
    price_per_unit DECIMAL NOT NULL,
    portions_per_unit INT NOT NULL,
    foodtypeid SERIAL NOT NULL,
    qtytypeid SERIAL NOT NULL,
    cals_per_portion INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    FOREIGN KEY (foodtypeid) REFERENCES foodtypes(id),
    FOREIGN KEY (qtytypeid) REFERENCES qtytypes(id)
);

CREATE TABLE stock (
    id SERIAL NOT NULL UNIQUE,
    ingredientid SERIAL NOT NULL,
    qty INT NOT NULL,
    expiry TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    FOREIGN KEY (ingredientid) REFERENCES ingredients(id)
);

CREATE TABLE recipes (
    id SERIAL NOT NULL UNIQUE,
    name VARCHAR(255),
    instructions TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE recipe_ingredient (
    id SERIAL NOT NULL UNIQUE,
    recipeid SERIAL NOT NULL,
    ingredientid SERIAL NOT NULL,
    qty INT NOT NULL,
    qtytypeid SERIAL NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    FOREIGN KEY (recipeid) REFERENCES recipes(id),
    FOREIGN KEY (ingredientid) REFERENCES ingredients(id),
    FOREIGN KEY (qtytypeid) REFERENCES qtytypes(id)
);

CREATE TABLE households (
    id SERIAL NOT NULL UNIQUE,
    name VARCHAR(255),
    budget DECIMAL,
    currentmoney DECIMAL,
    payday INT,
    discordgroupid VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP
);

CREATE TABLE users (
    id SERIAL NOT NULL UNIQUE,
    householdid SERIAL NOT NULL,
    name VARCHAR(255),
    discorduserid VARCHAR(255),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    FOREIGN KEY (householdid) REFERENCES households(id)
);

CREATE TABLE users_ingredients (
    userid SERIAL NOT NULL,
    ingredientid SERIAL NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    FOREIGN KEY (userid) REFERENCES users(id),
    FOREIGN KEY (ingredientid) REFERENCES ingredients(id),
    PRIMARY KEY (userid, ingredientid)
);

CREATE TABLE reminders (
    id SERIAL NOT NULL UNIQUE,
    userid SERIAL NOT NULL,
    time TIME NOT NULL,
    days INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    FOREIGN KEY (userid) REFERENCES users(id)
);