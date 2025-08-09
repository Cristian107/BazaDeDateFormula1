SET SERVEROUTPUT ON
--Creare tabele 

CREATE TABLE echipe ( 
    id_echipa INT PRIMARY KEY, 
    nume VARCHAR2(20) NOT NULL, 
    tara VARCHAR2(20), 
    motor VARCHAR2(20), 
    an_fondare INT 
); 
 
CREATE TABLE piloti ( 
    id_pilot INT PRIMARY KEY, 
    nume VARCHAR2(20) NOT NULL, 
    prenume VARCHAR2(20), 
    echipa INT, 
    data_nasterii DATE, 
    victorii INT DEFAULT 0, 
    CONSTRAINT fk_pilot_echipa FOREIGN KEY (echipa) REFERENCES echipe(id_echipa) ON DELETE SET NULL 
); 

CREATE TABLE curse ( 
    id_cursa INT PRIMARY KEY, 
    locatie VARCHAR2(20) NOT NULL, 
    circuit VARCHAR2(20), 
    lungime_circuit FLOAT, 
    ture INT, 
    data DATE 
); 

CREATE TABLE rezultate_curse ( 
    id_cursa INT, 
    id_pilot INT, 
    pozitie INT, 
    timp_final VARCHAR2(20), 
    tur_rapid VARCHAR2(20), 
    PRIMARY KEY (id_cursa, id_pilot), 
    CONSTRAINT fk_rezultat_cursa FOREIGN KEY (id_cursa) REFERENCES curse(id_cursa) ON DELETE CASCADE, 
    CONSTRAINT fk_rezultat_pilot FOREIGN KEY (id_pilot) REFERENCES piloti(id_pilot) ON DELETE CASCADE 
); 
 
CREATE TABLE accidente_curse ( 
    id_accident INT PRIMARY KEY, 
    id_cursa INT, 
    id_pilot INT, 
    tur INT, 
    CONSTRAINT fk_accident_cursa FOREIGN KEY (id_cursa) REFERENCES curse(id_cursa) ON DELETE CASCADE, 
    CONSTRAINT fk_accident_pilot FOREIGN KEY (id_pilot) REFERENCES piloti(id_pilot) ON DELETE CASCADE 
); 

--Adaugare date tabele 

--Tabela echipe 

INSERT INTO echipe (id_echipa, nume, tara, motor, an_fondare) VALUES (1, 'Red Bull', 'Austria', 'Honda RBPT', 2005); 
INSERT INTO echipe (id_echipa, nume, tara, motor, an_fondare) VALUES (2, 'McLaren', 'UK', 'Mercedes', 1963); 
INSERT INTO echipe (id_echipa, nume, tara, motor, an_fondare) VALUES (3, 'Ferrari', 'Italy', 'Ferrari', 1947); 
INSERT INTO echipe (id_echipa, nume, tara, motor, an_fondare) VALUES (4, 'Mercedes', 'Germany', 'Mercedes', 1954); 
INSERT INTO echipe (id_echipa, nume, tara, motor, an_fondare) VALUES (5, 'Aston Martin', 'UK', 'Mercedes', 2018); 
INSERT INTO echipe (id_echipa, nume, tara, motor, an_fondare) VALUES (6, 'Alpine', 'France', 'Renault', 2021); 
INSERT INTO echipe (id_echipa, nume, tara, motor, an_fondare) VALUES (7, 'AlphaTauri', 'Italy', 'Honda', 2020); 
INSERT INTO echipe (id_echipa, nume, tara, motor, an_fondare) VALUES (8, 'Williams', 'UK', 'Mercedes', 1977); 

--Tabela piloti 

