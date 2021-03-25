Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DB33486F3
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 03:31:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5Td84nJbz30Mg
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 13:31:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phytium.com.cn (client-ip=165.227.154.27;
 helo=zg8tmty1ljiyny4xntqumjca.icoremail.net;
 envelope-from=wangmin@phytium.com.cn; receiver=<UNKNOWN>)
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net
 (zg8tmty1ljiyny4xntqumjca.icoremail.net [165.227.154.27])
 by lists.ozlabs.org (Postfix) with SMTP id 4F5Tcx0ghCz2ywx
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 13:31:18 +1100 (AEDT)
Received: from LAPTOPS6JR0A6O (unknown [223.153.195.250])
 by c1app8 (Coremail) with SMTP id CAINCgCXGgXl9VtgBsdqBA--.43903S2;
 Thu, 25 Mar 2021 10:31:02 +0800 (CST)
From: <wangmin@phytium.com.cn>
To: "'Joseph Reynolds'" <jrey@linux.ibm.com>,
 "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>
References: <!&!AAAAAAAAAAAuAAAAAAAAAO4CP8j4rjtAsuu29GjYeJQBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAABwHLy5A/79RoxKRBG5yGpSAQAAAAA=@phytium.com.cn>
 <3c7899d1-39c7-c0f4-7822-21fa8d66f709@linux.ibm.com>
 <!&!AAAAAAAAAAAuAAAAAAAAAO4CP8j4rjtAsuu29GjYeJQBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAABBDGRyySNtR7TzEws+7PMjAQAAAAA=@phytium.com.cn>
 <d3f8c98d-be45-3545-7133-b4d8f2fcf817@linux.ibm.com>
In-Reply-To: <d3f8c98d-be45-3545-7133-b4d8f2fcf817@linux.ibm.com>
Subject: =?UTF-8?Q?=E5=9B=9E=E5=A4=8D:_=E5=9B=9E=E5=A4=8D:_=5BOpenBMC=5D:_root_is_?=
 =?UTF-8?Q?rejected_to_login_an_aarch64_ope?= =?UTF-8?Q?nBmc_system?=
Date: Thu, 25 Mar 2021 10:31:02 +0800
Message-ID: <!&!AAAAAAAAAAAuAAAAAAAAAO4CP8j4rjtAsuu29GjYeJQBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAAAouOq1/S6oQJzDGfyGz2vOAQAAAAA=@phytium.com.cn>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQL08ZUln25zJLVsshfNeva3yPF06wHPmnnlAngrYg0BcuAVPKgqdVJw
Content-Language: zh-cn
X-CM-TRANSID: CAINCgCXGgXl9VtgBsdqBA--.43903S2
X-Coremail-Antispam: 1UD129KBjvAXoWDXrWDtFykWFyUJF4xuw17KFg_yoW7KrW8Ko
 W5KrnrA34rWw1UXryUJws7Ca95Wa4Fg3ZYv3s0vFn8Jr4DK3W5Jw4DZr13WFWfAr4UXF4D
 GFyfGa45CF97trn5n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjp_UUUYx7k0a2IF6w4kM7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0
 x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
 1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0
 I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
 xK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
 64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r
 1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwAKzVCY07xG64k0F24l
 c2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
 0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
 AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
 CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv
 67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf
 9x07bozuZUUUUU=
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



>  -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
>  =E5=8F=91=E4=BB=B6=E4=BA=BA: Joseph Reynolds <jrey@linux.ibm.com>
>  =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: =
2021=E5=B9=B43=E6=9C=8824=E6=97=A5 22:05
>  =E6=94=B6=E4=BB=B6=E4=BA=BA: wangmin@phytium.com.cn; 'OpenBMC =
Maillist'
>  <openbmc@lists.ozlabs.org>
>  =E6=8A=84=E9=80=81: '=E5=88=98=E5=8B=87=E9=B9=8F' =
<liuyongpeng@phytium.com.cn>; shuyiqi@phytium.com.cn
>  =E4=B8=BB=E9=A2=98: Re: =E5=9B=9E=E5=A4=8D: [OpenBMC]: root is =
rejected to login an aarch64 openBmc
>  system
> =20
>  On 3/23/21 9:02 PM, wangmin@phytium.com.cn wrote:
>  >>
>  >>   On 3/23/21 4:52 AM, wangmin@phytium.com.cn wrote:
>  >>   > I am sorry, the startup log was pasted wrong contents in the =
last
>  >>   > email. The following texts are showing the startup log. [ =
8.450487][
>  >>   > 1] VFS: Mounted root (squashfs filesystem) readonly on device =
1:0.=20
>  >>   > =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =E2=80=8D =
=E2=80=8D =E2=80=8D=20
>  >>   >
>  > Hi Joseph,
>  > Thank your response. I had uncommented the text line "tmpfs =
/var/volatile
>  tmpfs defaults 0 0"
>  > in the file "/etc/fstab". The OpenBMC system runs in an emergency
>  > mode. User root is able to login the system.
> =20
Hi Joseph, Thank you all the same.  Fortunately,  the cause of the =
openBmc runs in an emergency mode
was found. The openBmc rootfs was built by a not root user, so all the =
files in the rootfs are not assign root privilege.
The below text lines are printed while the system is starting to run as =
emergency mode.

[FAILED] Failed to mount Huge Pages File System.
See 'systemctl status dev-hugepages.mount' for details.
[FAILED] Failed to mount POSIX Message Queue File System.
See 'systemctl status dev-mqueue.mount' for details.
[FAILED] Failed to mount Kernel Debug File System.
See 'systemctl status sys-kernel-debug.mount' for details.
[FAILED] Failed to mount Temporary Directory (/tmp).
See 'systemctl status tmp.mount' for details.

After setting the rootfs's owner to root, the openBMC is able to run on =
an aarch64 soc.
However, there will be still some bugs to be fixed. Thanks again.

[    4.602043][ 1] systemd[1]: Listening on udev Kernel Socket.
[  OK  ] Listening on udev Kernel Socket.
[    4.623103][ 1] systemd[1]: Mounting Huge Pages File System...
         Mounting Huge Pages File System...
[    4.642999][ 1] systemd[1]: Mounting POSIX Message Queue File =
System...
         Mounting POSIX Message Queue File System...
[    4.663017][ 1] systemd[1]: Mounting Kernel Debug File System...
         Mounting Kernel Debug File System...
[    4.682955][ 1] systemd[1]: Mounting Temporary Directory (/tmp)...
         Mounting Temporary Directory (/tmp)...
[    4.702056][ 1] systemd[1]: Condition check resulted in Create list =
of static device nodes for the current kernel being skipped.
[    4.713807][ 1] systemd[1]: Condition check resulted in File System =
Check on Root Device being skipped.
[    4.724505][ 1] systemd[1]: Starting Journal Service...
         Starting Journal Service...
[    4.742215][ 1] systemd[1]: Condition check resulted in Load Kernel =
Modules being skipped.
[    4.750610][ 1] systemd[1]: Condition check resulted in FUSE Control =
File System being skipped.
[    4.760388][ 1] systemd[1]: Mounting Kernel Configuration File =
System...
         Mounting Kernel Configuration File System...
[    4.782997][ 1] systemd[1]: Starting Remount Root and Kernel File =
Systems...
         Starting Remount Root and Kernel File Systems...
[    4.795579][ 0] EXT4-fs (ram0): re-mounted. Opts: (null)
[    4.807220][ 2] systemd[1]: Starting Apply Kernel Variables...
         Starting Apply Kernel Variables...
[    4.827309][ 3] systemd[1]: Starting udev Coldplug all Devices...
         Starting udev Coldplug all Devices...
[    4.851418][ 3] systemd[1]: Started Hardware RNG Entropy Gatherer =
Daemon.
[  OK  ] Started Hardware RNG Entropy Gatherer Daemon.
[    4.876522][ 3] systemd[1]: Started Journal Service.
[  OK  ] Started Journal Service.
[  OK  ] Mounted Huge Pages File System.
[  OK  ] Mounted POSIX Message Queue File System.
[  OK  ] Mounted Kernel Debug File System.
[  OK  ] Mounted Temporary Directory (/tmp).
[  OK  ] Mounted Kernel Configuration File System.
[  OK  ] Started Remount Root and Kernel File Systems.
[  OK  ] Started Apply Kernel Variables.
         Starting Rebuild Hardware Database...
         Starting Flush Journal to Persistent Storage    5.026847][ 0] =
systemd-journald[1464]: Received client request to flush runtime =
journal.
m...
         Starting Create System Users...
[  OK  ] Started udev Coldplug all Devices.
[FAILED] Failed to start Rebuild Hardware Database.
See 'systemctl status systemd-hwdb-update.service' for details.
[  OK  ] Started Flush Journal to Persistent Storage.
[FAILED] Failed to start Create System Users.
See 'systemctl status systemd-sysusers.service' for details.
         Starting Create Static Device Nodes in /dev...
[  OK  ] Started Create Static Device Nodes in /dev.
[  OK  ] Reached target Local File Systems (Pre).
         Mounting /var/volatile...
         Starting udev Kernel Device Manager...
[  OK  ] Mounted /var/volatile.
[  OK  ] Started udev Kernel Device Manager.
         Starting Network Service...
         Starting Load/Save Random Seed...
[  OK  ] Reached target Local File Systems.
         Starting Commit a transient machine-id on disk...
         Starting Create Volatile Files and Directories...
[  OK  ] Started Network Service.
[  OK  ] Started Create Volatile Files and Directories.
         Starting Run pending postinsts...
         Starting Rebuild Journal Catalog...
         Starting Network Name Resolution...
