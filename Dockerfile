FROM ruby:2.2-onbuild

RUN apt-get update
RUN apt-get install -y python-pip && pip install awscli

CMD ["/bin/sh", "-c", "aws s3 cp --region eu-west-1 s3://mydrive-infrastructure/config/janky/env.sh .; . ./env.sh; bundle exec thin start -p 5001"]

