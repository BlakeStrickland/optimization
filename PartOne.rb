1) Run rake db:seed. When it is finished, it will tell you how long the process took (in seconds). Record the amount of time.
  --5449.957537 seconds

2) Turn on your server and open your browser to localhost:3000. You will have to sort out which parameters you need to pass it.
  --1230034 ms

3) Open Chrome's timeline in developer tools, then hit Cmd-R on your keyboard. The timeline will track time to load the page. Record the following:
  Total time in Chrome's timeline -- 1187947 ms
  "Idle" time in Chrome's timeline
  The time given by Rails at the top of the page' -- 1186 seconds
  The time given by Rails at the bottom of the page (sorry for the long scroll) -- 1187 seconds
  Explain what these four numbers are and which are subsets of the others
    These numbers represent the combined time of active record hitting the database and the views rendering
    all the information on the page. I did not get the idle time but I can guess that its the time spent waiting
    for the servers response. The time at the top of the page is where the views started displaying and the
    time at the bottom is where it finished.

4) Add appropriate indices to the data structure (via migrations).
    add_index :sequences, :assembly_id
    add_index :hits, :subject_id
    add_index :genes, :sequence_id

5) Record how long it takes to run the migrations that add indices.
  .5581 seconds

6) Reload the root page and record the four time numbers again. Calculate your percent improvement in runtime.
  7833ms
  ------
  6.396341 seconds
  7.665539 seconds

  150 times faster

7) Examine the code that is run when the root path loads.
  Modify the controller commands which access the database to make them more efficient.
    -- no immideiate changes applied

8) Calculate your percent improvement in runtime.
  -- refer to #6

9) Once you have optimized your code as much as you think you can, drop the database, run rake db:migrate, and then time how long it takes to run rake db:seed.
    Was there an improvement or a worsening of runtime? By what percent and why?
  -- 2061.57932 seconds
    2.644 times faster that the original without indices. Adding the forgien keys made it so the tables could be referenced
    faster and more efficiently

10) Which is faster: (a) running rake db:seed without indices and then running a migration to add indices,
    or (b) adding indices during your initial rake db:migrate, then running rake db:seed?
  -- I would choose the ladder given the data represented above.
