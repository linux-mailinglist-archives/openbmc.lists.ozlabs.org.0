Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 248E8BBD43
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 22:48:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cbxb4Q1TzDqKw
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 06:48:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=embeddedsteve@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="U5NHyHyD"; 
 dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cbwR5z7czDqHd
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 06:47:00 +1000 (AEST)
Received: by mail-oi1-x22f.google.com with SMTP id w144so8867790oia.6
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 13:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=QqFZsj/7nnKVZdE2ok8Jq6uakBHxLfzibLVJKTe5/u8=;
 b=U5NHyHyDAA64IqWi4dSfApbbG4XDzvgLo65Ng4CKstl3p8HBaeOzIDe+A7fi1fbvf/
 JmnIoHbiZe8Hyrlgc5iT0myxfeS0NGoFIFJibUoTsqYQQbMHvW/9VUeVtzoV7eailEPp
 Tkl/eDUAIbJOIaofW2xqtX8Fr45R0xLTJa+BQ0lrXEqlETBT3EXXJ0PTf3AfxxDLaFKa
 4fOBol0rG72vm1M6crg+Hh3fJzSCPbVoHHg8/unKh02GszHOmU+OxXHFBjovFx0sx+b5
 9xdpaW2sevGq6dERsz/k6bBKZli+OzPqdv4qoqyfbQSS30VXPEuNED2KVB0W4kr1aWOt
 XVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QqFZsj/7nnKVZdE2ok8Jq6uakBHxLfzibLVJKTe5/u8=;
 b=C/SM3qX/gGmr6caf0CHKqeBBwSFfYJaDm1lRlwn12cdscfqKaQSe2NVeh4PSVJHAXj
 jinmknzOaSDGS3W5pUeOcj3Pwrjy3HmlptOSibmaMwtIWRV13suelXD5QbZdtLJAjfzP
 AXoYK+jM0knLQJZ7CZ2MPniEKS2zZIwKhg9303Xw5wMHdnbvu7yn+huKpNkZaU80HMC1
 UPSxwjgZ7zgsEOry/he+q2F4xK7Uh7uvvzXH2oCNi7IMPwHsIu/hC24kUtnopNSuOmL3
 GKiC/oFMoOX4IYpFczpaky276gwvq5ylPsJSUX3VF5PFOe4JiHSzJkVLQuzaf8x0H6zU
 oOyQ==
X-Gm-Message-State: APjAAAVcndQ7eZdgbFe4txYM0Dn6TNDFPBTZMHfs1TtamLPB+Geokbea
 /jp9xbtOos4YAlvamcXHi3IEQK/5jIA0Ra/U2Mt2q75ZiAk=
X-Google-Smtp-Source: APXvYqyGDELfs1Df7mACqT+DzSkf5ee6geWsTdiroT49nJFcn4P6Ma59kDlD2+zu3w5TBFGaSx4lU9z1yweU4tffvYA=
X-Received: by 2002:aca:fd8a:: with SMTP id b132mr1789057oii.33.1569271616322; 
 Mon, 23 Sep 2019 13:46:56 -0700 (PDT)
MIME-Version: 1.0
From: Stephen Beckwith <embeddedsteve@gmail.com>
Date: Mon, 23 Sep 2019 16:46:45 -0400
Message-ID: <CAN34fowBHmprS9Wmo+GQkDEtxsz2s514j5+zO-rGvTWeMnzjOg@mail.gmail.com>
Subject: Unable to boot OpenBMC image in QEMU for AST2500
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000003f401805933e85f1"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000003f401805933e85f1
Content-Type: text/plain; charset="UTF-8"

Greetings,
     I am working on a Proof-of-Concept for OpenBMC.  I am familiar with
SP/BMC setups using proprietary code.   I have successfully built the
OpenBMC project (in a VM running Ubuntu 18.04) as well as
building/installing the eSDK.  Note: system was built from a ZIP from
github, git clone failed due to access rights.
    When I completed the process, I tried to load the available image into
QEMU for ARM (which was also built) and received the following error(s),
depending upon the directory from which this is run (which is also a
question, why the difference?)
  I was successful in booting the Poky example from Yocto for both x86 and
