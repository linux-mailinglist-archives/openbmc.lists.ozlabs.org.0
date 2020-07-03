Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E19213E84
	for <lists+openbmc@lfdr.de>; Fri,  3 Jul 2020 19:23:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49z1yZ3wVtzDqwF
	for <lists+openbmc@lfdr.de>; Sat,  4 Jul 2020 03:23:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.129; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=velumanit@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=hazzI/DD; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=hazzI/DD; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300129.outbound.protection.outlook.com [40.107.130.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49z1xS6ZrczDqkD
 for <openbmc@lists.ozlabs.org>; Sat,  4 Jul 2020 03:22:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOdak3qPZvYk/2i5AgZ+DMXwMlXobneDoUqa0EMjfXM=;
 b=hazzI/DD5A8AWRss0JfsAzJWNpFvc4pRiKqxqptKah73VRjFnAfHPL9HALjn6/t7XQ9pk/W97mjZKb29lNLRgqJp72ojc5FtqaJxR0KHJoRuPrFAyJcDaT9yORA+auYfTk7LuxaQKwe/9FIujucjRN/i3ONlvQbPP4j5WfdXpk0=
Received: from HK2PR02CA0217.apcprd02.prod.outlook.com (2603:1096:201:20::29)
 by SG2PR04MB3383.apcprd04.prod.outlook.com (2603:1096:4:6a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Fri, 3 Jul
 2020 17:22:24 +0000
Received: from HK2APC01FT032.eop-APC01.prod.protection.outlook.com
 (2603:1096:201:20:cafe::19) by HK2PR02CA0217.outlook.office365.com
 (2603:1096:201:20::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22 via Frontend
 Transport; Fri, 3 Jul 2020 17:22:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.54)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.54 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.54; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.54) by
 HK2APC01FT032.mail.protection.outlook.com (10.152.248.188) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.24 via Frontend Transport; Fri, 3 Jul 2020 17:22:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HULb2vnVdyqFNl9HqrJqkMLwjiduraeU0dkDum0yrzzVK8aAuFcelw33DcBZw3u6H313N0+EG1h+5GtqBaIZ6VFqKsIhg4zStES1+6xz5aYLkE0O1EDpdtF4pJod5QMG47cjhsfNtRKenLktfpXTBC1DsYvjZDYqxnsO7laER66LDc2Ocj6AwToYZX+8MkcaWek89PLm3R//Bh457cb27JVExONj0irskJlqU63EnTRbucBkYx9ebFTEDVtsbUv4ZMhPyyJsR2PtD3eCES3iCY67Mpfv3sCk4SqJdxjIqSeTfo7B60E2xJXI+37JO0xZhCmM2kbmWDXI+vN4JDkNqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOdak3qPZvYk/2i5AgZ+DMXwMlXobneDoUqa0EMjfXM=;
 b=G88uSK1BLxNcO8iqOtsCL2h9KnxzqLbQcoNGY+AmxB6S1F8cuJKM/djO5lS9h0vQKRBVCy0YUB+iuwX3tJwvWwZWcRHegPgpkZp004FfXkBA6FGFVryUebN/+lBaFiAIA7n6sgE23pMvTPGbDulb2QmINcFtFEdycaDJN5YVHGeTj4NtYDv5tlfcWEWqMtWcTtCxBalV2syVscooaW5nuXqelXn6EaAiDhUfknE4Ump4lNZJzyOxBFzvtIN0Jzym/G7AGHrK3gHzFLRHvEruIizSUFhIILopmipv6ajlhpSRuCTCRaI8MAz7OkquJSXPKedIMYvWJwKP1NUGB5XYZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOdak3qPZvYk/2i5AgZ+DMXwMlXobneDoUqa0EMjfXM=;
 b=hazzI/DD5A8AWRss0JfsAzJWNpFvc4pRiKqxqptKah73VRjFnAfHPL9HALjn6/t7XQ9pk/W97mjZKb29lNLRgqJp72ojc5FtqaJxR0KHJoRuPrFAyJcDaT9yORA+auYfTk7LuxaQKwe/9FIujucjRN/i3ONlvQbPP4j5WfdXpk0=
Received: from SG2PR04MB3160.apcprd04.prod.outlook.com (2603:1096:4:6c::20) by
 SG2PR04MB2396.apcprd04.prod.outlook.com (2603:1096:4:3::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.24; Fri, 3 Jul 2020 17:22:18 +0000
Received: from SG2PR04MB3160.apcprd04.prod.outlook.com
 ([fe80::415c:fb5f:f28d:f87a]) by SG2PR04MB3160.apcprd04.prod.outlook.com
 ([fe80::415c:fb5f:f28d:f87a%7]) with mapi id 15.20.3153.028; Fri, 3 Jul 2020
 17:22:18 +0000
From: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Multi-host support in ipmbbridged and phosphor-host-ipmid
Thread-Topic: Multi-host support in ipmbbridged and phosphor-host-ipmid
Thread-Index: AdZRW6ztFSJjWqCCRaaKJObGR/aPLw==
Date: Fri, 3 Jul 2020 17:22:18 +0000
Message-ID: <SG2PR04MB316063EDE5B383B87F33D96BA76A0@SG2PR04MB3160.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiZWU2NjdmNTctYzc2NS00MTg2LTg3YmUtOWE0MzAzYWVlMjk2IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6InNCQ0FZTG02VU0wbjVNQ05iMHNxWkZMandUa25QWGd1b1NcL3JxS0dhbUlnYld2YTFXU3J0NGRXRHppbUQ0OFZCIn0=
x-hclclassification: null
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [171.61.248.64]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 71cb4a46-74b8-49ff-6b9a-08d81f75a6a1
x-ms-traffictypediagnostic: SG2PR04MB2396:|SG2PR04MB3383:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SG2PR04MB33832433602D87399C84F728A76A0@SG2PR04MB3383.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:6790;
x-forefront-prvs: 045315E1EE
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 8C52AF4Q6X2JV7gawC0j+Q1XN4GGxETtP7SklV80erCKDOPoiwf+kKh6VC+zVRioU7pp7c//GHVfhY1p9k3xnTzsDDms+BOTbIVsFyqKMoayhVfUZVaRfBtpqLfcnZkCVAWZd4YoHAgeA/QxoaNSnIdWzYAm7z8oE/GQ155Dbs6hjc1AF0F5D345Tta+tTjepj9S2MZHkJ74ZfQEXQDX66g1fGUqUgg0di9yaZkj/V0in+t9UNTckAoi9ec24H7RdMp7ai9OQUZ+m6f3RvjKGxvBRrsuuWZwi2dCdo2Saa0ZxHtmaohgGsXA10b/EC+3JWM7AU+RTJOAXBN8V7Mi2w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3160.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(71200400001)(55016002)(6506007)(4326008)(66616009)(2906002)(66476007)(6916009)(9686003)(66446008)(64756008)(66556008)(66946007)(52536014)(76116006)(186003)(8936002)(5660300002)(83380400001)(8676002)(54906003)(9326002)(86362001)(7416002)(316002)(7696005)(99936003)(26005)(33656002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: bkcLTFb9wN1Dm6XhHPkIt3nLCS/7W9uwSAVc2YanHIjjeZTMQBLE1ZaHyy28KZWc/OwxdJqOB+9WcOyc9Q0EXwMDU0zxHyOLHBvX/M9/hb6YElFdchD4XF1HH37Sv78VjoKFkLljw8XjY3fTMdINmY9mjNm2qd+HxZC8SvmPCbpgY2P9QeQSxa9KTY+Wx6zmw2RYXmi8kq3PbKOlpy5B/nMS8w4dVTD+BS52YIymGMVJ1TnlLqfRdQfh6EPS6k7sXqAQudiIin/2eRlN9ZiL30J6ssbLMF7rvsSVngjft7MGZ6qwJW7Lh46xcLGW1g7NtzsYR6cqULqKmzLyeOTW6P/JicCpuFJXuDG2NaTrHyEizrjm7EtZzE0je5e/kTI8x8/wGc6kqd3xRGS1SHg8+VSvXKObM2hQ9q4F37saLLy5ZgKdyXVflRGB2UcV+/NABCVJBZqtoqZBQFBwXawYRwT3B1h6fGFMhR4sZoV+H8U=
Content-Type: multipart/mixed;
 boundary="_004_SG2PR04MB316063EDE5B383B87F33D96BA76A0SG2PR04MB3160apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2396
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT032.eop-APC01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:192.8.245.54; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966005)(9686003)(55016002)(6916009)(8676002)(99936003)(4326008)(82740400003)(81166007)(21480400003)(33656002)(7696005)(356005)(336012)(82310400002)(54906003)(52536014)(7416002)(8936002)(186003)(478600001)(26005)(36906005)(9326002)(70586007)(86362001)(70206006)(6506007)(316002)(83380400001)(2906002)(235185007)(47076004)(5660300002)(66616009);
 DIR:OUT; SFP:1102; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: d33213bc-85b5-4708-50ea-08d81f75a368
X-Forefront-PRVS: 045315E1EE
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MgGgYLJ9bE86d1y+1SzWplpem+ahVB7eXCaVJu12G4mu+O5f0xNbSjImQe2tVPzEOPsv2d9WntHpn1/nII41SU305JCpSjgnl801Fmn0uBDHMpHYprBs4UVWLbJkO8uC21NOgaGKs+dQpKl9hVs0GSKFGEZVLeJwEqMODa+I6HzvcdYzWevk/U7r16lhhCeod86UiSqARLrdiif4monE/FwjycTHAbZi54hmT4KJR7gyqReJ4M+8EBUL0ok3VpomaxBOKxlismNSDgRiXF0RmXh9k8YuuusuG13nvtK3nhtIBTwa/6zowizwFWnK1OBCOQ0WAzmd1FjXpriAwq6NB+pq0p2Q+oO/g0kLiYx85WB83dYCX5EUKWlEDkW/mG/FnZoTbuz0DWR+nITo2j+fZw==
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2020 17:22:23.5618 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71cb4a46-74b8-49ff-6b9a-08d81f75a6a1
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.54];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT032.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3383
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
Cc: Dawid Frycki <dawid.frycki@intel.com>, Ed Tanous <ed.tanous@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 Adriana Kobylak <anoo@us.ibm.com>, Patrick Williams <patrickw3@fb.com>,
 Kumar Thangavel <thangavel.k@hcl.com>, Vijay Khemka <vijaykhemka@fb.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_004_SG2PR04MB316063EDE5B383B87F33D96BA76A0SG2PR04MB3160apcp_
