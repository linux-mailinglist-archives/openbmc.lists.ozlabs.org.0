Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ADC345B61
	for <lists+openbmc@lfdr.de>; Tue, 23 Mar 2021 10:52:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4RVv5M7mz30hV
	for <lists+openbmc@lfdr.de>; Tue, 23 Mar 2021 20:52:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phytium.com.cn (client-ip=165.227.154.27;
 helo=zg8tmty1ljiyny4xntqumjca.icoremail.net;
 envelope-from=wangmin@phytium.com.cn; receiver=<UNKNOWN>)
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net
 (zg8tmty1ljiyny4xntqumjca.icoremail.net [165.227.154.27])
 by lists.ozlabs.org (Postfix) with SMTP id 4F4RVh0BtTz302p
 for <openbmc@lists.ozlabs.org>; Tue, 23 Mar 2021 20:52:24 +1100 (AEDT)
Received: from LAPTOPS6JR0A6O (unknown [106.17.222.12])
 by c1app1 (Coremail) with SMTP id AQINCgA3P7NPullgCzwhBA--.11716S2;
 Tue, 23 Mar 2021 17:52:16 +0800 (CST)
From: <wangmin@phytium.com.cn>
To: "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>
Subject: [OpenBMC]: root is rejected to login an aarch64 openBmc system
Date: Tue, 23 Mar 2021 17:52:15 +0800
Message-ID: <!&!AAAAAAAAAAAuAAAAAAAAAO4CP8j4rjtAsuu29GjYeJQBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAABwHLy5A/79RoxKRBG5yGpSAQAAAAA=@phytium.com.cn>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_00F6_01D7200D.4362EFA0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdcfyaG0Vw6Wi0AsQuuuKJ84XDKLcw==
Content-Language: zh-cn
X-CM-TRANSID: AQINCgA3P7NPullgCzwhBA--.11716S2
X-Coremail-Antispam: 1UD129KBjvAXoWfuw1kGF1ftryUtF1fury3Jwb_yoW5JF4UGo
 W5KFsrA3yruw18G3y7J397Ca95Xa4Fg3WkXwn0vFn8Wr1q93W5Jw4UZw43Wa4fZr4UWF4D
 JFyxKa45Jr97tFs5n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUO87k0a2IF6w4kM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0
 x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
 1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0
 I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
 vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG67k0
 8I80eVWrJVW7JwAqx4xG6c804VAFz4xC04v7Mc02F40Ew4AK048IF2xKxVW8JVW5JwAqx4
 xG6xAIxVCFxsxG0wAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1l
 Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4kE6xkIj40Ew7xC0wCY02Avz4
 vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
 67AKxVWUGVWUWwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MI
 IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
 14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxV
 WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bc
 ZXwUUUUU=
X-Originating-IP: [106.17.222.12]
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

------=_NextPart_000_00F6_01D7200D.4362EFA0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am sorry, the startup log was pasted wrong contents in the last email. =
The following texts are showing the=20

startup log.

=20

[    8.450487][ 1] VFS: Mounted root (squashfs filesystem) readonly on =
device 1:0.

[    8.457904][ 1] devtmpfs: mounted

[    8.461538][ 1] Freeing unused kernel memory: 1344K

[    8.466494][ 1] Run /sbin/init as init process

[    8.561032][ 1] systemd[1]: systemd 244.3+ running in system mode. =
(+PAM -AUDIT -SELINUX -IMA -APPARMOR -SMACK +SYSVINIT -UTMP =
-LIBCRYPTSETUP -GCRYPT -GNUTLS -ACL +XZ -LZ4 -SECCOMP +BLKID -ELFUTILS =
+KMOD -IDN2 -IDN -PCRE2 default-hierarchy=3Dhybrid)

[    8.583865][ 1] systemd[1]: Detected architecture arm64.

[    8.589282][ 1] systemd[1]: Running with unpopulated /etc.

=20

Welcome to Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) =
0.1.0!

=20

[    8.616684][ 1] systemd[1]: Set hostname to <ft2500>.

[    8.621737][ 1] systemd[1]: System cannot boot: Missing =
/etc/machine-id and /etc is mounted read-only.

[    8.631004][ 1] systemd[1]: Booting up is supported only when:

[    8.636815][ 1] systemd[1]: 1) /etc/machine-id exists and is =
populated.

[    8.643403][ 1] systemd[1]: 2) /etc/machine-id exists and is empty.

[    8.649646][ 1] systemd[1]: 3) /etc/machine-id is missing and /etc is =
writable.

[    8.909871][ 1] systemd[1]: Failed to populate /etc with preset unit =
settings, ignoring: Read-only file system

[    8.953437][ 1] systemd[1]: =
/lib/systemd/system/phosphor-ipmi-net@.socket:3: Invalid interface name, =
ignoring: sys-subsystem-net-devices-%i.device

[    8.987426][ 1] systemd[1]: Failed to put bus name to hashmap: File =
exists

[    8.994294][ 1] systemd[1]: xyz.openbmc_project.State.Host.service: =
Two services allocated for the same bus name =
xyz.openbmc_project.State.Host, refusing operation.

[    9.010841][ 1] systemd[1]: unit_file_find_fragment: =
obmc-host-reset-running@.target+0 =
=E9=88=ABobmc-host-reset-running@0.target

[    9.023396][ 1] systemd[1]: unit_file_find_fragment: =
obmc-host-stop@.target+0 =E9=88=ABobmc-host-stop@0.target

[    9.033834][ 1] systemd[1]: unit_file_find_fragment: =
obmc-host-startmin@.target+0 =E9=88=ABobmc-host-startmin@0.target

[    9.047367][ 1] systemd[1]: unit_file_find_fragment: =
obmc-power-on@.target+0 =E9=88=ABobmc-power-on@0.target

[    9.057600][ 1] systemd[1]: unit_file_find_fragment: =
obmc-power-start@.target+0 =E9=88=ABobmc-power-start@0.target

[    9.072831][ 1] systemd[1]: unit_file_find_fragment: =
obmc-power-start-pre@.target+0 =E9=88=ABobmc-power-start-pre@0.target

[    9.084856][ 1] systemd[1]: unit_file_find_fragment: =
obmc-host-started@.target+0 =E9=88=ABobmc-host-started@0.target

[    9.095814][ 1] systemd[1]: unit_file_find_fragment: =
obmc-host-starting@.target+0 =E9=88=ABobmc-host-starting@0.target

[    9.106930][ 1] systemd[1]: unit_file_find_fragment: =
obmc-host-start-pre@.target+0 =E9=88=ABobmc-host-start-pre@0.target

[    9.122329][ 1] systemd[1]: unit_file_find_fragment: =
obmc-host-quiesce@.target+0 =E9=88=ABobmc-host-quiesce@0.target

[    9.133285][ 1] systemd[1]: unit_file_find_fragment: =
obmc-chassis-poweroff@.target+0 =E9=88=ABobmc-chassis-poweroff@0.target

[    9.146007][ 1] systemd[1]: unit_file_find_fragment: =
obmc-power-off@.target+0 =E9=88=ABobmc-power-off@0.target

