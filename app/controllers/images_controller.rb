class ImagesController < ApplicationController
  def upload
    files = params.require(:files)

    @image = Image.new
    @image.file = files[0]
    binding.pry
    respond_to do |format|
      if @image.save
        binding.pry
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json do
          render json: {
            files:
              [
                {
                  url: @image.file.url,
                  thumbnail_url: @image.file.url,
                  name: @image.file.filename,
                  type: "image/jpeg",
                  size: 0,
                  delete_url: "/images/delete",
                  delete_type: "DELETE"
                }
              ]
          }
        end
        binding.pry
      else
        binding.pry
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    file = params.require(:file)
    id = file.match(/http:\/\/localhost:3000\/uploads\/image\/file\/(.+?)\//)
    Image.destroy(id[1])
    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
