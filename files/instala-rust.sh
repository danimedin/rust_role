#!/bin/sh
cd /root
source /etc/profile.d/10rust-profile.sh
apkArch="$(apk --print-arch)"; 
case "$apkArch" in 
    x86_64) rustArch='x86_64-unknown-linux-musl'; rustupSha256='1455d1df3825c5f24ba06d9dd1c7052908272a2cae9aa749ea49d67acbe22b47' ;; 
    aarch64) rustArch='aarch64-unknown-linux-musl'; rustupSha256='7087ada906cd27a00c8e0323401a46804a03a742bd07811da6dead016617cc64' ;; 
    *) echo >&2 "unsupported architecture: $apkArch"; exit 1 ;; 
esac; 
url="https://static.rust-lang.org/rustup/archive/1.27.1/${rustArch}/rustup-init"; 

wget "$url"; 
echo "${rustupSha256} *rustup-init" | sha256sum -c -; 
chmod +x rustup-init; 
echo RUST_VERSION=$RUST_VERSION
./rustup-init -y --no-modify-path --profile minimal --default-toolchain $RUST_VERSION --default-host ${rustArch}; 
rm rustup-init; 
chmod -R a+w $RUSTUP_HOME $CARGO_HOME; 
rustup --version; 
cargo --version; 
rustc --version;