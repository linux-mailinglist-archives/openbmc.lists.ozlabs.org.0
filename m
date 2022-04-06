Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2874FB3F7
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 08:48:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcKFD4P09z3bXy
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 16:48:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=ps2QZW71;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::715;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=howard_chiu@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=ps2QZW71; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::715])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYDDX0s9Sz2xD4
 for <openbmc@lists.ozlabs.org>; Wed,  6 Apr 2022 15:52:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3HMQfxtaIWU2UTUrHfMLuFD1Q9V1MUeL6tkDS0krn2O6aAKWtTPBlBmA+3KQTIoLxGNOQoAOPDsg9gMvrmIjn1nZAquIWXZxMFo8n9DoatEbo+ZWmaNcL8hw4A0wWi7goXKNym73qmAIpJuLUW7t95YnsH8t0HfxmjN8neSfGKb2CxEJtaSwoxa8Ce372sr2VJ8CqP86MhwR0MplUWMxcJa5RsBpDFvXedJq47aurGR7Quzmjy5X5G3iIdJ152CizL0KRnLsTRaUy7qK/7cICzSztV3/jPCisHS+V6Y7Vfbimdr+XxYPhtxrWVJKSspLsaM/N/ALiONhwXO59QVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiJV+3Se4Fyn4lYF+YBO24ipySNuEuW4tPOX87TtYfU=;
 b=YQwxXm63KfDUkmoXgupRHo30LBpoKqqtz5GvPNUo8uFolRoWPvCFop29wYwGzvxh8mYlBEc7ezhgvCaM+OTRWckGBw19NIWLwPaWBtWF5l2orD5/meezC8N/SyW3KDNUGh7gq/p2EEsB4sjS2GXyrO0g06Xoaawqwapmtw+ymzxcqdvuZeWba8MK7hgtoMXYQ3EHTSEKNc3pSE267p/L/ZhNB2VRj/Ca0UVpUhuyIX2jsQHHLyPBLVeMfBnke0hi+6Birxi0gMqVVNKjBcmbR/crYMYJMYCgesrkBliZmQrtSQx78DImNuKA61hyzJb9jhPoTw9+ltnNhjXHF9xrEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DiJV+3Se4Fyn4lYF+YBO24ipySNuEuW4tPOX87TtYfU=;
 b=ps2QZW71JwjVPLpQsvhSOIrUNv5xkZwFlQZJRJFN+WHqSTSCfDHDh1FFzbPX/FJBEdO/R/kRhBD7Ulws8kkb1TN85b/SvgYFpgFWoOCIUeTgwnR1p0aeSjHqSXmuQnRGzf6tQtFc/Vhv2IH2FWTzlaKKl7uKlM/DBm1r5+UOgKIRsTdBP7ubR6v8O4UwZAmBAHQRzaOuI/0U03Xc1v8YKdNyVoHss2A58LQH0Vomr+OW16AC2QBVKrzDrsV0eB9whcgKdGP0tnZtTzymFXTYfb4Nm++ovBnljnxvVjO1UAo50FeKuctSqe1RaAOq62eG/bCYOehmYr9UKSWN+72xUg==
