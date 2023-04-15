Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A366E30A1
	for <lists+openbmc@lfdr.de>; Sat, 15 Apr 2023 12:39:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pz8ts6V9Xz3fR6
	for <lists+openbmc@lfdr.de>; Sat, 15 Apr 2023 20:39:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=pliops.onmicrosoft.com header.i=@pliops.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-pliops-onmicrosoft-com header.b=euMN4jQJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pliops.com (client-ip=2a01:111:f400:7e1a::60e; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=liorw@pliops.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=pliops.onmicrosoft.com header.i=@pliops.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-pliops-onmicrosoft-com header.b=euMN4jQJ;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pz8tF5QBqz3c2j
	for <openbmc@lists.ozlabs.org>; Sat, 15 Apr 2023 20:38:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lS6pUNhcAnKc701f57pfB9fB8BHzHyQicF3MEPUMSrhNk3puGQAf6vEqUOuESg+aT9NHEYhYRMjWaBA9bqcF2bGE0ZAIGMNUB6KnR5X1QhWvIbR/OGoa34ri1gD4K1oWX8pWQLVSfP7AnLWD5lYlsOjI6CDdMAhzlTXvTYShQRwRSrgU++Y45Bw2P+mn1dSkxWcUPrjoVwWN3LqsNEvf/ZkC9TUEat2rvDHxtqjZC/imunXiE+vi6HshlTPE87/VzKHVq25LYAkHCUwTwoK9DF9aIeRzCXa+KmI7HvWRjcQkjMQYmmhRtdKFmZt7MgvW683jUpfXUisl8CJbCfAauA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4G5g7qvNfUJv9drHPAeNntvOpJTiosqbRebYJY0YW/E=;
 b=OMcHAuKFIShIJkem0EsoXN7sgeavtnZMdzIpvXc9eNkk+VFdcskxg2gF+vWVm/Mm7MslsquDcyqlCowj2r6gGXiUPgOZXdpq/XQ7Lrlc5WQ+n9xmg7k/s6OH/RlgXcjN4EYZinsRVl9nHmPiWBMFZGpDRlTI/8xZWimlYQeXFXOQ0pSx2yHSc8SuZnzkwhaMBxpBVeekBysI/EFKOvsZQU0xgTrFkWAPh5+SnGXB41lI85RyIpRd+KjkjedziHM9gjPQraQjnli7TpAsVL0Z7rp5XyRQIJOL6Y0SVmOsCeS6fces1tvNaBkHFJ5oIwCFmEjUapBRBqfnQXZwgtPaEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=pliops.com; dmarc=pass action=none header.from=pliops.com;
 dkim=pass header.d=pliops.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pliops.onmicrosoft.com; s=selector2-pliops-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4G5g7qvNfUJv9drHPAeNntvOpJTiosqbRebYJY0YW/E=;
 b=euMN4jQJtmcyEJT9fD/iDk3r/IpuMmLKArCI0utJiS+alyWCbE2IvwWK4JlnmIiGde5/6b3BqfP8Imw4GmFBIVWMLliPmIkBKRJG4IEbqK4fpn/4FUCkU2nBclAFmyRvAQ9tekOE0U17/DnD3PwV/g4d4RU3EDf5irJUY7IlJeg=
Received: from PR3P195MB0555.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:30::14)
 by DB9P195MB2084.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:3c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Sat, 15 Apr
 2023 10:38:04 +0000
Received: from PR3P195MB0555.EURP195.PROD.OUTLOOK.COM
 ([fe80::2376:d467:719a:c91c]) by PR3P195MB0555.EURP195.PROD.OUTLOOK.COM
 ([fe80::2376:d467:719a:c91c%9]) with mapi id 15.20.6277.036; Sat, 15 Apr 2023
 10:38:04 +0000
From: Lior Weintraub <liorw@pliops.com>
To: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, "ryan_chen@aspeedtech.com"
	<ryan_chen@aspeedtech.com>
