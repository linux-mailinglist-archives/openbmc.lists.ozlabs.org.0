Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF3A4F8D46
	for <lists+openbmc@lfdr.de>; Fri,  8 Apr 2022 07:31:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZRgp3gNLz3bVH
	for <lists+openbmc@lfdr.de>; Fri,  8 Apr 2022 15:31:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=shN7XQGT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::718;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=howard_chiu@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=shN7XQGT; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20718.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::718])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZRgG0mm5z2xY1
 for <openbmc@lists.ozlabs.org>; Fri,  8 Apr 2022 15:31:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhngEobv+yWqoWUMxnCjUk8tKKzK2wjunM82e6lephierkwAslomF7JNuIUt5rBG2Qiv1NUZTU3Ftj4wzNbAZotmFcn95D/ffB9Qxvpv8vfixEC37BH1HlyHayl9B/PSZb8rz1gXvbCeUQ77lg41T5lwJS5EX37ThT9G/LtKEtaR5PVZwtKMYFe6++nLAdG2SfCde4lJ9vOlnF7fYajRK1TH5B/BYu2omEq8LTsr63VdoCR7D/r+YKH48DiYYU5BB7v1MHm+r2DuTvVRrLzUDBjnTQ/09l9j46oSed3ogCtwyiZkKoDxRE14AcnU3aoMYs9/PHyEEjP2foKjwrVYqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBCzCS2eh70hC2JAaq7bXoS/4ajX9H4lbMY4a0mTOGc=;
 b=WFA5v31dvzRdSPEB3WKCv8Bqzf1q7ctvjhD679bQKwiToD2hLWtsW9vkNI2QhJ4xmvulLPwWKbriBuANf91qS3x2icMc6XTjvD/lI8awlrFKALe4Z81jLwytgRqxBR8SIZce3f1AFD62D2w60mQHLUKMt8DJT5aOHRNw4vlSrez5MratGjBdqS6p3O+xqkBw7JsEoPCPtG/IIe+q9vs0FNdF+RRLEMEVk18/+B0gEZA5nS1kg8+pyabKITnBypwIDZnlVbdEO00WUj2lKIqNZUE1U8vL6blCw2f8bD/UC0hm66Jq0YF7X8ggC8JjxNAp2IBe6d3rE6KDL6ZecRn/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBCzCS2eh70hC2JAaq7bXoS/4ajX9H4lbMY4a0mTOGc=;
 b=shN7XQGTm+bEOMzuqrnjtk/8BLY6uA2xvlVP1Fb82l1I8+EvtGfbgwQkeP+2aeU/x5o+9a0yWD/bzu5CeZSvUG+xMGD+nIfuX5h1ae1HrAujcHCunZpIWF6Mk5Ob/F8Xr06M8HNg+ZMQeJesaWrGcd5mSED73HWTbuzrhKgTxywO7b5YCb/wjWwHv/DdPoD5IQShbzBNC3NUETEjZemuwGtVr2mr813/Ry4dTELGvZ9P4x1XQTdcC/jCDCRAAmUg6SlQYzy2TT+5UiEUtOJUodfc1qMbwMhjK5eHsQGmWVHzix8cBiAEiJQx+58tW9u9d770wlIYYJ9bdg5fIsFIJg==
