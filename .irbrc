require "irb"

class Object
  def interesting_methods
    case self.class
    when Class
      public_methods.sort - Object.public_methods
    when Module
      public_methods.sort - Module.public_methods
    else
      public_methods.sort - Object.new.public_methods
    end
  end
end

if defined? Rails
  env = Rails.env
  colored_env = if env.production?
    "\e[0;31m#{env}\e[m"
  else
    env
  end

  IRB.conf[:PROMPT] ||= {}
  IRB.conf[:PROMPT][:RAILS_APP] = {
    PROMPT_I: "clio[#{colored_env}]> ",
    PROMPT_N: nil,
    PROMPT_S: nil,
    PROMPT_C: nil,
    RETURN: "=> %s\n",
  }
  IRB.conf[:PROMPT_MODE] = :RAILS_APP
end
