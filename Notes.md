# Review

## Running it

1.  Validations: you should validate that the email I'm submitting is actually
an email
1.  Looks like all the pieces are there
1.  Pretty minimal styling :-/
1.  What's that top number about? I've added a number of posts but it's only
set to '1' ?

## Code

1. Migrations look good, really nice.   Dont' forget that references might need
to be guarded against NULL

Check out;

    grapefruit_news_development=# insert into post_votes (user_id, post_id, vote)
    VALUES (1,1,false);
    INSERT 0 1
    grapefruit_news_development=# select * from post_votes;
    id | user_id | post_id | vote
    ----+---------+---------+------
    1 |       1 |       1 | f
    (1 row)

Ruh roh!

## Overall

Code looked pretty solid.  That join model thing I think is pretty weird.  Also
you're storing important stuff in the view so that you can get those data back
during the POST action.  That shouldn't be needed.

Take a look at the in-line comments. Grab me for further clarification if
needed.
