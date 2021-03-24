Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFCE347A29
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 15:05:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F593g3sYRz30GW
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 01:05:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aCe88nuo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aCe88nuo; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F593M5w9pz302c
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 01:04:46 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12OE2nMe100419; Wed, 24 Mar 2021 10:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=W0hPl2XeGhQT47MexhDQ2E/g2ZMkjNm1fCpDze0qCv0=;
 b=aCe88nuoJ5xt4k+Lj8ykyifECP0U7XEhlct7PBrHX4kWNUBze9EnGdBM/hV7ZRiHdxTr
 MxbtU5Z6xikUrLI4oA/6R/nhflxbITIjwvXmlGwsNTdektvpEdISiYVeEsh+1tSkCRWV
 vaHsVnTohXgxGsCVonGAoP60YycZcMiEbpZfpdaADUeTQytf1qamBDJ5kjcfXuzpzJP0
 zN8SMZjuK4h7081pLQ8jVByGJkPOSsbnLsVr3JR5Oi+SiYMREZ0jQOsyEu5kxtYpKvzE
 TY/qgjMjQR8bYRFd9RZ3uQ5YNpV7qTafEbUMHT1kxAMZdt4JFsLcsjA2izdqWuXIVsCm Zg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37g3p2e0dp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 10:04:42 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12OE2dME012646;
 Wed, 24 Mar 2021 14:04:41 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 37d9amwn7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 14:04:41 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12OE4eYd30081384
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 14:04:40 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F8F8AC059;
 Wed, 24 Mar 2021 14:04:40 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC6B1AC05F;
 Wed, 24 Mar 2021 14:04:39 +0000 (GMT)
Received: from demeter.local (unknown [9.160.86.38])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed, 24 Mar 2021 14:04:39 +0000 (GMT)
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW09wZW5CTUNdOiByb290IGlzIHJlamVjdGVkIHRv?=
 =?UTF-8?Q?_login_an_aarch64_openBmc_system?=
To: wangmin@phytium.com.cn, "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>
References: <!&!AAAAAAAAAAAuAAAAAAAAAO4CP8j4rjtAsuu29GjYeJQBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAABwHLy5A/79RoxKRBG5yGpSAQAAAAA=@phytium.com.cn>
 <3c7899d1-39c7-c0f4-7822-21fa8d66f709@linux.ibm.com>
 <!&!AAAAAAAAAAAuAAAAAAAAAO4CP8j4rjtAsuu29GjYeJQBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAABBDGRyySNtR7TzEws+7PMjAQAAAAA=@phytium.com.cn>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <d3f8c98d-be45-3545-7133-b4d8f2fcf817@linux.ibm.com>
Date: Wed, 24 Mar 2021 09:04:38 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <!&!AAAAAAAAAAAuAAAAAAAAAO4CP8j4rjtAsuu29GjYeJQBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAABBDGRyySNtR7TzEws+7PMjAQAAAAA=@phytium.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-24_10:2021-03-24,
 2021-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103240107
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

On 3/23/21 9:02 PM, wangmin@phytium.com.cn wrote:
>>   
>>   On 3/23/21 4:52 AM, wangmin@phytium.com.cn wrote:
>>   > I am sorry, the startup log was pasted wrong contents in the last
>>   > email. The following texts are showing the startup log. [ 8.450487][
>>   > 1] VFS: Mounted root (squashfs filesystem) readonly on device 1:0. ‍
>>   > ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍ ‍
>>   >
> Hi Joseph,
> Thank your response. I had uncommented the text line "tmpfs /var/volatile tmpfs defaults 0 0"
> in the file "/etc/fstab". The OpenBMC system runs in an emergency mode. User root is able to login
> the system.

Thanks for checking that.  It sounds like your BMC's /etc files are 
good.  Unfortunately, I have no experience with Linux configuration, 
startup, or emergency mode, so I cannot offer any help here.

- Joseph

