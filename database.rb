require 'mysql2'
require 'connection_pool'

$database = ConnectionPool.new(size: 5, timeout: 5) {
  Mysql2::Client.new(
    :host => "",
    :database => "",
    :username => "",
    :password => "",
    :reconnect => true,
    :encoding => 'utf8mb4'
  )
}

module Database

  def self.user_by_id(user_id)
    $database.with do |db|
      results = db.query("SELECT * FROM users WHERE user_id='#{user_id.to_i}' LIMIT 1").to_a
      return nil if results.count == 0
      return results[0]
    end
  end

  def self.user_exists(user_id)
    $database.with do |db|
      results = db.query("SELECT * FROM users WHERE user_id='#{user_id.to_i}' LIMIT 1").to_a
      return (results.count > 0) ? true : false
    end
  end

  def self.user_create(user_id)
    $database.with do |db|
      db.query("INSERT INTO users (user_id, created_at) VALUES ('#{user_id.to_i}',NOW())")
    end
  end

  def self.user_set_name(user_id, username)
    $database.with do |db|
      db.query("UPDATE users SET username='#{db.escape(username)}' WHERE user_id='#{user_id.to_i}'")
    end
  end

end