INSERT INTO piloti (id_pilot, nume, prenume, echipa, data_nasterii, victorii) VALUES (1, 'Verstappen', 'Max', 1, TO_DATE('1997-09-30', 'YYYY-MM-DD'), 14); 
INSERT INTO piloti (id_pilot, nume, prenume, echipa, data_nasterii, victorii) VALUES (2, 'Norris', 'Lando', 2, TO_DATE('1999-11-13', 'YYYY-MM-DD'), 3); 
INSERT INTO piloti (id_pilot, nume, prenume, echipa, data_nasterii, victorii) VALUES (3, 'Leclerc', 'Charles', 3, TO_DATE('1997-10-16', 'YYYY-MM-DD'), 3); 
INSERT INTO piloti (id_pilot, nume, prenume, echipa, data_nasterii, victorii) VALUES (4, 'Piastri', 'Oscar', 2, TO_DATE('2001-04-06', 'YYYY-MM-DD'), 1); 
INSERT INTO piloti (id_pilot, nume, prenume, echipa, data_nasterii, victorii) VALUES (5, 'Sainz', 'Carlos', 3, TO_DATE('1994-09-01', 'YYYY-MM-DD'), 2); 
INSERT INTO piloti (id_pilot, nume, prenume, echipa, data_nasterii, victorii) VALUES (6, 'Hamilton', 'Lewis', 4, TO_DATE('1985-01-07', 'YYYY-MM-DD'), 103); 
INSERT INTO piloti (id_pilot, nume, prenume, echipa, data_nasterii, victorii) VALUES (7, 'Perez', 'Sergio', 1, TO_DATE('1990-01-26', 'YYYY-MM-DD'), 6); 
INSERT INTO piloti (id_pilot, nume, prenume, echipa, data_nasterii, victorii) VALUES (8, 'Russell', 'George', 4, TO_DATE('1998-02-15', 'YYYY-MM-DD'), 2); 
INSERT INTO piloti (id_pilot, nume, prenume, echipa, data_nasterii, victorii) VALUES (9, 'Alonso', 'Fernando', 5, TO_DATE('1981-07-29', 'YYYY-MM-DD'), 32); 
INSERT INTO piloti (id_pilot, nume, prenume, echipa, data_nasterii, victorii) VALUES (10, 'Gasly', 'Pierre', 5, TO_DATE('1996-02-07', 'YYYY-MM-DD'), 1); 
  
--Tabela curse 

INSERT INTO curse (id_cursa, locatie, circuit, lungime_circuit, ture, data) VALUES (1, 'Qatar', 'Lusail International', 5.38, 57, TO_DATE('2024-12-01', 'YYYY-MM-DD')); 
INSERT INTO curse (id_cursa, locatie, circuit, lungime_circuit, ture, data) VALUES (2, 'Abu Dhabi', 'Yas Marina', 5.28, 58, TO_DATE('2024-12-08', 'YYYY-MM-DD')); 
INSERT INTO curse (id_cursa, locatie, circuit, lungime_circuit, ture, data) VALUES (3, 'Brazil', 'Interlagos', 4.31, 71, TO_DATE('2024-11-17', 'YYYY-MM-DD')); 
INSERT INTO curse (id_cursa, locatie, circuit, lungime_circuit, ture, data) VALUES (4, 'USA', 'Circuit of the Americas', 5.51, 56, TO_DATE('2024-10-22', 'YYYY-MM-DD')); 
INSERT INTO curse (id_cursa, locatie, circuit, lungime_circuit, ture, data) VALUES (5, 'Monaco', 'Monte Carlo', 3.34, 78, TO_DATE('2024-05-26', 'YYYY-MM-DD')); 
INSERT INTO curse (id_cursa, locatie, circuit, lungime_circuit, ture, data) VALUES (6, 'Australia', 'Albert Park', 5.28, 58, TO_DATE('2024-03-17', 'YYYY-MM-DD'));
INSERT INTO curse (id_cursa, locatie, circuit, lungime_circuit, ture, data) VALUES (7, 'Saudi Arabia', 'Jeddah Street Circuit', 6.17, 50, TO_DATE('2024-03-24', 'YYYY-MM-DD'));
INSERT INTO curse (id_cursa, locatie, circuit, lungime_circuit, ture, data) VALUES (8, 'Azerbaijan', 'Baku City Circuit', 6.00, 51, TO_DATE('2024-04-28', 'YYYY-MM-DD'));
INSERT INTO curse (id_cursa, locatie, circuit, lungime_circuit, ture, data) VALUES (9, 'Canada', 'Circuit Gilles Villeneuve', 4.36, 70, TO_DATE('2024-06-09', 'YYYY-MM-DD'));
INSERT INTO curse (id_cursa, locatie, circuit, lungime_circuit, ture, data) VALUES (10, 'Great Britain', 'Silverstone', 5.89, 52, TO_DATE('2024-07-07', 'YYYY-MM-DD'));
INSERT INTO curse (id_cursa, locatie, circuit, lungime_circuit, ture, data) VALUES (11, 'Belgium', 'Spa-Francorchamps', 7.00, 44, TO_DATE('2024-07-28', 'YYYY-MM-DD'));
INSERT INTO curse (id_cursa, locatie, circuit, lungime_circuit, ture, data) VALUES (12, 'Japan', 'Suzuka', 5.81, 53, TO_DATE('2024-09-22', 'YYYY-MM-DD'));
INSERT INTO curse (id_cursa, locatie, circuit, lungime_circuit, ture, data) VALUES (13, 'Singapore', 'Marina Bay', 5.06, 61, TO_DATE('2024-09-15', 'YYYY-MM-DD'));

