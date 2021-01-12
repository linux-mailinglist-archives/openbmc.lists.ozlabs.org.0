Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E41D82F6F1C
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 00:48:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DH1H52KVfzDqNj
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 10:48:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=40.107.131.117;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=mohammed.habeeb@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inventec.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=dDk3nAAP; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310117.outbound.protection.outlook.com [40.107.131.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFfqD3ypXzDr5b
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 05:53:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fztv3aF7wN2SBHUN5hS0wZE1Z07MCrAdWY/9A+v5olqaIQyvVshwjymIlyD/FqIg3T4rNZMh91kFePNnDHw5aWe+Y9DrKlz02GVboEoSJyLL8ioccS/8kwxsqVZvaTFBzJ2U9MxFDJjqGrtSsxiukxmwFATHHgTnd21hBhTR06P8XV9/jnx0YqXjCZulC9eLWvGF8jP/WiZi5IBKTNXEb4WdHE+xbp1C3tG/REQbmIo6ncCBUZfDEKJ0GNIfWlfCy1hUx7vThxGCg3xF6JbyFtST29pWKRdrHO8ArwHANjvPHFzaNtp/2cpxRKGH7ogpE0Xn6NarcJ4N90f3Y8KdTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwMS/pEttAOgErOSrtbzLSyl0tTeVNmA/fZth7u6Q3E=;
 b=GUvT6RBesFxSwau/w2xf7UycO48bq2vHKOHGa7tclx73ZGGIomflX4X9iHOVZy5sh3cHK9ZynzFSpTIpczdhGutY0UFieQWCGyYtSxijOoaQnMpioSyZ1os+rAYl6KYDF0dqOEfEUpoCYYUHbOx04QkJZUE0HVm3cHcpzsLDiPwdKj83v/HD4eovFCxk5Ce+opyK/47JnLXrW8BCt8j3ucve5MttfLMr9KpDlXVJmvvDViaWuPehAW3FzH8kDXtCW79gGdA6NG29uvYXT+i2uOMDayUPHqL1lmUnF1O9wL3aFNU+SqjjuxEGhzKnum4wkGjFo3rrb1xAmSlvmhzxpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwMS/pEttAOgErOSrtbzLSyl0tTeVNmA/fZth7u6Q3E=;
 b=dDk3nAAP7obKJNKk5WH2RYaeKHkx3/kIIWNki5h4UZEoP2Hdj586rwXqzTufJGjoZr8BuQhpqUN2PeSNREHuqaxEAoHfaHrUx+7+feMJ53RTW8xACWxk6gc0Pv14S2f5rPaPNowRk7wG9VSEkEuT+tuiibf9J1YJt5iGM0OuPks=
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com (2603:1096:300:48::10)
 by PSBPR02MB4359.apcprd02.prod.outlook.com (2603:1096:301:4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 18:53:20 +0000
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::4cc2:cac1:a003:53f4]) by PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::4cc2:cac1:a003:53f4%6]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 18:53:20 +0000
From: Mohammed.Habeeb ISV <mohammed.habeeb@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Regarding eth0 (ftgmac100): transmit queue 0 timed out
Thread-Topic: Regarding eth0 (ftgmac100): transmit queue 0 timed out
Thread-Index: AdbpEdaHpYSz7LXNTyeSXhPDaKGwTg==
Date: Tue, 12 Jan 2021 18:53:20 +0000
Message-ID: <PS2PR02MB3541276EFDDDD18BDAA34A2D90AA0@PS2PR02MB3541.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=inventec.com;
x-originating-ip: [207.140.31.146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9ef184c5-077b-4293-7e3b-08d8b72b549e
x-ms-traffictypediagnostic: PSBPR02MB4359:
x-microsoft-antispam-prvs: <PSBPR02MB435924264241A68A488CC00790AA0@PSBPR02MB4359.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:820;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YvDJCUO9PRFMP+LpnEvEqSO67LOTJ4i8EWdWfYCJVslCu7msFuDZsPcxbkCuX0y/LgY4zyYDqN//Jzt05UsfGnYiH5bEnxP7cKocbu0j5zlpXOE0BuOOmmuRm99+JctT5nh+/+W2YKvRs1BC0urXtnJSOIQp8+OTTX4L2f7QZeNI6+uz8Jycd+BpTicttlCkNpeBxkoMHVGHkJ4EJc5JfHrLeYsF9hny0ITwmf8zR2Yo/4DjLNkFI3I1SX6QvNZi8pjsx/B6rpZAHknEYfc6O/gUu6h8Q58IWfgblPkYvpA2u9ns7JXuyZ0zUO6dLVRN9ta6/+Ld1mLmdEngWfPuUrHCFHlAZNQdHyR91+NsaBoOX2Ig9xE8PqDt/YRDVKHXIdSjD6RU5Q35IoP+HQo+rdi/XUG+XNfn811tIvHBZ8eBpvcylx7BpWfNGxXknZEIfpkwa9EMKbLKQgX1cLEqIQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS2PR02MB3541.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(2906002)(71200400001)(99936003)(86362001)(8676002)(4744005)(9686003)(8936002)(6506007)(9326002)(7696005)(76116006)(66946007)(33656002)(52536014)(66616009)(55016002)(66476007)(83380400001)(478600001)(66446008)(166002)(966005)(186003)(66556008)(64756008)(5660300002)(26005)(6916009)(21615005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?PpyMe0zl8Wi3KZYUf3bODIsPLNV3+LvyoysdlHFfm7jDCqMIEeqpU/wZzyWT?=
 =?us-ascii?Q?T4xIDSiQ5PGtkkfPe9TBy0Bn36zVyN45fe3/EvXiYOuEipAY88SrhQtWJUKt?=
 =?us-ascii?Q?jrfhEBQsCLayxXrBySWYmw60QcsspAjHSfd1YgqmvmoFSmMrF22FauK6D5Tc?=
 =?us-ascii?Q?Oq9AkYSWMiQyfY3Ru0p/Vat+Ep4bxCtUZmI0Aht/SuKTT1GE+xwTCwNoDEXk?=
 =?us-ascii?Q?5SzLQaJmRb4lncX9+sHGtgpDRLLd0JA7blRejm8IXDhVix6erdtOWiiyj48g?=
 =?us-ascii?Q?vHvl3F3uLsSwHhFBTyhthNa6eeJhbqQbxmkoDzvMLIVe2wdxEcU6qUP1mdof?=
 =?us-ascii?Q?ctC1hlrxnKM7f6o5cNILFXCBzK7gMcDedy2OcTkF/rqEnaC9bielROjYKIok?=
 =?us-ascii?Q?8Mgt4124uSnk9I516FfQ4NIH4ymLK0yEn5VvutJpJ5nhNjFxNZvduUGmeTyf?=
 =?us-ascii?Q?s9tCI6NlaRWfIBGDSAkYOTN+yoYmvy4JA2mntP5le/BCISu/PVlIxmB6b+CS?=
 =?us-ascii?Q?kPVB0Bibxk2diOjc0yrbB0oQlZvjpaz7NAshmKRywu0Rbrr5Ok/ea6q5T2Bd?=
 =?us-ascii?Q?sGmD34JKrHRLIayBI8OzRHsWfWmYsrQ5MlHtDaF5bSpec5FFb2SoCD+9XhAX?=
 =?us-ascii?Q?NqJWOe2xaeR6DqLG+MM04OTaL2KRODp+LOuBnxEadZUbH6gJpv1mfnI6fYOI?=
 =?us-ascii?Q?vwOP+XzLHX+1/NV/uPOBuV2TxVDKlnYgVfZLP1ZmOyKKz9m0iwKmiCZ1gGOO?=
 =?us-ascii?Q?e2ar1KmZ47NYXQlje8msVCKsTwXJKNgDRebQzC7j/yt83KzOS7LfJLIfIkZ4?=
 =?us-ascii?Q?ZZpJNz4jku30QmDZAPO7lNu4zcrpjhiB8pTMYxILv/9o5MvdODutfwiiH8iu?=
 =?us-ascii?Q?R0EFRfANqEud4424z9B5fIqQPL53/KDB1bWJgP5r4GT3UZd5PiYq+r+3t7lp?=
 =?us-ascii?Q?FagAn/QdMwKP54sBTPDVfLxo68Ga+SA4ftCCYOosELM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_004_PS2PR02MB3541276EFDDDD18BDAA34A2D90AA0PS2PR02MB3541apcp_"
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2PR02MB3541.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef184c5-077b-4293-7e3b-08d8b72b549e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 18:53:20.2395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0+SxTGrLApcgOwFJ5qyEIMsJq2eSxFHol9Lu0s4R94RKIY4yNcSQYJUlhU6mPU/kp+5V7cmAQN1BjxFHsDyBkQScN/gSQvClMvksFIm1mWk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSBPR02MB4359
X-Mailman-Approved-At: Fri, 15 Jan 2021 10:48:09 +1100
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

--_004_PS2PR02MB3541276EFDDDD18BDAA34A2D90AA0PS2PR02MB3541apcp_
Content-Type: multipart/alternative;
	boundary="_000_PS2PR02MB3541276EFDDDD18BDAA34A2D90AA0PS2PR02MB3541apcp_"

--_000_PS2PR02MB3541276EFDDDD18BDAA34A2D90AA0PS2PR02MB3541apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

We see below backtrace on our runBmc board. And networking does not work on=
 eth0.
No DHCP and static IP address can work. Pings and ARP fails, no packets rec=
eived seen running tcpdump.
Using 2.7 version of openBmc. Please let me know if there is a known fix or=
 patch for this.

transformers:~# [  158.082251] ------------[ cut here ]------------
[  158.087442] WARNING: CPU: 1 PID: 0 at net/sched/sch_generic.c:447 dev_wa=
tchdog+0x2d4/0x2f8
[  158.096681] NETDEV WATCHDOG: eth0 (ftgmac100): transmit queue 0 timed ou=
t
[  158.104279] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.4.8-671f622-dirt=
y-f5845fd #1

Few issues were reported but no resolution.
https://github.com/openbmc/openbmc/issues/3192
https://github.com/openbmc/openbmc/issues/2228

Tried below patch , seems does not work.
http://lkml.iu.edu/hypermail/linux/kernel/2010.1/05957.html

FYI ..We tried openBmc 2.9 version. It can work fine.

Attached is the complete backtrace.

Thanks


--_000_PS2PR02MB3541276EFDDDD18BDAA34A2D90AA0PS2PR02MB3541apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We see below backtrace on our runBmc board. And netw=
orking does not work on eth0.<o:p></o:p></p>
<p class=3D"MsoNormal">No DHCP and static IP address can work. Pings and AR=
P fails, no packets received seen running tcpdump.<o:p></o:p></p>
<p class=3D"MsoNormal">Using 2.7 version of openBmc. Please let me know if =
there is a known fix or patch for this.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">transformers:~# [&nbsp; 158.082251] ------------[ cu=
t here ]------------<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 158.087442] WARNING: CPU: 1 PID: 0 at net/sc=
hed/sch_generic.c:447 dev_watchdog+0x2d4/0x2f8<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 158.096681] NETDEV WATCHDOG: eth0 (ftgmac100=
): transmit queue 0 timed out<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp; 158.104279] CPU: 1 PID: 0 Comm: swapper/1 No=
t tainted 5.4.8-671f622-dirty-f5845fd #1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Few issues were reported but no resolution.<o:p></o:=
p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/openbmc/issues=
/3192">https://github.com/openbmc/openbmc/issues/3192</a><o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/openbmc/issues=
/2228">https://github.com/openbmc/openbmc/issues/2228</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Tried below patch , seems does not work. <o:p></o:p>=
</p>
<p class=3D"MsoNormal"><a href=3D"http://lkml.iu.edu/hypermail/linux/kernel=
/2010.1/05957.html">http://lkml.iu.edu/hypermail/linux/kernel/2010.1/05957.=
html</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">FYI ..We tried openBmc 2.9 version. It can work fine=
. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Attached is the complete backtrace. &nbsp;<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_PS2PR02MB3541276EFDDDD18BDAA34A2D90AA0PS2PR02MB3541apcp_--

