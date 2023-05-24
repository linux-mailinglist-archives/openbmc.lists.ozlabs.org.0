Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F052370F2F8
	for <lists+openbmc@lfdr.de>; Wed, 24 May 2023 11:36:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QR5g51tWXz3fBg
	for <lists+openbmc@lfdr.de>; Wed, 24 May 2023 19:36:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lVhXcGve;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eaa::623; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=ropai@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lVhXcGve;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20623.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QR5dj25Tyz3f6B
	for <openbmc@lists.ozlabs.org>; Wed, 24 May 2023 19:35:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQOJ8YSTG7ZsUvAaBpf1d4+jMUZAjMINlJa10HBMPUIuQrYCzpp+KnuOYFPLEn4Qu+DF7lMQatRFpPlR7J8FWO2G3KXO+qTSUF9LLYyu7DmtSjhOCLhf+YOp9fVLtZFyYwRCGBT/BLukfUBbyb8uXDCqVjtI+9muBQPKVcilIfo2RVuda1GawXs8bHq2EReW5YEikZ84wTTHerTxO1neeiFwmtR7P6ZypHGVWqbzSzXi43norTOTi98fpdvYW4NJLogdyYXC/kCjOwKGZoI062EHitUewavr3Pt2k9whQVLES65QQLt2KWjfNvOQSf5enfrBzTluVG4FhyE+Q5aWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/JH8PiutRfVZ55Z4C9/uvw4RIQm4gxpJ7b9xGF/xz8=;
 b=fSEvZ7ZtupXTPlgCB56MgedNH3x9ZtQ60hiHuI9kgcYpDTA8YLTPfPYfhex46WiHVLjCW+eNBInKohTohxwNzPywaxaZeJId+IZXslUIJbqLPlwqRRQbukaSFL1+C4YlZMCxTMQkSWcyYzHA0fQPeRp5ySDboFNg0aW4H/kW4EpkhSxaXJGdbMABT/GS6bU3bnJfLOnaEd2HKMW1ICP1U/Os4oxYH4VDDiOskmQZKO9RuR6QF6At4o+XcyLQ1yki0SNgedB2wJFd1dkjWOgdiM3rVnrxt7EPWEfanFsjYRUG7+kvhCgGJim2cYAkBy2E4PPZbKwHxfhqzEi2yhOupA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/JH8PiutRfVZ55Z4C9/uvw4RIQm4gxpJ7b9xGF/xz8=;
 b=lVhXcGve3VuIB9KJuxitKLCNNtZ7E2EiNGBxXdrbPWpCQQFp52nO7hE81LCH9jGwRA9eai5NGv4naOSNNIRsdb3GAlUMJ4L1H+yOkE5fY0N3XJhztB5h0zHnRVRsUwOUSVGz7UjVTwdxyk8TANJIrvUYHbbalslhFIDDpbMcd4yQYcFqMWHnglZHpJ9RrsmZqCLG8EHrUi+aebFRI9e+IGUsXq1zGqnTaI9+shh1dPOQJHcp4kEeHzQ8E9B0SkcFQIAqxNDd7dVz3HtlD0k2SyPTrgbk85fbPJPyyf1PYwjLLeve0aF+4zR3y86qfzW5FQcdGRYd6pLIB1uAcqtyBw==
Received: from LV2PR12MB6014.namprd12.prod.outlook.com (2603:10b6:408:170::18)
 by DM4PR12MB6397.namprd12.prod.outlook.com (2603:10b6:8:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 09:35:12 +0000
Received: from LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::507:bce:e64c:f3fe]) by LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::507:bce:e64c:f3fe%7]) with mapi id 15.20.6387.031; Wed, 24 May 2023
 09:35:12 +0000
From: Rohit Pai <ropai@nvidia.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Prioritizing URIs with tight performance requirement in openBmc with
 bmcweb 
Thread-Topic: Prioritizing URIs with tight performance requirement in openBmc
 with bmcweb 
