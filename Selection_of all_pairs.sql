USE usersdb;
CREATE TABLE Foods(
    Id INT IDENTITY ,
    FoodName NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_Food_Id PRIMARY KEY(Id),
    CONSTRAINT UQ_Food_FoodName UNIQUE (FoodName)
);
INSERT INTO Foods VALUES
('Колбаса'),
('Батон'),
('Булка'),
('Шоколад'),
('Банан'),
('Молоко'),
('Апельсин'),
('Яйцо'),
('Хлопья'),
('Носки'),
('Мыло'),
('Рис'),
('Яблоко');
CREATE TABLE Categories(
    Id INT IDENTITY,
    CategorieName NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_Categorie_Id PRIMARY KEY(Id),
    CONSTRAINT UQ_Categorie_FoodName UNIQUE (CategorieName)
);
INSERT INTO Categories VALUES
('Фрукты'),
('Сладкое'),
('Выпечка'),
('Молочка'),
('Халал'),
('Эко'),
('Импрот');
CREATE TABLE FoodCategories(
    FoodId INT,
    CategorieId INT,
    CONSTRAINT FK_FoodCategories_FoodId FOREIGN KEY (FoodId) REFERENCES Foods (Id),
    CONSTRAINT FK_FoodCategories_CategorieId FOREIGN KEY (CategorieId) REFERENCES Categories (Id),
);
INSERT INTO FoodCategories VALUES
(1,2),
(2,3),
(3,3),
(3,2),
(4,2),
(4,7),
(5,1),
(5,7),
(6,4),
(6,6),
(7,1),
(7,7),
(13,1),
(13,7);

SELECT Foods.FoodName, Categories.CategorieName
FROM Foods
LEFT JOIN FoodCategories ON Foods.Id = FoodCategories.FoodId
LEFT JOIN Categories ON Categories.Id = FoodCategories.CategorieId;
