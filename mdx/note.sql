---3 check
WITH MEMBER [Measures].[Sum Review] AS [Measures].[Total Reviews] * [Measures].[Rating]
SELECT
  NON EMPTY { [Measures].[Weight],
  [Measures].[Sum Review] } ON COLUMNS,
  NON EMPTY { [Des Company].[Manufacturer].[Manufacturer].AllMembers * [Des Product].[Form Factor].[Form Factor].AllMembers } DIMENSION PROPERTIES MEMBER_CAPTION,
  MEMBER_UNIQUE_NAME ON ROWS
FROM
  [Project_dsv] CELL PROPERTIES VALUE