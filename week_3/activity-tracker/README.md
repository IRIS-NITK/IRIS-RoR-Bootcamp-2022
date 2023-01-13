# Creating Tables | Activity Tracker

We will learn about creating tables in Rails while keeping ourselves fit!

Tables are the database objects that contain all the data in a database.
In tables, data is locally organized in a row-and-column format similar
to a spreadsheet. Each row represents a unique record and each column
represents a field in the record.

For example, a table that contains employee data might contain a row for
each employee and columns representing employee information such as
employee number, name, address, job title and phone number.

Tables are created executing the SQL statement `CREATE TABLE` on the
database. For example:

```sql
CREATE TABLE employees (
  employee_number INTEGER,
  name            VARCHAR(80),
  address         VARCHAR(255),
  title           VARCHAR(80),
  phone_number    VARCHAR(10)
  salary          DECIMAL
);
```

In Rails, each table represents a class in `app/models` and creating new
tables is simpler and more convenient, thanks to the generator and
migrations.

Rails equivalent of the above statement would be:

```bash
rails generate model Employee employee_number:integer name:string \
address:string title:string phone_number:string{10} salary:decimal
```

For this exercise, we will create a table `activity` with the following
attributes and data-types:
- Title: `string`
- Type: `string`
- Start: `datetime`
- Duration: `decimal`
- Calories: `integer`

## Steps

1. ### Prepare Local Database

-  Change directory to activity-tracker

    ```bash
    cd activity-tracker
    ```

- Create the database
   ```
   rails db:create
   ```

    You should see two new files are created if not    present already - `development.sqlite3` and `test.sqlite3`.

 - Run the migrations

    ```bash
    rails db:migrate
    ```

2. ### Create the tables
    Models can be created using Rails generator with the following syntax:

    ```bash
    rails generate model NAME field[:type] field[:type]...
    ```

    So for our requirement, execute the following command:
    ```bash
    rails generate model Activity title:string type:string start:datetime duration:decimal calories:integer
    ```

    > Rails has great emphasis on naming conventions. The model name must be
    > `CamelCase` and column names must be `snake_case`. Read about other
    > [rails naming conventions](https://gist.github.com/iangreenleaf/b206d09c587e8fc6399e).

    - [Understanding the SQL Decimal data type](https://www.sqlshack.com/understanding-sql-decimal-data-type/)
    - [Precision and scale for decimals](https://millarian.com/rails/precision-and-scale-for-ruby-on-rails-migrations/)

    The command creates multiple files - most important of which are
    `app/models/activity.rb` and `db/migrate/<YYYYMMDDHHMMSS>_create_activities.rb`

    > The number in the beginning of the migration file is a UTC timestamp.
    > Rails uses this timestamp to determine which migration should be run
    > and in what order.

    The file `db/migrations/<YYYYMMDDHHMMSS>_create_activities.rb` looks like:

    ```ruby
    class CreateActivities < ActiveRecord::Migration[7.0]
    def change
        create_table :activities do |t|
          t.string :title
          t.string :type
          t.datetime :start
          t.decimal :duration
          t.integer :calories

          t.timestamps
        end
      end
    end
    ```

    The migration roughly translates to "create table activities with the five columns and their types described above" which is exactly what we wanted!
    The migration also uses the code `t.timestamps` to add timestamps `created_at` and `updated_at` to the activities table automatically.

    - Run the migration.

    ```bash
    rails db:migrate
    ```

    > Running the migration commits the changes to the database. Therefore,
    > your changes are not reflected in the database unless migrated.

    - Execute the test suite and submit your changes when tests pass.

    ```bash
    rails test
    ```

<br/>

## Rolling Back Migrations

If the migration was incorrect (say wrong column names or datatype),
you can "undo" the migration by the following command:

```bash
rails db:rollback
```

Then, fix the migration file `db/migrations/<YYYYMMDDHHMMSS>_create_students.rb`
and re-run the migration to commit your changes to the dabase.

Read more about migrations at: [Running Migrations | Active Record Migrations](https://edgeguides.rubyonrails.org/active_record_migrations.html#rolling-back)

<br/>

## References
- [Rails Active Record Migration](https://guides.rubyonrails.org/active_record_migrations.html)
