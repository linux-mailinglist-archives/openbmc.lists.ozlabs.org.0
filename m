Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FEAD055F
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 03:55:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ny3923yMzDqKT
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 12:55:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=apc01-pu1-obe.outbound.protection.outlook.com
 (client-ip=40.107.132.80; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="eVJ4c+y9"; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320080.outbound.protection.outlook.com [40.107.132.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ny2Q39rwzDqJj
 for <openbmc@lists.ozlabs.org>; Wed,  9 Oct 2019 12:54:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUfIHqrR3kutBKN/PaXuU7kDXvydIObBrKyA8yZvxperGEjmjVsU5ReJQzhi46Y1D2E3Zu9U3j1R9m9nmcHonCnGpni2ZB+oGYnPHk5E9HU1ZxKKvb45nZr/HKhgKwl6/CBY/26yC/955r6iM2xb+KAI3KRXzuMmuClkgQgjh4gJDkd0w8MVd3hEwbUpKYHbKfIIHawkc6H34//QsuG/tLBFcAExk0Af/fwRLByedY5KzfFBf4d5pMhRmhSvRB0ptG4m1Lf9kg1OLKHgn2hRIaQPfvzMzmAPVgfnX9QbgojAmnPRP7oOXUWerSVCHedoMW1tccLLIAcuSdBFSInEKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ibuzs7YJ0ekKnI2KqTJHJOF2bz8LdX5iTLUOhTVPErs=;
 b=gZuy9WYrK6KWASi2IRE1Y2Zj2TiS773/hYHyumz0gGvAFtVZyQmoH9TW1mPahh5gk9lH8FaTZM+BJRfX57J1QwnrmDJcZqmdHwRz7nIIWp/DAdIr+8/h7p3xwgxR06p7gUnxGwtC9hDLZsybjmSM7l96bQv6WaP85h6TApgXkwgjhHuC62SX7dFfIE+wl7HlAWHcw0DCWCdgIa6P9+s/xEMnwp1auckCorNJaBEF0OutJU/rBVOdkFP0Z/xcSmCw3qEdjfs2ILXzWkRg3Z7JVG8SbsIKpNDEKjedUbNn6vXsIiHXImmZwuOGYRVfQkNtL/SxBkX12KBWjHeRX5bc3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ibuzs7YJ0ekKnI2KqTJHJOF2bz8LdX5iTLUOhTVPErs=;
 b=eVJ4c+y9ink25K9fx1S0yXuzutecG2J8zO4ncqmYc627NVmyUO/s/1A+9WRpZAIt+zfj/oye2cygXaswZmkzWwCPRdhMpdx5U1NL27tcNJvi+E2jNlnN/Z1m9fPrBsXaMDmx+XC1J7/V8DAg4NA9wdlMqwAQlqvAri3B3CoCX7c=
Received: from HK0PR03MB4660.apcprd03.prod.outlook.com (52.132.237.207) by
 HK0PR03MB5106.apcprd03.prod.outlook.com (52.132.239.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.11; Wed, 9 Oct 2019 01:54:30 +0000
Received: from HK0PR03MB4660.apcprd03.prod.outlook.com
 ([fe80::f813:7ba2:f7b:6862]) by HK0PR03MB4660.apcprd03.prod.outlook.com
 ([fe80::f813:7ba2:f7b:6862%3]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 01:54:30 +0000
From: CS20 CHLi30 <CHLI30@nuvoton.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Intel CPU Crashdump utilities for dumping CPU Crashdump and registers
 over PECI
Thread-Topic: Intel CPU Crashdump utilities for dumping CPU Crashdump and
 registers over PECI
Thread-Index: AdV+QIor2M+4UKtIQhSTc3Lhz9f/Iw==
Date: Wed, 9 Oct 2019 01:54:30 +0000
Message-ID: <HK0PR03MB466005C24CC229FBD1EEB94FCF950@HK0PR03MB4660.apcprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=CHLI30@nuvoton.com; 
x-originating-ip: [60.250.194.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 103c8f1d-819b-4b8c-f33b-08d74c5ba019
x-ms-traffictypediagnostic: HK0PR03MB5106:|HK0PR03MB5106:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR03MB510616535FBAC80BE4CF9D43CF950@HK0PR03MB5106.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(136003)(366004)(39840400004)(376002)(53754006)(199004)(189003)(478600001)(86362001)(66946007)(316002)(66066001)(9686003)(6306002)(54896002)(476003)(6436002)(76116006)(486006)(66446008)(7736002)(64756008)(66476007)(1730700003)(81156014)(8676002)(25786009)(2351001)(52536014)(7696005)(81166006)(66556008)(99286004)(256004)(33656002)(4326008)(71190400001)(6506007)(5660300002)(71200400001)(74316002)(14454004)(102836004)(2501003)(107886003)(2906002)(6116002)(186003)(26005)(790700001)(3846002)(14444005)(8936002)(6916009)(55016002)(5640700003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HK0PR03MB5106;
 H:HK0PR03MB4660.apcprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nuvoton.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dJt+APx+VQ6CN6so4r7qXdu8RQzjqEDccFzXaluj1rb13Qa2REIPo/6QwjVEn+4ZGr5xQPLv79sHMXvnuxZ/lrQ92qpbdeGoadsCk0NztsUBq3ll7x9cy3/8N/su5thBxsK+YUACf3HTiGvxn36/OdElZHF8KZSKVhN5XiyDd41qjPfytmDPYLKOYMx8jt9I0Y10Oye4KixuevP3zaXI3mIBtcsw+L4hgMZEbewWgvUu3h/aLIqYV82augfW36Q5BR4WxpT0Qzv+XHsrYyNbqSkrssa3YPbf+6WlNlfLunYB8nkYivn+OaZ+6lgusozI/+tJlCM5nS4CXDbGVyJykjnOIuZZLoxOJG1UpcuImH8GzKtAqfDTEdOuyxOlXdWBI92her+dRQ2g2Bi5poIOf0Wch65EVlNyCnIVJd71+HY=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR03MB466005C24CC229FBD1EEB94FCF950HK0PR03MB4660apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 103c8f1d-819b-4b8c-f33b-08d74c5ba019
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 01:54:30.7754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Cc3HgHti8hiMMbRDClRbdKRlhTzk6Nnc539Mo5KcXFdKEM8nUIJ60DjEar0trB/NTqXLuT9EB+TT3UHhJJzWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB5106
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
Cc: CS20 CHLi30 <CHLI30@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR03MB466005C24CC229FBD1EEB94FCF950HK0PR03MB4660apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

We found that oem system log type didn't show any log entries on "System lo=
gs" page in WebUI.
Even we had modify bmcweb_%.bbappend to enable these options as below:

bmcweb_%.bbappend:
# Enable CPU Log and Raw PECI support
EXTRA_OECMAKE +=3D "-DBMCWEB_ENABLE_REDFISH_CPU_LOG=3DON"
EXTRA_OECMAKE +=3D "-DBMCWEB_ENABLE_REDFISH_RAW_PECI=3DON"

In bmcweb/redfish-core/lib/log_services.hpp, we found that seems need to in=
clude com.intel.crashdump.service.
Then the crashdump daemon will help to dump CPU Crashdump and registers ove=
r PECI.

Thus, we include crashdump_git.bb recipe to build this daemon, but we got b=
uild fail due to fetch fail.
Could someone help us to check whether the SRC_URI of crashdump already mov=
e to the other source? Thanks.

crashdump_git.bb:
SRC_URI =3D "git://git@github.com/Intel-BMC/crashdump;protocol=3Dssh;nobran=
ch=3D1"
SRCREV =3D "c99e4fb7727545501fe65b90a8a97e84d469d45e"

build fail log:
Fetcher failure for URL: 'git://git@github.com/Intel-BMC/crashdump;protocol=
=3Dssh;nobranch=3D1'. Unable to fetch URL from any source.

Sincerely,
Tim Lee
________________________________
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.

--_000_HK0PR03MB466005C24CC229FBD1EEB94FCF950HK0PR03MB4660apcp_
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
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
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
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We found that oem system log ty=
pe didn't show any log entries on &#8220;System logs&#8221; page in WebUI.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Even we had modify <b>bmcweb_%.=
bbappend</b> to enable these options as below:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">bmcweb_%.bbappend:<o:p></o:p=
></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"># Enable CPU Log and Raw PECI s=
upport<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">EXTRA_OECMAKE &#43;=3D &quot;-D=
BMCWEB_ENABLE_REDFISH_CPU_LOG=3DON&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">EXTRA_OECMAKE &#43;=3D &quot;-D=
BMCWEB_ENABLE_REDFISH_RAW_PECI=3DON&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">In <b>bmcweb/redfish-core/lib/l=
og_services.hpp</b>, we found that seems need to include
<span style=3D"color:#7030A0">com.intel.crashdump.service</span>.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Then the crashdump daemon will =
help to dump CPU Crashdump and registers over PECI.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thus, we include crashdump_git.=
bb recipe to build this daemon, but we got build fail due to fetch fail.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Could someone help us to check =
whether the SRC_URI of crashdump already move to the other source? Thanks.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">crashdump_git.bb:<o:p></o:p>=
</span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">SRC_URI =3D &quot;git://git@git=
hub.com/Intel-BMC/crashdump;protocol=3Dssh;nobranch=3D1&quot;<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">SRCREV =3D &quot;c99e4fb7727545=
501fe65b90a8a97e84d469d45e&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">build fail log:<o:p></o:p></=
span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Fetcher failure for URL: 'git:/=
/git@github.com/Intel-BMC/crashdump;protocol=3Dssh;nobranch=3D1'. Unable to=
 fetch URL from any source.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Sincerely,<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Tim Lee<o:p></o:p></span></p>
</div>
<hr align=3D"center" width=3D"100%">
<span style=3D"font-size:12pt;line-height:0.7;font-family: 'Arial'; color:#=
808080">The privileged confidential information contained in this email is =
intended for use only by the addressees as indicated by the original sender=
 of this email. If you are not the
 addressee indicated in this email or are not responsible for delivery of t=
he email to such a person, please kindly reply to the sender indicating thi=
s fact and delete all copies of it from your computer and network server im=
mediately. Your cooperation is highly
 appreciated. It is advised that any unauthorized use of confidential infor=
mation of Nuvoton is strictly prohibited; and any information in this email=
 irrelevant to the official business of Nuvoton shall be deemed as neither =
given nor endorsed by Nuvoton.
</span>
</body>
</html>

--_000_HK0PR03MB466005C24CC229FBD1EEB94FCF950HK0PR03MB4660apcp_--
