require 'rails_helper'
require "cancan/matchers"

RSpec.describe User, :type => :model do

  describe "abilities" do

    context "Admin" do

      it "should be able to manage all." do
        @admin = FactoryGirl.build(:user, :admin)
        @ability = Ability.new(@admin)
        expect(@ability).to be_able_to(:manage, :all)
      end

    end

    context "manager" do

      before do
        @manager = FactoryGirl.build(:user, :manager)
        @ability = Ability.new(@manager)
      end

      it "should be able to manage hospitals." do
        expect(@ability).to be_able_to(:manage, Hospital.new)
      end

      it "should only be able to create hospitals verification requests" do
        expect(@ability).not_to be_able_to(:destroy, HospitalVerificationRequest.new)
        expect(@ability).not_to be_able_to(:update, HospitalVerificationRequest.new)
        expect(@ability).to be_able_to(:create, HospitalVerificationRequest.new)
      end

      it "should not be able to manage Questions" do
        %i[create read update destroy].each do |role|
          expect(@ability).not_to be_able_to(role, Question.new)
        end
      end

      it "should not be able to manage Answer" do
        %i[create read update destroy].each do |role|
          expect(@ability).not_to be_able_to(role, Answer.new)
        end
      end

      it "should not be able to manage AnswerLikes" do
        %i[create read update destroy].each do |role|
          expect(@ability).not_to be_able_to(role, AnswerLike.new)
        end
      end

      it "should not be able to manage DoctorLikes" do
        %i[create read update destroy].each do |role|
          expect(@ability).not_to be_able_to(role, DoctorLike.new)
        end
      end

      it "should not be able to manage HospitalLike" do
        %i[create read update destroy].each do |role|
          expect(@ability).not_to be_able_to(role, HospitalLike.new)
        end
      end

      it "should not be able to manage Follow" do
        %i[create read update destroy].each do |role|
          expect(@ability).not_to be_able_to(role, Follow.new)
        end
      end

      it "should not be able to manage Review" do
        %i[create read update destroy].each do |role|
          expect(@ability).not_to be_able_to(role, Review.new)
        end
      end

      it "should not be able to manage Article" do
        %i[create read update destroy].each do |role|
          expect(@ability).not_to be_able_to(role, Article.new)
        end
      end

    end

    context "doctor" do

      before do
        @doctor = FactoryGirl.build(:user, :doctor)
        @ability = Ability.new(@doctor)
      end

      it "should not be able to manage hospitals." do
        expect(@ability).not_to be_able_to(:read, Hospital.new)
        expect(@ability).not_to be_able_to(:create, Hospital.new)
        expect(@ability).not_to be_able_to(:update, Hospital.new)
        expect(@ability).not_to be_able_to(:destroy, Hospital.new)
      end

      it "should not be able to manage hospitals verification requests" do
        expect(@ability).not_to be_able_to(:destroy, HospitalVerificationRequest.new)
        expect(@ability).not_to be_able_to(:update, HospitalVerificationRequest.new)
        expect(@ability).not_to be_able_to(:create, HospitalVerificationRequest.new)
        expect(@ability).not_to be_able_to(:read, HospitalVerificationRequest.new)
      end

      it "should only be able to read Questions" do
        expect(@ability).not_to be_able_to(:create, Question.new)
        expect(@ability).to be_able_to(:read, Question.new)
        expect(@ability).not_to be_able_to(:update, Question.new)
        expect(@ability).not_to be_able_to(:destroy, Question.new)
      end

      it "should be able to manage Answer" do
        expect(@ability).to be_able_to(:create, Answer.new)
        expect(@ability).to be_able_to(:read, Answer.new)
        expect(@ability).to be_able_to(:update, Answer.new)
        expect(@ability).to be_able_to(:destroy, Answer.new)
      end

      it "should not be able to manage AnswerLikes" do
        expect(@ability).not_to be_able_to(:create, AnswerLike.new)
        expect(@ability).not_to be_able_to(:read, AnswerLike.new)
        expect(@ability).not_to be_able_to(:update, AnswerLike.new)
        expect(@ability).not_to be_able_to(:destroy, AnswerLike.new)
      end

      it "should not be able to manage DoctorLikes" do
        expect(@ability).not_to be_able_to(:create, DoctorLike.new)
        expect(@ability).not_to be_able_to(:read, DoctorLike.new)
        expect(@ability).not_to be_able_to(:update, DoctorLike.new)
        expect(@ability).not_to be_able_to(:destroy, DoctorLike.new)
      end

      it "should not be able to manage HospitalLike" do
        expect(@ability).not_to be_able_to(:create, HospitalLike.new)
        expect(@ability).not_to be_able_to(:read, HospitalLike.new)
        expect(@ability).not_to be_able_to(:update, HospitalLike.new)
        expect(@ability).not_to be_able_to(:destroy, HospitalLike.new)
      end

      it "should be able to manage Follow" do
        expect(@ability).to be_able_to(:create, Follow.new)
        expect(@ability).to be_able_to(:read, Follow.new)
        expect(@ability).to be_able_to(:update, Follow.new)
        expect(@ability).to be_able_to(:destroy, Follow.new)
      end

      it "should not be able to manage Review" do
        expect(@ability).not_to be_able_to(:create, Review.new)
        expect(@ability).not_to be_able_to(:read, Review.new)
        expect(@ability).not_to be_able_to(:update, Review.new)
        expect(@ability).not_to be_able_to(:destroy, Review.new)
      end

      it "should be able to manage Article" do
        expect(@ability).to be_able_to(:create, Article.new)
        expect(@ability).to be_able_to(:read, Article.new)
        expect(@ability).to be_able_to(:update, Article.new)
        expect(@ability).to be_able_to(:destroy, Article.new)
      end

    end

    context "client/user" do

      before do
        @client = FactoryGirl.build(:user, :client)
        @ability = Ability.new(@client)
      end

      it "should be able to read all" do
        expect(@ability).to be_able_to(:read, :all)
      end

      it "should only be able to read hospitals." do
        expect(@ability).not_to be_able_to(:create, Hospital.new)
        expect(@ability).not_to be_able_to(:update, Hospital.new)
        expect(@ability).not_to be_able_to(:destroy, Hospital.new)
      end

      it "should only be able to read hospitals verification requests" do
        expect(@ability).not_to be_able_to(:destroy, HospitalVerificationRequest.new)
        expect(@ability).not_to be_able_to(:update, HospitalVerificationRequest.new)
        expect(@ability).not_to be_able_to(:create, HospitalVerificationRequest.new)
      end

      it "should be able to manage Questions" do
        expect(@ability).to be_able_to(:create, Question.new)
        expect(@ability).to be_able_to(:read, Question.new)
        expect(@ability).to be_able_to(:update, Question.new)
        expect(@ability).to be_able_to(:destroy, Question.new)
      end

      it "should only be able to read Answer" do
        expect(@ability).not_to be_able_to(:create, Answer.new)
        expect(@ability).not_to be_able_to(:update, Answer.new)
        expect(@ability).not_to be_able_to(:destroy, Answer.new)
      end

      it "should be able to manage AnswerLikes" do
        expect(@ability).to be_able_to(:create, AnswerLike.new)
        expect(@ability).to be_able_to(:read, AnswerLike.new)
        expect(@ability).to be_able_to(:update, AnswerLike.new)
        expect(@ability).to be_able_to(:destroy, AnswerLike.new)
      end

      it "should be able to manage DoctorLikes" do
        expect(@ability).to be_able_to(:create, DoctorLike.new)
        expect(@ability).to be_able_to(:read, DoctorLike.new)
        expect(@ability).to be_able_to(:update, DoctorLike.new)
        expect(@ability).to be_able_to(:destroy, DoctorLike.new)
      end

      it "should be able to manage HospitalLike" do
        expect(@ability).to be_able_to(:create, HospitalLike.new)
        expect(@ability).to be_able_to(:read, HospitalLike.new)
        expect(@ability).to be_able_to(:update, HospitalLike.new)
        expect(@ability).to be_able_to(:destroy, HospitalLike.new)
      end

      it "should be able to manage Follow" do
        expect(@ability).to be_able_to(:create, Follow.new)
        expect(@ability).to be_able_to(:read, Follow.new)
        expect(@ability).to be_able_to(:update, Follow.new)
        expect(@ability).to be_able_to(:destroy, Follow.new)
      end

      it "should be able to manage Review" do
        expect(@ability).to be_able_to(:create, Review.new)
        expect(@ability).to be_able_to(:read, Review.new)
        expect(@ability).to be_able_to(:update, Review.new)
        expect(@ability).to be_able_to(:destroy, Review.new)
      end

      it "should only be able to read Article" do
        expect(@ability).not_to be_able_to(:create, Article.new)
        expect(@ability).not_to be_able_to(:update, Article.new)
        expect(@ability).not_to be_able_to(:destroy, Article.new)
      end
    end

  end
end
