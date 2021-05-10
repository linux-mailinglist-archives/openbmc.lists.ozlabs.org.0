Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 278EF379A5D
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 00:48:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfGRQ0gd5z2yXW
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 08:48:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=bFarOaa3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=2a01:111:f400:fe5b::824;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=bFarOaa3; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn20824.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::824])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfGR66JClz2xb6
 for <openbmc@lists.ozlabs.org>; Tue, 11 May 2021 08:47:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAdJ/GYxB1+AvFH4c/3HQT7RtTFLs1JRWCMB64bJfmZ6yLJMyeUPZlEw8VApL6VrM8b4UXlaMFAjSR8DyslNvWZJsq6C49w5Z/nlGUBQq6MvCIWTwgIZpw8uB48w/4IwElfdsy9UtaJTWLGzs6u5Zi8uU4BHXES4nYiK8dtwvB70NABITPUD5ujaZ2ndVhUAU/ZLkHt6kS0DwJ9qrZON1G8eOfXXlUGCixg9poN7lrO1EG1xo2Xr4VQ2zrdkqCKiRLpOgmVuQTsQ6d8DPXiCRKOKgTGIfd9PoAtVofvziZyIRNXeCf0l/BeGbQLsbxkNN9aBBR6uXk39+iddiGVAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkUDWjj2g32Onqv7PuiYXnZnsRi7IS090hw7Q2bY08I=;
 b=H2IOf4sndvKv8bh/JPkrAAQDfjEds7Qb3FWOSI9SBYtuHd/COGFxHXUejTmcL/0nmTqpiuaUCMnjyResaLMvRZRGCHrlSfQ8Z+8aku+m6k7dsYvkuCo25E8WUGwQbVb+wFDTPPkyfRjY0O9DK1r0HRX3kehcv088WZFB4k1PSpq0DzgQsXyMKGZfdIFLAATNWXBkkNRlv+WQrpuWZ68Ye96A0t23iohh3iVb9Q9hKgi0cFLJL9fYcusaFAvj807CGw93LSNKH47L2vdfpd3+3vB9s1FKss+cGPl9JnvLoJEe2AH7OVHD4EI9DVL9t2MGAKWEf3LqS2hgskXttnoxLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkUDWjj2g32Onqv7PuiYXnZnsRi7IS090hw7Q2bY08I=;
 b=bFarOaa3h8ozGXsd/z/28BRYe73fjO+6gyFggWCeC7usKLDOBRB1rONziq7VmVDIWWUhx+aNk6ixOgNBymoabEfTPG+SpCeduspmcFQ3o33uOJ7ueDqpHnl+EaWG4T1rRt37LZeSe2IjnaO9aMJqfNFoHVZ9QUSVYJYPD4kgIKAYoK5GjEqcPAS7newuXJAx21i3KQ0nizfBjFEK9sZ9HJU9FOYtlERuxMOX7UwsTbXgpjNgb4V3KYFNkpdP8U0QWpIqOEBH7CRWQ31i+Xfjn1++Hsv39hXk7C+PjX1gQHHpDPxywUGmDfbUB+FVqTAvhr+6W/nAPdVR5OuSVjkDDw==
Received: from MW2NAM12FT045.eop-nam12.prod.protection.outlook.com
 (2a01:111:e400:fc65::44) by
 MW2NAM12HT009.eop-nam12.prod.protection.outlook.com (2a01:111:e400:fc65::491)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.11; Mon, 10 May
 2021 22:47:35 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 (2a01:111:e400:fc65::4b) by MW2NAM12FT045.mail.protection.outlook.com
 (2a01:111:e400:fc65::268) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.11 via Frontend
 Transport; Mon, 10 May 2021 22:47:35 +0000
