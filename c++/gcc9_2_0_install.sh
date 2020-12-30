#centos
#1.下载压缩包
wget http://mirror.hust.edu.cn/gnu/gcc/gcc-9.2.0/gcc-9.2.0.tar.gz
tar -zxvf gcc-9.2.0.tar.gz
cd gcc-9.2.0

#2.安装依赖
yum install -y gcc
yum install -y gcc-c++
yum install -y automake
#(1)下载依赖库包
./contrib/download_prerequisites
#(2)安装gmp
#tar -jxvf gmp-6.1.0.tar.bz2
#cd gmp-6.1.0
#./configure --prefix=/usr/local/gmp
#make -j12
#make check -j12
#make install -j12
#cd ../
#(3)安装mpfr
#tar -jxvf mpfr-3.1.4.tar.bz2
#cd mpfr-3.1.4
#./configure --prefix=/usr/local/mpfr --with-gmp=/usr/local/gmp/
#make -j12
#make check -j12
#make install -j12
#cd ../
#(4)安装mpc
#tar -zxvf mpc-1.0.3.tar.gz
#cd mpc-1.0.3
#./configure --prefix=/usr/local/mpc --with-gmp=/usr/local/gmp/ --with-mpfr=/usr/local/mpfr/
#make -j12
#make check -j12
#make install -j12
#cd ../
#(5)安装isl
#tar -jxvf isl-0.18.tar.bz2
#cd isl-0.18
#./configure --prefix=/usr/local/isl
#make -j12
#make check -j12
#make install -j12
#cd ../

#3.添加依赖库到LD_LIBRARY_PATH
#vim ~/.bashrc
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/mpc/lib:/usr/local/gmp/lib:/usr/local/mpfr/lib/:/usr/local/isl/lib
#source ~/.bashrc

#4.安装gcc
rm -rf build
mkdir build
cd build
../configure --prefix=/usr/local/gcc --disable-multilib  --enable-languages=c,c++ --enable-checking=release
#--with-system-zlib --with-gmp=/usr/local/gmp --with-mpfr=/usr/local/mpfr --with-mpc=/usr/local/mpc --with-isl=/usr/local/isl
make -j12 > /dev/null
make check -j12
make install -j12

#5.安装路径添加到环境变量
echo  "export PATH=/usr/local/gcc/bin:$PATH" >> /etc/profile.d/gcc.sh
source /etc/profile.d/gcc.sh
gcc -v
