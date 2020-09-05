Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 949E125E477
	for <lists+openbmc@lfdr.de>; Sat,  5 Sep 2020 02:03:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjvsH6bH4zDqwJ
	for <lists+openbmc@lfdr.de>; Sat,  5 Sep 2020 10:03:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.18.41;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=D3qk/9TI; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn2041.outbound.protection.outlook.com [40.92.18.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjvrT3nZ0zDqlK
 for <openbmc@lists.ozlabs.org>; Sat,  5 Sep 2020 10:03:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2ryJsExcjM3FzFwxrPeokm6yILp1dcKrx3v6xl7/EDmYsvrdUinPbM8yOctX8p19SUoYUCyamRfnFlZ+gVjwou0Ca2ZFnhA9XcJS2zAALj8cMRDsLKoHJjVpoKhJQ1oTFyp7saUwVT32umWGtKUWXDiApj3nbTotsE+R0Wcx1zPOiKc2U5E0YRnZuTVOaBY30FM/o44aPQfxhmrpQqUOSzPvjxEvygaQZZsDWvA9IqsidPRPtpCcYxivplYNcjqJek+biNa6QKyGHmDIRxCEAbZEa9uqn7sJ87y86XCVZVW4Wmez/zb2wZeoZ3GaaKgY8qGTLjGsli8BCqMuC2hRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEXHP+c71Q/0sImF+wk3be7hJxKC8F4hdO5Qocdv7nM=;
 b=BEC/lhaFGAMwWWgANK05bbUiOjf+1tTvFcwquEVVEx1iyjwcmjBdEimZ7XQHuWCoteHdzsrg7lYJY8g/0DEshkG5ZwpOjat8BzwZNbTpIFiGlUyQ3OukNTKsyPpvmptYDzk0aXsqR1rZTxUuR7rztSRptSA0KX7ros6NwYd8/3p1U9GeVWW3HW+zwz/I+fC4XYsQmYAwxOtzpBR8Dm9GymSravTNLTmRaDg1cN0z2tY90ja/RKTfxIOJF4X5PhgIWi5jokVDWB2IDEuw/C6vBXmhjsGgWvLHXm38vUvW8/1OLzDDckg6rxwMHUzzhpgNtF6jImKN4gYIwC4/Ay/fBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YEXHP+c71Q/0sImF+wk3be7hJxKC8F4hdO5Qocdv7nM=;
 b=D3qk/9TInw788xxlNlAiihiYnLl+Lg6U0LzgttzuliX7koaW8OtWOQIjJlOqIu0TFBNKC9mAKBSh+mrCCVJC177hV709/d6BK3pfP+hfy6dTYXLgPLRpFl0N/ZRXf2HqDf9k3k4t5VcTeDe95g7lRaZ8W0OvRUA3YP8I8PVKHCQZWhJFangq5VYnonu2JTPAZh0V9DiwgdYgZ6bHWTeCns/1HCpEnjvtEzNScZiksGTHuopAxXFFbZMsd5HutON+kduSR0opsBoLnUJC1PkCj5ph1Q+MhGVSdNXeDO8Qo5Yd58W+6fiR1LrF9ScS2wXLedr0SSeS0d3htBcJ+paN7w==
Received: from BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4b::45) by
 BN8NAM11HT183.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4b::79)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Sat, 5 Sep
 2020 00:02:59 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 (2a01:111:e400:fc4b::4e) by BN8NAM11FT023.mail.protection.outlook.com
 (2a01:111:e400:fc4b::359) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Sat, 5 Sep 2020 00:02:59 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a]) by BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a%7]) with mapi id 15.20.3348.017; Sat, 5 Sep 2020
 00:02:59 +0000
From: Kun Zhao <zkxz@hotmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Enable UBI support for a platform
Thread-Topic: Enable UBI support for a platform
Thread-Index: AQHWgxUUsfcLfr+u/UKWYAqBzK09TQ==
Date: Sat, 5 Sep 2020 00:02:59 +0000
Message-ID: <BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0@BYAPR14MB2342.namprd14.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:7096AAD22DD49578DC0D76B9AC31DAA462276136ADA0A30708D88E772506BFCF;
 UpperCasedChecksum:4D8F9C7840FC285EC72995FB5C3A4D33738DB9DC1A34A431D3E156E1846D844C;
 SizeAsReceived:6681; Count:42
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [ldGB+XGveh/PTCh5WfV6xhOKzDzcO58w]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 1156b76a-44a6-4674-ddd3-08d8512f0d22
x-ms-traffictypediagnostic: BN8NAM11HT183:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PK3QIc1j+GDam7QhtzxdTtZJSjAyZNbaS8CLOKGD/yUhbywBdOiNp7o6LIdRYhctZ/GLgrZO1iWDc6IrJwPaJJMaXCGtqYwsYrYlFBVNqOQvx7rSyQu0ZSI3cR/3G3t6B2xbaC/ysOs3h/zvAQc44g+35dU8JcAHNCwu0+y2Mqy+WNOlsB1qzsY8Lel3dkbn4hxw2yT74xtdxV62ldM7XA==
x-ms-exchange-antispam-messagedata: Z1maMFsZDG1ikGWUMpvwcNkz1JInxl+C7PebWv4A94MD1CJTMV0ODXLFxuvZO+bi39evDX6o+wt7G4esfb3YcRoUnrdi085kRsyCMUx/DJ7t2I3TMY4puBCd+lrtlUF1wvzBFRHYGrYV3IO4H9+EmA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0BYAPR14MB2342namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1156b76a-44a6-4674-ddd3-08d8512f0d22
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2020 00:02:59.7537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM11HT183
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

