# BookMyShow Database Design

A MySQL database design for a BookMyShow-like movie ticketing platform. The project demonstrates relational database design, normalization, constraints, sample data, and SQL queries for retrieving movie show timings for a selected theatre and date.

## Project Objective

The objective is to design a normalized relational database that supports the following functionality:

* Store theatre information.
* Store multiple screens within each theatre.
* Store individual seats for each screen.
* Store movie information.
* Store movie shows scheduled on different screens.
* Retrieve all shows available at a selected theatre on a particular date.
* Maintain data integrity using primary keys, foreign keys, unique constraints, and check constraints.

## Database Technology

* **Database:** MySQL
* **SQL:** MySQL-compatible SQL
* **Database Name:** `bookmyshow_db`

## Database Schema

The database contains the following five tables:

### 1. Theatre

Stores information about movie theatres.

**Primary Key:** `theatre_id`

Main attributes:

* `theatre_id`
* `theatre_name`
* `address`
* `city`
* `state`
* `pincode`

### 2. Screen

Stores screens available inside each theatre.

**Primary Key:** `screen_id`

**Foreign Key:** `theatre_id → theatre(theatre_id)`

Main attributes:

* `screen_id`
* `theatre_id`
* `screen_name`

### 3. Seat

Stores individual seats available on each screen.

**Primary Key:** `seat_id`

**Foreign Key:** `screen_id → screen(screen_id)`

Main attributes:

* `seat_id`
* `screen_id`
* `seat_row`
* `seat_number`
* `seat_type`

### 4. Movie

Stores movie-related information.

**Primary Key:** `movie_id`

Main attributes:

* `movie_id`
* `movie_name`
* `duration_minutes`
* `language`
* `certificate`
* `release_date`

### 5. Show

Stores movie show schedules.

**Primary Key:** `show_id`

**Foreign Keys:**

* `screen_id → screen(screen_id)`
* `movie_id → movie(movie_id)`

Main attributes:

* `show_id`
* `screen_id`
* `movie_id`
* `show_start`
* `show_end`

## Entity Relationships

```text
Theatre
   |
   | 1 : N
   v
Screen
   |
   | 1 : N
   v
Seat

Screen
   |
   | 1 : N
   v
Show
   ^
   |
   | N : 1
 Movie
```

## Normalization

The database design follows the required normalization principles:

* **1NF:** All attributes contain atomic values and there are no repeating groups.
* **2NF:** All non-key attributes depend on the complete primary key.
* **3NF:** There are no transitive dependencies between non-key attributes.
* **BCNF:** Every determinant is a candidate key or a superkey under the defined business rules.

## Project Structure

```text
BookMyShow-Database/
│
├── README.md
│
├── sql/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   ├── 03_insert_sample_data.sql
│   └── 04_queries.sql
│
└── docs/
    └── BookMyShow_Database_Assignment.docx
```

## SQL Scripts

### 01_create_database.sql

Creates the `bookmyshow_db` database.

### 02_create_tables.sql

Creates the five database tables along with:

* Primary keys
* Foreign keys
* Unique constraints
* Check constraints
* Not-null constraints

### 03_insert_sample_data.sql

Inserts sample records for:

* Theatres
* Screens
* Seats
* Movies
* Shows

### 04_queries.sql

Contains the P2 query to retrieve all movie shows for a selected theatre and date, including movie name, screen name, start time, and end time.

## How to Run

### Step 1: Open MySQL Workbench

Open MySQL Workbench and connect to your MySQL server.

### Step 2: Execute Database Creation Script

Run:

```text
sql/01_create_database.sql
```

### Step 3: Create Tables

Run:

```text
sql/02_create_tables.sql
```

### Step 4: Insert Sample Data

Run:

```text
sql/03_insert_sample_data.sql
```

### Step 5: Execute the Query

Run:

```text
sql/04_queries.sql
```

The query returns all shows scheduled at the selected theatre on the specified date, ordered by show start time.

## Example Query Result

For theatre ID `1` on `2026-09-05`, the query returns shows such as:

| Movie             | Screen   | Start Time | End Time |
| ----------------- | -------- | ---------- | -------- |
| Avengers: Endgame | Screen 1 | 10:00      | 13:01    |
| Interstellar      | Screen 2 | 11:30      | 14:19    |
| Avengers: Endgame | Screen 1 | 14:00      | 17:01    |
| 3 Idiots          | Screen 3 | 15:00      | 17:50    |
| Interstellar      | Screen 2 | 18:30      | 21:19    |

## Assignment Requirements Covered

* [x] Entity identification
* [x] Attribute identification
* [x] Table structure design
* [x] Primary and foreign keys
* [x] Sample data
* [x] 1NF
* [x] 2NF
* [x] 3NF
* [x] BCNF
* [x] P1 – Create tables
* [x] P1 – Insert sample data
* [x] P2 – Retrieve shows for a theatre and date

## Conclusion

This project provides a normalized MySQL database design for a BookMyShow-like ticketing platform. The schema maintains relationships between theatres, screens, seats, movies, and shows while ensuring data integrity and reducing redundancy.

## Author

Kshitij Dhawane