Received: from SG2PR06MB2315.apcprd06.prod.outlook.com (2603:1096:4:b::19) by
 HK0PR06MB2401.apcprd06.prod.outlook.com (2603:1096:203:4f::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.31; Wed, 6 Apr 2022 05:51:47 +0000
Received: from SG2PR06MB2315.apcprd06.prod.outlook.com
 ([fe80::69db:d6a9:d891:e1fc]) by SG2PR06MB2315.apcprd06.prod.outlook.com
 ([fe80::69db:d6a9:d891:e1fc%7]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 05:51:47 +0000
From: Howard Chiu <howard_chiu@aspeedtech.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Solutions to fix the problem which u-boot failed to load the kernel
 on ast2500 EVB
Thread-Topic: Solutions to fix the problem which u-boot failed to load the
 kernel on ast2500 EVB
Thread-Index: AdhJelnBj18fTaW0QrmsRhKfOVz6ew==
Date: Wed, 6 Apr 2022 05:51:47 +0000
Message-ID: <SG2PR06MB231524FAA84DE1162B97C6F4E6E79@SG2PR06MB2315.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a63664a6-ef8c-4960-7a82-08da179189f5
x-ms-traffictypediagnostic: HK0PR06MB2401:EE_
x-microsoft-antispam-prvs: <HK0PR06MB2401709631639E7FE210117DE6E79@HK0PR06MB2401.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dDaa1ULEhUkjshHsLCOUE/ZvhFrV6rx20tyDJCYm71A4kX53qWbBoHnfqgl97NNarBm2ZAG8hwd2mE16y4N/pdEBNnlwUZhzJXJq/5ZEJoEKDUrVwhr/RGADnWmat4zgsBrLZ/bbK/BhAW8HBV9YGW9yrqK6IxJbOb/uSBuoqTPqi7WO+xk+H5RhuEwV0Aj7sFi6MtTr/G8cLWy6Zg1jSBPNcJlYQpz3b/SJC3RkVRFpqVSzBeppsAP7+G6Qn/RY/JQOMpZEVMPxxYFycg/5iAHpInDQ+mUvcARELX1gjUmBnaG4mXvps8wIfcKJwSl99E7VAksbw6/8+1g1E88CQCO6v0DBs7VukQBlYAQ/nQSDcri+WInYr+k/mKPPE6ov/TouhQU6VFNXNpa1oXRj/S/a5Kuu0VajWAYDgZMaYJBXdQ780xg8Z1Ne6BVhb0h1MPjc4N/g0nHGSeBdfJhu1/VnsJ1OP12UO21S6oGqiCU9AaKe1jzZmwuwUgPVeHMrg8LIRTgsieA1PCJ/iM9pocrSEuGI3/h9Pfa7xiqr/iytzDR6ab++fzUd7cK0H8xeOkbgqogysPDmnOS+I18gsJofa93NJWmR0g/0+ZJtFFkwGSsX1zHgH6YVCCrkopyzqHAXlsmdiY7qTZ1UFCbw/Ak91op+2j1wLfwt/6qeXgwKJBOpM8BI8fOYT9zfPnQfaMUJUGRYXNrW7jZkII4HFBF93xqCtytmT9BnS9gmNmKhfuMab4qd9BD+sokbGf3MYctB83PVYAcKGOjOxJM2EJSlp6vSjWZkFGcWp8bqx3O5qV40e7mQdIl02iw28/bT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB2315.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(376002)(39840400004)(396003)(346002)(366004)(136003)(166002)(966005)(21615005)(38100700002)(122000001)(83380400001)(9686003)(66946007)(8676002)(66556008)(76116006)(66476007)(64756008)(508600001)(66446008)(2906002)(86362001)(38070700005)(71200400001)(8936002)(316002)(55016003)(6506007)(6916009)(7696005)(5660300002)(186003)(33656002)(26005)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fadzkdI8iQ7CUOyxrMFFuuQnNAVAFguRvQh90nXX/Y8+l9sS/+ps5E3YSfyB?=
 =?us-ascii?Q?/YmCoXo7bhET4SLSWzaDB362YFsFnuDQ2qct2+4MksQvXfdDH8d+dqniQmKK?=
 =?us-ascii?Q?kQ0zNxpRvLq/nHBVGJbn7LNf2pcw0fYHpzH20Ma+HOyWufQmAIVZWH3RBaIC?=
 =?us-ascii?Q?ksX1WTbH/Ulyj6XkmICWy6NJ6foODPExxwYIk/tx1kkNzr+QfNnccScKqESv?=
 =?us-ascii?Q?XDts1tJCblzvLY3qQHdlF3h31fDstiDVevGfcP5JT+wASiN9ivQufuUpqw6E?=
 =?us-ascii?Q?dDcuHfxA2ml7IAXhPqoZMPhsfVpwRsLe5CJyhJZb0+1jSL25qI9XGUqQ71I+?=
 =?us-ascii?Q?o/05S/5v0RHaiEZzfzys97fp7EUw1r4boz6GZ0/bmo9gdUZCHhXsBcwoGOdR?=
 =?us-ascii?Q?rLmcswbjHYRIPH9ptt+HL3Vc+Wr/xmDxplHizSyhuOex1IZ/iDaC2Zlssv8T?=
 =?us-ascii?Q?C19O8M5HwFZ8vzif1hcGnErS+HqsEbCQgiUZ+0eCA9KX+kki5cCgLVRisZwa?=
 =?us-ascii?Q?n5wUkz46Id0Hin06/bBQJA+soenOXsqDfgGiTGgvdvl8Ld6u/pN9aFaqF0vU?=
 =?us-ascii?Q?YmgnfclB5crr81RSyc9cOorrDa8UEgK4ZqBvrDKn1mvTzZO8jIB7T3lDu0EP?=
 =?us-ascii?Q?FBQNNyJSAJ4dfssh+FQlM/l1hbmFyYmetwbQ6aATCNlV3x5ueJKMVqBrhxB3?=
 =?us-ascii?Q?UhKMvgltva2GD09fMpo3LWLDBGiapEpXrt5buADVwe6vDcP7f2ZRHUsWc0F+?=
 =?us-ascii?Q?RmfmKP/+pE8OtYVFSl5rp9ZvX2ld5N/W8u4sX1UfeMfl9A2zR8si0/QGBTV6?=
 =?us-ascii?Q?m3yZOjJykmWqSKpeh3yapOGdqDey6XCIBMufjHUrG+0RmKMvrTouvsXxq8Qt?=
 =?us-ascii?Q?ax1zpW73GcJm/39kuOtwVBnFfehCATjD6fg+5eIAWGd6IWKx3mQDGpLDxL5y?=
 =?us-ascii?Q?GQ/mKfqn2ReQ/UrZgUH/Tajyom5rE+GCkcgEE81qhqWigKu97SwQx2d8Hj2y?=
 =?us-ascii?Q?XH6iXkpun62OhZ3/0HTChd9GLD3h0Qo9QLtwBIaMF4whI+9m8FNmftrNMHTA?=
 =?us-ascii?Q?oewNn7MJfRCE5Lkz/LSotflKLCkO4zGilofO8FhHzEG+S8JQ0USpbiF7kwtp?=
 =?us-ascii?Q?qZZxYFBPU6Rvq84ZB8WoB1cEAoWa3mRE2l9AsmXuyCsW5oQQSXiENcE9eJ38?=
 =?us-ascii?Q?D8TYOwizFYfg0HgSTg+F7sVet27xtjr9LLiFkFh6/bEw7NX3Akco1CU6wksV?=
 =?us-ascii?Q?g7pTdJQgmEUVaiSETViW2Ye6nt2wcRNS+5NflVy6x+JMuo3Q0kpXIJQN5YV6?=
 =?us-ascii?Q?fYrXY/7DuLMDkdK9SCVC3q6uqyd6hskt5pD0Q7NHzhBv6yHbi64IOf1ZIPSU?=
 =?us-ascii?Q?kJWDaTmqxre1pwhgm8LfU3rmBBTkfvhYwdhTNBfNGMtiKOtw8KbRa2xOUNeH?=
 =?us-ascii?Q?1N/dpJRHMke+WiI0emfIUNR7hFT6YJ5/k9BGZNkJB9s8QNPLQYwwEVD4jC3u?=
 =?us-ascii?Q?zJ3vVw88JVK4RilKUGNv3vFQgtgBQjO2Xvs9Q+9ixZeToi6Lb0HaFK3ZVXqL?=
 =?us-ascii?Q?uvUj+wjto7HFOMamVksEQlNS7wyMr9rEL/YE+OPXalTt0sW0CYjgZVeLY1t6?=
 =?us-ascii?Q?OR7ENjrE23JxNAidxHcU9PwfpSqeWM8FkEgI0esp9WnBaZy+iKe+R4gVIK5s?=
 =?us-ascii?Q?wfwgNjk8m56yEQNzTK47+QcgGSCeDuAEJKcl3T7K4RNL04s+YTu9ohfi/Kzt?=
 =?us-ascii?Q?aapaJHzgzgqRXNXuG1AJ0+be/K6c3l8=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SG2PR06MB231524FAA84DE1162B97C6F4E6E79SG2PR06MB2315apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB2315.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a63664a6-ef8c-4960-7a82-08da179189f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2022 05:51:47.7203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z27YrjM6tvuCvP/H/RtkUCHvjeMuw4qrNqy4Czxn9qvMsFbx62Kkq7u0dps6TEA1+JjvYuRYXpak22fyQUMKKH4rTRKi18N6VIAxSN11qNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2401
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

--_000_SG2PR06MB231524FAA84DE1162B97C6F4E6E79SG2PR06MB2315apcp_
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

--_000_SG2PR06MB231524FAA84DE1162B97C6F4E6E79SG2PR06MB2315apcp_
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
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
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

--_000_SG2PR06MB231524FAA84DE1162B97C6F4E6E79SG2PR06MB2315apcp_--
