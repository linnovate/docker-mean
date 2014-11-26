##
# Gitlab CI Runner with NodeJS MongoDB Redis
#
# This creates an image which contains an Gitlab CI Runner environment
# for NodeJS app ecosystem
# - Node.js 0.10.23
# - MongoDB 2.4.8
# - Redis 2.4.15
# - Git
##

FROM truongsinh/nodejs-mongodb-redis

MAINTAINER TruongSinh Tran-Nguyen &lt;i@truongsinh.pro&gt;

# Config
ENV INSTALL_RUBY_VERSION 2.0.0-p247

ENV HOME /root

WORKDIR /root

# apt-get build deps, to be removed later
RUN apt-get -y update \
 &amp;&amp; apt-get -y install build-essential wget unzip libssl-dev

# This is neccesary at runtime.
RUN apt-get -y install openssh-client git libicu-dev

# install ruby, bundler, and clean up
RUN wget http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p353.tar.gz \
 &amp;&amp; tar -xvzf ruby-2.0.0-p353.tar.gz \
 &amp;&amp; cd ruby-2.0.0-p353/ \
 &amp;&amp; ./configure --prefix=/usr/local --disable-install-rdoc \
 &amp;&amp; make &amp;&amp; make install \
 &amp;&amp; cd .. \
 &amp;&amp; rm -rf ruby-2.0.0-p353*


# install gitlab-ci-runner

RUN wget --no-check-certificate https://github.com/gitlabhq/gitlab-ci-runner/archive/master.zip \
 &amp;&amp; unzip master.zip \
 &amp;&amp; rm -rf master.zip \
 &amp;&amp; cd gitlab-ci-runner-master \
 &amp;&amp; gem install bundler \
 &amp;&amp; bundle install

# prepare SSH
RUN mkdir -p /root/.ssh

# Clean up
RUN apt-get -y purge build-essential wget unzip libssl-dev \
 &amp;&amp; apt-get -y autoremove

# Start MongoDB, Redis and Runner
CMD mongod --fork -f /etc/mongodb.conf \
 &amp;&amp; redis-server /etc/redis/redis.conf \
 &amp;&amp; cd $HOME/gitlab-ci-runner-master &amp;&amp; ssh-keyscan -H $GITLAB_SERVER_FQDN &gt;&gt; $HOME/.ssh/known_hosts &amp;&amp; bundle exec ./bin/setup_and_run



