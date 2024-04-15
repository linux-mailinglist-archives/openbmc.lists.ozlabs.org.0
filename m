Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 866308A4BB7
	for <lists+openbmc@lfdr.de>; Mon, 15 Apr 2024 11:40:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=EQFmdKDL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJ2GQ2fq6z3dVC
	for <lists+openbmc@lfdr.de>; Mon, 15 Apr 2024 19:40:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=EQFmdKDL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hotmail.com (client-ip=2a01:111:f400:7e1a::81e; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=paul_d_smith@hotmail.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05olkn2081e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::81e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJ2Fs342xz3cM2
	for <openbmc@lists.ozlabs.org>; Mon, 15 Apr 2024 19:40:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SufhN62kOq0aspEtCSEf+hv1IxHp6T5DHBIgxdJr5musfZCOj8cIM5Jiu/WP4SBp6pjQxxIsH3irTbwT57L8Cf6dAAXyWp2Mc6SvMkY9H+GWxJseFv+7an6dDWFYC5JX4IFDzW+qsASTGbyWdVCyoB5KpwDYsbGksT7Ch86olL+dNA59eWabxcL9tbeOLSOc9iY6//FSQHmP3OBODYsCkDzT2nKbptbJsrR5xZwHWcACYCFHW8/xTpSA8p5fh3v6nAjMazORoXI66nuN5vnUMZVs/shvzq9TGjK9i/IsyWVX5NJvvlBEqO6bq31j4JQuO7atGqJjZrec1r8J7KAEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2tGrMSIVNzafEnDB2Lv/pAEA1QZFzb2bvJHhBxBGBM=;
 b=hhjyIUFUZdjQFY8zsVe/8dvirhsYYPn+C8e/hW3D7dz0b7wjM31/U5cJz6BbsZ6f/mJ7/TsGdKnb56exVKjFc0NY2J59PyM1U9AIofS1An1teaGH7oaoshQjC5Lq0a+K5xTmvZgXCsbEez5C35qIhZ0cy0z66FExltnWvCH817OTdeaFgL1FBww1qRqWKAnrPLrAv4n7LlSvIcihoUp2hF/WWcYX06g0Zb6e6zAqHRfhkNF3IgQUZjGfA5cR9wyy1jkYqPOxEeQ4PKu/+oHDWsjj2KPqe+FinRQKZ1XzHBOQR8B1Yx22wYs/10uzWxGwUUttAhnDcdEByIaupaC7Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2tGrMSIVNzafEnDB2Lv/pAEA1QZFzb2bvJHhBxBGBM=;
 b=EQFmdKDLb5U/3Zypc/rUIasHxL3u+tLid8eeQBeQEWlABc8TDe3ov/ozysyRQFDgJuc4lEbcrLTBWFNGZvpH3gqUGp4fJzYbcSmm5vujSmA/NmxgxmA1AM7lIMhzZ7UcOjAmgNOKfU3UwJfbiehXrcZnoHRFMLJVtjq/PeG00tOooD+Umu5pAXA3OtmdifOqX/nqU+f18dJuMDxJzM5hZMt30TPlgxPAu39qZKEW9sUAzJtgraATr5VmJLcT4Zzwdl4S3ewqtcUqM2o7b73d4jz9kk2ItkOElP0ks6Jo7P9kB0dUVIOmrtsNAB2hqcYQI8SdjHtnXqHB/VBHCbLNfg==
Received: from AS8P192MB1287.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3c3::16)
 by PR3P192MB0537.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:43::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Mon, 15 Apr
 2024 09:39:37 +0000
Received: from AS8P192MB1287.EURP192.PROD.OUTLOOK.COM
 ([fe80::3504:3224:e199:97de]) by AS8P192MB1287.EURP192.PROD.OUTLOOK.COM
 ([fe80::3504:3224:e199:97de%4]) with mapi id 15.20.7452.049; Mon, 15 Apr 2024
 09:39:37 +0000