[    9.156446][ 1] systemd[1]: unit_file_find_fragment: =
obmc-power-stop@.target+0 =E9=88=ABobmc-power-stop@0.target

[    9.167236][ 1] systemd[1]: unit_file_find_fragment: =
obmc-power-stop-pre@.target+0 =E9=88=ABobmc-power-stop-pre@0.target

[    9.179055][ 1] systemd[1]: unit_file_find_fragment: =
obmc-host-stopped@.target+0 =E9=88=ABobmc-host-stopped@0.target

[    9.190016][ 1] systemd[1]: unit_file_find_fragment: =
obmc-host-stopping@.target+0 =E9=88=ABobmc-host-stopping@0.target

[    9.201162][ 1] systemd[1]: unit_file_find_fragment: =
obmc-host-stop-pre@.target+0 =E9=88=ABobmc-host-stop-pre@0.target

[    9.212993][ 1] systemd[1]: unit_file_find_fragment: =
obmc-chassis-powerreset@.target+0 =
=E9=88=ABobmc-chassis-powerreset@0.target

[    9.225026][ 1] systemd[1]: unit_file_find_fragment: =
obmc-chassis-poweron@.target+0 =E9=88=ABobmc-chassis-poweron@0.target

[    9.238767][ 1] systemd[1]: unit_file_find_fragment: =
obmc-chassis-powered-off@.target+0 =
=E9=88=ABobmc-chassis-powered-off@0.target

[    9.272031][ 1] systemd[1]: =
/lib/systemd/system/phosphor-pid-control.service:7: Neither a valid =
executable name nor an absolute path: {bindir}/swampd

[    9.285365][ 1] systemd[1]: phosphor-pid-control.service: Unit =
configuration has fatal error, unit will not be started.

[    9.308206][ 1] systemd[1]: unit_file_find_fragment: =
obmc-host-reset@.target+0 =E9=88=ABobmc-host-reset@0.target

[    9.332286][ 1] systemd[1]: phosphor-pid-control.service: Cannot add =
dependency job, ignoring: Unit phosphor-pid-control.service has a bad =
unit file setting.

[    9.346322][ 1] systemd[1]: xyz.openbmc_project.State.Host.service: =
Cannot add dependency job, ignoring: Unit =
xyz.openbmc_project.State.Host.service failed to load properly: File =
exists.

[    9.364178][ 1] random: systemd: uninitialized urandom read (16 bytes =
read)

[    9.371220][ 1] systemd[1]: system-mapper\x2dwait.slice: unit =
configures an IP firewall, but the local system does not support =
BPF/cgroup firewalling.

[    9.384639][ 1] systemd[1]: (This warning is only shown for the first =
unit using IP firewalling.)

[    9.394482][ 1] systemd[1]: Created slice =
system-mapper\x2dwait.slice.

[  OK  ] Created slice system-mapper\x2dwait.slice.

[    9.415686][ 1] random: systemd: uninitialized urandom read (16 bytes =
read)

[    9.422990][ 1] systemd[1]: Created slice =
system-obmc\x2dconsole.slice.

[  OK  ] Created slice system-obmc\x2dconsole.slice.

[    9.443668][ 1] random: systemd: uninitialized urandom read (16 bytes =
read)

[    9.450959][ 1] systemd[1]: Created slice =
system-obmc\x2dled\x2dgroup\x2dstart.slice.

[  OK  ] Created slice system-obmc\x2dled\x2dgroup\x2dstart.slice.

[    9.476116][ 1] systemd[1]: Created slice =
system-org.openbmc.control.Host.slice.

[  OK  ] Created slice system-org.openbmc.control.Host.slice.

[    9.500025][ 1] systemd[1]: Created slice =
system-phosphor\x2dcertificate\x2dmanager.slice.

[  OK  ] Created slice =
system-phosp=E9=88=A5=EE=9B=8Acertificate\x2dmanager.slice.

[    9.524018][ 1] systemd[1]: Created slice =
system-phosphor\x2ddiscover\x2dsystem\x2dstate.slice.

[  OK  ] Created slice =
system-phosp=E9=88=A5=EE=9B=95ver\x2dsystem\x2dstate.slice.

[    9.548011][ 1] systemd[1]: Created slice =
system-phosphor\x2dipmi\x2dkcs.slice.

[  OK  ] Created slice system-phosphor\x2dipmi\x2dkcs.slice.

[    9.572014][ 1] systemd[1]: Created slice =
system-phosphor\x2dipmi\x2dnet.slice.

[  OK  ] Created slice system-phosphor\x2dipmi\x2dnet.slice.

[    9.596078][ 1] systemd[1]: Created slice =
system-phosphor\x2dreset\x2dhost\x2dcheck.slice.

[  OK  ] Created slice =
system-phosp=E9=88=A5=EE=9B=8Areset\x2dhost\x2dcheck.slice.

[    9.620149][ 1] systemd[1]: Created slice =
system-phosphor\x2dreset\x2dhost\x2drunning.slice.

[  OK  ] Created slice =
system-phosp=E9=88=A5=EE=9B=8Bset\x2dhost\x2drunning.slice.

[    9.644060][ 1] systemd[1]: Created slice =
system-phosphor\x2dreset\x2dsensor\x2dstates.slice.

[  OK  ] Created slice =
system-phosp=E9=88=A5=EE=9B=99et\x2dsensor\x2dstates.slice.

[    9.668015][ 1] systemd[1]: Created slice =
system-serial\x2dgetty.slice.

[  OK  ] Created slice system-serial\x2dgetty.slice.

[    9.691756][ 1] systemd[1]: Started Dispatch Password Requests to =
Console Directory Watch.

[  OK  ] Started Dispatch Password =E9=88=A5=EE=9B=9As to Console =
Directory Watch.

[    9.715715][ 1] systemd[1]: Started Forward Password Requests to Wall =
Directory Watch.

[  OK  ] Started Forward Password R=E9=88=A5=EE=9B=9Bests to Wall =
Directory Watch.

[    9.739718][ 1] systemd[1]: Reached target Paths.

[  OK  ] Reached target Paths.

[    9.759675][ 1] systemd[1]: Reached target Slices.

[  OK  ] Reached target Slices.

[    9.779675][ 1] systemd[1]: Reached target Swap.

[  OK  ] Reached target Swap.

[    9.800012][ 1] systemd[1]: Listening on Syslog Socket.

[  OK  ] Listening on Syslog Socket.

[    9.821145][ 1] systemd[1]: Listening on Process Core Dump Socket.

[  OK  ] Listening on Process Core Dump Socket.

[    9.843743][ 1] systemd[1]: Listening on initctl Compatibility Named =
Pipe.

[  OK  ] Listening on initctl Compatibility Named Pipe.

[    9.867847][ 1] systemd[1]: Listening on Journal Audit Socket.

[  OK  ] Listening on Journal Audit Socket.

[    9.887759][ 1] systemd[1]: Listening on Journal Socket (/dev/log).

[  OK  ] Listening on Journal Socket (/dev/log).

[    9.907805][ 1] systemd[1]: Listening on Journal Socket.

