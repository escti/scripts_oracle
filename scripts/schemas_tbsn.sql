col schema for a20
col TABLESPACE_NAME for a20
set lines 150 pages 2000

SELECT
OWNER AS SCHEMA,
TABLESPACE_NAME,
CEIL(SUM(bytes)/ 1024 / 1024) AS SIZE_MB,
COUNT(segment_name) AS NUM_OBJECTS
FROM
dba_segments
WHERE
OWNER = UPPER ('&1')
GROUP BY
OWNER,TABLESPACE_NAME
ORDER BY
SUM(BYTES) DESC;