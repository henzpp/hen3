--lmembers
SELECT * FROM prodcl;
SELECT * FROM channel;
SELECT * FROM competitor;
SELECT * FROM demo;
SELECT * FROM member;
SELECT * FROM purprd;


SELECT mname
FROM member
GROUP BY mname;

SELECT asso
FROM channel
GROUP BY asso;

SELECT custno, SUM(puramt)
FROM purprd
GROUP BY custno;

SELECT mcl
FROM prodcl
GROUP BY mcl;