Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D813345A83
	for <lists+openbmc@lfdr.de>; Tue, 23 Mar 2021 10:13:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Qf90M4cz3bqM
	for <lists+openbmc@lfdr.de>; Tue, 23 Mar 2021 20:13:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phytium.com.cn (client-ip=206.189.21.223;
 helo=zg8tmja2lje4os4yms4ymjma.icoremail.net;
 envelope-from=wangmin@phytium.com.cn; receiver=<UNKNOWN>)
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net
 (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
 by lists.ozlabs.org (Postfix) with SMTP id 4F4Qdp4RRJz30Mh
 for <openbmc@lists.ozlabs.org>; Tue, 23 Mar 2021 20:13:28 +1100 (AEDT)
Received: from LAPTOPS6JR0A6O (unknown [106.17.222.12])
 by c1app9 (Coremail) with SMTP id CQINCgBXOZ0qsVlgqWvMAA--.63380S2;
 Tue, 23 Mar 2021 17:13:16 +0800 (CST)
From: <wangmin@phytium.com.cn>
To: "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>
Subject: [OpenBMC]:  root is rejected to login an aarch64 openBmc system
Date: Tue, 23 Mar 2021 17:13:14 +0800
Message-ID: <!&!AAAAAAAAAAAuAAAAAAAAAO4CP8j4rjtAsuu29GjYeJQBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAADosvXoMjmFTaNtUZ21y/cCAQAAAAA=@phytium.com.cn>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_00A8_01D72007.D16472C0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Adcfun4/ItxPV8SbRRmT5Z2yHa6a8w==
Content-Language: zh-cn
X-CM-TRANSID: CQINCgBXOZ0qsVlgqWvMAA--.63380S2
X-Coremail-Antispam: 1UD129KBjvJXoWfGw4UCr13Xr4fZry5Zry5urg_yoWkCFyxpr
 Z5GF43JryrJr1xJr4UKF4xtry5XwnYka15J3sxA3W8Jw1kJryjgr15XrW09Fy7tr4fCF1j
 v3WjqryUZr1UArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40Eb7x2
 x7xS6rWj6F1UMc02F40E57IF67AEF4xIwI1l5I8CrVAKz4kIr2xC04v26r4j6ryUMc02F4
 0E42I26xC2a48xMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
 72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lw4CEc2x0rVAKj4xxMx8GjcxK6I
 xK0xIIj40E5I8CrwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
 z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
 AF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
 IxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s
 0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsG
 vfC2KfnxnUUI43ZEXa7IUYoT5tUUUUU==
X-CM-SenderInfo: 5zdqwzdlq61x51wl3zoofrzhdfq/
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
Cc: =?UTF-8?B?J+WImOWLh+m5jyc=?= <liuyongpeng@phytium.com.cn>,
 shuyiqi@phytium.com.cn
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multipart message in MIME format.

------=_NextPart_000_00A8_01D72007.D16472C0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=20

Hi all,

=20

At present,  an aarch64 root file system was build and run on an aarch64 =
soc. However, root is rejected to login. It is skeptical that there are =
some wrong configurations in the file =E2=80=9C/etc/fstab=E2=80=9D.  =
Anyone have ideas on the issue, please give your comments.  Thanks in =
advance.=20

The following text snippets are the contents of the file =
=E2=80=9C/etc/fstab=E2=80=9D.

=20

# stock fstab - you probably want to override this with a machine =
specific one

=20

/dev/root            /                    auto       defaults            =
  1  1

proc                 /proc                proc       defaults            =
  0  0

devpts               /dev/pts             devpts     =
mode=3D0620,ptmxmode=3D0666,gid=3D5      0  0

tmpfs                /run                 tmpfs      =
mode=3D0755,nodev,nosuid,strictatime 0  0

tmpfs                /var/volatile        tmpfs      defaults            =
  0  0

=20

# uncomment this if your device has a SD/MMC/Transflash slot

#/dev/mmcblk0p1       /media/card          auto       =
defaults,sync,noauto  0  0

=20

Sincerely,

wangmin

=20

The startup log is shown the below text lines.

=20

[    1.949186][ 3] done.

[    2.044027][ 3] VFS: Mounted root (squashfs filesystem) readonly on =
device 1:0.

[    2.051540][ 3] devtmpfs: mounted

[    2.055297][ 3] Freeing unused kernel memory: 1344K

[    2.060279][ 3] Run /sbin/init as init process

[    2.126531][ 3] systemd[1]: systemd 244.3+ running in system mode. =
(+PAM -AUDIT -SELINUX -IMA -APPAR)

[    2.148585][ 3] systemd[1]: Detected architecture arm64.

=20

Welcome to Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) =
0.1.0!

