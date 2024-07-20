Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8891B93808A
	for <lists+openbmc@lfdr.de>; Sat, 20 Jul 2024 11:53:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ltts.com header.i=@ltts.com header.a=rsa-sha256 header.s=selector2 header.b=nBiGPmNL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WR21K3VMdz3bbW
	for <lists+openbmc@lfdr.de>; Sat, 20 Jul 2024 19:53:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=Ltts.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ltts.com header.i=@ltts.com header.a=rsa-sha256 header.s=selector2 header.b=nBiGPmNL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ltts.com (client-ip=2a01:111:f403:c408::3; helo=pnzpr01cu001.outbound.protection.outlook.com; envelope-from=bala.subramaniyan@ltts.com; receiver=lists.ozlabs.org)
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c408::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WR20l4YNBz30fp
	for <openbmc@lists.ozlabs.org>; Sat, 20 Jul 2024 19:53:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6b27S/X2ozS7Mus+LFZTxnGZnduQJONJdXh3pkPwzI757cKQSKy+4PB4XXg4U5Zy1VLjI0w5aQXR5MtNbTLw6qpslmsbVaXBGF/KMpB3V61KMmweofL1mYKcwZdXwHYg2BEpfpR/OUs6klxeCUVvlVVnYpSSHnAhC3S8ybFTwaGty4o5tSvaO0aP6FUkSIidrDjyW9AKGN5n6aggp1mJjNYYRJSW1FQxR0YR3qC4k1g5W16h/3SzzM0SdLm+DFRWMU4iGMk31AYqIhDjrogaVPCvhamAhkwDklmy39jBkGPvRDu9859NmKhlFFHq/8OWNjHbiaq0WP1U+wpdA9RYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7z1IVVw228ITq96JOmhs+3bXSDhFEOMx5XkZPXlgCKQ=;
 b=VtPfzPGImnbhPQKyl7I70OvUuklCtfInhKFMo1cSma9KG+s2XFIQCX/4FwtgDbhrk+lPjCvujYSbKCZJI4ACf335CiQbk6AAUX7OD+rLe1pRUkkdNBRvIx01xI8XW9pDFJ68ZqWDaNvyfjQx8or71m5VNe9K2Tr6seDH7hOOpemWU8Zb0Sx/ruOsY3yIYS/T+fyzR3GpRu3yWSVb3lmC1MK0JrKn0W1V03kaAHB2BlI9VNJdw/jdl6JZH/l0+3amASu1NAWyGYfbSsN+Ztc7AyHRBsPX9K21sIKRPq5bmU2USjAssNjgSSWBvpgE8rfwbig4yNNuQtYisdn0Do4/+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ltts.com; dmarc=pass action=none header.from=ltts.com;
 dkim=pass header.d=ltts.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ltts.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7z1IVVw228ITq96JOmhs+3bXSDhFEOMx5XkZPXlgCKQ=;
 b=nBiGPmNLWVBQyzcjmdHo0huXb7GHrPRhct2qD/IsOsP2rreF6BrOYMJzVD6A8GY6TlO93qR0oCAECXMy7cHQhGQryhSnTnXhNnGwURXURGmP/H3G3ENz7usJvJ14gIXMyS0ljkaJH4IigVcayfmKMLpeGQFc7v+IrV22jQFaGN8vpXpmbS9ZKPJNjTmh4Jodi0TexmAJ83KMcCEL0y8Js4YbU/iq+NTBbTu4uiykEbBVA2wTG/rF9uISxwYYL5hqahc2G+k4F9fZiecikAC7WzEvJs+DW4cyc0JPthg8Dq97jlaVjL6tPBc43DLpRUlTjA8NJOaulmTM62LjgvbpMg==
Received: from MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:17::13)
 by MA0PR01MB10381.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:129::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Sat, 20 Jul
 2024 09:52:42 +0000
Received: from MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::260a:a479:6e10:ae9a]) by MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::260a:a479:6e10:ae9a%4]) with mapi id 15.20.7784.017; Sat, 20 Jul 2024
 09:52:42 +0000
