Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 529775E411
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 14:35:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f0vN4MMkzDqLn
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 22:35:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="p5lqgiQD"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f0tZ2d6szDqLn
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2019 22:35:02 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 23D22411D9;
 Wed,  3 Jul 2019 12:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1562157294; x=1563971695; bh=8zTabkLxZbnsV7vAchK55tnbV
 Gb1WD2hrReHNsYfF6o=; b=p5lqgiQDcf+fdwLii5W+Pvd82Y+/igN4OKiJeochV
 R8xH5bv0g0yOmxm+eK1eDkk2nOLPe9oghVIy93QWwhbL4Bir5vC4nME2yF6nfjPN
 +gVvOx1fLFUNYIkjUt/QLrQcy8h2fvZGkKYFnPb+yTVy/MoPIhCrPs0yQOx/xC4W
 wI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LLsY2nwbV4k9; Wed,  3 Jul 2019 15:34:54 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 62D3241185;
 Wed,  3 Jul 2019 15:34:54 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 3 Jul 2019 15:34:53 +0300
Message-ID: <d3479235b652ed35303af785db4751bbe0caed06.camel@yadro.com>
Subject: Re: fsi/sbefifo problems on bmc
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Eddie James
 <eajames@linux.vnet.ibm.com>, <cbostic@linux.vnet.ibm.com>
Date: Wed, 3 Jul 2019 15:34:53 +0300
In-Reply-To: <e5f536d8ceb6017aab17773f3eed2e10b1f687b9.camel@kernel.crashing.org>
References: <ce4ba08f8d44c5e3d1f8a549578ce23c2311f39d.camel@yadro.com>
 <e76b6c0d-f822-18f3-a5f6-6e69e50ec390@linux.vnet.ibm.com>
 <e5f536d8ceb6017aab17773f3eed2e10b1f687b9.camel@kernel.crashing.org>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.15.69]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: Alexander Amelkin <a.amelkin@yadro.com>, openbmc@lists.ozlabs.org,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2019-07-03 at 10:07 +1000, Benjamin Herrenschmidt wrote:
> 
> Nothing obvious comes to mind. Is basic CFAM access working ? Can you
> check the SBE it still up and running and not crashed ?
> 
> You rescan FSI on power on ?
> 
> Cheers,
> Ben.
> 

Ben, this is what I have before 'obmcutil poweron':
root@nicole:~# pdbg -a probe
pdbg: Unable to open /sys/devices/platform/gpio-fsi/fsi0/slave@00:00/raw: No
such file or directory
root@nicole:~# echo 1 > /sys/devices/platform/gpio-fsi/fsi0/rescan
root@nicole:~# ls /sys/devices/platform/gpio-fsi/fsi0/
break    of_node/ rescan   uevent

After 'obmcutil poweron':

root@nicole:~# pdbg -a probe
fsi0: Kernel based FSI master (*)
    fsi1: CFAM hMFSI Port
        pib1: POWER FSI2PIB (*)
            chiplet0: POWER9 Chiplet
                core0: POWER9 Core (*)
                    thread0: POWER9 Thread (*)
...
a lot of chiplets/cores/etc
root@nicole:~# pdbg -a getscom 0x6C708
p1: 0x000000000006c708 = 0x4008152900000000 (/kernelfsi@0/hmfsi@100000/pib@1000)
p0: 0x000000000006c708 = 0x400816fd00000000 (/kernelfsi@0/pib@1000)
p1: 0x000000002006c708 = 0x00000000000f0000 (/kernelfsi@0/hmfsi@100000/pib@1000
/chiplet@20000000/core@0)
...
a lot of accesses.
root@nicole:~# ls /sys/devices/platform/gpio-fsi/fsi0/slave\@00\:00/
00:00:00:00       00:00:00:03       00:00:00:09       00:00:00:0d       00:00:00
:10       00:00:00:13       dev               send_echo_delays
00:00:00:01       00:00:00:06       00:00:00:0a       00:00:00:0e       00:00:00
:11       cfam_id           of_node           send_term
00:00:00:02       00:00:00:07       00:00:00:0c       00:00:00:0f       00:00:00
:12       chip_id           raw               uevent
root@nicole:~# echo 1 > /sys/devices/platform/gpio-fsi/fsi0/rescan
root@nicole:~# ls /sys/devices/platform/gpio-fsi/fsi0/slave\@00\:00/
00:00:00:00       00:00:00:03       00:00:00:09       00:00:00:0d       00:00:00
:10       00:00:00:13       dev               send_echo_delays
00:00:00:01       00:00:00:06       00:00:00:0a       00:00:00:0e       00:00:00
:11       cfam_id           of_node           send_term
00:00:00:02       00:00:00:07       00:00:00:0c       00:00:00:0f       00:00:00
:12       chip_id           raw               uevent


