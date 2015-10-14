From hernad/precise-i386

MAINTAINER bjasko@bring.out.ba

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y

RUN apt-get -y install ruby1.9.1 ruby1.9.1-dev  rubygems1.9.1 irb1.9.1 ri1.9.1 rdoc1.9.1   libopenssl-ruby1.9.1 libssl-dev 


CMD /root/ruby/analyze_drb.rb ; /root/ruby/starter.rb
