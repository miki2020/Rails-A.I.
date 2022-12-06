require "decisiontree"



class DecisionGenerator

    def initialize(data_set)
        @data_set = data_set
        @dec_tree = DecisionTree::ID3Tree.new(@data_set[:attrs], @data_set[:train], 1, :discrete)
    end
    

    def train
        #binding.pry
        @dec_tree.train
    end

    def predict(test)
        puts " try to predict ..........................for #{@data_set[:test]}"
        @dec_tree.predict(test)
    end

end