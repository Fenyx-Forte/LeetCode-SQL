/*
- Table
. Salary
id (int)
name (varchar)
sex (ENUM)
salary (int)

- Question
. Write a solution to swap all 'f' and 'm' values (i.e., change all 'f' values
to 'm' and vice versa) with a single update statement and no intermediate
temporary tables.
*/
update
  salary
set
  sex = 
    case sex
      when "m" 
        then "f"
      else
        "m"
    end;