Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 535A423F5C1
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 03:19:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNkt35RdzzDqw4
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 11:19:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.18.16;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=Uj8xewdz; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn2016.outbound.protection.outlook.com [40.92.18.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNksB00tgzDqjj
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 11:19:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vsrpowya7og3GRgfBWc+MFUvYlCkmlc+m2IH5UPm7Wn7G7OH6esrWLYZYq99ISfE0XpO3jTAOGkTQXc4F8LqeEFGC121g22uZzCqijsB/VALvkZKmb+J9X8lfZ+9NYVAXNaOm4VptjEOAiXCb+chfxCw3WFjKxVJI937Ow2WbMa7bnRdAGDGVxcMIq/e5lx+zKliUGvdKivEGqO3NdWnpT5ks42ot7Kys1az2AnQsBDY+U7s31L+++IHsqnEAZE7x3U1goB+AzQMDAmsaTg199QPVewTZkENhGK7a2PwPShfdWf4/JEq/0nCONasTfgHLXGZ8PH+1MYn9tG7mCrcFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2j93WuA1svx0d7IINsM1s5T2b70o3Y38jGuqaoDq72E=;
 b=myssHJAp6kIH6NXUrECphty/KeNFHyoFiWqgnH3X2TysIloQjI5i1JtDivP8BUpAtZGU1nXmrdSjQO7KkSzupMiJ2yyeOJER333Qv79r4UtN5fAcXX/eHYJ9PccA58cti/5/64noOILx0NeMuv0tOlSCRwU8PT3hT323NIO20OW0d0etyKCtSkk7gmyqDfI/DiJWcLJplPM/3o0l+Sz5YLvk37GPphTcZgRRXAtetOcoXz92esVXYgZ1uTV7E3oLb4qxs6teYdmDX7sCC/ydhOxGJAjgcAfxrrIeXrOkbd22FzIMTPjbYn7XDxUJLsF7HxgutpicrjjQYCpjl95qig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2j93WuA1svx0d7IINsM1s5T2b70o3Y38jGuqaoDq72E=;
 b=Uj8xewdziiya5f6RTSKjt5nb6Ak4Lw9lr3lzcTvypTG5j+IBZUEVoUHiTLxgmdOSTlwJNC5iN9k8fbVYX7AAbE5BN75HnTxRUGJNYb7LPKF+BvA8aiN2vLw7YAtQUAZJWqcalt+8I1bGR2IvpZL6st0w4CQNE1XcgNpaxmukJ1yNyEGK4tiQhMtV4rP6dNQy0Iqp9KuDtUy/Qp8JMfIA0BNebQ80iQAFN5Z08iM2Vbf93BO3AekKAbHBEZYp/pqQrgY3egFVh5AY4KnCUGVDGslfXJiCKzgn3eHFwzLlzAxql9SJJOYQdfnDXLTxGjzdcMJpTZsCRwxkhhtWuIyRMQ==
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4b::49) by
 BN8NAM11HT166.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4b::265)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16; Sat, 8 Aug
 2020 01:19:04 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 (2a01:111:e400:fc4b::52) by BN8NAM11FT056.mail.protection.outlook.com
 (2a01:111:e400:fc4b::282) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16 via Frontend
 Transport; Sat, 8 Aug 2020 01:19:04 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a]) by BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::952a:28d1:bf4c:83a%7]) with mapi id 15.20.3239.022; Sat, 8 Aug 2020
 01:19:03 +0000
From: Zhao Kun <zkxz@hotmail.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: system power control
Thread-Topic: system power control
Thread-Index: AQHWbF26pALAg0inPk2bxRb0hBQooqks4sQAgABYk+k=
Date: Sat, 8 Aug 2020 01:19:03 +0000
Message-ID: <BYAPR14MB23424B7B0D6A450C52235EC2CF490@BYAPR14MB2342.namprd14.prod.outlook.com>
References: <BYAPR14MB2342FEAAE4DBA6383E3885FFCF490@BYAPR14MB2342.namprd14.prod.outlook.com>,
 <2b9f359f-019a-c6b4-d200-357124649cd7@linux.intel.com>
In-Reply-To: <2b9f359f-019a-c6b4-d200-357124649cd7@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:CAB81F4DA9787B8729D2B33BDC3D12B9167ABCDA80B11E8FB1C48F4EC762415A;
 UpperCasedChecksum:A83790D87E7D15E71DEC85EBE0F3DD1237EEBCB17BE3540336F9BA0091CF1C75;
 SizeAsReceived:6921; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [r2Y+ozpbLxW5Ipj5M0QQKo3277+kQ7QA]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 5f28b211-055c-4b77-41e6-08d83b3909ea
x-ms-traffictypediagnostic: BN8NAM11HT166:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Vax7cDjQScacTyHK5wZ7ylMcaegDSw3d94t/PIID595jHn1KlwWTPZtAu6WAjMbVV2MGUTiKAD79+H5wcZ3+tGAbcKVGTojD7ILcXQHpbjjx+YNFAa9IJNewYYzmSDWvYA3lzXfcvJ2qSRNpdZsxAkUNnucgIvxO3kElZu9lFsSkfa4O0q4Ytps0Xca53r0bPoRGCzuLKVq7U5iXlXAhfQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR14MB2342.namprd14.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: UdW+mjYawojXKDbNyUQGQgvalwx1B8Z4dZuqf/Fz6INqnZBqB7i9L5zZen/0KvkAofGfvi8mHa1mNvwOEXSJxBXr+yEgl3GVXCp0hdNZ8DcN+nadWaKkBX5CKZoLNUHeZ7CJTyNP7tvXLoVXg+VWmA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR14MB23424B7B0D6A450C52235EC2CF490BYAPR14MB2342namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f28b211-055c-4b77-41e6-08d83b3909ea
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2020 01:19:03.7477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8NAM11HT166
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