--Tabela rezultate_curse 

INSERT INTO rezultate_curse (id_cursa, id_pilot, pozitie, timp_final, tur_rapid) VALUES (1, 1, 1, '1:23:45.672', '1:26.490'); 
INSERT INTO rezultate_curse (id_cursa, id_pilot, pozitie, timp_final, tur_rapid) VALUES (1, 2, 2, '1:24:15.123', '1:26.800'); 
INSERT INTO rezultate_curse (id_cursa, id_pilot, pozitie, timp_final, tur_rapid) VALUES (1, 3, 3, '1:34:50.678', '1:19.123');
INSERT INTO rezultate_curse (id_cursa, id_pilot, pozitie, timp_final, tur_rapid) VALUES (2, 3, 1, '1:35:12.458', '1:38.123'); 
INSERT INTO rezultate_curse (id_cursa, id_pilot, pozitie, timp_final, tur_rapid) VALUES (2, 4, 3, '1:36:00.789', '1:38.901'); 
INSERT INTO rezultate_curse (id_cursa, id_pilot, pozitie, timp_final, tur_rapid) VALUES (2, 2, 3, '1:29:45.678', '1:17.789');
INSERT INTO rezultate_curse (id_cursa, id_pilot, pozitie, timp_final, tur_rapid) VALUES (3, 1, 1, '1:32:45.320', '1:11.540');
INSERT INTO rezultate_curse (id_cursa, id_pilot, pozitie, timp_final, tur_rapid) VALUES (3, 7, 2, '1:33:00.456', '1:11.800');
INSERT INTO rezultate_curse (id_cursa, id_pilot, pozitie, timp_final, tur_rapid) VALUES (3, 6, 3, '1:33:10.789', '1:12.123'); 
INSERT INTO rezultate_curse (id_cursa, id_pilot, pozitie, timp_final, tur_rapid) VALUES (4, 1, 1, '1:36:12.111', '1:37.450'); 
INSERT INTO rezultate_curse (id_cursa, id_pilot, pozitie, timp_final, tur_rapid) VALUES (4, 8, 2, '1:36:50.333', '1:37.880'); 
INSERT INTO rezultate_curse (id_cursa, id_pilot, pozitie, timp_final, tur_rapid) VALUES (4, 2, 3, '1:37:05.123', '1:38.500'); 
INSERT INTO rezultate_curse (id_cursa, id_pilot, pozitie, timp_final, tur_rapid) VALUES (5, 9, 1, '1:40:12.789', '1:19.540'); 
INSERT INTO rezultate_curse (id_cursa, id_pilot, pozitie, timp_final, tur_rapid) VALUES (5, 3, 2, '1:40:45.123', '1:19.800'); 
INSERT INTO rezultate_curse (id_cursa, id_pilot, pozitie, timp_final, tur_rapid) VALUES (5, 4, 3, '1:41:00.456', '1:20.123'); 

--Tabela accidente_curse 

INSERT INTO accidente_curse (id_accident, id_cursa, id_pilot, tur) VALUES (1, 1, 4, 23); 
INSERT INTO accidente_curse (id_accident, id_cursa, id_pilot, tur) VALUES (2, 2, 5, 40); 
INSERT INTO accidente_curse (id_accident, id_cursa, id_pilot, tur) VALUES (3, 3, 10, 40); 
INSERT INTO accidente_curse (id_accident, id_cursa, id_pilot, tur) VALUES (4, 3, 5, 55); 
INSERT INTO accidente_curse (id_accident, id_cursa, id_pilot, tur) VALUES (5, 4, 8, 20);
INSERT INTO accidente_curse (id_accident, id_cursa, id_pilot, tur) VALUES (6, 4, 7, 44); 
INSERT INTO accidente_curse (id_accident, id_cursa, id_pilot, tur) VALUES (7, 5, 6, 12); 
INSERT INTO accidente_curse (id_accident, id_cursa, id_pilot, tur) VALUES (8, 5, 2, 65); 