Subject: OpenBMC porting to portwell pcomc660-ast2600 device.
Thread-Topic: OpenBMC porting to portwell pcomc660-ast2600 device.
Thread-Index: Adlvg6fi1hXH38M1TxmitTi5f2yoIA==
Date: Sat, 15 Apr 2023 10:38:04 +0000
Message-ID:  <PR3P195MB055571D5873D3A5F1425213BC39E9@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=pliops.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3P195MB0555:EE_|DB9P195MB2084:EE_
x-ms-office365-filtering-correlation-id: 5676e867-0be0-4e66-9ec0-08db3d9d7eb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  7Ig/u1RJCaVUpac6wvTDckYQzRwlFHEGtSKo1WqfyNG1NA2XaqaIXTHzjU6yCmnAhJWbupCugS/oXc2qCDVEIH6GjKqaXa38J51SuR3GRvdJ32wJTrjVwzfqFVPrxkItOPrDO6DNXcznzrfV08mmfhYbjAdJgjz//FlQkmHCQz8Ky/KSLr8ZKgKZUrkJL73G7l6ntpo+sCANWoNwCfvtInvuP2n35K0Y29EIhSKPbXqKG52kxwXLQfp6Ni9XjAmeZsRMrG9ZuJpohdwU0OBB0I+ANtkW2V4ZzFGAaYjyABdPcNxPBuWu4RwPG7kp8g/6TISFQNU1Cq+9EeZub/2MeiSPjIJX7Dbf53RIB7wW3vXdv4WkdxmROJRcJms15D6pKZ3+B8OaIMEk5NR3W5EuPRcERIKXgqaedaslaJf+J9WeT9uOusSelnSgVfYTuKfbBEAZIhIBUkEAcenH522GgKYEHV4Cs8HUbtrhh6CGrR8eDD7tToH624u+HiaVrOn30ww8jGvA+OudKXXstnD34YE+oZP4C9XbQzP4OdyLaHSM5MkkO1jLX4F8T9Mcmyfpky93nSVTw1ZiIUdf3wXytNaGr5umKL5PG9hNvxozMv8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3P195MB0555.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(136003)(39840400004)(366004)(451199021)(5660300002)(71200400001)(7696005)(966005)(66556008)(99936003)(16799955002)(66476007)(2906002)(66946007)(4326008)(76116006)(64756008)(66446008)(166002)(86362001)(38070700005)(122000001)(41300700001)(33656002)(478600001)(38100700002)(52536014)(316002)(8936002)(9326002)(8676002)(55016003)(9686003)(110136005)(6506007)(26005)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?kR9AFBk9bWBNRy1L5D4/17SR4UEERmdqj5zs+z9Jn3HRLFbkSYKMOgqtetKL?=
 =?us-ascii?Q?RBPyS2git+1n8QsNVNyqW+7hxokci48vDL6KO3kxkRr+6DJ7f2x2oR+zNuaa?=
 =?us-ascii?Q?QF2fC1oBrOpVB6BKKhfHl4RUglBAxBgy5WMrBn3Htkx7Dbj51O9WTBakbPz7?=
 =?us-ascii?Q?QEDqE3LkTKectOSzDeHk9ZDjpo2hf0nYsrjfZWLTBhcZEpgllMPjNuIBi4g4?=
 =?us-ascii?Q?X2atf8lJ8gFS96K4OF2vTbLprmYHrjFX0SVHDylemZVuUMQ8djhAxIMPmGGL?=
 =?us-ascii?Q?rbXnVrxaG9nYef4iA7iyRbvL78NUMsrDzoYTsX/ZO8HINtNzbSNVxJoHdys6?=
 =?us-ascii?Q?q3ya5HEFjkQI2HdMpV+7QGNB2CdlpqXuUTfbDPt0fJIGWUWMr5PZbR/hr+5Q?=
 =?us-ascii?Q?H/qLNP+68Lf2nynslh48RO9a8GlyGNZH1+qxJWkjMH6zlvy9H42iZd/vETvN?=
 =?us-ascii?Q?woJL8HskXe0aV4cYG7Ify/QxhmK5YsppNimZrcb5hQceZ0+i+Nv3u8dvBc5A?=
 =?us-ascii?Q?WJ5/NwAcvLaOzy2Xy6f3owb9ZNQN1qgupzzERTfjWcSPX0gGL1mVXOhbSbJp?=
 =?us-ascii?Q?oh1OrwaEI7MR4Qpa5Jdq6fSumhkqgOhwJ5e3djyttMRsNnShKlgml0BpKSbS?=
 =?us-ascii?Q?cXYmcLA9zsDV49hq2Z842S24WUyJQQ8AKLmLTrfzD1Pkq53T7gROdmRQ5FT6?=
 =?us-ascii?Q?Vzhdvqmii58QY27LZXbfEJb74Iow7Oi3rraOzzRiRMdNvB02nvX/ZsEMmZXx?=
 =?us-ascii?Q?3icNsrnado72zFF0l85e56GkS2E3PD7WhrBpkKDlxNVICZvVoBsdvyFEPmgn?=
 =?us-ascii?Q?UvvR3LcCLqyK5k8K1ubPpGWFGXvGs2FRzqMTyJDikqjGgfZEZ7l0W/oRbjor?=
 =?us-ascii?Q?r5FXvsiKI5qsCx7W6ASTSeJrg5PrbxLZedK+Jg1AixIKMGO52vyMfx8nX/9s?=
 =?us-ascii?Q?jwyXdTgKJ0mJk3l2TZqf88v6DVwWf496RIRPgMPWwwWU2YsA2oMNw4poXM90?=
 =?us-ascii?Q?9D8JuhbPoK7EN5RtcHuU4dNARcrDT8VtUOF0ypu+jQ81qk2OUDHpPXfw/tTW?=
 =?us-ascii?Q?jYo0N2Oq/5+nKUks7nt936EyEikK7h0nU4V6+ORhW/seceC8vivc1EnKu3D8?=
 =?us-ascii?Q?Z/XnlgYDJRTDjkjFgiE07bQR2hUwgqauTmEtq2gF3SvoI9zX1jp51y4xwd0O?=
 =?us-ascii?Q?mUD4RFfs4BZ7HlQH69Ng9kqN+xUMk3cwCNDT8Y5W+Um53zyJBVDGTPqfVbsE?=
 =?us-ascii?Q?wbpB1/0Q1sZV+JzsqEmVoo9DKqepId/wlakefHabgtzkYHAV6bXqTMvIWolL?=
 =?us-ascii?Q?W2vhWfds8HnYkMSKVCBQ+atMN5XzNBD+nX8kz0EqR3SOEBwmUodwAzuKXahS?=
 =?us-ascii?Q?iMDbY9iKcr05QthYvSq6xkIR+4QBdeV9hVLHIR2KVCZkHSs88qtaRFcU258c?=
 =?us-ascii?Q?4qdqdlOjUr/QwICgX7fUbQvbFi7c59gDNC/eQkAOxweMBxKi1IeTys1o7luV?=
 =?us-ascii?Q?6uU4Bb8HkHhCIUh+4doRLU9x9s+/HPdEbPzHS2b34LezHwEIBldMa9guB2b/?=
 =?us-ascii?Q?LtZjAV4Do8SFmLI32Do=3D?=
