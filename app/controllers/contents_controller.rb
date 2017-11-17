class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  def index
    @contents = Content.all
  end

  def new
    @content = Content.new
  end

  # TODO: Break down into helper methods
  def create
    @content = Content.new(content_params)
    if @content.video_url !="" && @content.image_url !=""
      @content.sanitize_image_url
      @content.sanitize_video_url
    elsif @content.image_url !=""
      @content.sanitize_image_url
    elsif @content.video_url !=""
      @content.sanitize_video_url
    end

    if @content.save
      flash[:notice] = "Content was successfully created."
      redirect_to @content

    else
      flash[:notice] = "There was an error with your content, read the message below:"
      render :new
    end
  end

  def update
    respond_to do |format|
      if @content.update(content_params)
        @content.sanitize_image_url
        if @content.video_url !=""
          @content.sanitize_video_url
        end
        @content.save
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @content.destroy
  end

  private
    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:title, :image_url, :video_url, :rss_url)
    end
end