ARM into the respective QEMU machines, for the minimal image.
  Any pointers would be greatly provided.

Regards,
Stephen Beckwith

Failure #1:  QEMU Hangs:
==> Fresh shell:

sbeckwit@ubuntu:~/yocto_dev/openbmc-master/build$ runqemu qemuarm
runqemu - INFO - Running MACHINE=qemuarm bitbake -e...
runqemu - INFO - Continuing with the following parameters:

KERNEL:
[/home/sbeckwit/yocto_dev/openbmc-master/build/tmp/deploy/images/qemuarm/zImage--5.0.19+git0+7f6e97c357_d1ed980ad9-r0-qemuarm-20190919131556.bin]
MACHINE: [qemuarm]
FSTYPE: [ext4]
ROOTFS:
[/home/sbeckwit/yocto_dev/openbmc-master/build/tmp/deploy/images/qemuarm/obmc-phosphor-image-qemuarm-20190919131556.rootfs.ext4]
CONFFILE:
[/home/sbeckwit/yocto_dev/openbmc-master/build/tmp/deploy/images/qemuarm/obmc-phosphor-image-qemuarm-20190919131556.qemuboot.conf]

runqemu - INFO - Setting up tap interface under sudo
[sudo] password for sbeckwit:
runqemu - INFO - Network configuration: 192.168.7.2::192.168.7.1:255
.255.255.0
runqemu - INFO - Running
/home/sbeckwit/yocto_dev/openbmc-master/build/tmp/work/x86_64-linux/qemu-helper-native/1.0-r1/recipe-sysroot-native/usr/bin/qemu-system-arm
-device virtio-net-device,netdev=net0,mac=52:54:00:12:34:02 -netdev
tap,id=net0,ifname=tap0,script=no,downscript=no -drive
id=disk0,file=/home/sbeckwit/yocto_dev/openbmc-master/build/tmp/deploy/images/qemuarm/obmc-phosphor-image-qemuarm-20190919131556.rootfs.ext4,if=none,format=raw
-device virtio-blk-device,drive=disk0 -show-cursor -device VGA,edid=on
-device qemu-xhci -device usb-tablet -device usb-kbd -object
rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0
 -machine virt -cpu cortex-a15 -m 512 -serial mon:vc -serial null -kernel
/home/sbeckwit/yocto_dev/openbmc-master/build/tmp/deploy/images/qemuarm/zImage--5.0.19+git0+7f6e97c357_d1ed980ad9-r0-qemuarm-20190919131556.bin
-append 'root=/dev/vda rw highres=off  mem=512M ip=192.168.7.2:
:192.168.7.1:255.255.255.0 console=ttyAMA0 '

^C to exit - TOP shows qeum-system-arm running but no output to a console.
.  no login prompt.

^Crunqemu - INFO - Cleaning up
Set 'tap0' nonpersistent
Traceback (most recent call last):
  File "/home/sbeckwit/yocto_dev/openbmc-master/scripts/runqemu", line
1486, in <module>
    sys.exit(main())
  File "/home/sbeckwit/yocto_dev/openbmc-master/scripts/runqemu", line
1472, in main
    config.start_qemu()
  File "/home/sbeckwit/yocto_dev/openbmc-master/scripts/runqemu", line
1362, in start_qemu
    retcode = process.wait()
  File "/usr/lib/python3.6/subprocess.py", line 1477, in wait
    (pid, sts) = self._try_wait(0)
  File "/usr/lib/python3.6/subprocess.py", line 1424, in _try_wait
    (pid, sts) = os.waitpid(self.pid, wait_flags)
KeyboardInterrupt

Failure #2 - Running from the "top level" directory:
==> Fresh shell:

sbeckwit@ubuntu:~/yocto_dev/openbmc-master$ source oe-init-build-env
Common targets are:
     obmc-phosphor-image

You can also run generated qemu images with a command like:
     runqemu qemuarm
