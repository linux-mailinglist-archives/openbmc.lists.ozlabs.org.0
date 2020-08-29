Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B360E2563BC
	for <lists+openbmc@lfdr.de>; Sat, 29 Aug 2020 02:41:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bdd283Kh1zDqs6
	for <lists+openbmc@lfdr.de>; Sat, 29 Aug 2020 10:41:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.42.46;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=DEoQOtGZ; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2046.outbound.protection.outlook.com [40.92.42.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bdd124bqrzDqrF
 for <openbmc@lists.ozlabs.org>; Sat, 29 Aug 2020 10:40:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LyAFn5iibsaJccmShvIgSNA1F+U2htj5PevmlHbAiRAJNK57lj78zJteauUKmJrJ3NjtiuesQF+Kp0JktsVDSWegsT9CcSSl+MVeWhnuCKgAQtgZVUToAipMfxFwBqMVy8dsK0WHZUqvvtzxefz06cA2NcjpCoZCIWTlpCeeHzGVBZxWuIYOSpsh32eApq4xPKUWRUxdgRdWHxO8WzTVAVlZNDysMdW+17zhuJYa2Uc+rpLI3V5DdFWg017xpwWw8+Nwe0gSlN5TtQADHzhl7w02Xgdkx0H9350bvzcC99RY1uaVPW2SucpejlGjDJMaU7r6yGup0AgSlwWrB39/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5M+/XxTVho9jaMX0oHhA9HsFG5lEK5PVgMLkwZ2fkc=;
 b=EBBrmbt99CfK2s5rRRkQ1rwU0ycyz074OidsF5mBsdDMrio2hCFkvbvmIBhZKG3DCJTvevS9YjQpelnXErAyYQYlFDbxNdEpMhMrBpyh7aOKF4C3KyMz8hniY3YjD0l6si25p9+QbUh1+8zd4XdKxMEUKiexwBCur+Q9vYgMMOH6AOd/zTeIO0B8nXknsJOUhg18NUjKYdSsa4fSV8IfFTwUYLo6X2dzVts+JgfQvByxLD0OuH53/2TKgZnu8aPVHz+BoCw7kUBiYDkaN375eEz/TfD4IQEQLJs9/RX6lHhEdRSJaOMK+Ed7zn8FmwkaDb9/wm0CvuvOZXoWWFtUXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5M+/XxTVho9jaMX0oHhA9HsFG5lEK5PVgMLkwZ2fkc=;
 b=DEoQOtGZUZ9WdB0ykm622Yo6elgSH1w7nWueUDDwziAVBpbo049RdjUjAa0jUPbv9qwt32ynmr8FGbKyEyLuQ/G1C+Xq6Lh63K7Wzs6EjkCLDchC20j4ePaLEDm9Se4qqWkiJM5Hl0DVHogcjyi62YXBZCLkvJwrrA/zTigBxn9KgCTqF6LOvysGBpWzC9fW5+FhBmkmADS65TytTwyDLuhTuthAhft0F7vOSzXiCh7sWbGixAV9uCxzD/6zk3SuctsH0ptEPsWcFOyVY0nirsudEpAvgxV1Me1QauaTrFydHqgyyT49lkvEYyD+RnCyWp9CG/EMbM7eRyyM2WlkSg==
Received: from DM6NAM10FT053.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e86::4d) by
 DM6NAM10HT203.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e86::404)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Sat, 29 Aug
 2020 00:40:31 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 (2a01:111:e400:7e86::4b) by DM6NAM10FT053.mail.protection.outlook.com
 (2a01:111:e400:7e86::442) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23 via Frontend
 Transport; Sat, 29 Aug 2020 00:40:31 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a]) by BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a%7]) with mapi id 15.20.3326.023; Sat, 29 Aug 2020
 00:40:31 +0000