Received: from BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::6d95:d8e7:6d78:c72b]) by BYAPR14MB2342.namprd14.prod.outlook.com
 ([fe80::6d95:d8e7:6d78:c72b%6]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 22:47:35 +0000
From: Kun Zhao <zkxz@hotmail.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Configuration categorization and reset-to-default based on it
Thread-Topic: Configuration categorization and reset-to-default based on it
Thread-Index: AQHXRe5jgersn8/xiUi6tn3YYYw2Rg==
Date: Mon, 10 May 2021 22:47:35 +0000
Message-ID: <BYAPR14MB234266BAD867195E22F94F95CF549@BYAPR14MB2342.namprd14.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:0EC7967AA7E345DD5CFAEBDC6BA3C49C0BCA81BEFBE3A5CA377CCDB1D34EC386;
 UpperCasedChecksum:111B89B97CBE65D3A0B9F276200418CF7F0395D0BE052B3D4250FD0148D03D7C;
 SizeAsReceived:6714; Count:42
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [TvQtIWJogirrxnWys0buyMRGMpKLgBD8]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 68f45d82-dc99-425b-7e91-08d914059afe
x-ms-traffictypediagnostic: MW2NAM12HT009:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DkTzfrwtNDOsVBrg/x7krREK033/QSybESsRpl72IVJ/RbxuQkQVlajJW28TQq87AReXto9hy2ejTKKglQRqBquMCp5Xqj8f0TJjlPpAhEH/AmqLiEBbvLPWtBcdCz3sMq01CiMv500fR3m/QAR2NQrkSVauu/DsIilavL2rRF/vfCIqZJn74tIMbcIGKAKPfOYubzqtplCoN+9e7GrVVmDfDVKfRcHVU8LWiobttA7bzgKh+i2HYaat6F45VY+VypgFHpnPbQHM8j4jORFM2gUuxMI4/KZBYkjyAnHwKH7p7UEPJ+uWMDnVhYAecgzNJfnnl7mdo3Dv7hxad+UDibH/XiKE22Uw8ZFjqTwm8ckuhOanK5w+DUsW3s7daOQu
x-ms-exchange-antispam-messagedata: v5hdXveOOoMy+58rYH/TU6LNStRFWzj6IZfnTMFjLMd1BxnBSnkgD5xVED2FXBrLnRvSKxKM5QEkiojp9iLwdDWyJm4n9IM9Ht0oFwFiOeS9WKyFqlxeKJniYnBVJKWbUGj6gtFxw65WD56uxcblWA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR14MB234266BAD867195E22F94F95CF549BYAPR14MB2342namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM12FT045.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f45d82-dc99-425b-7e91-08d914059afe
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2021 22:47:35.6508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2NAM12HT009
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

--_000_BYAPR14MB234266BAD867195E22F94F95CF549BYAPR14MB2342namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Everyone,

Can we load factory default for some particular BMC configurations based on=
 user selections?
Like user could choose what configuration categories (or modules) to load d=
efaults, e.g.,
- user account
- certs/keys
- network settings
- SEL
- SDR
- Logs
- ...

Sometimes user may not want to reset everything especially those provisione=
d user/cert/network settings.

Thanks,
Kun

--_000_BYAPR14MB234266BAD867195E22F94F95CF549BYAPR14MB2342namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
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
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" style=3D"word-wrap:break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Everyone,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can we load factory default for some particular BMC =
configurations based on user selections?<o:p></o:p></p>
<p class=3D"MsoNormal">Like user could choose what configuration categories=
 (or modules) to load defaults, e.g.,<o:p></o:p></p>
<p class=3D"MsoNormal">- user account<o:p></o:p></p>
<p class=3D"MsoNormal">- certs/keys<o:p></o:p></p>
<p class=3D"MsoNormal">- network settings<o:p></o:p></p>
<p class=3D"MsoNormal">- SEL<o:p></o:p></p>
<p class=3D"MsoNormal">- SDR<o:p></o:p></p>
<p class=3D"MsoNormal">- Logs<o:p></o:p></p>
<p class=3D"MsoNormal">- ...<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sometimes user may not want to reset everything espe=
cially those provisioned user/cert/network settings.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kun<o:p></o:p></p>
</div>
</body>
</html>

--_000_BYAPR14MB234266BAD867195E22F94F95CF549BYAPR14MB2342namp_--