--Operatii de actualizare:

--1 Actualizare victoriilor pentru un pilot

UPDATE piloti
SET victorii = victorii + 1
WHERE nume = 'Verstappen' AND prenume = 'Max';

--2 Modificarea numelui ??rii pentru o echip?

UPDATE echipe
SET tara = 'Italy'
WHERE nume = 'AlphaTauri';

--3 Modificarea datei unei curse

UPDATE curse
SET data = TO_DATE('2024-12-10', 'YYYY-MM-DD')
WHERE locatie = 'Abu Dhabi';

--4 Setarea unei pozi?ii în rezultate la NULL

UPDATE rezultate_curse
SET pozitie = NULL
WHERE id_cursa = 1 AND id_pilot = 4;

--5 Actualizarea tipului de motor pentru toate echipele care folosesc Mercedes

UPDATE echipe
SET motor = 'Mercedes-AMS'
WHERE motor = 'Mercedes';

--Operatii de interogare 

--1 Numele ?i echipa pilo?ilor

SELECT p.nume, p.prenume, e.nume
FROM piloti p
JOIN echipe e ON p.echipa = e.id_echipa;

--2 Detalii despre cursele câ?tigate de Verstappen

SELECT c.locatie, c.circuit, rc.pozitie
FROM curse c
JOIN rezultate_curse rc ON c.id_cursa = rc.id_cursa
JOIN piloti p ON rc.id_pilot = p.id_pilot
WHERE p.nume = 'Verstappen' AND rc.pozitie = 1;

--3 Lista cu echipele ?i num?rul de pilo?i ordonat?

SELECT e.nume, COUNT(p.id_pilot) numar_piloti
FROM echipe e
LEFT JOIN piloti p ON e.id_echipa = p.echipa
GROUP BY e.nume
ORDER BY numar_piloti DESC;

--4 Pilo?ii implica?i în accidente ?i loca?ia cursei

SELECT p.nume, p.prenume, c.locatie, ac.tur
FROM piloti p
JOIN accidente_curse ac ON p.id_pilot = ac.id_pilot
JOIN curse c ON ac.id_cursa = c.id_cursa;

--5 Pilotul cu cele mai multe victorii per echip?

SELECT e.nume nume_echipa, p.nume, MAX(p.victorii)
FROM piloti p
JOIN echipe e ON p.echipa = e.id_echipa
GROUP BY e.nume, p.nume
ORDER BY MAX(p.victorii) DESC;

--Operatii de grupare 

--1 Num?rul de curse organizate în fiecare loca?ie

SELECT locatie, COUNT(id_cursa) numar_curse
FROM curse
GROUP BY locatie;

--2 Num?rul total de victorii pe echip?

SELECT e.nume, SUM(p.victorii) total_victorii
FROM piloti p
JOIN echipe e ON p.echipa = e.id_echipa
GROUP BY e.nume;

--3 Num?rul de accidente pe curs?

SELECT c.locatie, COUNT(ac.id_accident) numar_accidente
FROM curse c
LEFT JOIN accidente_curse ac ON c.id_cursa = ac.id_cursa
GROUP BY c.locatie;

--4 Pilotul cu cele mai multe victorii

SELECT nume, prenume, MAX(victorii) max_victorii
FROM piloti
GROUP BY nume, prenume
ORDER BY max_victorii DESC
FETCH FIRST 1 ROWS ONLY;

--5 Media turelor per curs? pe loca?ie

SELECT locatie, AVG(ture) medie_ture
FROM curse
GROUP BY locatie;

--Operatii folosind subcereri 

--1 Locatiile curselor cu numarul de curse peste gel mediu 

SELECT locatie
FROM curse
WHERE ture > (SELECT AVG(ture) FROM curse);

--2 Numele echipelor cu cel putin un pilot care are mai mult de 10 victorii 

SELECT nume
FROM echipe
WHERE id_echipa IN (SELECT echipa FROM piloti WHERE victorii > 10);

--3 Numarul de curse castigate de fiecare pilot 

SELECT nume, prenume, (SELECT COUNT(*) FROM rezultate_curse rc WHERE rc.id_pilot = p.id_pilot AND rc.pozitie = 1) Victorii 
FROM piloti p;