Received: from SG2PR06MB2315.apcprd06.prod.outlook.com (2603:1096:4:b::19) by
 HK0PR06MB2596.apcprd06.prod.outlook.com (2603:1096:203:30::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.22; Fri, 8 Apr 2022 05:30:41 +0000
Received: from SG2PR06MB2315.apcprd06.prod.outlook.com
 ([fe80::69db:d6a9:d891:e1fc]) by SG2PR06MB2315.apcprd06.prod.outlook.com
 ([fe80::69db:d6a9:d891:e1fc%7]) with mapi id 15.20.5123.031; Fri, 8 Apr 2022
 05:30:41 +0000
From: Howard Chiu <howard_chiu@aspeedtech.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Solutions to fix the problem which u-boot failed to load the kernel
 on ast2500 EVB
Thread-Topic: Solutions to fix the problem which u-boot failed to load the
 kernel on ast2500 EVB
Thread-Index: AdhJelnBj18fTaW0QrmsRhKfOVz6ewBjy+lw
Date: Fri, 8 Apr 2022 05:30:41 +0000
Message-ID: <SG2PR06MB23151EF8DA561670CE6D9787E6E99@SG2PR06MB2315.apcprd06.prod.outlook.com>
References: <SG2PR06MB231524FAA84DE1162B97C6F4E6E79@SG2PR06MB2315.apcprd06.prod.outlook.com>
In-Reply-To: <SG2PR06MB231524FAA84DE1162B97C6F4E6E79@SG2PR06MB2315.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fc833d5-783a-47a7-c320-08da1920ec19
x-ms-traffictypediagnostic: HK0PR06MB2596:EE_
x-microsoft-antispam-prvs: <HK0PR06MB25966ABB29B1836B0B56DA6EE6E99@HK0PR06MB2596.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wxOqoWklTm9QANSaqz9xKYicZUEaeNXDH667JUlqGZx9NC8Se7M98Cb37j6tM80cS/KuLJNQa66TZh6XgU/mNgyNVWFJ6LOpmm8z7eW0LXx6tWJS+wUec5MnUaIoq1hZvaltIYx5g3e3ll+VQEgyF5G/QUbtrGcndrqJE6w2NEQL6I3+sWqKKh5QAwFPKF59xUf5nbl5eSRo1fpKtJ5+YgJGhJEds1ba5qPV0f9y5JESovA6HmlBfSLq1w4BaIWyL1U9uuAUAPmUsowEnsZliwvhcU+uw1lbZG3+q4WLKQulBEYksq+fGIRTAOe8R/x0GdoC0fGqYxlZOPGVZbo38Rm35aM4TKTusUgvdXIR3e1oNg/9rBy0nK2siQbMCS9TDpFYTv5yrthXcTgFsbCZPji/IMZeq2aHXsmRYbZsnDV3VT6SHSIZBe4sHKGlWk7khfeT2N6VoXjgN/Ca58xSpBBb7ETKRnhJ5aa4sBzDVh82xqrdbRZu+wFQ8vRCwz/xZdzs37Erkg9C+f3sEcmtNw9awAIAdtkq2b3tP4FWhYZVEt6RrHvYonnh85EW8td6CN74eKsnpLv21Ua9aZpOyBh5/Tv3B07JssKmbQYmDCHJjsRJnjz2NMGTOlIy+OxTG5vXq5RZsmOMYf4cCtq+evc2bQO+gxqlu/qg8GkqLGSobkdNYpVqcgoiMCspT7ZJnNIqFAYSfrx73wlrSpwWRUd+eB7lTlZAr+L0SHZjmuXdOjk/+939Xgvx3eax0NyFHzgxwzZiyrwj5q413BQX78RGoBTHgRqs5oyE/1luYdrBKwwE866dut+X3R5lGg01
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB2315.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(346002)(136003)(39840400004)(366004)(376002)(396003)(86362001)(166002)(7696005)(26005)(186003)(76116006)(9686003)(71200400001)(6916009)(2906002)(5660300002)(316002)(55016003)(83380400001)(6506007)(21615005)(52536014)(508600001)(966005)(33656002)(38070700005)(38100700002)(66476007)(64756008)(8676002)(66946007)(66446008)(122000001)(66556008)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ad8BkgKE9bMN6j0+3lEv8QlRL40RsVXRNCmwSAhzGgj7XUQANFzZKncBuZZ5?=
 =?us-ascii?Q?zXjczKrFMLKeGviSe3/nA9aae6ICwaznLE6z6bvJEFZE3fcefAySV1uHGxlY?=
 =?us-ascii?Q?EplhAUljWAZacYj3EecMeSw2HmEIfNe++tPcuaHEkkK3v788bsxRMWmSvmFW?=
 =?us-ascii?Q?hhMOwCej/SFGji8PcOqdvBDSMSN5s7xToGHWD+52m+Ldyw5++M/TAmA6Qu01?=
 =?us-ascii?Q?9tyi1KG//W1oixcV9Eg65RkxcR4DNHTbawAk3+tHghG/aEbpjv52jPgGHBty?=
 =?us-ascii?Q?P0EaZp1K8Tqp/CUysTMdqtWVCq3NBSscwrB9XnBMjw2a0QDoVGGC3cxBn1nP?=
 =?us-ascii?Q?QO+8pGsufh0PaTFZ5BTCpqNiQZgTYhi3K0enVgDFPeCwjwsBVQojFVxVafcc?=
 =?us-ascii?Q?jmE45nWB1wlXU8iwMaAAlxf1gF7KUvCc3nbpEupXIVkJx2NIgikxA5m4d8VT?=
 =?us-ascii?Q?T/zIl5f4/P0Rpe2RV/Tsh2Yu6PMh8rbxNAnrzMxYXhOYVb081pZGjNGlAZ3Y?=
 =?us-ascii?Q?hCSaxqPpb3kfWsV52T1+bkojjxldVC7xrCUNBfH3JwuPZCDYvuLetSQwj/5I?=
 =?us-ascii?Q?OGkUfPjPfbDw4P1sPenCFf1ZYQ1CYuYq6jju86QzpexmG9Ts9ZhEOgFdBVbp?=
 =?us-ascii?Q?oYw22D1CFNILG6pUxhO9PIiVmvwTIYWIUSz6gVq731ED1tP7I9D6LwlawN6e?=
 =?us-ascii?Q?iGjGjqR1cN4rEJEyGqB15c6jIFtJnm3c55InPUudqAXSV9B0d0h64N9QYjlS?=
 =?us-ascii?Q?n2ocKTcvJox7ZR8iNlVksWvaxu+aGg1Asj4ihwUer+c6p3H8e5ZJxFhC/hRp?=
 =?us-ascii?Q?rnUnfEUuI2ToSUz8nfSXqpOeZ7GBuCxYxmi+emG2LvdyzTKxXvKknc/FBe8J?=
 =?us-ascii?Q?/WjZmUsxAezFcscq2PTg8m3q6zGcNEZsHt+zfqZ6P/Nl5m1RK/XgVJmr3H6Y?=
 =?us-ascii?Q?CK2sAcLSEz16MMIXk20HXxFI3APfR56+nMNfmAv/tv8iT8wDRLJIscwmf4Zr?=
 =?us-ascii?Q?zTDNuwjPFnkE6J+hzbkqSNYhe9SRYfebOJidsJyXSQEi4SHmQJr0tDEyfct0?=
 =?us-ascii?Q?O6D86f4xxXFbEaETXoY54ErRPO7zxypZbjbmyi1lTJfbQXLT8JYdJsoranex?=
 =?us-ascii?Q?ufQuMu7TaNBAwnw0a1oa48xfCWqITStKsxbb15QFcHIPUTD5Uxng95GhZx1X?=
 =?us-ascii?Q?nw8esaejr5FlWfr6dA97DrYGK0dl15nN97U8lPMR6/H8OsWfOjIcbOd6uH72?=
 =?us-ascii?Q?l1FQV+Q0BpEqoAmGy9lsWNWS7hjlCT1jMFWw2MRNIILApvo3f7c3LC+Gf1/2?=
 =?us-ascii?Q?835u8DTB8O4JKNZ4TeGxiU+p8afAoZIWnzjaJeiIFmhTDUas1BWjNHqFki1X?=
 =?us-ascii?Q?fmovKlQl4erI7/J55Qwzv1gWv2vqs+VyGfueaSJP4sA3sw5VcduapB+ipjyu?=
 =?us-ascii?Q?cSThpFwKSBjmtEyVcrmc8npA4F+eorGsjKqC8CnN3nEQk2j6Qx50TN+PQWLj?=
 =?us-ascii?Q?GLB7CsesB8Z6Gr6NlhpJyIEgjAwSN2fxnT5XxweY+CeIGua/N60gtUIxhaw4?=
 =?us-ascii?Q?7YQqqtn/yY1xduwQH02rzwrm7oWcoibSKzUGXnUv32FhMKWt+6xPfcQXFf7E?=
 =?us-ascii?Q?+7IQES19pDvin3IwNlxUXpZxnKa2O963HZbNU5sLqaxaj4/5GFOxKKKyhoOl?=
 =?us-ascii?Q?M/o82UY1u/gGgI7oCGcM3dbDyRepBB/Q8NWUC4mr8LA9izoeT608JX2MKAB2?=
 =?us-ascii?Q?pzx8AKn8aTpM+DvW00FfxCnfHSq93Sg=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SG2PR06MB23151EF8DA561670CE6D9787E6E99SG2PR06MB2315apcp_"
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB2315.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc833d5-783a-47a7-c320-08da1920ec19
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 05:30:41.6636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a+bCsr5hJXJGQKECOSghamPf3k1x7BzPmv3VtpbMxciwbWcS4RvSUGGiipQy9F1+kZZQ0u7c9uKuFV3EsPkkZ2+PtOM1xlZb9zq9dE+ly2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2596
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

--_000_SG2PR06MB23151EF8DA561670CE6D9787E6E99SG2PR06MB2315apcp_
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

--_000_SG2PR06MB23151EF8DA561670CE6D9787E6E99SG2PR06MB2315apcp_
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
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
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

--_000_SG2PR06MB23151EF8DA561670CE6D9787E6E99SG2PR06MB2315apcp_--