Thread-Index: AdmOIj9HMMHUr5E5SWm5E5BqGmJtZA==
Date: Wed, 24 May 2023 09:35:12 +0000
Message-ID:  <LV2PR12MB601419E4F59555BBCB4EE70FCD419@LV2PR12MB6014.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB6014:EE_|DM4PR12MB6397:EE_
x-ms-office365-filtering-correlation-id: 94cd5554-2be7-4ffc-21d7-08db5c3a2c78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  N6F9C+2cg/g4GCT/fvXwru5rkG4MR/lyLEXxDA6bWIP9v5K+E9ePPBIq0i8C8wxK1q1FL18E3EZSmDIRI8im/i3YjLeTwE5el+jam7GrF83gqr4XAaul+MIXF6/U9iQET+tx7FPtrZ1YivcBdd4+Unv+OQYYiHEjPOp4DYHls/F7SfBjYDCSoGuhIe6Lgked2Ahfo23XZW13oR6fW4K/7pYm5IS+ZzOE1Vs08sBgzOGmoj8lysg/VDQXz4TBRJWT27UD+XMymQkza+lUUQt33+mQeFbfyvcbcHFk8IW22DOTX8CtEMjTIlgltiS+R3hUtj3BDAmxa894m8KxLovlB51B+75PXTArt1wzzWYmPQ8hq6Rwh56gr3Jm+KOzkPQwL04cfpIae3PKbCxRe6jwhtsBVkioeCmJGS4BysbFkJY/XSQ5YskE6z4Bha0qu5DeVLLHbLiQhJtrE4Bu8yeGHKzuX/TMp9lQ1/cF8gufFIzLRzaAZHB5UbhWoonS4Anvnb4FMObxTNyqVvPoLtcGRt0AycJzLRpf7/fg5tfk3Vkegq1MzsANmRcUxYxzr1ISCyJebQEHyDUob7XCUPPwcQXLLrF4frXainrkgPnOTlDvkPOCNlvQ3Fdkb+dzF0rK
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB6014.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(451199021)(7696005)(41300700001)(478600001)(316002)(6916009)(76116006)(71200400001)(66476007)(64756008)(66556008)(66946007)(66446008)(86362001)(5660300002)(38070700005)(52536014)(9326002)(8676002)(8936002)(38100700002)(2906002)(122000001)(33656002)(186003)(4743002)(6506007)(9686003)(26005)(83380400001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?GfB0B3nU8uXRt4lPuoYan7UN7AsLbCwpNqI8Npt2FA6sM3/vHMVA2q3oYPyQ?=
 =?us-ascii?Q?m3lNs/2MyTao+vrjGDnyPFFga9/1VOP1ymzl/1qQ6P3gYRtJVQwA/EGCUX/V?=
 =?us-ascii?Q?ETIDE/lM3E2bN4YgBnRt/TEBdVXvatDf9/+I3wD0eonboHqXLDUkWPVDodU4?=
 =?us-ascii?Q?d/GtUIqOXiWBix00AnOgxclLjnRa4hW8pCmGiluLIbolTdBoyIMHBe/nAwGK?=
 =?us-ascii?Q?itx1TGKpIP9lpAsI1LKQDBR4bhhMxhRauAi3CmaaqoOqE6k4fmNo0lE8ALeO?=
 =?us-ascii?Q?puV1L+Y0BZxmAZLRjqwzGSIV5oSNsttlr/dXe4bH8VDVDXCY4nBl00WGTW5y?=
 =?us-ascii?Q?GpxzXEkHHZfsHe+lXcvoopjb5+JYJ+FNHqO6HsD6JuDNUklkyjLI4M9iBiHZ?=
 =?us-ascii?Q?nvdSdmXneqmi2egjp2A0flyrF8oe77b5sW+pGWrDaVcaHxHg1JbdjG5lvM2U?=
 =?us-ascii?Q?quljkkl1KItP1A7JHTvSKLaG4wZQDBC7UxsPmN8FEP9Py9NniqDl6F10nBaj?=
 =?us-ascii?Q?xzlcuKkKdAWd3rcnzgoI2BtFgyA03KEfAJHIgld4Ghpp9/6SSdl66J8EVF2A?=
 =?us-ascii?Q?zrVdBeR1JkGD/qBxfWT71WIg7FG9lTtH5bQNoKJMim+CZj08qd+ugKkJ4/iT?=
 =?us-ascii?Q?oBEh7z9lN1HlokfkY/923GTbi0s8V3T9ObwIsw0odwyIyYRZe9AxH1Vdz+UU?=
 =?us-ascii?Q?cI9sfU7vcHJR0jVPFPO3dbY7aL/FryzZxPEyqFA99R9N88BL+NQR0/JsSYJE?=
 =?us-ascii?Q?I8DQmosNMd6N1vpg7Ij6xbPoutMWYTDXDdQooTUDI8+rk0g4tFJ5McKSZyxR?=
 =?us-ascii?Q?T5MqTuCX0WO2BEJVkaPoYHcWYal9hZgLjpMxf7uW/trh4iFo24eGkEcvLLB2?=
 =?us-ascii?Q?X4nxD9RuJfDjl3UM8awODE3ajKGTr/xlH7UxVqUxRVQWyg2iNrbHj/lAjpA2?=
 =?us-ascii?Q?rZQjyV2Lj4R5zDXgKTFLrOO++1a9oGENE6P3RwDh2p/ACI1BVw8pK99I6MfS?=
 =?us-ascii?Q?Q15QJA2KhgQgqr8lRphjVvenm7yHPHREb31i36vjJSRaTFJJqY+FVmS0SROz?=
 =?us-ascii?Q?E6Yst+HdTzQN1/BspUu1H1bZPxAjX8GDYHe2k8pt+MSmFTlDqk4qmEthgRgF?=
 =?us-ascii?Q?A6HwRtQPWLjOK9i5todKpcmkw2XT0M2PWdhun03wcFVi0d+wtHWUwcy2N4j4?=
 =?us-ascii?Q?NG0zInbFkXinuPe9nFt0V4sOxW80sddsw2WvKAE0o8ni/3vhMWkqMLr57Jr0?=
 =?us-ascii?Q?kpTYvpAwL+5uuG5KouDSS+ZQyVUpUWoHjicSQC0hfasx+qvGrIerTSQLnoz/?=
 =?us-ascii?Q?VUZDAF+l8/CrjxKGt/YLkA1crhVYg8fmEgdDGcrkE8udbGE00F4Ef/grkeV9?=
 =?us-ascii?Q?Jzoy5YiVsnfMILCn898azWI+6SwttQ58U91c9zuGupkds8ZnJOa1uCtAYG8O?=
 =?us-ascii?Q?0RXnJgfd9j5qSV/CJcxJ+nY4emKKjxsH/35MZ3YoKcWEicZzZh/yckmYC5uQ?=
 =?us-ascii?Q?rVuOk/1Fuw1vCr4wSV+HVjcNA2H7jJ48VhRAdiZxznm/h+AmBwStOvRNAU6a?=
 =?us-ascii?Q?A8d5z2M6yKde0ays0iM=3D?=
Content-Type: multipart/alternative;
	boundary="_000_LV2PR12MB601419E4F59555BBCB4EE70FCD419LV2PR12MB6014namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB6014.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94cd5554-2be7-4ffc-21d7-08db5c3a2c78
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2023 09:35:12.6854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oxxCEPzEnQI7m6/AR8CI0+lmZDz8DL9EDKcykJG9a5dbuswUVsyRrIJaaJ96F3fOtqP1eCqWKjx9iksOHOk7+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6397
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

--_000_LV2PR12MB601419E4F59555BBCB4EE70FCD419LV2PR12MB6014namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello All,

We have a requirement in our platform to serve a few specific URI with a ti=
ght performance requirement on the turnaround time (latency).
One such example is the telemetry sensor metric URI which has power, therma=
l data can have a max turnaround time of 500ms.

The current bmcweb design uses only a single thread to serve all URI reques=
ts/responses.
If bmcweb is processing a huge amount of data (which is common for aggregat=
ion URIs) then other requests would get blocked and their latency time woul=
d get impacted.
Here I am referring to the time bmcweb takes to prepare the JSON response a=
fter it has got the data from the backend service.
In our platform, we see that power thermal metric URI can take more than 50=
0ms when it's requested in parallel to other aggregation URI which have hug=
e response data.

To solve this problem, we thought of a couple of solutions.


  1.  To introduce multi-threading support in bmcweb.
Does anyone have any experience/feedback on making this work?
Is there any strong reason not to have multi-threading support in bmcweb ot=
her than general guidelines to avoid threads?


  1.  To use a reverse proxy like nginx as the front end to redirect a few =
URIs to a new application server.
Here the idea is to develop a new application server to serve the URIs whic=
h have strong latency requirements and route the rest of the URIs to bmcweb=
.
       Has anyone experienced any limitations with nginx on openBmc platfor=
ms (w.r.t performance, memory footprint, etc)?
       We also have the requirement to support SSE, Is there any known limi=
tation to make such a feature work with nginx?


Any other suggestion or solution to the problem we are solving to meet our =
performance requirement with bmcweb?


Thanks
Rohit PAI


--_000_LV2PR12MB601419E4F59555BBCB4EE70FCD419LV2PR12MB6014namp_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:228732758;
	mso-list-type:hybrid;
	mso-list-template-ids:1087130702 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1
	{mso-list-id:854154928;
	mso-list-template-ids:-1471108270;}
@list l2
	{mso-list-id:1498182409;
	mso-list-template-ids:-742384744;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none">Hel=
lo All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none"><o:=
p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none">We =
have a requirement in our platform to serve a few specific URI with a tight=
 performance requirement on the turnaround time (latency).<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none">One=
 such example is the telemetry sensor metric URI which has power, thermal d=
ata can have a max turnaround time of 500ms.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none"><o:=
p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none">The=
 current bmcweb design uses only a single thread to serve all URI requests/=
responses.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none">If =
bmcweb is processing a huge amount of data (which is common for aggregation=
 URIs) then other requests would get blocked and their latency time would g=
et impacted.&nbsp;&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none">Her=
e I am referring to the time bmcweb takes to prepare the JSON response afte=
r it has got the data from the backend service.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none">In =
our platform, we see that power thermal metric URI can take more than 500ms=
 when it&#8217;s requested in parallel to other aggregation URI which have =
huge response data.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none"><o:=
p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none">To =
solve this problem, we thought of a couple of solutions.<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none"><o:=
p>&nbsp;</o:p></span></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoNormal" style=3D"color:#0E101A;mso-list:l2 level1 lfo2"><sp=
an style=3D"mso-ligatures:none">To introduce multi-threading support in bmc=
web.<o:p></o:p></span></li></ol>
<p class=3D"MsoNormal" style=3D"text-indent:.25in"><span style=3D"color:#0E=
101A;mso-ligatures:none">Does anyone have any experience/feedback on making=
 this work?<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.25in"><span style=3D"color:#0E=
101A;mso-ligatures:none">Is there any strong reason not to have multi-threa=
ding support in bmcweb other than general guidelines to avoid threads?<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none">&nb=
sp;<o:p></o:p></span></p>
<ol style=3D"margin-top:0in" start=3D"2" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"color:#0E101A;margin-left:0in;mso-l=
ist:l2 level1 lfo2">
<span style=3D"mso-ligatures:none">To use a reverse proxy like&nbsp;<b>ngin=
x</b>&nbsp;as the front end to redirect a few URIs to a new application ser=
ver.<o:p></o:p></span></li></ol>
<p class=3D"MsoNormal" style=3D"text-indent:.25in"><span style=3D"color:#0E=
101A;mso-ligatures:none">Here the idea is to develop a new application serv=
er to serve the URIs which have strong latency requirements and route the r=
est of the URIs to bmcweb.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none">&nb=
sp; &nbsp; &nbsp; &nbsp;Has anyone experienced any limitations with nginx o=
n openBmc platforms (w.r.t performance, memory footprint, etc)?<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none">&nb=
sp; &nbsp; &nbsp; &nbsp;We also have the requirement to support SSE, Is the=
re any known limitation to make such a feature work with nginx?<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none"><o:=
p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none"><o:=
p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none">Any=
 other suggestion or solution to the problem we are solving to meet our per=
formance requirement with bmcweb?&nbsp;&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none"><o:=
p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none"><o:=
p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none">Tha=
nks<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#0E101A;mso-ligatures:none">Roh=
it PAI<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_LV2PR12MB601419E4F59555BBCB4EE70FCD419LV2PR12MB6014namp_--