From: Bala Subramaniyan <Bala.Subramaniyan@Ltts.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Help with GPIO event in SEL
Thread-Topic: Help with GPIO event in SEL
Thread-Index: AQHa2om+r3I5IxjHW0WgfnnHQhpRmA==
Date: Sat, 20 Jul 2024 09:52:42 +0000
Message-ID:  <MA1PR01MB43083D43E820E2980F2102C880AE2@MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Ltts.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA1PR01MB4308:EE_|MA0PR01MB10381:EE_
x-ms-office365-filtering-correlation-id: f6720cb8-5817-40ba-3e3a-08dca8a1b31c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:  =?iso-8859-1?Q?fqTOdBOnhkDjWfGgZSGzXECTt3Bekjd5+KGLdT1eeuFIN4Cf1hoAKS7tWg?=
 =?iso-8859-1?Q?xabq512aYogMhjBwqFvWJYP2drY+bIUm5XApOAQG9DCqTSc0Z7TpayJ/PM?=
 =?iso-8859-1?Q?0TrAGDIK9o97zU17VCTs8dZ0BFgZuMNdx+KDWH4lXmowGl1Q/7UGYZpebm?=
 =?iso-8859-1?Q?fauxnA+nfNILGbZLGxDBilWufmQJTvKr4k8hyqHbODwA4zmFJX1CBtFW5P?=
 =?iso-8859-1?Q?Bv9pXCEfNxtK5aBewYITAZF+lXmHmgYqTjSF86vtv8kKmpoObddcCHkxA7?=
 =?iso-8859-1?Q?7aUOYfTGy3GE10JJLgb8P9wuXHxvdtQaqsPhy4thoQy4DieJN6/2e0fn2R?=
 =?iso-8859-1?Q?oFKTSBc3gz6jG8uTwBknfcrAu//lGDN9h7ntwmOVH8PPagygRnF9lzWane?=
 =?iso-8859-1?Q?I5eMxX1ry4/956p0u/zuS2rzb4mD1Ft64On4L5rRnTbcTYKrJC256+LeVb?=
 =?iso-8859-1?Q?aJiGZlONyRVPD2hFRW8qlblHU/9R+ob7YGLSSQiTGqIrsgD0rzLjpgx+oq?=
 =?iso-8859-1?Q?h+u1u7IC7a4EUcl6tlvWRpyqcr5qvT62Gd9eI/kNBzHw6A4AneYvsziiwQ?=
 =?iso-8859-1?Q?85swDFquKN/YN7pbFCd8Jtf+LelCa8f71Y39qPQEk7ekcFrb2jQzGj3k/E?=
 =?iso-8859-1?Q?qs3BmzlwaIpTWQA00B0/bs7skTN0f1sB4PveajfeaMnrr0ZC5J5rJChSrg?=
 =?iso-8859-1?Q?nVX/aYaOhsmf2RdXGHXR+mv/psVVsb+Q3kEZdXpLBoC1/3WMAeqOgXouKV?=
 =?iso-8859-1?Q?L/T4bQ0rTi6OFvte6elIX1iG4BL48S8+s7aeRTyr8NNOIkc9cTYYgETOFw?=
 =?iso-8859-1?Q?849GK+56OlQPrfZYsGe1TlwuaizU4ralEQTh/Y69lyjyRSjMJoR67pRset?=
 =?iso-8859-1?Q?a6RfLiroPtMS7JIhkH2XrsgeGoht3zge8psMhEbqXwf1WKlI35e1THx716?=
 =?iso-8859-1?Q?oUDlFB0vgKYJe7cLtUzqcf+a1jNRbNbNhQdsDwUY4+xFh/nVUQG2lS1TFJ?=
 =?iso-8859-1?Q?EmKSf6vmweY/CbfYWxznwdIQvS4/Kq77Vg+Gt9ii4VEHxY66iQWk9gHmTc?=
 =?iso-8859-1?Q?rncgmWkFz0kwwL8/7lHNHN59oJZ2xRBa8EuunDzC+q3fvHO/yefEwVU7qK?=
 =?iso-8859-1?Q?nwlgor5h8k3AMNBSPjcNgVreA2UfPgvOSf6Uqk8wK486ZA7Deq7Q1MXD0l?=
 =?iso-8859-1?Q?4ydpxyRpepdnfdqDp+ORKQ1p5G6SWbiFJ7dyEIXFJ847J4Ozcic8aLBp5r?=
 =?iso-8859-1?Q?BQUv/jI521mTTAmeA5p7I3okGMaw9x5npwm1VuUId0UBFWNvx74S7cvqY2?=
 =?iso-8859-1?Q?t2xhdEkWb9qynmZd3UIbcIId+gFRMsWeDJZ1Y0IT3vEBz43reYSgIMcn2G?=
 =?iso-8859-1?Q?2nV3vmDUPKAIs1/u5/e2c5EGXyMxWykw=3D=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?Ttc1gVOftORUCISatlrhEoUd6yvleeUVAVn4GeijxlFQh6kHRgMawr1oAT?=
 =?iso-8859-1?Q?Rz8ctaN2lItIXKtyEL05cUd4nT+qVgy0v6/44u713OQpokAVBN0cBcpYhF?=
 =?iso-8859-1?Q?f4yqGGVXalweVqm3a6FYUfAlAx1/+/MJDUpCYR/GwqU/bIHvFD5x52e6xi?=
 =?iso-8859-1?Q?Cp2Mcb6spbKNgsh/GiFcAM+5HqfgCm8J9cn95fcY0LzH80zMHmIsZscuNW?=
 =?iso-8859-1?Q?AhUl8K41S6ogWhI6+nE5bLbJHbYub4vKS/5puRp6IwMiXZk1VGdxoYj/s8?=
 =?iso-8859-1?Q?qfxXvMhzmEYMKvhdAAA5jy1nM7Fengglf0hlE+OGvX/LS6hmQaCryXnrh2?=
 =?iso-8859-1?Q?+9HdZlihJzYU33abRFDj63VJFWufqPdEhHFTMcLpCAG8o+7NZOptaHsuiA?=
 =?iso-8859-1?Q?jggksRS9dYdmhZl6jFGOCDm+dlbfwRXfZ+5DYFICgdpVXP4e5awHTIznKa?=
 =?iso-8859-1?Q?J+NkkZ4aOAb1WJRC9sMtLVm4efqww58n/ibLohSZbqBrlyx2CPsooNYVf2?=
 =?iso-8859-1?Q?CmtBt0llqDGYBvCctMK5eWJbMPNCw3ZNGMCBv+WGc+ya++eDvbYmRx7fan?=
 =?iso-8859-1?Q?qZM25fSeqgyNCxLp8pqQamI5walCEcYlBsfDjya9CvJWxs09e5eNQ0F/Mg?=
 =?iso-8859-1?Q?cKJUk9flR5mQ3E7a9uzBxRgNJncsCwe9zyHxGBoCepwl0U3H8jVd8KnPYr?=
 =?iso-8859-1?Q?ug4Q5vvbk/Sp8cknJQLY79v8GmxsQ5oNc7H95wDJGpW59XK8QmhsCBBYP6?=
 =?iso-8859-1?Q?L7BAdc/b6a8PfC4ShigltnmWuBrhaM8OCeGMY4MCbzyu+fSfgucRjDKMl5?=
 =?iso-8859-1?Q?UUC17dtuSfdyEo+myMbAwe4BOrS6efUMqO4274+BtHXye5YuqFRSPnh9+R?=
 =?iso-8859-1?Q?v6SdGSXYxgaYMM78MwcuJcmwuNL3nke/V1duC95+9MgaWzvHs2RNGEmMVJ?=
 =?iso-8859-1?Q?cMgtZwjb6V48GMfIE+rNHYnvFHYznSkT3MMnNd3TziVe1DumHr1jUa+pcv?=
 =?iso-8859-1?Q?n/RI35pugzop7AbaThuKqcdAEMNpahmEIjD+0op40ynYxpxoLXqeuLAF+P?=
 =?iso-8859-1?Q?cPIN/xJVz1acWLG/ZxGrBoF8Ox4eZ//CrYKAYxeRfxpkOsWvqOROfhhcWW?=
 =?iso-8859-1?Q?kFQG6xJ5fiieXyubUMx0piIzpyxWUH/OtSHoydkSoAHXAQ+GXv19OGW8wx?=
 =?iso-8859-1?Q?gvdi8I/WLofLqrkeMYYuILypvSgx7IYpk5K1fscHMqoS7NIrheXy+q0ylM?=
 =?iso-8859-1?Q?x4UXWeXpD351I5yLy2eH20EH5hDVYE5NIVZl7ZI3EJLjul7rmrTfopSdi8?=
 =?iso-8859-1?Q?EOF0kyx77tUHF/V3+rkBy4WUKYE0qqMjdlOMsgcu70gl6u/B4pk8yD3VN3?=
 =?iso-8859-1?Q?Qc8aib5uGpoWuYzjhfagvKSFRysFaagupix8IDzX3oxSBMaBu73cVjk+sw?=
 =?iso-8859-1?Q?/V3U+WzX59cyb9j64k/kwPwb9L4q7LUScP/tZL/hqr6eEE6L8Z21daRoeW?=
 =?iso-8859-1?Q?nGfCQ7X/f7QKy0ItlMz8+bGTpfj/Pby052lRTQ07om+TVQEbiTdWXp0WDU?=
 =?iso-8859-1?Q?tgb7MweK3nY00DJTCID2OReU4KsI+vTUgrxjY/z+GCjPEs/oJcqRkMaaaQ?=
 =?iso-8859-1?Q?Ku4yHVUiSDUvcdInrS9MqEKaijJoDh63B+?=
