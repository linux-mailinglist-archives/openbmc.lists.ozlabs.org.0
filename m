Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE95231094
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 19:10:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGNV85kwWzDr3p
	for <lists+openbmc@lfdr.de>; Wed, 29 Jul 2020 03:10:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=hcl.com (client-ip=2a01:111:f400:febe::71c;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=velumanit@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=KNls7+bJ; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=KNls7+bJ; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-pu1apc01on071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febe::71c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGNTH4jxlzDqnF
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jul 2020 03:09:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3hWKFcUiBuYKs8y9Ey80AHJ5EueZIi6mrfhUb50Pus=;
 b=KNls7+bJQXB+x8QrvOP+p5aXYQuxKEXUbbabg8EhhDkQPTSwJZv5DgeGQKtU8PVgUeelYNuP/wMyISg7JXLmkjoE3m5+Erb3+eOphW+qPzC/oz8aG15DZ0YEUsv5R40fZyNGcSBPujbslRkDt3+6YG5AA4tkXDjDbJo6dsYYG1o=
Received: from SLXP216CA0066.KORP216.PROD.OUTLOOK.COM (2603:1096:100:5::28) by
 HK0PR04MB2435.apcprd04.prod.outlook.com (2603:1096:203:45::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.23; Tue, 28 Jul 2020 17:09:41 +0000
Received: from PU1APC01FT056.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:5:cafe::9b) by SLXP216CA0066.outlook.office365.com
 (2603:1096:100:5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Tue, 28 Jul 2020 17:09:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.59)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=permerror action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.59; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.195.59) by
 PU1APC01FT056.mail.protection.outlook.com (10.152.253.98) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.10 via Frontend Transport; Tue, 28 Jul 2020 17:09:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5iiZF/irXik2vt/g506V+4f9TPDBOHSWVGhtETu6bBmulJWka4qefrCyLs8MC55wmHA27i9s4ZqEOarXh5sWWfSUCcNx/1Qm0bzhKmrKuXiXEsJGdtaUG47RIH/mXqSi1d9SDTlAZ6A0mx85Enta32h9fBC5R18yg8IUf+/T04yGS/in4DPFcJsDQsepYJRJaayuxmAOgpsinSxZhSlA4KdHUOHS6F7dEF2kw8xIG0ltIxxMRJM82G/sB1th38NlShMm7dIu6nrtk5xUAYdimXKxZH0sdgk6GIZAi7RYykI7AScn8f5xh+4rHmuA2khOuGVVfqMcHQM+YH2NAV1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3hWKFcUiBuYKs8y9Ey80AHJ5EueZIi6mrfhUb50Pus=;
 b=g5G6c0X4yEpBVHDjzP60Eh+hPCatwTiBq3eZsFJ3LJz/JiOxVjSFzIksgskKOegxyrdG2EVcqqs1/z1WM9bnjuEb7AqUgRnOK21JgTf3zbBs/pS0FQkHP2B75Vs2l3V5Hu9uTVrccKFey7W12CMnXpSGsnhwP63ikitvUVP9jxDLLQaFL+qGuZ2RkF8O8ingwjNJZ1v/m5ymTyNPgDDTu23btSUEjvcO/CXWmEsVTY4UnuO6OeT8UCQxDEFzSgkXw4TyKZWPqS8Dre3B9OxVX9xF3T8GNrCOH/zPtqjOzExkhncJ69qgjRJLpEcBCFXwN5RcKpeBX5LbP1NSUlW1mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3hWKFcUiBuYKs8y9Ey80AHJ5EueZIi6mrfhUb50Pus=;
 b=KNls7+bJQXB+x8QrvOP+p5aXYQuxKEXUbbabg8EhhDkQPTSwJZv5DgeGQKtU8PVgUeelYNuP/wMyISg7JXLmkjoE3m5+Erb3+eOphW+qPzC/oz8aG15DZ0YEUsv5R40fZyNGcSBPujbslRkDt3+6YG5AA4tkXDjDbJo6dsYYG1o=
