#!/bin/sh

if [ ! -e ~/.ssh/id_rsa.pub ]
then
    echo "creating RSA key-pair"
    ssh-keygen -t rsa
    cat ~/.ssh/id_rsa.pub
fi

TERMINATOR_EXISTS=`which terminator`

if [ $? == 1 ]
then
    echo "fetching rpmforge and installing terminator"
    wget http://apt.sw.be/redhat/el6/en/i386/rpmforge/RPMS/rpmforge-release-0.5.3-1.el6.rf.i686.rpm
    sudo rpm -Uvh rpmforge-release-0.5.3-1.el6.rf.i686.rpm
    sudo yum install terminator
fi

PERLTIDY_EXISTS=`which perltidy`

if [ $? == 1 ]
then
    echo "installing perltidy"
    sudo yum install perltidy
fi


if [ ! -e /etc/yum.repos.d/chromium-el6.repo ]
then
    echo "installing chrome"
    cd /etc/yum.repos.d
    sudo wget http://people.centos.org/hughesjr/chromium/6/chromium-el6.repo
    sudo yum install chromium
fi

# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install Lucius
cd ~/.vim/bundle && \
git clone https://github.com/jonathanfilip/vim-lucius.git

if [ ! -e ~/.vimrc ]
then
    echo "setting up minimal ~/.vimrc"
    touch ~/.vimrc
    echo "set expandtab" > ~/.vimrc
    echo "set tabstop=4" >> ~/.vimrc
    echo "set shiftwidth=4" >> ~/.vimrc
    echo "set encoding=utf8" >> ~/.vimrc
    echo "syntax enable" >> ~/.vimrc
    echo "map ,pt <ESC>:%! perltidy -bl -sbl -pt=1 -sbt=1 -bvt=1 -asbl -nolc -nolq -l=90 -q<CR>" >> ~/.vimrc
    echo "map ,ptv <ESC>:'<,'>! perltidy -bl -sbl -pt=1 -sbt=1 -bvt=1 -asbl -nolc -nolq -l=90 -q<CR>" >> ~/.vimrc
    echo "noremap ,t :!prove -lv --merge -I/jobsite/t/lib %<CR>" >> ~/.vimrc
    echo "filetype plugin indent on" >> ~/.vimrc
    echo "set laststatus=2" >> ~/.vimrc
    echo "set t_Co=256" >> ~/.vimrc
    echo "execute pathogen#infect()" >> ~/.vimrc
    echo "colorscheme lucius" >> ~/.vimrc
    echo "LuciusBlack" >> ~/.vimrc
fi

echo "setting up .bashrc"
echo "alias updatepc='http_proxy='http://10.10.10.200:8080' PERL5LIB= cpanm --verbose --cpanfile=/opt/jscore/build/conf/cpanfile --local-lib=/opt/jsperlcore/ --installdeps /opt/jscore/build/conf/'" >> ~/.bashrc
echo "function perlmodver {" >> ~/.bashrc
echo "    perl -M$1 -e 'print "Version " . $ARGV[0]->VERSION . " of " . $ARGV[0] . is installed\n' $1" >> ~/.bashrc
echo "}" >> ~/.bashrc
