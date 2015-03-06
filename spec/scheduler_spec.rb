require "spec_helper"

class TestJob
  def perform;end
end

describe Crono::Scheduler do
  before(:each) do
    @scheduler = Crono::Scheduler.new
    @jobs = [
      Crono::Period.new(3.day, at: "18:55"),
      Crono::Period.new(1.day, at: "15:30"),
      Crono::Period.new(7.day, at: "06:05")
    ].map { |period| Crono::Job.new(TestJob, period) }
    @scheduler.jobs = @jobs
  end

  describe "#next" do
    it "should return next job in schedule" do
      expect(@scheduler.next).to be @jobs[1]
    end

    it "should return next based on last" do
      expect(@scheduler.next)
    end
  end
end