sbeckwit@ubuntu:~/yocto_dev/openbmc-master/build$ cd ../
sbeckwit@ubuntu:~/yocto_dev/openbmc-master$
sbeckwit@ubuntu:~/yocto_dev/openbmc-master$
sbeckwit@ubuntu:~/yocto_dev/openbmc-master$ runqemu qemuarm
runqemu - INFO - Running bitbake -e...
runqemu - INFO - Continuing with the following parameters:

KERNEL:
[/home/sbeckwit/yocto_dev/openbmc-master/build/tmp/deploy/images/qemuarm/zImage--5.0.19+git0+7f6e97c357_d1ed980ad9-r0-qemuarm-20190919131556.bin]
MACHINE: [qemuarm]
FSTYPE: [nfs]
NFS_DIR: [/home/sbeckwit/yocto_dev/openbmc-master/qemuarm]
CONFFILE:
[/home/sbeckwit/yocto_dev/openbmc-master/build/tmp/deploy/images/qemuarm/obmc-phosphor-image-qemuarm-20190919131556.qemuboot.conf]

runqemu - INFO - Setting up tap interface under sudo
[sudo] password for sbeckwit:
runqemu - INFO - Running ('runqemu-export-rootfs', 'start',
'/home/sbeckwit/yocto_dev/openbmc-master/qemuarm')...
Running bitbake -e meta-ide-support
PSEUDO=/home/sbeckwit/yocto_dev/openbmc-master/build/tmp/work/armv7vet2hf-neon-openbmc-linux-gnueabi/meta-ide-support/1.0-r3/recipe-sysroot-native/usr/bin/pseudo
Error:
/home/sbeckwit/yocto_dev/openbmc-master/qemuarm/../qemuarm.pseudo_state
does not exist.
Did you create the export directory using runqemu-extract-sdk?
Traceback (most recent call last):
  File "/home/sbeckwit/yocto_dev/openbmc-master/scripts/runqemu", line
1469, in main
    config.setup_network()
  File "/home/sbeckwit/yocto_dev/openbmc-master/scripts/runqemu", line
1151, in setup_network
    self.setup_tap()
  File "/home/sbeckwit/yocto_dev/openbmc-master/scripts/runqemu", line
1126, in setup_tap
    self.setup_nfs()
  File "/home/sbeckwit/yocto_dev/openbmc-master/scripts/runqemu", line
1007, in setup_nfs
    raise RunQemuError('Failed to run %s' % cmd)
TypeError: not all arguments converted during string formatting
runqemu - INFO - Cleaning up
Set 'tap0' nonpersistent
sbeckwit@ubuntu:~/yocto_dev/openbmc-master$

--0000000000003f401805933e85f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Greetings,</div><div>=C2=A0=C2=A0=C2=A0=C2=A0 I am wo=
rking on a Proof-of-Concept for OpenBMC.=C2=A0 I am familiar with SP/BMC se=
tups using proprietary code.=C2=A0=C2=A0 I have successfully built the Open=
BMC project (in a VM running Ubuntu 18.04) as well as building/installing t=
he eSDK.=C2=A0 Note: system was built from a ZIP from github, git clone fai=
led due to access rights.<br></div><div>=C2=A0=C2=A0=C2=A0 When I completed=
 the process, I tried to load the available image into QEMU for ARM (which =
was also built) and received the following error(s), depending upon the dir=
ectory from which this is run (which is also a question, why the difference=
?)</div><div>=C2=A0 I was successful in booting the Poky example from Yocto=
 for both x86 and ARM into the respective QEMU machines, for the minimal im=
