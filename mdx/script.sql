-- 1. done
SELECT
  NON EMPTY { [Measures].[Rating],
  [Measures].[Price],
  [Measures].[Total Reviews] } ON COLUMNS,
  NON EMPTY { (
    [Des Company].[Manufacturer].[Manufacturer].ALLMEMBERS * [Des Product].[Os].[Os].ALLMEMBERS
  ) } DIMENSION PROPERTIES MEMBER_CAPTION,
  MEMBER_UNIQUE_NAME ON ROWS
FROM
  [Project_dsv] CELL PROPERTIES VALUE;

-- 2. done
SELECT
  NON EMPTY [Measures].[Price] * [Des Product].[ram].CHILDREN ON COLUMNS,
  TOPCOUNT (
    [Des Company].[Manufacturer].CHILDREN,
    3,
    [Measures].[Price]
  ) ON ROWS
FROM
  [Project_dsv] CELL PROPERTIES VALUE;

---3 done
SELECT
  NON EMPTY FILTER (
    [Des Product].[Form Factor].CHILDREN,
    [Measures].[Price] > 5000
  ) ON COLUMNS,
  [Des Company].[Manufacturer].CHILDREN ON ROWS
FROM
  [Project_dsv];

-- 4. done
SELECT
  NON EMPTY { [Measures].[Total Reviews] } * [Des Product].[Os].CHILDREN ON COLUMNS,
  [Des Product].[Colour].CHILDREN ON ROWS
FROM
  [Project_dsv];

-- 5. done
SELECT
  TOPCOUNT (
    [Des Company].[Manufacturer].CHILDREN,
    3,
    [Measures].[Price]
  ) ON 0
FROM
  [Project_dsv];

-- 6.done
SELECT
  [Measures].[Total Reviews] ON COLUMNS,
  ORDER (
    [Des Company].[Manufacturer].CHILDREN,
    [Measures].[Total Reviews],
    DESC
  ) ON ROWS
FROM
  [Project_dsv];

--7. done
SELECT
  TOPCOUNT (
    [Des Product].[Os].CHILDREN,
    5,
    [Measures].[Price]
  ) ON 0
FROM
  [Project_dsv];

--8 done 
SELECT [Measures].[Price] ON COLUMNS,
TOPCOUNT([Des Product].[Title].CHILDREN, 1, [Measures].[Price]) ON ROWS
FROM [Project_dsv]
WHERE [Des Battery Power].[Batteries].&[2 Lithium ion]

--9 done 
SELECT [Measures].[Total Reviews] ON COLUMNS,
TOPCOUNT([Des Product].[Title].CHILDREN, 5, [Measures].[Total Reviews]) ON ROWS
FROM [Project_dsv]
WHERE [Des Product].[Os].&[Android]

--10 done 
SELECT [Measures].[Rating]ON COLUMNS,
TOPCOUNT([Des Product].[Title].CHILDREN, 3,[Measures].[Rating]) ON ROWS
FROM [Project_dsv]
WHERE [Des Product].[Os].&[Android 11]