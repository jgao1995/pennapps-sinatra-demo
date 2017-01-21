require 'sinatra'
require 'json'
require 'active_record'


require_relative 'environment'
require_relative 'database'

class Article < ActiveRecord::Base
end

require 'sqlite3'
SQLite3::Database.new ENV['DEMO_DB']
require_relative 'database'
ActiveRecord::Tasks::DatabaseTasks.migrate


get '/' do
  'Hello World!'
end

get '/posts' do
  'This is another page...'
end

post '/postName' do
  'do something'
end

get '/test.json' do
  content_type :json
  return {:students => ["joseph", "justin", "minsu", "jackie"]}.to_json
end

get '/calculate/:val1/:val2' do
  content_type :json
  val1 = params[:val1]
  val2 = params[:val2]
  sum = val1.to_f + val2.to_f
  return {:res => sum}.to_json
end

get '/article/new' do
  Article.create(title: "Test")
end

get '/query_db' do
  content_type :json
  return {:content => Article.all}.to_json
end