--4 Detalii despre cursele castigate de Verstappen 

SELECT locatie, circuit, data
FROM curse
WHERE id_cursa IN (SELECT id_cursa FROM rezultate_curse rc JOIN piloti p ON rc.id_pilot = p.id_pilot  WHERE p.nume = 'Verstappen' AND rc.pozitie = 1);

--5 Pilotii care au fost implicati in minim un accident 

SELECT nume, prenume
FROM piloti
WHERE id_pilot IN (SELECT id_pilot FROM accidente_curse);

--6 Echipere care nu au nicio victorie 

SELECT nume
FROM echipe
WHERE id_echipa NOT IN (SELECT echipa FROM piloti p WHERE id_pilot IN (SELECT id_pilot FROM rezultate_curse WHERE pozitie = 1));

--7 Gasirea pilotului cel mai tanar 

SELECT nume, prenume, data_nasterii
FROM piloti
WHERE data_nasterii = (SELECT MAX(data_nasterii) FROM piloti);

--8 Gasirea timpului cel mai rapid 

SELECT timp_final
FROM rezultate_curse
WHERE timp_final = (SELECT MIN(timp_final) FROM rezultate_curse);

--9 Locatiile unde in ultimul tur a fost un accident 

SELECT locatie
FROM curse
WHERE id_cursa IN (SELECT ac.id_cursa FROM accidente_curse ac JOIN curse c ON ac.id_cursa = c.id_cursa WHERE ac.tur = c.ture);

--10 Pilotul cu cele mai multe victorii 

SELECT nume, prenume
FROM piloti
WHERE victorii = (SELECT MAX(victorii) FROM piloti);

--Utilizarea comenzii CASE

--Clasificare circuit dupa lungime

SELECT locatie, lungime_circuit, 
CASE 
    WHEN lungime_circuit > 6 THEN 'Circuit lung'
    WHEN lungime_circuit BETWEEN 4 AND 6 THEN 'Circuit mediu'
    ELSE 'Circuit scurt'
    END AS categorie
FROM curse;

--Clasificarea timpului final 

SELECT id_pilot, id_cursa, timp_final, 
CASE 
    WHEN TO_NUMBER(SUBSTR(timp_final, 1, 1)) < 1 THEN 'Sub 1 ora'
    WHEN TO_NUMBER(SUBSTR(timp_final, 1, 1)) BETWEEN 1 AND 2 THEN 'Intre 1-2 ore'
    ELSE 'Peste 2 ore'
    END TIMP
FROM rezultate_curse;

--Tabela virtuala 

CREATE OR REPLACE VIEW piloti_experimentati AS
SELECT id_pilot, nume, victorii 
FROM piloti
WHERE victorii > 10;

--Structuri de control:

--1 Actualizare victorii pentru un pilot:

DECLARE v_count NUMBER;
BEGIN
    SELECT COUNT(*) 
    INTO v_count 
    FROM piloti 
    WHERE nume = 'Verstappen' AND prenume = 'Max';

    IF v_count > 0 THEN
        UPDATE piloti
        SET victorii = victorii + 1
        WHERE nume = 'Verstappen' AND prenume = 'Max';
        DBMS_OUTPUT.PUT_LINE('Victorii actualizate');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Pilotul nu exist?.');
    END IF;
END;
/

-- 2 Verificare existenta unui pilot dupa id-ul acestuia

DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) 
    INTO v_count 
    FROM piloti 
    WHERE id_pilot = 2;

    IF v_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Pilotul exista.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Pilotul nu exista.');
    END IF;
END;
/

--3 Verificare numar accidente intr-o cursa
DECLARE
    v_id_cursa NUMBER := &id_cursa;
    v_numar_accidente NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_numar_accidente
    FROM accidente_curse
    WHERE id_cursa = v_id_cursa;

    IF v_numar_accidente > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Cursa cu ID-ul ' || v_id_cursa || ' a avut ' || v_numar_accidente || ' accidente.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Cursa cu ID-ul ' || v_id_cursa || ' nu a avut accidente.');
    END IF;
END;
/

--Cursori

--Impliciti

--1 Afisare nume si prenume pentru pilotii de la Ferrari
BEGIN
    FOR i IN (SELECT nume, prenume FROM piloti WHERE echipa = (SELECT id_echipa FROM echipe WHERE nume = 'Ferrari')) LOOP
        DBMS_OUTPUT.PUT_LINE('Pilot Ferrari: ' || i.nume || ' ' || i.prenume);
    END LOOP;