Content-Type: multipart/related;
	boundary="_006_MA1PR01MB43083D43E820E2980F2102C880AE2MA1PR01MB4308INDP_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: ltts.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4308.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f6720cb8-5817-40ba-3e3a-08dca8a1b31c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2024 09:52:42.7578
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 311b3378-8e8a-4b5e-a33f-e80a3d8ba60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qh++bgylWKxMaOn6+KVBoHyzlHp/2RKoPzvFXd/wV8GoY0fQQEnpOOCrchk0x1hdY++aVISVyQcLoTr7YiJIKNPhVkOJ1I1N6CDzjorRd10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10381
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

--_006_MA1PR01MB43083D43E820E2980F2102C880AE2MA1PR01MB4308INDP_
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB43083D43E820E2980F2102C880AE2MA1PR01MB4308INDP_"

--_000_MA1PR01MB43083D43E820E2980F2102C880AE2MA1PR01MB4308INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm currently working with Hard and Software Tamper events where i need to =
log the GPIO events to SEL in both IPMI and REDFISH.

I have configured Temperature, Fan, PWM and ADC to SEL through Entity Manag=
er and by creating IPMI and REDFISH template in rsyslog.

Kindly guide me in logging GPIO events to SEL.



Thanks, and regards,
Bala Subramaniyan M,



