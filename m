Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF30E4FB3FC
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 08:49:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcKG300DSz3bWt
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 16:49:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=UBpgPSMg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::703;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=howard_chiu@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=UBpgPSMg; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::703])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZLVg137mz2yHZ
 for <openbmc@lists.ozlabs.org>; Fri,  8 Apr 2022 11:38:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gv1bjDGK8Uk9gJzjH6IkHcPSoaW/anURiiUbioHEAxGeoa/hvTSS1prYCpzx45ULKqxvKcd1Es5is/ZH9FSOByeL+AX21qF4U5VH4EG99FYkWZDJgOMvitVqiKc/TDuTMiBeA8WPkVwF5w+jC7THLqDfDucgeoCYMRVgnBPFB7wUYT/8ztNVYotDuQeftKrzPkmxN9SwMvHSl0aRUf3KH+nPORzlUaQnlrwMVB01q5T4pDwkAb5OwPR4ffSzB5OD2pZUh0hh9gnPN6jy4Pj/qBTXx8MAU+SD6xoCvpTsR/qUyqAV/kqL1UEAd2UpU2t3hh/WmTloH3bxTYk/GpBvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WO5e0GgehAVvs9Oq0EsMjmL7pE2Z/bbX23iCjVIdTsk=;
 b=LLN9HBoO8e1MedPCy71Q5P+S+IPpZu4kVrRGkkKm5DcaDw1PCgcI9MbxZz3N1sHP4K6hn2YZUoyf9rp166aB3OrZ6pyDqfef39LlnC9ONEIbmFGKoNSjC57f6aKo+ptQ/x+oA3JSJw26qaDU8XCUBtIO2GJ5EubVoBmeeU6tCY/v9mEgI62A2z58myjYPynxpNT1/s97SouXoHrp3Gu8ErmGRNbWt+w+A4cS3LNbuJ5w4AYtl3fIMMRCj0XWf8oe3ixG7kXHyp85C87FWBx/9BjctsiTbeR8S/5jRlghx6inf+1j3g/l80z6YNvKIjcPtAZ0/zqdQQtIhGsS8InFvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WO5e0GgehAVvs9Oq0EsMjmL7pE2Z/bbX23iCjVIdTsk=;
 b=UBpgPSMgT4u1SblKb+tmXRG1H/LfZEgfsZf6ORz4IfXI9qq3Y2Q6Z8PIWJzkgCnSyHEIJeHj3XFwSD7LaaFK6rUEzCy/rxkKg/LErUbeCbtqcOmfkgQ1uAaka1WzBJoppLAFCpDgW8iNvSyKSTFwWbArWPEvs7tAH5XLyZi2+I6mcB/cN79bf+V+pNISwaB9VM+wDnEg3QWZXyz0zcWOvaXzdFWT+fJ5z4NEuqtANqU2+GRU7UQ+rIIv7fzYYi5hHF/bm+zhVrZkzvQDxXXy36OXEeoTcHUdAm8DxmzUcowCMmmtW0YnF922cjx9DgxvKQYBQqpdlRxpJRzAtgOemg==
