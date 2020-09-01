Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B70825A1CC
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 01:08:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh2mz2CbHzDqP0
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 09:08:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FpuUobF9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh2mC3MTBzDqJV
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 09:07:54 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 081N0o5J132819
 for <openbmc@lists.ozlabs.org>; Tue, 1 Sep 2020 19:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=in-reply-to : from : to
 : cc : date : mime-version : references : content-transfer-encoding :
 content-type : message-id : subject; s=pp1;
 bh=33j4zCmBEILDO/utovpcKcWUpDNhQ+kXzgT1H972f20=;
 b=FpuUobF9wlUGHizqJor0oxMYo/mRVuIqVszdity7FH7/khMU81K1u+Se2yHaBqS4g08e
 lg18g5qOItkB2p93bX9FIWNhI6pteVGq8npq0HaAFZMLMdk3O0IuqX7a49NnR3Yts8yN
 c2DmmT3fja1A0FTqQ22qiR88QQFxy+M/HwyBx4jswP7m4fnWKJ5/kVVvAguA5wjeOnJa
 oQKg3hwluvC4g2lGVFMVjvmi93cCtKf4OADvdGoty6BaqPckVzfP7SX/VKN79KUEz/N3
 WxtbOPiNpBlXJmaSBRzhrUQK0WuW545kxM+JQOcomly+DI9UuQ7cnJsdDg3RU4q+KKP1 IA== 
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0b-001b2d01.pphosted.com with ESMTP id 339y5r8p7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 01 Sep 2020 19:07:50 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 1 Sep 2020 23:07:49 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 1 Sep 2020 23:07:46 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2020090123074605-937455 ;
 Tue, 1 Sep 2020 23:07:46 +0000 
In-Reply-To: <20200901123506.GR3532@heinlein>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Patrick Williams <patrick@stwcx.xyz>
Date: Tue, 1 Sep 2020 23:07:45 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20200901123506.GR3532@heinlein>,
 <BYAPR14MB2342C9C346B57B87F44E3200CF530@BYAPR14MB2342.namprd14.prod.outlook.com>
X-Mailer: IBM iNotes ($HaikuForm 1054.1) | IBM Domino Build
 SCN1812108_20180501T0841_FP65 April 15, 2020 at 09:48
X-LLNOutbound: False
X-Disclaimed: 9915
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 20090123-3067-0000-0000-000003EFB750
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.268680
X-IBM-SpamModules-Versions: BY=3.00013758; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000295; SDB=6.01428699; UDB=6.00767032; IPR=6.01211425; 
 MB=3.00033828; MTD=3.00000008; XFM=3.00000015; UTC=2020-09-01 23:07:48
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2020-09-01 18:39:49 - 6.00011791
x-cbparentid: 20090123-3068-0000-0000-0000C540BD59
Message-Id: <OF007CF2C7.B7F26EA3-ON002585D6.007E6189-002585D6.007F0DAA@notes.na.collabserv.com>
Subject: RE: SQUASHFS errors and OpenBMC hang
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-01_10:2020-09-01,
 2020-09-01 signatures=0
X-Proofpoint-Spam-Reason: orgsafe
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Kun Zhao <zkxz@hotmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On September 1, 2020 around 7:36AM in some timezone, Patrick Williams wrote:
>On Sat, Aug 29, 2020 at 12:40:31AM +0000, Kun Zhao wrote:
>> I=E2=80=99m working on validating OpenBMC on our POC system for a while,
>but starting from 2 weeks ago, the BMC filesystem sometimes report
>failures, and after that sometimes the BMC will hang after running
>for a while. It started to happen on one system and then on another.
>Tried to use programmer to re-flash, still see this issue. Tried to
>flash back to the very first known good OpenBMC image we built, still
>see the same symptoms. It seems like a SPI ROM failure. But when
>flash back the POC system original 3rd-party BMC, no such issue at
>all. Not sure if anyone ever met similar issues before?
>
>Yeah, this does look like a bad SPI NOR.  Have you tried flashing on
>a
>fresh image to the NOR and then reading it back to confirm all the
>bits
>keep their values?  It is possible that the corruption is hitting the
>other BMC code in a less-important location.
>
>> [ 3.372932] jffs2: notice: (78) jffs2=5Fget=5Finode=5Fnodes: Node header
>CRC failed at 0x3e0aa4. {1985,e002,0000004a,78280c2e}
>
>I'm surprised to see anyone using jffs2.  Don't we generally use
>ubifs
>in OpenBMC?  Is there a reason you've chosen to use jffs2?
>
>I don't necessarily think jffs2 will be better or worse in this
>particular scenario but we've seen lots of upgrade issues over the
>years
>with jffs2.