END;
/

--2 Afisarea circuitelor considerate lungi 
BEGIN
    FOR i IN (SELECT locatie FROM curse WHERE lungime_circuit > 5) LOOP
        DBMS_OUTPUT.PUT_LINE('Circuit lung: ' || i.locatie);
    END LOOP;
END;
/

--3 Afisare piloti cu mai mult de 10 victorii
BEGIN
    FOR i IN (SELECT nume, prenume FROM piloti WHERE victorii > 10) LOOP
        DBMS_OUTPUT.PUT_LINE('Pilot cu peste 10 victorii: ' || i.nume || ' ' || i.prenume);
    END LOOP;
END;
/

--Expliciti

--1 Afisarea numelor echipelor si a numarului de piloti
DECLARE
    CURSOR c IS
        SELECT e.nume, COUNT(p.id_pilot) AS numar_piloti
        FROM echipe e
        LEFT JOIN piloti p 
        ON e.id_echipa = p.echipa
        GROUP BY e.nume;
    v c%ROWTYPE;
BEGIN
    OPEN c;
    LOOP
        FETCH c INTO v;
        EXIT WHEN c%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Echipa: ' || v.nume || ', Piloti: ' || v.numar_piloti);
    END LOOP;
    CLOSE c;
END;
/

--2 Afisare piloti implicati in accidente si locatia accidentului
DECLARE
    CURSOR c IS
        SELECT p.nume, p.prenume, c.locatie
        FROM piloti p
        JOIN accidente_curse ac ON p.id_pilot = ac.id_pilot
        JOIN curse c ON ac.id_cursa = c.id_cursa;
    da c%ROWTYPE;
BEGIN
    OPEN c;
    LOOP
        FETCH c INTO da;
        EXIT WHEN c%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Pilot implicat în accident: ' || da.nume || ' ' || da.prenume || ', Locatie: ' || da.locatie);
    END LOOP;
    CLOSE c;
END;
/

--3 Afisare numar accidente la fiecare cursa 
DECLARE
    CURSOR c IS
        SELECT c.locatie, COUNT(ac.id_accident) AS numar_accidente
        FROM curse c
        LEFT JOIN accidente_curse ac ON c.id_cursa = ac.id_cursa
        GROUP BY c.locatie;
    v c%ROWTYPE;
BEGIN
    OPEN c;
    LOOP
        FETCH c INTO v;
        EXIT WHEN c%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Cursa la ' || v.locatie || ' a avut ' || v.numar_accidente || ' accidente.');
    END LOOP;
    CLOSE c;
END;
/

--Exceptii

--Implicite

--Exceptie pentru mai multe nume returnate in locul de unul singur 
DECLARE
    v_nume piloti.nume%TYPE;
BEGIN
    SELECT nume INTO v_nume FROM piloti;
    DBMS_OUTPUT.PUT_LINE('Nume: ' || v_nume);

EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Eroare: prea multe randuri');
END;
/

--Exceptie pentru un id inexistent
DECLARE
    v_nume piloti.nume%TYPE;
BEGIN
    SELECT nume INTO v_nume FROM piloti WHERE id_pilot = 9999;
    DBMS_OUTPUT.PUT_LINE('Nume: ' || v_nume);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Eroare: nu exista id-ul.');
END;
/

--Explicite

--Excpetie pentru verificarea varstei unui pilot 
DECLARE
    v_varsta NUMBER;
    ex_varsta EXCEPTION;
BEGIN
    SELECT TRUNC(((sysdate - data_nasterii)/365)-10) varsta INTO v_varsta FROM piloti WHERE id_pilot = 3;

    IF v_varsta < 18 THEN
        RAISE ex_varsta;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Varsta buna.');

EXCEPTION
    WHEN ex_varsta THEN
        DBMS_OUTPUT.PUT_LINE('Eroare: varsta invalida.');
END;
/

-- Exceptie pentru un id invalid
DECLARE
    v_id NUMBER := -5;
    ex_id EXCEPTION;
BEGIN
    IF v_id < 0 THEN
        RAISE ex_id;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Id valid.');

EXCEPTION
    WHEN ex_id THEN
        DBMS_OUTPUT.PUT_LINE('Eroare: id invalid.');
END;
/