Content-Type: multipart/related;
	boundary="_006_PR3P195MB055571D5873D3A5F1425213BC39E9PR3P195MB0555EURP_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: pliops.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3P195MB0555.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5676e867-0be0-4e66-9ec0-08db3d9d7eb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2023 10:38:04.7628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 40fe8f47-55ac-403a-a5ab-1be3dd209cf8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FVR2KN5k0g8ApRQqNHIqNGwAwBnoYnSuKPy8rTXXlQn/BtMyjV/hkrGdwjnAsIf2It0gNHkXmGN/HBP4X6LpWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB2084
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_006_PR3P195MB055571D5873D3A5F1425213BC39E9PR3P195MB0555EURP_
Content-Type: multipart/alternative;
	boundary="_000_PR3P195MB055571D5873D3A5F1425213BC39E9PR3P195MB0555EURP_"

--_000_PR3P195MB055571D5873D3A5F1425213BC39E9PR3P195MB0555EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Guys,

I have forked the openbmc project and opened a "portwell" branch from it's =
"master".
The repo is under: https://github.com/wlbe4/openbmc
I am trying to port OpenBMC into this board: https://portwell.com/solutions=
/openBMC.php

My first commit to this branch was the original code of meta-portwell layer=
 given to me by Portwell support (PCOM-C660-AST2600_BSP_20211210).
The second commit tries to migrate meta-portwell layer to the latest Yocto =
syntax.

Changes include (among others):
1. replace _append with :append
2. replace _prepend with :prepend
3. move bblayers.conf.sample, conf-notes.txt and local.conf.sample into tem=
plates/default folder.
4. Try to fix build errors on u-boot and aspeed-linux - Still there are err=
ors
5. Try to fix obmc-console - The build errors are gone but not sure it will=
 work (no platform for testing yet)

Some of the changes were just a syntax change but some requires deeper unde=
rstanding.
Few examples are the changes in obmc-concole, u-boot and aspeed-linux.
Since the original version is based on older u-boot and linux kernel, the p=
atches might not be relevant anymore.

