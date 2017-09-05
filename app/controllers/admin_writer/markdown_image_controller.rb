class AdminWriter::MarkdownImageController < AdminWriter::ApplicationController

  def create
    p params
    markdown_image = MarkdownImage.new(image: markdown_image_params[:image])
    if markdown_image.save
      result = { markdown_path: "![image](http:#{markdown_image.image.url})" }
    else
      result = false
    end
    p result
    render json: result
  end

  private
    def markdown_image_params
      params.require(:markdown_image).permit(:image)
    end
end
