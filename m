Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E36CA577E55
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 11:07:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmbhW62N3z3c4q
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 19:07:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=q80qYHEd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.243.55; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=tmizrahi@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=q80qYHEd;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LW9jl2d7jz2yyQ
	for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2022 22:52:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8d2rOOZTpGXXYfk1Vu2x0dme6kNzp6BdTFfS4m+pxv7iLrMXZP3Tk0XDDNRxv7sAUv8stVU09GC4dVZdII+SIej0nmuUnQaPohI/fxhcPnCBEYU/RIqxl5qcW+S6QB9gBGXrHlMB2skU+y4TqOucwwoMkm+EC4Ft3g4yVDMmBrdM3vtrH1c/yVU4J+HZQCPhz5m0kX+FYpoQqy+adxNf5BrAw9mzDW/YEdQSVXjKl75CzE42YZEpdt0JeXTQBhROl/gPERsyhy7OOH34Gch4FUOARCalkVkjNz8Cc8h5VXtGHqt5EoMbyRbKF/SDNQ4LsouQ8oaE77xYRXMmZxspw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80kVYqWldjjmPK4Vl5uivh2/ZvD7xTOahKZ3VLaAeEE=;
 b=LWOayoIDXcaE3A01ub7bPhNdsxV4wWGrlnvVxNY+WtUxpV2NfkpjlbnCyIzAwQJ32TobSwbR76sUS+/i9+/wjBiAwOcGFeYx8K0z6y3k9jFbTqmPLMtEZGJrna+J5wdWDVww9YgrJ5ZH8eLAevRgYZiC8fKXnvhIbE0n0MFLYXrwEh/tIp0PznFKsIwySzHHH38C8NH/7lOFpzHfTM+NeimZVyKR28Mr2eQNJST6Q3OS1OpUSFRXgeDGtNqxNrmvyLsaUGou4v7obI+GagbKw3hMbvqw58YU/j9JNhA1W65UtQ4cQHZJCc3sqO29K7Dzvm1FpXawZQUsAoAE1k83TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80kVYqWldjjmPK4Vl5uivh2/ZvD7xTOahKZ3VLaAeEE=;
 b=q80qYHEdARW2PTfnxUNmYmbA8bl2eRSHYBXcOgAL8uGTY+o6wwzcwvnzqrrhZ70pwy1cKS5NjLFwNM4JSp+dMGD57FuEtr9xXIgUbLbMYV/tN8jHQMNmEgwrtD6naYaN8zSqWuG3L9wBAkmRRzSM3Kyz9nChTt7fFaDWUjI+sfIUIJ172bgafFKs2+teGdKKbShlbLgmiZugaHgIesMer2ED9Lg14togXZmR83F8bWC0FfPiRAJp8NM9lHNEX61TAJKA3wUS92akdE7oe9Y8Q36AYO7/iUmphKnixiqkyUdIhWfOhU2M4qg7zaWVOrBYyhLRINCXHfICEAnNmULXdA==
