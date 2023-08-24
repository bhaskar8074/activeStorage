class DocumentsController < ApplicationController

    def index
        @documents = Document.all
    end
    def new
        @document = Document.new
    end

    def create
        @document = Document.new(document_params)
        if @document.save
          redirect_to @document
        else
          render 'new' , status: 422
        end
    end

    def show
        @document = Document.find(params[:id])
      end

    def document_params
        params.require(:document).permit(:title, :pdf_file)
    end
end
