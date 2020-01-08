Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BA4133F0A
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 11:14:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47t4pY4qcfzDqSm
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 21:13:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vertiv.com (client-ip=2a01:111:f400:fe5b::60e;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=troy.lee@vertiv.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vertiv.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vertivco.onmicrosoft.com
 header.i=@vertivco.onmicrosoft.com header.b="DCI5r5l9"; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::60e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47t4nn1P4LzDqS5
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jan 2020 21:13:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GD7N0Hwzrk3qeamE6lT+o8690QNJ89WIkIUaLCSF6FVnHzZsR3JzhqAJIiCGQ6JwTjfoKnRWo4ORIZ10N0jRzvl2l1uImbwHvK/tCIO+x0iURPZ+H35VFoQX8Uiz20VYZg/7N4E2MPeRW0ywKXpIg+DO/xNOToZCkIUFttrCKtKUr93RjbSQN1Q5HtKdu/8J+/f47E/z7UC3mP+LKBk216OHCxXh2sXvefZMH+mERpc6Fb8HktoCBqwI2+MAbgkuE+hNLdHuG0x8UDhrFeNdrw/mXC0KjLcTY6j88z9Z70KEfXORIlg8Ouxc+jSq3bKIxeW+QC6IHy6K3FEriA0M5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5S1t+8LYF2I2qQiRZA7HSmGct/nshTRvmHAryg6huw=;
 b=bum2gcgzMp13HdjHR/GjxWfHuyzhM3j6C5q4IPS4SSEsiQs+j9Nm+bCC8tUFFmTRoyb0QmMzArVcDEzwBokyNXBKfpvcj+/M+49tHmZSG+KZYK1xg2dZ9ajjkA5jIbkWBqsPA73B36XZwk8E31u0kBBoeInht9gMk8weRniMxr5znB6t5dSdRXB8BGEfnXOFbp26spFPWv5kUcYBKe89l4+06t2kYUXPSCP3/4RlL7ZxYNM7EvMnWE9cZ5Sg4KeuWUCUfSYNcVZzIHTcrRC9YcZFt8uoilApbqGp8+z0xAuA3Eb0IUhJoAiAZ8bPqWtzBUjBOPg8i6JV0TQjCY6esQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vertiv.com; dmarc=pass action=none header.from=vertiv.com;
 dkim=pass header.d=vertiv.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vertivco.onmicrosoft.com; s=selector2-vertivco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5S1t+8LYF2I2qQiRZA7HSmGct/nshTRvmHAryg6huw=;
 b=DCI5r5l93nFkTPWVtpGn3CmCtpZYqsyLRJF+XdQVCftiYPBQ1PcXxZOGfZznJlfGpz92ggs+PXOI+o7alZv9FFXS2kcb9aH6t0G5Xs4uj811uRRFnHWDqFttGBZyhnrMoYUK020dfqnFePi4u/51kIfq5+fHlTg0FBolI7FKH5g=
Received: from MWHPR13MB1360.namprd13.prod.outlook.com (10.173.120.8) by
 MWHPR13MB1822.namprd13.prod.outlook.com (10.171.146.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.4; Wed, 8 Jan 2020 10:13:06 +0000
Received: from MWHPR13MB1360.namprd13.prod.outlook.com
 ([fe80::d8cb:40f9:9c6b:95e4]) by MWHPR13MB1360.namprd13.prod.outlook.com
 ([fe80::d8cb:40f9:9c6b:95e4%5]) with mapi id 15.20.2644.006; Wed, 8 Jan 2020
 10:13:05 +0000
From: "Troy.Lee@vertiv.com" <Troy.Lee@vertiv.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Creating VLAN always fails and the phosphor network service aborts
Thread-Topic: Creating VLAN always fails and the phosphor network service
 aborts
Thread-Index: AdXGCqUlMA7VLombRSWtnT00J/8ZbQ==
Date: Wed, 8 Jan 2020 10:13:05 +0000
Message-ID: <MWHPR13MB13602B21B761EAA71B9A4E9EED3E0@MWHPR13MB1360.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Troy.Lee@vertiv.com; 
x-originating-ip: [103.83.160.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db445ee1-631d-4a13-b25b-08d794235a7f
x-ms-traffictypediagnostic: MWHPR13MB1822:
x-microsoft-antispam-prvs: <MWHPR13MB1822089260D510E2417FEF18ED3E0@MWHPR13MB1822.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 02760F0D1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(189003)(199004)(66476007)(66556008)(316002)(66946007)(186003)(5660300002)(52536014)(7696005)(6506007)(26005)(76116006)(478600001)(66446008)(64756008)(6916009)(71200400001)(55016002)(86362001)(9686003)(81166006)(81156014)(8676002)(33656002)(8936002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR13MB1822;
 H:MWHPR13MB1360.namprd13.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vertiv.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vHGDbryhYGJqdL4C8sQHZv95ELf04EBSusUPsmdsbz+G1O+UKMatXDTmC5yVetSFXBM4ghmxoBdSsUCLO91otdIg02qrhp2zzSi7lzPI9t/m03G7u/6WxUVEiGcyeXciq8KGCKJkokyZeFLDvFMAp3WnQ0oFESblHNIu9rffo4i2dqPfs8/n33HAipCrv0JzFoGAa5vtXRLiIPDEFtc2EzKnKNoSH9r5p5qTQEuADkJ13WIn/NEtoyo0tOwdw46qPRnrtWfOwkOnKhER7zA1Dpa7jEHjJ8xTn6DPclBhsiriGj47vvUhU4kWfCalmNuGntVhtdsTwlkyJaZUuadhtQZYfyvd6lbUc1mJo/M9oDjb6ktBSstD+HEIBTl5Yc8FtROjr+MCQ3x6mqr1KtOITcjpqxg8XoicXkZdG7hSJFWBxv2D9js9/cQMvky1bpF7
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MWHPR13MB13602B21B761EAA71B9A4E9EED3E0MWHPR13MB1360namp_"
MIME-Version: 1.0
X-OriginatorOrg: vertiv.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db445ee1-631d-4a13-b25b-08d794235a7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2020 10:13:05.8029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 74fe92c5-ef57-4d1a-a0e7-9451117d9272
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JXOqUEZJAQnMrwFJ2Yis3iy1JoNPWDPPwau5kYZQigLmsXD3QrYcocYP4JW/r/fZ/EqxEETVE2MFCrpEOpjjtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR13MB1822
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

--_000_MWHPR13MB13602B21B761EAA71B9A4E9EED3E0MWHPR13MB1360namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

We met an issue that creating a VLAN is always fail, and the phosphor-netwo=
rk-manager/systemd-networkd are caught abort signal.
Does anyone have any thought about this?

root@ ast2500evb:~# ps | grep network
4432 root      8804 S    phosphor-network-manager
4444 systemd- 16828 S    /lib/systemd/systemd-networkd
root@ ast2500evb:~# busctl --no-pager call xyz.openbmc_project.Network \
/xyz/openbmc_project/network \
xyz.openbmc_project.Network.VLAN.Create \
                                   VLAN su "eth0" 123
Call failed: Remote peer disconnected
root@ ast2500evb:~# ps | grep network
4489 root      8804 S    phosphor-network-manager
4500 systemd-  1448 R    /lib/systemd/systemd-networkd

Journal log has the following error:
Jan 01 00:21:10 ast2500evb phosphor-network-manager[4432]: Refreshing the o=
bjects.
Jan 01 00:21:11 ast2500evb phosphor-network-manager[4432]: ioctl failed for=
 SIOCETHTOOL:
Jan 01 00:21:11 ast2500evb phosphor-network-manager[4432]: ioctl failed for=
 SIOCETHTOOL:
Jan 01 00:21:11 ast2500evb phosphor-network-manager[4432]: Refreshing compl=
ete.
Jan 01 00:21:13 ast2500evb phosphor-network-manager[4432]: ioctl failed for=
 SIOCGIFHWADDR:
Jan 01 00:21:13 ast2500evb phosphor-network-manager[4432]: terminate called=
 after throwing an instance of 'sdbusplus::xyz::openbmc_project::Common::Er=
ror::InternalFailure'
Jan 01 00:21:13 ast2500evb phosphor-network-manager[4432]:   what():  xyz.o=
penbmc_project.Common.Error.InternalFailure: The operation failed internall=
y.
Jan 01 00:21:13 ast2500evb phosphor-network-manager[4432]: The operation fa=
iled internally.
Jan 01 00:21:13 ast2500evb systemd[1]: xyz.openbmc_project.Network.service:=
 Main process exited, code=3Dkilled, status=3D6/ABRT
Jan 01 00:21:13 ast2500evb systemd[1]: xyz.openbmc_project.Network.service:=
 Failed with result 'signal'.
Jan 01 00:21:14 ast2500evb systemd[1]: xyz.openbmc_project.Network.service:=
 Service RestartSec=3D1s expired, scheduling restart.
Jan 01 00:21:14 ast2500evb systemd[1]: xyz.openbmc_project.Network.service:=
 Scheduled restart job, restart counter is at 3.
Jan 01 00:21:14 ast2500evb systemd[1]: Stopped Phosphor Network Manager.
Jan 01 00:21:14 ast2500evb systemd[1]: Starting Phosphor Network Manager...
Jan 01 00:21:14 ast2500evb systemd[1]: Started Phosphor Network Manager.
Jan 01 00:21:17 ast2500evb systemd[1]: Stopping Network Service...
Jan 01 00:21:18 ast2500evb systemd[1]: systemd-networkd.service: Succeeded.
Jan 01 00:21:18 ast2500evb systemd[1]: Stopped Network Service.
Jan 01 00:21:18 ast2500evb systemd[1]: Starting Network Service...


Thanks,
Troy Lee
CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with it are i=
ntended solely for the use of the individual or entity to whom they are add=
ressed and may contain confidential and privileged information protected by=
 law. If you received this e-mail in error, any review, use, dissemination,=
 distribution, or copying of the e-mail is strictly prohibited. Please noti=
fy the sender immediately by return e-mail and delete all copies from your =
system.

--_000_MWHPR13MB13602B21B761EAA71B9A4E9EED3E0MWHPR13MB1360namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple" style=3D"text-justify-t=
rim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Hi T=
eam,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">We m=
et an issue that creating a VLAN is always fail, and the phosphor-network-m=
anager/systemd-networkd are caught abort signal.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Does=
 anyone have any thought about this?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">root=
@ ast2500evb:~# ps | grep network<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:6.0pt"><span lang=3D"EN-US" sty=
le=3D"font-size:12.0pt">4432 root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8804 S&nbsp=
;&nbsp;&nbsp; phosphor-network-manager<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">4444=
 systemd- 16828 S&nbsp;&nbsp;&nbsp; /lib/systemd/systemd-networkd<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">root=
@ ast2500evb:~# busctl --no-pager call xyz.openbmc_project.Network \<o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:216.0pt"><span lang=3D"EN-US" s=
tyle=3D"font-size:12.0pt">/xyz/openbmc_project/network \<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"text-indent:216.0pt"><span lang=3D"EN-US" s=
tyle=3D"font-size:12.0pt">xyz.openbmc_project.Network.VLAN.Create \<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VLAN su &quot;eth0&=
quot; 123<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;color=
:red">Call failed: Remote peer disconnected</span><span lang=3D"EN-US" styl=
e=3D"font-size:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">root=
@ ast2500evb:~# ps | grep network<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:6.0pt"><span lang=3D"EN-US" sty=
le=3D"font-size:12.0pt">4489 root&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8804 S&nbsp=
;&nbsp;&nbsp; phosphor-network-manager<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">4500=
 systemd-&nbsp; 1448 R&nbsp;&nbsp;&nbsp; /lib/systemd/systemd-networkd<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jour=
nal log has the following error:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:10 ast2500evb phosphor-network-manager[4432]: Refreshing the objec=
ts.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:11 ast2500evb phosphor-network-manager[4432]:<span style=3D"color:=
red"> ioctl failed for SIOCETHTOOL:</span><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:11 ast2500evb phosphor-network-manager[4432]:
<span style=3D"color:red">ioctl failed for SIOCETHTOOL:</span><o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:11 ast2500evb phosphor-network-manager[4432]: Refreshing complete.=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:13 ast2500evb phosphor-network-manager[4432]:
<span style=3D"color:red">ioctl failed for SIOCGIFHWADDR:</span><o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:13 ast2500evb phosphor-network-manager[4432]: terminate called aft=
er throwing an instance of 'sdbusplus::xyz::openbmc_project::Common::Error:=
:InternalFailure'<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:13 ast2500evb phosphor-network-manager[4432]:&nbsp;&nbsp; what():&=
nbsp; xyz.openbmc_project.Common.Error.InternalFailure: The operation faile=
d internally.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:13 ast2500evb phosphor-network-manager[4432]: The operation failed=
 internally.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:13 ast2500evb systemd[1]:
<span style=3D"color:red">xyz.openbmc_project.Network.service: Main process=
 exited, code=3Dkilled, status=3D6/ABRT</span><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:13 ast2500evb systemd[1]:
<span style=3D"color:red">xyz.openbmc_project.Network.service: Failed with =
result 'signal'.</span><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:14 ast2500evb systemd[1]: xyz.openbmc_project.Network.service: Ser=
vice RestartSec=3D1s expired, scheduling restart.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:14 ast2500evb systemd[1]: xyz.openbmc_project.Network.service: Sch=
eduled restart job, restart counter is at 3.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:14 ast2500evb systemd[1]: Stopped Phosphor Network Manager.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:14 ast2500evb systemd[1]: Starting Phosphor Network Manager...<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:14 ast2500evb systemd[1]: Started Phosphor Network Manager.<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:17 ast2500evb systemd[1]: Stopping Network Service...<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:18 ast2500evb systemd[1]: systemd-networkd.service: Succeeded.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:18 ast2500evb systemd[1]: Stopped Network Service.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 00:21:18 ast2500evb systemd[1]: Starting Network Service...<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Than=
ks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Troy=
 Lee<o:p></o:p></span></p>
</div>
CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with it are i=
ntended solely for the use of the individual or entity to whom they are add=
ressed and may contain confidential and privileged information protected by=
 law. If you received this e-mail
 in error, any review, use, dissemination, distribution, or copying of the =
e-mail is strictly prohibited. Please notify the sender immediately by retu=
rn e-mail and delete all copies from your system.
</body>
</html>

--_000_MWHPR13MB13602B21B761EAA71B9A4E9EED3E0MWHPR13MB1360namp_--