The default layout is static partitions with squashfs over mtdblock=20
for the read-only layer and jffs2 for the read-write layer.

The ubifs option is opt-in and the code update supports two images=20
so that a new image is always available.  These options should be=20
orthogonal but in practice are probably tied in the code update=20
repository.

The third option is eMMC support on the sdhci controller.  This=20
was prototyped on ast2500 and in use on the ast2600.

There are some differences in the overlay strategy in the current=20
builds but I will support anyone willing to test to merge the new=20
limited writable directories from ubifs and emmc to the static mtd=20
layout.   This means I'm willing to update the init scripts.

>
>> BMC debug console shows the same SQUASHFS error as above, by
>checking filesystem usage we could see rwfs usage keep increasing
>like this,
>>=20
>> root@dgx:~# df
>> Filesystem 1K-blocks Used Available Use% Mounted on
>> dev 212904 0 212904 0% /dev
>> tmpfs 246728 20172 226556 8% /run
>> /dev/mtdblock4 22656 22656 0 100% /run/initramfs/ro
>> /dev/mtdblock5 4096 880 3216 21% /run/initramfs/rw
>> cow 4096 880 3216 21% /
>> tmpfs 246728 8 246720 0% /dev/shm
>> tmpfs 246728 0 246728 0% /sys/fs/cgroup
>> tmpfs 246728 0 246728 0% /tmp
>> tmpfs 246728 8 246720 0% /var/volatile
>>=20
>> and can see more and more ipmid coredump files,
>
>This implies to me that we need to adjust the systemd recovery for
>ipmid.  We shouldn't just keep re-launching the same process over and
>over after a coredump.  Systemd has some thresholding capability.
>

I've seen problems in the past where the squashfs image was bigger=20
than the aloted space and it became partially overwritten by the=20
jffs2 writable filesystem.   We added code that tries to catch this=20
and have seen such reports but wanted to bring it up.  Also we don't=20
support the host accessing the flash controller while linux is up in=20
case your host is trying to flash the bmc bios (or even read it
directly; all data must go through API such as IPMI or REST.

>> I found the following actions could trigger this failure,
>>=20
>>=20
>>   1.  do SSH login to BMC debug console remotely, it will show this
>error when triggered,
>> $ ssh root@<bmc ip>
>> ssh=5Fexchange=5Fidentification: read: Connection reset by peer
>>=20
>>=20
>>   1.  set BMC MAC address by fw=5Fsetenv in BMC debug console, reboot
>BMC, and do 'ip -a'.
>
>I have no idea why this procedure would solve SPI NOR issues.  It
>doesn't seem connected on the surface.
>
>> The code is based on upstream commit 5ddb5fa99ec259 on master
>branch.
>> The flash layout definition is the default
>openbmc-flash-layout.dtsi.
>> The SPI ROM is Macronix MX25L25635F
>>=20
>> Some questions,
>>=20
>>   1.  Any SPI lock feature enabled in OpenBMC?
>>   2.  If yes, do I have to unlock u-boot-env partition before
>fw=5Fsetenv?
>
>There is not, to my knowledge, a software SPI lock.  Some machines
>have
>a 'golden' NOR which they enable by, in hardware, setting the
>write-protect input pin on the SPI NOR (with a strapping resistor).
>Does your machine do this mechanism?  If so, it is possible that
>you're
>booting onto the 'wrong' NOR flash in some conditions and a reboot
>resets the chip-select logic in the SPI controller.  (Usually, you
>have
>the watchdog configured to automatically swap the chip-select after
>some
>number of boot failures.)
>
>--=20
>Patrick Williams

Our default is that the os is in control of the flash an we do not=20
mark any areas as read-only.

milton
---
I speak only for myself.  But I have written or reviewed the layouts=20
and initrd scripting.