From: Kun Zhao <zkxz@hotmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: SQUASHFS errors and OpenBMC hang
Thread-Topic: SQUASHFS errors and OpenBMC hang
Thread-Index: AQHWfZezDY6H8x9yY0iDzOM7cCHZhg==
Date: Sat, 29 Aug 2020 00:40:31 +0000
Message-ID: <BYAPR14MB2342C9C346B57B87F44E3200CF530@BYAPR14MB2342.namprd14.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:7D7B0244B7CC90D075F3559E7F9ED0E7EC64A0C29C460B054D98486996CE0BD8;
 UpperCasedChecksum:08C24ABCCE60EF0CA2C3E9DED337ABECF45F67C5C408DAED08E4BFC96A16274B;
 SizeAsReceived:6660; Count:42
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [c92cdED00HtU8LZiDacOY00gwfL83LDg]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 43f601b6-6637-4bb1-62ae-08d84bb4221e
x-ms-traffictypediagnostic: DM6NAM10HT203:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bx4/kqeJl+EJlIzGc2ynvcs0SRaHAl6LtgdNtCd+T1MrbphEED03Ag1rsCSSPf7ZIWdC2ZPurJuxl5kCSI9knq7qfe37Kd1zQugqN+6pFluCran6CsXz/ixtsNr2HiLat/qyxKMjPF7+kWZ9WOVbAeJVXPb7cHCD7sVxuM3O7ZkPEza6RLgHY3pyLcNHaY0TtdyzJtX7OCHtcr4bJpvkjw==
x-ms-exchange-antispam-messagedata: WFeywen8odIf40cBU6h63DKaSjth6GjXDZuERiN4bxqA6pb517ZcIBf6eK0X9KDj24vo0UivmIIgHk699LhgKsWDEUtOwil5lBlocarO1LvHoxeYnv0xUEx4xI4s8LBm2F/Sb66O3tIGLYeNH61gXw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR14MB2342C9C346B57B87F44E3200CF530BYAPR14MB2342namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM10FT053.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f601b6-6637-4bb1-62ae-08d84bb4221e
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2020 00:40:31.0728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM10HT203
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

--_000_BYAPR14MB2342C9C346B57B87F44E3200CF530BYAPR14MB2342namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Team,

I=92m working on validating OpenBMC on our POC system for a while, but star=
ting from 2 weeks ago, the BMC filesystem sometimes report failures, and af=
ter that sometimes the BMC will hang after running for a while. It started =
to happen on one system and then on another. Tried to use programmer to re-=
flash, still see this issue. Tried to flash back to the very first known go=
od OpenBMC image we built, still see the same symptoms. It seems like a SPI=
 ROM failure. But when flash back the POC system original 3rd-party BMC, no=
 such issue at all. Not sure if anyone ever met similar issues before?

There are 2 symptoms,

#1,

BMC debug console somehow shows this error,

[ 4242.029061] SQUASHFS error: xz decompression failed, data probably corru=
pt
[ 4242.035970] SQUASHFS error: squashfs_read_data failed to read block 0xce=
5cb0
[ 4242.043159] SQUASHFS error: Unable to read data cache entry [ce5cb0]
[ 4242.049627] SQUASHFS error: Unable to read page, block ce5cb0, size da44
[ 4242.056386] SQUASHFS error: Unable to read data cache entry [ce5cb0]

After rebooting, BMC may show that error again and then stop at reading roo=
tfs with the following errors,

[ 3.372932] jffs2: notice: (78) jffs2_get_inode_nodes: Node header CRC fail=
ed at 0x3e0aa4. {1985,e002,0000004a,78280c2e}
[ 3.383951] jffs2: notice: (78) jffs2_get_inode_nodes: Node header CRC fail=
ed at 0x3e0a60. {1985,e002,15000044,98f7fb1d}
[ 3.394949] jffs2: notice: (78) jffs2_get_inode_nodes: Node header CRC fail=
ed at 0x3e09e4. {1985,e002,15000044,98f7fb1d}
[ 3.405958] jffs2: notice: (78) check_node_data: wrong data CRC in data nod=
e at 0x003e0af0: read 0x5ab53bf4, calculated 0xb6f14204.
[ 3.417873] jffs2: warning: (78) jffs2_do_read_inode_internal: no data node=
s found for ino #8
[ 3.426478] jffs2: Returned error for crccheck of ino #8. Expect badness...
[ 3.492939] jffs2: notice: (78) jffs2_get_inode_nodes: Node header CRC fail=
ed at 0x3e0bc8. {1985,e002,15000044,98f7fb1d}
[ 3.503923] jffs2: warning: (78) jffs2_do_read_inode_internal: no data node=
s found for ino #9
[ 3.512462] jffs2: Returned error for crccheck of ino #9. Expect badness...