Content-Type: multipart/alternative;
	boundary="_000_SG2PR04MB316063EDE5B383B87F33D96BA76A0SG2PR04MB3160apcp_"

--_000_SG2PR04MB316063EDE5B383B87F33D96BA76A0SG2PR04MB3160apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

We have a multi-host system and wanted to add support in openbmc to handle =
all ipmi commands. We have come up with the design approach that could help=
 us in handling ipmi command with multihost system. Please find the attache=
d design proposal and provide feedback/suggestions.

Regards,
Velu

::DISCLAIMER::
________________________________
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or incomplete, or may contain viruses in tran=
smission. The e mail and its contents (with or without referred errors) sha=
ll therefore not attach any liability on the originator or HCL or its affil=
iates. Views or opinions, if any, presented in this email are solely those =
of the author and may not necessarily reflect the views or opinions of HCL =
or its affiliates. Any form of reproduction, dissemination, copying, disclo=
sure, modification, distribution and / or publication of this message witho=
ut the prior written consent of authorized representative of HCL is strictl=
y prohibited. If you have received this email in error please delete it and=
 notify the sender immediately. Before opening any email and/or attachments=
, please check them for viruses and other defects.
________________________________

--_000_SG2PR04MB316063EDE5B383B87F33D96BA76A0SG2PR04MB3160apcp_
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
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We have a multi-host system and wanted to add suppor=
t in openbmc to handle all ipmi commands. We have come up with the design a=
pproach that could help us in handling ipmi command with multihost system. =
Please find the attached design proposal
 and provide feedback/suggestions.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Velu<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<font face=3D"Arial" color=3D"Gray" size=3D"1">::DISCLAIMER::<br>