=20

[    2.170085][ 3] systemd[1]: Set hostname to <phytium>.

[    2.177862][ 3] random: systemd: uninitialized urandom read (16 bytes =
read)

[    2.184835][ 3] systemd[1]: Initializing machine ID from random =
generator.

[    2.191748][ 3] systemd[1]: Installed transient /etc/machine-id file.

[    2.250899][ 3] random: systemd: uninitialized urandom read (16 bytes =
read)

[    2.257923][ 3] systemd[1]: system-getty.slice: unit configures an IP =
firewall, but the local system.

[    2.270618][ 3] systemd[1]: (This warning is only shown for the first =
unit using IP firewalling.)

[    2.280218][ 3] systemd[1]: Created slice system-getty.slice.

[  OK  ] Created slice system-getty.slice.

[    2.302077][ 3] random: systemd: uninitialized urandom read (16 bytes =
read)

[    2.309286][ 3] systemd[1]: Created slice =
system-serial\x2dgetty.slice.

[  OK  ] Created slice system-serial\x2dgetty.slice.

[    2.330128][ 3] systemd[1]: Started Dispatch Password Requests to =
Console Directory Watch.

[  OK  ] Started Dispatch Password =C3=A2=C3=80=C2=A6ts to Console =
Directory Watch.

[    2.354103][ 3] systemd[1]: Started Forward Password Requests to Wall =
Directory Watch.

[  OK  ] Started Forward Password R=C3=A2=E2=82=AC=E2=80=A6uests to Wall =
Directory Watch.

[    2.378081][ 3] systemd[1]: Reached target Paths.

[  OK  ] Reached target Paths.

[    2.394068][ 3] systemd[1]: Reached target Remote File Systems.

[  OK  ] Reached target Remote File Systems.

[    2.414068][ 3] systemd[1]: Reached target Slices.

[  OK  ] Reached target Slices.

[    2.430071][ 3] systemd[1]: Reached target Swap.

[  OK  ] Reached target Swap.

[    2.446293][ 3] systemd[1]: Listening on Syslog Socket.

[  OK  ] Listening on Syslog Socket.

[    2.467220][ 3] systemd[1]: Listening on Process Core Dump Socket.

[  OK  ] Listening on Process Core Dump Socket.

[    2.486120][ 3] systemd[1]: Listening on initctl Compatibility Named =
Pipe.

[  OK  ] Listening on initctl[    2.494822][ 0] usb 2-2: new SuperSpeed =
Gen 1 USB device number 2 usingd

Compatibility Named Pipe.

[    2.514215][ 3] systemd[1]: Listening on Journal Audit Socket.

[  OK  ] Listening on Journal Audit Socket.

[    2.532382][ 0] usb-storage 2-2:1.0: USB Mass Storage device detected

[    2.538920][ 0] scsi host4: usb-storage 2-2:1.0

[    2.546153][ 3] systemd[1]: Listening on Journal Socket (/dev/log).

[  OK  ] Listening on Journal Socket (/dev/log).

[    2.566158][ 3] systemd[1]: Listening on Journal Socket.