After 'obmcutil poweroff':

root@nicole:~# pdbg -a getscom 0x6C708
pdbg: Failed to read from 0x00003410 (0000000000003404): No such device
pdbg: Failed to write to 0x00003410 (0000000000003404): No such device
Unable to enable HMFSI port 1
pdbg: Failed to write to 0x0000101c (0000000000001007): No such device
root@nicole:~# pdbg -a probe
pdbg: Failed to read from 0x00003410 (0000000000003404): No such device
pdbg: Failed to write to 0x00003410 (0000000000003404): No such device
Unable to enable HMFSI port 1
pdbg: Failed to write to 0x0000101c (0000000000001007): No such device
fsi0: Kernel based FSI master (*)
root@nicole:~# ls /sys/devices/platform/gpio-fsi/fsi0/
break        of_node      rescan       slave@00:00  uevent
root@nicole:~# ls /sys/devices/platform/gpio-fsi/fsi0/slave\@00\:00/
00:00:00:00/      00:00:00:03/      00:00:00:09/      00:00:00:0d/      00:00:00
:10/      00:00:00:13/      dev               send_echo_delays
00:00:00:01/      00:00:00:06/      00:00:00:0a/      00:00:00:0e/      00:00:00
:11/      cfam_id           of_node/          send_term
00:00:00:02/      00:00:00:07/      00:00:00:0c/      00:00:00:0f/      00:00:00
:12/      chip_id           raw               uevent

The slave is present here with some engines as I see, sbefifo is present also -
in our case sbefifo is '00:00:00:06'.

After rescan:
root@nicole:~# echo 1 > /sys/devices/platform/gpio-fsi/fsi0/rescan
root@nicole:~# ls /sys/devices/platform/gpio-fsi/fsi0/
break    of_node  rescan   uevent
root@nicole:~# pdbg -a probe
pdbg: Unable to open /sys/devices/platform/gpio-fsi/fsi0/slave@00:00/raw: No
such file or directory


After that moment trying to get up the host with 'obmcutil poweron' again:

root@nicole:~# obmcutil poweron
root@nicole:~# pdbg -a probe
pdbg: Failed to read from 0x00003410 (0000000000003404): No such device
pdbg: Failed to write to 0x00003410 (0000000000003404): No such device
Unable to enable HMFSI port 1
pdbg: Failed to write to 0x0000101c (0000000000001007): No such device
fsi0: Kernel based FSI master (*)
root@nicole:~# ls /sys/devices/platform/gpio-fsi/fsi0/slave\@00\:00/
00:00:00:00       00:00:00:02       00:00:00:06       chip_id           of_node 
          send_echo_delays  uevent
00:00:00:01       00:00:00:03       cfam_id           dev               raw     
          send_term
root@nicole:~# echo 1 > /sys/devices/platform/gpio-fsi/fsi0/rescan
root@nicole:~# ls /sys/devices/platform/gpio-fsi/fsi0/
break    of_node  rescan   uevent


This is what we see in journalctl after that last 'obmcutil poweron':

