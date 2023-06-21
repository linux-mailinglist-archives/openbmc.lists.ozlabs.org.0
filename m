Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0318738844
	for <lists+openbmc@lfdr.de>; Wed, 21 Jun 2023 17:01:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=FvCZaYlD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmRXQ586Tz3bXT
	for <lists+openbmc@lfdr.de>; Thu, 22 Jun 2023 01:01:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=FvCZaYlD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hotmail.com (client-ip=2a01:111:f400:7e88::82a; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=fishbaoz@hotmail.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10olkn2082a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::82a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmRWn6dJbz30D2
	for <openbmc@lists.ozlabs.org>; Thu, 22 Jun 2023 01:00:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPam93VgbNsblKiwqeieOSrK4DrozeMuUJubNSNnRhgXu89lgZq5tTGvrsvUJPQk1EUXYejXhLhiJodopR8RYMzoNUR1gCiqhVhxbYxmgGNe9ebhqbuINc12FiqHENx/Wxr8gjlVw8+YSU5r8Mkgg8azuQES2c4yOLpJTC4HMeaLjimX3rVZRtCTbFkbUjjaBGsseWGhXjJmfqBcLUVdh/AUTeINrEfUdFlyf73GELcHmIKEdaF/uqo6M59JVn8l7Im0lC1+Vd993vYsd/v8+5cWzuFCv9M4qZ27YRryJuO2lGV3LG9fIrrZZXIacNzExox3GXzO7+TpJBzuovJeUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEdKaO+FWCM6b4w6GMdxznkkidV4k5uTXvKEfJXCrdM=;
 b=WqLiX0eSU2Jih00GMOf8mKh0EDv+M60DI+ZbvqPNqRMiL9lHL0EU0LowOMB0t3HJKTg/x3gsRsMrdxVCNBvxQ3kVzhvydLm4jrcchSwH42hjuPB+ywPYdChu+BjAU6Y3QHHWd2BjCEI0P3YxpOSxSpaGCNft8b99iXwzPwNqnf7NGi7eWKIZfs+XbO1FlQJ3FsI4tEv6pvav7vNZxmoB/Irl/qw7PNaYsNesZZRt6HIiPaVHIVhZT6yDH4Xx4CQnrTrwzXwJmMuU64xd4Ib5t/9JOSeprS5xeTHQsYBRtDscypgEY/MwSi7g3UJiWr3hOOBPVnWO6mTGS0nOJEhA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEdKaO+FWCM6b4w6GMdxznkkidV4k5uTXvKEfJXCrdM=;
 b=FvCZaYlDYMkByCCjQo4LvLW6m6AKwvU1YGcCVzSW35eytgETJQCG7KtCRpF4qVLvPGJaRjQYpoCp1/ByHW2dpobeGOq5Z0oDrBn81AQ9lWZ6p9wa6HQfYRbyj2pe9KZVgct/VBW08P0hpjAI46RvOdbQAZedbGiMzUMH/ebcqmiJPTY5fNU0pseeGn4EUv+K8akhjxJu902K5grdgXwrhbLYkBu18FGPzMwNuVAmOV33efyaxA9KRQQHWv+NiB5iCLwjXy0UB1IG7J9GK2DP8IS+DgJJ7oOV4cJuLZyGaZ8BTzoDWeROUO+Od/6eSJMEAA0LxiskvNCnvGCb49YLbQ==
Received: from DM4PR11MB6502.namprd11.prod.outlook.com (2603:10b6:8:89::7) by
 IA1PR11MB8246.namprd11.prod.outlook.com (2603:10b6:208:445::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 15:00:17 +0000
Received: from DM4PR11MB6502.namprd11.prod.outlook.com
 ([fe80::49c0:aa4c:e5b4:e718]) by DM4PR11MB6502.namprd11.prod.outlook.com
 ([fe80::49c0:aa4c:e5b4:e718%7]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 15:00:17 +0000
From: Zheng Bao <fishbaoz@hotmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Does the OpenBMC support self test? 
Thread-Topic: Does the OpenBMC support self test? 
Thread-Index: AQHZpFD6i4ZLe93dpUel4KHrbBZF2w==
Date: Wed, 21 Jun 2023 15:00:17 +0000
Message-ID:  <DM4PR11MB65020C1A5474E4259D2FECD8CD5DA@DM4PR11MB6502.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn: [SXxOAvLazsbCc4KGxKx2Qm++GT+Zk6ImpZLL2F2JMQI=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6502:EE_|IA1PR11MB8246:EE_
x-ms-office365-filtering-correlation-id: 494e478e-c5e0-4c94-4ca0-08db7268398e
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /BmYLUcHY4EsxN6HMtb6aVoVom8vGlEuknhL202IV7uDbfpjBfhomWX+DSEDvJg/kV1fxGYmtfT8609eZ2nn69qKrIWsNH0PcVplZCtxJAcqpglPNTF2Ou3iG9pnBZk4lRWWWmwMX0T38cCjFFV6N62deJCrB81iL464TmmExX23FUaSMUTcMDmKiILSAqtC2rMPM6l9stoSXjdHIlnzu9BeAr7BMxktm8jvtMDtStwoqRpEN24UhO6OcIma9bn/WH+nG0OGOyfPclxsVgOKyWN4cTa1T//DTwB2z7XRgwfjQ5QfV/rHeIMEfayzTbqo7e6p5Z6opFaFXqHcdInTAogM6m+ECDMEA2zmegehBPRsMM/hytcaPYIuft5e3JWJxozIFKimxUX32hcFNjN4VV4MweS3JIjVOhiFzIM6JwdU2GZiyw1X2NDJSe3QVUDyZ2xjPnDbWl8ywIJcqmYqRkoRBFRuLaY2VhanGDEdZWZcMjScLzr8ZmqHT4CSATKByfIpuCay7jMqXDyXw3qNWbOPrnO2R7zYbuJMcmDRJAqCeUMZJSAvjtFdvO25RjxL
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?4T/wEfF2VW3JNJnMJmA7Gwxc45WhsXKlR7CN6TofooxHyLBAPAIquasrIA?=
 =?iso-8859-1?Q?Rc2eGfFxuYHx4VgaouzhEmfnRqgztPr8zMtmY+SbAz9OB5cXohY7RqBTKR?=
 =?iso-8859-1?Q?7ccPNlFYAUCctH8I7/b2BAnpUy3kDJ3E3o8j7g08HiZIHFrVmFndD5ysk4?=
 =?iso-8859-1?Q?Ga1m+CMI/2oTt5djDGmD7bRHV1qwmWetVUnVX3Sd6RRrDIrzwSDecv41W7?=
 =?iso-8859-1?Q?hGwa3R7JyZxuGGqvtj8SIO13DeBXIhNUrsaWhGH1pWOu2+XANws/vB4Xjh?=
 =?iso-8859-1?Q?kRmWw0bl/n+OlUSNGlUGotIAOrzwJ9CcaLoMzf7+IRpwbZIgf4BTD2Z3QM?=
 =?iso-8859-1?Q?hXBvdaXXksIOevp1m+GdhZ8fVNFvEspMsV2ym/EdVrPrIEDuNqInewqLVz?=
 =?iso-8859-1?Q?gMx4PEtrjLsbdt8Kg4l623wUhQADG4EEUktfBEDalHMvfUCxvJ67OUsyO8?=
 =?iso-8859-1?Q?rd7bnXblg3KWcQQrVK0dJFWe0dKEcPpAkMv2GMyLnLf8GtCzm73551QAOO?=
 =?iso-8859-1?Q?5FcpVQNR3BryjkZ3EMbNsYPZk2RjXYjIIVxu0Su2vFVuN3eEEZsC9ZpGZx?=
 =?iso-8859-1?Q?pQTOBq394c8Lz6CBUIZ5QKzdCEgbioZAx5+5X5aQjgfhkwVEHKWjenQH4a?=
 =?iso-8859-1?Q?eeoU1ZjdarHEfHBXSC6N5qYv3zfgsV5gEJc42T/qdVPSwZ6FFNWVOnnSYk?=
 =?iso-8859-1?Q?Cu3/Ova5fKk9kdDhYbt6r1MiSIA6vSPsQr7+VQBSR7P430+GHwLgr2lC+Q?=
 =?iso-8859-1?Q?zB1cgFzE/hRJRNCoFFB2796YTIhVC2/P6Pm7zW32b73N+RLDi9Vg8uWCm9?=
 =?iso-8859-1?Q?zmw1+swIPIrVoc6hbOynU61iUdmnlGeubjnfrOVlMsFOuaOjDVX+PSwqgw?=
 =?iso-8859-1?Q?CVD6Hk+7YW6JiQ4nT+wfYKL7TG/VW4S51gdgM+F3Pggzgdy2mNVx+x6bWK?=
 =?iso-8859-1?Q?Xiza1M/4CZzArN9kj8CzWGoA6/Ax+FyNbQEUIvTzMHOU4aHZEz8pbiT8kZ?=
 =?iso-8859-1?Q?2VR7r3rr5MEA6y+rlvQ7ehN4kwrdg8Aiqo4yERLvH4/vI2tcP1mUhU3wnA?=
 =?iso-8859-1?Q?8oowp5DR3rgwdLRIjyW2+YHLCX0HUwdJed0FE/tXucH3Wru+CSsNZFBGfl?=
 =?iso-8859-1?Q?9WzqwS2ucn9WDqF9Ll1qQmJ3KtumMkd//7+yONVsx+4BChK+qiLKoZFOwq?=
 =?iso-8859-1?Q?V8RrfCDAnzT6gDeS3joQKWariiYCaZclB7YbXOxPP/3USdEc/1iP86XmCC?=
 =?iso-8859-1?Q?Po1/QoY5g8IFhWSS8Kvg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB65020C1A5474E4259D2FECD8CD5DADM4PR11MB6502namp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-e8f36.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6502.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 494e478e-c5e0-4c94-4ca0-08db7268398e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 15:00:17.0616
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8246
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

--_000_DM4PR11MB65020C1A5474E4259D2FECD8CD5DADM4PR11MB6502namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi, Guys,
Does the OpenBMC support self test?



ipmitool -v raw 6 4
ipmitool hpm selftestresult


Thanks.


Zheng

--_000_DM4PR11MB65020C1A5474E4259D2FECD8CD5DADM4PR11MB6502namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi, Guys,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Does the OpenBMC support self test?&nbsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
<table style=3D"overflow-wrap: break-word; border-collapse: collapse; table=
-layout: fixed; width: 1113.91px; font-family: Tahoma, Helvetica, SimSun, s=
ans-serif; font-size: 12px; color: rgb(68, 68, 68); background-color: rgb(2=
55, 255, 255);">
<tbody style=3D"overflow-wrap:break-word">
<tr style=3D"overflow-wrap:break-word">
<td class=3D"t_f ContentPasted0" style=3D"overflow-wrap:break-word;font-siz=
e:14px"><br class=3D"ContentPasted0">
<br style=3D"overflow-wrap:break-word" class=3D"ContentPasted0">
ipmitool -v raw 6 4<br style=3D"overflow-wrap:break-word" class=3D"ContentP=
asted0">
ipmitool hpm selftestresult</td>
</tr>
</tbody>
</table>
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Zheng</div>
</body>
</html>

--_000_DM4PR11MB65020C1A5474E4259D2FECD8CD5DADM4PR11MB6502namp_--