[  OK  ] Listening on Journal Socket.

[    2.590185][ 3] systemd[1]: Listening on Network Service Netlink =
Socket.

[  OK  ] Listening on Network Service Netlink Socket.

[    2.610172][ 3] systemd[1]: Listening on udev Control Socket.

[  OK  ] Listening on udev Control Socket.

[    2.630125][ 3] systemd[1]: Listening on udev Kernel Socket.

[  OK  ] Listening on udev Kernel Socket.

[    2.651160][ 3] systemd[1]: Mounting Huge Pages File System...

         Mounting Huge Pages File System...

[    2.671120][ 3] systemd[1]: Mounting POSIX Message Queue File =
System...

         Mounting POSIX Message Queue File System...

[    2.691112][ 1] systemd[1]: Mounting Kernel Debug File System...

         Mounting Kernel Debug File System...

[    2.714920][ 1] systemd[1]: Mounting Temporary Directory (/tmp)...

         Mounting Temporary Directory (/tmp)...

[    2.738097][ 1] systemd[1]: Condition check resulted in Create list =
of static device nodes for the c.

[    2.750575][ 1] systemd[1]: Starting File System Check on Root =
Device...

         Starting File System Check on Root Device...

[    2.771480][ 2] systemd[1]: Starting Journal Service...

         Starting Journa[    2.777184][ 2] systemd[1]: Condition check =
resulted in Load Kernel Modules .

l Service...

[    2.788090][ 2] systemd[1]: Condition check resulted in FUSE Control =
File System being skipped.

[    2.799386][ 2] systemd[1]: Mounting Kernel Configuration File =
System...

         Mounting Kernel Configuration File System...

[    2.823495][ 2] systemd[1]: Starting Apply Kernel Variables...

         Starting Apply Kernel Variables...

[    2.843199][ 2] systemd[1]: Starting udev Coldplug all Devices...

         Starting udev Coldplug all Devices...

[    2.866823][ 2] systemd[1]: Started Journal Service.

[  OK  ] Started Journal Service.

[FAILED] Failed to mount Huge Pages File System.

See 'systemctl status dev-hugepages.mount' for details.

[FAILED] Failed to mount POSIX Message Queue File System.

See 'systemctl status dev-mqueue.mount' for details.

[FAILED] Failed to mount Kernel Debug File System.

See 'systemctl status sys-kernel-debug.mount' for details.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for Network Name Resolution.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[DEPEND] Dependency failed for Network Time Synchronization.

[  OK  ] Started File System Check on Root Device.

[FAILED] Failed to mount Kernel Configuration File System.

See 'systemctl status sys-kernel-config.mount' for details.

[  OK  ] Started Apply Kernel Variables.

[  OK  ] Reached target Host and Network Name Lookups.

[  OK  ] Reached target System Time Set.

[  OK  ] Reached target System Time Synchronized.

         Starting Remount Root and Kernel File Systems...

[  OK  ] Started udev Coldplug all Devices.

[FAILED] Failed to start Remount Root and Kernel File Systems.

See 'systemctl status systemd-remount-fs.service' for details.

         Starting Flush Journal to Persistent Storage...

[    3.227668][ 3] systemd-journald[1452]: Received client request to =
flush runtime journal.

         Starting Create Static Device Nodes in /dev...

[  OK  ] Started Flush Journal to Persistent Storage.

[  OK  ] Started Create Static Device Nodes in /dev.

[  OK  ] Reached target Local File Systems (Pre).

         Mounting /var/volatile...

         Starting udev Kernel Device Manager...

[FAILED] Failed to mount /var/volatile.

See 'systemctl status var-volatile.mount' for details.

[DEPEND] Dependency failed for Bind mount volatile /var/cache.

[DEPEND] Dependency failed for Local File Systems.

[DEPEND] Dependency failed for Bind mount volatile /srv.

