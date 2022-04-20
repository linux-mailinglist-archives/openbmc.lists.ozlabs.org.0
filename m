Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C14507E30
	for <lists+openbmc@lfdr.de>; Wed, 20 Apr 2022 03:34:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjjrJ2ZJDz2ypD
	for <lists+openbmc@lfdr.de>; Wed, 20 Apr 2022 11:34:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=j44O+BF/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::71c;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=howard_chiu@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=j44O+BF/; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::71c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kjjqm6Qn5z2xnS
 for <openbmc@lists.ozlabs.org>; Wed, 20 Apr 2022 11:33:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loruvK6qb/3wqNp+89wxpvkjzP5WoOc5KVYaHa8BglwhTpY2uNJl+5jqgawAmYj7l4GDnki6/NgXdWgeda+KSgILaPlYZiKXxFSP0hu0SCGZBQIKUcZzL1Q7S5rOQ8bQ7JvVz80KVT0IMpV5uCIu4AtFfx9OSd2cSX3FP27dvl7pvec8GtEmPp3XMsEqNpLPGJd+LhDmezbB7NN/X4AFwuZLhPbatYp1l6TTsS1xk8/oY6Skut+JMgRlEKarWREOI4/9fZVi1bXQUwGVGInWB9su1vZwxet6UhpR7BpjZarW6BbdTPhN+COEWJfiNd9kJwsmFNA/ypPz2+iWXu3J4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZlKBiAyw3Z6cSRsjbtYZz4ebV9x9AuBQOxBVpufaxU=;
 b=HMzmZL855JwGUo5FZ7M8J5Ox98GybzUeddp/6i6K8gHMcGsc74e+ylM028kMKq6Kku4vQUfllKglwsLCTkVLSxgiKftibNb0rnYVe003gPe8mtJMy7RKCoDopshsJWDJrV1k0ML2ydZ948NAIZJngQDCQC2rkX/h1nQ9AhhDr5OzpiyebgSHRgK23MAekHzVsENv2pShZHxYB7SqA23d3fDYAGf5HOIS5iyyQg0hu9vMN811gGbUuo5t4IAMKpwlx/42670YT56HmLfUWEA0TdpnL4QkWsYnj2Zs1DLwJetRNl6AuZUe2bpUKxMUSuYD1jQph8g+Emwn7pPJBGptdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZlKBiAyw3Z6cSRsjbtYZz4ebV9x9AuBQOxBVpufaxU=;
 b=j44O+BF/7Xia7krB85XPqPKxS8vQW2vnYj0hdd13D491q1J+ZhC3dr/VtHXBAdfFOImrDlI24QZX27Zr2Gg7ZkuAH3lf3qBL7d+wpQcnW6DNUAQjhCfoqzoqaGbtb2e3jq9WlTiYlJbAw0SvpGyxQ3XZeTun3p0psxSrB00y3GD9oEF/c8EKvupvOBkZGNEip1PF6cIOaO3x5AbwSJ6zRYSndhI4DI50ZzOpTsu72WONcuxa6UBvZiOD/dWCAXyC7utBxRjvOB42xGNXyxpKhqY1LU7nIVpBov9VyXcqwykTpcCaXamQl4d/TeHPpZvult3mmzL0VYr8gTCxMhY9kw==
