class ImagesController < ApplicationController
  def upload
    files = params.require(:files)

    @image = Image.new
    @image.file = files[0]

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json do
          binding.pry
          render json: {
            files:
              [
                {
                  url: @image.file.url,
                  thumbnail_url: @image.file.url,
                  name: @image.file_identifier,
                  type: "image/jpeg",
                  size: 0,
                  delete_url: "/images/#{@image.original_filename}",
                  delete_type: "DELETE"
                }
              ]
          }
        end
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    binding.pry
  end
end