Received: from BYAPR12MB2597.namprd12.prod.outlook.com (2603:10b6:a03:6e::20)
 by BN6PR12MB1187.namprd12.prod.outlook.com (2603:10b6:404:1b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Sun, 26 Jun
 2022 12:51:47 +0000
Received: from BYAPR12MB2597.namprd12.prod.outlook.com
 ([fe80::cf6:e60b:69b7:12df]) by BYAPR12MB2597.namprd12.prod.outlook.com
 ([fe80::cf6:e60b:69b7:12df%6]) with mapi id 15.20.5373.018; Sun, 26 Jun 2022
 12:51:46 +0000
From: Tomer Mizrahi <tmizrahi@nvidia.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Join BMC community
Thread-Topic: Join BMC community
Thread-Index: AdiJW03588Q7o65wT+CTJf4W3GyC2w==
Date: Sun, 26 Jun 2022 12:51:46 +0000
Message-ID:  <BYAPR12MB2597603C2E7B346CCB06DE40B0B69@BYAPR12MB2597.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8180eea5-7eb2-4a3a-e3ef-08da5772a113
x-ms-traffictypediagnostic: BN6PR12MB1187:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  lh4Ea12nBgoaXrvmVjvBhnoE4k37rqQZ8yIWwtoVJe+LXXy4Bconr8dwFCOb/1bhBSkf4MaWILLaDERvrLgcsLQryN/MjiB7eqcKd5qeiAz/5L/MbE69sjEMJOLxdvCo54c+TiFe1+GO+0A8elCdlYNkrd/dW5YjFWub/B8asAOuVj+0rfA47n9mLOlAe65i7beVKiF52fZZgsuTVSL9J+pWEodfgLoxMKtC94a2LLyliCpkD/B89cdQ/IX878t56iUp6BUfObB5QDR9Ze6Evvw1YbwMIKVMB4G7mjHKTJNnbEYc0hZMgpWDC4QdhiqOqTakTNkkUVwA4OHGL12OAZIH4oEVoFM5IGQ2AWnyKo2/hWD7U6IJV8zwM1qTC2wpmm+Pc0Mn1kTdBmqJQPKC+XjLAEL5bQ9R3O+mgqLtNLV2FDlr13YyMdx3y5sSnwAMWgB3NcLLb1X6Hb4QuL+Xmfyn3v1zrpxM3SkxqddaRJeRdzsFWSTRSojjqqWWmA6kRNG4zK8zeTcjCFMSW3jBvjv0zZ5u6WgOLAUIgP4R6QikoIbHfBHrCZ3HmgqDBTW3UNuYvcBeVxw/O1/PMb23s2NV4ZUQ4YEhTZSIwC6v1n/N3P/vqox4yPy2D/3dbZTJ4bkD263Ml10pFjGpMXU0uwZ9iCksbjBGA0Hi17p3iFxd0TeDFSy98F8m5/njCi+ChaivjnvKy+s4YWhOXO5s/iOBquKAycDwhQmYGfxj6feAMgDDzIL5Q1Vg9a3C8xkj6OIoWY31LIAIe5uETlKJEPll0fYcQLE73oQ8K/ET2wg=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2597.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(478600001)(71200400001)(186003)(3480700007)(558084003)(33656002)(86362001)(41300700001)(55016003)(8936002)(38100700002)(122000001)(8676002)(64756008)(66556008)(66446008)(66946007)(66476007)(316002)(6916009)(52536014)(9326002)(2906002)(9686003)(6506007)(7696005)(26005)(7116003)(76116006)(38070700005)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?13LQeO8zcTvU9/V81w6WUJh23YHncft3AUnriOHjVf+DfY+HdQ70/yPwju82?=
 =?us-ascii?Q?sj+cKsgQL8TWNEd3EjYPkZ+OWlP0zzvvN1raUYgzz8s1IrE4YAmsj8HuRNDA?=
 =?us-ascii?Q?ovhlkZfU+LJWbkdvbPTGgBdLTfGKGVu3tnSHtYPpZoe+vIZ2/y8iGaqHuV8z?=
 =?us-ascii?Q?a2SKjjTsm63vtff0dCnPLbo3lS6LOF15C8NXYsTQvXnI9X0SVP8sk+IyN9uF?=
 =?us-ascii?Q?MMXSRvPNKhAxyXFryV4lyz2+b9ra06+0fTpYyp4qxTcwt5mdxugH9UeyuD87?=
 =?us-ascii?Q?0gZUwFYerL5XRrIlO1mswTfCxgNal/A0ZEksHqz5NWZqe9CYMUMjt+tFaiu1?=
 =?us-ascii?Q?+iIPXpf4EYx6uhRz/JKLpZ/1xx2RzXYnueEM9jDKBUtHCMMh//SdpnFwQMRj?=
 =?us-ascii?Q?sAsG1u33gop2Y7t9XrfYiKXmiCa5gXM8nSV8gc+pBXPO4dNbYJ1OMY0b2uH3?=
 =?us-ascii?Q?hFFbsHewfg9JVyOZevBoaLgKHdveMSod1Z1ZR2nlpIOAoI1Km0CBAlNYnCys?=
 =?us-ascii?Q?a04nra01HROin26KIZ3MapddoXRFjJJyddQAnx7DOD/ipBBC3cx8os2tPwDn?=
 =?us-ascii?Q?WAdPMrcmQBqqQd+hRRjhKoauB5McQinlCAcrLqTxp5vl1uJlE9PBV14aOPaK?=
 =?us-ascii?Q?B80a9RASSre5WdnYnwa4jbGkkXNnzEPqjbL7W9b0Y68Pep5Rdoaikbk24l3r?=
 =?us-ascii?Q?OEh8P4wQbJYf6pPOHME6/Mo1EMrBrpdrcr3g7c+C1NXlkyRJjESMItJS+lU+?=
 =?us-ascii?Q?06ZcXJEkzxxg5uFIUWZ2ltQw6/NWOv7kJb4nr3dTuXVhtvwlYi9FPVFBNrXo?=
 =?us-ascii?Q?pZHqEBLHaVAWNzsOVSrqP3SKkYbw98ViWXN4o9fjQfk57VdbDLE/TQrYULoX?=
 =?us-ascii?Q?OehToXpYNBP0d43gSpPOKudNgw/Mn8aWt0nnFo/VMSjNp7h5KURwftneZRij?=
 =?us-ascii?Q?6Bf68dRVi2DlTJbGXaLhXMkK+HwSP0z2BjwsmVRtMeRwQsFkwuRBnNpZBfrX?=
 =?us-ascii?Q?uSg30sFu5qvMu/t+Bkt0e2AfBqQyYMCWXNx8xbgJb9fIV02b0pj3hV7qGnZg?=
 =?us-ascii?Q?Xv2R6m2laent5EbjbRYIcANl+uDCZoWPLntxzwnezC9Nk8E/I+vaygN6PacP?=
 =?us-ascii?Q?3k3pZjp+5samFKh2uA/rNA49k5t1LoyuWfbCqWA1v+gzesEntOuACGZOSBvN?=
 =?us-ascii?Q?2WWr9FbphBsljRttLUJYENx6b60FNHI1QTQR4tYDqcjZ7/W1+7I02OXK9fQR?=
 =?us-ascii?Q?CRYJZaOEMXDcpGMG8AEcN2MtskZjETMgiwDVnxLdGcIpyHtMYdFTRDd4qsg7?=
 =?us-ascii?Q?/nDyxJJAr7SrGO5a1GQy3VhPiNSo0BoR/ELBzbNHi+OrdbJpAYcVcYUjRKo7?=
 =?us-ascii?Q?739H8nWsdTvc+upWGgOjOITIyVoAXLvRm5kgixFXNunSY8iBHGxlgD3aBpbB?=
 =?us-ascii?Q?QU+1iWypCelSSFD9oxvKrDttxx7/NGhs4bNhWELfbJpkjOPbrfT9hPoCFZ96?=
 =?us-ascii?Q?Spqbm0hfrAVSO3P+voBjXuX2z6XZGg+cOsSBBMzNfjX1x3uzpWcaOYnQ+POs?=
 =?us-ascii?Q?C5dJDk3mg5JHcpROktZN6/+G0AOvL1Qau7EAq7g2?=
Content-Type: multipart/alternative;
	boundary="_000_BYAPR12MB2597603C2E7B346CCB06DE40B0B69BYAPR12MB2597namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2597.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8180eea5-7eb2-4a3a-e3ef-08da5772a113
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2022 12:51:46.6357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uOi5cmSYiYKe/0n1CyWWyoldaLlXpDuZSfOZCQwzOYhy3RdNAprfBkKljq1JcJ0blaltfQiNz7wPmMlHbrv59w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1187
X-Mailman-Approved-At: Mon, 18 Jul 2022 18:59:37 +1000
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

--_000_BYAPR12MB2597603C2E7B346CCB06DE40B0B69BYAPR12MB2597namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I am in charge of product marketing of BMC for network business unit in nvi=
dia,
and I would like please to join the openBMC community.

Thank you

Tomer Mizrahi, Sr. PM


--_000_BYAPR12MB2597603C2E7B346CCB06DE40B0B69BYAPR12MB2597namp_
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
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am in charge of product marketing of BMC for netwo=
rk business unit in nvidia,<o:p></o:p></p>
<p class=3D"MsoNormal">and I would like please to join the openBMC communit=
y.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Tomer Mizrahi, Sr. PM<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR12MB2597603C2E7B346CCB06DE40B0B69BYAPR12MB2597namp_--