[  OK  ] Listening on Journal Socket.

[    9.927816][ 1] systemd[1]: Listening on udev Control Socket.

[  OK  ] Listening on udev Control Socket.

[    9.947744][ 1] systemd[1]: Listening on udev Kernel Socket.

[  OK  ] Listening on udev Kernel Socket.

[    9.969124][ 1] systemd[1]: Mounting Huge Pages File System...

         Mounting Huge Pages File System...

[    9.993276][ 1] systemd[1]: Mounting POSIX Message Queue File =
System...

         Mounting POSIX Message Queue File System...

[   10.017245][ 1] systemd[1]: Mounting Kernel Debug File System...

         Mounting Kernel Debug File System...

[   10.037219][ 1] systemd[1]: Mounting Temporary Directory (/tmp)...

         Mounting Temporary Directory (/tmp)...

[   10.055761][ 1] systemd[1]: Condition check resulted in Create list =
of static device nodes for the current kernel being skipped.

[   10.068965][ 1] systemd[1]: Starting File System Check on Root =
Device...

         Starting File System Check on Root Device...

[   10.093656][ 1] systemd[1]: Starting Journal Service...

         Startin[   10.099411][ 1] systemd[1]: Condition check resulted =
in Load Kernel Modules being skipped.

g Journ[   10.108709][ 1] systemd[1]: Condition check resulted in FUSE =
Control File System being skipped.

al Service...

[   10.120331][ 1] systemd[1]: Mounting Kernel Configuration File =
System...

         Mounting Kernel Configuration File System...

[   10.145358][ 1] systemd[1]: Starting Apply Kernel Variables...

         Starting Apply Kernel Variables...

[   10.165374][ 1] systemd[1]: Starting udev Coldplug all Devices...

         Starting udev Coldplug all Devices...

[   10.187869][ 1] systemd[1]: Condition check resulted in Bind mount =
volatile /var/cache being skipped.

[   10.197113][ 1] systemd[1]: Condition check resulted in Bind mount =
volatile /var/lib being skipped.

[   10.206189][ 1] systemd[1]: Condition check resulted in Bind mount =
volatile /var/spool being skipped.

[   10.215515][ 1] systemd[1]: Condition check resulted in Bind mount =
volatile /srv being skipped.

[   10.229131][ 1] systemd[1]: Started Hardware RNG Entropy Gatherer =
Daemon.

[  OK  ] Started Hardware RNG Entropy Gatherer Daemon.

[   10.252583][ 1] systemd[1]: Started Journal Service.

[  OK  ] Started Journal Service.

[FAILED] Failed to mount Huge Pages File System.

See 'systemctl status dev-hugepages.mount' for details.

[FAILED] Failed to mount POSIX Message Queue File System.

See 'systemctl status dev-mqueue.mount' for details.

[FAILED] Failed to mount Kernel Debug File System.

See 'systemctl status sys-kernel-debug.mount' for details.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[  OK  ] Started File System Check on Root Device.

[FAILED] Failed to mount Kernel Configuration File System.

See 'systemctl status sys-kernel-config.mount' for details.

[  OK  ] Started Apply Kernel Variables.

         Starting Remount Root and Kernel File Systems...

[FAILED] Failed to start Remount Root and Kernel File Syst[   =
10.502419][ 0] random: fast init done

ems.

See 'systemctl status systemd-remount-fs.service' for details.

         Starting Flush Journal to Persistent Storage   10.538824][21] =
systemd-journald[2228]: Received client request to flush runtime =
journal.

0m...

         Starting Load/Save Random Seed...

         Starting Create Static Device Nodes in /dev...

[  OK  ] Started udev Coldplug all Devices.

[  OK  ] Started Flush Journal to Persistent Storage.

[  OK  ] Started Load/Save Random Seed.

[  OK  ] Started Create Static Device Nodes in /dev.

[  OK  ] Reached target Local File Systems (Pre).

[  OK  ] Reached target Local File Systems.

         Starting Create Volatile Files and Directories...

         Starting udev Kernel Device Manager...

[  OK  ] Started Create Volatile Files and Directories.

[  OK  ] Started udev Kernel Device Manager.

         Starting Run pending postinsts...

         Mounting Kerne[   10.790127][27] igb 0000:04:00.1 enp4s0f1: =
renamed from eth1

l Configuration File System...

[FAILED] Failed to mount Kernel Configuration File System.

[   10.827779][22] igb 0000:04:00.0 enp4s0f0: renamed from eth0

See 'systemctl status sys-kernel-config.mount' for details.

[   10.860175][51] igb 0000:04:00.3 enp4s0f3: renamed from eth3

[FAILED] Failed to start Run pending postinsts.

See 'systemctl status run-postinsts.service' for details.

[   10.907728][57] igb 0000:04:00.2 enp4s0f2: renamed from eth2

[  OK  ] Created slice system-xyz.openbmc_project.Hwmon.slice.

         Mounting Huge Pages File System...

         Mounting POSIX Message Queue File System...

         Mounting Kernel Debug File System...

[FAILED] Failed to mount Kernel Configuration File System.

See 'systemctl status sys-kernel-config.mount' for details.

[FAILED] Failed to mount Huge Pages File System.

See 'systemctl status dev-hugepages.mount' for details.

[FAILED] Failed to mount POSIX Message Queue File System.

See 'systemctl status dev-mqueue.mount' for details.

[FAILED] Failed to mount Kernel Debug File System.

See 'systemctl status sys-kernel-debug.mount' for details.

[  OK  ] Reached target System Initialization.

[  OK  ] Started Daily rotation of log files.

[  OK  ] Started Daily Cleanup of Temporary Directories.

[  OK  ] Reached target Timers.

[  OK  ] Listening on Avahi mDNS/DNS-SD Stack Activation Socket.

[  OK  ] Listening on BMC Webserver socket.

[  OK  ] Listening on D-Bus System Message Bus Socket.

[  OK  ] Listening on dropbear.socket.

[  OK  ] Listening on Phosphor Host=E9=88=A5=EE=9B=95le SSH =
Per-Connection socket.

[  OK  ] Listening on phosphor-ipmi-net@eth0.socket.

[  OK  ] Reached target Sockets.

[  OK  ] Reached target Basic System.

         Starting Avahi mDNS/DNS-SD Stack...

         Starting SSH Key Generation...

[  OK  ] Started LPC Snoop Daemon.

         Starting Name Service Cache Daemon...

         Starting LDAP daemon...

[  OK  ] Started ttyVUART0 Console Server.

         Starting Host logging...

         Starting OpenPOWER Host0 Control...

[  OK  ] Started Phosphor certificate manager for authority.

[  OK  ] Started Phosphor certificate manager for bmcweb.

[  OK  ] Started Phosphor certificate manager for nslcd.

[  OK  ] Started phosphor systemd target monitor.

         Starting System Logging Service...

[  OK  ] Started Lightweight SLP Server.

         Starting Permit User Sessions...

         Starting Intel Power Control...

         Starting Phosphor Dump Manager...

         Starting Entity Manager...

