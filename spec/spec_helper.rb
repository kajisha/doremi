$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'active_record'
require 'database_cleaner'
require 'doremi'
require 'pry'

require 'support/connection'
require 'support/models'
require 'support/database_cleaner'
