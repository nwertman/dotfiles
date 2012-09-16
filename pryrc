require 'rubygems'
require 'pry-doc'

Pry.config.editor = 'vim'

# http://stackoverflow.com/questions/7798795/how-to-adjust-pry-colors
CodeRay.scan("example", :ruby).term # just to load necessary files

TERM_TOKEN_COLORS = {
    :symbol => '1;31', # will make symbols bolded and light red on my terminal

    # 'Blue' (1;34) doesn't show up well on a gray background.  Change all the blue values to something else
    :char => {:self => '36', :delimiter => '1;36'},
    :complex => '1;36',
    :constant => ['1;31', '4'],
    :function => '1;36',
    :integer => '1;36',
    :predefined => ['4', '1;36'],
    :pseudo_class => '1;36',
    :tag => '1;36',
    :type => '1;36',
    :variable => '1;36',
}

module CodeRay
    module Encoders
        class Terminal < Encoder
            # override old colors
            TERM_TOKEN_COLORS.each_pair do |key, value|
                TOKEN_COLORS[key] = value
            end
        end
    end
end

# Load in confidential work stuff
load File.expand_path("~/.pryrc_work")