>>   You asked why root login fails.  The log below shows a number of
>>   failures.  These include:
>>   > systemd[1]: Running with  unpopulated /etc.
>>   > systemd[1]: System cannot  boot: Missing /etc/machine-id and /etc is
>>   mounted read-only.
> I checked that the file "/etc/shadow" and the dirent "/etc/pam.d" exist.
>
>>   The root user login credentials are stored in /etc/passwd and
>>   /etc/shadow.  Also, the Linux-PAM authentication stack is stored under
>>   /etc/pam.d/.  So, if /etc is messed up, logins will fail.
>>   
>>   I don't see any fstab entries for /etc, meaning nothing hides its
>>   content.  Can you look at your readonly /etc file system (from your
>>   build artifacts, or inside your install image) to see if the files
>>   mentioned above are present?  But please note I am not an fstab expert.
>>   
>>   Good luck,
>>   Joseph
> I have no idea why the system runs in emergency mode. Feel free to give some thoughts
> on the issue, the below text lines are the content of the startup log.
>
> [    2.044027][ 3] VFS: Mounted root (squashfs filesystem) readonly on device 1:0.
> [    2.051540][ 3] devtmpfs: mounted
> [    2.055297][ 3] Freeing unused kernel memory: 1344K
> [    2.060279][ 3] Run /sbin/init as init process
> [    2.126531][ 3] systemd[1]: systemd 244.3+ running in system mode. (+PAM -AUDIT -SELINUX -IMA -APPAR)
> [    2.148585][ 3] systemd[1]: Detected architecture arm64.
>
> Welcome to Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0!
>
> [    2.170085][ 3] systemd[1]: Set hostname to <phytium_arm64>.
> [    2.177862][ 3] random: systemd: uninitialized urandom read (16 bytes read)
> [    2.184835][ 3] systemd[1]: Initializing machine ID from random generator.
> [    2.191748][ 3] systemd[1]: Installed transient /etc/machine-id file.
> [    2.250899][ 3] random: systemd: uninitialized urandom read (16 bytes read)
> [    2.257923][ 3] systemd[1]: system-getty.slice: unit configures an IP firewall, but the local system.
> [    2.270618][ 3] systemd[1]: (This warning is only shown for the first unit using IP firewalling.)
> [    2.280218][ 3] systemd[1]: Created slice system-getty.slice.
> [  OK  ] Created slice system-getty.slice.
> [    2.302077][ 3] random: systemd: uninitialized urandom read (16 bytes read)
> [    2.309286][ 3] systemd[1]: Created slice system-serial\x2dgetty.slice.
> [  OK  ] Created slice system-serial\x2dgetty.slice.
> [    2.330128][ 3] systemd[1]: Started Dispatch Password Requests to Console Directory Watch.
> [  OK  ] Started Dispatch Password âÀ¦ts to Console Directory Watch.
> [    2.354103][ 3] systemd[1]: Started Forward Password Requests to Wall Directory Watch.
> [  OK  ] Started Forward Password Râ€…uests to Wall Directory Watch.
> [    2.378081][ 3] systemd[1]: Reached target Paths.
> [  OK  ] Reached target Paths.
> [    2.394068][ 3] systemd[1]: Reached target Remote File Systems.
> [  OK  ] Reached target Remote File Systems.
> [    2.414068][ 3] systemd[1]: Reached target Slices.
> [  OK  ] Reached target Slices.
> [    2.430071][ 3] systemd[1]: Reached target Swap.
> [  OK  ] Reached target Swap.
> [    2.446293][ 3] systemd[1]: Listening on Syslog Socket.
> [  OK  ] Listening on Syslog Socket.
> [    2.467220][ 3] systemd[1]: Listening on Process Core Dump Socket.
> [  OK  ] Listening on Process Core Dump Socket.
> [    2.486120][ 3] systemd[1]: Listening on initctl Compatibility Named Pipe.
> [  OK  ] Listening on initctl[    2.494822][ 0] usb 2-2: new SuperSpeed Gen 1 USB device number 2 usingd
>   Compatibility Named Pipe.
> [    2.514215][ 3] systemd[1]: Listening on Journal Audit Socket.
> [  OK  ] Listening on Journal Audit Socket.
> [    2.532382][ 0] usb-storage 2-2:1.0: USB Mass Storage device detected
> [    2.538920][ 0] scsi host4: usb-storage 2-2:1.0
> [    2.546153][ 3] systemd[1]: Listening on Journal Socket (/dev/log).
> [  OK  ] Listening on Journal Socket (/dev/log).
> [    2.566158][ 3] systemd[1]: Listening on Journal Socket.
> [  OK  ] Listening on Journal Socket.
> [    2.590185][ 3] systemd[1]: Listening on Network Service Netlink Socket.
> [  OK  ] Listening on Network Service Netlink Socket.
> [    2.610172][ 3] systemd[1]: Listening on udev Control Socket.
> [  OK  ] Listening on udev Control Socket.
> [    2.630125][ 3] systemd[1]: Listening on udev Kernel Socket.
> [  OK  ] Listening on udev Kernel Socket.
> [    2.651160][ 3] systemd[1]: Mounting Huge Pages File System...
>           Mounting Huge Pages File System...
> [    2.671120][ 3] systemd[1]: Mounting POSIX Message Queue File System...
>           Mounting POSIX Message Queue File System...
> [    2.691112][ 1] systemd[1]: Mounting Kernel Debug File System...
>           Mounting Kernel Debug File System...
> [    2.714920][ 1] systemd[1]: Mounting Temporary Directory (/tmp)...
>           Mounting Temporary Directory (/tmp)...
> [    2.738097][ 1] systemd[1]: Condition check resulted in Create list of static device nodes for the c.
> [    2.750575][ 1] systemd[1]: Starting File System Check on Root Device...
>           Starting File System Check on Root Device...
> [    2.771480][ 2] systemd[1]: Starting Journal Service...
>           Starting Journa[    2.777184][ 2] systemd[1]: Condition check resulted in Load Kernel Modules .
> l Service...
> [    2.788090][ 2] systemd[1]: Condition check resulted in FUSE Control File System being skipped.
> [    2.799386][ 2] systemd[1]: Mounting Kernel Configuration File System...
>           Mounting Kernel Configuration File System...
> [    2.823495][ 2] systemd[1]: Starting Apply Kernel Variables...
>           Starting Apply Kernel Variables...
> [    2.843199][ 2] systemd[1]: Starting udev Coldplug all Devices...
>           Starting udev Coldplug all Devices...
> [    2.866823][ 2] systemd[1]: Started Journal Service.
> [  OK  ] Started Journal Service.
> [FAILED] Failed to mount Huge Pages File System.
> See 'systemctl status dev-hugepages.mount' for details.
> [FAILED] Failed to mount POSIX Message Queue File System.
> See 'systemctl status dev-mqueue.mount' for details.
> [FAILED] Failed to mount Kernel Debug File System.
> See 'systemctl status sys-kernel-debug.mount' for details.
> [FAILED] Failed to mount Temporary Directory (/tmp).
> See 'systemctl status tmp.mount' for details.
> [DEPEND] Dependency failed for Network Name Resolution.
> [DEPEND] Dependency failed for D-Bus System Message Bus.
> [DEPEND] Dependency failed for Network Time Synchronization.
> [  OK  ] Started File System Check on Root Device.
> [FAILED] Failed to mount Kernel Configuration File System.
> See 'systemctl status sys-kernel-config.mount' for details.
> [  OK  ] Started Apply Kernel Variables.
> [  OK  ] Reached target Host and Network Name Lookups.
> [  OK  ] Reached target System Time Set.
> [  OK  ] Reached target System Time Synchronized.
>           Starting Remount Root and Kernel File Systems...
> [  OK  ] Started udev Coldplug all Devices.
> [FAILED] Failed to start Remount Root and Kernel File Systems.
> See 'systemctl status systemd-remount-fs.service' for details.
>           Starting Flush Journal to Persistent Storage...
> [    3.227668][ 3] systemd-journald[1452]: Received client request to flush runtime journal.
>           Starting Create Static Device Nodes in /dev...
> [  OK  ] Started Flush Journal to Persistent Storage.
> [  OK  ] Started Create Static Device Nodes in /dev.
> [  OK  ] Reached target Local File Systems (Pre).
>           Mounting /var/volatile...
>           Starting udev Kernel Device Manager...
> [FAILED] Failed to mount /var/volatile.
> See 'systemctl status var-volatile.mount' for details.
> [DEPEND] Dependency failed for Bind mount volatile /var/cache.
> [DEPEND] Dependency failed for Local File Systems.
> [DEPEND] Dependency failed for Bind mount volatile /srv.
> [DEPEND] Dependency failed for Bind mount volatile /var/lib.
> [DEPEND] Dependency failed for Bind mount volatile /var/spool.
> [  OK  ] Started udev Kernel Device Manager.
> [    3.460610][ 0] random: fast init done
> [  OK  ] Stopped Dispatch Password â€…ts to Console Directory Watch.
> [  OK  ] Stopped Forward Password Râ€…uests to Wall Directory Watch.
> [  OK  ] Reached target Timers.
> [    3.548046][ 0] scsi 4:0:0:0: Direct-Access      USB      SanDisk 3.2Gen1 1.00 PQ: 0 ANSI: 6
> [    3.556938][ 0] sd 4:0:0:0: [sdb] 240353280 512-byte logical blocks: (123 GB/115 GiB)
> [    3.565978][ 1] sd 4:0:0:0: [sdb] Write Protect is off
> [  OK  ] Closed     3.572198][ 0] sd 4:0:0:0: [sdb] Write cache: disabled, read cache: enabled, doesn'tA
> 39mSyslog Socket.
> [  OK  ] Reached targe[    3.595391][ 1]  sdb: sdb1
> t Login Prompts.
> [    3.603064][ 1] sd 4:0:0:0: [sdb] Attached SCSI removable disk
>           Starting Network Service...
>           Starting Load/Save Random Seed...
> [  OK  ] Reached target Sockets.
>           Mounting Kernel Configuration File System...
> [  OK  ] Started Emergency Shell.
> [  OK  ] Reached target Emergency Mode.
>           Starting Create Volatile Files and Directories...
> [  OK  ] Started Network Service.
> [  OK  ] Started Load/Save Random Seed.
> [FAILED] Failed to mount Kernel Configuration File System.
> See 'systemctl status sys-kernel-config.mount' for details.
> [  OK  ] Started Create Volatile Files and Directories.
> [  OK  ] Reached target Network.
>           Starting Run pending postinsts...
> [FAILED] Failed to start Run pending postinsts.
> See 'systemctl status run-postinsts.service' for details.
> You are in emergency mode. After logging in, type "journalctl -xb" to view
> systeGive root password for maintenance
> (or press Control-D to continue):
> Login incorrect
>
> Give root password for maintenance
> (or press Control-D to continue):
> Login incorrect
>
> Give root password for maintenance
> (or press Control-D to continue):
> Login incorrect
>
> Give root password for maintenance
> (or press Control-D to continue):
> Login incorrect
>
> Give root password for maintenance
> (or press Control-D to continue):
> Reloading system manager configuration
> Starting default target
> You are in emergency mode. After Give root password for maintenance
> (or press Control-D to continue):
> Login incorrect
>
> Give root password for maintenance
> (or press Control-D to continue):
> Login incorrect
>
> Give root password for maintenance
> (or press Control-D to continue):
> Reloading system manager configuration
> Starting default target
> You are in emergency mode. After Give root password for maintenance
> (or press Control-D to continue):
> ~ # devmem
> BusyBox v1.31.1 (2021-03-03 02:43:05 UTC) multi-call binary.
>
> Usage: devmem ADDRESS [WIDTH [VALUE]]
> ~ #
> CTRL-A Z for help | 115200 8N1 | NOR | Minicom 2.7 | VT102 | Offline | ttyUSB0
>
>>   > I am sorry, the startup log was pasted wrong contents in the last
>>   > email. The following texts are showing the
>>   >
>>   > startup log.
>>   >
>>   > [    8.450487][ 1] VFS: Mounted root (squashfs filesystem) readonly on
>>   > device 1:0.
>>   >
>>   > [    8.457904][ 1] devtmpfs: mounted
>>   >
>>   > [    8.461538][ 1] Freeing unused kernel memory: 1344K
>>   >
>>   > [    8.466494][ 1] Run /sbin/init as init process
>>   >
>>   > [    8.561032][ 1] systemd[1]: systemd 244.3+ running in system mode.
>>   > (+PAM -AUDIT -SELINUX -IMA -APPARMOR -SMACK +SYSVINIT -UTMP
>>   > -LIBCRYPTSETUP -GCRYPT -GNUTLS -ACL +XZ -LZ4 -SECCOMP +BLKID
>>   -ELFUTILS
>>   > +KMOD -IDN2 -IDN -PCRE2 default-hierarchy=hybrid)
>>   >
>>   > [    8.583865][ 1] systemd[1]: Detected architecture arm64.
>>   >
>>   > [    8.589282][ 1] systemd[1]: Running with unpopulated /etc.
>>   >
>>   > Welcome to Phosphor OpenBMC (Phosphor OpenBMC Project Reference
>>   > Distro) 0.1.0!
>>   >
>>   > [    8.616684][ 1] systemd[1]: Set hostname to <ft2500>.
>>   >
>>   > [    8.621737][ 1] systemd[1]: System cannot boot: Missing
>>   > /etc/machine-id and /etc is mounted read-only.
>>   >
>>   > [    8.631004][ 1] systemd[1]: Booting up is supported only when:
>>   >
>>   > [    8.636815][ 1] systemd[1]: 1) /etc/machine-id exists and is populated.
>>   >
>>   > [    8.643403][ 1] systemd[1]: 2) /etc/machine-id exists and is empty.
>>   >
>>   > [    8.649646][ 1] systemd[1]: 3) /etc/machine-id is missing and /etc
>>   > is writable.
>>   >
>>   > [    8.909871][ 1] systemd[1]: Failed to populate /etc with preset
>>   > unit settings, ignoring: Read-only file system
>>   >
>>   > [    8.953437][ 1] systemd[1]:
>>   > /lib/systemd/system/phosphor-ipmi-net@.socket:3: Invalid interface
>>   > name, ignoring: sys-subsystem-net-devices-%i.device
>>   >
>>   > [    8.987426][ 1] systemd[1]: Failed to put bus name to hashmap: File
>>   > exists
>>   >
>>   > [    8.994294][ 1] systemd[1]: xyz.openbmc_project.State.Host.service:
>>   > Two services allocated for the same bus name
>>   > xyz.openbmc_project.State.Host, refusing operation.
>>   >
>>   > [    9.010841][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-host-reset-running@.target+0 鈫obmc-host-reset-running@0.target
>>   >
>>   > [    9.023396][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-host-stop@.target+0 鈫obmc-host-stop@0.target
>>   >
>>   > [    9.033834][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-host-startmin@.target+0 鈫obmc-host-startmin@0.target
>>   >
>>   > [    9.047367][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-power-on@.target+0 鈫obmc-power-on@0.target
>>   >
>>   > [    9.057600][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-power-start@.target+0 鈫obmc-power-start@0.target
>>   >
>>   > [    9.072831][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-power-start-pre@.target+0 鈫obmc-power-start-pre@0.target
>>   >
>>   > [    9.084856][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-host-started@.target+0 鈫obmc-host-started@0.target
>>   >
>>   > [    9.095814][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-host-starting@.target+0 鈫obmc-host-starting@0.target
>>   >
>>   > [    9.106930][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-host-start-pre@.target+0 鈫obmc-host-start-pre@0.target
>>   >
>>   > [    9.122329][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-host-quiesce@.target+0 鈫obmc-host-quiesce@0.target
>>   >
>>   > [    9.133285][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-chassis-poweroff@.target+0 鈫obmc-chassis-poweroff@0.target
>>   >
>>   > [    9.146007][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-power-off@.target+0 鈫obmc-power-off@0.target
>>   >
>>   > [    9.156446][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-power-stop@.target+0 鈫obmc-power-stop@0.target
>>   >
>>   > [    9.167236][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-power-stop-pre@.target+0 鈫obmc-power-stop-pre@0.target
>>   >
>>   > [    9.179055][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-host-stopped@.target+0 鈫obmc-host-stopped@0.target
>>   >
>>   > [    9.190016][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-host-stopping@.target+0 鈫obmc-host-stopping@0.target
>>   >
>>   > [    9.201162][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-host-stop-pre@.target+0 鈫obmc-host-stop-pre@0.target
>>   >
>>   > [    9.212993][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-chassis-powerreset@.target+0 鈫obmc-chassis-powerreset@0.target
>>   >
>>   > [    9.225026][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-chassis-poweron@.target+0 鈫obmc-chassis-poweron@0.target
>>   >
>>   > [    9.238767][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-chassis-powered-off@.target+0 鈫
>>   obmc-chassis-powered-off@0.target
>>   >
>>   > [    9.272031][ 1] systemd[1]:
>>   > /lib/systemd/system/phosphor-pid-control.service:7: Neither a valid
>>   > executable name nor an absolute path: {bindir}/swampd
>>   >
>>   > [    9.285365][ 1] systemd[1]: phosphor-pid-control.service: Unit
>>   > configuration has fatal error, unit will not be started.
>>   >
>>   > [    9.308206][ 1] systemd[1]: unit_file_find_fragment:
>>   > obmc-host-reset@.target+0 鈫obmc-host-reset@0.target
>>   >
>>   > [    9.332286][ 1] systemd[1]: phosphor-pid-control.service: Cannot
>>   > add dependency job, ignoring: Unit phosphor-pid-control.service has a
>>   > bad unit file setting.
>>   >
>>   > [    9.346322][ 1] systemd[1]: xyz.openbmc_project.State.Host.service:
>>   > Cannot add dependency job, ignoring: Unit
>>   > xyz.openbmc_project.State.Host.service failed to load properly: File
>>   > exists.
>>   >
>>   > [    9.364178][ 1] random: systemd: uninitialized urandom read (16
>>   > bytes read)
>>   >
>>   > [    9.371220][ 1] systemd[1]: system-mapper\x2dwait.slice: unit
>>   > configures an IP firewall, but the local system does not support
>>   > BPF/cgroup firewalling.
>>   >
>>   > [    9.384639][ 1] systemd[1]: (This warning is only shown for the
>>   > first unit using IP firewalling.)
>>   >
>>   > [    9.394482][ 1] systemd[1]: Created slice system-mapper\x2dwait.slice.
>>   >
>>   > [  OK  ] Created slice system-mapper\x2dwait.slice.
>>   >
>>   > [    9.415686][ 1] random: systemd: uninitialized urandom read (16
>>   > bytes read)
>>   >
>>   > [    9.422990][ 1] systemd[1]: Created slice
>>   system-obmc\x2dconsole.slice.
>>   >
>>   > [  OK  ] Created slice system-obmc\x2dconsole.slice.
>>   >
>>   > [    9.443668][ 1] random: systemd: uninitialized urandom read (16
>>   > bytes read)
>>   >
>>   > [    9.450959][ 1] systemd[1]: Created slice
>>   > system-obmc\x2dled\x2dgroup\x2dstart.slice.
>>   >
>>   > [  OK  ] Created slice system-obmc\x2dled\x2dgroup\x2dstart.slice.
>>   >
>>   > [    9.476116][ 1] systemd[1]: Created slice
>>   > system-org.openbmc.control.Host.slice.
>>   >
>>   > [  OK  ] Created slice system-org.openbmc.control.Host.slice.
>>   >
>>   > [    9.500025][ 1] systemd[1]: Created slice
>>   > system-phosphor\x2dcertificate\x2dmanager.slice.
>>   >
>>   > [  OK  ] Created slice system-phosp鈥certificate\x2dmanager.slice.
>>   >
>>   > [    9.524018][ 1] systemd[1]: Created slice
>>   > system-phosphor\x2ddiscover\x2dsystem\x2dstate.slice.
>>   >
>>   > [  OK  ] Created slice system-phosp鈥ver\x2dsystem\x2dstate.slice.
>>   >
>>   > [    9.548011][ 1] systemd[1]: Created slice
>>   > system-phosphor\x2dipmi\x2dkcs.slice.
>>   >
>>   > [  OK  ] Created slice system-phosphor\x2dipmi\x2dkcs.slice.
>>   >
>>   > [    9.572014][ 1] systemd[1]: Created slice
>>   > system-phosphor\x2dipmi\x2dnet.slice.
>>   >
>>   > [  OK  ] Created slice system-phosphor\x2dipmi\x2dnet.slice.
>>   >
>>   > [    9.596078][ 1] systemd[1]: Created slice
>>   > system-phosphor\x2dreset\x2dhost\x2dcheck.slice.
>>   >
>>   > [  OK  ] Created slice system-phosp鈥reset\x2dhost\x2dcheck.slice.
>>   >
>>   > [    9.620149][ 1] systemd[1]: Created slice
>>   > system-phosphor\x2dreset\x2dhost\x2drunning.slice.
>>   >
>>   > [  OK  ] Created slice system-phosp鈥set\x2dhost\x2drunning.slice.
>>   >
>>   > [    9.644060][ 1] systemd[1]: Created slice
>>   > system-phosphor\x2dreset\x2dsensor\x2dstates.slice.
>>   >
>>   > [  OK  ] Created slice system-phosp鈥et\x2dsensor\x2dstates.slice.
>>   >
>>   > [    9.668015][ 1] systemd[1]: Created slice system-serial\x2dgetty.slice.
>>   >
>>   > [  OK  ] Created slice system-serial\x2dgetty.slice.
>>   >
>>   > [    9.691756][ 1] systemd[1]: Started Dispatch Password Requests to
>>   > Console Directory Watch.
>>   >
>>   > [  OK  ] Started Dispatch Password 鈥s to Console Directory Watch.
>>   >
>>   > [    9.715715][ 1] systemd[1]: Started Forward Password Requests to
>>   > Wall Directory Watch.
>>   >
>>   > [  OK  ] Started Forward Password R鈥ests to Wall Directory Watch.
>>   >
>>   > [    9.739718][ 1] systemd[1]: Reached target Paths.
>>   >
>>   > [  OK  ] Reached target Paths.
>>   >
>>   > [    9.759675][ 1] systemd[1]: Reached target Slices.
>>   >
>>   > [  OK  ] Reached target Slices.
>>   >
>>   > [    9.779675][ 1] systemd[1]: Reached target Swap.
>>   >
>>   > [  OK  ] Reached target Swap.
>>   >
>>   > [    9.800012][ 1] systemd[1]: Listening on Syslog Socket.
>>   >
>>   > [  OK  ] Listening on Syslog Socket.
>>   >
>>   > [    9.821145][ 1] systemd[1]: Listening on Process Core Dump Socket.
>>   >
>>   > [  OK  ] Listening on Process Core Dump Socket.
>>   >
>>   > [    9.843743][ 1] systemd[1]: Listening on initctl Compatibility
>>   > Named Pipe.
>>   >
>>   > [  OK  ] Listening on initctl Compatibility Named Pipe.
>>   >
>>   > [    9.867847][ 1] systemd[1]: Listening on Journal Audit Socket.
>>   >
>>   > [  OK  ] Listening on Journal Audit Socket.
>>   >
>>   > [    9.887759][ 1] systemd[1]: Listening on Journal Socket (/dev/log).
>>   >
>>   > [  OK  ] Listening on Journal Socket (/dev/log).
>>   >
>>   > [    9.907805][ 1] systemd[1]: Listening on Journal Socket.
>>   >
>>   > [  OK  ] Listening on Journal Socket.
>>   >
>>   > [    9.927816][ 1] systemd[1]: Listening on udev Control Socket.
>>   >
>>   > [  OK  ] Listening on udev Control Socket.
>>   >
>>   > [    9.947744][ 1] systemd[1]: Listening on udev Kernel Socket.
>>   >
>>   > [  OK  ] Listening on udev Kernel Socket.
>>   >
>>   > [    9.969124][ 1] systemd[1]: Mounting Huge Pages File System...
>>   >
>>   >          Mounting Huge Pages File System...
>>   >
>>   > [    9.993276][ 1] systemd[1]: Mounting POSIX Message Queue File
>>   System...
>>   >
>>   >          Mounting POSIX Message Queue File System...
>>   >
>>   > [   10.017245][ 1] systemd[1]: Mounting Kernel Debug File System...
>>   >
>>   >          Mounting Kernel Debug File System...
>>   >
>>   > [   10.037219][ 1] systemd[1]: Mounting Temporary Directory (/tmp)...
>>   >
>>   >          Mounting Temporary Directory (/tmp)...
>>   >
>>   > [   10.055761][ 1] systemd[1]: Condition check resulted in Create list
>>   > of static device nodes for the current kernel being skipped.
>>   >
>>   > [   10.068965][ 1] systemd[1]: Starting File System Check on Root
>>   > Device...
>>   >
>>   >          Starting File System Check on Root Device...
>>   >
>>   > [   10.093656][ 1] systemd[1]: Starting Journal Service...
>>   >
>>   >          Startin[ 10.099411][ 1] systemd[1]: Condition check resulted
>>   > in Load Kernel Modules being skipped.
>>   >
>>   > g Journ[   10.108709][ 1] systemd[1]: Condition check resulted in FUSE
>>   > Control File System being skipped.
>>   >
>>   > al Service...
>>   >
>>   > [   10.120331][ 1] systemd[1]: Mounting Kernel Configuration File
>>   > System...
>>   >
>>   >          Mounting Kernel Configuration File System...
>>   >
>>   > [   10.145358][ 1] systemd[1]: Starting Apply Kernel Variables...
>>   >
>>   >          Starting Apply Kernel Variables...
>>   >
>>   > [   10.165374][ 1] systemd[1]: Starting udev Coldplug all Devices...
>>   >
>>   >          Starting udev Coldplug all Devices...
>>   >
>>   > [   10.187869][ 1] systemd[1]: Condition check resulted in Bind mount
>>   > volatile /var/cache being skipped.
>>   >
>>   > [   10.197113][ 1] systemd[1]: Condition check resulted in Bind mount
>>   > volatile /var/lib being skipped.
>>   >
>>   > [   10.206189][ 1] systemd[1]: Condition check resulted in Bind mount
>>   > volatile /var/spool being skipped.
>>   >
>>   > [   10.215515][ 1] systemd[1]: Condition check resulted in Bind mount
>>   > volatile /srv being skipped.
>>   >
>>   > [   10.229131][ 1] systemd[1]: Started Hardware RNG Entropy Gatherer
>>   > Daemon.
>>   >
>>   > [  OK  ] Started Hardware RNG Entropy Gatherer Daemon.
>>   >
>>   > [   10.252583][ 1] systemd[1]: Started Journal Service.
>>   >
>>   > [  OK  ] Started Journal Service.
>>   >
>>   > [FAILED] Failed to mount Huge Pages File System.
>>   >
>>   > See 'systemctl status dev-hugepages.mount' for details.
>>   >
>>   > [FAILED] Failed to mount POSIX Message Queue File System.
>>   >
>>   > See 'systemctl status dev-mqueue.mount' for details.
>>   >
>>   > [FAILED] Failed to mount Kernel Debug File System.
>>   >
>>   > See 'systemctl status sys-kernel-debug.mount' for details.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [  OK  ] Started File System Check on Root Device.
>>   >
>>   > [FAILED] Failed to mount Kernel Configuration File System.
>>   >
>>   > See 'systemctl status sys-kernel-config.mount' for details.
>>   >
>>   > [  OK  ] Started Apply Kernel Variables.
>>   >
>>   >          Starting Remount Root and Kernel File Systems...
>>   >
>>   > [FAILED] Failed to start Remount Root and Kernel File Syst[
>>   > 10.502419][ 0] random: fast init done
>>   >
>>   > ems.
>>   >
>>   > See 'systemctl status systemd-remount-fs.service' for details.
>>   >
>>   >          Starting Flush Journal to Persistent
>>   Storage   10.538824][21]
>>   > systemd-journald[2228]: Received client request to flush runtime journal.
>>   >
>>   > 0m...
>>   >
>>   >          Starting Load/Save Random Seed...
>>   >
>>   >          Starting Create Static Device Nodes in /dev...
>>   >
>>   > [  OK  ] Started udev Coldplug all Devices.
>>   >
>>   > [  OK  ] Started Flush Journal to Persistent Storage.
>>   >
>>   > [  OK  ] Started Load/Save Random Seed.
>>   >
>>   > [  OK  ] Started Create Static Device Nodes in /dev.
>>   >
>>   > [  OK  ] Reached target Local File Systems (Pre).
>>   >
>>   > [  OK  ] Reached target Local File Systems.
>>   >
>>   >          Starting Create Volatile Files and Directories...
>>   >
>>   >          Starting udev Kernel Device Manager...
>>   >
>>   > [  OK  ] Started Create Volatile Files and Directories.
>>   >
>>   > [  OK  ] Started udev Kernel Device Manager.
>>   >
>>   >          Starting Run pending postinsts...
>>   >
>>   >          Mounting Kerne[   10.790127][27] igb 0000:04:00.1
>>   enp4s0f1:
>>   > renamed from eth1
>>   >
>>   > l Configuration File System...
>>   >
>>   > [FAILED] Failed to mount Kernel Configuration File System.
>>   >
>>   > [   10.827779][22] igb 0000:04:00.0 enp4s0f0: renamed from eth0
>>   >
>>   > See 'systemctl status sys-kernel-config.mount' for details.
>>   >
>>   > [   10.860175][51] igb 0000:04:00.3 enp4s0f3: renamed from eth3
>>   >
>>   > [FAILED] Failed to start Run pending postinsts.
>>   >
>>   > See 'systemctl status run-postinsts.service' for details.
>>   >
>>   > [   10.907728][57] igb 0000:04:00.2 enp4s0f2: renamed from eth2
>>   >
>>   > [  OK  ] Created slice system-xyz.openbmc_project.Hwmon.slice.
>>   >
>>   >          Mounting Huge Pages File System...
>>   >
>>   >          Mounting POSIX Message Queue File System...
>>   >
>>   >          Mounting Kernel Debug File System...
>>   >
>>   > [FAILED] Failed to mount Kernel Configuration File System.
>>   >
>>   > See 'systemctl status sys-kernel-config.mount' for details.
>>   >
>>   > [FAILED] Failed to mount Huge Pages File System.
>>   >
>>   > See 'systemctl status dev-hugepages.mount' for details.
>>   >
>>   > [FAILED] Failed to mount POSIX Message Queue File System.
>>   >
>>   > See 'systemctl status dev-mqueue.mount' for details.
>>   >
>>   > [FAILED] Failed to mount Kernel Debug File System.
>>   >
>>   > See 'systemctl status sys-kernel-debug.mount' for details.
>>   >
>>   > [  OK  ] Reached target System Initialization.
>>   >
>>   > [  OK  ] Started Daily rotation of log files.
>>   >
>>   > [  OK  ] Started Daily Cleanup of Temporary Directories.
>>   >
>>   > [  OK  ] Reached target Timers.
>>   >
>>   > [  OK  ] Listening on Avahi mDNS/DNS-SD Stack Activation Socket.
>>   >
>>   > [  OK  ] Listening on BMC Webserver socket.
>>   >
>>   > [  OK  ] Listening on D-Bus System Message Bus Socket.
>>   >
>>   > [  OK  ] Listening on dropbear.socket.
>>   >
>>   > [  OK  ] Listening on Phosphor Host鈥le SSH Per-Connection socket.
>>   >
>>   > [  OK  ] Listening on phosphor-ipmi-net@eth0.socket.
>>   >
>>   > [  OK  ] Reached target Sockets.
>>   >
>>   > [  OK  ] Reached target Basic System.
>>   >
>>   >          Starting Avahi mDNS/DNS-SD Stack...
>>   >
>>   >          Starting SSH Key Generation...
>>   >
>>   > [  OK  ] Started LPC Snoop Daemon.
>>   >
>>   >          Starting Name Service Cache Daemon...
>>   >
>>   >          Starting LDAP daemon...
>>   >
>>   > [  OK  ] Started ttyVUART0 Console Server.
>>   >
>>   >          Starting Host logging...
>>   >
>>   >          Starting OpenPOWER Host0 Control...
>>   >
>>   > [  OK  ] Started Phosphor certificate manager for authority.
>>   >
>>   > [  OK  ] Started Phosphor certificate manager for bmcweb.
>>   >
>>   > [  OK  ] Started Phosphor certificate manager for nslcd.
>>   >
>>   > [  OK  ] Started phosphor systemd target monitor.
>>   >
>>   >          Starting System Logging Service...
>>   >
>>   > [  OK  ] Started Lightweight SLP Server.
>>   >
>>   >          Starting Permit User Sessions...
>>   >
>>   >          Starting Intel Power Control...
>>   >
>>   >          Starting Phosphor Dump Manager...
>>   >
>>   >          Starting Entity Manager...
>>   >
>>   > [  OK  ] Started Fru Device.
>>   >
>>   >          Starting Phosphor Inventory Manager...
>>   >
>>   >          Starting Phosphor LDAP privilege mapper...
>>   >
>>   >          Starting Phosphor LED Group Management Daemon...
>>   >
>>   > [  OK  ] Started IPMI SEL Logging Service.
>>   >
>>   >          Starting Phosphor Log Manager...
>>   >
>>   >          Starting Phosphor DBus Service Discovery Manager...
>>   >
>>   >          Starting Phosphor Settings Daemon...
>>   >
>>   >          Starting Phosphor Download Manager...
>>   >
>>   >          Starting Post code manager...
>>   >
>>   >          Starting Rsyslog config updater...
>>   >
>>   >          Starting Phosphor User Manager...
>>   >
>>   > [  OK  ] Started System Logging Service.
>>   >
>>   > [FAILED] Failed to start SSH Key Generation.
>>   >
>>   > See 'systemctl status dropbearkey.service' for details.
>>   >
>>   > [FAILED] Failed to start Name Service Cache Daemon.
>>   >
>>   > See 'systemctl status nscd.service' for details.
>>   >
>>   > [  OK  ] Started LDAP daemon.
>>   >
>>   > [  OK  ] Started Permit User Sessions.
>>   >
>>   > [FAILED] Failed to start Phosphor Dump Manager.
>>   >
>>   > See 'systemctl status xyz.openbmc_project.Dump.Manager.service' for
>>   > details.
>>   >
>>   > [FAILED] Failed to start Entity Manager.
>>   >
>>   > See 'systemctl status xyz.openbmc_project.EntityManager.service' for
>>   > details.
>>   >
>>   > [DEPEND] Dependency failed for MCU Temp Sensor.
>>   >
>>   > [DEPEND] Dependency failed for Hwmon Temp Sensor.
>>   >
>>   > [DEPEND] Dependency failed for PSU Sensor.
>>   >
>>   > [DEPEND] Dependency failed for Exit Air Temp Sensor.
>>   >
>>   > [DEPEND] Dependency failed for Adc Sensor.
>>   >
>>   > [DEPEND] Dependency failed for Intrusion Sensor.
>>   >
>>   > [DEPEND] Dependency failed for IPMB Sensor.
>>   >
>>   > [DEPEND] Dependency failed for Fan Sensor.
>>   >
>>   > [DEPEND] Dependency failed for CPU Sensor.
>>   >
>>   >          Mounting Temporary Directory (/tmp)...
>>   >
>>   > [  OK  ] Started Serial Getty on ttyS0.
>>   >
>>   > [  OK  ] Reached target Login Prompts.
>>   >
>>   >          Starting Phosphor Ldap config updater...
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > [   12.819393][23] random: crng init done
>>   >
>>   > [   12.823136][23] random: 7 urandom warning(s) missed due to
>>   ratelimiting
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [  OK  ] Stopped LPC Snoop Daemon.
>>   >
>>   > [  OK  ] Started LPC Snoop Daemon.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [  OK  ] Stopped Name Service Cache Daemon.
>>   >
>>   >          Starting Name Service Cache Daemon...
>>   >
>>   > [  OK  ] Stopped ttyVUART0 Console Server.
>>   >
>>   > [  OK  ] Started ttyVUART0 Console Server.
>>   >
>>   > [  OK  ] Stopped Lightweight SLP Server.
>>   >
>>   > [  OK  ] Started Lightweight SLP Server.
>>   >
>>   > [  OK  ] Stopped Phosphor Dump Manager.
>>   >
>>   >          Starting Phosphor Dump Manager...
>>   >
>>   > [FAILED] Failed to start Name Service Cache Daemon.
>>   >
>>   > See 'systemctl status nscd.service' for details.
>>   >
>>   > [FAILED] Failed to start Phosphor Dump Manager.
>>   >
>>   > See 'systemctl status xyz.openbmc_project.Dump.Manager.service' for
>>   > details.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [  OK  ] Stopped Entity Manager.
>>   >
>>   >          Starting Entity Manager...
>>   >
>>   > [FAILED] Failed to start Entity Manager.
>>   >
>>   > See 'systemctl status xyz.openbmc_project.EntityManager.service' for
>>   > details.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [FAILED] Failed to mount Temporary Directory (/tmp).
>>   >
>>   > See 'systemctl status tmp.mount' for details.
>>   >
>>   > [DEPEND] Dependency failed for D-Bus System Message Bus.
>>   >
>>   > [  OK  ] Stopped LPC Snoop Daemon.
>>   >
>>   > [FAILED] Failed to start LPC Snoop Daemon.
>>   >
>>   > See 'systemctl status lpcsnoop.service' for details.
>>   >
>>   > [  OK  ] Stopped Name Service Cache Daemon.
>>   >
>>   > [FAILED] Failed to start Name Service Cache Daemon.
>>   >
>>   > See 'systemctl status nscd.service' for details.
>>   >
>>   > [  OK  ] Stopped ttyVUART0 Console Server.
>>   >
>>   > [FAILED] Failed to start ttyVUART0 Console Server.
>>   >
>>   > See 'systemctl status obmc-console@ttyVUART0.service' for details.
>>   >
>>   > [  OK  ] Stopped Lightweight SLP Server.
>>   >
>>   > [FAILED] Failed to start Lightweight SLP Server.
>>   >
>>   > See 'systemctl status slpd-lite.service' for details.
>>   >
>>   > [  OK  ] Stopped Phosphor Dump Manager.
>>   >
>>   > [  OK  ] Listening on D-Bus System Message Bus Socket.
>>   >
>>   > [FAILED] Failed to start Phosphor Dump Manager.
>>   >
>>   > See 'systemctl status xyz.openbmc_project.Dump.Manager.service' for
>>   > details.
>>   >
>>   > [  OK  ] Stopped Entity Manager.
>>   >
>>   > [FAILED] Failed to start Entity Manager.
>>   >
>>   > See 'systemctl status xyz.openbmc_project.EntityManager.service' for
>>   > details.
>>   >
>>   > [   17.251376][24] audit: type=1701 audit(1616511064.752:2):
>>   > auid=4294967295 uid=0 gid=0 ses=4294967295 pid=3552
>>   > comm="phosphor-rsyslo" exe="/usr/bin/phosphor-rsyslog-conf" sig=6 res=1
>>   >
>>   > [   17.267548][24] audit: type=1701 audit(1616511064.752:3):
>>   > auid=4294967295 uid=0 gid=0 ses=4294967295 pid=3553
>>   > comm="phosphor-user-m" exe="/usr/bin/phosphor-user-manager" sig=6
>>   res=1
>>   >
>>   > [   17.283681][24] audit: type=1701 audit(1616511064.752:4):
>>   > auid=4294967295 uid=0 gid=0 ses=4294967295 pid=3525
>>   > comm="phosphor-certif" exe="/usr/bin/phosphor-certificate-manager"
>>   > sig=6 res=1
>>   >
>>   > [   17.300416][24] audit: type=1701 audit(1616511064.752:5):
>>   > auid=4294967295 uid=0 gid=0 ses=4294967295 pid=3550
>>   > comm="phosphor-downlo" exe="/usr/bin/phosphor-download-manager"
>>   sig=6
>>   > res=1
>>   >
>>   > [   17.316868][24] audit: type=1701 audit(1616511064.752:6):
>>   > auid=4294967295 uid=0 gid=0 ses=4294967295 pid=3543
>>   > comm="phosphor-ldap-m" exe="/usr/bin/phosphor-ldap-mapper" sig=6
>>   res=1
>>   >
>>   > [   17.332888][24] audit: type=1701 audit(1616511064.752:7):
>>   > auid=4294967295 uid=0 gid=0 ses=4294967295 pid=3528
>>   > comm="phosphor-certif" exe="/usr/bin/phosphor-certificate-manager"
>>   > sig=6 res=1
>>   >
>>   > [   17.349614][24] audit: type=1701 audit(1616511064.752:8):
>>   > auid=4294967295 uid=0 gid=0 ses=4294967295 pid=3544
>>   > comm="phosphor-ledman" exe="/usr/bin/phosphor-ledmanager" sig=6
>>   res=1
>>   >
>>   > [   17.365550][24] audit: type=1701 audit(1616511064.752:9):
>>   > auid=4294967295 uid=0 gid=0 ses=4294967295 pid=3551
>>   > comm="post-code-manag" exe="/usr/bin/post-code-manager" sig=6 res=1
>>   >
>>   > [   17.381328][24] audit: type=1701 audit(1616511064.752:10):
>>   > auid=4294967295 uid=0 gid=0 ses=4294967295 pid=3526
>>   > comm="phosphor-certif" exe="/usr/bin/phosphor-certificate-manager"
>>   > sig=6 res=1
>>   >
>>   > [   17.398133][24] audit: type=1701 audit(1616511064.752:11):
>>   > auid=4294967295 uid=0 gid=0 ses=4294967295 pid=3560
>>   > comm="phosphor-ldap-c" exe="/usr/bin/phosphor-ldap-conf" sig=6 res=1
>>   >
>>   > Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0
>>   > phytium_arm64 ttyS0
>>   >
>>   > phytium_arm64 login:
>>   >
>>   > phytium_arm64 login: root
>>   >
>>   > Login incorrect
>>   >
>>   > phytium_arm64 login: phytium
>>   >
>>   > Password:
>>   >
>>   > Login incorrect
>>   >
>>   > phytium_arm64 login:
>>   >
>>   > Log
>>   >
>>   > Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0
>>   > phytium_arm64 ttyS0
>>   >
>>   > phytium_arm64 login: root
>>   >
>>   > Login incorrect
>>   >
>>   > phytium_arm64 login: phytium
>>   >
>>   > Password:
>>   >
>>   > Login incorrect
>>   >
>>   > phytium_arm64 login: phytium
>>   >
>>   > Password:
>>   >
>>   > Login incorrect
>>   >
>>   > phytium_arm64 login: phytium
>>   >
>>   > Password:
>>   >
>>   > Login incorrect
>>   >
>>   > phytium_arm64 login: phytium
>>   >
>>   > Password:
>>   >
>>   > Log
>>   >
>>   > Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro) 0.1.0
>>   > phytium_arm64 ttyS0
>>   >
>>   > phytium_arm64 login:
>>   >
>>   > phytium_arm64 login:
>>   >
>>   > phytium_arm64 login:
>>   >
>>   > phytium_arm64 login:
>>   >

