#!/usr/bin/env python

import subprocess
import time
import re

 
if __name__ == '__main__':

	cmd = "/bin/bash"
#	cmd1 = "ssh --help"
#	cmd1 = '/usr/bin/ssh localhost vmstat 2 > ~/work/ttt 2>&1 &'
	cmd1 = '/usr/bin/ssh localhost vmstat 2'


	p = subprocess.Popen(cmd, shell=True, stdin=subprocess.PIPE,
		stdout=subprocess.PIPE, stderr=subprocess.STDOUT, cwd="/tmp")

	p1 = subprocess.Popen(cmd1, shell=True, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)


	p.stdin.write('pwd\n')
	print p.stdout.readline()

#	for str in p1.stdout.readlines(): print str
	str1 = p1.stdout.readline()
	while ( str1 ): 
		procs_str = str1.split()[0]

		if ( procs_str == "2" ):
			p.stdin.write("cd ~; pwd\n")
			print "p1 >>>" + str1 + "p: " + p.stdout.readline()

		if ( procs_str == "3" ):
			p.stdin.write("cd /tmp; pwd\n")
			print "p1 >>>" + str1 + "p: " + p.stdout.readline()

		if ( procs_str == "4" ):
			print "p1 >>>" + str1
			p.kill()
			p1.kill()
			break

		str1 = p1.stdout.readline()





