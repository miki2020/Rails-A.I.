      require "csv"

class InputCreator
    def initialize(csv_file)
        @csv_file = csv_file
    end

    def create_dataset(test_size:2)

      result = {}
      
      @csv_file.open do |f|
        result = CSV.parse(f, :headers => true, quote_char: "\'").to_a
        
        
      end if @csv_file.attached? && @csv_file.content_type === "text/csv"
       
      header = result.shift

      result = result.map{|row| row << row.pop.to_i}
      header&.pop()
      
      
      # [0]
      puts "header =================="
      pp header
      #train_to_test_ratio = 0.8
      # train_size = result.size
      test = result.pop(test_size)
      {attrs: header, train: result, test: test}

    end

    
end
