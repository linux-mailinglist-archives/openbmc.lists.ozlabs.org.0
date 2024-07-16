Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3317F933500
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2024 03:29:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NaiL+LT0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNyz2754Cz3dXL
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2024 11:29:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=NaiL+LT0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:240a::630; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=tong.ho@amd.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20630.outbound.protection.outlook.com [IPv6:2a01:111:f403:240a::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNT7g2ymcz30Vg
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 16:05:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJ9qfL2uC5Xyv56KJIV7FzdOvpUMZ75K58MhKlvovRp+JIDlhTe4aIlEokwkOE404EZ/RF1J+kT6RF/TbhC20yRdchrR5alYcIndT4hff9FDSbt3XvXHal0Y3V8NnD0iEGm9QliCmQDsI/Pxhyhq3yODTSnk5wfWIqgPKvCTN+VlTBpElsvEAMz2FJi2b9SV1u3ve2EWaBPLeiKHAZpO9nM0lNAgS+ZASarmrVmdbTiwdI4ssr0CpcMBxLCL1I9U+lJyytMgQ+G0+IExTxsb8YVp/qmq88WCHrfugnmyl03xjkVU3jjq2hARvdXkPKjFWq1e0tm1Iz+EX8b4JKzWbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MT+5STeJfjlojTX9I4sYiq3h1trM+n2ZrtY5uWYRxwc=;
 b=A6Q2U00w/qCGsvc+rVIAoSCk/Uib46TYpb+jVXsrRTnbtso3qlSfBBJv0QniFeBw7Q+pa4xph23eKMKZW1yl39Tb2DZtCWB0Kh+BCA/kpT1D0umeZiMt66l5Z1J4uoCfQewfpp1Q9I43iFjvdLRgF+XL0f3bRMlNTOX4Ec/+e7E9aMw+hfoByMQDzOCiDKgLgLyvRUsaOzvLR2N/i4PtTzb5oDwbC/IjUNNT3nRWlFONwOBRvsZR2GHJEF0Fxir9XUd6BkbyyswrlRyTAjz6VYlDLkgKlHpjf6wfG1RO22HtrrjNlzNxwJg9AHoMSi19/n0Pc+QG/JRAloRrHzQjLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MT+5STeJfjlojTX9I4sYiq3h1trM+n2ZrtY5uWYRxwc=;
 b=NaiL+LT0DXmpJzK3wGrafwZsqZMh2C6JZQHSq5rpq0VPwj30zy4ENyntpu1Z7+7PsxUI8zjYAaDwdo4y0OTxFB6lHG1xTgkt8tfceepS78vjslgzYwNkIt+KdNB17UjV0gqs4EoAiVJ7oiCmEfA+sR17pTKWoF7pOe2a3e7qYCE=
Received: from BL0PR12MB4882.namprd12.prod.outlook.com (2603:10b6:208:1c3::10)
 by IA0PR12MB8645.namprd12.prod.outlook.com (2603:10b6:208:48f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Tue, 16 Jul
 2024 06:04:52 +0000
Received: from BL0PR12MB4882.namprd12.prod.outlook.com
 ([fe80::8e42:5bb3:95fc:7da1]) by BL0PR12MB4882.namprd12.prod.outlook.com
 ([fe80::8e42:5bb3:95fc:7da1%5]) with mapi id 15.20.7784.013; Tue, 16 Jul 2024
 06:04:52 +0000
From: "Ho, Tong" <tong.ho@amd.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "clg@kaod.org"
	<clg@kaod.org>
Subject: palmetto-SDR.bin for qemu ipmi-bmc-sim,sdrfile=
Thread-Topic: palmetto-SDR.bin for qemu ipmi-bmc-sim,sdrfile=
Thread-Index: AQHa10JlEyq8Wzb2N0GOSMDztbN1DQ==
Date: Tue, 16 Jul 2024 06:04:51 +0000
Message-ID:  <BL0PR12MB4882D5B995C2EA75D85D6E98E6A22@BL0PR12MB4882.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR12MB4882:EE_|IA0PR12MB8645:EE_
x-ms-office365-filtering-correlation-id: 03339b36-b5ce-4004-ca37-08dca55d34ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:  =?iso-8859-1?Q?sHtCIMftOjJvkAvQmuKmu6HB/FyREbjlTS7N97AgmCXCXKsUynQL1oWYgR?=
 =?iso-8859-1?Q?HFloQZd3CPgiYMw71PEGUUNH3qTpc1Aa1f3leoe/FYPBjF+Y739+IiUhh1?=
 =?iso-8859-1?Q?6C1wOxVlf8FCderAhq/cgOL6L/0x8oycbQ/IHLoMHWFWFr3J1Oru8qWo+o?=
 =?iso-8859-1?Q?uEGAa6IIGdhEnZpvRKqNGUUez4uqFW+eeGlrnpvotmmeejM9wh/kBswSD4?=
 =?iso-8859-1?Q?O0xDNNjHFaZ3mCvaqFOhAYJZ3yaDGAVCvXxr02Ho8A7cgVof9luXSQkA+O?=
 =?iso-8859-1?Q?1jfEbHxrpQkmtpn4h2lHvlPthiezaCssPM9VCqyTE2NKOMnhug8qGKB8ai?=
 =?iso-8859-1?Q?5zjzIli9hVXiAr0/3zOE5W8kCFSofHUINsiTHCT5HZ4Yxo5Mt95/MxXxkE?=
 =?iso-8859-1?Q?IM8SI4+FT5j0cvNVg2Bzh+B8NJS3ifhK8UUxNAm4e2wBE25PpUVCNGnhkT?=
 =?iso-8859-1?Q?jelJZ1l8kJWN1aAEZEymIY4ABC0Cfi3G82WpLEtEyAYirvAKGb6hoIRjZ/?=
 =?iso-8859-1?Q?Z0iceCA1s0Yz4CVhcuCEu3+UVIbgr7XNejOdebqVZdAjmYnWCZI4jbSeRw?=
 =?iso-8859-1?Q?tOAkKFcJovQHTTrKfCAVzCim+7ikafzknR8XA3FFbrF3Sv1CmSuGDDGVZt?=
 =?iso-8859-1?Q?O2cGTxgZdDicGFIDL6A2SFhrElZ8dYW6pDYjPpS+nC1iW3qWztzD8DuhZ9?=
 =?iso-8859-1?Q?ai2asnSZxYWS7rynp9Lk5IYpULDKnikoBywtl6o4afIBmUiGTzfDmqdltS?=
 =?iso-8859-1?Q?cOka55zk2BUNxenjjnqRKG5JeAg0f/7NakKTmh0oG6gnEbQoWMBPGvgaDH?=
 =?iso-8859-1?Q?pBGiKRW6VNf1h88lRV6xgqbY9t66n03Y0XCBq6x7fhJ5D4TYFynMMlkTVw?=
 =?iso-8859-1?Q?H2WXn7wrZiYC9TrCEIgcI2JnTVAn6mW3s9ONKpMffwIJwaI29OHrjUPq0J?=
 =?iso-8859-1?Q?FTq/k6Oxqo/3tgfkB8++QtZ9NmIJ69S/HZFm3lF2Gza0emAnz2i3riKRD4?=
 =?iso-8859-1?Q?ONJ+s0zpqFnO9+AM5PQHJw2ryVbchtLRJbuLhjZnpNc+FI1I+Q0XnS2V8u?=
 =?iso-8859-1?Q?dHB7upjid5SikHIryWM0t3xu9Yo6S/UtoWuliNPd3aTn1/LEjZ0f5jD53L?=
 =?iso-8859-1?Q?/wmFpWSbYGdqfsHPT2Tm6S0AVMSAMFenExv0ZM/M9Gi3RCJU2XehMjKGlD?=
 =?iso-8859-1?Q?x2QsL9eaeitH5ulpQjijdafsY/jSb2RGDUZ4uR6BfuJSEe8fTgBahqrR9P?=
 =?iso-8859-1?Q?TvVghaFAE2So0/WvC+sD2Pb5SR4ymSyrvVAmbegynItbT7imerxGeIxD2I?=
 =?iso-8859-1?Q?cqD3wJyGhzC6lclpCA4ByIOheW/CAHgj9CEIvszLOmWhyzED41HsSwupO+?=
 =?iso-8859-1?Q?jZIaAfcru7FFRxmiCfKzC7bkKjYbDYmZoqNpaw+1w5qQoDC25vTmA=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4882.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?g4DI1Ler/P5vKEGY/Aayirm/Q2/ArGK6eIYWX0P6WfgeChbL2Ea5o3f3dD?=
 =?iso-8859-1?Q?6VbRL/rYIjm2z4eTyj1n8STjWn78D0xTSCBMtsOQsgr6O/RnsnJ+jl620k?=
 =?iso-8859-1?Q?uonUG/VSsLK+/yADdixXQb2Y+SnLNR3O9t0ajJN+I7Ya1XpmyL31a01Oe1?=
 =?iso-8859-1?Q?00A3JVHQN8YUeBLwUo49vqgYRSm1ENyvzK4s5R4wGXeHb5Y1ASFuhdRkqR?=
 =?iso-8859-1?Q?trNCN/pVIe82Wv8HLd3uABrEoU/DP8r5jWcAd1IGUvTrpcA3Of8kIkvS/z?=
 =?iso-8859-1?Q?mvO2liI5Ln1SjyF3hY9T5+pVd8UceinQCZcJ/bIbmHf2GQHAA+ejwHG4FQ?=
 =?iso-8859-1?Q?+TXdduJgujZZ6zdp1BUGqMSO1RAxkEYjicPbHvLqUfPw0uClW+yOaSHKEx?=
 =?iso-8859-1?Q?cbDLf2XvakY4AbbOGmERWdhJiOFRMM75wLHpzzi8+82Wzl0OOiq9E/3AZE?=
 =?iso-8859-1?Q?Jcd9KvA2bSwqZdOiI3r+JG46W9VyWzTZsQMLOc22PYO9SNbmwGuSmM7qh6?=
 =?iso-8859-1?Q?54hMTAEADdTRSRptI/fNXBvpCKbC5SOuKe+Se6P9IjjjLkgQmX94jlEtjp?=
 =?iso-8859-1?Q?NMJj6X9g4FYN7kHbQ1QLr5UWj87w/76D9WBOcTEF3GMJ9s/nH0tqQFVgWu?=
 =?iso-8859-1?Q?A0LFRF3yhlCK2fs/Ls9eRiB+n/LXD0eRdOeuHnL62w7pYTKe/CJHCc2cVN?=
 =?iso-8859-1?Q?hoFpP/N5l+gNfIV6zSc9iUv30os0Gy9HGrQERYgxDFhGFyWvEdDGbujXX2?=
 =?iso-8859-1?Q?HK7VS+q9ibb8Ycs6dQ2ESs9SEbdYhH+tEMm+m4NqtJ0RNyBUTlm8xRHS8v?=
 =?iso-8859-1?Q?svUE4XQMkHtW5cDtnFdX5oZLYQ0d11lOdxb5CRfyrBaIn+fT+8xpI5m6Ph?=
 =?iso-8859-1?Q?LOxO89hCOM1xRhxV1bK0CI2jKugU+qyRnId9hyCj9X4LYBOfBAtM65ROWH?=
 =?iso-8859-1?Q?rxfCjUoxkNSRsZeh8ikxTYv9rX5ews71sIenL4Y2cajHwe1qR4fLEaiV6k?=
 =?iso-8859-1?Q?tlD85jAPofDN+Jgjt4965QuBNyFso2bYbbi8vSLbTxjFFqKTJCqkeXKFaq?=
 =?iso-8859-1?Q?fWb6QnlBBEX4DUIMGVZlQHTLcdpIB99M7+XlYrOPU1V0UtzEHLgJLUYS4k?=
 =?iso-8859-1?Q?HX+0Gzvzaqg8EonwCdqh4WTJKkN8kiCmL4HCi3V8odmGqKiw2GL4aDYFxl?=
 =?iso-8859-1?Q?jMDGffZXkuy+0h2KxV1WTGT/ojWooKF1CHEscTqZ8dgEk0q2bkoBTyXVXM?=
 =?iso-8859-1?Q?LY4qL/v5qwCpw19OI4Uo8XCOOdFTYyncpVJHcgcUorhfJcczvy3NG1+u1F?=
 =?iso-8859-1?Q?pQsUYagBTAUfcHkd8hhUxZZJ5p6dMH2tTIhy7ArEM5FwVRGf2ZeFy70no2?=
 =?iso-8859-1?Q?5DE6QSJCMtdCm6DQ8Zw7r2pLDW9f6NVCQsqLbooaw0tmy+d3dRirNEEu3p?=
 =?iso-8859-1?Q?gMerfzdxEyS20io3PzU3pfXBHYOtD1o9FVfDbW4DzOzNL+vOIUB53qfjcN?=
 =?iso-8859-1?Q?zYbLOADhNIlJ0/v9Y4GhQJDUUiIAwbzVf6DHbNwRaBEyBRZx/+eWicGH3l?=
 =?iso-8859-1?Q?8uPUjzwO8sLa4C0uf2H08iWJyt4ijNPkGpErxqa1T1LlNMmIIBrJ9CsScH?=
 =?iso-8859-1?Q?JgoAagFATx9Ik=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BL0PR12MB4882D5B995C2EA75D85D6E98E6A22BL0PR12MB4882namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4882.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03339b36-b5ce-4004-ca37-08dca55d34ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2024 06:04:51.9121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZAsJeRBfVjADSbsh7VVS2++uhB6Sr4PcNGnK4dgWIZFj8bknwR6qJz8mJLfbVDjA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8645
X-Mailman-Approved-At: Wed, 17 Jul 2024 11:29:09 +1000
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

--_000_BL0PR12MB4882D5B995C2EA75D85D6E98E6A22BL0PR12MB4882namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi C=E9dric,

Do you know of a tool to generate a file like http://www.kaod.org/qemu/powe=
rnv/palmetto-SDR.bin
for given to QEMU's ipmi-bmc-sim device via the 'sdrfile' property?

I tried https://github.com/wrouesnel/openipmi/blob/master/lanserv/sdrcomp/s=
drcomp.c,
which outputs a text file that bears no resemblance to palmetto-SDR.bin.

Thanks in advance,
Tong Ho


--_000_BL0PR12MB4882D5B995C2EA75D85D6E98E6A22BL0PR12MB4882namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi C=E9dric,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Do you know of a tool to generate a file like <a href=3D"http://www.kaod.or=
g/qemu/powernv/palmetto-SDR.bin" id=3D"LPlnk597885" class=3D"OWAAutoLink">
http://www.kaod.org/qemu/powernv/palmetto-SDR.bin</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
for given to QEMU's ipmi-bmc-sim device via the 'sdrfile' property?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I tried <a href=3D"https://github.com/wrouesnel/openipmi/blob/master/lanser=
v/sdrcomp/sdrcomp.c" id=3D"LPlnk" class=3D"OWAAutoLink">
https://github.com/wrouesnel/openipmi/blob/master/lanserv/sdrcomp/sdrcomp.c=
</a>,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
which outputs&nbsp;a text file that bears no resemblance&nbsp;to palmetto-S=
DR.bin.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks in advance,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Tong Ho</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_BL0PR12MB4882D5B995C2EA75D85D6E98E6A22BL0PR12MB4882namp_--