<hr>
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or
 incomplete, or may contain viruses in transmission. The e mail and its con=
tents (with or without referred errors) shall therefore not attach any liab=
ility on the originator or HCL or its affiliates. Views or opinions, if any=
, presented in this email are solely
 those of the author and may not necessarily reflect the views or opinions =
of HCL or its affiliates. Any form of reproduction, dissemination, copying,=
 disclosure, modification, distribution and / or publication of this messag=
e without the prior written consent
 of authorized representative of HCL is strictly prohibited. If you have re=
ceived this email in error please delete it and notify the sender immediate=
ly. Before opening any email and/or attachments, please check them for viru=
ses and other defects.<br>
<hr>
</font>
</body>
</html>

--_000_SG2PR04MB316063EDE5B383B87F33D96BA76A0SG2PR04MB3160apcp_--

--_004_SG2PR04MB316063EDE5B383B87F33D96BA76A0SG2PR04MB3160apcp_
Content-Type: text/plain; name="multi-host-inband-ipmi-design-v1-0.txt"
Content-Description: multi-host-inband-ipmi-design-v1-0.txt
Content-Disposition: attachment;
	filename="multi-host-inband-ipmi-design-v1-0.txt"; size=4963;
	creation-date="Fri, 26 Jun 2020 15:09:52 GMT";
	modification-date="Fri, 03 Jul 2020 16:40:00 GMT"
