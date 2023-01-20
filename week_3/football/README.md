# Working with Records
A record is a unique row of a database table. SQL restricts our
operations on a row:
- Creating a record
- Reading a record
- Updating a record
- Deleting a record.

The four operations are commonly referred with the acronym *CRUD*. Any
change to the data stored must be made up of these operations. Each of
the operations map to a different SQL statement and Rails construct

- [Active Record Basics ](https://guides.rubyonrails.org/active_record_basics.html#crud-reading-and-writing-data)

In this assignment we will be seeing how data can created and queried from the 
database.

## Steps

- Create the database
Create the `football_players` table using 
[migration](https://guides.rubyonrails.org/active_record_migrations.html) 
file in 'week_3/football/db/migrate'.

- Change directory to rails project.
```bash
cd week_3/football
```

- Create the database
```bash
rails db:create
```

You should see two new files are created if not present already - 
`week_3/football/db/development.sqlite3` and `week_3/football/db/test.sqlite3`

- Run the migrations
```bash
rails db:migrate
```

The schema file (db/schema.rb) should look like this

```ruby
ActiveRecord::Schema[7.0].define(version: 2023_01_10_105345) do
  create_table "football_players", force: :cascade do |t|
    t.string "name"
    t.integer "rank"
    t.string "country"
    t.string "position"
    t.string "squad"
    t.string "league"
    t.integer "age"
    t.integer "born"
    t.integer "minutes_played"
    t.integer "goals"
    t.integer "penalty_kicks_made"
    t.integer "matches_played"
    t.integer "corner_kicks"
    t.integer "yellow_card"
    t.integer "red_card"
    t.integer "penalty_kicks_won"
    t.integer "fouls_committed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
```

- Load the sample data
```bash
rails db:fixtures:load
```
This adds some sample data(/test/fixtures/football_players.yml) to the database.

## Assignment
> For this assignment you have to implement the function inside [app/models/football_player.rb](https://github.com/IRIS-NITK/IRIS-RoR-Bootcamp-2022/blob/main/week_3/football/app/models/football_player.rb)

### Creating Records
The INSERT INTO statement is used to insert new records in a table

```sql
INSERT INTO football_players (id, name, rank, country, position, squad, league, age, born, 
minutes_played, goals, penalty_kicks_made, matches_played, corner_kicks, yellow_card, 
red_card, penalty_kicks_won, fouls_committed) 
VALUES (1, Sergio Agüero, 20, "ARG", , "forward", "Barcelona", "La Liga", 33, 1988, 151, 179, 10, 4, 4, 3, 4, 1,) 
```

In Rails

```ruby
FootballPlayer.create(
  id: 1061760504,
  name: "Sergio Agüero",
  rank: 27,
  country: "ARG",
  position: "forward",
  squad: "Barcelona",
  league: "La Liga",
  age: 33,
  born: 1988,
  minutes_played: 151,
  goals: 179,
  penalty_kicks_made: 402,
  matches_played: 4,
  corner_kicks: 4,
  yellow_card: 4,
  red_card: 3,
  penalty_kicks_won: 4,
  fouls_committed: 1
)
```

Implement the function `import_argentinian_players` in
`app/models/football_player.rb` to add the following players.

|name|rank|country|position|squad|league|age|born|minutes_played|goals|penalty_kicks_made|matches_played|corner_kicks|yellow_card|red_card|penalty_kicks_won|fouls_committed|
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
|Marcos Acuna|13|ARG|defender|Sevilla|La Liga|30|1991|2260|105|705|31|248|81|267|235|237|
|Lucas Alario|50|ARG|forward|Leverkusen|Bundesliga|29|1992|655|79|192|27|193|148|263|64|172|
|Sergio Aguero|27|ARG|forward|Barcelona|La Liga|33|1988|151|179|402|4|52|74|81|134|146|

- [Insert Into](https://www.w3schools.com/sql/sql_insert.asp)
- [Create | Active Record](https://guides.rubyonrails.org/active_record_basics.html#create)


### Selecting Records

The `SELECT` statement is used to select data from a database. For
example:

```sql
SELECT * FROM football_players WHERE name = "Messi";
```

There are many differents ways to select records in Rails with:
- `all`: Select all records.
- `where`: Selects all records satisfying given conditions.
- `find_by`: Selects the _first_ record fullfilling conditions.
- `first`, `last`

```ruby
# Select all players
FootballPlayer.all

# Selects all forwarders
FootballPlayer.where(postion: 'forward') 

# Selects all french forwarders
FootballPlayer.where(postion: 'forward', county: 'FRA')

# Selects first players
FootballPlayer.first

# Selects first players with name Messi
FootballPlayer.find_by(name: 'Messi')

# Selects last players
FootballPlayer.last
```

- [Ordering in rails](https://guides.rubyonrails.org/active_record_querying.html#ordering)

[Scopes](https://guides.rubyonrails.org/active_record_querying.html#scopes)
allow you to specify commonly-used queries and mix-and-match as
you go.

```ruby
scope :midfielders, -> { where(position: 'midfielder') }

FootballPlayer.midfielders
```

Implement the scopes in `app/models/football_player.rb`.

- [Select SQL Statement](https://www.w3schools.com/sql/sql_select.asp)
- [Read | Active Record Basics](https://guides.rubyonrails.org/active_record_basics.html#read)
- [Active Record Query Interface](https://guides.rubyonrails.org/active_record_querying.html)
- [Scopes](https://guides.rubyonrails.org/active_record_querying.html#scopes)

### Updating Records

The `UPDATE` statement is used to modify the existing records in a
table.

```sql
UPDATE football_players SET goals = 41 WHERE name = "Messi";
```

In Rails

```ruby
player = FootballPlayer.find_by(name: "Messi")
player.goals = 41
player.save

# OR
FootballPlayer.where(name: "Messi").update(goals: 41)
```

- [SQL UPDATE Statement](https://www.w3schools.com/sql/sql_update.asp)
- [Update | Active Record Basics](https://guides.rubyonrails.org/active_record_basics.html#update)

### Deleting Records

The `DELETE` statement is used to delete existing records in a table.

```sql
 DELETE FROM football_players WHERE name = "Messi";
```

The Rails equivalent:

```ruby
FootballPlayer.find_by(name: "Messi").destroy
```

- [DELETE | ActiveRecord](https://guides.rubyonrails.org/active_record_basics.html#delete)


Once you start implementing functions in app/models/football_player.rb, you can test your code.

```bash
rails test:models
```

# Rails console
The Rails console is useful for testing out quick ideas with code and debugging applications.

```bash
rails console
```
![image](https://user-images.githubusercontent.com/66632353/212348259-fbf59057-7eb1-4e1a-af8c-634161164afc.png)