Jul 03 10:48:22 nicole systemd[1]: Stopped target Stop Host0.
Jul 03 10:48:22 nicole systemd[1]: Stopped target Chassis0 (Power Off).
Jul 03 10:48:22 nicole systemd[1]: Stopped target Power0 Off.
Jul 03 10:48:22 nicole systemd[1]: op-power-stop@0.service: Succeeded.
Jul 03 10:48:22 nicole systemd[1]: Stopped Stop Power0.
Jul 03 10:48:22 nicole systemd[1]: op-wait-power-off@0.service: Succeeded.
Jul 03 10:48:22 nicole systemd[1]: Stopped Wait for Power0 to turn off.
Jul 03 10:48:22 nicole systemd[1]: Stopped target Power0 Off (Pre).
Jul 03 10:48:22 nicole systemd[1]: Stopped target Host0 (Stopped).
Jul 03 10:48:22 nicole systemd[1]: Stopped target Host0 (Stopping).
Jul 03 10:48:22 nicole systemd[1]: Stopped target Stop Host0 (Pre).
Jul 03 10:48:22 nicole systemd[1]: Started mapper subtree-remove
/xyz/openbmc_project/software:xyz.openbmc_project.Software.ActivationBlocksTrans
ition.
Jul 03 10:48:22 nicole systemd[1]: Started Reload mboxd during power on.
Jul 03 10:48:22 nicole systemd[1]: mapper-subtree-remove@-xyz-
openbmc\x5fproject-
software\x3Axyz.openbmc_project.Software.ActivationBlocksTransition.service:
Succeeded.
Jul 03 10:48:22 nicole phosphor-host-state-manager[1117]: Received signal that
host is off
Jul 03 10:48:22 nicole phosphor-host-state-manager[1117]: Change to Host State
Jul 03 10:48:22 nicole phosphor-chassis-state-manager[1099]: Received signal
that power OFF is complete
Jul 03 10:48:22 nicole phosphor-chassis-state-manager[1099]: Change to Chassis
Power State
Jul 03 10:48:22 nicole systemd[1]: Reached target Power0 On (Pre).
Jul 03 10:48:22 nicole systemd[1]: Starting Start Power0...
Jul 03 10:48:23 nicole power_control.exe[1029]: PowerControl: setting power up
SOFTWARE_PGOOD to 1
Jul 03 10:48:23 nicole power_control.exe[1029]: PowerControl: setting power up
BMC_POWER_UP to 1
Jul 03 10:48:23 nicole systemd[1]: Started Start Power0.
Jul 03 10:48:23 nicole phosphor-gpio-monitor[1540]: GPIO line altered
Jul 03 10:48:23 nicole systemd[1]: phosphor-gpio-monitor@checkstop.service:
Succeeded.
Jul 03 10:48:23 nicole systemd[1]: Stopped Phosphor GPIO checkstop monitor.
Jul 03 10:48:23 nicole systemd[1]: Stopping Phosphor poweron watchdog...
Jul 03 10:48:23 nicole systemd[1]: Starting OpenPOWER debug data collector for
host checkstop...
Jul 03 10:48:23 nicole systemd[1]: phosphor-watchdog@poweron.service: Main
process exited, code=killed, status=15/TERM
Jul 03 10:48:23 nicole systemd[1]: phosphor-watchdog@poweron.service: Succeeded.
Jul 03 10:48:23 nicole systemd[1]: Stopped Phosphor poweron watchdog.
Jul 03 10:48:24 nicole systemd[1]: Started Wait for Power0 to turn on.
Jul 03 10:48:24 nicole systemd[1]: Reached target Power0 On.
Jul 03 10:48:24 nicole systemd[1]: Reached target Power0 (On).
Jul 03 10:48:24 nicole systemd[1]: Started Phosphor Fan Presence Tach Daemon.
Jul 03 10:48:25 nicole systemd[1]: Starting Scan FSI devices...
Jul 03 10:48:25 nicole kernel: sbefifo 00:00:00:06: Cleanup: FIFO not clean
(up=0x02a8fe01 down=0x01100000)
Jul 03 10:48:33 nicole checkstop_app[1633]: Host checkstop condition detected
Jul 03 10:48:33 nicole phosphor-log-manager[1051]: Failed to find metadata
Jul 03 10:48:33 nicole systemd[1]: openpower-debug-collector-checkstop@0.service
: Succeeded.
Jul 03 10:48:33 nicole systemd[1]: Started OpenPOWER debug data collector for
host checkstop.
Jul 03 10:48:33 nicole phosphor-dump-manager[1061]: Dump not captured due to a
cap.
Jul 03 10:48:33 nicole systemd[1]: Reached target Quiesce Target.
Jul 03 10:48:33 nicole systemd[1]: Reached target Host instance 0 crashed.
Jul 03 10:48:33 nicole phosphor-host-state-manager[1117]: Auto reboot enabled,
rebooting
Jul 03 10:48:33 nicole phosphor-host-state-manager[1117]: Beginning reboot...
Jul 03 10:48:33 nicole phosphor-host-state-manager[1117]: Host State transaction
request
Jul 03 10:48:34 nicole sh[1536]: Job for obmc-host-startmin@0.target canceled.
Jul 03 10:48:34 nicole systemd[1]: phosphor-reboot-host@0.service: Main process
exited, code=exited, status=1/FAILURE
Jul 03 10:48:34 nicole systemd[1]: phosphor-reboot-host@0.service: Failed with
result 'exit-code'.
Jul 03 10:48:34 nicole systemd[1]: Reached target Stop Host0 (Pre).
Jul 03 10:48:34 nicole systemd[1]: Stopped target Host0 (Reset Check).
Jul 03 10:48:34 nicole systemd[1]: Stopped target Host0 running after reset.
Jul 03 10:48:34 nicole systemd[1]: Stopped target Host instance 0 crashed.
Jul 03 10:48:34 nicole systemd[1]: Stopped target Quiesce Target.
Jul 03 10:48:34 nicole systemd[1]: Starting Soft power off of the host...
Jul 03 10:48:34 nicole ipmid[1102]: Command in process, no attention
Jul 03 10:48:52 nicole ipmid[1102]: Host control timeout hit!
Jul 03 10:48:52 nicole ipmid[1102]: Failed to deliver host command
Jul 03 10:48:52 nicole ipmid[1102]: Failed to deliver host command
Jul 03 10:48:52 nicole phosphor-softpoweroff[1634]: Timeout on host attention,
continue with power down
Jul 03 10:48:52 nicole systemd[1]:
xyz.openbmc_project.Ipmi.Internal.SoftPowerOff.service: Succeeded.
Jul 03 10:48:52 nicole systemd[1]: Started Soft power off of the host.
Jul 03 10:48:52 nicole systemd[1]: Reached target Host0 (Stopping).
Jul 03 10:48:52 nicole systemd[1]: Reached target Host0 (Stopped).
Jul 03 10:48:52 nicole systemd[1]: Reached target Power0 Off (Pre).
Jul 03 10:48:52 nicole systemd[1]: Started Stop Power0.
Jul 03 10:48:52 nicole systemd[1]: Starting Wait for Power0 to turn off...
Jul 03 10:48:52 nicole power_control.exe[1029]: PowerControl: setting power up
SOFTWARE_PGOOD to 0
Jul 03 10:48:52 nicole power_control.exe[1029]: PowerControl: setting power up
BMC_POWER_UP to 0
Jul 03 10:48:52 nicole kernel: sbefifo 00:00:00:06: Failed to read UP fifo
status during reset , rc=-19
Jul 03 10:48:52 nicole kernel: sbefifo 00:00:00:06: Initial HW cleanup failed,
will retry later
Jul 03 10:48:52 nicole kernel: occ-hwmon occ-hwmon.1: failed to get OCC poll
response: -19
Jul 03 10:48:52 nicole kernel:  slave@00:00: error reading slave registers
Jul 03 10:48:52 nicole systemd[1]: fsi-scan@0.service: Main process exited,
code=killed, status=15/TERM
Jul 03 10:48:52 nicole systemd[1]: fsi-scan@0.service: Failed with result
'signal'.
Jul 03 10:48:52 nicole systemd[1]: Stopped Scan FSI devices.
Jul 03 10:48:52 nicole systemd[1]: Stopped target Power0 (On).
Jul 03 10:48:52 nicole systemd[1]: Stopped target Power0 On.

