# Set up environment variables
ENV['DEMO_ENV'] ||= 'development'

ENV['DEMO_DB'] ||= "db/#{ENV['DEMO_ENV']}.sqlite3"