Content-Transfer-Encoding: base64

DQoNCiMgTXVsdGktaG9zdCBJUE1JIGRlc2lnbg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoN
CkF1dGhvcnM6DQogIFZlbHVtYW5pIFQsIFt2ZWx1bWFuaXRAaGNsXShtYWlsdG86dmVsdW1hbml0
QGhjbC5jb20pDQogIEt1bWFyIFQsIFt0aGFuZ2F2ZWwua0BoY2wuY29tXShtYWlsdG86dGhhbmdh
dmVsLmtAaGNsLmNvbSkNCg0KUHJpbWFyeSBhc3NpZ25lZToNCiAgDQpPdGhlciBjb250cmlidXRv
cnM6DQoNCkNyZWF0ZWQ6DQogIDIwMjAtMDYtMjYNCg0KMS4gSXNzdWUgRGVzY3JpcHRpb25wdGlv
bjoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tDQpUaGUgY3VycmVudCB2ZXJzaW9uIG9mIG9wZW5ibWMg
ZG9lcyBub3Qgc3VwcG9ydCBtdWx0aS1ob3N0IGltcGxlbWVudGF0aW9uIGluIGlwbWkgDQpjb21t
YW5kcyBoYW5kbGluZy4gV2UgaGF2ZSBhIG11bHRpLWhvc3Qgc3lzdGVtIGFuZCBwcm9wb3Npbmcg
dGhlIGRlc2lnbiB0byANCnN1cHBvcnQgbXVsdGktaG9zdC4NCg0KQXMgZGV0YWlsZWQgYmVsb3cg
dGhlIGhvc3RzIGFyZSBjb25uZWN0ZWQgaW4gdGhlIGlwbWIgaW50ZXJmYWNlLCBhbGwgaG9zdCAN
CnJlbGF0ZWQgY29tbXVuaWNhdGlvbiBpcyBiYXNlZCBvbiBpcG1iLiBUaGUgb3BlbmJtYyB1c2Vz
IGlwbWJicmlkZ2VkIHRvIG1hbmFnZSANCmlwbWIgYnVzc2VzIGFuZCB0aGUgaXBtYiBtZXNzYWdl
cyBhcmUgcm91dGVkIHRvIGlwbWlkLg0KDQpJc3N1ZSAxOiBpcG1icmlkZ2VkIGRvZXMgbm90IHN1
cHBvcnQgbW9yZSB0aGFuIDIgY2hhbm5lbHMNCklzc3VlIDI6IGlwbWlkIGRvZXMgbm90IGhhdmUg
dGhlIGluZm9ybWF0aW9uIG9uIHdoaWNoIGlwbWIgY2hhbm5lbCB0aGUgcmVxdWVzdCANCmhhcyBj
b21lIGZyb20uIFRoZSBpcG1pZCBoYW5kbGVycyBzaG91bGQgaGF2ZSB0aGUgaG9zdCBkZXRhaWxz
IHRvIGZldGNoIHRoZSANCmhvc3Qgc3BlY2lmaWMgcmVzcG9uc2VzLg0KDQoyLiBJUE1JIGFuZCBJ
UE1CIFN5c3RlbSBhcmNoaXRlY3R1cmU6DQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KICAgICAgICstLS0tLS0tLS0tLSsgICAgICAgKy0tLS0tLS0tLS0tLSsgICAgICAr
LS0tLS0tLS0rDQogICAgICAgfCAgICAgICAgICAgfCAgICAgICB8ICAgICAgICAgICAgfCBpcG1i
MXwgICAgICAgIHwNCiAgICAgICB8ICAgICAgICAgICB8ICAgICAgIHwgICAgICAgICAgICB8LS0t
LS0tfCBIb3N0LTEgfA0KICAgICAgIHwgICAgICAgICAgIHwgICAgICAgfCAgICAgICAgICAgIHwg
ICAgICB8ICAgICAgICB8DQogICAgICAgfCAgICAgICAgICAgfCAgICAgICB8ICAgICAgICAgICAg
fCAgICAgICstLS0tLS0tLSsNCiAgICAgICB8ICAgICAgICAgICB8ICAgICAgIHwgICAgICAgICAg
ICB8DQogICAgICAgfCAgICAgICAgICAgfCAgICAgICB8ICAgICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICANCiAgICAgICB8ICAgICAgICAgICB8IGRidXMgIHwgICAgICAgICAgICB8ICAgICAg
Ky0tLS0tLS0tKyAgIA0KICAgICAgIHwgaXBtaWQgICAgIHwtLS0tLS0tfCBJcG1iYnJpZGdlZHwg
aXBtYjJ8ICAgICAgICB8ICAgDQogICAgICAgfCAgICAgICAgICAgfCAgICAgICB8ICAgICAgICAg
ICAgfC0tLS0tLXwgSG9zdC0yIHwgICANCiAgICAgICB8ICAgICAgICAgICB8ICAgICAgIHwgICAg
ICAgICAgICB8ICAgICAgfCAgICAgICAgfCAgIA0KICAgICAgIHwgICAgICAgICAgIHwgICAgICAg
fCAgICAgICAgICAgIHwgICAgICArLS0tLS0tLS0rICAgDQogICAgICAgfCAgICAgICAgICAgfCAg
ICAgICB8ICAgICAgICAgICAgfA0KICAgICAgIHwgICAgICAgICAgIHwgICAgICAgfCAgICAgICAg
ICAgIHwgICAgICAgICAgICAgICAgICAgDQogICAgICAgfCAgICAgICAgICAgfCAgICAgICB8ICAg
ICAgICAgICAgfCAgICAgICstLS0tLS0tLSsgICANCiAgICAgICB8ICAgICAgICAgICB8ICAgICAg
IHwgICAgICAgICAgICB8IGlwbWIgfCAgICAgICAgfCAgIA0KICAgICAgIHwgICAgICAgICAgIHwg
ICAgICAgfCAgICAgICAgICAgIHwtLS0tLS18IEhvc3QtTiB8ICAgDQogICAgICAgfCAgICAgICAg
ICAgfCAgICAgICB8ICAgICAgICAgICAgfCAgICAgIHwgICAgICAgIHwgICANCiAgICAgICArLS0t
LS0tLS0tLS0rICAgICAgICstLS0tLS0tLS0tLS0rICAgICAgKy0tLS0tLS0tKyAgIA0KCSAgIA0K
SG9zdHMgYXJlIGNvbm5lY3RlZCB3aXRoIGlwbWIgaW50ZXJmYWNlLCB0aGUgaG9zdHMgY2FuIGJl
IDEgdG8gTi4gVGhlIGlwbWIgDQpyZXF1ZXN0IGNvbWluZyBmcm9tIHRoZSBob3N0cyBhcmUgcm91
dGVkIHRvIGlwbWlkIGJ5IHRoZSBpcG1iYnJpZGdlZC4NClRoZSBpcG1kIHJlcXVlc3RzIGFyZSBy
b3V0ZWQgZnJvbSBpcG1pZCBvciBhbnkgc2VydmljZSBieSBkLWJ1cyBpbnRlcmZhY2UgYW5kDQp0
aGUgaXBtYmJyaWRnZWQgcm91dGVzIHRvIGlwbWIgaW50ZXJmYWNlLg0KDQozLiBQcm9wb3NlZCBE
ZXNpZ246DQotLS0tLS0tLS0tLS0tLS0tLS0tLQ0KVG8gYWRkcmVzcyBpc3N1ZTEgYW5kIGlzc3Vl
Miwgd2UgcHJvcG9zZSB0aGUgZm9sbG93aW5nIGRlc2lnbiBjaGFuZ2VzIGluIA0KaXBtYmJyaWRn
ZWQgYW5kIGlwbWlkLg0KDQozLjEgQ2hhbmdlcyBpbiBpcG1iYnJpZGdlZDoNCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KVGhlIGN1cnJlbnQgaXBtYmJyaWRnZWQgc3VwcG9ydHMgb25seSAy
IGNoYW5uZWxzIGFuZCB0aGlzIG5lZWRzIHRvIGJlIA0KZW5oYW5jZWQgdG8gbW9yZSBjaGFubmVs
cy4NCmlwbWJicmlkZ2VkIHRvIHNlbmQgdGhlIGNoYW5uZWwgZGV0YWlscyBmcm9tIHdoZXJlIHRo
ZSByZXF1ZXN0IGlzIHJlY2VpdmVkDQoNCjMuMS4xIENoYW5nZTEgOiBzdXBwb3J0IG1vcmUgdGhh
biAyIGNoYW5uZWxzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NClRvIHN1cHBvcnQgbW9yZSB0aGFuIDIgY2hhbm5lbHMsIHdlIHByb3Bvc2UgdG8gYWRkIGFk
ZGl0aW9uYWwgY2hhbm5lbHMgbmFtZWQgDQoiaG9zdDEiLCAiaG9zdDIiIC4uLiJob3N0biINCg0K
VGhpcyBjYW4gYmUgZGVjaWRlZCBieSB0aGUgY29uZmlnIGZpbGUgImlwbWItY2hhbm5lbHMuanNv
biIsIFRoZSBjaGFuZ2Ugd2lsbCANCmxvb2sgbGlrZSBiZWxvdw0KDQp7DQogICJjaGFubmVscyI6
IFsNCiAgICB7DQogICAgICAidHlwZSI6ICJtZSIsDQogICAgICAic2xhdmUtcGF0aCI6ICIvZGV2
L2lwbWItMSIsDQogICAgICAiYm1jLWFkZHIiOiAzMiwNCiAgICAgICJyZW1vdGUtYWRkciI6IDQ0
DQogICAgfSwNCiAgICB7DQogICAgICAidHlwZSI6ICJpcG1iIiwNCiAgICAgICJzbGF2ZS1wYXRo
IjogIi9kZXYvaXBtYi0yIiwNCiAgICAgICJibWMtYWRkciI6IDMyLA0KICAgICAgInJlbW90ZS1h
ZGRyIjogOTYNCiAgICB9DQoJew0KICAgICAgInR5cGUiOiAiaG9zdDEiLA0KICAgICAgInNsYXZl
LXBhdGgiOiAiL2Rldi9pcG1iLTMiLA0KICAgICAgImJtYy1hZGRyIjogMzIsDQogICAgICAicmVt
b3RlLWFkZHIiOiA2NA0KICAgIH0NCgl7DQogICAgICAidHlwZSI6ICJob3N0MiIsDQogICAgICAi
c2xhdmUtcGF0aCI6ICIvZGV2L2lwbWItNCIsDQogICAgICAiYm1jLWFkZHIiOiAzMiwNCiAgICAg
ICJyZW1vdGUtYWRkciI6IDY0DQogICAgfQ0KCXsNCiAgICAgICJ0eXBlIjogImhvc3QzIiwNCiAg
ICAgICJzbGF2ZS1wYXRoIjogIi9kZXYvaXBtYi00IiwNCiAgICAgICJibWMtYWRkciI6IDMyLA0K
ICAgICAgInJlbW90ZS1hZGRyIjogNjQNCiAgICB9DQogIF0NCn0NCg0KUmVhZGluZyB0aGUganNv
biBmaWxlIGlwbWJicmlkZ2VkIHRvIHN1cHBvcnQgaG9zdCBjaGFubmVscyBvcHRpb25hbGx5Lg0K
DQozLjEuMi4gQ2hhbmdlIDI6IFNlbmRpbmcgSG9zdCBkZXRhaWwgYXMgYWRkaW9uYWwgcGFyYW1l
dGVyDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQ0KV2hpbGUgcm91dGluZyB0aGUgaXBtYiByZXF1ZXN0cyBjb21pbmcgZnJvbSB0aGUg
aG9zdCBjaGFubmVsLCB0aGUgaXBtYmJyaWRnZWQgDQphZGRzIHRoZSBpcG1iIGJ1cyBkZXRhaWxz
IGNvbmZpZ3VyZWQgaW4gdGhlIGpzb24gZmlsZSBrZXkgInR5cGUiLiANCkluIHRoZSBhYm92ZSBl
eGFtcGxlIHRoZSBpcG1iIHJlcXVlc3QgY29taW5nIGZyb20gIi9kZXYvaXBtYi00IiB0aGUgaXBt
YiB3aWxsIA0Kc2VuZCAiaG9zdDIiIGFzIG9wdGlvbmFsIHBhcmFtZXRlciBpbiB0aGUgZC1idXMg
aW50ZXJmYWNlIHRvIGlwbWlkLg0KDQozLjIgQ2hhbmdlcyBpbiBpcG1pZDoNCi0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KUmVjZWl2ZSB0aGUgb3B0aW9uYWwgcGFyYW1ldGVyIHNlbnQgYnkgdGhlIGlw
bWJicmlnZWQgYXMgaG9zdCBkZXRhaWxzLCB3aGlsZSANCnJlY2VpdmluZyB0aGUgcGFyYW1ldGVy
IGluIHRoZSBleGVjdXRpb25FbnRyeSBtZXRob2QgY2FsbCB0aGUgc2FtZSB3aWxsIGJlIA0KcGFz
c2VkIHRvIHRoZSBjb21tYW5kIGhhbmRsZXJzIGluIGJvdGggY29tbW9uIGFuZCBvZW0gaGFuZGxl
cnMuDQpUaGUgY29tbWFuZCBoYW5kbGVycyBjYW4gbWFrZSB1c2Ugb2YgdGhlIGhvc3QgaW5mb3Jt
YXRpb24gdG8gZmV0Y2ggaG9zdCANCnNwZWNpZmljIGRhdGEuDQoNCkZvciBleGFtcGxlLCBob3N0
MSBzZW5kIGEgcmVxdWVzdCB0byBnZXQgYm9vdCBvcmRlciBmcm9tIGJtYywgYm1jIG1haW50YWlu
cyANCmRhdGEgc2VwYXJhdGVseSBmb3IgZWFjaCBob3N0LiBXaGVuIHRoaXMgY29tbWFuZCBjb21l
cyB0byBpcG1pZCB0aGUgY29tbWFuZHMgDQpoYW5kbGVyIGdldHMgdGhlIGhvc3QgaW4gd2hpY2gg
dGhlIGNvbW1hbmQgcmVjZWl2ZWQuIFRoZSBoYW5kbGVyIHdpbGwgZmV0Y2gNCmhvc3QxIGJvb3Qg
b3JkZXIgZGV0YWlscyBhbmQgcmVzcG9uZCBmcm9tIHRoZSBjb21tYW5kIGhhbmRsZXIuIFRoaXMg
aXMgDQphcHBsaWNhYmxlIGZvciBib3RoIGNvbW1vbiBhbmQgb2VtIGhhbmRsZXJzLg0KDQoNCg0K
DQoNCg==

--_004_SG2PR04MB316063EDE5B383B87F33D96BA76A0SG2PR04MB3160apcp_--
