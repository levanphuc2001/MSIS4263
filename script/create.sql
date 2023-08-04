CREATE TABLE [des_battery_power] (
  [batteries] varchar(255),
  [battery_power_rating] numeric(20, 0),
  [id] varchar(50)
);

CREATE TABLE [des_company] (
  [manufacturer] varchar(max),
  [country_of_origin] varchar(50),
  [id] varchar(50) primary key
);

CREATE TABLE [des_product_dimensions] (
  [product_dimensions] varchar(50) primary key,
  [product_dimension_length] real,
  [product_dimension_width] real,
  [product_dimension_height] real
);

CREATE TABLE [des_product] (
  [id] varchar(50) primary key,
  [title] varchar(max),
  [product_description] varchar(max),
  [os] varchar(50),
  [ram] numeric(18, 0),
  [form_factor] varchar(50),
  [colour] varchar(50)
);

CREATE TABLE [des_fact] (
  [price] numeric(20, 0),
  [rating] real,
  [total_reviews] bigint,
  [availability_status] varchar(50),
  [product_dimensions] varchar(50),
  [weight] float,
  [number_special_features] bigint,
  [key_company] varchar(50),
  [key_battery_power] varchar(50),
  [key_product] varchar(50),
  PRIMARY KEY (
    product_dimensions,
    key_company,
    key_battery_power,
    key_product
  ),
  FOREIGN KEY (product_dimensions) REFERENCES des_product_dimensions(product_dimensions),
  FOREIGN KEY (key_company) REFERENCES des_company(id),
  FOREIGN KEY (key_battery_power) REFERENCES des_battery_power(id),
  FOREIGN KEY (key_product) REFERENCES des_product(id)
);