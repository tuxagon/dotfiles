require 'irb'
require 'rubygems'
require 'awesome_print'

IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = '~/.irb-history'
IRB.conf[:AUTO_INDENT] = true

AwesomePrint.irb!

if Object.const_defined?('Rails')
  db_host = Rails.configuration.database_configuration[Rails.env]['host']
  db_host ? (puts "\e[31m########### CONNECTED TO REMOTE ###########\e[0m") : (puts "\e[32m########### CONNECTED TO LOCAL ###########\e[0m")
end

class Object
  def interesting_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end
