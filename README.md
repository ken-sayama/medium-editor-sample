This repository is a sample of medium-editor running on Ruby on Rails.

## Configration

> I used [Cloudinary](https://cloudinary.com/) for image storage.
> If you want to try this sample, you need to get a Cloudinary account.



Add `.env` file.

You need set up `.env` like this

```
CLOUDINARY_CLOUD_NAME='your cloud name'
CLOUDINARY_API_KEY='your api key'
CLOUDINARY_API_SECRET='your api secret'
```

## Quick Start

```
$ bundle install

$ rails db:create

$ rails db:migrate

$ rails server
```

all done.