Received: from HK0PR04MB3153.apcprd04.prod.outlook.com (2603:1096:203:80::9)
 by HK0PR04MB2627.apcprd04.prod.outlook.com (2603:1096:203:65::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Tue, 28 Jul
 2020 17:09:33 +0000
Received: from HK0PR04MB3153.apcprd04.prod.outlook.com
 ([fe80::41c7:ca16:98b6:9f1a]) by HK0PR04MB3153.apcprd04.prod.outlook.com
 ([fe80::41c7:ca16:98b6:9f1a%7]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 17:09:33 +0000
From: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: x86-power-control - slot AC cycle
Thread-Topic: x86-power-control - slot AC cycle
Thread-Index: AdZk/4O+ACg3KsIESPq1JaZkBQJ4Hw==
Date: Tue, 28 Jul 2020 17:09:33 +0000
Message-ID: <HK0PR04MB3153FFBD73CC1A4F35D88886A7730@HK0PR04MB3153.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNWE3MjI3NGYtYWRlZi00NDIzLWI1MDMtYzlhNzc2NWU1YzYzIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6Ijhtc0RER0dhWW41cFUzcmVGTHNXYTh3MU9Wa2dKOEhUbDJIRzVnWHVhVXBIU2xsUXk3bkE1ZXZcL2RTZlZwR00yIn0=
x-hclclassification: null
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [122.174.180.60]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3e4c220e-8af7-486b-9343-08d8331903db
x-ms-traffictypediagnostic: HK0PR04MB2627:|HK0PR04MB2435:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HK0PR04MB2435F235718B458E5BD3FC26A7730@HK0PR04MB2435.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: SfKOZ25rtH2QXWfb4p7b83IdTuxXz4omrBO+SK/R4MDs4p3zytDm6BZ809YUgCCerO86mxbcDzOKITeaCpGH5eMgPbn8ZNd2wKJoYRapU6LrBRpjz1PB/2A97YeDnKlBIMNXrrV+wMhbO+wEzU4YsSs6OKCDnfGMuUmLJK5qLXEhNlUT9JPxb4SYDAzOEjK7mn3bcdU6pQIVuSU5zJ219wf2UPNClg/p0nq1yETm3klHBOM126kQiOdJlXTon9LfFcRBayqzj9A7Q2PRTt6nbLwLMfJysm+3X97/nnMT47ntZKIAcMYZv32E11zKv6S+
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB3153.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(4326008)(64756008)(66556008)(8676002)(66476007)(66446008)(71200400001)(478600001)(66946007)(8936002)(186003)(54906003)(7696005)(52536014)(316002)(6506007)(26005)(9686003)(76116006)(83380400001)(86362001)(33656002)(5660300002)(2906002)(55016002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: EiZelA/OEqgc327toDhARF6ZjmmMZ4gTOxTd2212dp0yqmLrwn35IaRFkMHNj31Na+UdyT/4q2eT8nFzeWppkMu7KayKyNpkskLsUaTS3Q4xduhpDHiM29V/g2RPuwkLKzzPexh539ILMRV/z53U4ZdFNHHSbbw+Z38gB6FtXST01bZepcVbyjPT/BAnRz9LGFLp9lsW0b2yLmeby53yXMSRc3PUbehzrFRRNeXEKsA3wZbSpxDsHmu/wCjJAKxFnXYupjHmNbcFLRneNzhexF9RaMwaEiQfGYGTMri2CwjH93cnFx0waisqOd3UmsTDcJbHqoogM+pOwxmY+xWWpJ8cHyc9TLkhuYB63EZ7rMvmPNHNxIqVPu3DZBrljoPhDJSW1uJbZajuQ6RFWzynBvwWYghdnGlop4CiJiU2syrIaRapTo7J2nC28fZGvU5HDRonJ55j5+tlhkRqad1/LuvIQzqRReQgBwF7jSL/MOirluDmcnMewTCR0ZpCXy5P/R6iSE05GrpSSkXTlNpI1N6dWyNg/CD8fs0fCaj1Ozbgtv/dKIDwEskTXZaWTiZ7iuIfmtEUN4haGkaQ/zOVcAzyms2JvV75pyiy6Y10v/MuARPiE8pivjLE/5ErrPfrYxWPF8+a1M9CHt5/UOlbzg==
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB3153FFBD73CC1A4F35D88886A7730HK0PR04MB3153apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2627
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT056.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: fa293c49-df22-4d6e-ac7b-08d83318ffdf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Nz9wbWBlITl9QG7StDr4ZhpXQPG6pR05ur1DZ6FkmWKw5hjWJTT2Y0tB3yC1AA2Q4fQM/ZtU6ksTIoZDCl2gLizAOldxejMQM7ZYpABWs3YvWkPmv6DZRd6F4OEqKbMLBG2om9bL4uPYQIjPv1KVYaTa/Yb6v4mX78CfmWz57V4UyM+2UXHrrCXLOdazeZL/El+e6jfhqA6C1FE2ElQthqSYsbiavRIiU5Vxa7NqlA3E06Y0Pj4tA6vOj1xloySt+oWIImGC+EpP8PCiQ8BR6SSGu0qei4R2vlo5hYk2onBUpB2yLU7vO2c39XgQCDpEaIFGD9u+dr06mtxBqDK7DwVQzDJrGTZJR/6Q+PvfmfF8A4jPCNWtQ8ckRDInsDbBZgrCe8r1qK6YuJVN591HA==
X-Forefront-Antispam-Report: CIP:192.8.195.59; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966005)(8676002)(7696005)(8936002)(33656002)(336012)(82740400003)(4326008)(6916009)(26005)(83380400001)(186003)(52536014)(81166007)(356005)(86362001)(82310400002)(5660300002)(36906005)(47076004)(2906002)(6506007)(54906003)(478600001)(316002)(55016002)(9686003)(70206006)(70586007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 17:09:39.8399 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e4c220e-8af7-486b-9343-08d8331903db
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.59];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT056.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2435
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
Cc: Jason Bills <jason.m.bills@intel.com>,
 "P. Priyatharshan" <PriyatharshanP@hcl.com>,
 James Feist <james.feist@intel.com>, Kuiying Wang <kuiying.wang@intel.com>,
 Patrick Williams <patrickw3@fb.com>, Kumar Thangavel <thangavel.k@hcl.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB3153FFBD73CC1A4F35D88886A7730HK0PR04MB3153apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi team,

We are using a x86-power-control for host power control in a multi host sys=
tem. We have the host as FRU and it can be plugged in to a slot. The slot h=
as an option to control slot power and this can be used for a AC cycle.
We propose to add the slot power control in the x86-power-control, The slot=
 power control can be configured in json and the same can be implemented re=
ading the json config. We can ensure the existing functionality remains unc=
hnged and does not affect the other platforms.

The config file can have a gpio entry with the new key "Slot_Power". Only i=
f this entry is present then the slot power will be handled, Otherwise the =
existing functionality remains the same. Please provide your comments/sugge=
stions for this proposed approach.

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

--_000_HK0PR04MB3153FFBD73CC1A4F35D88886A7730HK0PR04MB3153apcp_
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
<p class=3D"MsoNormal">Hi team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are using a x86-power-control for host power cont=
rol in a multi host system. We have the host as FRU and it can be plugged i=
n to a slot. The slot has an option to control slot power and this can be u=
sed for a AC cycle.<o:p></o:p></p>
<p class=3D"MsoNormal">We propose to add the slot power control in the x86-=
power-control, The slot power control can be configured in json and the sam=
e can be implemented reading the json config. We can ensure the existing fu=
nctionality remains unchnged and does
 not affect the other platforms.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The config file can have a gpio entry with the new k=
ey &#8220;Slot_Power&#8221;. Only if this entry is present then the slot po=
wer will be handled, Otherwise the existing functionality remains the same.=
 Please provide your comments/suggestions for
 this proposed approach.<o:p></o:p></p>
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

--_000_HK0PR04MB3153FFBD73CC1A4F35D88886A7730HK0PR04MB3153apcp_--
