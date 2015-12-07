require "rspec"

require_relative "list"

describe List do
  
  let(:title) { "2015 Goals" }
  let(:tasks) { [Task.new("Be ninja coder"), Task.new("Sky dive"), Task.new("Bungee Jump")] }
  let(:list) { List.new(title, tasks) }

  describe '#initialize' do

  	context "with invalid inputs" do
  		it "should raise argument error" do
  			expect{List.new}.to raise_error(ArgumentError)
  		end
  	end

  	context "with valid inputs" do 
  		it "should create new list with inputs" do
  			expect(list).to be_an_instance_of List
  			expect(list.tasks).to match_array(tasks)
  		end
  	end

  end

  describe '#add_task' do

  	context "with invalid input" do
  		it "should raise argument error" do
  			expect{list.add_task}.to raise_error(ArgumentError)
  		end
  	end

  	context "with valid input" do
	  	it "should add task to list" do
	  		list.add_task("Complete this test")
	  		expect(list.tasks.last.description).to eq "Complete this test"
	  	end
	  end

  end

  describe '#complete_task' do

  	context "with valid input" do
	  	it "should change task.complete to true" do
	  		list.complete_task(0)
	  		expect(list.tasks[0].complete?).to be true
	  	end
	  end

	  context "with invalid input" do
	  	it "should raise error" do
	  		expect(list.complete_task(4)).to be false
	  		expect{list.complete_task}.to raise_error(ArgumentError)
	  		expect{list.complete_task("Eat cake")}.to raise_error(TypeError)
	  	end
	  end

  end

  describe '#delete_task' do

  	context "with invalid input" do
  		it "should raise error" do 
  			expect(list.delete_task(5)).to be false
  			expect{list.delete_task}.to raise_error(ArgumentError)
  			expect{list.delete_task("Eat Cake")}.to raise_error(TypeError)
  		end
  	end

  	context "with valid input" do
	  	it "should delete task from list" do
	  		expect(list.tasks.length).to eq 3
	  		list.delete_task(0)
	  		expect(list.tasks.length).to eq 2
	  	end
	  end

  end

  describe '#completed_tasks' do
  	it "should return list of completed tasks" do
  		expect(list.completed_tasks.length).to eq 0
  		list.complete_task(0)
  		list.complete_task(1)
  		expect(list.completed_tasks.length).to eq 2
  	end
  end

  describe '#incomplete_tasks' do
  	it "should return list of incomplete tasks" do
  	  expect(list.incomplete_tasks.length).to eq 3
  		list.complete_task(0)
  		list.complete_task(1)
  		expect(list.incomplete_tasks.length).to eq 1
  	end
  end
end