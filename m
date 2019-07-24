Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCC772B42
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 11:18:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tqWd49XjzDqKZ
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 19:18:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=hyvedesignsolutions.com (client-ip=24.159.132.13;
 helo=smtp4.synnex.com; envelope-from=bradc@hyvedesignsolutions.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=hyvedesignsolutions.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=synnexcorp.onmicrosoft.com
 header.i=@synnexcorp.onmicrosoft.com header.b="fUKsqIo2"; 
 dkim-atps=neutral
X-Greylist: delayed 903 seconds by postgrey-1.36 at bilbo;
 Wed, 24 Jul 2019 19:17:33 AEST
Received: from smtp4.synnex.com (smtp4.synnex.com [24.159.132.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tqW159QSzDqDK
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 19:17:32 +1000 (AEST)
Received: from GSC-EXCH5.synnex.org ([10.84.32.33])
 by smtp4.synnex.com  with ESMTP id x6O92OBe022461-x6O92OBg022461
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=CAFAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 24 Jul 2019 05:02:24 -0400
Received: from GSC-EXCH6.synnex.org (10.84.32.34) by gsc-exch5.synnex.org
 (10.84.32.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 24 Jul
 2019 05:02:23 -0400
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (104.47.40.55) by
 gsc-exch6.synnex.org (10.84.32.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 24 Jul 2019 05:02:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqN1zm/wyTksINOcT+xH319hFV+SYDvwVs25TtwSuTznfL8jDc5KUgIB+HuBfmXH7xovvx5NHGE8J65OYjreeRGnPPLMafA/BuWuICUIm9Gz+KKh+3ilGB31o0Zoe+7czMiKNJimfBWsiXS2XB3zaAcOaLfnBBwLQZ/rUOnhJiQHweKwMO8a2xaWJ4XJrKBhnnbmr1su+xUV2ePFB8XUd12CJTgWar7HISwWE+sn699cBrfw1Ag4DV6c67CQp4ghoC6Rwt2zTVdNNwtwv7/NIS/qyM3XKoFiF0a3FAVSkTujx8SH8Tqg4y5MxxOUZFJ6fc6ieRXWVw7Yeg6X7BLURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhrEef1mNFYzOSHVQsAPqpjfQ15nirUfhdBPKgROaZc=;
 b=FTXSKaio4hapsT1mnIBrVxFfEuXdtqtIpvWSJBRqt/akYPw/OF1+EKzVKV63QBJFaFe2ItO3EffvyB1EVUv/swva/uQdQBRo+98ggwQJLXW1Wu/ws3dxSalimEqfHVGQ53awHbBnUwH4x+ytrXnag5uhasa35XBUMhZhDUSNyXfURRYsZ65vjsZvU+l4ylbRiO5VZqP1d9yIFX1qs9zM356gAJhuf5gDs0TVG87TBIp3qlIzABZtiYTIn8f5LeMNym76XUsvDPleWW3QwR0lMCaGQm9cIx2z7RS5OGMtMhuxymesEopv1RRdom575K2vPg04bnzDRLzh7V7+r2SLPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=hyvedesignsolutions.com;dmarc=pass action=none
 header.from=hyvedesignsolutions.com;dkim=pass
 header.d=hyvedesignsolutions.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synnexcorp.onmicrosoft.com; s=selector2-synnexcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhrEef1mNFYzOSHVQsAPqpjfQ15nirUfhdBPKgROaZc=;
 b=fUKsqIo2CHq5OUDIJHM6ilLlfgqdmK6tasRDJ/DJj2jqZ7WgVTRaCDMn+QpXjEFeSp4HD1GySTeJk9ZiQ0QdEXZ64vr1kL3OJT47qz0svfgxrifnGSGf5DSH4We4fFMa/0DiorZLRmpGMOXiQlVC/vL0rO2c050CXi99CjQesjg=
Received: from CH2PR04MB6933.namprd04.prod.outlook.com (20.180.14.75) by
 CH2PR04MB6885.namprd04.prod.outlook.com (20.180.13.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 24 Jul 2019 09:02:22 +0000
Received: from CH2PR04MB6933.namprd04.prod.outlook.com
 ([fe80::3c4f:3a1b:7c38:1b82]) by CH2PR04MB6933.namprd04.prod.outlook.com
 ([fe80::3c4f:3a1b:7c38:1b82%3]) with mapi id 15.20.2094.017; Wed, 24 Jul 2019
 09:02:21 +0000
From: Brad Chou <bradc@hyvedesignsolutions.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: Is there any documents about configurations/YAML files
Thread-Topic: Is there any documents about configurations/YAML files
Thread-Index: AdVB+7wviD+6ioqkQdW3pnMIqhrjqg==
Date: Wed, 24 Jul 2019 09:02:21 +0000
Message-ID: <CH2PR04MB6933DAF6642B253AA3527F6FB9C60@CH2PR04MB6933.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=bradc@hyvedesignsolutions.com; 
x-originating-ip: [61.222.103.61]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dccd9c8f-846d-4c10-1f24-08d71015a381
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CH2PR04MB6885; 
x-ms-traffictypediagnostic: CH2PR04MB6885:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <CH2PR04MB6885B06F897102AAF0B0EB08B9C60@CH2PR04MB6885.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(189003)(199004)(53754006)(86362001)(790700001)(81156014)(81166006)(53936002)(316002)(6436002)(7696005)(9686003)(3846002)(6306002)(25786009)(54896002)(55016002)(7736002)(99286004)(478600001)(14454004)(4744005)(8676002)(6116002)(6916009)(33656002)(66476007)(26005)(76116006)(74316002)(52536014)(66946007)(66446008)(256004)(8936002)(186003)(476003)(102836004)(5660300002)(66556008)(486006)(68736007)(9326002)(6506007)(71190400001)(71200400001)(2906002)(66066001)(64756008)(21314003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR04MB6885;
 H:CH2PR04MB6933.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: hyvedesignsolutions.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OujFAYbF5nDFpsj+nb9rLWSzj8MK+4gxrVIAwRTIyFQUeqZ9WYTdANsGZmtthPZx6LMhCVCXNZpipUEz+Eas3SUuvfUlkhNben4+g9daWgHkRmBFehAXn8UTciM+weWrYInr9kZh9WWqT421d57P0mtJvSc+RXOLdBMrPPd6tlJhMGSZHobXSbe7KQLeVHv4FOZITdYY8aE4JtOKjgjBKim8wSMR8HQOhsnOaAiOcDnZLnI7GjHvS7aT0a6y0WmAhTetpMkZty0gMd2GmADbXGiIP/k/BEuK+pz3AuISU+ZqaYtNXFSMR24bEESHpIaUEz2CdRbkCMvhGFoXEeyQI0DObWqELfhLeeNjUri74hqaJv5iz8mg1dftdyUgNvCrUpCmqHqNly9hcvvjeJB/H+kjaZny3evRM99ijTLzW2Y=
Content-Type: multipart/alternative;
 boundary="_000_CH2PR04MB6933DAF6642B253AA3527F6FB9C60CH2PR04MB6933namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dccd9c8f-846d-4c10-1f24-08d71015a381
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 09:02:21.8770 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 972a0e27-c355-4fd7-9225-9266c8f332ac
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bradc@synnex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6885
X-OriginatorOrg: hyvedesignsolutions.com
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

--_000_CH2PR04MB6933DAF6642B253AA3527F6FB9C60CH2PR04MB6933namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,
I see there is a /recipes-phosphor/configuration/ folder contained many xxx=
-ipmi-xxx YAML files.
I tried to read it but still have no clear idea about how each YAML is for =
what feature.
Also each YAML seems to have its own syntax, but have no documents or comme=
nts to describe how to use it.
This can be a problem when somebody tries to add a new configuration on ano=
ther machine.
Can anyone who has familiar with those YAML files can provide some simple g=
uide/documents to let me getting  started ?
Many appreciated.

Thanks.

--_000_CH2PR04MB6933DAF6642B253AA3527F6FB9C60CH2PR04MB6933namp_
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
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
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
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal">I see there is a /recipes-phosphor/configuration/ fo=
lder contained many xxx-ipmi-xxx YAML files.<o:p></o:p></p>
<p class=3D"MsoNormal">I tried to read it but still have no clear idea abou=
t how each YAML is for what feature.<o:p></o:p></p>
<p class=3D"MsoNormal">Also each YAML seems to have its own syntax, but hav=
e no documents or comments to describe how to use it.<o:p></o:p></p>
<p class=3D"MsoNormal">This can be a problem when somebody tries to add a n=
ew configuration on another machine.<o:p></o:p></p>
<p class=3D"MsoNormal">Can anyone who has familiar with those YAML files ca=
n provide some simple guide/documents to let me getting&nbsp; started ?<o:p=
></o:p></p>
<p class=3D"MsoNormal">Many appreciated.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
</div>
</body>
</html>

--_000_CH2PR04MB6933DAF6642B253AA3527F6FB9C60CH2PR04MB6933namp_--