--_000_BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0BYAPR14MB2342namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Team,

My platform is based on ast2500, and I=92ve already been able to built out =
the ubi image. But when I tried to test it with qemu, it just stopped at u-=
boot because =91can=92t get kernel image,

qemu-system-arm: Aspeed iBT has no chardev backend


U-Boot 2016.07 (Sep 04 2020 - 19:47:48 +0000)

       Watchdog enabled
DRAM:  496 MiB
Flash: 32 MiB
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   MAC0 : RGMII
MAC1 : RGMII
FTGMAC100#0
Error: FTGMAC100#0 address not set.
, FTGMAC100#1
Error: FTGMAC100#1 address not set.

Hit any key to stop autoboot:  0
Wrong Image Format for bootm command
ERROR: can't get kernel image!
ast#

And I found the bootargs is not right,

ast# print
baudrate=3D115200
bootargs=3Dconsole=3DttyS4,115200n8 root=3D/dev/ram rw
bootcmd=3Dbootm 20080000
bootdelay=3D2

Checked in the build folder for tmp/work/myplatform-openbmc-linux-gnueabi/u=
-boot-aspeed/1_v2016.07+gitAUTOINC+1ded9fa3a2-r0/ and found the none of the=
 following patches are there,
0002-config-ast-common-hack-bootopts.patch
0003-config-ast-common-Add-bootopts-to-support-ubi-and-mt.patch
0004-config-ast-common-Add-conditional-factory-reset-comm.patch
0005-config-ast-common-Fall-back-to-secondary-flash-on-fa.patch

I think that=92s why the bootargs is not correct.

This is the details of how I enabled the ubi support in my platform recipes=
,

1. In meta-myplatform/conf/distro/openbmc-myplatform.conf, I added,
require conf/distro/include/phosphor-base.inc
require conf/distro/include/phosphor-ubi.inc

2. In meta-myplatform/conf/machine/myplatform.conf, I added,
IMAGE_FSTYPES +=3D " mtd-ubi mtd-ubi-tar"
OBMC_MACHINE_FEATURES +=3D " obmc-ubi-fs"

Do I miss anything?

Thanks.

Best regards,

Kun Zhao
/*
  zkxz@hotmail.com<mailto:zkxz@hotmail.com>
*/


--_000_BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0BYAPR14MB2342namp_
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
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Team,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My platform is based on ast2500, and I=92ve already =
been able to built out the ubi image. But when I tried to test it with qemu=
, it just stopped at u-boot because =91can=92t get kernel image,</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">qemu-system-arm: Aspeed iBT has no chardev backend<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">U-Boot 2016.07 (Sep 04 2020 - 19:47:48 +0000)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Watchdog enabled<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">DRAM:&nbsp; 496 MiB<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">Flash: 32 MiB<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">*** Warning - bad CRC, using default environment<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">In:&nbsp;&nbsp;&nbsp; serial<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">Out:&nbsp;&nbsp; serial<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">Err:&nbsp;&nbsp; serial<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">Net:&nbsp;&nbsp; MAC0 : RGMII<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">MAC1 : RGMII<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">FTGMAC100#0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">Error: FTGMAC100#0 address not set.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">, FTGMAC100#1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">Error: FTGMAC100#1 address not set.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">Hit any key to stop autoboot:&nbsp; 0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">Wrong Image Format for bootm command<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">ERROR: can't get kernel image!<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">ast#<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">And I found the bootargs is not right,<o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">ast# print<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">baudrate=3D115200<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">bootargs=3Dconsole=3DttyS4,115200n8 root=3D/dev/ram rw<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">bootcmd=3Dbootm 20080000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">bootdelay=3D2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Checked in the build folder for tmp/work/myplatform-=
openbmc-linux-gnueabi/u-boot-aspeed/1_v2016.07+gitAUTOINC+1ded9fa3a2-r0/ an=
d found the none of the following patches are there,<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">0002-config-ast-common-hack-bootopts.patch<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">0003-config-ast-common-Add-bootopts-to-support-ubi-and-mt.patch<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">0004-config-ast-common-Add-conditional-factory-reset-comm.patch<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">0005-config-ast-common-Fall-back-to-secondary-flash-on-fa.patch<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I think that=92s why the bootargs is not correct.<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is the details of how I enabled the ubi support=
 in my platform recipes,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">1. In meta-myplatform/conf/distro/openbmc-myplatform=
.conf, I added,<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">require conf/distro/include/phosphor-base.inc<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">require conf/distro/include/phosphor-ubi.inc<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">2. In meta-myplatform/conf/machine/myplatform.conf, =
I added,<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">IMAGE_FSTYPES +=3D &quot; mtd-ubi mtd-ubi-tar&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:Consolas=
">OBMC_MACHINE_FEATURES +=3D &quot; obmc-ubi-fs&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Do I miss anything?<o:p></o:p></p>
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

--_000_BYAPR14MB23426A9032F9FDAF87F1BC19CF2D0BYAPR14MB2342namp_--