age.=C2=A0 <br></div><div>=C2=A0 Any pointers would be greatly provided.</d=
iv><div><br></div><div>Regards,</div><div>Stephen Beckwith</div><div><br></=
div><div>Failure #1:=C2=A0 QEMU Hangs:<br></div><div>=3D=3D&gt; Fresh shell=
:<br><br>sbeckwit@ubuntu:~/yocto_dev/openbmc-master/build$ runqemu qemuarm<=
br>runqemu - INFO - Running MACHINE=3Dqemuarm bitbake -e...<br>runqemu - IN=
FO - Continuing with the following parameters:<br><br>KERNEL: [/home/sbeckw=
it/yocto_dev/openbmc-master/build/tmp/deploy/images/qemuarm/zImage--5.0.19+=
git0+7f6e97c357_d1ed980ad9-r0-qemuarm-20190919131556.bin]<br>MACHINE: [qemu=
arm]<br>FSTYPE: [ext4]<br>ROOTFS: [/home/sbeckwit/yocto_dev/openbmc-master/=
build/tmp/deploy/images/qemuarm/obmc-phosphor-image-qemuarm-20190919131556.=
rootfs.ext4]<br>CONFFILE: [/home/sbeckwit/yocto_dev/openbmc-master/build/tm=
p/deploy/images/qemuarm/obmc-phosphor-image-qemuarm-20190919131556.qemuboot=
.conf]<br><br>runqemu - INFO - Setting up tap interface under sudo<br>[sudo=
] password for sbeckwit: <br>runqemu - INFO - Network configuration: 192.16=
8.7.2::192.168.7.1:255.255.255.0<br>runqemu - INFO - Running /home/sbeckwit=
/yocto_dev/openbmc-master/build/tmp/work/x86_64-linux/qemu-helper-native/1.=
0-r1/recipe-sysroot-native/usr/bin/qemu-system-arm -device virtio-net-devic=
e,netdev=3Dnet0,mac=3D52:54:00:12:34:02 -netdev tap,id=3Dnet0,ifname=3Dtap0=
,script=3Dno,downscript=3Dno -drive id=3Ddisk0,file=3D/home/sbeckwit/yocto_=
dev/openbmc-master/build/tmp/deploy/images/qemuarm/obmc-phosphor-image-qemu=
arm-20190919131556.rootfs.ext4,if=3Dnone,format=3Draw -device virtio-blk-de=
vice,drive=3Ddisk0 -show-cursor -device VGA,edid=3Don -device qemu-xhci -de=
vice usb-tablet -device usb-kbd -object rng-random,filename=3D/dev/urandom,=
id=3Drng0 -device virtio-rng-pci,rng=3Drng0 =C2=A0-machine virt -cpu cortex=
-a15 -m 512 -serial mon:vc -serial null -kernel /home/sbeckwit/yocto_dev/op=
enbmc-master/build/tmp/deploy/images/qemuarm/zImage--5.0.19+git0+7f6e97c357=
_d1ed980ad9-r0-qemuarm-20190919131556.bin -append &#39;root=3D/dev/vda rw h=
ighres=3Doff =C2=A0mem=3D512M ip=3D192.168.7.2::192.168.7.1:255.255.255.0 c=
onsole=3DttyAMA0 &#39;<br><br>^C to exit - TOP shows qeum-system-arm runnin=
g but no output to a console. . =C2=A0no login prompt.<br><br>^Crunqemu - I=
NFO - Cleaning up<br>Set &#39;tap0&#39; nonpersistent<br>Traceback (most re=
cent call last):<br>=C2=A0 File &quot;/home/sbeckwit/yocto_dev/openbmc-mast=
er/scripts/runqemu&quot;, line 1486, in &lt;module&gt;<br>=C2=A0 =C2=A0 sys=
.exit(main())<br>=C2=A0 File &quot;/home/sbeckwit/yocto_dev/openbmc-master/=
scripts/runqemu&quot;, line 1472, in main<br>=C2=A0 =C2=A0 config.start_qem=
u()<br>=C2=A0 File &quot;/home/sbeckwit/yocto_dev/openbmc-master/scripts/ru=
nqemu&quot;, line 1362, in start_qemu<br>=C2=A0 =C2=A0 retcode =3D process.=
wait()<br>=C2=A0 File &quot;/usr/lib/python3.6/subprocess.py&quot;, line 14=
77, in wait<br>=C2=A0 =C2=A0 (pid, sts) =3D self._try_wait(0)<br>=C2=A0 Fil=
e &quot;/usr/lib/python3.6/subprocess.py&quot;, line 1424, in _try_wait<br>=
=C2=A0 =C2=A0 (pid, sts) =3D os.waitpid(self.pid, wait_flags)<br>KeyboardIn=
terrupt<br></div><div><br></div><div>Failure #2 - Running from the &quot;to=
p level&quot; directory:</div><div>=3D=3D&gt; Fresh shell:<br><br>sbeckwit@=
ubuntu:~/yocto_dev/openbmc-master$ source oe-init-build-env <br>Common targ=
ets are:<br>=C2=A0 =C2=A0 =C2=A0obmc-phosphor-image<br><br>You can also run=
 generated qemu images with a command like:<br>=C2=A0 =C2=A0 =C2=A0runqemu =