[DEPEND] Dependency failed for Bind mount volatile /var/lib.

[DEPEND] Dependency failed for Bind mount volatile /var/spool.

[  OK  ] Started udev Kernel Device Manager.

[    3.460610][ 0] random: fast init done

[  OK  ] Stopped Dispatch Password =C3=A2=E2=82=AC=E2=80=A6ts to Console =
Directory Watch.

[  OK  ] Stopped Forward Password R=C3=A2=E2=82=AC=E2=80=A6uests to Wall =
Directory Watch.

[  OK  ] Reached target Timers.

[    3.548046][ 0] scsi 4:0:0:0: Direct-Access      USB      SanDisk =
3.2Gen1 1.00 PQ: 0 ANSI: 6

[    3.556938][ 0] sd 4:0:0:0: [sdb] 240353280 512-byte logical blocks: =
(123 GB/115 GiB)

[    3.565978][ 1] sd 4:0:0:0: [sdb] Write Protect is off

[  OK  ] Closed     3.572198][ 0] sd 4:0:0:0: [sdb] Write cache: =
disabled, read cache: enabled, doesn'tA

39mSyslog Socket.

[  OK  ] Reached targe[    3.595391][ 1]  sdb: sdb1

t Login Prompts.

[    3.603064][ 1] sd 4:0:0:0: [sdb] Attached SCSI removable disk

         Starting Network Service...

         Starting Load/Save Random Seed...

[  OK  ] Reached target Sockets.

         Mounting Kernel Configuration File System...

[  OK  ] Started Emergency Shell.

[  OK  ] Reached target Emergency Mode.

         Starting Create Volatile Files and Directories...

[  OK  ] Started Network Service.

[  OK  ] Started Load/Save Random Seed.

[FAILED] Failed to mount Kernel Configuration File System.

See 'systemctl status sys-kernel-config.mount' for details.

[  OK  ] Started Create Volatile Files and Directories.

[  OK  ] Reached target Network.

         Starting Run pending postinsts...

[FAILED] Failed to start Run pending postinsts.

See 'systemctl status run-postinsts.service' for details.

You are in emergency mode. After logging in, type "journalctl -xb" to =
view

systeGive root password for maintenance

(or press Control-D to continue):=20

Login incorrect

=20

Give root password for maintenance

(or press Control-D to continue):=20

Login incorrect

=20

Give root password for maintenance

(or press Control-D to continue):=20

Login incorrect

=20

Give root password for maintenance

(or press Control-D to continue):=20

Login incorrect

=20

Give root password for maintenance

(or press Control-D to continue):=20

Reloading system manager configuration

Starting default target

You are in emergency mode. After Give root password for maintenance

(or press Control-D to continue):=20

Login incorrect

=20

Give root password for maintenance

(or press Control-D to continue):=20

Login incorrect

=20

Give root password for maintenance

(or press Control-D to continue):=20

Reloading system manager configuration

Starting default target

You are in emergency mode. After Give root password for maintenance

(or press Control-D to continue):=20

                    =20

=20