--_000_BYAPR14MB23424B7B0D6A450C52235EC2CF490BYAPR14MB2342namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Thank you, Jason. Could you share with me any example of defining those GPI=
Os in device tree for x86-power-control? I can=92t find any in aspeed-bmc-i=
ntel-s2600wf.dts.



Thanks.

Best regards,

Kun Zhao
/*
  zkxz@hotmail.com<mailto:zkxz@hotmail.com>
*/

From: Bills, Jason M<mailto:jason.m.bills@linux.intel.com>
Sent: Friday, August 7, 2020 10:12 AM
To: openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>
Subject: Re: system power control



On 8/6/2020 11:43 PM, Zhao Kun wrote:
> Hi,
>
> I=92m new to learn how to make OpenBMC work on a X86 based system.
> Currently I met a problem of mapping the GPIOs about power
> on/off/reset/status into OpenBMC logic. I understand when user issue a
> power on request through any user interfaces like RESTful, IPMI, etc.,
> some service (phosphor-state-manager?) will be triggered to check
> current status and roll out corresponding systemd services to do the
> job. (please correct me if I=92m wrong)
>
> But I=92m just confused on how those services actually toggle or check th=
e
> GPIOs, there seems be many choices,
>
>  1. Device tree?
>  2. Using Workbook gpio_defs.json?
>  3. Create some services calling platform specific scripts to operate
>     GPIO or I2C devices?
>  4. Using x86-power-control?
>
> So what=92s the most recommended way to do it? Really appreciated If
> anyone can share some lights.
On Intel reference platforms, we use x86-power-control and configure the
GPIO names using device tree.

>
> I thought there must be a mechanism to consume some kind of
> configuration file as the hardware abstraction layer. So I guess it
> might be gpio_defs.json or device tree.
>
> Thanks.
>
> Best regards,
>
> Kun Zhao
>
> /*
>
> zkxz@hotmail.com <mailto:zkxz@hotmail.com>
>
> */
>


--_000_BYAPR14MB23424B7B0D6A450C52235EC2CF490BYAPR14MB2342namp_
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
<p class=3D"MsoNormal">Thank you, Jason. Could you share with me any exampl=
e of defining those GPIOs in device tree for x86-power-control? I can=92t f=
ind any in aspeed-bmc-intel-s2600wf.dts.</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0in 0in 0in">
<p class=3D"MsoNormal" style=3D"border:none;padding:0in"><b>From: </b><a hr=
ef=3D"mailto:jason.m.bills@linux.intel.com">Bills, Jason M</a><br>
<b>Sent: </b>Friday, August 7, 2020 10:12 AM<br>
<b>To: </b><a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs=
.org</a><br>
<b>Subject: </b>Re: system power control</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><br>
<br>
On 8/6/2020 11:43 PM, Zhao Kun wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I=92m new to learn how to make OpenBMC work on a X86 based system. <br=
>
&gt; Currently I met a problem of mapping the GPIOs about power <br>
&gt; on/off/reset/status into OpenBMC logic. I understand when user issue a=
 <br>
&gt; power on request through any user interfaces like RESTful, IPMI, etc.,=
 <br>
&gt; some service (phosphor-state-manager?) will be triggered to check <br>
&gt; current status and roll out corresponding systemd services to do the <=
br>
&gt; job. (please correct me if I=92m wrong)<br>
&gt; <br>
&gt; But I=92m just confused on how those services actually toggle or check=
 the <br>
&gt; GPIOs, there seems be many choices,<br>
&gt; <br>
&gt;&nbsp; 1. Device tree?<br>
&gt;&nbsp; 2. Using Workbook gpio_defs.json?<br>
&gt;&nbsp; 3. Create some services calling platform specific scripts to ope=
rate<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; GPIO or I2C devices?<br>
&gt;&nbsp; 4. Using x86-power-control?<br>
&gt; <br>
&gt; So what=92s the most recommended way to do it? Really appreciated If <=
br>
&gt; anyone can share some lights.<br>
On Intel reference platforms, we use x86-power-control and configure the <b=
r>
GPIO names using device tree.<br>
<br>
&gt; <br>
&gt; I thought there must be a mechanism to consume some kind of <br>
&gt; configuration file as the hardware abstraction layer. So I guess it <b=
r>
&gt; might be gpio_defs.json or device tree.<br>
&gt; <br>
&gt; Thanks.<br>
&gt; <br>
&gt; Best regards,<br>
&gt; <br>
&gt; Kun Zhao<br>
&gt; <br>
&gt; /*<br>
&gt; <br>
&gt; zkxz@hotmail.com &lt;<a href=3D"mailto:zkxz@hotmail.com">mailto:zkxz@h=
otmail.com</a>&gt;<br>
&gt; <br>
&gt; */<br>
&gt; <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR14MB23424B7B0D6A450C52235EC2CF490BYAPR14MB2342namp_--
