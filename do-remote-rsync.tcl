#
# do-remote-rsync.tcl
#

source common.tcl

set remote_host			"192.168.1.99"
set remote_dir			"/mnt/topdir_rsync"

set rsync_conf			{

use chroot = no

uid = root
gid = root

[public]

path = $remote_dir

read only = false

comment = dedicated directory for rsync upload

}

set rsync_conf		[subst -nobackslashes -nocommands $rsync_conf ]

set CUR_DIR			[pwd]

@file $rsync_conf >> "$CUR_DIR/rsyncd.conf"

#
# rsync.exe 无法处理中文文件名：Perl Core Modules 源代码分析.pdf
#

catch {

	exec C:/bin/pscp.exe -l root -pw billy123 $CUR_DIR/rsyncd.conf $remote_host:/tmp
} result

puts $result

#
# then start Rsync daemon
#

catch {

	exec C:/bin/plink.exe -batch -l root -pw billy123 $remote_host /usr/bin/rsync --daemon --port=873 --config=/tmp/rsyncd.conf
} result

puts $result

#
# do the real job here ...
#
set rsync_tool			"C:/Program Files (x86)/cwRsync/bin/rsync.exe"

proc to_cygwin_path { _path } {

	set _path			[file normalize $_path]
	
	regexp {^(\w):/(.+)$} $_path _x _drive _path

	set _drive			[string tolower $_drive]
	
	return "/cygdrive/$_drive/$_path"
}

catch {

	set _path			[to_cygwin_path "$CUR_DIR/tmp" ]
	
	# puts "$rsync_tool -v -a rsync://$remote_host/public/TO-iPad $_path/ "
	# exec $rsync_tool -v -a  rsync://$remote_host/public/TO-iPad "$_path/"
	
	exec $rsync_tool -v -a  rsync://$remote_host/public/debian-tools/ [to_cygwin_path "D:/my/debian-tools-OFFICE/"]
	
} result

puts $result








