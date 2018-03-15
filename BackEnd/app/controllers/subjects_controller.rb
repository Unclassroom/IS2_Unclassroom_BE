class SubjectsController < ApplicationController
    before_action :set_subjects, only: [:show, :update, :destroy]
    def index
        subjects = Subject.all
        render json: subjects
    end
    def show
       subjects = Subject.find(params[:id])
       render json: subjects
    end
    def create
        subject = Subject.new(subject_params)
        if subject.save
            render json: subject
        else
            render json: subject.errors
        end
    end
    def subject_params
        params.require(:subject).permit(:name)
    end
end