Can you please review the following changes on my repo:
meta-portwell/meta-pcomc660-ast2600/recipes-phosphor/console/obmc-console_%=
.bbappend
meta-portwell/meta-pcomc660-ast2600/classes/socsec-sign.bbclass
meta-portwell/meta-pcomc660-ast2600/conf/machine/pcomc660-ast2600.conf
meta-portwell/meta-pcomc660-ast2600/recipes-bsp/u-boot/u-boot-aspeed-sdk_20=
19.04.bbappend
meta-portwell/meta-pcomc660-ast2600/recipes-kernel/linux/linux-aspeed_git.b=
b

Your help with this migration is highly appreciated.
If you find the time to clone and fix the error fell free to push your chan=
ges to my repo.
I am also trying to get portwell to support me.

Thanks,
Lior.

[A screenshot of a computer  Description automatically generated with low c=
onfidence]<http://www.pliops.com/>
             [9k=3D] <https://www.linkedin.com/company/pliops>     [OiKNDo6=
9Yy8AAAAASUVORK5CYII=3D] <https://twitter.com/PliopsLtd>
Lior Weintraub | Senior SW Engineer
(+972) 54-5997-903
liorw@pliops.com<mailto:liorw@pliops.com>
Pliops | 2 Jabotinsky st, Ramat Gan
www.pliops.com<http://www.pliops.com>



