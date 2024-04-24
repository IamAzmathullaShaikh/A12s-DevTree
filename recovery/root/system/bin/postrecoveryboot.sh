#!/system/bin/sh

[ -f /sbin/from_fox_sd.sh ] && source /sbin/from_fox_sd.sh

gzip -d /system/lib64/libiconv.so.gz
gzip -d /system/lib64/libandroid-support.so.gz
gzip -d /system/lib64/libgmp.so.gz

export LD_LIBRARY_PATH=/system/lib64/

coreutils_dir="/system/bin"
target_dir="/system/bin/"
coreutils_programs="b2sum base32 base64 basename basenc cat chcon chgrp chmod chown chroot cksum comm cp csplit cut date dd dir dircolors dirname du echo env expand expr factor false fmt fold ginstall groups head id join kill link ln logname ls md5sum mkdir mkfifo mknod mktemp mv nice nl nohup nproc numfmt od paste pathchk pr printenv printf ptx pwd readlink realpath rm rmdir runcon seq sha1sum sha224sum sha256sum sha384sum sha512sum shred shuf sleep sort split stat stdbuf stty sum sync tac tail tee test timeout touch tr true truncate tsort tty uname unexpand uniq unlink vdir wc whoami yes"

IFS=' ' read -ra programs <<< "$coreutils_programs"

for program in "${programs[@]}"; do
    target_path="$target_dir$program"
    if [ -e "$target_path" ]; then
        /system/bin/coreutils --coreutils-prog=rm -rf "$target_path"
    fi
    /system/bin/coreutils --coreutils-prog=ln "$coreutils_dir/coreutils" "$target_path"
done

exit 0
