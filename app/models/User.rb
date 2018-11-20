class User

  attr_accessor :id, :name, :age

  def save

    conn = User.open_connection

    if(!self.id)
      # Insert a new record in to the database
      sql = "INSERT INTO user (name , age) VALUES ( '#{self.name}', '#{self.age}')"
    else
      # Update an existing one
      sql = "UPDATE user SET name='#{self.name}', age='#{self.age}' WHERE id = #{self.id}"
    end

    conn.exec(sql)

  end

  def self.open_connection

    conn = PG.connect( dbname: "users" )

  end

  def self.all

    conn = self.open_connection

    sql = "SELECT id,name,age FROM user ORDER BY id"

    results = conn.exec(sql)

    # create an array of user objects
    users = results.map do |tuple|
      self.hydrate tuple
    end

    users

  end

  def self.find id

    conn = self.open_connection

    sql = "SELECT * FROM user WHERE id = #{id} LIMIT 1"

    # PG always returns an array
    users = conn.exec(sql)

    # bind just the first and return
    user = self.hydrate users[0]

    user

  end

  def self.destroy id

    conn = self.open_connection

    sql = "DELETE FROM user where id = #{id}"

    # handle delete here
    conn.exec(sql)

  end

  def self.hydrate user_data

    user = User.new

    user.id = user_data['id']
    user.name = user_data['name']
    user.age = user_data['age']

    user

  end

end