[    5.407248][ 0] random: fast init done
         Starting Network Time Synchronization...
[FAILED] Failed to start Commit a transient machine-id on disk.
See 'systemctl status systemd-machine-id-commit.service' for details.
[FAILED] Failed to start Rebuild Journal Catalog.
See 'systemctl status systemd-journal-catalog-update.service' for =
details.
[FAILED] Failed to start Network Time Synchronization.
See 'systemctl status systemd-timesyncd.service' for details.
[  OK  ] Started Network Name Resolution.
[  OK  ] Started Run pending postinsts.
[  OK  ] Reached target Network.
[  OK  ] Reached target Host and Network Name Lookups.
[  OK  ] Stopped Network Time Synchronization.
         Starting Network Time Synchronization...
         Starting Update is Completed...
[FAILED] Failed to start Network Time Synchronization.
See 'systemctl status systemd-timesyncd.service' for details.
[FAILED] Failed to start Update is Completed.
See 'systemctl status systemd-update-done.service' for details.
[  OK  ] Stopped Network Time Synchronization.
[FAILED] Failed to start Network Time Synchronization.
See 'systemctl status systemd-timesyncd.service' for details.
[  OK  ] Reached target System Initialization.
[  OK  ] Started Daily Cleanup of Temporary Directories.
[  OK  ] Reached target System Time Set.
[  OK  ] Reached target System Time Synchronized.
[  OK  ] Started Daily rotation of log files.
[  OK  ] Reached target Timers.
[  OK  ] Listening on Avahi mDNS/DNS-SD Stack Activation Socket.
[  OK  ] Listening on BMC Webserver socket.
[  OK  ] Listening on D-Bus System Message Bus Socket.
[  OK  ] Listening on dropbear.socket.
[  OK  ] Listening on Phosphor Host=E9=88=A5=EE=9B=95le SSH =
Per-Connection socket.
[  OK  ] Listening on phosphor-ipmi-net@eth0.socket.
[  OK  ] Reached target Sockets.
         Starting D-Bus System Message Bus...
[  OK  ] Started D-Bus System Message Bus.
[  OK  ] Reached target Basic System.
         Starting Avahi mDNS/DNS-SD Stack...
[  OK  ] Started Start bmcweb server.
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
         Starting OpenBMC ipKVM daemon...
         Starting Permit User Sessions...
         Starting Intel Power Control...
         Starting Phosphor Dump Manager...
         Starting Entity Manager...
[  OK  ] Started Fru Device.
         Starting Phosphor Inventory Manager...
[    6.483830][ 2] audit: type=3D1701 audit(6.275:2): auid=3D4294967295 =
uid=3D0 gid=3D0 ses=3D4294967295 pid=3D2513 comm=3D"phosphor-invent" =
exe=3D"/usr/bin/phosphor-inventory" sig=3D6 res=3D1
         Starting Phosphor LDAP privilege mapper...
[    6.510694][ 3] audit: type=3D1701 audit(6.303:3): auid=3D4294967295 =
uid=3D0 gid=3D0 ses=3D4294967295 pid=3D2515 comm=3D"phosphor-ldap-m" =
exe=3D"/usr/bin/phosphor-ldap-mapper" sig=3D6 res=3D1
         Starting Phosphor LED Group Management Daemon...
[  OK  ] Started IPMI SEL Logging Service.
         Starting Phosphor Log Manager...
[    6.570991][ 3] audit: type=3D1701 audit(6.363:4): auid=3D4294967295 =
uid=3D0 gid=3D0 ses=3D4294967295 pid=3D2519 comm=3D"phosphor-log-ma" =
exe=3D"/usr/bin/phosphor-log-manager" sig=3D6 res=3D1
         Starting Phosphor DBus Service Discovery Manager...
         Starting Phosphor Settings Daemon...
         Starting Phosphor Download Manager...
         Starting Post code manager...
[    6.647312][ 3] audit: type=3D1701 audit(6.439:5): auid=3D4294967295 =
uid=3D0 gid=3D0 ses=3D4294967295 pid=3D2524 comm=3D"post-code-manag" =
exe=3D"/usr/bin/post-code-manager" sig=3D6 res=3D1
         Starting Rsyslog config updater...
         Starting Phosphor User Manager...
[  OK  ] Started System Logging Service.
[  OK  ] Started Name Service Cache Daemon.
[FAILED] Failed to start SSH Key Generation.
See 'systemctl status dropbearkey.service' for details.
[  OK  ] Started LDAP daemon.
[  OK  ] Started OpenBMC ipKVM daemon.
[    6.785104][ 3] audit: type=3D1701 audit(6.575:6): auid=3D4294967295 =
uid=3D0 gid=3D0 ses=3D4294967295 pid=3D2530 comm=3D"obmc-ikvm" =
exe=3D"/usr/bin/obmc-ikvm" sig=3D6 res=3D1
[  OK  ] Started Permit User Sessions.
[FAILED] Failed to start Intel Power Control.
See 'systemctl status =
xyz.openbmc_proje=E9=88=A5=EE=9B=99is.Control.Power.service' for =
details.
[FAILED] Failed to start Phosphor Dump Manager.
See 'systemctl status xyz.openbmc_project.Dump.Manager.service' for =
details.
[FAILED] Failed to start Entity Manager.
See 'systemctl status xyz.openbmc_project.EntityManager.service' for =
details.
[DEPEND] Dependency failed for Hwmon Temp Sensor.
[DEPEND] Dependency failed for CPU Sensor.
[DEPEND] Dependency failed for Adc Sensor.
[DEPEND] Dependency failed for Fan Sensor.
[DEPEND] Dependency failed for Exit Air Temp Sensor.
[DEPEND] Dependency failed for IPMB Sensor.
[DEPEND] Dependency failed for Intrusion Sensor.
[DEPEND] Dependency failed for MCU Temp Sensor.
[DEPEND] Dependency failed for PSU Sensor.
[  OK  ] Started OpenPOWER Host0 Control.
[  OK  ] Started Phosphor Inventory Manager.
[  OK  ] Started Phosphor LED Group Management Daemon.
[  OK  ] Started Phosphor DBus Service Discovery Manager.
[  OK  ] Started Phosphor Settings Daemon.
[  OK  ] Started Phosphor Download Manager.
[  OK  ] Started Post code manager.
[  OK  ] Started Rsyslog config updater.
[  OK  ] Created slice system-systemd\x2dcoredump.slice.
[  OK  ] Reached target Phosphor Object Mapper.
[  OK  ] Started Getty on tty1.
         Starting Wait for =
/xyz/ope=E9=88=A5=EE=9B=89ontrol/host0/boot/one_time...
[    7.258180][ 3] random: crng init done
[    7.261948][ 0] random: 7 urandom warning(s) missed due to =
ratelimiting
         Starting Wait for =
/xyz/ope=E9=88=A5=EE=9B=85project/control/host0/boot...
         Starting Wait for =
/xyz/ope=E9=88=A5?host0/power_restore_policy...
         Starting Wait for =
/xyz/ope=E9=88=A5=EE=9B=9Arol/host0/restriction_mode...
         Starting Wait for =
/xyz/ope=E9=88=A5=EE=9B=95ject/led/groups/bmc_booted...
         Starting Wait for /xyz/openbmc_project/led/groups...
         Starting Wait for /xyz/openbmc_project/state/chassis0...
         Starting Wait for /xyz/openbmc_project/state/host0...
         Starting Wait for /xyz/openbmc_project/time/owner...
         Starting Wait for =
/xyz/ope=E9=88=A5=EE=9B=93c_project/time/sync_method...
[  OK  ] Started Phosphor DBus Monitor.
[  OK  ] Started Serial Getty on ttyAMA0.
[  OK  ] Reached target Login Prompts.
         Starting Phosphor Ldap config updater...
         Starting Phosphor SNMP conf Manager...
[    7.498023][ 3] audit: type=3D1701 audit(7.287:7): auid=3D4294967295 =
uid=3D0 gid=3D0 ses=3D4294967295 pid=3D2546 comm=3D"phosphor-ldap-c" =
exe=3D"/usr/bin/phosphor-ldap-conf" sig=3D6 res=3D1
         Starting Phosphor Network Manager...
         Starting OpenBMC Software Update Manager...
         Starting Phosphor BMC State Manager...
         Starting Phosphor Chassis State Manager...
[  OK  ] Started Process Core Dump (PID 2514/UID 0).
[  OK  ] Started Process Core Dump (PID 2516/UID 0).
[  OK  ] Started Process Core Dump (PID 2520/UID 0).
[  OK  ] Started Process Core Dump (PID 2525/UID 0).
[  OK  ] Started Process Core Dump (PID 2531/UID 0).
[FAILED] Failed to start Load/Save Random Seed.
See 'systemctl status systemd-random-seed.service' for details.
[  OK  ] Started Wait for =
/xyz/open=E9=88=A5=EE=9B=9A/control/host0/boot/one_time.
[  OK  ] Started Wait for /xyz/openbmc_project/control/host0/boot.
[  OK  ] Started Wait for =
/xyz/open=E9=88=A5=EE=9B=95l/host0/power_restore_policy.
[  OK  ] Started Wait for =
/xyz/open=E9=88=A5=EE=9B=95ntrol/host0/restriction_mode.
[  OK  ] Started Wait for =
/xyz/open=E9=88=A5=EE=9B=96roject/led/groups/bmc_booted.
[  OK  ] Started Wait for /xyz/openbmc_project/led/groups.
[  OK  ] Started Wait for /xyz/openbmc_project/time/owner.
[  OK  ] Started Wait for /xyz/openbmc_project/time/sync_method.
[FAILED] Failed to start Phosphor Network Manager.
See 'systemctl status xyz.openbmc_project.Network.service' for details.
[  OK  ] Started Phosphor SNMP conf Manager.
[  OK  ] Started OpenBMC Software Update Manager.
[  OK  ] Stopped     7.936135][ 3] audit: type=3D1701 audit(7.727:8): =
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D2552 =
comm=3D"phosphor-chassi" exe=3D"/usr/bin/phosphor-chassis-state-manager" =
sig=3D6 res=3D1
;39mLPC Snoop Daemon.
[  OK  ] Started LPC Snoop Daemon.
[  OK  ] Stopped ttyVUART0 Console Server.
[  OK  ] Started ttyVUART0 Console Server.
[  OK  ] Started FRU Fault monitor service.
         Starting Phosphor Inband IPMI...