[cid:285d7ab5-61e7-4a7b-a910-782b72536243]<https://www.ltts.com/>


S1 Building, L&T Tech Park, Bellary Road,

Next to Raintree Boulevard, Park View Layout,

Byatarayanapura, Bengaluru-560092

Mobile: +91 9677035467

ENGINEERING THE CHANGE | www.LTTS.com<https://www.ltts.com/>



L&T Technology Services Ltd

www.LTTS.com

L&T Technology Services Limited (LTTS) is committed to safeguard your priva=
cy. Read the appropriate privacy notice<https://www.ltts.com/privacy-polici=
es-notices> applicable to you to know more about how LTTS collects, uses an=
d stores your personal data. Please visit our privacy policy<https://www.lt=
ts.com/data-privacy-policy> available on our website www.Ltts.com for more =
information about our commitment towards data privacy under applicable data=
 protection laws. This email may contain confidential or privileged informa=
tion for the intended recipient(s). If you are not the intended recipient, =
please do not use or disseminate the information, notify the sender and del=
ete it from your system.

--_000_MA1PR01MB43083D43E820E2980F2102C880AE2MA1PR01MB4308INDP_
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
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi all,</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
I'm currently working with Hard and Software Tamper events where i need to =
log the GPIO events to SEL in both IPMI and REDFISH.<br>
<br>
I have configured Temperature, Fan, PWM and ADC to SEL through Entity Manag=
er and by creating IPMI and REDFISH template in rsyslog.<br>
<br>
Kindly guide me in logging GPIO events to SEL.</div>
<div class=3D"elementToProof" style=3D"font-family: Arial, Helvetica, sans-=
serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>Thanks, and regards,</b></div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<b>Bala Subramaniyan M,</b></div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<span><img id=3D"Picture_x0020_12" width=3D"330" height=3D"2" style=3D"widt=
h: 330px; height: 2px; max-width: 728px; margin-top: 0px; margin-bottom: 0p=
x;" data-outlook-trace=3D"F:1|T:1" src=3D"cid:31a37079-6548-4711-acab-168aa=
b0463e3"></span></div>
<p><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);"><br>
</span></p>
<p><span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12p=
t; color: rgb(0, 0, 0);"><a href=3D"https://www.ltts.com/" style=3D"color: =
rgb(0, 0, 0); margin-top: 0px; margin-bottom: 0px;"><img id=3D"Graphic_x002=
0_2" width=3D"249" height=3D"38" style=3D"width: 249px; height: 38px; max-w=
idth: 728px; margin-top: 0px; margin-bottom: 0px;" data-outlook-trace=3D"F:=
1|T:1" src=3D"cid:285d7ab5-61e7-4a7b-a910-782b72536243"></a></span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;"><b=
r>
</span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;">S1=
 Building, L&amp;T Tech Park, Bellary Road,