qemuarm<br>sbeckwit@ubuntu:~/yocto_dev/openbmc-master/build$ cd ../<br>sbec=
kwit@ubuntu:~/yocto_dev/openbmc-master$ <br>sbeckwit@ubuntu:~/yocto_dev/ope=
nbmc-master$ <br>sbeckwit@ubuntu:~/yocto_dev/openbmc-master$ runqemu qemuar=
m<br>runqemu - INFO - Running bitbake -e...<br>runqemu - INFO - Continuing =
with the following parameters:<br><br>KERNEL: [/home/sbeckwit/yocto_dev/ope=
nbmc-master/build/tmp/deploy/images/qemuarm/zImage--5.0.19+git0+7f6e97c357_=
d1ed980ad9-r0-qemuarm-20190919131556.bin]<br>MACHINE: [qemuarm]<br>FSTYPE: =
[nfs]<br>NFS_DIR: [/home/sbeckwit/yocto_dev/openbmc-master/qemuarm]<br>CONF=
FILE: [/home/sbeckwit/yocto_dev/openbmc-master/build/tmp/deploy/images/qemu=
arm/obmc-phosphor-image-qemuarm-20190919131556.qemuboot.conf]<br><br>runqem=
u - INFO - Setting up tap interface under sudo<br>[sudo] password for sbeck=
wit: <br>runqemu - INFO - Running (&#39;runqemu-export-rootfs&#39;, &#39;st=
art&#39;, &#39;/home/sbeckwit/yocto_dev/openbmc-master/qemuarm&#39;)...<br>=
Running bitbake -e meta-ide-support<br>PSEUDO=3D/home/sbeckwit/yocto_dev/op=
enbmc-master/build/tmp/work/armv7vet2hf-neon-openbmc-linux-gnueabi/meta-ide=
-support/1.0-r3/recipe-sysroot-native/usr/bin/pseudo<br>Error: /home/sbeckw=
it/yocto_dev/openbmc-master/qemuarm/../qemuarm.pseudo_state does not exist.=
<br>Did you create the export directory using runqemu-extract-sdk?<br>Trace=
back (most recent call last):<br>=C2=A0 File &quot;/home/sbeckwit/yocto_dev=
/openbmc-master/scripts/runqemu&quot;, line 1469, in main<br>=C2=A0 =C2=A0 =
config.setup_network()<br>=C2=A0 File &quot;/home/sbeckwit/yocto_dev/openbm=
c-master/scripts/runqemu&quot;, line 1151, in setup_network<br>=C2=A0 =C2=
=A0 self.setup_tap()<br>=C2=A0 File &quot;/home/sbeckwit/yocto_dev/openbmc-=
master/scripts/runqemu&quot;, line 1126, in setup_tap<br>=C2=A0 =C2=A0 self=
.setup_nfs()<br>=C2=A0 File &quot;/home/sbeckwit/yocto_dev/openbmc-master/s=
cripts/runqemu&quot;, line 1007, in setup_nfs<br>=C2=A0 =C2=A0 raise RunQem=
uError(&#39;Failed to run %s&#39; % cmd)<br>TypeError: not all arguments co=
nverted during string formatting<br>runqemu - INFO - Cleaning up<br>Set &#3=
9;tap0&#39; nonpersistent<br>sbeckwit@ubuntu:~/yocto_dev/openbmc-master$ <b=
r></div><div><br></div></div>

--0000000000003f401805933e85f1--