------=_NextPart_000_00A8_01D72007.D16472C0
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered =
medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:=E5=AE=8B=E4=BD=93;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=E7=AD=89=E7=BA=BF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=E5=AE=8B=E4=BD=93";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=E7=AD=89=E7=BA=BF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:=E7=AD=89=E7=BA=BF;}
span.EmailStyle20
	{mso-style-type:personal-compose;
	font-family:=E7=AD=89=E7=BA=BF;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DZH-CN =
link=3D"#0563C1" vlink=3D"#954F72" =
style=3D'word-wrap:break-word;text-justify-trim:punctuation'><div =
class=3DWordSection1><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>Hi all,<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>At present,=C2=A0 an aarch64 root file system was build and =
run on an aarch64 soc. However, root is rejected to login. It is =
skeptical that there are some wrong configurations in the file =
</span>=E2=80=9C<span lang=3DEN-US>/etc/fstab</span>=E2=80=9D<span =
lang=3DEN-US>.=C2=A0 Anyone have ideas on the issue, please give your =
comments.=C2=A0 Thanks in advance. <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>The following text snippets are the =
contents of the file =
=E2=80=9C/etc/fstab=E2=80=9D.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US># stock fstab - you probably want =
to override this with a machine specific one<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>/dev/root=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =
/=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
auto=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
defaults=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 1=C2=A0 1<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>proc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/proc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 proc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
defaults=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0=C2=A0 0<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>devpts=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/dev/pts=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 devpts=C2=A0=C2=A0=C2=A0=C2=A0 =
mode=3D0620,ptmxmode=3D0666,gid=3D5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
0=C2=A0 0<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>tmpfs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/run=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 tmpfs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
mode=3D0755,nodev,nosuid,strictatime 0=C2=A0 0<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>tmpfs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/var/volatile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
tmpfs=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
defaults=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0=C2=A0 0<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US># uncomment this if your device has a SD/MMC/Transflash =
slot<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>#/dev/mmcblk0p1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
/media/card=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
auto=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 defaults,sync,noauto=C2=A0 =
0=C2=A0 0<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>Sincerely,<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>wangmin<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>The startup log is shown the below text =
lines.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 1.949186][ 3] =
done.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.044027][ 3] VFS: Mounted root =
(squashfs filesystem) readonly on device 1:0.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.051540][ 3] =
devtmpfs: mounted<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.055297][ 3] Freeing unused kernel =
memory: 1344K<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.060279][ 3] Run /sbin/init as init =
process<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.126531][ 3] systemd[1]: systemd =
244.3+ running in system mode. (+PAM -AUDIT -SELINUX -IMA =
-APPAR)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.148585][ 3] systemd[1]: Detected =
architecture arm64.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>Welcome to Phosphor OpenBMC (Phosphor OpenBMC Project =
Reference Distro) 0.1.0!<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.170085][ 3] systemd[1]: Set hostname =
to &lt;phytium&gt;.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.177862][ 3] random: systemd: =
uninitialized urandom read (16 bytes read)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.184835][ 3] =
systemd[1]: Initializing machine ID from random =
generator.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.191748][ 3] systemd[1]: Installed =
transient /etc/machine-id file.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.250899][ 3] =
random: systemd: uninitialized urandom read (16 bytes =
read)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.257923][ 3] systemd[1]: =
system-getty.slice: unit configures an IP firewall, but the local =
system.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.270618][ 3] systemd[1]: (This warning =
is only shown for the first unit using IP =
firewalling.)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.280218][ 3] systemd[1]: Created slice =
system-getty.slice.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Created slice =
system-getty.slice.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.302077][ 3] random: systemd: =
uninitialized urandom read (16 bytes read)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.309286][ 3] =
systemd[1]: Created slice =
system-serial\x2dgetty.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Created slice =
system-serial\x2dgetty.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.330128][ 3] =
systemd[1]: Started Dispatch Password Requests to Console Directory =
Watch.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Started Dispatch Password =
=C3=A2=C3=80=C2=A6ts to Console Directory Watch.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.354103][ 3] =
systemd[1]: Started Forward Password Requests to Wall Directory =
Watch.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Started Forward Password =
R=C3=A2</span><span lang=3DEN-US>=C2=80</span>=E2=80=A6<span =
lang=3DEN-US>uests to Wall Directory Watch.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.378081][ 3] =
systemd[1]: Reached target Paths.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Reached target =
Paths.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.394068][ 3] systemd[1]: Reached =
target Remote File Systems.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Reached target =
Remote File Systems.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.414068][ 3] systemd[1]: Reached =
target Slices.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Reached target =
Slices.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.430071][ 3] systemd[1]: Reached =
target Swap.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Reached target =
Swap.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.446293][ 3] systemd[1]: Listening on =
Syslog Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Listening on Syslog =
Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.467220][ 3] systemd[1]: Listening on =
Process Core Dump Socket.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Listening on =
Process Core Dump Socket.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.486120][ 3] =
systemd[1]: Listening on initctl Compatibility Named =
Pipe.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Listening on initctl[=C2=A0=C2=A0=C2=A0 =
2.494822][ 0] usb 2-2: new SuperSpeed Gen 1 USB device number 2 =
usingd<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>Compatibility Named Pipe.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.514215][ 3] =
systemd[1]: Listening on Journal Audit Socket.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Listening on =
Journal Audit Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.532382][ 0] usb-storage 2-2:1.0: USB =
Mass Storage device detected<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.538920][ 0] =
scsi host4: usb-storage 2-2:1.0<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.546153][ 3] =
systemd[1]: Listening on Journal Socket =
(/dev/log).<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Listening on Journal Socket =
(/dev/log).<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.566158][ 3] systemd[1]: Listening on =
Journal Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Listening on Journal =
Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.590185][ 3] systemd[1]: Listening on =
Network Service Netlink Socket.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Listening on =
Network Service Netlink Socket.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0 =C2=A0=C2=A02.610172][ 3] =
systemd[1]: Listening on udev Control Socket.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Listening on =
udev Control Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.630125][ 3] systemd[1]: Listening on =
udev Kernel Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Listening on udev Kernel =
Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.651160][ 3] systemd[1]: Mounting Huge =
Pages File System...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting =
Huge Pages File System...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.671120][ 3] =
systemd[1]: Mounting POSIX Message Queue File =
System...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting =
POSIX Message Queue File System...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.691112][ 1] =
systemd[1]: Mounting Kernel Debug File System...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting =
Kernel Debug File System...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.714920][ 1] =
systemd[1]: Mounting Temporary Directory =
(/tmp)...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting =
Temporary Directory (/tmp)...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.738097][ 1] =
systemd[1]: Condition check resulted in Create list of static device =
nodes for the c.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.750575][ 1] systemd[1]: Starting File =
System Check on Root Device...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting =
File System Check on Root Device...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.771480][ 2] =
systemd[1]: Starting Journal Service...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting =
Journa[=C2=A0=C2=A0=C2=A0 2.777184][ 2] systemd[1]: Condition check =
resulted in Load Kernel Modules .<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>l =
Service...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.788090][ 2] systemd[1]: Condition =
check resulted in FUSE Control File System being =
skipped.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.799386][ 2] systemd[1]: Mounting =
Kernel Configuration File System...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting =
Kernel Configuration File System...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.823495][ 2] =
systemd[1]: Starting Apply Kernel Variables...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting =
Apply Kernel Variables...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.843199][ 2] =
systemd[1]: Starting udev Coldplug all =
Devices...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting =
udev Coldplug all Devices...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 2.866823][ 2] =
systemd[1]: Started Journal Service.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Started Journal =
Service.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to mount Huge Pages File =
System.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status dev-hugepages.mount' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to mount POSIX Message Queue File =
System.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status dev-mqueue.mount' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to mount Kernel =
Debug File System.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status sys-kernel-debug.mount' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to mount Temporary Directory =
(/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status tmp.mount' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[DEPEND] Dependency failed for =
Network Name Resolution.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for D-Bus System Message =
Bus.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for Network Time =
Synchronization.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Started File System Check on Root =
Device.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to mount Kernel Configuration File =
System.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status sys-kernel-config.mount' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Started Apply Kernel =
Variables.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Reached target Host and Network Name =
Lookups.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Reached target System Time =
Set.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Reached target System Time =
Synchronized.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting =
Remount Root and Kernel File Systems...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Started udev =
Coldplug all Devices.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to start Remount Root and Kernel File =
Systems.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status systemd-remount-fs.service' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting =
Flush Journal to Persistent Storage...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 3.227668][ 3] =
systemd-journald[1452]: Received client request to flush runtime =
journal.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting =
Create Static Device Nodes in /dev...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Started Flush =
Journal to Persistent Storage.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Started Create =
Static Device Nodes in /dev.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Reached target =
Local File Systems (Pre).<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting =
/var/volatile...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting =
udev Kernel Device Manager...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to mount =
/var/volatile.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status var-volatile.mount' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for Bind mount volatile =
/var/cache.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for Local File =
Systems.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for Bind mount volatile =
/srv.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for Bind mount volatile =
/var/lib.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for Bind mount volatile =
/var/spool.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Started udev Kernel Device =
Manager.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 3.460610][ 0] random: fast init =
done<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Stopped Dispatch Password =
=C3=A2</span><span lang=3DEN-US>=C2=80</span>=E2=80=A6<span =
lang=3DEN-US>ts to Console Directory Watch.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Stopped Forward =
Password R=C3=A2</span><span lang=3DEN-US>=C2=80</span>=E2=80=A6<span =
lang=3DEN-US>uests to Wall Directory Watch.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Reached target =
Timers.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 3.548046][ 0] scsi 4:0:0:0: =
Direct-Access=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
USB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SanDisk 3.2Gen1 1.00 PQ: 0 ANSI: =
6<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 3.556938][ 0] sd 4:0:0:0: [sdb] =
240353280 512-byte logical blocks: (123 GB/115 =
GiB)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 3.565978][ 1] sd 4:0:0:0: [sdb] Write =
Protect is off<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Closed=C2=A0=C2=A0=C2=A0=C2=A0 =
3.572198][ 0] sd 4:0:0:0: [sdb] Write cache: disabled, read cache: =
enabled, doesn'tA<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>39mSyslog Socket.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Reached =
targe[=C2=A0=C2=A0=C2=A0 3.595391][ 1]=C2=A0 sdb: =
sdb1<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>t =
Login Prompts.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0=C2=A0=C2=A0 3.603064][ 1] sd 4:0:0:0: [sdb] =
Attached SCSI removable disk<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting =
Network Service...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting =
Load/Save Random Seed...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Reached target =
Sockets.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mounting =
Kernel Configuration File System...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Started =
Emergency Shell.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Reached target Emergency =
Mode.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting =
Create Volatile Files and Directories...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Started Network =
Service.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Started Load/Save Random =
Seed.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to mount Kernel Configuration File =
System.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status sys-kernel-config.mount' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Started Create Volatile Files and =
Directories.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[=C2=A0 OK=C2=A0 ] Reached target =
Network.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Starting =
Run pending postinsts...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to start Run pending =
postinsts.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status run-postinsts.service' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>You are in emergency mode. After logging in, type =
&quot;journalctl -xb&quot; to view<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>systeGive root password for =
maintenance<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>(or press Control-D to continue): <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Login =
incorrect<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>Give root password for maintenance<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>(or press Control-D to continue): =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>Login =
incorrect<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>Give root password for maintenance<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>(or press Control-D to continue): =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>Login =
incorrect<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>Give root password for maintenance<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>(or press Control-D to continue): =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>Login =
incorrect<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>Give root password for maintenance<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>(or press Control-D to continue): =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>Reloading =
system manager configuration<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Starting default =
target<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>You =
are in emergency mode. After Give root password for =
maintenance<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>(or press Control-D to continue): <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Login =
incorrect<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>Give root password for maintenance<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>(or press Control-D to continue): =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>Login =
incorrect<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>Give root password for maintenance<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>(or press Control-D to continue): =
<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>Reloading =
system manager configuration<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Starting default =
target<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>You =
are in emergency mode. After Give root password for =
maintenance<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>(or press Control-D to continue): <o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<o:p></=
o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p></div></body></html>
------=_NextPart_000_00A8_01D72007.D16472C0--

