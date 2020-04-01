Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B7319A666
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 09:40:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sdR95cwlzDr1d
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 18:40:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=apc01-hk2-obe.outbound.protection.outlook.com
 (client-ip=40.107.130.81; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=kfting@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-nuvoton-onmicrosoft-com header.b=kCjRXNLR; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300081.outbound.protection.outlook.com [40.107.130.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sdQH180WzDqT5
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 18:40:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+T9kJTMXWYv9V12wNUilQ5NG8sy/wAsO6094xzwFf5DZCQk5+ODamkpuzmOVmId2gcHpTTUUcSzmVDSWnFYfPs0V1CGA9Az8Hqzgsc2hNcnyCwTE7JfMLNLRULm4vFf5gYabCGgk9CQqyIbb8JRVKwjb7OaBJsaeGqCrJViWEwQVFwuldDSgiZJgUmxHtKmtDxma6/LTCSVpsdyp6CvP2eCmqyHnYcFtNt3BMqSGcslStQ1RDbOMBAE7WFjXkc1wQG9VwWpzBImxGzTjb3qz6C9whhUICU7+OvDjEJRemEarBs2i7FbkCeH9ayOVTmy2kp1V0h2uSzJP6hVV2S2Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFu3tZxx8tUsgSQkzJctifK4uF/SOpIe5v33Zm9YOYk=;
 b=HGfZNwxJtS38kIwdvnfwEHPQntwwUilrAumcEaIJp2Hm1G2V0NwV6rXJeO4kR5dpH4xcGxLHDlcKWDoP89oIWd0Tl7FXSooIyjMgvENkEF7krwjT6SxX4bfExzb5t8oDwaArZFSFEAd+KOKbPEDWhNqnNp/yMDxi3jm4z/vMPqzCBurf7yIyTW6F2pTRMmJHy/jgEO86TkIONHup5ZpO1l7/ZtG0fgw+CMjG+a970Nklhq+e80vyfRrvqA2SrZuaPnEzU13ayH6x6fWb1ODcPjqYkx2KSuJKdzOeCefnnO8gGv86+42nybRtr0T7gXOYmL55rsa7mKDPZTHwar2gHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FFu3tZxx8tUsgSQkzJctifK4uF/SOpIe5v33Zm9YOYk=;
 b=kCjRXNLR1wnfFsNzxZyPqwfkJCi8RJH5RdprbJkM15+ynxpz/otRnF2gi81Usdopygs1IfjEh0jWocqmIw7vqSUKUNhURde1H3OjH31cDtGpIPeXu1qtnkUOZpVzmPP90DBiFI8pMZ3q20KM2110fGQYAlgs6c74KvIZ+KtJE6E=
Received: from HK0PR03MB4897.apcprd03.prod.outlook.com (52.132.238.150) by
 HK0PR03MB3666.apcprd03.prod.outlook.com (20.177.31.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.12; Wed, 1 Apr 2020 07:40:00 +0000
Received: from HK0PR03MB4897.apcprd03.prod.outlook.com
 ([fe80::f1a6:a3e9:a65a:abd5]) by HK0PR03MB4897.apcprd03.prod.outlook.com
 ([fe80::f1a6:a3e9:a65a:abd5%6]) with mapi id 15.20.2878.014; Wed, 1 Apr 2020
 07:40:00 +0000
From: CS20 KFTing <KFTING@nuvoton.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "a.amelkin@yadro.com" <a.amelkin@yadro.com>
Subject: Re: Authorization of LDAP users in bmcweb
Thread-Topic: Re: Authorization of LDAP users in bmcweb
Thread-Index: AdYH9qjNBmoUhhWmTn2CabCTMqFJkg==
Date: Wed, 1 Apr 2020 07:40:00 +0000
Message-ID: <HK0PR03MB4897F2703C45135D276DFFDFDBC90@HK0PR03MB4897.apcprd03.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=KFTING@nuvoton.com; 
x-originating-ip: [60.250.207.217]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97a59159-e3c6-43be-22d9-08d7d60fe24b
x-ms-traffictypediagnostic: HK0PR03MB3666:|HK0PR03MB3666:
x-microsoft-antispam-prvs: <HK0PR03MB36664D4760882E7BE8D26577DBC90@HK0PR03MB3666.apcprd03.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR03MB4897.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(39850400004)(136003)(346002)(376002)(396003)(366004)(26005)(478600001)(8676002)(66556008)(52536014)(66946007)(66476007)(9686003)(7696005)(316002)(6506007)(33656002)(2906002)(5660300002)(64756008)(55016002)(81166006)(110136005)(966005)(81156014)(71200400001)(66446008)(8936002)(86362001)(76116006)(186003);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: nuvoton.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 99mAhuZF3nDoWU0ZGe+VWZedbHb73kXqC8fRWQg6Gqr62n0qVFGfXMNZVV6bSpYhwOSkzIB23njSUz8+DA8l3XD1AYVp/fIQgfo3BfvynWYE5He0idrWICOkHQ463qKcMucU4mf0dUCZLwygMh3zlzlct77aEQaI8IDeoRxkhmn+G7e40qb/vKc4bh2ct13ihmCTcvMOcnd5l2O3/O+BoCjxyR1XrRZ0pIwMgu/R0S1ZgHgx2eadpsNDPBzn2VU8CoaiEZLlv8PGTMQWQm5GWqGlGP6Vch7XZ0+GecqISYzc/VJpFuaQtwkWPiF4xfJHV+ZXeyRUMAFvVvz0OQmaZ8oju762xFWrzmJny9KXRDZvNmkRGs92PEBjtya4Ras/GENQ6gYFhscWpZWTBbdhZWhhayzx0cYARsEOu3VnnlmoC7JPqnD2hWPoPJqXZ4HxzlMMzs1IiLmcpaoopgxzrLSEGXiKslHxbVbLZ1VZKQ2waI1UUZIR3P1QRtz1fBfqONo/ymnBcs15R383rkhZjw==
x-ms-exchange-antispam-messagedata: /nX0QI651EVoA5chPK5ag8XDnA+Z9LQ1NffZztJZdc11EOp1PehC4fp0l9xpn5y3rwhuwKpwmuK70BFy+/h2Jgr9TFjni5CcchS3I4RAMxbefz1kTo3rCiJGepruUuOkHxykbRv41ayvMkhfzliKRg==
Content-Type: multipart/alternative;
 boundary="_000_HK0PR03MB4897F2703C45135D276DFFDFDBC90HK0PR03MB4897apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a59159-e3c6-43be-22d9-08d7d60fe24b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 07:40:00.4243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y08chhChm7Yah02trIi2vvJm12aFi7xnhsaPHCz5yXSji58FxspO8JhiN8K3iK2o0FR9ZWtegJ8fQdrXY8Qxeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB3666
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

--_000_HK0PR03MB4897F2703C45135D276DFFDFDBC90HK0PR03MB4897apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex:

Please help try the patch from https://github.com/Nuvoton-Israel/openbmc/bl=
ob/runbmc/meta-quanta/meta-olympus-nuvoton/recipes-extended/pam/libpam/pam_=
succeed_if_support_ldap_user_login.patch to libpam and see how it goes.

Besides the patch, the user from the ldap server needs to be in the "redfis=
h" group in the ldap server database and it's already done according to you=
r description.

The requirement "user in group redfish" is controlled by the pam_succeed_if=
 module when a user tries to login via WebUI and the original implementatio=
n in pam_succeed_if module has some limitation on group identification.

Any update is welcome.

Thank you.

Regards,
Tyrone

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

--_000_HK0PR03MB4897F2703C45135D276DFFDFDBC90HK0PR03MB4897apcp_
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
	{mso-style-type:export-only;
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
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Alex:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Please help try the patch from =
<a href=3D"https://github.com/Nuvoton-Israel/openbmc/blob/runbmc/meta-quant=
a/meta-olympus-nuvoton/recipes-extended/pam/libpam/pam_succeed_if_support_l=
dap_user_login.patch">
https://github.com/Nuvoton-Israel/openbmc/blob/runbmc/meta-quanta/meta-olym=
pus-nuvoton/recipes-extended/pam/libpam/pam_succeed_if_support_ldap_user_lo=
gin.patch</a> to libpam and see how it goes.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Besides the patch, the user fro=
m the ldap server needs to be in the &#8220;redfish&#8221; group in the lda=
p server database and it&#8217;s already done according to your description=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The requirement &quot;user in g=
roup redfish&quot; is controlled by the pam_succeed_if module when a user t=
ries to login via WebUI and the original implementation in pam_succeed_if m=
odule has some limitation on group identification.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Any update is welcome.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Tyrone<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
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

--_000_HK0PR03MB4897F2703C45135D276DFFDFDBC90HK0PR03MB4897apcp_--