--_000_PR3P195MB055571D5873D3A5F1425213BC39E9PR3P195MB0555EURP_
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
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Work Sans";}
@font-face
	{font-family:"Work Sans SemiBold";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	text-align:right;
	direction:rtl;
	unicode-bidi:embed;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
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
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">Hi Guys,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">I have forked the openbmc project and opened a &quot;portwell&quot; =
branch from it's &quot;master&quot;.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">The repo is under:
<a href=3D"https://github.com/wlbe4/openbmc">https://github.com/wlbe4/openb=
mc</a><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">I am trying to port OpenBMC into this board:
<a href=3D"https://portwell.com/solutions/openBMC.php">https://portwell.com=
/solutions/openBMC.php</a><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">My first commit to this branch was the original code of meta-portwel=
l layer given to me by Portwell support (PCOM-C660-AST2600_BSP_20211210).<o=
:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">The second commit tries to migrate meta-portwell layer to the latest=
 Yocto syntax.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed"><b><u>Changes include (among others):<o:p></o:p></u></b></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">1. replace _append with :append<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">2. replace _prepend with :prepend<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">3. move bblayers.conf.sample, conf-notes.txt and local.conf.sample i=
nto templates/default folder.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">4. Try to fix build errors on u-boot and aspeed-linux - Still there =
are errors<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">5. Try to fix obmc-console - The build errors are gone but not sure =
it will work (no platform for testing yet)<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">Some of the changes were just a syntax change but some requires deep=
er understanding.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">Few examples are the changes in obmc-concole, u-boot and aspeed-linu=
x.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">Since the original version is based on older u-boot and linux kernel=
, the patches might not be relevant anymore.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed"><b><u>Can you please review the following changes on my repo:<o:p></=
o:p></u></b></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">meta-portwell/meta-pcomc660-ast2600/recipes-phosphor/console/obmc-co=
nsole_%.bbappend<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">meta-portwell/meta-pcomc660-ast2600/classes/socsec-sign.bbclass<o:p>=
</o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">meta-portwell/meta-pcomc660-ast2600/conf/machine/pcomc660-ast2600.co=
nf<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">meta-portwell/meta-pcomc660-ast2600/recipes-bsp/u-boot/u-boot-aspeed=
-sdk_2019.04.bbappend<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">meta-portwell/meta-pcomc660-ast2600/recipes-kernel/linux/linux-aspee=
d_git.bb<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">Your help with this migration is highly appreciated.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">If you find the time to clone and fix the error fell free to push yo=
ur changes to my repo.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">I am also trying to get portwell to support me.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed">Lior.
<o:p></o:p></p>
<p class=3D"MsoNormal" dir=3D"RTL"><span dir=3D"LTR"><o:p>&nbsp;</o:p></spa=
n></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"517" style=3D"width:387.5pt;border-collapse:collapse">
<tbody>
<tr style=3D"height:32.55pt">
<td width=3D"83" valign=3D"top" style=3D"width:62.5pt;border-top:solid whit=
e 1.0pt;border-left:solid white 1.0pt;border-bottom:none;border-right:solid=
 black 1.0pt;padding:0cm 5.4pt 0cm 5.4pt;height:32.55pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:6.0pt;text-align:left;line-he=
ight:105%;direction:ltr;unicode-bidi:embed">
<a href=3D"http://www.pliops.com/"><span style=3D"font-size:7.0pt;line-heig=
ht:105%;color:windowtext;text-decoration:none"><img border=3D"0" width=3D"7=
9" height=3D"66" style=3D"width:.825in;height:.6916in" id=3D"_x0000_i1027" =
src=3D"cid:image001.png@01D96F9D.37DCDBF0" alt=3D"A screenshot of a compute=
r=0A=
=0A=
Description automatically generated with low confidence"></span></a><span s=
tyle=3D"font-size:7.0pt;line-height:105%;mso-ligatures:none"><o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right;line-heigh=
t:105%;direction:ltr;unicode-bidi:embed">
<span style=3D"font-size:7.0pt;line-height:105%;mso-ligatures:none">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</sp=
an><a href=3D"https://www.linkedin.com/company/pliops"><span style=3D"font-=
size:7.0pt;line-height:105%;font-family:&quot;Work Sans&quot;;color:windowt=
ext;text-decoration:none"><img border=3D"0" width=3D"16" height=3D"16" styl=
e=3D"width:.1666in;height:.1666in" id=3D"Picture_x0020_2" src=3D"cid:image0=
02.jpg@01D96F9D.37DCDBF0" alt=3D"9k=3D"></span></a><span style=3D"font-size=
:7.0pt;line-height:105%;mso-ligatures:none">&nbsp;&nbsp;&nbsp;&nbsp;</span>=
<a href=3D"https://twitter.com/PliopsLtd"><b><span style=3D"font-size:7.0pt=
;line-height:105%;font-family:&quot;Work Sans SemiBold&quot;;color:#812ADE;=
text-decoration:none"><img border=3D"0" width=3D"15" height=3D"15" style=3D=
"width:.1583in;height:.1583in" id=3D"Picture_x0020_3" src=3D"cid:image003.p=
ng@01D96F9D.37DCDBF0" alt=3D"OiKNDo69Yy8AAAAASUVORK5CYII=3D"></span></b></a=
><span style=3D"font-size:7.0pt;line-height:105%;mso-ligatures:none">&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p></o:p></span></p>
</td>
<td width=3D"433" valign=3D"top" style=3D"width:325.0pt;border-top:solid wh=
ite 1.0pt;border-left:none;border-bottom:none;border-right:solid white 1.0p=
t;padding:0cm 5.4pt 0cm 5.4pt;height:32.55pt">
<p class=3D"MsoNormal" style=3D"margin-top:6.0pt;text-align:left;line-heigh=
t:105%;direction:ltr;unicode-bidi:embed">
<b><span style=3D"font-size:7.0pt;line-height:105%;font-family:&quot;Work S=
ans SemiBold&quot;;mso-ligatures:none">Lior Weintraub&nbsp;|&nbsp;<span sty=
le=3D"color:#A748E5">Senior SW Engineer
</span><span style=3D"color:#812ADE"><o:p></o:p></span></span></b></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:3.0pt;margin-right:0cm;m=
argin-bottom:12.0pt;margin-left:0cm;text-align:left;line-height:105%;direct=
ion:ltr;unicode-bidi:embed">
<b><span style=3D"font-size:7.0pt;line-height:105%;font-family:&quot;Work S=
ans SemiBold&quot;;mso-ligatures:none">(+972) 54-5997-903</span></b><b><spa=
n style=3D"font-size:7.0pt;line-height:105%;font-family:&quot;Work Sans&quo=
t;;mso-ligatures:none"><o:p></o:p></span></b></p>
<p class=3D"MsoNormal" style=3D"margin-top:3.0pt;text-align:left;line-heigh=
t:105%;direction:ltr;unicode-bidi:embed">
<span style=3D"font-size:7.0pt;line-height:105%;font-family:&quot;Work Sans=
&quot;;mso-ligatures:none"><a href=3D"mailto:liorw@pliops.com"><span style=
=3D"color:#0563C1">liorw@pliops.com</span></a>
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-top:3.0pt;text-align:left;line-heigh=
t:105%;direction:ltr;unicode-bidi:embed">
<span style=3D"font-size:7.0pt;line-height:105%;font-family:&quot;Work Sans=
&quot;;mso-ligatures:none">Pliops&nbsp;|&nbsp;2 Jabotinsky st, Ramat Gan&nb=
sp;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-top:3.0pt;text-align:left;line-heigh=
t:105%;direction:ltr;unicode-bidi:embed">
<b><span style=3D"font-size:7.0pt;line-height:105%;font-family:&quot;Work S=
ans SemiBold&quot;;mso-ligatures:none"><a href=3D"http://www.pliops.com"><s=
pan style=3D"color:#0563C1">www.pliops.com</span></a><span style=3D"color:#=
812ADE"><o:p></o:p></span></span></b></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal" style=3D"text-align:left;direction:ltr;unicode-bidi:=
embed"><span style=3D"mso-ligatures:none"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" dir=3D"RTL"><span dir=3D"LTR"><o:p>&nbsp;</o:p></spa=
n></p>
</div>
</body>
</html>

--_000_PR3P195MB055571D5873D3A5F1425213BC39E9PR3P195MB0555EURP_--

--_006_PR3P195MB055571D5873D3A5F1425213BC39E9PR3P195MB0555EURP_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=12045;
	creation-date="Sat, 15 Apr 2023 10:38:04 GMT";
	modification-date="Sat, 15 Apr 2023 10:38:04 GMT"
Content-ID: <image001.png@01D96F9D.37DCDBF0>
Content-Transfer-Encoding: base64

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
MDjNdUADAAAAAElFTkSuQmCC

--_006_PR3P195MB055571D5873D3A5F1425213BC39E9PR3P195MB0555EURP_
Content-Type: image/jpeg; name="image002.jpg"
Content-Description: image002.jpg
Content-Disposition: inline; filename="image002.jpg"; size=3129;
	creation-date="Sat, 15 Apr 2023 10:38:04 GMT";
	modification-date="Sat, 15 Apr 2023 10:38:04 GMT"
Content-ID: <image002.jpg@01D96F9D.37DCDBF0>
Content-Transfer-Encoding: base64

/9j/4AAQSkZJRgABAQAA3ADcAAD/4QCARXhpZgAATU0AKgAAAAgABAEaAAUAAAABAAAAPgEbAAUA
AAABAAAARgEoAAMAAAABAAIAAIdpAAQAAAABAAAATgAAAAAAAADcAAAAAQAAANwAAAABAAOgAQAD
AAAAAQABAACgAgAEAAAAAQAAAEKgAwAEAAAAAQAAAEIAAAAA/+0AOFBob3Rvc2hvcCAzLjAAOEJJ
TQQEAAAAAAAAOEJJTQQlAAAAAAAQ1B2M2Y8AsgTpgAmY7PhCfv/AABEIAEIAQgMBIgACEQEDEQH/
xAAfAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgv/xAC1EAACAQMDAgQDBQUEBAAAAX0BAgMA
BBEFEiExQQYTUWEHInEUMoGRoQgjQrHBFVLR8CQzYnKCCQoWFxgZGiUmJygpKjQ1Njc4OTpDREVG
R0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0
tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4eLj5OXm5+jp6vHy8/T19vf4+fr/xAAfAQADAQEBAQEB
AQEBAAAAAAAAAQIDBAUGBwgJCgv/xAC1EQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2Fx
EyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZ
WmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TF
xsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2wBDAAEBAQEBAQIBAQICAgICAgMCAgIC
AwQDAwMDAwQFBAQEBAQEBQUFBQUFBQUGBgYGBgYHBwcHBwgICAgICAgICAj/2wBDAQEBAQICAgMC
AgMIBQUFCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAj/
3QAEAAX/2gAMAwEAAhEDEQA/AP788k9Tx3rkvE3j3wV4KRZvGGr6XpKSHbG+p3cVqrH/AGTKyg/h
S+PPE8XgrwPrHjGWNpU0nSrvU3jU4Li1haUr+IXFfjX+xr+xn8NP2vvhpaftiftj2n/Cd+J/HQl1
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

--_006_PR3P195MB055571D5873D3A5F1425213BC39E9PR3P195MB0555EURP_
Content-Type: image/png; name="image003.png"
Content-Description: image003.png
Content-Disposition: inline; filename="image003.png"; size=3313;
	creation-date="Sat, 15 Apr 2023 10:38:04 GMT";
	modification-date="Sat, 15 Apr 2023 10:38:04 GMT"
Content-ID: <image003.png@01D96F9D.37DCDBF0>
Content-Transfer-Encoding: base64

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
RU5ErkJggg==

--_006_PR3P195MB055571D5873D3A5F1425213BC39E9PR3P195MB0555EURP_--