[  OK  ] Started Fru Device.

         Starting Phosphor Inventory Manager...

         Starting Phosphor LDAP privilege mapper...

         Starting Phosphor LED Group Management Daemon...

[  OK  ] Started IPMI SEL Logging Service.

         Starting Phosphor Log Manager...

         Starting Phosphor DBus Service Discovery Manager...

         Starting Phosphor Settings Daemon...

         Starting Phosphor Download Manager...

         Starting Post code manager...

         Starting Rsyslog config updater...

         Starting Phosphor User Manager...

[  OK  ] Started System Logging Service.

[FAILED] Failed to start SSH Key Generation.

See 'systemctl status dropbearkey.service' for details.

[FAILED] Failed to start Name Service Cache Daemon.

See 'systemctl status nscd.service' for details.

[  OK  ] Started LDAP daemon.

[  OK  ] Started Permit User Sessions.

[FAILED] Failed to start Phosphor Dump Manager.

See 'systemctl status xyz.openbmc_project.Dump.Manager.service' for =
details.

[FAILED] Failed to start Entity Manager.

See 'systemctl status xyz.openbmc_project.EntityManager.service' for =
details.

[DEPEND] Dependency failed for MCU Temp Sensor.

[DEPEND] Dependency failed for Hwmon Temp Sensor.

[DEPEND] Dependency failed for PSU Sensor.

[DEPEND] Dependency failed for Exit Air Temp Sensor.

[DEPEND] Dependency failed for Adc Sensor.

[DEPEND] Dependency failed for Intrusion Sensor.

[DEPEND] Dependency failed for IPMB Sensor.

[DEPEND] Dependency failed for Fan Sensor.

[DEPEND] Dependency failed for CPU Sensor.

         Mounting Temporary Directory (/tmp)...

[  OK  ] Started Serial Getty on ttyS0.

[  OK  ] Reached target Login Prompts.

         Starting Phosphor Ldap config updater...

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[FAILED] Failed to mount Temporary Directory (/tmp).

[   12.819393][23] random: crng init done

[   12.823136][23] random: 7 urandom warning(s) missed due to =
ratelimiting

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[  OK  ] Stopped LPC Snoop Daemon.

[  OK  ] Started LPC Snoop Daemon.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[  OK  ] Stopped Name Service Cache Daemon.

         Starting Name Service Cache Daemon...

[  OK  ] Stopped ttyVUART0 Console Server.

[  OK  ] Started ttyVUART0 Console Server.

[  OK  ] Stopped Lightweight SLP Server.

[  OK  ] Started Lightweight SLP Server.

[  OK  ] Stopped Phosphor Dump Manager.

         Starting Phosphor Dump Manager...

[FAILED] Failed to start Name Service Cache Daemon.

See 'systemctl status nscd.service' for details.

[FAILED] Failed to start Phosphor Dump Manager.

See 'systemctl status xyz.openbmc_project.Dump.Manager.service' for =
details.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[  OK  ] Stopped Entity Manager.

         Starting Entity Manager...

[FAILED] Failed to start Entity Manager.

See 'systemctl status xyz.openbmc_project.EntityManager.service' for =
details.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[FAILED] Failed to mount Temporary Directory (/tmp).

See 'systemctl status tmp.mount' for details.

[DEPEND] Dependency failed for D-Bus System Message Bus.

[  OK  ] Stopped LPC Snoop Daemon.

[FAILED] Failed to start LPC Snoop Daemon.

See 'systemctl status lpcsnoop.service' for details.

[  OK  ] Stopped Name Service Cache Daemon.

[FAILED] Failed to start Name Service Cache Daemon.

See 'systemctl status nscd.service' for details.

[  OK  ] Stopped ttyVUART0 Console Server.

[FAILED] Failed to start ttyVUART0 Console Server.

See 'systemctl status obmc-console@ttyVUART0.service' for details.

[  OK  ] Stopped Lightweight SLP Server.

[FAILED] Failed to start Lightweight SLP Server.

See 'systemctl status slpd-lite.service' for details.

[  OK  ] Stopped Phosphor Dump Manager.

[  OK  ] Listening on D-Bus System Message Bus Socket.

[FAILED] Failed to start Phosphor Dump Manager.

See 'systemctl status xyz.openbmc_project.Dump.Manager.service' for =
details.

[  OK  ] Stopped Entity Manager.

[FAILED] Failed to start Entity Manager.

See 'systemctl status xyz.openbmc_project.EntityManager.service' for =
details.

[   17.251376][24] audit: type=3D1701 audit(1616511064.752:2): =
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3552 =
comm=3D"phosphor-rsyslo" exe=3D"/usr/bin/phosphor-rsyslog-conf" sig=3D6 =
res=3D1

[   17.267548][24] audit: type=3D1701 audit(1616511064.752:3): =
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3553 =
comm=3D"phosphor-user-m" exe=3D"/usr/bin/phosphor-user-manager" sig=3D6 =
res=3D1

[   17.283681][24] audit: type=3D1701 audit(1616511064.752:4): =
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3525 =
comm=3D"phosphor-certif" exe=3D"/usr/bin/phosphor-certificate-manager" =
sig=3D6 res=3D1

[   17.300416][24] audit: type=3D1701 audit(1616511064.752:5): =
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3550 =
comm=3D"phosphor-downlo" exe=3D"/usr/bin/phosphor-download-manager" =
sig=3D6 res=3D1

[   17.316868][24] audit: type=3D1701 audit(1616511064.752:6): =
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3543 =
comm=3D"phosphor-ldap-m" exe=3D"/usr/bin/phosphor-ldap-mapper" sig=3D6 =
res=3D1

[   17.332888][24] audit: type=3D1701 audit(1616511064.752:7): =
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3528 =
comm=3D"phosphor-certif" exe=3D"/usr/bin/phosphor-certificate-manager" =
sig=3D6 res=3D1

[   17.349614][24] audit: type=3D1701 audit(1616511064.752:8): =
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3544 =
comm=3D"phosphor-ledman" exe=3D"/usr/bin/phosphor-ledmanager" sig=3D6 =
res=3D1

[   17.365550][24] audit: type=3D1701 audit(1616511064.752:9): =
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3551 =
comm=3D"post-code-manag" exe=3D"/usr/bin/post-code-manager" sig=3D6 =
res=3D1

[   17.381328][24] audit: type=3D1701 audit(1616511064.752:10): =
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3526 =
comm=3D"phosphor-certif" exe=3D"/usr/bin/phosphor-certificate-manager" =
sig=3D6 res=3D1

[   17.398133][24] audit: type=3D1701 audit(1616511064.752:11): =
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3560 =
comm=3D"phosphor-ldap-c" exe=3D"/usr/bin/phosphor-ldap-conf" sig=3D6 =
res=3D1

=20

Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0 =
phytium_arm64 ttyS0

=20

phytium_arm64 login:=20

phytium_arm64 login: root

=20

Login incorrect

phytium_arm64 login: phytium

Password:=20

=20

Login incorrect

phytium_arm64 login:=20

Log

Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0 =
phytium_arm64 ttyS0

=20