From: Paul Smith <paul_d_smith@hotmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Virtual media image URL with parameters
Thread-Topic: Virtual media image URL with parameters
Thread-Index: AdqPGJgMydMPoNVWTM+JKti3qYoktw==
Date: Mon, 15 Apr 2024 09:39:37 +0000
Message-ID:  <AS8P192MB12875E88258C43FAD20D7FEDC8092@AS8P192MB1287.EURP192.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels:  MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=df53c735-aceb-4b29-ae0b-da4ae9cabec6;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2024-04-15T09:37:34Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
x-tmn: [X6ILEqQwd0itFHkz+XlwWgrJfzyyM7Skgn0ZZhD8ouhFIcT8RvaEaBz3UitPyNDI]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P192MB1287:EE_|PR3P192MB0537:EE_
x-ms-office365-filtering-correlation-id: 2030b41b-b500-4979-958b-08dc5d2ff7a0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Vg33PK9lKvqlSZSh7+j8DLcSR0kueclkR9Mj2Eo82KbxYsZrhwZ0VOVdcBdgiXUjHkHYwl09ID+p3YGE57B6QHakU0LfTpb4YwTIHiZeV7O/Wb4JBCmAMZUHw84zoVuewZIpy8WM3uMP0N4WXZvIea/78bcs4spToDcwlEOS7HBUhJYVSRbs1M6NIU6dYvtPp60pa1fSogdl7JSvOxwPgL0ysQ8yB4Hbz/TOqadVzquDtOFa9ZNsGRrx3hri7ws9HpsrrMr0JiF2R6152CHdgLHixMd56q5/tYTgemZsYfcWOOUwjvvWGlzQjkWjCr+KorG1dVheTQInHbFunyrNx0ow1XNTsreAP03/0SjmNZLsuCxb5xwrT4sQGCqBUhnTJc5mzWL4YXqwpgY1CXuhCzGlqM7xNzTTTcnSNJWPM+7Hf54b6+CQwyLe+49ZUJT/XJ3vG3RhpetWaN48GKYof9OZYM5hk09PRALDUIFgEQWJ/kr7dmU9ntGqcbh3qf2K/t+auXYTE4Xp2TVaJvKx/FNURw13y1HrdjI/8fpHFn1iQcDTrlxibt5Ou/8hvk1y
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?aqBa1T5BiKA2/R4VPUPhSBTB2BOIviiKEq4Gstc9qlwNkhm8qFgIp1yeuofC?=
 =?us-ascii?Q?1EjZphRcD2Ih5QNgbs0Ch4MRHHI1WD517/SjHx1qnmZU78Hdtyjhe8l1BPqp?=
 =?us-ascii?Q?lkCMUVgLIqmiLFIKYVsnaX52f1DkXZ88dR9e0eEBu4Q7E8O3BaWLfiTDj0Mr?=
 =?us-ascii?Q?r++BHF/Podkw3v6q5Vz+Kd1EOAhC5T/lYKuN8yykCcgR+Vvvcc4VQjW4p604?=
 =?us-ascii?Q?aPc6YTybMZWZ1WE2G6sQDdlUrcv47tFBCoL4WoghEXi8Ly9s68AsRfmxl15b?=
 =?us-ascii?Q?HKFhl8+sGnIzr+fC1TG+KnQsggztoVOCkKhXJq3fPv4kjDm/nAl/nVCjlrS6?=
 =?us-ascii?Q?5DsyClOHak/txbCZYvvmfye4U6URIbGkHMO/8EjR6H6Bd6IIH9NuVvJJG9Kf?=
 =?us-ascii?Q?5udjDWtRtnUEo51smXF+CcBRTMMI39G0oag7RozsIIvXWYhR79BJ1GtqFnAd?=
 =?us-ascii?Q?MztdWFIGXWP0rUVJZJ0UVMkq/4wgqx4t8Ze5A7NqsoAiTjX0BacQdKmsjbPq?=
 =?us-ascii?Q?MXHflD8x4T6MVrK/vFepTrWMUs6zwFiodTEa96I62ODwEhY8URv3Xb9D2AZ7?=
 =?us-ascii?Q?xf0gD+9jK4NhmQjFgV3aTsh9nRYMyxeBin22jTARod50nusmjpbuUc8uYNjE?=
 =?us-ascii?Q?DgVE8nvjXTl2tQJIL7FHrH8WPXNNAX8rMIFBhKFOeJ2xQugaqANTuDjZhxI8?=
 =?us-ascii?Q?aeBGLyNCrQ5oUEjN0s6cDwcKILBNLrEwSbfYAcbIfnIUrbmu6s0y8/EO+muZ?=
 =?us-ascii?Q?ctkUDL7IwyVPaKOW2dfF4chJLW6is9DF5AHUJ7LzeXgNFHKbouaggvjaDeEU?=
 =?us-ascii?Q?dIt9VvmqISI0UaKXBO3QRLhG6QImILvQov/P14KhO0XICKwQ6VhosKP9rTpR?=
 =?us-ascii?Q?gqD9FDHUKrIkTHLX/qxyGm/YHTOGZ+sniNrTVsLMAFHwEu1rGF+i93zB/DFS?=
 =?us-ascii?Q?CpGUDcDdcHo95OHz/8uj6iGPphSSd+mELc7/yGMV8nup48zfZcBvtb3+rA8+?=
 =?us-ascii?Q?5ofu8/Ef9WaBAet0LrlqFr/N9aHAvZ7eFBzHJvCHvhV8znUif4lMOS3UrMNN?=
 =?us-ascii?Q?4DwYTcmKTiceNXOcXuoqKWR75yfHkaX58ERXYaczHePYucilX6c+N6GAPk8f?=
 =?us-ascii?Q?RfZLW7BX3RFAF3GAiKgSyVnBHxd07BuBPIY1vD1HwkYx2WtnV7GCMN1InXlN?=
 =?us-ascii?Q?uGCJ+nwHw2KJJ1/yv96Hf0lsSB+jDSBzBnxTZ5n6lrpSA0WlTS1mh79K6xCz?=
 =?us-ascii?Q?4Prd/bxWZXbbqx4fd3P7odKLZj4oUWqgSFCabSDsdRBSOqZcUscKRTWZ2Cx0?=
 =?us-ascii?Q?Wc0=3D?=
Content-Type: multipart/alternative;
	boundary="_000_AS8P192MB12875E88258C43FAD20D7FEDC8092AS8P192MB1287EURP_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-fb43a.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P192MB1287.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2030b41b-b500-4979-958b-08dc5d2ff7a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 09:39:37.8877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0537
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

--_000_AS8P192MB12875E88258C43FAD20D7FEDC8092AS8P192MB1287EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I want to mount some virtual media but the security for the image-host uses=
 an access token normally provided as a parameter on the URL.  I've tried t=
his via Redfish but get a "general error".

Does OpenBMC/Redfish support this form of authentication and if so, any ide=
a as to why it is not working for me?

Thanks,
Paul DS.

--_000_AS8P192MB12875E88258C43FAD20D7FEDC8092AS8P192MB1287EURP_
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
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I want to mount some virtual media but the security =
for the image-host uses an access token normally provided as a parameter on=
 the URL.&nbsp; I&#8217;ve tried this via Redfish but get a &#8220;general =
error&#8221;.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Does OpenBMC/Redfish support this form of authentica=
tion and if so, any idea as to why it is not working for me?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Paul DS.<o:p></o:p></p>
</div>
</body>
</html>

--_000_AS8P192MB12875E88258C43FAD20D7FEDC8092AS8P192MB1287EURP_--
