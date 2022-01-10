Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 763E148964D
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 11:25:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXVMx27Zrz2ybK
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 21:25:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ami.com header.i=@ami.com header.a=rsa-sha256 header.s=selector1 header.b=ZYO8mn9H;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ami.com
 (client-ip=40.107.220.88; helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=dhineskumare@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ami.com header.i=@ami.com header.a=rsa-sha256
 header.s=selector1 header.b=ZYO8mn9H; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXVMQ72vWz2y8P
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 21:25:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2zDQ7Y8rhebuxd+MtC/LumFVJOiyt3Q8ndtGoFrqCb+6tcz1JMgeD4OF/wol8JICVm5IEafRNUDz9l51S8tRkapAVBrpv06DqovrN347H1f5o/TvrWK7fXRh3vUDN/UDPm32dapk8bERJ9n64HVk+Z0TGHNLM3JjPi2Ma1cun/6DEXfIm/owq5OygIlqR7YXN3Ab/40lHL3Wtl20eMWjFTHV/gqjyzC4bCiFu5xUvFOQdIqkZsd0z78nz+ZVDjhpwBSU1vSjQmlEbcPxVAtc99Iq4ez7lB30rxtMhy0Gk3E2sY+7Vmu2XKHC56uQbyCC0OmveFP70+IeiBtj4szJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=isxQa/1OYHu2c2/ElX3RVxZy1gM0TC+vL51MtfHumHA=;
 b=QSITF4ncbmvdqZTaisJSG3f9G+cuz8tx52SpUPZMA74qlxL6bVd2gvizNLBQ3aKNLLF9V18ZyaxIjQrR3jrovhYyDisQ7ZgVeO/KW851HBuHEVM9a+wzCJcokwUCZcbUGVyxZzhwPd21+YMgihEBLgLIoMbR3MK6OW0D71QkILxwgYCjvOVj1Mkv4a7AthOMswp2fnk3FKXIeUkcnTpZm1cLjIedMuo1+6avSTIe1yjs4SRIMuP0SlhVqQZVfPVsgwh0u5RCSainWNHpARMg/m3Fz3bput+mdqrjunAIXOVlcqYHRp4YRyYk12eI4fLk2TfZzRcpSQ6xoDTZu5l9pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ami.com; dmarc=pass action=none header.from=ami.com; dkim=pass
 header.d=ami.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ami.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=isxQa/1OYHu2c2/ElX3RVxZy1gM0TC+vL51MtfHumHA=;
 b=ZYO8mn9HLafawRSqdEtMW4plTJRfTTsXpcQt4HFTWXdgpHdlc4ui6s48UTsFCnD7P54zJVr9vCLhDTSa9GkDQTw2azWvU/H4Z5qZzQSccokfczi98LTEozL4k/A3t9dHAxxEz0OBb+WpAMCGADYbUxdZAsEYY665N5y86mLm4rs=
Received: from CO1PR10MB4804.namprd10.prod.outlook.com (2603:10b6:303:94::23)
 by CO1PR10MB4612.namprd10.prod.outlook.com (2603:10b6:303:9b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 10:25:00 +0000
Received: from CO1PR10MB4804.namprd10.prod.outlook.com
 ([fe80::6096:ad6b:5bae:d5ef]) by CO1PR10MB4804.namprd10.prod.outlook.com
 ([fe80::6096:ad6b:5bae:d5ef%4]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 10:25:00 +0000
From: Dhines Kumar Eswaran <dhineskumare@ami.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "ed@tanous.net"
 <ed@tanous.net>, "jk@ozlabs.org" <jk@ozlabs.org>, "geissonator@yahoo.com"
 <geissonator@yahoo.com>, "raviteja28031990@gmail.com"
 <raviteja28031990@gmail.com>, "gmills@us.ibm.com" <gmills@us.ibm.com>
Subject: Feature Enhancement - Virtual Media over HTML5
Thread-Topic: Feature Enhancement - Virtual Media over HTML5
Thread-Index: AdgGDFAwS0aFeOwxRmGCV5dweAX3mQ==
Date: Mon, 10 Jan 2022 10:25:00 +0000
Message-ID: <CO1PR10MB4804435C69CA969461FCCF61C8509@CO1PR10MB4804.namprd10.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ami.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 073ae89f-689b-47fe-7466-08d9d4237545
x-ms-traffictypediagnostic: CO1PR10MB4612:EE_
x-microsoft-antispam-prvs: <CO1PR10MB46129E6FCE37746FCE986C8EC8509@CO1PR10MB4612.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cPYTWTkUjWP7sqnKSJRikl8qeErAUH4/HY4mZPLGUfEOxiJOjsHPXW8Iu2oYUJLpdSqWi45MdgmbhJZDpqlDbWvJGznqFjVH7fA5sM//7i28Xu8X6czQLiyDZLXzoGaRRv0ldy2ICAAM95GlBhmtfI+wfuZoTtawVT9Xu+mTNHkib7ANc/rDTk7ed6zNVehjbV28KnoV+9EFyQRwOnHVb+8ukLvvdTpLldVTU4M+wMJuBG++qXdzgUqG0bV8D73XegR0cesMhjZfjFL+Qgmc+Cdlrz4nmQlnAkfWrv1fC/3eLV7DGFXaYRve/Fo0JQTHCZmJP57ErIzgd8Vt/UHwhWPrPvIBjucEjLFDVD/+5iH4ED8pG6rz/kmsA5r5wrMk89rXRRoQIvxYBe9ItSJFumI9UlpRcv1ibK3lI5BeUM2yqtFitnKrm+YQHHdIR+YmNldMokVg6R+znaZxjlgL1Oi4khY98qeHgfHvJ6++4zCb1aQyI7J55R1D5tcEVGFkiAQf+m4Aw5q0Qt32BDl4rJWnrW/c2XkHRDyTws78GSEmHYdBICjPdvCismk3Ju+zabIGZqG2RchNPq81OxjDpso2EGqW4wBPnqYorZ5EIff60X5q6bz2UD71BwUtCC3ejDonfWJ9CErCAqTGQsQfDoCx968iP/Lh6Pip0Ip10A2yTJTL5zLfQYACB59vFoqS50owOxPELMKDJH9f8PA+qQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4804.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(186003)(8936002)(508600001)(66446008)(71200400001)(7696005)(316002)(40140700001)(9686003)(110136005)(2906002)(5660300002)(52536014)(33656002)(54906003)(26005)(4326008)(55016003)(66476007)(64756008)(86362001)(38070700005)(9326002)(55236004)(99936003)(38100700002)(122000001)(76116006)(6506007)(66556008)(66946007)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?x3oCrH19pfgJlvsuHE62F+LxgCMS8wxRhIG+HVA6gma+9TRTu/Jluba8mWDB?=
 =?us-ascii?Q?ZvtwVyNGNGRTGPof+EQRo3TUOAvkwzMozEZJmB55rePncQ+KWR8LiEKbaInu?=
 =?us-ascii?Q?4WUUjBUHurb2fB3P9GEkjpTa3ezN0RobHLcx1pWGUw9EqbbqQdy4VmKYK409?=
 =?us-ascii?Q?QuwDmrXUr11sow90yIRrHJe28oqUjVMhDB063G4mZXvxwumMW2kSUzrtcxty?=
 =?us-ascii?Q?n3ko/TZbH4T6cTQUsnru0DhJQxZukvI01kN101BTnS6cR0LrdrBFCLrMYBBY?=
 =?us-ascii?Q?cNY6G2fyqdzTg1203Gc9TLjUR0caTbuKkG3jeCqkQC632d7KBKeoF9O1u/WB?=
 =?us-ascii?Q?UOPP262CT6DmDjU6+8hbvwbotlSh2/LPEg/jjeMc5tOauR/eS/cyZXd3CEg5?=
 =?us-ascii?Q?NDrd9x0uXlNGXUjtQinD60HQNzeUxBLWMzZNhlrqGwVi4U4r52djgGOQO2vG?=
 =?us-ascii?Q?+mY+cj+J6RpTSFIcjWig6Qg4qKbbKNtKvrLOrC2gyVaZAeRmf+kqYb5wFMWt?=
 =?us-ascii?Q?4IlbwL7/ZIUwWM5SmffTBU9zqZSrtJQyu53j5NrRGVb21Vi97y8rs3/uKUnI?=
 =?us-ascii?Q?6P+4g5wCL/7WV5dBz1lNl+Tmx34wmZYjz87MwN6uoaHpy8UGvF3JZ1j5sTby?=
 =?us-ascii?Q?/+piQJEtXQVJnURRFItR6xjpIYt612Bxb/D6L3+R5W1juRUEEBPHYfb/KIW7?=
 =?us-ascii?Q?uoh2TbA76B9YTlRHic1DU0cL5aUQmClT7GDhkzcKLFZZZJ+KZh1cGSY0uZh9?=
 =?us-ascii?Q?UFoNa828AsfdV85UuSNMJWLcb8DPLJQorujcuDmA242fYQSslezQ10ajbkoA?=
 =?us-ascii?Q?IX1/uxEVa22UweuCfTzoRTsLEHkRrDdO5ERBbr61SrKr+9ji+Y4XsunkvzIx?=
 =?us-ascii?Q?BB8bFmyojZkUY7HpbVn/D8WxZuLf7scc5rUkuR48iHxY/Ydq3UNTVWU0MoYd?=
 =?us-ascii?Q?n13w0cIKFT7dJs+ygJcrTGsY3vkh8tgk/thY3O1B0Zpn3cV2KpsA/Neoj/HW?=
 =?us-ascii?Q?+YEz8UNdSMT+N15rdxdVa2BFF9im+1TVmF9tI5AaqKD9xPRt3FlNf32Zhqvv?=
 =?us-ascii?Q?JELdjN0FtAHBZr7+FnBwFKKKt7x6hWvUMB5HKNWHZ+MEXXb4mTDWQ8Fbyu5W?=
 =?us-ascii?Q?fVFpZXm0QLJdkBXwjhXmCb+7ljOtHXipqYLo8yxKgo5PfdA/nVn8RuWj2CUd?=
 =?us-ascii?Q?wzF8D2Qz9f521O7OCusKNgUvGwgiS3sHqop1ziV42pmx13EqgZnd3kEN1yW2?=
 =?us-ascii?Q?2tUfVzjG5DQW2ztCg1CaZql3eKBmP8ZTAbtlWb8j3Z/Z0Fi8+aT/V+xLgVpU?=
 =?us-ascii?Q?2yp0fiEfOlFyfIJBmZXVs7yoC4MPetC+evUExiflSNBtiEBZfQ7DCcJUCU1I?=
 =?us-ascii?Q?jB+SnAH/mZ49Qv27iR03ApIdMcNLSvLQ0C73y0fUF5wZk+AxPS7yu8eBN8KE?=
 =?us-ascii?Q?LJJSlv76vPhLvkAoKbrFV1pr/ESYxCPnLb5PTN9ATrbtd24y8czZKK34Okdw?=
 =?us-ascii?Q?3U4g8cOXMo4lfMGTd3cv43mprO+bgtWLUNeW6RgNaQeWqXwVNPxPhwyCa52F?=
 =?us-ascii?Q?QGmrEb5RRNXGz/+hU3UCdKZePO0JEFpPF3bZYS7hCe/iAks3AeIXBisr4BFN?=
 =?us-ascii?Q?Dw=3D=3D?=
Content-Type: multipart/related;
 boundary="_004_CO1PR10MB4804435C69CA969461FCCF61C8509CO1PR10MB4804namp_";
 type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: ami.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4804.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 073ae89f-689b-47fe-7466-08d9d4237545
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2022 10:25:00.5284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 27e97857-e15f-486c-b58e-86c2b3040f93
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dvp0QczNnaSo+Fp+xnDz1NrNg1lLGwbA6Gin0prEJQAY7mI9Q14tI+8ADjpX3INEcJ/wFwHxozU2w2WwnahWSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4612
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
Cc: Gayatri  L <gayathril@ami.com>, Pravinash Jeyapaul <pravinashj@ami.com>,
 Sanjay Ahuja <SanjayA@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_004_CO1PR10MB4804435C69CA969461FCCF61C8509CO1PR10MB4804namp_
Content-Type: multipart/alternative;
	boundary="_000_CO1PR10MB4804435C69CA969461FCCF61C8509CO1PR10MB4804namp_"

--_000_CO1PR10MB4804435C69CA969461FCCF61C8509CO1PR10MB4804namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

We are planning to support multiple Virtual media redirection support simul=
taneously.
The below is the proposed design.

Existing Virtual media implementation:

WebUI is having single browse slot. It is used to redirect any kind of medi=
a, which can be either CD or HDD media instance.
It is mapped with "/vm/0/0" API endpoint, and media endpoint is hardcoded t=
o 0(Zero).

Virtual media is using "/dev/nbd0" device, and Dump offload is using "/dev/=
nbd1" device. It is parsing from the jsnbd configuration file.

Enhancement: Multiple simultaneous media redirections feature in single Web=
UI session.

WebUI will have two different browse slots to select the file, (i.e., ) Vir=
tual media device - HDD and Virtual media device - CD. Both slots will supp=
ort media redirection concurrently.

Virtual media device - HDD slot is mapped through "/vm/0/0" API endpoint an=
d media endpoint is 0(zero) which is used for initiating the proxy handler,=
 which is present in bmcweb package.
HDD slot will use "/dev/nbd0" device for HDD media instance redirection.

Virtual media device - CD slot is mapped through "/vm/0/1" API endpoint and=
 media endpoint is 1(one) which is used for initiating the proxy handler, w=
hich is present in bmcweb package.
CD slot will use "/dev/nbd1" device for CD media instance redirection.

Dump offload will use "/dev/nbd2" device. It is also parsing the nbd device=
 from jsnbd configuration file.

Configuration file looks like,
[cid:image001.jpg@01D80639.FCBD3330]

This is an extension with what the community has implemented and I hope, it=
 does not have any regression or conflict with others who are using virtual=
 media and nbd devices.
Please help to review the proposed implementation, so that, I can go ahead =
with implementing the enhancement.

Thanks,
Dinesh E



-The information contained in this message may be confidential and propriet=
ary to American Megatrends (AMI). This communication is intended to be read=
 only by the individual or entity to whom it is addressed or by their desig=
nee. If the reader of this message is not the intended recipient, you are o=
n notice that any distribution of this message, in any form, is strictly pr=
ohibited. Please promptly notify the sender by reply e-mail or by telephone=
 at 770-246-8600, and then delete or destroy all copies of the transmission=
.

--_000_CO1PR10MB4804435C69CA969461FCCF61C8509CO1PR10MB4804namp_
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
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
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
<body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Hi All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">We are planning to support mult=
iple Virtual media redirection support simultaneously.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">The below is the proposed desig=
n.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><u><span lang=3D"EN-GB" style=3D"font-size:12.0pt=
">Existing Virtual media implementation:<o:p></o:p></span></u></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">WebUI is having single browse s=
lot. It is used to redirect any kind of media, which can be either
<b>CD</b> or <b>HDD</b> media instance.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">It is mapped with <b>&#8220;/vm=
/0/0&#8221;</b> API endpoint, and media endpoint is hardcoded to
<b>0</b>(Zero).<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Virtual media is using <b>&#822=
0;/dev/nbd0&#8221;</b> device, and Dump offload is using
<b>&#8220;/dev/nbd1&#8221;</b> device. It is parsing from the jsnbd configu=
ration file.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><u><span lang=3D"EN-GB" style=3D"font-size:12.0pt=
">Enhancement: Multiple simultaneous media redirections feature in single W=
ebUI session.<o:p></o:p></span></u></b></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></b>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">WebUI will have two different b=
rowse slots to select the file, (i.e., )
<b>Virtual media device &#8211; HDD</b> and <b>Virtual media device &#8211;=
 CD</b>. Both slots will support media redirection concurrently.<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Virtual media device &#8211; HD=
D slot is mapped through
<b>&#8220;/vm/0/0&#8221;</b> API endpoint and media endpoint is <b>0</b>(ze=
ro) which is used for initiating the proxy handler, which is present in
<b>bmcweb</b> package.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">HDD slot will use <b>&#8220;/de=
v/nbd0&#8221;</b> device for
<b>HDD </b>media instance redirection.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Virtual media device &#8211; CD=
 slot is mapped through
<b>&#8220;/vm/0/1&#8221;</b> API endpoint and media endpoint is <b>1</b>(on=
e) which is used for initiating the proxy handler, which is present in
<b>bmcweb</b> package.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">CD slot will use <b>&#8220;/dev=
/nbd1&#8221;</b> device for
<b>CD</b> media instance redirection.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Dump offload will use &#8220;/d=
ev/nbd2&#8221; device. It is also parsing the nbd device from jsnbd configu=
ration file.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Configuration file looks like,<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><img width=3D"504" height=3D"38=
5" style=3D"width:5.25in;height:4.0083in" id=3D"Picture_x0020_1" src=3D"cid=
:image001.jpg@01D80639.FCBD3330"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-GB">This is an extension with wh=
at the community has implemented and I hope, it does not have any regressio=
n or conflict with others who are using virtual media and nbd devices.<o:p>=
</o:p></span></b></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-GB">Please help to review the pr=
oposed implementation, so that, I can go ahead with implementing the enhanc=
ement.
<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB">Dinesh E<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-GB"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
-The information contained in this message may be confidential and propriet=
ary to American Megatrends (AMI). This communication is intended to be read=
 only by the individual or entity to whom it is addressed or by their desig=
nee. If the reader of this message
 is not the intended recipient, you are on notice that any distribution of =
this message, in any form, is strictly prohibited. Please promptly notify t=
he sender by reply e-mail or by telephone at 770-246-8600, and then delete =
or destroy all copies of the transmission.
</body>
</html>

--_000_CO1PR10MB4804435C69CA969461FCCF61C8509CO1PR10MB4804namp_--

--_004_CO1PR10MB4804435C69CA969461FCCF61C8509CO1PR10MB4804namp_
Content-Type: image/jpeg; name="image001.jpg"
Content-Description: image001.jpg
Content-Disposition: inline; filename="image001.jpg"; size=17717;
	creation-date="Mon, 10 Jan 2022 10:24:59 GMT";
	modification-date="Mon, 10 Jan 2022 10:25:00 GMT"
Content-ID: <image001.jpg@01D80639.FCBD3330>
Content-Transfer-Encoding: base64

/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAoHBwkHBgoJCAkLCwoMDxkQDw4ODx4WFxIZJCAmJSMg
IyIoLTkwKCo2KyIjMkQyNjs9QEBAJjBGS0U+Sjk/QD3/2wBDAQsLCw8NDx0QEB09KSMpPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT3/wAARCAGBAfgDASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDzuDWN
ak06a7k1/VFCOEVRcuSSef73TiqR8T66P+Y1qX/gXJ/jUwcz+F5AqhfKnXO0feyDy3qeOtYpFaTS
VrdjScUkrGn/AMJRrv8A0GtS/wDAuT/Gj/hKNd/6DWpf+Bcn+NZdFZmZqf8ACUa7/wBBrUv/AALk
/wAaP+Eo13/oNal/4Fyf41l0UWA1P+Eo13/oNal/4Fyf40f8JRrv/Qa1L/wLk/xrLooA1P8AhKNd
/wCg1qX/AIFyf40f8JRrv/Qa1L/wLk/xrLooA1P+Eo13/oNal/4Fyf40f8JRrv8A0GtS/wDAuT/G
sulxQBp/8JRrv/Qa1L/wLk/xo/4SjXf+g1qX/gXJ/jWXiigDU/4SjXf+g1qX/gXJ/jR/wlGu/wDQ
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
1n9oxcf2gJBFk52eXjP0zxV22ihPga4s21OxW4lukuFiabkKFYHtwcnpT55rfvYRz8Wl388Anhsr
mSE/8tFiYr+YGKj+w3WSv2afITzSPLPCf3vp716Fod3De6pZ3VrfxxQw6PJbvaEkMrLG27jptJ+b
d71XXVNNkFxf/wBpW6+boYs1hYnzPNChSpGOOnWpeIkm1ygkcPFpt7cRh4bS4kQgsGSMsCB1OR6U
Lpl81obpbO4NsOswjOz/AL66VtXer7PB2i2lrdFZ4Jp3lRGIK5I2k/rXQ6PqGj2ZtnW7sUtTpzxS
eaXa4MrIQVx0C7jx2xVzqyirtf0gSVzlX8K6mmgxat9nlMMjsu0RNuCgA7zxjac9aqnTGXRvt8i3
EZaQLGDA3luuDk7+mcjpWul1De+BorJL2KG5tbqSVo5ZCpdCoA2+vTGKktooW8DT2banYrcS3SXC
xPNghQrAjpwckcVKqTW/cLLQ50afeG0+1C1uDbjrKIzs/wC+ulK+m3yW3nvZ3KwAA+Y0TBRnpzjH
NdmmsWO+DUBqES20Wkmzax53mTYV27emCx3Zok12zlurlZL5WgOgJbKpJ2mUKPkx6gik60/5R2OK
XTr17U3S2lw1uvWURnYPx6VoxeGbmTQzqgli8kQtPtOd2FkCY6Y6mty31SxuvCog1aW03W1o0dpL
BK63CtnIRk+6RknJ9O9cl9tuFi8kTyiLbt8sOduM5xj0zz9a1hJyvdWsIi+zzfZ/P8qTyd2zzNp2
7uuM9M+1R1r+af8AhE2i/tPj7bu/s/b/ALGPNz/47iskHFaiLtvYo+mT3cshVY3CKFXJJI+vA4qk
etbCMZ/C8gChfKuFztH3sqeT+VY561c0la3Y0mklGwlFFFZmYUUUUAFFFFABRRRQAUUUUAFFFFAB
RRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFF
FFABRRRQAoODS7vam0UAO3mgsTTaKANuPw1cyaIdUE0PlCFp9nO7CyBMdMZyc1LH4VuXtVcXEAun
tjdpaHPmNEOd3TGcAnGc4rHF5ciDyBcTCLaV8sOduCc4x6Z5ruofENkFttQNzahYLHymtyn+kGYR
GIKDjlDkHrisq0px+FDirvUx4LbWh4Va4iv41sjbu7RgYfYJAhXdjOCTnGcVzvkTC38/yn8kNt8z
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
mVzIzGTeVI24zgDPtRZ30H2i2uBexw28dmYWiLYIbaRjHuec+9Dkyo0IXV5f1p/mZaeGruTRDqYk
iEIhabaSd21ZAh7dcmsarZv7kWxgW4mEJUr5Yc7cE5Ix6Z5qpVnKwooooEFFFFABRRRQAUUUUAFF
FFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABSgZpKUUAXXsE/soXkcpbEnlu
hXGDjPHPIqjWzbN5Xhm4Yorh51UBxwvynke9Y9XUSVrGk0klbsJRRRUGYoODmlDY7Cm0UALupd1N
ooAXdS7jTaKAF3VYvNQudQkSS6kMjpGsSkgDCqMKOPQVWooAdvo3e1NooAcHx2o3mm0UALmgnNJR
QAUUUUALml3U2igB272qSe7luWVpmLFECAnsBwBUNFA02hc0bqSigQ7dSbqSigBd1Lu9qbRQA7dR
u4xTaKAFzSUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRigAop
cUlABRRRQBfewT+yheRylv3nluhTGDjPBzz+lUa2bdvJ8M3DFVcPOq4YcD5Scj3rHPSrmkrW7Gk4
pJWG0UUVBmTPczSQpE8rsifdUtwv0qGiigbYUUUUCCiiigAooooAKKKKACiiigAooooAKKKKACii
igAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKK
ACiiigAooooAKKKKACilNJQAUtJSimgLz2Cf2ULyOUth/LdCuMHGeOeRVCtm3fyvDNwxRXDzqgD9
F+UnI96x6qatb0NJpJKwlFFFQZkz3U0kKRPI7Rp91SeF+gqInNJmigd7hRRRQIKKKKACiiigAooo
oAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig
AooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigC+9ih0oXkcpb955boUxtOMjBzz+l
UTWzbMIvDVwzKrh7hUww4Hyk5HvWMeauaStY0mklFoSlpKKgzJ3uZpIUieV2jT7qk5A+lQUUU27h
dsKKKKQBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ
AUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAB
RRRQBM91NLCkTyO0afdUngfQVETmkoovcLhRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUU
AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUVZsLC41K5W3tIWmmboikZP0pl1bTWdz
Jb3CbJYzhlyDg/hQBDRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUA
FFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAU
UUUAFFFFABRRRQAUUUUAFFFFABRRRQBpeHP+Rn0r/r8h/wDQxWe/+sb6miigBtFFFABRRRQAUUUU
AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB/9k=

--_004_CO1PR10MB4804435C69CA969461FCCF61C8509CO1PR10MB4804namp_--