Received: from SG2PR06MB2315.apcprd06.prod.outlook.com (2603:1096:4:b::19) by
 HK0PR06MB2722.apcprd06.prod.outlook.com (2603:1096:203:56::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.18; Wed, 20 Apr 2022 01:33:17 +0000
Received: from SG2PR06MB2315.apcprd06.prod.outlook.com
 ([fe80::152b:b69a:a1da:f9ba]) by SG2PR06MB2315.apcprd06.prod.outlook.com
 ([fe80::152b:b69a:a1da:f9ba%7]) with mapi id 15.20.5164.025; Wed, 20 Apr 2022
 01:33:17 +0000
From: Howard Chiu <howard_chiu@aspeedtech.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Solutions to fix the problem which u-boot failed to load the kernel
 on ast2500 EVB
Thread-Topic: Solutions to fix the problem which u-boot failed to load the
 kernel on ast2500 EVB
Thread-Index: AdhJelnBj18fTaW0QrmsRhKfOVz6ewBjy+lwAlNACOA=
Date: Wed, 20 Apr 2022 01:33:17 +0000
Message-ID: <SG2PR06MB231570CFF1243CBE04575C34E6F59@SG2PR06MB2315.apcprd06.prod.outlook.com>
References: <SG2PR06MB231524FAA84DE1162B97C6F4E6E79@SG2PR06MB2315.apcprd06.prod.outlook.com>
 <SG2PR06MB23151EF8DA561670CE6D9787E6E99@SG2PR06MB2315.apcprd06.prod.outlook.com>
In-Reply-To: <SG2PR06MB23151EF8DA561670CE6D9787E6E99@SG2PR06MB2315.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62d46a7c-308e-45f7-db3d-08da226dbeb9
x-ms-traffictypediagnostic: HK0PR06MB2722:EE_
x-microsoft-antispam-prvs: <HK0PR06MB2722E6399DBB9483170765D9E6F59@HK0PR06MB2722.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gqkLME29DSylfc7bTPptVA7JzGaw5boYIzyIFgV2iUziV95qHXXNBw83/M9jI6F1+klpPaooiM2aEjaGlmXazbPYu6soOtWL+P869Aj7vHoJnDlgt8uGe7AgpPf/QWnd8fuLGI8ljDs7sz85Rs/AVmWD/1wWE4X6aUgb8A/fHnLZHWF4mTGSCe1pDpKYGMDuf1JuF0nDY+q8bb+/PnQnCoN457YUDiFLg41mWii9spoRxps8Dt6PGEFH7Fu/Y23J6eohiPKXuCmKt2EDSdY1X7sTmx7quOFAlryYxdxTg5YF+pjZHJvHE0NLI1OLBml5fVu+WtWpb/0E6ibTDl/mSavQbaQQ30VUD/Gu07tpTAEhqHTRqffYn7iM9zgBrO0pTOlvpHHH7y4hVeYr3JSOP7IkiyNgWx2JogP+rkBW91Kxf2S2ccQdSyzeh5eF8LL4gCzUOCDc6giE1wBHGiqfubytygq//So2pJV5hsJVY2QnEoqRWB2BCvqEo+y6VgCk1/hPFbxqs26YRZBqnjrQ9jM/asJlFM3iFMi06nUgHfsAtrOGGyAob2w8QE6JmSTGr47lQyKWTzH/gaDFKN+/vxGsFXbK5iHQKjLxIfDB1hTp1wMfP5/fMbvujw/x2+G8MWgwRgW0x0t9DXgzX6G5QQvWBsle0/zpcxF+YMqOTQJKpYyHzs9hFylSXu82J7j0r8dI7c85W9ide7ZMlUHRq3dRPOkwpnODclldIThkPwf9S44Eer7p0iO8tQbp2VbYt2pGwJ9RdApJcUwLTkHgPdIGtXSdItZXnHRU4WTyKTXT1n2LkDPZqeysD9jFAL9C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB2315.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(346002)(366004)(186003)(6916009)(33656002)(66446008)(66556008)(66946007)(66476007)(7696005)(21615005)(38070700005)(52536014)(5660300002)(8936002)(38100700002)(166002)(76116006)(64756008)(2906002)(8676002)(55016003)(83380400001)(966005)(71200400001)(508600001)(9686003)(26005)(6506007)(122000001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mH8jftWHpzXbJeg5ZVBpQ2T4e4/zODhXxClXQofsKMmmmYCU8/NEpmGldrVI?=
 =?us-ascii?Q?Ivadqr2TXayKPaNNyn/B7KoUspEA3/LFpXc88H1aEPjP2RJpRilKHJfSo/Wu?=
 =?us-ascii?Q?isNXE51NBeRGfHQjr4liQ3PWBcWQX7eN9e77kV2ZDWoQqLPrIBQnPF+aeIj8?=
 =?us-ascii?Q?JPYVM0XiAHokkm7cUHhwA/L1c3JFgNPIFI7LAvSgH7lW4sPjv5JXKYS8jgLq?=
 =?us-ascii?Q?/4v5afPX4oPCZ69221rFyf+nS71a90rM56YKOz8SF6PNMRHLk0KFQ/KNrI4l?=
 =?us-ascii?Q?H0oPNBfYJ15jQcjP7sM+hPh9oP9VT3NGtPy3dQfww8QqugO5bYb1GslNaQxR?=
 =?us-ascii?Q?Vv4QnShYHAOV8i1sM277vv6WFTaSyR/R18GRgrKk4TdMqj9yLQwPLvdEfdjQ?=
 =?us-ascii?Q?E6UuF6uchkxavK/47lhQSRcsqXuD7Po4Gv3O+9BMUOebxRX123zVeBT/ntjB?=
 =?us-ascii?Q?oyG279HLQxPRqSC3SJqsnvJIGjk+r60uOCRHczSPvDz6zhQilzlFjxV7QrUe?=
 =?us-ascii?Q?qgGzmEVpGsszWtQcV6MAebZAhWgeA54DoSgR47ljRxYbhWT1Es3CLoQOrDVl?=
 =?us-ascii?Q?9o3OeqTIvM5E4ODWWD3rPa+6YD//kg5cgi0Qk5k65Imo4IPIh34j8CGXHMFM?=
 =?us-ascii?Q?3GPbw2yTQDw+eppbwmtYZynZaziWUK7/lCTPV9w3VmmFf1uMWFR3lRcgX7Z8?=
 =?us-ascii?Q?j6I3jD8pK6TWdRcVTiHWagefCsFg0gjNlMCJKmkma6gX7LCqfLrdymKONbb/?=
 =?us-ascii?Q?A+hSR7h6MUzVrOlF2NbdO3CymAKWxPDQt/ZTfcyilkqDF1LMu4s7uLvdSFBb?=
 =?us-ascii?Q?CgA4MTDlhVSk6DLC6AjZF/3AZYF0Byu7PA+pJojBio3WfgpNHVqGENywWYr0?=
 =?us-ascii?Q?p/SbJBw/yQxHebTeDR5pwcwD2rQ7db+6XMwFTjBb+OYWGSpmVmHjwlUc019B?=
 =?us-ascii?Q?JRxod1vMoV14c3W2B1kvXCL08S4T3R/ZteHbFZqQaNWJY+G7ff3TyMuYe3Xx?=
 =?us-ascii?Q?x8sN0DsMa+Hwuni+JFsjLMk/ZfaUXB3+x6rGVG+Pn+/uwGiYNXhExFsCya6b?=
 =?us-ascii?Q?9TPk5jPcglVIMRPp3wrU4fMY0fYJKisiru9vGXw2tkLOEss/pVLEcJF7ymRJ?=
 =?us-ascii?Q?xkXITWmGVJNFO/PbBLbPbX13ulKud13Wwl1tvNjbkHkrtCLGWPi8yl0zZxFn?=
 =?us-ascii?Q?V6/OHAaJ7X4oyi/tpaWt3d9T4/jJjHC9ldvPZIdDcm8N9wvQNGhi2y/mrFmo?=
 =?us-ascii?Q?DZbx3fRNkkMzihBkKYwxvuoutSHUxGTb2LbShPKRgS3GP8BV+Y4UFQOrkEog?=
 =?us-ascii?Q?2us0HsSlqnuC2hkn+4++lUpqjODHf6C5MVi+0WkxjVKbg0Cm+vg2bCT1CRTq?=
 =?us-ascii?Q?Myjsb6aom1z0L55tYEZW2XQUPHzrs0Lbz1KKmhlUPlxz7c5aQe0VWrrS073P?=
 =?us-ascii?Q?zDJLsG6MjP75xUO3lH9H+Yj/qH9/DYCfh4Aolqr+RF0fUnCykEPVPQFG6hHO?=
 =?us-ascii?Q?nhfv27vpW05rTh5hh0fvheqdjVuIhnSq2A4McOfx6SSReOnehb/qwStPFnKU?=
 =?us-ascii?Q?uYWsFgGkBZwElLKKgKQjHVuMfIiD05Nnszgip5bQ5tmzD3AcfP60SffdjXCO?=
 =?us-ascii?Q?sK1VIW1dRyeW5VWeCMk0XHvOCO/+DeXD6ocQl3AgkKiwHCz92+MG/z46u/X0?=
 =?us-ascii?Q?ti/WjNCcXZi522rewhYOZML9d8LYbzDNTjf6gtezwH2FAYREFj6bY+NatxSa?=
 =?us-ascii?Q?lldMRyouB1aahDn06CdE9lfBAM4aSIw=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SG2PR06MB231570CFF1243CBE04575C34E6F59SG2PR06MB2315apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB2315.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62d46a7c-308e-45f7-db3d-08da226dbeb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 01:33:17.2352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mWGLYZyjII6yuGdCL4f8HDf9o4lzogetHF0tMSPYulTWNjNCQYQM0lx0FcagvTNKGgYOQOloj1dXbRCp8SjtglmCkzm7OAdnPZm/YEu4hqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2722
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

--_000_SG2PR06MB231570CFF1243CBE04575C34E6F59SG2PR06MB2315apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi OpenBMC team,



I had identified the root cause of the problem reported by dekriea on disco=
rd [1].

We have a 32MB NOR flash on ast2500 EVB, which means the kernel image will =
be placed at offset 512 KB by default, but u-boot is trying to load kernel =
image from the offset 1024 KB due to the incorrect setting in evb-ast2500_d=
efconfig.

The evb-ast2500_defconfig was ported from Aspeed SDK, so the partition layo=
ut is different from OpenBMC 32MB flash layout which is defined in image-ty=
pe-phosphor.bbclass[2] and openbmc-flash-layout.dtsi[3].



So we have three solutions for this issue:

1. Revise the CONFIG_BOOTCOMMAND and CONFIG_ENV_OFFSET/SIZE in evb-ast2500_=
defconfig of u-boot v2019.04.

2. Add .cfg to override CONFIG_BOOTCOMMAND and CONFIG_ENV_OFFSET/SIZE in ma=
chine evb-ast2500.

For example: https://github.com/blackcatevil/openbmc/commit/5eecaf84d91c252=
3767da239aa5dbbf42af13bfc.patch

3. Add an ast2500_openbmc_defconfig for evb-ast2500 machine which is simila=
r to ast2600[4].



Which solution is the community preferred?



Reference:

[1] https://discord.com/channels/775381525260664832/922871693008068638/9608=
22924867145728

[2] https://github.com/openbmc/openbmc/blob/master/meta-phosphor/classes/im=
age_types_phosphor.bbclass#L40-L52

[3] https://github.com/openbmc/linux/blob/dev-5.15/arch/arm/boot/dts/openbm=
c-flash-layout.dtsi

[4] https://lists.ozlabs.org/pipermail/openbmc/2022-February/029334.html



B.R.

Howard

--_000_SG2PR06MB231570CFF1243CBE04575C34E6F59SG2PR06MB2315apcp_
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
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"\7D14\6587\5B57 \5B57\5143";
	margin:0cm;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
span.a
	{mso-style-name:"\7D14\6587\5B57 \5B57\5143";
	mso-style-priority:99;
	mso-style-link:\7D14\6587\5B57;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Hi OpenBMC team,<o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">I had identified the root ca=
use of the problem reported by dekriea on discord [1].<o:p></o:p></span></p=
>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">We have a 32MB NOR flash on =
ast2500 EVB, which means the kernel image will be placed at offset 512 KB b=
y default, but u-boot is trying to load kernel image from the offset 1024 K=
B due to the incorrect setting in evb-ast2500_defconfig.<o:p></o:p></span><=
/p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">The evb-ast2500_defconfig wa=
s ported from Aspeed SDK, so the partition layout is different from OpenBMC=
 32MB flash layout which is defined in image-type-phosphor.bbclass[2] and o=
penbmc-flash-layout.dtsi[3].<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">So we have three solutions f=
or this issue:<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">1. Revise the CONFIG_BOOTCOM=
MAND and CONFIG_ENV_OFFSET/SIZE in evb-ast2500_defconfig of u-boot v2019.04=
.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">2. Add .cfg to override CONF=
IG_BOOTCOMMAND and CONFIG_ENV_OFFSET/SIZE in machine evb-ast2500.<o:p></o:p=
></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">For example: <a href=3D"http=
s://github.com/blackcatevil/openbmc/commit/5eecaf84d91c2523767da239aa5dbbf4=
2af13bfc.patch">
https://github.com/blackcatevil/openbmc/commit/5eecaf84d91c2523767da239aa5d=
bbf42af13bfc.patch</a><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">3. Add an ast2500_openbmc_de=
fconfig for evb-ast2500 machine which is similar to ast2600[4].<o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Which solution is the commun=
ity preferred?<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Reference:<o:p></o:p></span>=
</p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">[1] <a href=3D"https://disco=
rd.com/channels/775381525260664832/922871693008068638/960822924867145728">
https://discord.com/channels/775381525260664832/922871693008068638/96082292=
4867145728</a><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">[2] <a href=3D"https://githu=
b.com/openbmc/openbmc/blob/master/meta-phosphor/classes/image_types_phospho=
r.bbclass#L40-L52">
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/classes/image_=
types_phosphor.bbclass#L40-L52</a><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">[3] <a href=3D"https://githu=
b.com/openbmc/linux/blob/dev-5.15/arch/arm/boot/dts/openbmc-flash-layout.dt=
si">
https://github.com/openbmc/linux/blob/dev-5.15/arch/arm/boot/dts/openbmc-fl=
ash-layout.dtsi</a><o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">[4] <a href=3D"https://lists=
.ozlabs.org/pipermail/openbmc/2022-February/029334.html">
https://lists.ozlabs.org/pipermail/openbmc/2022-February/029334.html</a><o:=
p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">B.R.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span lang=3D"EN-US">Howard<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_SG2PR06MB231570CFF1243CBE04575C34E6F59SG2PR06MB2315apcp_--