</span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;">Ne=
xt to Raintree Boulevard, Park View Layout,
</span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;">By=
atarayanapura, Bengaluru-560092</span></p>
<p style=3D"line-height: 115%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 115%;">Mo=
bile: +91 9677035467</span></p>
<p style=3D"line-height: 150%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(13, 13, 13); line-height: 150%;"=
>ENGINEERING<b> THE CHANGE</b></span><span style=3D"font-family: Arial, Hel=
vetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); line-height: 150%=
;">
 | </span><span style=3D"font-family: Arial, Helvetica, sans-serif; font-si=
ze: 12pt; color: rgb(13, 13, 13); line-height: 150%;"><a href=3D"https://ww=
w.ltts.com/" style=3D"color: rgb(13, 13, 13); margin-top: 0px; margin-botto=
m: 0px;">www.LTTS.com</a></span></p>
<p style=3D"line-height: 150%;"><span style=3D"font-family: Arial, Helvetic=
a, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);"><img id=3D"Picture_x0=
020_12" width=3D"330" height=3D"2" style=3D"width: 330px; height: 2px; max-=
width: 728px; margin-top: 0px; margin-bottom: 0px;" data-outlook-trace=3D"F=
:1|T:1" src=3D"cid:36b806f4-3dd2-47c2-b79a-eb67e59ab6e1"></span></p>
</div>
<p><strong>L&amp;T Technology Services Ltd</strong></p>
<p><a href=3D"" http:=3D"" www.LTTS.com=3D"" ??=3D"" target=3D"" _blank??=
=3D"">www.LTTS.com</a></p>
<p>L&amp;T Technology Services Limited (LTTS) is committed to safeguard you=
r privacy. Read the appropriate
<a href=3D"https://www.ltts.com/privacy-policies-notices" target=3D"_blank"=
>privacy notice</a> applicable to you to know more about how LTTS collects,=
 uses and stores your personal data. Please visit our
<a href=3D"https://www.ltts.com/data-privacy-policy" target=3D"_blank">priv=
acy policy</a> available on our website www.Ltts.com for more information a=
bout our commitment towards data privacy under applicable data protection l=
aws. This email may contain confidential
 or privileged information for the intended recipient(s). If you are not th=
e intended recipient, please do not use or disseminate the information, not=
ify the sender and delete it from your system.</p>
</body>
</html>

--_000_MA1PR01MB43083D43E820E2980F2102C880AE2MA1PR01MB4308INDP_--

--_006_MA1PR01MB43083D43E820E2980F2102C880AE2MA1PR01MB4308INDP_
Content-Type: image/png; name="Outlook-oi32wnzn.png"
Content-Description: Outlook-oi32wnzn.png
Content-Disposition: inline; filename="Outlook-oi32wnzn.png"; size=99;
	creation-date="Sat, 20 Jul 2024 09:52:42 GMT";
	modification-date="Sat, 20 Jul 2024 09:52:42 GMT"
Content-ID: <31a37079-6548-4711-acab-168aab0463e3>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAUoAAAACCAYAAAA+VZWwAAAAKklEQVRIS+3QAQEAAAQAIPY55jUL
WFATysCAAQMG3oGM6nFkwIABA/fAAnjMAdUWFbQgAAAAAElFTkSuQmCC

--_006_MA1PR01MB43083D43E820E2980F2102C880AE2MA1PR01MB4308INDP_
Content-Type: image/png; name="Outlook-b5skdefk.png"
Content-Description: Outlook-b5skdefk.png
Content-Disposition: inline; filename="Outlook-b5skdefk.png"; size=5482;
	creation-date="Sat, 20 Jul 2024 09:52:42 GMT";
	modification-date="Sat, 20 Jul 2024 09:52:42 GMT"
Content-ID: <285d7ab5-61e7-4a7b-a910-782b72536243>
Content-Transfer-Encoding: base64

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
AABJRU5ErkJggg==

--_006_MA1PR01MB43083D43E820E2980F2102C880AE2MA1PR01MB4308INDP_
Content-Type: image/png; name="Outlook-wgkz5jdr.png"
Content-Description: Outlook-wgkz5jdr.png
Content-Disposition: inline; filename="Outlook-wgkz5jdr.png"; size=99;
	creation-date="Sat, 20 Jul 2024 09:52:42 GMT";
	modification-date="Sat, 20 Jul 2024 09:52:42 GMT"
Content-ID: <36b806f4-3dd2-47c2-b79a-eb67e59ab6e1>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAUoAAAACCAYAAAA+VZWwAAAAKklEQVRIS+3QAQEAAAQAIPY55jUL
WFATysCAAQMG3oGM6nFkwIABA/fAAnjMAdUWFbQgAAAAAElFTkSuQmCC

--_006_MA1PR01MB43083D43E820E2980F2102C880AE2MA1PR01MB4308INDP_--