Received: from SG2PR06MB2315.apcprd06.prod.outlook.com (2603:1096:4:b::19) by
 HK2PR06MB3332.apcprd06.prod.outlook.com (2603:1096:202:3a::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21; Fri, 8 Apr 2022 01:37:51 +0000
Received: from SG2PR06MB2315.apcprd06.prod.outlook.com
 ([fe80::69db:d6a9:d891:e1fc]) by SG2PR06MB2315.apcprd06.prod.outlook.com
 ([fe80::69db:d6a9:d891:e1fc%7]) with mapi id 15.20.5123.031; Fri, 8 Apr 2022
 01:37:51 +0000
From: Howard Chiu <howard_chiu@aspeedtech.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Solutions to fix the problem which u-boot failed to load the kernel
 on ast2500 EVB
Thread-Topic: Solutions to fix the problem which u-boot failed to load the
 kernel on ast2500 EVB
Thread-Index: AdhJelnBj18fTaW0QrmsRhKfOVz6ewBbkbCg
Date: Fri, 8 Apr 2022 01:37:51 +0000
Message-ID: <SG2PR06MB2315F7D5EA19E82CA73F17D7E6E99@SG2PR06MB2315.apcprd06.prod.outlook.com>
References: <SG2PR06MB231524FAA84DE1162B97C6F4E6E79@SG2PR06MB2315.apcprd06.prod.outlook.com>
In-Reply-To: <SG2PR06MB231524FAA84DE1162B97C6F4E6E79@SG2PR06MB2315.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee7bbee4-6f96-421c-7963-08da19006538
x-ms-traffictypediagnostic: HK2PR06MB3332:EE_
x-microsoft-antispam-prvs: <HK2PR06MB33321FC9507D48804A3C33A1E6E99@HK2PR06MB3332.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NKa0Bc7UKuPmlbecveMWc8wU0EpjdhgLHNe4lmW/rIsd2b6DSOopoc7sWUYRAwbk4Dv2ryfIEGij8C8f2hmNOxdhmpjyGejes5Y3PHMbB40q97RfXKSU0t/Cfw59LAU9+Scfbssv0lcEHpUVK03KT4ibiPebgNof3f1Wn+7zNilFXJASAVluB/ccc5tphfAHCHIGrR72rzOBD6CuA7RxT8SyRAx7zLQZPEjy2NgwluqpKi/4CeFwTrntlmsNp6iKPiPosHZbfOgTazQwbCfqN8ACBFznePkshAnrZsQ1Z/wFk2j0J6oqw5+YnzzSu50oU1oxB33m63iIMqUVXPJVb7N0ZkHMz7en++vEOKN9T/sC+a0AnWT+nn5Wrrdd41nWbK7u89mAyBnH8wWzNTqAfxNJX9GU9CdLxsIeZj2kpkhVElKZT4T4lOzbEhlPQMgu3vfGMQv5SkOUNZz0N5eexzLAaiQAVYKROmhsv7/AxzYv1f7AEgmHdwCEB2kmH41Jg4A2h/TyvAVcV8YO5lcbRam+D+mkwCivWSMvowup+ueWlAamdQoGLFQ3ck4Iw3ah1lJ4V/UNReKQJuzxwG6Wq2dNgHX1bYndBWj9DfFDgMWwGuryTNFhpruy+N1CDVaHGTDh/S2HZwPmCJKZJOWEUS7MQUHLNMNb9KiFnjWcO99wJaGvON9abg5Wn9UAISdx0gZ9u6GW1FOTGPqq3UHOVtFBDuhKGWzp/n7N3BwaTXcyDKzCR91NsjReyToqmfLUqPiy/fLgxuWzUYQ2S2nFCRmOdahweCLRzxMgEP81kYywRmerH8wZ4AxyRRlUdqVH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB2315.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(396003)(39840400004)(136003)(376002)(366004)(346002)(8676002)(508600001)(66476007)(66556008)(5660300002)(66946007)(33656002)(6916009)(76116006)(86362001)(83380400001)(26005)(186003)(66446008)(966005)(2906002)(64756008)(122000001)(38100700002)(55016003)(38070700005)(52536014)(8936002)(9686003)(7696005)(21615005)(316002)(71200400001)(6506007)(166002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2tNpJVVv3R4N/6/x3ciF1KePYrg3xNjCa/yhMFUAiZfXLe1oCbnHnlOUgDRE?=
 =?us-ascii?Q?4BtC4ZDVncqbOWyDOhEOZtuNL8bHwn17e6ELv6ZV2oDGvxz8AGiNXVnVLrCN?=
 =?us-ascii?Q?NiIObaogFg8XaQcfTE/hhzx7fd61dL+6TvpV8tor8bvUFTEmdFCOxFP0G1+g?=
 =?us-ascii?Q?hI2mJR6XZpTWtx1d6AAYtYvLJzTjqz8FDeVDc0N54OIrDIe2oZayYL3XXXGF?=
 =?us-ascii?Q?dAbWrBtkYaqDgh6Dytp5IpZeiU0mamSZQKeSrPJiwzlFfQv2IbyTukZxFCbH?=
 =?us-ascii?Q?rwNW/Wq50Y08fW4BQD2UDHpewprgUEqTywcBDs660yqZamgQmktFb9vyrlNn?=
 =?us-ascii?Q?O/3WtkZTsP3kd2rHQ7eZLtA0YyiIWJbs9MNxY5yjN3n4LeJvV4HJEuT9lerB?=
 =?us-ascii?Q?cuMzuYaBrzzzoF3j4GA35HqgzQBL2OeHcuMkDsbjaeITGONNTQVaaZx0m0MM?=
 =?us-ascii?Q?LRkK7fEoBTaZ+POlordSKw5whmSb0WLSIp78QFILtdJrFTbqEHgD6XByJzju?=
 =?us-ascii?Q?vmAr5PPvwd8mhAYuYdCEA5l8myGgh4aziqLJDnelGLOXL0rkMtSEXWJhUXqr?=
 =?us-ascii?Q?efl2nm/Pkwmk0iyvVmQI3cGJMWBc4qvTYmrQaHIGxbTThsR/M+zRluMqIJt6?=
 =?us-ascii?Q?yrQ4gJkJwmm6MC8zUqwA35sKo04bZcUUj8MOhgYXxzqxEhG1EsYcwWnnZ5Hv?=
 =?us-ascii?Q?+SGVrUE+3FE2okbICeBvZhgO908cDv685hIFJ7bmGU8UlJQgjxgU+AiOTZjB?=
 =?us-ascii?Q?Gp+Zzt1pFYk115UpUN2kSJa78C6Pr8v+gpF0fMQOvGP94Sa39/8GlxivMb+1?=
 =?us-ascii?Q?9cttpfr2WKoHH2zZ8G5H0HbSHpqzbGfkn2yIma7DUh3E4BdfcQV8WWQhtsLi?=
 =?us-ascii?Q?krOsKkleRkQtvBrSX8CFgCTg5nqeXC7uyB1ibistvMvz/qJjeGyo70HvGnZD?=
 =?us-ascii?Q?RiQrZ5GXrDI5Rf1gWXJZhNZB5I+icWUXWyBNTuqL5TBrdvr6ZqlMzZk99ZAX?=
 =?us-ascii?Q?VI4O01xhhoZMsyvnOTGvfXeN0/1lcK8Vh+aspZhZLQ7ZaFN8yRZMgZqjvBvH?=
 =?us-ascii?Q?ny0A/wU0yPPWPk94HFguS3OAled9kswmMFfXTgfc9c81pmtsCM0h3o2tMuot?=
 =?us-ascii?Q?Wo/cVk83yTfEd94j7Z3HzrFCvuzovIejN00G4sID6a2TIKwVl+7gUAWnmiYd?=
 =?us-ascii?Q?fOyEHTJTM3zRZ0fuC5+SQxtTjHKEF96Db5E3mB+tQ0CeBRdf4PjqHUBzW6Dp?=
 =?us-ascii?Q?Uq+xwoFlVDhe9tVOQiVmJxICmOJcVg5IAy7gAVFldQ6M3IK0kJbYe0FSf5Hj?=
 =?us-ascii?Q?kTZLUb6GYo9wfbAFPOExEQ1x/j7F3juEOCRVAorYu6m6mABmdW+EsdsklexD?=
 =?us-ascii?Q?s6Kbk8lVu3Q1r4q8Z7C0kmalJ7yuVatr1ki6jpWaqWJghdG+nZsjoDqdMldS?=
 =?us-ascii?Q?Cie+ld81QWQ7R1zNnslPRU7v5DIr9HMEn4CKxJ2BlXID1J0DwlBeMaCkAm6D?=
 =?us-ascii?Q?Cza0YGGqMf+vUB0ky2Vw1PDdpK+TXXXktLLq75FRSj4eAnGalI7N2eR9SivM?=
 =?us-ascii?Q?jpc46HK23EJpu2+cshX9mfhEgmceY+Uib1OZQBmCtiYw6tbBadofIa4KSXI3?=
 =?us-ascii?Q?OO95QamyUOU+X37I4um0tAAqBgZfvqkwhL6yF4UimA3NhJUwNlBiErmMge2o?=
 =?us-ascii?Q?vkOpXEOUQsMxtsqpX4zXxMpWWzqzg7Q9zur3T0SDPGfMMhuJ6MGN/JudeM6C?=
 =?us-ascii?Q?0SjMoxjF68qRyLwNLlzu/cZWCVAolWo=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SG2PR06MB2315F7D5EA19E82CA73F17D7E6E99SG2PR06MB2315apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB2315.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7bbee4-6f96-421c-7963-08da19006538
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 01:37:51.3053 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uWymrT+wVYXYCPaRsHRjLg+hdfVVFBFt/8BJ0p7gaCcEY/HBQFjiFYkiC0IVTocegthcxEkB+DmciAvB2mcr4vJrMMPvJLQxugpo6ZaF3xY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3332
X-Mailman-Approved-At: Mon, 11 Apr 2022 16:48:07 +1000
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

--_000_SG2PR06MB2315F7D5EA19E82CA73F17D7E6E99SG2PR06MB2315apcp_
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

--_000_SG2PR06MB2315F7D5EA19E82CA73F17D7E6E99SG2PR06MB2315apcp_
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

--_000_SG2PR06MB2315F7D5EA19E82CA73F17D7E6E99SG2PR06MB2315apcp_--
