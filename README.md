## Instructions so far

- `vagrant up` so far sets up and provisions the Sinatra **app** with the _environment/app/provision_ script
- It also sets up the PostgreSQL database, but I'm having trouble linking to it

##### To connect to Sinatra VM

`vagrant ssh app`

then

`cd /app`

##### To connect to PostgreSQL DB VM

`vagrant ssh db`

However, I have no idea how to connect the Sinatra App to the PostgreSQL DB