After that, BMC either enter  recovery mode or hang.

#2,

BMC debug console shows the same SQUASHFS error as above, by checking files=
ystem usage we could see rwfs usage keep increasing like this,

root@dgx:~# df
Filesystem 1K-blocks Used Available Use% Mounted on
dev 212904 0 212904 0% /dev
tmpfs 246728 20172 226556 8% /run
/dev/mtdblock4 22656 22656 0 100% /run/initramfs/ro
/dev/mtdblock5 4096 880 3216 21% /run/initramfs/rw
cow 4096 880 3216 21% /
tmpfs 246728 8 246720 0% /dev/shm
tmpfs 246728 0 246728 0% /sys/fs/cgroup
tmpfs 246728 0 246728 0% /tmp
tmpfs 246728 8 246720 0% /var/volatile

and can see more and more ipmid coredump files,

root@dgx:~# ls -al /run/initramfs/rw/cow/var/lib/systemd/coredump/
drwxr-xr-x 2 root root 0 Aug 21 16:04 .
rw-r---- 1 root root 57344 Aug 21 16:04 .#core.ipmid.0.86cd480e19db45ee9417=
b2d0af1a443c.5710.1598025874000000000000.xzaba143da6d9b5571
rw-r---- 1 root root 655360 Aug 21 16:04 .#core.ipmid.0.86cd480e19db45ee941=
7b2d0af1a443c.5710.1598025874000000000000ba58c927628d3950
rw-r---- 1 root root 0 Aug 21 16:04 .#core.ipmid.0.86cd480e19db45ee9417b2d0=
af1a443c.5713.1598025880000000000000.xzee8c94e72fc5b173
rw-r---- 1 root root 655360 Aug 21 16:04 .#core.ipmid.0.86cd480e19db45ee941=
7b2d0af1a443c.5713.159802588000000000000089ee90c2a557ac1c
drwxr-xr-x 6 root root 0 Jan 1 1970 ..
rw-r---- 1 root root 92492 Aug 21 16:02 core.ipmid.0.86cd480e19db45ee9417b2=
d0af1a443c.5630.1598025699000000000000.xz
rw-r---- 1 root root 92572 Aug 21 16:02 core.ipmid.0.86cd480e19db45ee9417b2=
d0af1a443c.5641.1598025723000000000000.xz
rw-r---- 1 root root 92652 Aug 21 16:02 core.ipmid.0.86cd480e19db45ee9417b2=
d0af1a443c.5645.1598025728000000000000.xz
rw-r---- 1 root root 92476 Aug 21 16:02 core.ipmid.0.86cd480e19db45ee9417b2=
d0af1a443c.5651.1598025754000000000000.xz

By checking journal logs and found ipmid failed on access files like /usr/s=
hare/ipmi-providers/channel_config.json. So seems ipmid is also a victim fr=
om the filesystem failure.
And after a while, BMC just hang.


Some recovery methods are available, but success rate are very low,


  *   leave BMC there for some time, it will be back to work. but not alway=
s.
  *   reboot BMC or AC cycle sometime can make it work but not always.


I found the following actions could trigger this failure,


  1.  do SSH login to BMC debug console remotely, it will show this error w=
hen triggered,
$ ssh root@<bmc ip>
ssh_exchange_identification: read: Connection reset by peer


  1.  set BMC MAC address by fw_setenv in BMC debug console, reboot BMC, an=
d do 'ip -a'.


The code is based on upstream commit 5ddb5fa99ec259 on master branch.
The flash layout definition is the default openbmc-flash-layout.dtsi.
The SPI ROM is Macronix MX25L25635F

Some questions,

  1.  Any SPI lock feature enabled in OpenBMC?
  2.  If yes, do I have to unlock u-boot-env partition before fw_setenv?


Thanks.

Best regards,

Kun Zhao
/*
  zkxz@hotmail.com<mailto:zkxz@hotmail.com>
*/