[  OK  ] Stopped Lightweight SLP Server.
[  OK  ] Started Lightweight SLP Server.
[  OK  ] Stopped Phosphor Dump Manager.
         Starting Phosphor Dump Manager...
         Starting Phosphor Version Software Manager...
[  OK  ] Started Process Core Dump (PID 2548/UID 0).
[FAILED] Failed to start Phosphor Inband IPMI.
See 'systemctl status phosphor-ipmi-host.service' for details.
[DEPEND] Dependency failed for Network IPMI daemon.
[DEPEND] Dependency failed for Phosphor IPMI KCS DBus Bridge.
[FAILED] Failed to start Phosphor Dump Manager.
See 'systemctl status xyz.openbmc_project.Dump.Manager.service' for =
details.
[FAILED] Failed to start Phosphor Ldap config updater.
See 'systemctl status xyz.openbmc_project.Ldap.Config.service' for =
details.
[  OK  ] Started Phosphor Chassis State Manager.
[  OK  ] Started Phosphor Version Software Manager.
[  OK  ] Reached target Host0 running after reset.
[  OK  ] Stopped Entity Manager.
         Starting Entity Manager...
[  OK  ] Started Process Core Dump (PID 2581/UID 0).
[FAILED] Failed to start Entity Manager.
See 'systemctl status xyz.openbmc_project.EntityManager.service' for =
details.
[  OK  ] Started Phosphor BMC State Manager.
[  OK  ] Stopped Phosphor Network Manager.
         Starting Phosphor Network Manager...
[FAILED] Failed to start Phosphor Network Manager.
See 'systemctl status xyz.openbmc_project.Network.service' for details.
[  OK  ] Stopped LPC Snoop Daemon.
[FAILED] Failed to start LPC Snoop Daemon.
See 'systemctl status lpcsnoop.service' for details.
[  OK  ] Stopped ttyVUART0 Console Server.
[FAILED] Failed to start ttyVUART0 Console Server.
See 'systemctl status obmc-console@ttyVUART0.service' for details.
[  OK  ] Stopped Phosphor Inband IPMI.
         Starting Phosphor Inband IPMI...
[  OK  ] Stopped Lightweight SLP Server.
[FAILED] Failed to start Lightweight SLP Server.
See 'systemctl status slpd-lite.service' for details.
[  OK  ] Stopped Phosphor Dump Manager.
[FAILED] Failed to start Phosphor Dump Manager.
See 'systemctl status xyz.openbmc_project.Dump.Manager.service' for =
details.
[  OK  ] Stopped Phosphor Ldap config updater.
         Starting Phosphor Ldap config updater...
[    9.434732][ 3] audit: type=3D1701 audit(9.227:9): auid=3D4294967295 =
uid=3D0 gid=3D0 ses=3D4294967295 pid=3D2605 comm=3D"phosphor-ldap-c" =
exe=3D"/usr/bin/phosphor-ldap-conf" sig=3D6 res=3D1
[FAILED] Failed to start Phosphor Inband IPMI.
See 'systemctl status phosphor-ipmi-host.service' for details.
[  OK  ] Stopped Entity Manager.
[FAILED] Failed to start Entity Manager.
See 'systemctl status xyz.openbmc_project.EntityManager.service' for =
details.
[  OK  ] Stopped Phosphor Chassis State Manager.
         Starting Phosphor Chassis State Manager...
[  OK  ] Started Process Core Dump (PID 2606/UID 0).
[FAILED] Failed to start Phosphor Ldap config updater.
See 'systemctl status xyz.openbmc_project.Ldap.Config.service' for =
details.
[  OK  ] Started     9.627866][ 3] audit: type=3D1701 audit(9.419:10): =
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D2607 =
comm=3D"phosphor-chassi" exe=3D"/usr/bin/phosphor-chassis-state-manager" =
sig=3D6 res=3D1
;39mPhosphor Chassis State Manager.
[  OK  ] Started Process Core Dump (PID 2612/UID 0).
[  OK  ] Stopped Intel Power Control.
         Starting Intel Power Control...
[FAILED] Failed to start Intel Power Control.
See 'systemctl status =
xyz.openbmc_proje=E9=88=A5=EE=9B=99is.Control.Power.service' for =
details.
[  OK  ] Stopped Phosphor Network Manager.
[FAILED] Failed to start Phosphor Network Manager.
See 'systemctl status xyz.openbmc_project.Network.service' for details.
[  OK  ] Stopped Phosphor Inband IPMI.
[FAILED] Failed to start Phosphor Inband IPMI.
See 'systemctl status phosphor-ipmi-host.service' for details.
[  OK  ] Stopped Phosphor Ldap config updater.
[FAILED] Failed to start Phosphor Ldap config updater.
See 'systemctl status xyz.openbmc_project.Ldap.Config.service' for =
details.
[  OK  ] Stopped Phosphor Chassis State Manager.
[FAILED] Failed to start Phosphor Chassis State Manager.
See 'systemctl status xyz.openbmc_project.State.Chassis.service' for =
details.

Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0 =
ft2500 ttyAMA0

ft2500 login: [   13.425766][ 3] audit: type=3D1701 audit(13.215:11): =
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D2619 =
comm=3D"phosphor-invent" exe=3D"/usr/bin/phosphor-inventory" sig=3D6 =
res=3D1
[   13.441431][ 3] audit: type=3D1701 audit(13.219:12): =
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D2621 =
comm=3D"phosphor-ldap-m" exe=3D"/usr/bin/phosphor-ldap-mapper" sig=3D6 =
res=3D1
[   13.457052][ 3] audit: type=3D1701 audit(13.223:13): =
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D2624 =
comm=3D"phosphor-log-ma" exe=3D"/usr/bin/phosphor-log-manager" sig=3D6 =
res=3D1
[   13.477213][ 3] audit: type=3D1701 audit(13.267:14): =
auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D2646 =
comm=3D"obmc-ikvm" exe=3D"/usr/bin/obmc-ikvm" sig=3D6 res=3D1

ft2500 login: root
Password:=20

Login incorrect
ft2500 login: root
Password:=20
root@ft2500:~# ls
bmcweb_persistent_data.json
root@ft2500:~# uname -a
Linux ft2500 4.19.15-g30f0c49c3-dirty #9 SMP PREEMPT Fri Mar 19 16:23:13 =
UTC 2021 aarch64 GNU/Linux
root@ft2500:~# cat /etc/os-release=20
ID=3Dopenbmc-phosphor
NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
VERSION=3D"0.1.0"
VERSION_ID=3D0.1.0
PRETTY_NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference =
Distro) 0.1.0"
BUILD_ID=3D"20201125002258"
OPENBMC_TARGET_MACHINE=3D"ft2500"
root@ft2500:~# [  238.034191][ 0] usb 2-2: USB disconnect, device number =
2

