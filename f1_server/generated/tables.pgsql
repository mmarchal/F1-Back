--
-- Class Pilot as table pilot
--

CREATE TABLE pilot (
  "id" serial,
  "firstName" text NOT NULL,
  "lastName" text NOT NULL,
  "team" json NOT NULL,
  "country" text NOT NULL
);

ALTER TABLE ONLY pilot
  ADD CONSTRAINT pilot_pkey PRIMARY KEY (id);


--
-- Class Ranking as table ranking
--

CREATE TABLE ranking (
  "id" serial,
  "rank" integer NOT NULL,
  "pilot" json NOT NULL,
  "points" integer NOT NULL
);

ALTER TABLE ONLY ranking
  ADD CONSTRAINT ranking_pkey PRIMARY KEY (id);


--
-- Class Team as table team
--

CREATE TABLE team (
  "id" serial,
  "name" text NOT NULL
);

ALTER TABLE ONLY team
  ADD CONSTRAINT team_pkey PRIMARY KEY (id);