phytium_arm64 login: root

=20

Login incorrect

phytium_arm64 login: phytium

Password:=20

=20

Login incorrect

phytium_arm64 login: phytium

Password:=20

=20

Login incorrect

phytium_arm64 login: phytium

Password:=20

=20

Login incorrect

phytium_arm64 login: phytium

Password:=20

=20

Log

Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0 =
phytium_arm64 ttyS0

=20

phytium_arm64 login:=20

phytium_arm64 login:=20

phytium_arm64 login:=20

phytium_arm64 login:


------=_NextPart_000_00F6_01D7200D.4362EFA0
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dutf-8">
<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta name=3DGenerator =
content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=E7=AD=89=E7=BA=BF;
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:=E7=AD=89=E7=BA=BF;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:=E7=AD=89=E7=BA=BF;}
/* Page Definitions */
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
class=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-US>I am sorry, =
the startup log was pasted wrong contents in the last email. The =
following texts are showing the <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>startup =
log.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 8.450487][ 1] VFS: Mounted root =
(squashfs filesystem) readonly on device 1:0.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 8.457904][ 1] =
devtmpfs: mounted<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 8.461538][ 1] Freeing unused kernel =
memory: 1344K<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 8.466494][ 1] Run /sbin/init as init =
process<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 8.561032][ 1] systemd[1]: systemd =
244.3+ running in system mode. (+PAM -AUDIT -SELINUX -IMA -APPARMOR =
-SMACK +SYSVINIT -UTMP -LIBCRYPTSETUP -GCRYPT -GNUTLS -ACL +XZ -LZ4 =
-SECCOMP +BLKID -ELFUTILS +KMOD -IDN2 -IDN -PCRE2 =
default-hierarchy=3Dhybrid)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 8.583865][ 1] =
systemd[1]: Detected architecture arm64.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 8.589282][ 1] =
systemd[1]: Running with unpopulated /etc.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Welcome to Phosphor OpenBMC =
(Phosphor OpenBMC Project Reference Distro) =
0.1.0!<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 8.616684][ 1] systemd[1]: Set hostname =
to &lt;ft2500&gt;.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 8.621737][ 1] systemd[1]: System cannot =
boot: Missing /etc/machine-id and /etc is mounted =
read-only.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 8.631004][ 1] systemd[1]: Booting up is =
supported only when:<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 8.636815][ 1] systemd[1]: 1) =
/etc/machine-id exists and is populated.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 8.643403][ 1] =
systemd[1]: 2) /etc/machine-id exists and is =
empty.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 8.649646][ 1] systemd[1]: 3) =
/etc/machine-id is missing and /etc is writable.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 8.909871][ 1] =
systemd[1]: Failed to populate /etc with preset unit settings, ignoring: =
Read-only file system<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 8.953437][ 1] systemd[1]: =
/lib/systemd/system/phosphor-ipmi-net@.socket:3: Invalid interface name, =
ignoring: sys-subsystem-net-devices-%i.device<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 8.987426][ 1] =
systemd[1]: Failed to put bus name to hashmap: File =
exists<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 8.994294][ 1] systemd[1]: =
xyz.openbmc_project.State.Host.service: Two services allocated for the =
same bus name xyz.openbmc_project.State.Host, refusing =
operation.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.010841][ 1] systemd[1]: =
unit_file_find_fragment: obmc-host-reset-running@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-host-reset-running@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.023396][ 1] =
systemd[1]: unit_file_find_fragment: obmc-host-stop@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-host-stop@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.033834][ 1] =
systemd[1]: unit_file_find_fragment: obmc-host-startmin@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-host-startmin@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.047367][ 1] =
systemd[1]: unit_file_find_fragment: obmc-power-on@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-power-on@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.057600][ 1] =
systemd[1]: unit_file_find_fragment: obmc-power-start@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-power-start@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.072831][ 1] =
systemd[1]: unit_file_find_fragment: obmc-power-start-pre@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-power-start-pre@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.084856][ 1] =
systemd[1]: unit_file_find_fragment: obmc-host-started@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-host-started@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.095814][ 1] =
systemd[1]: unit_file_find_fragment: obmc-host-starting@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-host-starting@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.106930][ 1] =
systemd[1]: unit_file_find_fragment: obmc-host-start-pre@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-host-start-pre@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.122329][ 1] =
systemd[1]: unit_file_find_fragment: obmc-host-quiesce@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-host-quiesce@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.133285][ 1] =
systemd[1]: unit_file_find_fragment: obmc-chassis-poweroff@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-chassis-poweroff@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.146007][ 1] =
systemd[1]: unit_file_find_fragment: obmc-power-off@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-power-off@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.156446][ 1] =
systemd[1]: unit_file_find_fragment: obmc-power-stop@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-power-stop@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.167236][ 1] =
systemd[1]: unit_file_find_fragment: obmc-power-stop-pre@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-power-stop-pre@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.179055][ 1] =
systemd[1]: unit_file_find_fragment: obmc-host-stopped@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-host-stopped@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.190016][ 1] =
systemd[1]: unit_file_find_fragment: obmc-host-stopping@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-host-stopping@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.201162][ 1] =
systemd[1]: unit_file_find_fragment: obmc-host-stop-pre@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-host-stop-pre@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.212993][ 1] =
systemd[1]: unit_file_find_fragment: obmc-chassis-powerreset@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-chassis-powerreset@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp; &nbsp;9.225026][ 1] =
systemd[1]: unit_file_find_fragment: obmc-chassis-poweron@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-chassis-poweron@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.238767][ 1] =
systemd[1]: unit_file_find_fragment: obmc-chassis-powered-off@.target+0 =
</span>=E9=88=AB<span =
lang=3DEN-US>obmc-chassis-powered-off@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.272031][ 1] =
systemd[1]: /lib/systemd/system/phosphor-pid-control.service:7: Neither =
a valid executable name nor an absolute path: =
{bindir}/swampd<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.285365][ 1] systemd[1]: =
phosphor-pid-control.service: Unit configuration has fatal error, unit =
will not be started.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.308206][ 1] systemd[1]: =
unit_file_find_fragment: obmc-host-reset@.target+0 </span>=E9=88=AB<span =
lang=3DEN-US>obmc-host-reset@0.target<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.332286][ 1] =
systemd[1]: phosphor-pid-control.service: Cannot add dependency job, =
ignoring: Unit phosphor-pid-control.service has a bad unit file =
setting.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.346322][ 1] systemd[1]: =
xyz.openbmc_project.State.Host.service: Cannot add dependency job, =
ignoring: Unit xyz.openbmc_project.State.Host.service failed to load =
properly: File exists.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.364178][ 1] random: systemd: =
uninitialized urandom read (16 bytes read)<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.371220][ 1] =
systemd[1]: system-mapper\x2dwait.slice: unit configures an IP firewall, =
but the local system does not support BPF/cgroup =
firewalling.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.384639][ 1] systemd[1]: (This warning =
is only shown for the first unit using IP =
firewalling.)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.394482][ 1] systemd[1]: Created slice =
system-mapper\x2dwait.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Created slice =
system-mapper\x2dwait.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.415686][ 1] =
random: systemd: uninitialized urandom read (16 bytes =
read)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.422990][ 1] systemd[1]: Created slice =
system-obmc\x2dconsole.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Created slice =
system-obmc\x2dconsole.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.443668][ 1] =
random: systemd: uninitialized urandom read (16 bytes =
read)<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.450959][ 1] systemd[1]: Created slice =
system-obmc\x2dled\x2dgroup\x2dstart.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Created slice =
system-obmc\x2dled\x2dgroup\x2dstart.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.476116][ 1] =
systemd[1]: Created slice =
system-org.openbmc.control.Host.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Created slice =
system-org.openbmc.control.Host.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.500025][ 1] =
systemd[1]: Created slice =
system-phosphor\x2dcertificate\x2dmanager.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Created slice =
system-phosp</span>=E9=88=A5<span =
lang=3DEN-US>=EE=9B=8Acertificate\x2dmanager.slice.<o:p></o:p></span></p>=
<p class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.524018][ =
1] systemd[1]: Created slice =
system-phosphor\x2ddiscover\x2dsystem\x2dstate.slice.<o:p></o:p></span></=
p><p class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Created =
slice system-phosp</span>=E9=88=A5<span =
lang=3DEN-US>=EE=9B=95ver\x2dsystem\x2dstate.slice.<o:p></o:p></span></p>=
<p class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.548011][ =
1] systemd[1]: Created slice =
system-phosphor\x2dipmi\x2dkcs.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Created slice =
system-phosphor\x2dipmi\x2dkcs.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.572014][ 1] =
systemd[1]: Created slice =
system-phosphor\x2dipmi\x2dnet.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Created slice =
system-phosphor\x2dipmi\x2dnet.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.596078][ 1] =
systemd[1]: Created slice =
system-phosphor\x2dreset\x2dhost\x2dcheck.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Created slice =
system-phosp</span>=E9=88=A5<span =
lang=3DEN-US>=EE=9B=8Areset\x2dhost\x2dcheck.slice.<o:p></o:p></span></p>=
<p class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.620149][ =
1] systemd[1]: Created slice =
system-phosphor\x2dreset\x2dhost\x2drunning.slice.<o:p></o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Created slice =
system-phosp</span>=E9=88=A5<span =
lang=3DEN-US>=EE=9B=8Bset\x2dhost\x2drunning.slice.<o:p></o:p></span></p>=
<p class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.644060][ =
1] systemd[1]: Created slice =
system-phosphor\x2dreset\x2dsensor\x2dstates.slice.<o:p></o:p></span></p>=
<p class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Created slice =
system-phosp</span>=E9=88=A5<span =
lang=3DEN-US>=EE=9B=99et\x2dsensor\x2dstates.slice.<o:p></o:p></span></p>=
<p class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.668015][ =
1] systemd[1]: Created slice =
system-serial\x2dgetty.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Created slice =
system-serial\x2dgetty.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.691756][ 1] =
systemd[1]: Started Dispatch Password Requests to Console Directory =
Watch.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Started Dispatch Password =
</span>=E9=88=A5<span lang=3DEN-US>=EE=9B=9As to Console Directory =
Watch.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.715715][ 1] systemd[1]: Started =
Forward Password Requests to Wall Directory =
Watch.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Started Forward Password =
R</span>=E9=88=A5<span lang=3DEN-US>=EE=9B=9Bests to Wall Directory =
Watch.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.739718][ 1] systemd[1]: Reached =
target Paths.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Reached target =
Paths.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.759675][ 1] systemd[1]: Reached =
target Slices.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Reached target =
Slices.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.779675][ 1] systemd[1]: Reached =
target Swap.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Reached target =
Swap.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.800012][ 1] systemd[1]: Listening on =
Syslog Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Listening on Syslog =
Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.821145][ 1] systemd[1]: Listening on =
Process Core Dump Socket.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Listening on =
Process Core Dump Socket.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.843743][ 1] =
systemd[1]: Listening on initctl Compatibility Named =
Pipe.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Listening on initctl Compatibility Named =
Pipe.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.867847][ 1] systemd[1]: Listening on =
Journal Audit Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Listening on Journal Audit =
Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.887759][ 1] systemd[1]: Listening on =
Journal Socket (/dev/log).<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Listening on =
Journal Socket (/dev/log).<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.907805][ 1] =
systemd[1]: Listening on Journal Socket.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Listening on =
Journal Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.927816][ 1] systemd[1]: Listening on =
udev Control Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Listening on udev Control =
Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.947744][ 1] systemd[1]: Listening on =
udev Kernel Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Listening on udev Kernel =
Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.969124][ 1] systemd[1]: Mounting Huge =
Pages File System...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mounting =
Huge Pages File System...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp;&nbsp; 9.993276][ 1] =
systemd[1]: Mounting POSIX Message Queue File =
System...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mounting =
POSIX Message Queue File System...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp; 10.017245][ 1] =
systemd[1]: Mounting Kernel Debug File System...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mounting =
Kernel Debug File System...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp; 10.037219][ 1] =
systemd[1]: Mounting Temporary Directory =
(/tmp)...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mounting =
Temporary Directory (/tmp)...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp; 10.055761][ 1] =
systemd[1]: Condition check resulted in Create list of static device =
nodes for the current kernel being skipped.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp; 10.068965][ 1] =
systemd[1]: Starting File System Check on Root =
Device...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
File System Check on Root Device...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp; 10.093656][ 1] =
systemd[1]: Starting Journal Service...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Startin[&nbsp;&nbsp; 10.099411][ 1] systemd[1]: Condition check resulted =
in Load Kernel Modules being skipped.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>g Journ[&nbsp;&nbsp; 10.108709][ 1] =
systemd[1]: Condition check resulted in FUSE Control File System being =
skipped.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>al =
Service...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp; 10.120331][ 1] systemd[1]: Mounting Kernel =
Configuration File System...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mounting =
Kernel Configuration File System...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp; 10.145358][ 1] =
systemd[1]: Starting Apply Kernel Variables...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Apply Kernel Variables...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp; 10.165374][ 1] =
systemd[1]: Starting udev Coldplug all =
Devices...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
udev Coldplug all Devices...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp; 10.187869][ 1] =
systemd[1]: Condition check resulted in Bind mount volatile /var/cache =
being skipped.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp; 10.197113][ 1] systemd[1]: Condition check =
resulted in Bind mount volatile /var/lib being =
skipped.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp; 10.206189][ 1] systemd[1]: Condition check =
resulted in Bind mount volatile /var/spool being =
skipped.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp; 10.215515][ 1] systemd[1]: Condition check =
resulted in Bind mount volatile /srv being =
skipped.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp; 10.229131][ 1] systemd[1]: Started Hardware =
RNG Entropy Gatherer Daemon.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Started Hardware =
RNG Entropy Gatherer Daemon.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp; 10.252583][ 1] =
systemd[1]: Started Journal Service.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Started Journal =
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
D-Bus System Message Bus.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Started File =
System Check on Root Device.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to mount Kernel =
Configuration File System.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>See 'systemctl status =
sys-kernel-config.mount' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Started Apply =
Kernel Variables.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Remount Root and Kernel File Systems...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to start Remount =
Root and Kernel File Syst[&nbsp;&nbsp; 10.502419][ 0] random: fast init =
done<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>ems.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status systemd-remount-fs.service' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Flush Journal to Persistent Storage&nbsp;&nbsp; 10.538824][21] =
systemd-journald[2228]: Received client request to flush runtime =
journal.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>0m...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Load/Save Random Seed...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Create Static Device Nodes in /dev...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Started udev =
Coldplug all Devices.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Started Flush Journal to Persistent =
Storage.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Started Load/Save Random =
Seed.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Started Create Static Device Nodes in =
/dev.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Reached target Local File Systems =
(Pre).<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Reached target Local File =
Systems.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Create Volatile Files and Directories...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
udev Kernel Device Manager...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Started Create =
Volatile Files and Directories.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Started udev =
Kernel Device Manager.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Run pending postinsts...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mounting =
Kerne[&nbsp;&nbsp; 10.790127][27] igb 0000:04:00.1 enp4s0f1: renamed =
from eth1<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>l =
Configuration File System...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to mount Kernel =
Configuration File System.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp; 10.827779][22] igb =
0000:04:00.0 enp4s0f0: renamed from eth0<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>See 'systemctl status =
sys-kernel-config.mount' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp;&nbsp; 10.860175][51] igb =
0000:04:00.3 enp4s0f3: renamed from eth3<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to start Run =
pending postinsts.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status run-postinsts.service' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp; 10.907728][57] igb 0000:04:00.2 enp4s0f2: =
renamed from eth2<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Created slice =
system-xyz.openbmc_project.Hwmon.slice.<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mounting =
Huge Pages File System...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mounting =
POSIX Message Queue File System...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mounting =
Kernel Debug File System...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to mount Kernel =
Configuration File System.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>See 'systemctl status =
sys-kernel-config.mount' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to mount Huge Pages =
File System.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status dev-hugepages.mount' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to mount POSIX Message Queue File =
System.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status dev-mqueue.mount' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to mount Kernel =
Debug File System.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status sys-kernel-debug.mount' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Reached target System =
Initialization.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Started Daily rotation of log =
files.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Started Daily Cleanup of Temporary =
Directories.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Reached target =
Timers.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Listening on Avahi mDNS/DNS-SD Stack =
Activation Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Listening on BMC Webserver =
socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Listening on D-Bus System Message Bus =
Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Listening on =
dropbear.socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Listening on Phosphor =
Host</span>=E9=88=A5<span lang=3DEN-US>=EE=9B=95le SSH Per-Connection =
socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Listening on =
phosphor-ipmi-net@eth0.socket.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[ &nbsp;OK&nbsp; ] Reached target =
Sockets.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Reached target Basic =
System.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Avahi mDNS/DNS-SD Stack...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
SSH Key Generation...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Started LPC Snoop =
Daemon.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Name Service Cache Daemon...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
LDAP daemon...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Started ttyVUART0 Console =
Server.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Host logging...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
OpenPOWER Host0 Control...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Started Phosphor =
certificate manager for authority.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Started Phosphor =
certificate manager for bmcweb.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Started Phosphor =
certificate manager for nslcd.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Started phosphor =
systemd target monitor.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
System Logging Service...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Started =
Lightweight SLP Server.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Permit User Sessions...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Intel Power Control...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Phosphor Dump Manager...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Entity Manager...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Started Fru =
Device.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Phosphor Inventory Manager...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Phosphor LDAP privilege mapper...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Phosphor LED Group Management Daemon...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Started IPMI SEL =
Logging Service.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Phosphor Log Manager...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Phosphor DBus Service Discovery Manager...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Phosphor Settings Daemon...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Phosphor Download Manager...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Post code manager...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Rsyslog config updater...<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Phosphor User Manager...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Started System Logging =
Service.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to start SSH Key =
Generation.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status dropbearkey.service' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to start Name Service Cache =
Daemon.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status nscd.service' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Started LDAP =
daemon.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Started Permit User =
Sessions.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to start Phosphor Dump =
Manager.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status =
xyz.openbmc_project.Dump.Manager.service' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to start Entity =
Manager.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status =
xyz.openbmc_project.EntityManager.service' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for MCU Temp =
Sensor.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for Hwmon Temp =
Sensor.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for PSU =
Sensor.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for Exit Air Temp =
Sensor.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for Adc =
Sensor.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for Intrusion =
Sensor.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for IPMB =
Sensor.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for Fan =
Sensor.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for CPU =
Sensor.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Mounting =
Temporary Directory (/tmp)...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Started Serial =
Getty on ttyS0.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Reached target Login =
Prompts.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Phosphor Ldap config updater...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to mount Temporary =
Directory (/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status tmp.mount' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for D-Bus System Message =
Bus.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to mount Temporary Directory =
(/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status tmp.mount' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[DEPEND] Dependency failed for =
D-Bus System Message Bus.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to mount Temporary =
Directory (/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status tmp.mount' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for D-Bus System Message =
Bus.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to mount Temporary Directory =
(/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status tmp.mount' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[DEPEND] Dependency failed for =
D-Bus System Message Bus.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to mount Temporary =
Directory (/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status tmp.mount' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for D-Bus System Message =
Bus.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to mount Temporary Directory =
(/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status tmp.mount' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[DEPEND] Dependency failed for =
D-Bus System Message Bus.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to mount Temporary =
Directory (/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status tmp.mount' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for D-Bus System Message =
Bus.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to mount Temporary Directory =
(/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status tmp.mount' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[DEPEND] Dependency failed for =
D-Bus System Message Bus.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to mount Temporary =
Directory (/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status tmp.mount' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for D-Bus System Message =
Bus.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to mount Temporary Directory =
(/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status tmp.mount' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[DEPEND] Dependency failed for =
D-Bus System Message Bus.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to mount Temporary =
Directory (/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status tmp.mount' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for D-Bus System Message =
Bus.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to mount Temporary Directory =
(/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp; 12.819393][23] random: crng init =
done<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp; 12.823136][23] random: 7 urandom warning(s) =
missed due to ratelimiting<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>See 'systemctl status tmp.mount' =
for details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for D-Bus System Message =
Bus.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to mount Temporary Directory =
(/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status tmp.mount' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[DEPEND] Dependency failed for =
D-Bus System Message Bus.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to mount Temporary =
Directory (/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status tmp.mount' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for D-Bus System Message =
Bus.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to mount Temporary Directory =
(/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status tmp.mount' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[DEPEND] Dependency failed for =
D-Bus System Message Bus.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Stopped LPC =
Snoop Daemon.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Started LPC Snoop =
Daemon.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to mount Temporary Directory =
(/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status tmp.mount' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[DEPEND] Dependency failed for =
D-Bus System Message Bus.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Stopped Name =
Service Cache Daemon.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Name Service Cache Daemon...<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Stopped =
ttyVUART0 Console Server.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Started =
ttyVUART0 Console Server.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Stopped =
Lightweight SLP Server.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Started Lightweight SLP =
Server.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Stopped Phosphor Dump =
Manager.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Phosphor Dump Manager...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to start Name Service Cache =
Daemon.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status nscd.service' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to start Phosphor =
Dump Manager.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status =
xyz.openbmc_project.Dump.Manager.service' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to mount Temporary Directory =
(/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status tmp.mount' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[DEPEND] Dependency failed for =
D-Bus System Message Bus.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Stopped Entity =
Manager.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Starting =
Entity Manager...<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to start Entity =
Manager.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status =
xyz.openbmc_project.EntityManager.service' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to mount Temporary Directory =
(/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status tmp.mount' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[DEPEND] Dependency failed for =
D-Bus System Message Bus.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to mount Temporary =
Directory (/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status tmp.mount' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[DEPEND] Dependency failed for D-Bus System Message =
Bus.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to mount Temporary Directory =
(/tmp).<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status tmp.mount' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[DEPEND] Dependency failed for =
D-Bus System Message Bus.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Stopped LPC =
Snoop Daemon.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to start LPC Snoop =
Daemon.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status lpcsnoop.service' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Stopped Name =
Service Cache Daemon.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to start Name Service Cache =
Daemon.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status nscd.service' for details.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[&nbsp; OK&nbsp; ] Stopped =
ttyVUART0 Console Server.<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>[FAILED] Failed to start ttyVUART0 =
Console Server.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status obmc-console@ttyVUART0.service' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Stopped Lightweight SLP =
Server.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to start Lightweight SLP =
Server.<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>See =
'systemctl status slpd-lite.service' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Stopped Phosphor Dump =
Manager.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Listening on D-Bus System Message Bus =
Socket.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to start Phosphor Dump =
Manager.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status =
xyz.openbmc_project.Dump.Manager.service' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp; OK&nbsp; ] Stopped Entity =
Manager.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[FAILED] Failed to start Entity =
Manager.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>See 'systemctl status =
xyz.openbmc_project.EntityManager.service' for =
details.<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp; 17.251376][24] audit: type=3D1701 =
audit(1616511064.752:2): auid=3D4294967295 uid=3D0 gid=3D0 =
ses=3D4294967295 pid=3D3552 comm=3D&quot;phosphor-rsyslo&quot; =
exe=3D&quot;/usr/bin/phosphor-rsyslog-conf&quot; sig=3D6 =
res=3D1<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp; 17.267548][24] audit: type=3D1701 =
audit(1616511064.752:3): auid=3D4294967295 uid=3D0 gid=3D0 =
ses=3D4294967295 pid=3D3553 comm=3D&quot;phosphor-user-m&quot; =
exe=3D&quot;/usr/bin/phosphor-user-manager&quot; sig=3D6 =
res=3D1<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp; 17.283681][24] audit: type=3D1701 =
audit(1616511064.752:4): auid=3D4294967295 uid=3D0 gid=3D0 =
ses=3D4294967295 pid=3D3525 comm=3D&quot;phosphor-certif&quot; =
exe=3D&quot;/usr/bin/phosphor-certificate-manager&quot; sig=3D6 =
res=3D1<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp; 17.300416][24] audit: type=3D1701 =
audit(1616511064.752:5): auid=3D4294967295 uid=3D0 gid=3D0 =
ses=3D4294967295 pid=3D3550 comm=3D&quot;phosphor-downlo&quot; =
exe=3D&quot;/usr/bin/phosphor-download-manager&quot; sig=3D6 =
res=3D1<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp; 17.316868][24] audit: type=3D1701 =
audit(1616511064.752:6): auid=3D4294967295 uid=3D0 gid=3D0 =
ses=3D4294967295 pid=3D3543 comm=3D&quot;phosphor-ldap-m&quot; =
exe=3D&quot;/usr/bin/phosphor-ldap-mapper&quot; sig=3D6 =
res=3D1<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp; 17.332888][24] audit: type=3D1701 =
audit(1616511064.752:7): auid=3D4294967295 uid=3D0 gid=3D0 =
ses=3D4294967295 pid=3D3528 comm=3D&quot;phosphor-certif&quot; =
exe=3D&quot;/usr/bin/phosphor-certificate-manager&quot; sig=3D6 =
res=3D1<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp; 17.349614][24] audit: type=3D1701 =
audit(1616511064.752:8): auid=3D4294967295 uid=3D0 gid=3D0 =
ses=3D4294967295 pid=3D3544 comm=3D&quot;phosphor-ledman&quot; =
exe=3D&quot;/usr/bin/phosphor-ledmanager&quot; sig=3D6 =
res=3D1<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp; 17.365550][24] audit: type=3D1701 =
audit(1616511064.752:9): auid=3D4294967295 uid=3D0 gid=3D0 =
ses=3D4294967295 pid=3D3551 comm=3D&quot;post-code-manag&quot; =
exe=3D&quot;/usr/bin/post-code-manager&quot; sig=3D6 =
res=3D1<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp; 17.381328][24] audit: type=3D1701 =
audit(1616511064.752:10): auid=3D4294967295 uid=3D0 gid=3D0 =
ses=3D4294967295 pid=3D3526 comm=3D&quot;phosphor-certif&quot; =
exe=3D&quot;/usr/bin/phosphor-certificate-manager&quot; sig=3D6 =
res=3D1<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>[&nbsp;&nbsp; 17.398133][24] audit: type=3D1701 =
audit(1616511064.752:11): auid=3D4294967295 uid=3D0 gid=3D0 =
ses=3D4294967295 pid=3D3560 comm=3D&quot;phosphor-ldap-c&quot; =
exe=3D&quot;/usr/bin/phosphor-ldap-conf&quot; sig=3D6 =
res=3D1<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>Phosphor OpenBMC (Phosphor OpenBMC Project Reference =
Distro) 0.1.0 phytium_arm64 ttyS0<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>phytium_arm64 login: =
<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>phytium_arm64 login: root<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Login =
incorrect<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>phytium_arm64 login: phytium<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Password: <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Login =
incorrect<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>phytium_arm64 login: <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Log<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Phosphor OpenBMC (Phosphor OpenBMC =
Project Reference Distro) 0.1.0 phytium_arm64 =
ttyS0<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>phytium_arm64 login: root<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Login =
incorrect<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>phytium_arm64 login: phytium<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Password: <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Login =
incorrect<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>phytium_arm64 login: phytium<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Password: <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Login =
incorrect<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>phytium_arm64 login: phytium<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Password: <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Login =
incorrect<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>phytium_arm64 login: phytium<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Password: <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Log<o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>Phosphor OpenBMC (Phosphor OpenBMC =
Project Reference Distro) 0.1.0 phytium_arm64 =
ttyS0<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>phytium_arm64 login: <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>phytium_arm64 login: =
<o:p></o:p></span></p><p class=3DMsoNormal><span =
lang=3DEN-US>phytium_arm64 login: <o:p></o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>phytium_arm64 =
login:<o:p></o:p></span></p></div></body></html>
------=_NextPart_000_00F6_01D7200D.4362EFA0--