>  Thanks for checking that.  It sounds like your BMC's /etc files are
>  good.  Unfortunately, I have no experience with Linux configuration, =
startup,
>  or emergency mode, so I cannot offer any help here.
> =20
>  - Joseph
> =20
>  >>   You asked why root login fails.  The log below shows a number of
>  >>   failures.  These include:
>  >>   > systemd[1]: Running with  unpopulated /etc.
>  >>   > systemd[1]: System cannot  boot: Missing /etc/machine-id and =
/etc
>  is
>  >>   mounted read-only.
>  > I checked that the file "/etc/shadow" and the dirent "/etc/pam.d" =
exist.
>  >
>  >>   The root user login credentials are stored in /etc/passwd and
>  >>   /etc/shadow.  Also, the Linux-PAM authentication stack is stored =
under
>  >>   /etc/pam.d/.  So, if /etc is messed up, logins will fail.
>  >>
>  >>   I don't see any fstab entries for /etc, meaning nothing hides =
its
>  >>   content.  Can you look at your readonly /etc file system (from =
your
>  >>   build artifacts, or inside your install image) to see if the =
files
>  >>   mentioned above are present?  But please note I am not an fstab
>  expert.
>  >>
>  >>   Good luck,
>  >>   Joseph
>  > I have no idea why the system runs in emergency mode. Feel free to
>  > give some thoughts on the issue, the below text lines are the =
content of the
>  startup log.
>  >
>  > [    2.044027][ 3] VFS: Mounted root (squashfs filesystem) readonly =
on
>  device 1:0.
>  > [    2.051540][ 3] devtmpfs: mounted
>  > [    2.055297][ 3] Freeing unused kernel memory: 1344K
>  > [    2.060279][ 3] Run /sbin/init as init process
>  > [    2.126531][ 3] systemd[1]: systemd 244.3+ running in system =
mode.
>  (+PAM -AUDIT -SELINUX -IMA -APPAR)
>  > [    2.148585][ 3] systemd[1]: Detected architecture arm64.
>  >
>  > Welcome to Phosphor OpenBMC (Phosphor OpenBMC Project Reference
>  Distro) 0.1.0!
>  >
>  > [    2.170085][ 3] systemd[1]: Set hostname to <phytium_arm64>.
>  > [    2.177862][ 3] random: systemd: uninitialized urandom read (16 =
bytes
>  read)
>  > [    2.184835][ 3] systemd[1]: Initializing machine ID from random
>  generator.
>  > [    2.191748][ 3] systemd[1]: Installed transient /etc/machine-id =
file.
>  > [    2.250899][ 3] random: systemd: uninitialized urandom read (16 =
bytes
>  read)
>  > [    2.257923][ 3] systemd[1]: system-getty.slice: unit configures =
an IP
>  firewall, but the local system.
>  > [    2.270618][ 3] systemd[1]: (This warning is only shown for the =
first unit
>  using IP firewalling.)
>  > [    2.280218][ 3] systemd[1]: Created slice system-getty.slice.
>  > [  OK  ] Created slice system-getty.slice.
>  > [    2.302077][ 3] random: systemd: uninitialized urandom read (16 =
bytes
>  read)
>  > [    2.309286][ 3] systemd[1]: Created slice =
system-serial\x2dgetty.slice.
>  > [  OK  ] Created slice system-serial\x2dgetty.slice.
>  > [    2.330128][ 3] systemd[1]: Started Dispatch Password Requests =
to
>  Console Directory Watch.
>  > [  OK  ] Started Dispatch Password =C3=A2=C3=80=C2=A6ts to Console =
Directory Watch.
>  > [    2.354103][ 3] systemd[1]: Started Forward Password Requests to =
Wall
>  Directory Watch.
>  > [  OK  ] Started Forward Password R=C3=A2=E2=82=AC=E2=80=A6uests to =
Wall Directory Watch.
>  > [    2.378081][ 3] systemd[1]: Reached target Paths.
>  > [  OK  ] Reached target Paths.
>  > [    2.394068][ 3] systemd[1]: Reached target Remote File Systems.
>  > [  OK  ] Reached target Remote File Systems.
>  > [    2.414068][ 3] systemd[1]: Reached target Slices.
>  > [  OK  ] Reached target Slices.
>  > [    2.430071][ 3] systemd[1]: Reached target Swap.
>  > [  OK  ] Reached target Swap.
>  > [    2.446293][ 3] systemd[1]: Listening on Syslog Socket.
>  > [  OK  ] Listening on Syslog Socket.
>  > [    2.467220][ 3] systemd[1]: Listening on Process Core Dump =
Socket.
>  > [  OK  ] Listening on Process Core Dump Socket.
>  > [    2.486120][ 3] systemd[1]: Listening on initctl Compatibility =
Named
>  Pipe.
>  > [  OK  ] Listening on initctl[    2.494822][ 0] usb 2-2: new =
SuperSpeed
>  Gen 1 USB device number 2 usingd
>  >   Compatibility Named Pipe.
>  > [    2.514215][ 3] systemd[1]: Listening on Journal Audit Socket.
>  > [  OK  ] Listening on Journal Audit Socket.
>  > [    2.532382][ 0] usb-storage 2-2:1.0: USB Mass Storage device =
detected
>  > [    2.538920][ 0] scsi host4: usb-storage 2-2:1.0
>  > [    2.546153][ 3] systemd[1]: Listening on Journal Socket =
(/dev/log).
>  > [  OK  ] Listening on Journal Socket (/dev/log).
>  > [    2.566158][ 3] systemd[1]: Listening on Journal Socket.
>  > [  OK  ] Listening on Journal Socket.
>  > [    2.590185][ 3] systemd[1]: Listening on Network Service Netlink
>  Socket.
>  > [  OK  ] Listening on Network Service Netlink Socket.
>  > [    2.610172][ 3] systemd[1]: Listening on udev Control Socket.
>  > [  OK  ] Listening on udev Control Socket.
>  > [    2.630125][ 3] systemd[1]: Listening on udev Kernel Socket.
>  > [  OK  ] Listening on udev Kernel Socket.
>  > [    2.651160][ 3] systemd[1]: Mounting Huge Pages File System...
>  >           Mounting Huge Pages File System...
>  > [    2.671120][ 3] systemd[1]: Mounting POSIX Message Queue File
>  System...
>  >           Mounting POSIX Message Queue File System...
>  > [    2.691112][ 1] systemd[1]: Mounting Kernel Debug File System...
>  >           Mounting Kernel Debug File System...
>  > [    2.714920][ 1] systemd[1]: Mounting Temporary Directory =
(/tmp)...
>  >           Mounting Temporary Directory (/tmp)...
>  > [    2.738097][ 1] systemd[1]: Condition check resulted in Create =
list of
>  static device nodes for the c.
>  > [    2.750575][ 1] systemd[1]: Starting File System Check on Root =
Device...
>  >           Starting File System Check on Root Device...
>  > [    2.771480][ 2] systemd[1]: Starting Journal Service...
>  >           Starting Journa[    2.777184][ 2] systemd[1]: Condition =
check
>  resulted in Load Kernel Modules .
>  > l Service...
>  > [    2.788090][ 2] systemd[1]: Condition check resulted in FUSE =
Control
>  File System being skipped.
>  > [    2.799386][ 2] systemd[1]: Mounting Kernel Configuration File
>  System...
>  >           Mounting Kernel Configuration File System...
>  > [    2.823495][ 2] systemd[1]: Starting Apply Kernel Variables...
>  >           Starting Apply Kernel Variables...
>  > [    2.843199][ 2] systemd[1]: Starting udev Coldplug all =
Devices...
>  >           Starting udev Coldplug all Devices...
>  > [    2.866823][ 2] systemd[1]: Started Journal Service.
>  > [  OK  ] Started Journal Service.
>  > [FAILED] Failed to mount Huge Pages File System.
>  > See 'systemctl status dev-hugepages.mount' for details.
>  > [FAILED] Failed to mount POSIX Message Queue File System.
>  > See 'systemctl status dev-mqueue.mount' for details.
>  > [FAILED] Failed to mount Kernel Debug File System.
>  > See 'systemctl status sys-kernel-debug.mount' for details.
>  > [FAILED] Failed to mount Temporary Directory (/tmp).
>  > See 'systemctl status tmp.mount' for details.
>  > [DEPEND] Dependency failed for Network Name Resolution.
>  > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  > [DEPEND] Dependency failed for Network Time Synchronization.
>  > [  OK  ] Started File System Check on Root Device.
>  > [FAILED] Failed to mount Kernel Configuration File System.
>  > See 'systemctl status sys-kernel-config.mount' for details.
>  > [  OK  ] Started Apply Kernel Variables.
>  > [  OK  ] Reached target Host and Network Name Lookups.
>  > [  OK  ] Reached target System Time Set.
>  > [  OK  ] Reached target System Time Synchronized.
>  >           Starting Remount Root and Kernel File Systems...
>  > [  OK  ] Started udev Coldplug all Devices.
>  > [FAILED] Failed to start Remount Root and Kernel File Systems.
>  > See 'systemctl status systemd-remount-fs.service' for details.
>  >           Starting Flush Journal to Persistent Storage...
>  > [    3.227668][ 3] systemd-journald[1452]: Received client request =
to flush
>  runtime journal.
>  >           Starting Create Static Device Nodes in /dev...
>  > [  OK  ] Started Flush Journal to Persistent Storage.
>  > [  OK  ] Started Create Static Device Nodes in /dev.
>  > [  OK  ] Reached target Local File Systems (Pre).
>  >           Mounting /var/volatile...
>  >           Starting udev Kernel Device Manager...
>  > [FAILED] Failed to mount /var/volatile.
>  > See 'systemctl status var-volatile.mount' for details.
>  > [DEPEND] Dependency failed for Bind mount volatile /var/cache.
>  > [DEPEND] Dependency failed for Local File Systems.
>  > [DEPEND] Dependency failed for Bind mount volatile /srv.
>  > [DEPEND] Dependency failed for Bind mount volatile /var/lib.
>  > [DEPEND] Dependency failed for Bind mount volatile /var/spool.
>  > [  OK  ] Started udev Kernel Device Manager.
>  > [    3.460610][ 0] random: fast init done
>  > [  OK  ] Stopped Dispatch Password =C3=A2=E2=82=AC=E2=80=A6ts to =
Console Directory Watch.
>  > [  OK  ] Stopped Forward Password R=C3=A2=E2=82=AC=E2=80=A6uests to =
Wall Directory Watch.
>  > [  OK  ] Reached target Timers.
>  > [    3.548046][ 0] scsi 4:0:0:0: Direct-Access      USB      =
SanDisk
>  3.2Gen1 1.00 PQ: 0 ANSI: 6
>  > [    3.556938][ 0] sd 4:0:0:0: [sdb] 240353280 512-byte logical =
blocks:
>  (123 GB/115 GiB)
>  > [    3.565978][ 1] sd 4:0:0:0: [sdb] Write Protect is off
>  > [  OK  ] Closed     3.572198][ 0] sd 4:0:0:0: [sdb] Write cache: =
disabled,
>  read cache: enabled, doesn'tA
>  > 39mSyslog Socket.
>  > [  OK  ] Reached targe[    3.595391][ 1]  sdb: sdb1
>  > t Login Prompts.
>  > [    3.603064][ 1] sd 4:0:0:0: [sdb] Attached SCSI removable disk
>  >           Starting Network Service...
>  >           Starting Load/Save Random Seed...
>  > [  OK  ] Reached target Sockets.
>  >           Mounting Kernel Configuration File System...
>  > [  OK  ] Started Emergency Shell.
>  > [  OK  ] Reached target Emergency Mode.
>  >           Starting Create Volatile Files and Directories...
>  > [  OK  ] Started Network Service.
>  > [  OK  ] Started Load/Save Random Seed.
>  > [FAILED] Failed to mount Kernel Configuration File System.
>  > See 'systemctl status sys-kernel-config.mount' for details.
>  > [  OK  ] Started Create Volatile Files and Directories.
>  > [  OK  ] Reached target Network.
>  >           Starting Run pending postinsts...
>  > [FAILED] Failed to start Run pending postinsts.
>  > See 'systemctl status run-postinsts.service' for details.
>  > You are in emergency mode. After logging in, type "journalctl -xb" =
to
>  > view systeGive root password for maintenance (or press Control-D to
>  > continue):
>  > Login incorrect
>  >
>  > Give root password for maintenance
>  > (or press Control-D to continue):
>  > Login incorrect
>  >
>  > Give root password for maintenance
>  > (or press Control-D to continue):
>  > Login incorrect
>  >
>  > Give root password for maintenance
>  > (or press Control-D to continue):
>  > Login incorrect
>  >
>  > Give root password for maintenance
>  > (or press Control-D to continue):
>  > Reloading system manager configuration Starting default target You =
are
>  > in emergency mode. After Give root password for maintenance (or =
press
>  > Control-D to continue):
>  > Login incorrect
>  >
>  > Give root password for maintenance
>  > (or press Control-D to continue):
>  > Login incorrect
>  >
>  > Give root password for maintenance
>  > (or press Control-D to continue):
>  > Reloading system manager configuration Starting default target You =
are
>  > in emergency mode. After Give root password for maintenance (or =
press
>  > Control-D to continue):
>  > ~ # devmem
>  > BusyBox v1.31.1 (2021-03-03 02:43:05 UTC) multi-call binary.
>  >
>  > Usage: devmem ADDRESS [WIDTH [VALUE]]
>  > ~ #
>  > CTRL-A Z for help | 115200 8N1 | NOR | Minicom 2.7 | VT102 | =
Offline |
>  > ttyUSB0
>  >
>  >>   > I am sorry, the startup log was pasted wrong contents in the =
last
>  >>   > email. The following texts are showing the
>  >>   >
>  >>   > startup log.
>  >>   >
>  >>   > [    8.450487][ 1] VFS: Mounted root (squashfs filesystem) =
readonly
>  on
>  >>   > device 1:0.
>  >>   >
>  >>   > [    8.457904][ 1] devtmpfs: mounted
>  >>   >
>  >>   > [    8.461538][ 1] Freeing unused kernel memory: 1344K
>  >>   >
>  >>   > [    8.466494][ 1] Run /sbin/init as init process
>  >>   >
>  >>   > [    8.561032][ 1] systemd[1]: systemd 244.3+ running in =
system
>  mode.
>  >>   > (+PAM -AUDIT -SELINUX -IMA -APPARMOR -SMACK +SYSVINIT -UTMP
>  >>   > -LIBCRYPTSETUP -GCRYPT -GNUTLS -ACL +XZ -LZ4 -SECCOMP +BLKID
>  >>   -ELFUTILS
>  >>   > +KMOD -IDN2 -IDN -PCRE2 default-hierarchy=3Dhybrid)
>  >>   >
>  >>   > [    8.583865][ 1] systemd[1]: Detected architecture arm64.
>  >>   >
>  >>   > [    8.589282][ 1] systemd[1]: Running with unpopulated /etc.
>  >>   >
>  >>   > Welcome to Phosphor OpenBMC (Phosphor OpenBMC Project
>  Reference
>  >>   > Distro) 0.1.0!
>  >>   >
>  >>   > [    8.616684][ 1] systemd[1]: Set hostname to <ft2500>.
>  >>   >
>  >>   > [    8.621737][ 1] systemd[1]: System cannot boot: Missing
>  >>   > /etc/machine-id and /etc is mounted read-only.
>  >>   >
>  >>   > [    8.631004][ 1] systemd[1]: Booting up is supported only =
when:
>  >>   >
>  >>   > [    8.636815][ 1] systemd[1]: 1) /etc/machine-id exists and =
is
>  populated.
>  >>   >
>  >>   > [    8.643403][ 1] systemd[1]: 2) /etc/machine-id exists and =
is
>  empty.
>  >>   >
>  >>   > [    8.649646][ 1] systemd[1]: 3) /etc/machine-id is missing =
and /etc
>  >>   > is writable.
>  >>   >
>  >>   > [    8.909871][ 1] systemd[1]: Failed to populate /etc with =
preset
>  >>   > unit settings, ignoring: Read-only file system
>  >>   >
>  >>   > [    8.953437][ 1] systemd[1]:
>  >>   > /lib/systemd/system/phosphor-ipmi-net@.socket:3: Invalid =
interface
>  >>   > name, ignoring: sys-subsystem-net-devices-%i.device
>  >>   >
>  >>   > [    8.987426][ 1] systemd[1]: Failed to put bus name to =
hashmap:
>  File
>  >>   > exists
>  >>   >
>  >>   > [    8.994294][ 1] systemd[1]:
>  xyz.openbmc_project.State.Host.service:
>  >>   > Two services allocated for the same bus name
>  >>   > xyz.openbmc_project.State.Host, refusing operation.
>  >>   >
>  >>   > [    9.010841][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-host-reset-running@.target+0 =E9=88=AB
>  obmc-host-reset-running@0.target
>  >>   >
>  >>   > [    9.023396][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-host-stop@.target+0 =E9=88=ABobmc-host-stop@0.target
>  >>   >
>  >>   > [    9.033834][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-host-startmin@.target+0 =
=E9=88=ABobmc-host-startmin@0.target
>  >>   >
>  >>   > [    9.047367][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-power-on@.target+0 =E9=88=ABobmc-power-on@0.target
>  >>   >
>  >>   > [    9.057600][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-power-start@.target+0 =E9=88=ABobmc-power-start@0.target
>  >>   >
>  >>   > [    9.072831][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-power-start-pre@.target+0 =
=E9=88=ABobmc-power-start-pre@0.target
>  >>   >
>  >>   > [    9.084856][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-host-started@.target+0 =
=E9=88=ABobmc-host-started@0.target
>  >>   >
>  >>   > [    9.095814][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-host-starting@.target+0 =
=E9=88=ABobmc-host-starting@0.target
>  >>   >
>  >>   > [    9.106930][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-host-start-pre@.target+0 =
=E9=88=ABobmc-host-start-pre@0.target
>  >>   >
>  >>   > [    9.122329][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-host-quiesce@.target+0 =
=E9=88=ABobmc-host-quiesce@0.target
>  >>   >
>  >>   > [    9.133285][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-chassis-poweroff@.target+0 =E9=88=AB
>  obmc-chassis-poweroff@0.target
>  >>   >
>  >>   > [    9.146007][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-power-off@.target+0 =E9=88=ABobmc-power-off@0.target
>  >>   >
>  >>   > [    9.156446][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-power-stop@.target+0 =E9=88=ABobmc-power-stop@0.target
>  >>   >
>  >>   > [    9.167236][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-power-stop-pre@.target+0 =
=E9=88=ABobmc-power-stop-pre@0.target
>  >>   >
>  >>   > [    9.179055][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-host-stopped@.target+0 =
=E9=88=ABobmc-host-stopped@0.target
>  >>   >
>  >>   > [    9.190016][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-host-stopping@.target+0 =
=E9=88=ABobmc-host-stopping@0.target
>  >>   >
>  >>   > [    9.201162][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-host-stop-pre@.target+0 =
=E9=88=ABobmc-host-stop-pre@0.target
>  >>   >
>  >>   > [    9.212993][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-chassis-powerreset@.target+0 =E9=88=AB
>  obmc-chassis-powerreset@0.target
>  >>   >
>  >>   > [    9.225026][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-chassis-poweron@.target+0 =E9=88=AB
>  obmc-chassis-poweron@0.target
>  >>   >
>  >>   > [    9.238767][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-chassis-powered-off@.target+0 =E9=88=AB
>  >>   obmc-chassis-powered-off@0.target
>  >>   >
>  >>   > [    9.272031][ 1] systemd[1]:
>  >>   > /lib/systemd/system/phosphor-pid-control.service:7: Neither a =
valid
>  >>   > executable name nor an absolute path: {bindir}/swampd
>  >>   >
>  >>   > [    9.285365][ 1] systemd[1]: phosphor-pid-control.service: =
Unit
>  >>   > configuration has fatal error, unit will not be started.
>  >>   >
>  >>   > [    9.308206][ 1] systemd[1]: unit_file_find_fragment:
>  >>   > obmc-host-reset@.target+0 =E9=88=ABobmc-host-reset@0.target
>  >>   >
>  >>   > [    9.332286][ 1] systemd[1]: phosphor-pid-control.service: =
Cannot
>  >>   > add dependency job, ignoring: Unit =
phosphor-pid-control.service has a
>  >>   > bad unit file setting.
>  >>   >
>  >>   > [    9.346322][ 1] systemd[1]:
>  xyz.openbmc_project.State.Host.service:
>  >>   > Cannot add dependency job, ignoring: Unit
>  >>   > xyz.openbmc_project.State.Host.service failed to load =
properly: File
>  >>   > exists.
>  >>   >
>  >>   > [    9.364178][ 1] random: systemd: uninitialized urandom read =
(16
>  >>   > bytes read)
>  >>   >
>  >>   > [    9.371220][ 1] systemd[1]: system-mapper\x2dwait.slice: =
unit
>  >>   > configures an IP firewall, but the local system does not =
support
>  >>   > BPF/cgroup firewalling.
>  >>   >
>  >>   > [    9.384639][ 1] systemd[1]: (This warning is only shown for =
the
>  >>   > first unit using IP firewalling.)
>  >>   >
>  >>   > [    9.394482][ 1] systemd[1]: Created slice
>  system-mapper\x2dwait.slice.
>  >>   >
>  >>   > [  OK  ] Created slice system-mapper\x2dwait.slice.
>  >>   >
>  >>   > [    9.415686][ 1] random: systemd: uninitialized urandom read =
(16
>  >>   > bytes read)
>  >>   >
>  >>   > [    9.422990][ 1] systemd[1]: Created slice
>  >>   system-obmc\x2dconsole.slice.
>  >>   >
>  >>   > [  OK  ] Created slice system-obmc\x2dconsole.slice.
>  >>   >
>  >>   > [    9.443668][ 1] random: systemd: uninitialized urandom read =
(16
>  >>   > bytes read)
>  >>   >
>  >>   > [    9.450959][ 1] systemd[1]: Created slice
>  >>   > system-obmc\x2dled\x2dgroup\x2dstart.slice.
>  >>   >
>  >>   > [  OK  ] Created slice =
system-obmc\x2dled\x2dgroup\x2dstart.slice.
>  >>   >
>  >>   > [    9.476116][ 1] systemd[1]: Created slice
>  >>   > system-org.openbmc.control.Host.slice.
>  >>   >
>  >>   > [  OK  ] Created slice system-org.openbmc.control.Host.slice.
>  >>   >
>  >>   > [    9.500025][ 1] systemd[1]: Created slice
>  >>   > system-phosphor\x2dcertificate\x2dmanager.slice.
>  >>   >
>  >>   > [  OK  ] Created slice =
system-phosp=E9=88=A5=EE=9B=8Acertificate\x2dmanager.slice.
>  >>   >
>  >>   > [    9.524018][ 1] systemd[1]: Created slice
>  >>   > system-phosphor\x2ddiscover\x2dsystem\x2dstate.slice.
>  >>   >
>  >>   > [  OK  ] Created slice system-phosp=E9=88=A5
>  =EE=9B=95ver\x2dsystem\x2dstate.slice.
>  >>   >
>  >>   > [    9.548011][ 1] systemd[1]: Created slice
>  >>   > system-phosphor\x2dipmi\x2dkcs.slice.
>  >>   >
>  >>   > [  OK  ] Created slice system-phosphor\x2dipmi\x2dkcs.slice.
>  >>   >
>  >>   > [    9.572014][ 1] systemd[1]: Created slice
>  >>   > system-phosphor\x2dipmi\x2dnet.slice.
>  >>   >
>  >>   > [  OK  ] Created slice system-phosphor\x2dipmi\x2dnet.slice.
>  >>   >
>  >>   > [    9.596078][ 1] systemd[1]: Created slice
>  >>   > system-phosphor\x2dreset\x2dhost\x2dcheck.slice.
>  >>   >
>  >>   > [  OK  ] Created slice system-phosp=E9=88=A5
>  =EE=9B=8Areset\x2dhost\x2dcheck.slice.
>  >>   >
>  >>   > [    9.620149][ 1] systemd[1]: Created slice
>  >>   > system-phosphor\x2dreset\x2dhost\x2drunning.slice.
>  >>   >
>  >>   > [  OK  ] Created slice system-phosp=E9=88=A5
>  =EE=9B=8Bset\x2dhost\x2drunning.slice.
>  >>   >
>  >>   > [    9.644060][ 1] systemd[1]: Created slice
>  >>   > system-phosphor\x2dreset\x2dsensor\x2dstates.slice.
>  >>   >
>  >>   > [  OK  ] Created slice =
system-phosp=E9=88=A5=EE=9B=99et\x2dsensor\x2dstates.slice.
>  >>   >
>  >>   > [    9.668015][ 1] systemd[1]: Created slice
>  system-serial\x2dgetty.slice.
>  >>   >
>  >>   > [  OK  ] Created slice system-serial\x2dgetty.slice.
>  >>   >
>  >>   > [    9.691756][ 1] systemd[1]: Started Dispatch Password =
Requests
>  to
>  >>   > Console Directory Watch.
>  >>   >
>  >>   > [  OK  ] Started Dispatch Password =E9=88=A5=EE=9B=9As to =
Console Directory
>  Watch.
>  >>   >
>  >>   > [    9.715715][ 1] systemd[1]: Started Forward Password =
Requests to
>  >>   > Wall Directory Watch.
>  >>   >
>  >>   > [  OK  ] Started Forward Password R=E9=88=A5=EE=9B=9Bests to =
Wall Directory
>  Watch.
>  >>   >
>  >>   > [    9.739718][ 1] systemd[1]: Reached target Paths.
>  >>   >
>  >>   > [  OK  ] Reached target Paths.
>  >>   >
>  >>   > [    9.759675][ 1] systemd[1]: Reached target Slices.
>  >>   >
>  >>   > [  OK  ] Reached target Slices.
>  >>   >
>  >>   > [    9.779675][ 1] systemd[1]: Reached target Swap.
>  >>   >
>  >>   > [  OK  ] Reached target Swap.
>  >>   >
>  >>   > [    9.800012][ 1] systemd[1]: Listening on Syslog Socket.
>  >>   >
>  >>   > [  OK  ] Listening on Syslog Socket.
>  >>   >
>  >>   > [    9.821145][ 1] systemd[1]: Listening on Process Core Dump
>  Socket.
>  >>   >
>  >>   > [  OK  ] Listening on Process Core Dump Socket.
>  >>   >
>  >>   > [    9.843743][ 1] systemd[1]: Listening on initctl =
Compatibility
>  >>   > Named Pipe.
>  >>   >
>  >>   > [  OK  ] Listening on initctl Compatibility Named Pipe.
>  >>   >
>  >>   > [    9.867847][ 1] systemd[1]: Listening on Journal Audit =
Socket.
>  >>   >
>  >>   > [  OK  ] Listening on Journal Audit Socket.
>  >>   >
>  >>   > [    9.887759][ 1] systemd[1]: Listening on Journal Socket =
(/dev/log).
>  >>   >
>  >>   > [  OK  ] Listening on Journal Socket (/dev/log).
>  >>   >
>  >>   > [    9.907805][ 1] systemd[1]: Listening on Journal Socket.
>  >>   >
>  >>   > [  OK  ] Listening on Journal Socket.
>  >>   >
>  >>   > [    9.927816][ 1] systemd[1]: Listening on udev Control =
Socket.
>  >>   >
>  >>   > [  OK  ] Listening on udev Control Socket.
>  >>   >
>  >>   > [    9.947744][ 1] systemd[1]: Listening on udev Kernel =
Socket.
>  >>   >
>  >>   > [  OK  ] Listening on udev Kernel Socket.
>  >>   >
>  >>   > [    9.969124][ 1] systemd[1]: Mounting Huge Pages File =
System...
>  >>   >
>  >>   >          Mounting Huge Pages File System...
>  >>   >
>  >>   > [    9.993276][ 1] systemd[1]: Mounting POSIX Message Queue =
File
>  >>   System...
>  >>   >
>  >>   >          Mounting POSIX Message Queue File System...
>  >>   >
>  >>   > [   10.017245][ 1] systemd[1]: Mounting Kernel Debug File =
System...
>  >>   >
>  >>   >          Mounting Kernel Debug File System...
>  >>   >
>  >>   > [   10.037219][ 1] systemd[1]: Mounting Temporary Directory
>  (/tmp)...
>  >>   >
>  >>   >          Mounting Temporary Directory (/tmp)...
>  >>   >
>  >>   > [   10.055761][ 1] systemd[1]: Condition check resulted in =
Create list
>  >>   > of static device nodes for the current kernel being skipped.
>  >>   >
>  >>   > [   10.068965][ 1] systemd[1]: Starting File System Check on =
Root
>  >>   > Device...
>  >>   >
>  >>   >          Starting File System Check on Root Device...
>  >>   >
>  >>   > [   10.093656][ 1] systemd[1]: Starting Journal Service...
>  >>   >
>  >>   >          Startin[ 10.099411][ 1] systemd[1]: Condition check
>  resulted
>  >>   > in Load Kernel Modules being skipped.
>  >>   >
>  >>   > g Journ[   10.108709][ 1] systemd[1]: Condition check resulted =
in
>  FUSE
>  >>   > Control File System being skipped.
>  >>   >
>  >>   > al Service...
>  >>   >
>  >>   > [   10.120331][ 1] systemd[1]: Mounting Kernel Configuration =
File
>  >>   > System...
>  >>   >
>  >>   >          Mounting Kernel Configuration File System...
>  >>   >
>  >>   > [   10.145358][ 1] systemd[1]: Starting Apply Kernel =
Variables...
>  >>   >
>  >>   >          Starting Apply Kernel Variables...
>  >>   >
>  >>   > [   10.165374][ 1] systemd[1]: Starting udev Coldplug all =
Devices...
>  >>   >
>  >>   >          Starting udev Coldplug all Devices...
>  >>   >
>  >>   > [   10.187869][ 1] systemd[1]: Condition check resulted in =
Bind
>  mount
>  >>   > volatile /var/cache being skipped.
>  >>   >
>  >>   > [   10.197113][ 1] systemd[1]: Condition check resulted in =
Bind
>  mount
>  >>   > volatile /var/lib being skipped.
>  >>   >
>  >>   > [   10.206189][ 1] systemd[1]: Condition check resulted in =
Bind
>  mount
>  >>   > volatile /var/spool being skipped.
>  >>   >
>  >>   > [   10.215515][ 1] systemd[1]: Condition check resulted in =
Bind
>  mount
>  >>   > volatile /srv being skipped.
>  >>   >
>  >>   > [   10.229131][ 1] systemd[1]: Started Hardware RNG Entropy
>  Gatherer
>  >>   > Daemon.
>  >>   >
>  >>   > [  OK  ] Started Hardware RNG Entropy Gatherer Daemon.
>  >>   >
>  >>   > [   10.252583][ 1] systemd[1]: Started Journal Service.
>  >>   >
>  >>   > [  OK  ] Started Journal Service.
>  >>   >
>  >>   > [FAILED] Failed to mount Huge Pages File System.
>  >>   >
>  >>   > See 'systemctl status dev-hugepages.mount' for details.
>  >>   >
>  >>   > [FAILED] Failed to mount POSIX Message Queue File System.
>  >>   >
>  >>   > See 'systemctl status dev-mqueue.mount' for details.
>  >>   >
>  >>   > [FAILED] Failed to mount Kernel Debug File System.
>  >>   >
>  >>   > See 'systemctl status sys-kernel-debug.mount' for details.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [  OK  ] Started File System Check on Root Device.
>  >>   >
>  >>   > [FAILED] Failed to mount Kernel Configuration File System.
>  >>   >
>  >>   > See 'systemctl status sys-kernel-config.mount' for details.
>  >>   >
>  >>   > [  OK  ] Started Apply Kernel Variables.
>  >>   >
>  >>   >          Starting Remount Root and Kernel File Systems...
>  >>   >
>  >>   > [FAILED] Failed to start Remount Root and Kernel File Syst[
>  >>   > 10.502419][ 0] random: fast init done
>  >>   >
>  >>   > ems.
>  >>   >
>  >>   > See 'systemctl status systemd-remount-fs.service' for details.
>  >>   >
>  >>   >          Starting Flush Journal to Persistent
>  >>   Storage   10.538824][21]
>  >>   > systemd-journald[2228]: Received client request to flush =
runtime
>  journal.
>  >>   >
>  >>   > 0m...
>  >>   >
>  >>   >          Starting Load/Save Random Seed...
>  >>   >
>  >>   >          Starting Create Static Device Nodes in /dev...
>  >>   >
>  >>   > [  OK  ] Started udev Coldplug all Devices.
>  >>   >
>  >>   > [  OK  ] Started Flush Journal to Persistent Storage.
>  >>   >
>  >>   > [  OK  ] Started Load/Save Random Seed.
>  >>   >
>  >>   > [  OK  ] Started Create Static Device Nodes in /dev.
>  >>   >
>  >>   > [  OK  ] Reached target Local File Systems (Pre).
>  >>   >
>  >>   > [  OK  ] Reached target Local File Systems.
>  >>   >
>  >>   >          Starting Create Volatile Files and Directories...
>  >>   >
>  >>   >          Starting udev Kernel Device Manager...
>  >>   >
>  >>   > [  OK  ] Started Create Volatile Files and Directories.
>  >>   >
>  >>   > [  OK  ] Started udev Kernel Device Manager.
>  >>   >
>  >>   >          Starting Run pending postinsts...
>  >>   >
>  >>   >          Mounting Kerne[   10.790127][27] igb 0000:04:00.1
>  >>   enp4s0f1:
>  >>   > renamed from eth1
>  >>   >
>  >>   > l Configuration File System...
>  >>   >
>  >>   > [FAILED] Failed to mount Kernel Configuration File System.
>  >>   >
>  >>   > [   10.827779][22] igb 0000:04:00.0 enp4s0f0: renamed from =
eth0
>  >>   >
>  >>   > See 'systemctl status sys-kernel-config.mount' for details.
>  >>   >
>  >>   > [   10.860175][51] igb 0000:04:00.3 enp4s0f3: renamed from =
eth3
>  >>   >
>  >>   > [FAILED] Failed to start Run pending postinsts.
>  >>   >
>  >>   > See 'systemctl status run-postinsts.service' for details.
>  >>   >
>  >>   > [   10.907728][57] igb 0000:04:00.2 enp4s0f2: renamed from =
eth2
>  >>   >
>  >>   > [  OK  ] Created slice system-xyz.openbmc_project.Hwmon.slice.
>  >>   >
>  >>   >          Mounting Huge Pages File System...
>  >>   >
>  >>   >          Mounting POSIX Message Queue File System...
>  >>   >
>  >>   >          Mounting Kernel Debug File System...
>  >>   >
>  >>   > [FAILED] Failed to mount Kernel Configuration File System.
>  >>   >
>  >>   > See 'systemctl status sys-kernel-config.mount' for details.
>  >>   >
>  >>   > [FAILED] Failed to mount Huge Pages File System.
>  >>   >
>  >>   > See 'systemctl status dev-hugepages.mount' for details.
>  >>   >
>  >>   > [FAILED] Failed to mount POSIX Message Queue File System.
>  >>   >
>  >>   > See 'systemctl status dev-mqueue.mount' for details.
>  >>   >
>  >>   > [FAILED] Failed to mount Kernel Debug File System.
>  >>   >
>  >>   > See 'systemctl status sys-kernel-debug.mount' for details.
>  >>   >
>  >>   > [  OK  ] Reached target System Initialization.
>  >>   >
>  >>   > [  OK  ] Started Daily rotation of log files.
>  >>   >
>  >>   > [  OK  ] Started Daily Cleanup of Temporary Directories.
>  >>   >
>  >>   > [  OK  ] Reached target Timers.
>  >>   >
>  >>   > [  OK  ] Listening on Avahi mDNS/DNS-SD Stack Activation =
Socket.
>  >>   >
>  >>   > [  OK  ] Listening on BMC Webserver socket.
>  >>   >
>  >>   > [  OK  ] Listening on D-Bus System Message Bus Socket.
>  >>   >
>  >>   > [  OK  ] Listening on dropbear.socket.
>  >>   >
>  >>   > [  OK  ] Listening on Phosphor Host=E9=88=A5=EE=9B=95le SSH =
Per-Connection
>  socket.
>  >>   >
>  >>   > [  OK  ] Listening on phosphor-ipmi-net@eth0.socket.
>  >>   >
>  >>   > [  OK  ] Reached target Sockets.
>  >>   >
>  >>   > [  OK  ] Reached target Basic System.
>  >>   >
>  >>   >          Starting Avahi mDNS/DNS-SD Stack...
>  >>   >
>  >>   >          Starting SSH Key Generation...
>  >>   >
>  >>   > [  OK  ] Started LPC Snoop Daemon.
>  >>   >
>  >>   >          Starting Name Service Cache Daemon...
>  >>   >
>  >>   >          Starting LDAP daemon...
>  >>   >
>  >>   > [  OK  ] Started ttyVUART0 Console Server.
>  >>   >
>  >>   >          Starting Host logging...
>  >>   >
>  >>   >          Starting OpenPOWER Host0 Control...
>  >>   >
>  >>   > [  OK  ] Started Phosphor certificate manager for authority.
>  >>   >
>  >>   > [  OK  ] Started Phosphor certificate manager for bmcweb.
>  >>   >
>  >>   > [  OK  ] Started Phosphor certificate manager for nslcd.
>  >>   >
>  >>   > [  OK  ] Started phosphor systemd target monitor.
>  >>   >
>  >>   >          Starting System Logging Service...
>  >>   >
>  >>   > [  OK  ] Started Lightweight SLP Server.
>  >>   >
>  >>   >          Starting Permit User Sessions...
>  >>   >
>  >>   >          Starting Intel Power Control...
>  >>   >
>  >>   >          Starting Phosphor Dump Manager...
>  >>   >
>  >>   >          Starting Entity Manager...
>  >>   >
>  >>   > [  OK  ] Started Fru Device.
>  >>   >
>  >>   >          Starting Phosphor Inventory Manager...
>  >>   >
>  >>   >          Starting Phosphor LDAP privilege mapper...
>  >>   >
>  >>   >          Starting Phosphor LED Group Management Daemon...
>  >>   >
>  >>   > [  OK  ] Started IPMI SEL Logging Service.
>  >>   >
>  >>   >          Starting Phosphor Log Manager...
>  >>   >
>  >>   >          Starting Phosphor DBus Service Discovery Manager...
>  >>   >
>  >>   >          Starting Phosphor Settings Daemon...
>  >>   >
>  >>   >          Starting Phosphor Download Manager...
>  >>   >
>  >>   >          Starting Post code manager...
>  >>   >
>  >>   >          Starting Rsyslog config updater...
>  >>   >
>  >>   >          Starting Phosphor User Manager...
>  >>   >
>  >>   > [  OK  ] Started System Logging Service.
>  >>   >
>  >>   > [FAILED] Failed to start SSH Key Generation.
>  >>   >
>  >>   > See 'systemctl status dropbearkey.service' for details.
>  >>   >
>  >>   > [FAILED] Failed to start Name Service Cache Daemon.
>  >>   >
>  >>   > See 'systemctl status nscd.service' for details.
>  >>   >
>  >>   > [  OK  ] Started LDAP daemon.
>  >>   >
>  >>   > [  OK  ] Started Permit User Sessions.
>  >>   >
>  >>   > [FAILED] Failed to start Phosphor Dump Manager.
>  >>   >
>  >>   > See 'systemctl status =
xyz.openbmc_project.Dump.Manager.service' for
>  >>   > details.
>  >>   >
>  >>   > [FAILED] Failed to start Entity Manager.
>  >>   >
>  >>   > See 'systemctl status =
xyz.openbmc_project.EntityManager.service' for
>  >>   > details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for MCU Temp Sensor.
>  >>   >
>  >>   > [DEPEND] Dependency failed for Hwmon Temp Sensor.
>  >>   >
>  >>   > [DEPEND] Dependency failed for PSU Sensor.
>  >>   >
>  >>   > [DEPEND] Dependency failed for Exit Air Temp Sensor.
>  >>   >
>  >>   > [DEPEND] Dependency failed for Adc Sensor.
>  >>   >
>  >>   > [DEPEND] Dependency failed for Intrusion Sensor.
>  >>   >
>  >>   > [DEPEND] Dependency failed for IPMB Sensor.
>  >>   >
>  >>   > [DEPEND] Dependency failed for Fan Sensor.
>  >>   >
>  >>   > [DEPEND] Dependency failed for CPU Sensor.
>  >>   >
>  >>   >          Mounting Temporary Directory (/tmp)...
>  >>   >
>  >>   > [  OK  ] Started Serial Getty on ttyS0.
>  >>   >
>  >>   > [  OK  ] Reached target Login Prompts.
>  >>   >
>  >>   >          Starting Phosphor Ldap config updater...
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > [   12.819393][23] random: crng init done
>  >>   >
>  >>   > [   12.823136][23] random: 7 urandom warning(s) missed due to
>  >>   ratelimiting
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [  OK  ] Stopped LPC Snoop Daemon.
>  >>   >
>  >>   > [  OK  ] Started LPC Snoop Daemon.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [  OK  ] Stopped Name Service Cache Daemon.
>  >>   >
>  >>   >          Starting Name Service Cache Daemon...
>  >>   >
>  >>   > [  OK  ] Stopped ttyVUART0 Console Server.
>  >>   >
>  >>   > [  OK  ] Started ttyVUART0 Console Server.
>  >>   >
>  >>   > [  OK  ] Stopped Lightweight SLP Server.
>  >>   >
>  >>   > [  OK  ] Started Lightweight SLP Server.
>  >>   >
>  >>   > [  OK  ] Stopped Phosphor Dump Manager.
>  >>   >
>  >>   >          Starting Phosphor Dump Manager...
>  >>   >
>  >>   > [FAILED] Failed to start Name Service Cache Daemon.
>  >>   >
>  >>   > See 'systemctl status nscd.service' for details.
>  >>   >
>  >>   > [FAILED] Failed to start Phosphor Dump Manager.
>  >>   >
>  >>   > See 'systemctl status =
xyz.openbmc_project.Dump.Manager.service' for
>  >>   > details.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [  OK  ] Stopped Entity Manager.
>  >>   >
>  >>   >          Starting Entity Manager...
>  >>   >
>  >>   > [FAILED] Failed to start Entity Manager.
>  >>   >
>  >>   > See 'systemctl status =
xyz.openbmc_project.EntityManager.service' for
>  >>   > details.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>  >>   >
>  >>   > See 'systemctl status tmp.mount' for details.
>  >>   >
>  >>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>  >>   >
>  >>   > [  OK  ] Stopped LPC Snoop Daemon.
>  >>   >
>  >>   > [FAILED] Failed to start LPC Snoop Daemon.
>  >>   >
>  >>   > See 'systemctl status lpcsnoop.service' for details.
>  >>   >
>  >>   > [  OK  ] Stopped Name Service Cache Daemon.
>  >>   >
>  >>   > [FAILED] Failed to start Name Service Cache Daemon.
>  >>   >
>  >>   > See 'systemctl status nscd.service' for details.
>  >>   >
>  >>   > [  OK  ] Stopped ttyVUART0 Console Server.
>  >>   >
>  >>   > [FAILED] Failed to start ttyVUART0 Console Server.
>  >>   >
>  >>   > See 'systemctl status obmc-console@ttyVUART0.service' for =
details.
>  >>   >
>  >>   > [  OK  ] Stopped Lightweight SLP Server.
>  >>   >
>  >>   > [FAILED] Failed to start Lightweight SLP Server.
>  >>   >
>  >>   > See 'systemctl status slpd-lite.service' for details.
>  >>   >
>  >>   > [  OK  ] Stopped Phosphor Dump Manager.
>  >>   >
>  >>   > [  OK  ] Listening on D-Bus System Message Bus Socket.
>  >>   >
>  >>   > [FAILED] Failed to start Phosphor Dump Manager.
>  >>   >
>  >>   > See 'systemctl status =
xyz.openbmc_project.Dump.Manager.service' for
>  >>   > details.
>  >>   >
>  >>   > [  OK  ] Stopped Entity Manager.
>  >>   >
>  >>   > [FAILED] Failed to start Entity Manager.
>  >>   >
>  >>   > See 'systemctl status =
xyz.openbmc_project.EntityManager.service' for
>  >>   > details.
>  >>   >
>  >>   > [   17.251376][24] audit: type=3D1701 audit(1616511064.752:2):
>  >>   > auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3552
>  >>   > comm=3D"phosphor-rsyslo" =
exe=3D"/usr/bin/phosphor-rsyslog-conf" sig=3D6
>  res=3D1
>  >>   >
>  >>   > [   17.267548][24] audit: type=3D1701 audit(1616511064.752:3):
>  >>   > auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3553
>  >>   > comm=3D"phosphor-user-m" =
exe=3D"/usr/bin/phosphor-user-manager"
>  sig=3D6
>  >>   res=3D1
>  >>   >
>  >>   > [   17.283681][24] audit: type=3D1701 audit(1616511064.752:4):
>  >>   > auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3525
>  >>   > comm=3D"phosphor-certif"
>  exe=3D"/usr/bin/phosphor-certificate-manager"
>  >>   > sig=3D6 res=3D1
>  >>   >
>  >>   > [   17.300416][24] audit: type=3D1701 audit(1616511064.752:5):
>  >>   > auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3550
>  >>   > comm=3D"phosphor-downlo"
>  exe=3D"/usr/bin/phosphor-download-manager"
>  >>   sig=3D6
>  >>   > res=3D1
>  >>   >
>  >>   > [   17.316868][24] audit: type=3D1701 audit(1616511064.752:6):
>  >>   > auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3543
>  >>   > comm=3D"phosphor-ldap-m" exe=3D"/usr/bin/phosphor-ldap-mapper"
>  sig=3D6
>  >>   res=3D1
>  >>   >
>  >>   > [   17.332888][24] audit: type=3D1701 audit(1616511064.752:7):
>  >>   > auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3528
>  >>   > comm=3D"phosphor-certif"
>  exe=3D"/usr/bin/phosphor-certificate-manager"
>  >>   > sig=3D6 res=3D1
>  >>   >
>  >>   > [   17.349614][24] audit: type=3D1701 audit(1616511064.752:8):
>  >>   > auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3544
>  >>   > comm=3D"phosphor-ledman" exe=3D"/usr/bin/phosphor-ledmanager"
>  sig=3D6
>  >>   res=3D1
>  >>   >
>  >>   > [   17.365550][24] audit: type=3D1701 audit(1616511064.752:9):
>  >>   > auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3551
>  >>   > comm=3D"post-code-manag" exe=3D"/usr/bin/post-code-manager" =
sig=3D6
>  res=3D1
>  >>   >
>  >>   > [   17.381328][24] audit: type=3D1701 =
audit(1616511064.752:10):
>  >>   > auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3526
>  >>   > comm=3D"phosphor-certif"
>  exe=3D"/usr/bin/phosphor-certificate-manager"
>  >>   > sig=3D6 res=3D1
>  >>   >
>  >>   > [   17.398133][24] audit: type=3D1701 =
audit(1616511064.752:11):
>  >>   > auid=3D4294967295 uid=3D0 gid=3D0 ses=3D4294967295 pid=3D3560
>  >>   > comm=3D"phosphor-ldap-c" exe=3D"/usr/bin/phosphor-ldap-conf" =
sig=3D6
>  res=3D1
>  >>   >
>  >>   > Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)
>  0.1.0
>  >>   > phytium_arm64 ttyS0
>  >>   >
>  >>   > phytium_arm64 login:
>  >>   >
>  >>   > phytium_arm64 login: root
>  >>   >
>  >>   > Login incorrect
>  >>   >
>  >>   > phytium_arm64 login: phytium
>  >>   >
>  >>   > Password:
>  >>   >
>  >>   > Login incorrect
>  >>   >
>  >>   > phytium_arm64 login:
>  >>   >
>  >>   > Log
>  >>   >
>  >>   > Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)
>  0.1.0
>  >>   > phytium_arm64 ttyS0
>  >>   >
>  >>   > phytium_arm64 login: root
>  >>   >
>  >>   > Login incorrect
>  >>   >
>  >>   > phytium_arm64 login: phytium
>  >>   >
>  >>   > Password:
>  >>   >
>  >>   > Login incorrect
>  >>   >
>  >>   > phytium_arm64 login: phytium
>  >>   >
>  >>   > Password:
>  >>   >
>  >>   > Login incorrect
>  >>   >
>  >>   > phytium_arm64 login: phytium
>  >>   >
>  >>   > Password:
>  >>   >
>  >>   > Login incorrect
>  >>   >
>  >>   > phytium_arm64 login: phytium
>  >>   >
>  >>   > Password:
>  >>   >
>  >>   > Log
>  >>   >
>  >>   > Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)
>  0.1.0
>  >>   > phytium_arm64 ttyS0
>  >>   >
>  >>   > phytium_arm64 login:
>  >>   >
>  >>   > phytium_arm64 login:
>  >>   >
>  >>   > phytium_arm64 login:
>  >>   >
>  >>   > phytium_arm64 login:
>  >>   >

