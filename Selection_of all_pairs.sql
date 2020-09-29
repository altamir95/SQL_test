CREATE DATABASE fooddb;

GO

USE fooddb;
CREATE TABLE Foods(
    Id INT IDENTITY ,
    FoodName NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_Food_Id PRIMARY KEY(Id)
);
INSERT INTO Foods VALUES
(N'Колбаса'),
(N'Батон'),
(N'Булка'),
(N'Шоколад'),
(N'Банан'),
(N'Молоко'),
(N'Апельсин'),
(N'Яйцо'),
(N'Хлопья'),
(N'Носки'),
(N'Мыло'),
(N'Рис'),
(N'Яблоко');
CREATE TABLE Categories(
    Id INT IDENTITY,
    CategorieName NVARCHAR(50) NOT NULL,
    CONSTRAINT PK_Categorie_Id PRIMARY KEY(Id)
);
INSERT INTO Categories VALUES
(N'Фрукты'),
(N'Сладкое'),
(N'Выпечка'),
(N'Молочка'),
(N'Халал'),
(N'Эко'),
(N'Импрот');
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