--_004_PS2PR02MB3541276EFDDDD18BDAA34A2D90AA0PS2PR02MB3541apcp_
Content-Type: text/plain; name="stacktrace.txt"
Content-Description: stacktrace.txt
Content-Disposition: attachment; filename="stacktrace.txt"; size=3347;
	creation-date="Tue, 12 Jan 2021 18:53:12 GMT";
	modification-date="Fri, 08 Jan 2021 19:07:48 GMT"
Content-Transfer-Encoding: base64

dHJhbnNmb3JtZXJzOn4jIFsgIDE1OC4wODIyNTFdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0t
LS0tLS0tLS0tLQ0KWyAgMTU4LjA4NzQ0Ml0gV0FSTklORzogQ1BVOiAxIFBJRDogMCBhdCBuZXQv
c2NoZWQvc2NoX2dlbmVyaWMuYzo0NDcgZGV2X3dhdGNoZG9nKzB4MmQ0LzB4MmY4DQpbICAxNTgu
MDk2NjgxXSBORVRERVYgV0FUQ0hET0c6IGV0aDAgKGZ0Z21hYzEwMCk6IHRyYW5zbWl0IHF1ZXVl
IDAgdGltZWQgb3V0DQpbICAxNTguMTA0Mjc5XSBDUFU6IDEgUElEOiAwIENvbW06IHN3YXBwZXIv
MSBOb3QgdGFpbnRlZCA1LjQuOC02NzFmNjIyLWRpcnR5LWY1ODQ1ZmQgIzENClsgIDE1OC4xMTI5
MjFdIEhhcmR3YXJlIG5hbWU6IEdlbmVyaWMgRFQgYmFzZWQgc3lzdGVtDQpbICAxNTguMTE4MjY0
XSBCYWNrdHJhY2U6DQpbICAxNTguMTIxMDAyXSBbPDgwMTBlYTU0Pl0gKGR1bXBfYmFja3RyYWNl
KSBmcm9tIFs8ODAxMGVjODg+XSAoc2hvd19zdGFjaysweDIwLzB4MjQpDQpbICAxNTguMTI5NDQ5
XSAgcjc6MDAwMDAxYmYgcjY6NjAwZTAxMTMgcjU6MDAwMDAwMDAgcjQ6ODBjNTVlYjgNClsgIDE1
OC4xMzU3NjddIFs8ODAxMGVjNjg+XSAoc2hvd19zdGFjaykgZnJvbSBbPDgwODM0MTEwPl0gKGR1
bXBfc3RhY2srMHhjOC8weGU0KQ0KWyAgMTU4LjE0MzgzMF0gWzw4MDgzNDA0OD5dIChkdW1wX3N0
YWNrKSBmcm9tIFs8ODAxMjM0Njg+XSAoX193YXJuKzB4Y2MvMHgxMDQpDQpbICAxNTguMTUxNTk3
XSAgcjc6MDAwMDAxYmYgcjY6ODA3MmY4MGMgcjU6MDAwMDAwMDkgcjQ6ODBhODVjMTANClsgIDE1
OC4xNTc5MTNdIFs8ODAxMjMzOWM+XSAoX193YXJuKSBmcm9tIFs8ODAxMjM4YjA+XSAod2Fybl9z
bG93cGF0aF9mbXQrMHg5Yy8weGM0KQ0KWyAgMTU4LjE2NjI2Ml0gIHI3OjgwNzJmODBjIHI2OjAw
MDAwMWJmIHI1OjgwYTg1YzEwIHI0OjgwYTg1YmQ0DQpbICAxNTguMTcyNTgxXSBbPDgwMTIzODE4
Pl0gKHdhcm5fc2xvd3BhdGhfZm10KSBmcm9tIFs8ODA3MmY4MGM+XSAoZGV2X3dhdGNoZG9nKzB4
MmQ0LzB4MmY4KQ0KWyAgMTU4LjE4MTcwNl0gIHI4OmI0NDAyODAwIHI3OjAwMDAwMDAxIHI2Ojgw
YzAzZDAwIHI1OmI0NDAyYTY0IHI0OjAwMDAwMDAwDQpbICAxNTguMTg5MTg1XSBbPDgwNzJmNTM4
Pl0gKGRldl93YXRjaGRvZykgZnJvbSBbPDgwMTk3YzA4Pl0gKGNhbGxfdGltZXJfZm4rMHg0MC8w
eDE5YykNClsgIDE1OC4xOTc4MjZdICByODpmZmZmYzg5MCByNzowMDAwMDEwMCByNjo4MDcyZjUz
OCByNTpiNDQwMmE2NCByNDpiNDQwMmE2NA0KWyAgMTU4LjIwNTMwM10gWzw4MDE5N2JjOD5dIChj
YWxsX3RpbWVyX2ZuKSBmcm9tIFs8ODAxOTgzOTQ+XSAocnVuX3RpbWVyX3NvZnRpcnErMHgxZmMv
MHg1ZDgpDQpbICAxNTguMjE0NTI1XSAgcjg6ZmZmZmM4OTAgcjc6ZmZmZmUwMDAgcjY6MDAwMDAw
MDAgcjU6YjQ0MDJhNjQgcjQ6YmYwZmRlMzQNClsgIDE1OC4yMjIwMDRdIFs8ODAxOTgxOTg+XSAo
cnVuX3RpbWVyX3NvZnRpcnEpIGZyb20gWzw4MDEwMjRhMD5dIChfX2RvX3NvZnRpcnErMHhmMC8w
eDM3NCkNClsgIDE1OC4yMzEwMzNdICByMTA6MDAwMDAwODIgcjk6YmYwZmRmMzggcjg6MDAwMDAx
MDAgcjc6YmYwZmMwMDAgcjY6MDAwMDAwMDEgcjU6MDAwMDAwMDINClsgIDE1OC4yMzk3NjddICBy
NDo4MGMwMzA4NA0KWyAgMTU4LjI0MjU5Ml0gWzw4MDEwMjNiMD5dIChfX2RvX3NvZnRpcnEpIGZy
b20gWzw4MDEyYTAxOD5dIChpcnFfZXhpdCsweGIwLzB4ZTgpDQpbICAxNTguMjUwNjUxXSAgcjEw
OjAwMDAwMDAwIHI5OmJmMGZkZjM4IHI4OmJmMDBjODAwIHI3OjAwMDAwMDAxIHI2OjAwMDAwMDAw
IHI1OjgwYjdkMWM0DQpbICAxNTguMjU5Mzg1XSAgcjQ6ZmZmZmUwMDANClsgIDE1OC4yNjIyMDJd
IFs8ODAxMjlmNjg+XSAoaXJxX2V4aXQpIGZyb20gWzw4MDE3ODY1Yz5dIChfX2hhbmRsZV9kb21h
aW5faXJxKzB4NjgvMHhjNCkNClsgIDE1OC4yNzA5MzZdICByNTo4MGI3ZDFjNCByNDowMDAwMDAw
MA0KWyAgMTU4LjI3NDkyNF0gWzw4MDE3ODVmND5dIChfX2hhbmRsZV9kb21haW5faXJxKSBmcm9t
IFs8ODAxMDIyZjg+XSAoZ2ljX2hhbmRsZV9pcnErMHg0Yy8weDk0KQ0KWyAgMTU4LjI4NDI0NV0g
IHI5OmJmMGZkZjM4IHI4OjAwMDAwMDAwIHI3OmJmODAyMDAwIHI2OjgwYzA2MmU4IHI1OjAwMDAw
M2ZmIHI0OmJmODAyMDBjDQpbICAxNTguMjkyODg2XSBbPDgwMTAyMmFjPl0gKGdpY19oYW5kbGVf
aXJxKSBmcm9tIFs8ODAxMDFhYWM+XSAoX19pcnFfc3ZjKzB4NmMvMHg5MCkNClsgIDE1OC4zMDEy
MzNdIEV4Y2VwdGlvbiBzdGFjaygweGJmMGZkZjM4IHRvIDB4YmYwZmRmODApDQpbICAxNTguMzA2
ODY2XSBkZjIwOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAwMDAxYmEzYyAwMDAwMDAwMA0KWyAgMTU4LjMxNTk5M10gZGY0MDogYmY1OWJkZjQg
ODAxMWQ3ODAgYmYwZmMwMDAgMDAwMDAwMDEgODBjMDVjNjggODBjMDVjYTQgODBjNWEyZDIgODA5
ZmZmZjANClsgIDE1OC4zMjUxMTldIGRmNjA6IDAwMDAwMDAwIGJmMGZkZjk0IGJmMGZkZjk4IGJm
MGZkZjg4IDgwMTBhMDNjIDgwMTBhMDQwIDYwMGUwMDEzIGZmZmZmZmZmDQpbICAxNTguMzM0MjQ0
XSAgcjk6YmYwZmMwMDAgcjg6ODBjNWEyZDIgcjc6YmYwZmRmNmMgcjY6ZmZmZmZmZmYgcjU6NjAw
ZTAwMTMgcjQ6ODAxMGEwNDANClsgIDE1OC4zNDI4OTBdIFs8ODAxMGEwMDA+XSAoYXJjaF9jcHVf
aWRsZSkgZnJvbSBbPDgwODUzZTI4Pl0gKGRlZmF1bHRfaWRsZV9jYWxsKzB4MzAvMHgzYykNClsg
IDE1OC4zNTE5MjNdIFs8ODA4NTNkZjg+XSAoZGVmYXVsdF9pZGxlX2NhbGwpIGZyb20gWzw4MDE1
NjYyND5dIChkb19pZGxlKzB4ZDgvMHgxNmMpDQpbICAxNTguMzYwNDY3XSBbPDgwMTU2NTRjPl0g
KGRvX2lkbGUpIGZyb20gWzw4MDE1Njk4Yz5dIChjcHVfc3RhcnR1cF9lbnRyeSsweDI4LzB4MmMp
DQpbICAxNTguMzY4OTE0XSAgcjk6NDEwZmMwNzUgcjg6ODAwMDQwNmEgcjc6ODBjNzYyMDAgcjY6
MTBjMDM4N2QgcjU6MDAwMDAwMDEgcjQ6MDAwMDAwODkNClsgIDE1OC4zNzc1NTddIFs8ODAxNTY5
NjQ+XSAoY3B1X3N0YXJ0dXBfZW50cnkpIGZyb20gWzw4MDEwZmI1Yz5dIChzZWNvbmRhcnlfc3Rh
cnRfa2VybmVsKzB4MTQ4LzB4MThjKQ0KWyAgMTU4LjM4NzY1M10gWzw4MDEwZmExND5dIChzZWNv
bmRhcnlfc3RhcnRfa2VybmVsKSBmcm9tIFs8ODAxMDI3Y2M+XSAoX19lbmFibGVfbW11KzB4MC8w
eDE0KQ0KWyAgMTU4LjM5Njk3MF0gIHI1OjAwMDAwMDUxIHI0OmJmMGYwMDZhDQpbICAxNTguNDAx
MDE2XSAtLS1bIGVuZCB0cmFjZSBhNGY3M2I0YmZmNDE0MDc1IF0tLS0=

--_004_PS2PR02MB3541276EFDDDD18BDAA34A2D90AA0PS2PR02MB3541apcp_--
