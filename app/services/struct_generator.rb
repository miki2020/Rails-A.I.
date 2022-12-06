class StructGenerator
    def initialize(name: "Entry", members: [:a1] )  
       @name = name
       @members = members
    end

    def generate
        return if Object.const_defined?(@name)
        @name.constantize = Struct.new(*@members)
    end
end