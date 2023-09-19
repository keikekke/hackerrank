-- https://www.hackerrank.com/challenges/the-company/problem?isFullScreen=true

SELECT
  cc.company_code,
  cc.founder,
  COUNT(DISTINCT em.lead_manager_code),
  COUNT(DISTINCT em.senior_manager_code),
  COUNT(DISTINCT em.manager_code),
  COUNT(DISTINCT em.employee_code)
FROM Company cc
JOIN Employee em USING (company_code)
GROUP BY cc.company_code, cc.founder
ORDER BY company_code;

/* another solution */
SELECT DISTINCT
    C.company_code,
    founder,
    DENSE_RANK() OVER (PARTITION BY LM.company_code ORDER BY LM.lead_manager_code ASC) +
    DENSE_RANK() OVER (PARTITION BY LM.company_code ORDER BY LM.lead_manager_code DESC) - 1,
    DENSE_RANK() OVER (PARTITION BY SM.company_code ORDER BY SM.senior_manager_code ASC) +
    DENSE_RANK() OVER (PARTITION BY SM.company_code ORDER BY SM.senior_manager_code DESC) - 1,
    DENSE_RANK() OVER (PARTITION BY M.company_code ORDER BY M.manager_code ASC) +
    DENSE_RANK() OVER (PARTITION BY M.company_code ORDER BY M.manager_code DESC) - 1,
    DENSE_RANK() OVER (PARTITION BY M.company_code ORDER BY E.employee_code ASC) +
    DENSE_RANK() OVER (PARTITION BY M.company_code ORDER BY E.employee_code DESC) - 1
    -- COUNT(DISTINCT LM.lead_manager_code) OVER (PARTITION BY LM.company_code),
    -- COUNT(DISTINCT SM.senior_manager_code) OVER (PARTITION BY SM.company_code),
    -- COUNT(DISTINCT M.manager_code) OVER (PARTITION BY M.company_code),
    -- COUNT(DISTINCT E.employee_code) OVER (PARTITION BY M.company_code)
FROM Company C
JOIN Lead_Manager LM USING (company_code)
JOIN Senior_Manager SM USING (company_code)
JOIN Manager M USING (company_code)
JOIN Employee E USING (company_code)
ORDER BY C.company_code


CREATE TABLE SM (
    senior_manager_code VARCHAR(20),
    lead_manager_code VARCHAR(20),
    company_code VARCHAR(20),
    FOREIGN KEY (lead_manager_code, company_code) REFERENCES LM(lead_manager_code, company_code),
    PRIMARY KEY (senior_manager_code, lead_manager_code, company_code)
);

CREATE TABLE M (
    manager_code VARCHAR(20),
    senior_manager_code VARCHAR(20),
    lead_manager_code VARCHAR(20),
    company_code VARCHAR(20),
    FOREIGN KEY (senior_manager_code, lead_manager_code, company_code) REFERENCES SM(senior_manager_code, lead_manager_code, company_code),
    PRIMARY KEY (manager_code, senior_manager_code, lead_manager_code, company_code)
);

CREATE TABLE E (
    employee_code VARCHAR(20),
    manager_code VARCHAR(20),
    senior_manager_code VARCHAR(20),
    lead_manager_code VARCHAR(20),
    company_code VARCHAR(20),
    FOREIGN KEY (manager_code, senior_manager_code, lead_manager_code, company_code) REFERENCES M(manager_code, senior_manager_code, lead_manager_code, company_code),
    PRIMARY KEY (employee_code, manager_code, senior_manager_code, lead_manager_code, company_code)
);

INSERT INTO LM VALUES ('lm1', 'c1'), ('lm2', 'c2');
INSERT INTO SM VALUES ('sm1', 'lm1', 'c1'), ('sm2', 'lm1', 'c1'), ('sm3', 'lm2', 'c2');
INSERT INTO M VALUES ('m1', 'sm1', 'lm1', 'c1'), ('m2', 'sm3', 'lm2', 'c2'), ('m3', 'sm3', 'lm2', 'c2');
INSERT INTO E VALUES ('e1', 'm1', 'sm1', 'lm1', 'c1'), ('e2', 'm1', 'sm1', 'lm1', 'c1'), ('e3', 'm2', 'sm3', 'lm2', 'c2'), ('e4', 'm3', 'sm3', 'lm2', 'c2');
