module Aurangband

  class Item

    attr_reader :name, :article, :description, :char

    ITEMS = [
      { article: "an",
        name: "emerald",
        description: "a glowing green jewel"
      },
      { article: "a",
        name: "ruby",
        description: "a brilliant red jewel"
      },
      { article: "a",
        name: "sapphire",
        description: "a lustrous blue jewel"
      },
      { article: "a",
        name: "citrine",
        description: "a deep yellow jewel"
      },
      { article: "an",
        name: "amethyst",
        description: "a luminescent purple jewel"
      }
    ]

    def initialize
      item = ITEMS.sample
      @name = item[:name]
      @article = item[:article]
      @description = item[:description]
      @char = "*"
    end

    def get_description
      puts "The #{@name} is #{@description}."
    end
  end

end