--_000_BYAPR14MB2342C9C346B57B87F44E3200CF530BYAPR14MB2342namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:244657727;
	mso-list-type:hybrid;
	mso-list-template-ids:-870125908 67698689 67698691 67698693 67698689 67698=
691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l1
	{mso-list-id:1152989048;
	mso-list-type:hybrid;
	mso-list-template-ids:1200374366 -1 67698713 67698715 67698703 67698713 67=
698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2
	{mso-list-id:1555698536;
	mso-list-type:hybrid;
	mso-list-template-ids:1146099230 -1 67698713 67698715 67698703 67698713 67=
698715 67698703 67698713 67698715;}
@list l2:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l2:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l2:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Team,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I=92m working on validating OpenBMC on our POC syste=
m for a while, but starting from 2 weeks ago, the BMC filesystem sometimes =
report failures, and after that sometimes the BMC will hang after running f=
or a while. It started to happen on
 one system and then on another. Tried to use programmer to re-flash, still=
 see this issue. Tried to flash back to the very first known good OpenBMC i=
mage we built, still see the same symptoms. It seems like a SPI ROM failure=
. But when flash back the POC system
 original 3<sup>rd</sup>-party BMC, no such issue at all. Not sure if anyon=
e ever met similar issues before?
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">There are 2 symptoms,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><u>#1</u>,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">BMC debug console somehow shows this error,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">[ 4242.029061] =
SQUASHFS error: xz decompression failed, data probably corrupt<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">[ 4242.035970] =
SQUASHFS error: squashfs_read_data failed to read block 0xce5cb0<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">[ 4242.043159] =
SQUASHFS error: Unable to read data cache entry [ce5cb0]<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">[ 4242.049627] =
SQUASHFS error: Unable to read page, block ce5cb0, size da44<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">[ 4242.056386] =
SQUASHFS error: Unable to read data cache entry [ce5cb0]<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">After rebooting, BMC may show that error again and t=
hen stop at reading rootfs with the following errors,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">[ 3.372932] jff=
s2: notice: (78) jffs2_get_inode_nodes: Node header CRC failed at 0x3e0aa4.=
 {1985,e002,0000004a,78280c2e}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">[ 3.383951] jff=
s2: notice: (78) jffs2_get_inode_nodes: Node header CRC failed at 0x3e0a60.=
 {1985,e002,15000044,98f7fb1d}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">[ 3.394949] jff=
s2: notice: (78) jffs2_get_inode_nodes: Node header CRC failed at 0x3e09e4.=
 {1985,e002,15000044,98f7fb1d}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">[ 3.405958] jff=
s2: notice: (78) check_node_data: wrong data CRC in data node at 0x003e0af0=
: read 0x5ab53bf4, calculated 0xb6f14204.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">[ 3.417873] jff=
s2: warning: (78) jffs2_do_read_inode_internal: no data nodes found for ino=
 #8<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">[ 3.426478] jff=
s2: Returned error for crccheck of ino #8. Expect badness...<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">[ 3.492939] jff=
s2: notice: (78) jffs2_get_inode_nodes: Node header CRC failed at 0x3e0bc8.=
 {1985,e002,15000044,98f7fb1d}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">[ 3.503923] jff=
s2: warning: (78) jffs2_do_read_inode_internal: no data nodes found for ino=
 #9<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">[ 3.512462] jff=
s2: Returned error for crccheck of ino #9. Expect badness...<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">After that, BMC either enter&nbsp; recovery mode or =
hang.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><u>#2</u>,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">BMC debug console shows the same SQUASHFS error as a=
bove, by checking filesystem usage we could see rwfs usage keep increasing =
like this,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">root@dgx:~# df<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">Filesystem 1K-b=
locks Used Available Use% Mounted on<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">dev 212904 0 21=
2904 0% /dev<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">tmpfs 246728 20=
172 226556 8% /run<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">/dev/mtdblock4 =
22656 22656 0 100% /run/initramfs/ro<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">/dev/mtdblock5 =
4096 880 3216 21% /run/initramfs/rw<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">cow 4096 880 32=
16 21% /<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">tmpfs 246728 8 =
246720 0% /dev/shm<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">tmpfs 246728 0 =
246728 0% /sys/fs/cgroup<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">tmpfs 246728 0 =
246728 0% /tmp<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">tmpfs 246728 8 =
246720 0% /var/volatile<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">and can see more and more ipmid coredump files,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">root@dgx:~# ls =
-al /run/initramfs/rw/cow/var/lib/systemd/coredump/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">drwxr-xr-x 2 ro=
ot root 0 Aug 21 16:04 .<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">rw-r---- 1 root=
 root 57344 Aug 21 16:04 .#core.ipmid.0.86cd480e19db45ee9417b2d0af1a443c.57=
10.1598025874000000000000.xzaba143da6d9b5571<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">rw-r---- 1 root=
 root 655360 Aug 21 16:04 .#core.ipmid.0.86cd480e19db45ee9417b2d0af1a443c.5=
710.1598025874000000000000ba58c927628d3950<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">rw-r---- 1 root=
 root 0 Aug 21 16:04 .#core.ipmid.0.86cd480e19db45ee9417b2d0af1a443c.5713.1=
598025880000000000000.xzee8c94e72fc5b173<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">rw-r---- 1 root=
 root 655360 Aug 21 16:04 .#core.ipmid.0.86cd480e19db45ee9417b2d0af1a443c.5=
713.159802588000000000000089ee90c2a557ac1c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">drwxr-xr-x 6 ro=
ot root 0 Jan 1 1970 ..<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">rw-r---- 1 root=
 root 92492 Aug 21 16:02 core.ipmid.0.86cd480e19db45ee9417b2d0af1a443c.5630=
.1598025699000000000000.xz<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">rw-r---- 1 root=
 root 92572 Aug 21 16:02 core.ipmid.0.86cd480e19db45ee9417b2d0af1a443c.5641=
.1598025723000000000000.xz<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">rw-r---- 1 root=
 root 92652 Aug 21 16:02 core.ipmid.0.86cd480e19db45ee9417b2d0af1a443c.5645=
.1598025728000000000000.xz<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">rw-r---- 1 root=
 root 92476 Aug 21 16:02 core.ipmid.0.86cd480e19db45ee9417b2d0af1a443c.5651=
.1598025754000000000000.xz<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">By checking journal logs and found ipmid failed on a=
ccess files like /usr/share/ipmi-providers/channel_config.json. So seems ip=
mid is also a victim from the filesystem failure.</p>
<p class=3D"MsoNormal">And after a while, BMC just hang.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Some recovery methods are available, but success rat=
e are very low,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">leave BMC there for some time, it will be back to work. but not alway=
s.</li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 =
level1 lfo1">reboot BMC or AC cycle sometime can make it work but not alway=
s.</li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I found the following actions could trigger this fai=
lure,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l2 level1 =
lfo2">do SSH login to BMC debug console remotely, it will show this error w=
hen triggered,</li></ol>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">$ ssh root@&lt;=
bmc ip&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">ssh_exchange_id=
entification: read: Connection reset by peer<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0in" start=3D"2" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l2 level1 =
lfo2">set BMC MAC address by fw_setenv in BMC debug console, reboot BMC, an=
d do 'ip -a'.</li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The code is based on upstream commit <b>5ddb5fa99ec2=
59 </b>on master branch.<o:p></o:p></p>
<p class=3D"MsoNormal">The flash layout definition is the default <b>openbm=
c-flash-layout.dtsi</b>.<o:p></o:p></p>
<p class=3D"MsoNormal">The SPI ROM is <b>Macronix MX25L25635F</b><o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Some questions,<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 =
lfo3">Any SPI lock feature enabled in OpenBMC?<o:p></o:p></li><li class=3D"=
MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 lfo3">If yes,=
 do I have to unlock u-boot-env partition before fw_setenv?<o:p></o:p></li>=
</ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best regards,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Kun Zhao<o:p></o:p></p>
<p class=3D"MsoNormal">/*<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; <a href=3D"mailto:zkxz@hotmail.com">zkxz@hotm=
ail.com</a><o:p></o:p></p>
<p class=3D"MsoNormal">*/<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR14MB2342C9C346B57B87F44E3200CF530BYAPR14MB2342namp_--
