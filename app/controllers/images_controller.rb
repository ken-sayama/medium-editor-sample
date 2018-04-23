class ImagesController < ApplicationController
  def upload
    files = params.require(:files)

    @image = Image.new
    @image.file = files[0]
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json do
          render json: {
            files:
              [
                {
                  url: @image.file.metadata['url']+"?id=#{@image.file.model.id}",
                  thumbnail_url: @image.file.metadata['url']+"?id=#{@image.file.model.id}",
                  size: 0,
                  delete_url: "/images/delete",
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
    file = params.require(:file)
    split_file = file.split('/')
    tmp = split_file[-1].split('.')
    filename = tmp[0]

    url = URI.parse(file)
    url = Rack::Utils.parse_nested_query(url.query)
    id = url['id']

    Cloudinary::Api.delete_resources(filename)
    Image.destroy(id)
    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
