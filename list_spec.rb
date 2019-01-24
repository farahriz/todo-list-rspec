require "rspec"
require "rspec-given"
require_relative "list"
require_relative "task"

describe List do
  Given(:title) {"Daily chores"} 
  Given(:empty_tasks) {[]}
  Given(:tasks) {[Task.new("Buy coffee beans")]}
  Given(:task) {Task.new("Do laundry")}
  Given(:sample_list) { List.new(title, tasks) }
  Given(:sample_list2) { List.new(title, [Task.new("Buy coffee beans"), task]) }

  describe "#initialize" do
  	context "takes a title and tasks for its arguments and makes list" do
      When (:output){List.new(title, tasks)}
      Then {expect(output).to be_a_kind_of(List)}
    end

    context "requires two arguments" do
      Then {expect(List).to respond_to(:new).with(2).arguments}
    end
  end #end of tests for #initialize



  describe "#add_task" do
  	context "takes one argument" do
  	  Then {expect(sample_list).to respond_to(:add_task).with(1).argument}
    end

    context "Pushes a new task into the tasks arrow" do
      When {sample_list.add_task(task)}
      Then {sample_list.tasks.include?(task) == true}
	end

	context "" do

	end

  end #end of tests for #add_task



  describe "#complete_task" do
  	context "takes in one argument" do
  	  Then {expect(sample_list).to respond_to(:complete_task).with(1).argument}
	end

	context "performs .complete! on the task at the index" do
	  When {sample_list.complete_task(0)}
	  Then {sample_list.tasks[0].complete? == true}
	end

  end #end of tests for #complete_task




  describe "#delete_task" do

  	context "takes in one argument" do
  	  Then {expect(sample_list).to respond_to(:delete_task).with(1).argument}
	end

	context "A deleted task is removed from the task array - 1 task" do
	  When {sample_list.delete_task(0)}
	  Then {sample_list.tasks.length == 0}
	end	

	context "A deleted task is removed from the task array - 2 tasks" do
	  When {sample_list2.delete_task(1)}
	  Then {sample_list.tasks.include?(task) == false}
	end	

  end #end of tests for #delete_task



  describe "#completed_tasks" do
  	context "All members of the completed_task array have complete == true" do
  	  When {sample_list.complete_task(0)}
  	  Then {sample_list.completed_tasks.length == 1}
  	end	
  end #end of tests for #completed_task



  describe "#incomplete_task" do
  	context "an incomplete task" do
  		Then {sample_list.incomplete_tasks.length == 1}
  	end


  end #end of tests for #incomplete_task  




end
