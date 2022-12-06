class DatasetBuilderJob < ApplicationJob
  queue_as :builders

  def perform(*args)
    reading = args.first
    data_set = InputCreator.new(reading.csv_file).create_dataset
    test_set = data_set[:test]


    dg = DecisionGenerator.new(data_set)
    dg.train
    puts "from job Decision Tree--------->"
    puts dg
    reading.title = ''
    test_set.each do |test|
      pred = dg.predict(test)
      out = "for #{test} ------> predict is: #{pred}\n"

      puts pred

      reading.title += out
      reading.reports.create(test_data:"#{test}", predict:"#{pred}")
    end
    # puts "::::::::predicted #{dg.predict(data_set[:test])}"
    reading.save!
    #InputCreator.new(reading.csv_file).create_dataset
    # Do something later
  end
end
