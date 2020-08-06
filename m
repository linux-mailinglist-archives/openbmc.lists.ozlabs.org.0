Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B37523D94D
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 12:37:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMlLP4SFtzDqn2
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 20:37:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=hcl.com (client-ip=2a01:111:f400:febd::72c;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=iVhg52j9; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=iVhg52j9; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sg2apc01on072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febd::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMlKW5dSnzDqLn
 for <openbmc@lists.ozlabs.org>; Thu,  6 Aug 2020 20:36:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNVxT7vX/qdg066hsznFxJCbbv4/urk3ljyDmRpgJbo=;
 b=iVhg52j9dUyH/fE3zyJlkxCGNEQjWh7JxaUMoaKnDNgpVGEK8ckRd9PW54Nxg+lboxxMu3iF+gsfslrpMkTFJDlbfkmMbL+0mhc89fV1j7BEYfC6sDD4T1kCOjheTkFWdSPZBMdkM+5lwD3++y6kfFhsfDDvpEqj8VA61zgw/PU=
Received: from SG2PR04CA0146.apcprd04.prod.outlook.com (2603:1096:3:16::30) by
 HK2PR0401MB2051.apcprd04.prod.outlook.com (2603:1096:202:4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Thu, 6 Aug
 2020 10:36:37 +0000
Received: from SG2APC01FT020.eop-APC01.prod.protection.outlook.com
 (2603:1096:3:16:cafe::d0) by SG2PR04CA0146.outlook.office365.com
 (2603:1096:3:16::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend
 Transport; Thu, 6 Aug 2020 10:36:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.52)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=permerror action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.52 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.52; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.52) by
 SG2APC01FT020.mail.protection.outlook.com (10.152.250.219) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.16 via Frontend Transport; Thu, 6 Aug 2020 10:36:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/R/pXJKeDZ1EhZE0eK2PPJIF2MMyclIAeCU8dQjX0VY//NBPbbx/7zJgiOlwtFHl5/M5M4t6jbVdzqbp1uCrWM+ATywHkw2TPtp2rGkBD5706g6hsrul02bHbN4YVITkbztS38O12T4H0h6Okw1jfrxkVf3My90iMVqoK/BpcQLI4YJUY8NmXBMRKx2YF3sth6VjHL5D0OjC0XK46hnB35a4p83sZJWcPFGxGxyPl4gJ8o/qyl4AVNsFAxwHdOfML5j5/3h+6HavlwhBZJZxN6FdNaD2NkooRH7FXBaqB0pyGlNEZERkbeaov+LysiEB9yYfjEdmwO09jBF36RlzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNVxT7vX/qdg066hsznFxJCbbv4/urk3ljyDmRpgJbo=;
 b=E9F/97joDphJ9J2XZVTQLD2KD9c2/pKHcmOrKbJ6+uulDYAmCdzk20/NmNXl4p+HboMedX0R6qMucQmo8s/NV1WOBFWAC4ThCmxR4L7VRgJgPwW0wfxdgaohpqUfdR03P6KwOdAsonU4C9+Ny6prDF1/gF5SM16lPjXesIgb2B068zdRgibtLp1oVW2ekpg4SHo7baiefqAzH/07oCWA2G/FAQC6fNlxf7+hqKQfOnXQ/mJ/jtVbr1lFYpv8wFI9lH7QSTq9Gmma1fwwnPRd09wdR1lDEtREJZlz22mLvn/w8CcD67J8B9alqhZw85Fwnhuk4U6PmJA+27bH1MUWOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNVxT7vX/qdg066hsznFxJCbbv4/urk3ljyDmRpgJbo=;
 b=iVhg52j9dUyH/fE3zyJlkxCGNEQjWh7JxaUMoaKnDNgpVGEK8ckRd9PW54Nxg+lboxxMu3iF+gsfslrpMkTFJDlbfkmMbL+0mhc89fV1j7BEYfC6sDD4T1kCOjheTkFWdSPZBMdkM+5lwD3++y6kfFhsfDDvpEqj8VA61zgw/PU=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB4090.apcprd04.prod.outlook.com (2603:1096:0:f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17; Thu, 6 Aug 2020 10:36:34 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::41e0:35f:a74a:e1cf]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::41e0:35f:a74a:e1cf%7]) with mapi id 15.20.3261.019; Thu, 6 Aug 2020
 10:36:34 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Host related testcases in openbmc-test-automation
Thread-Topic: Host related testcases in openbmc-test-automation
Thread-Index: AdZr3RuhNs3q/dl3R662LjPrKexDnQ==
Date: Thu, 6 Aug 2020 10:36:34 +0000
Message-ID: <SG2PR04MB3093C5E6BF183CAEC4D5900EE1480@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiZDY0OGQyNTMtYzA2NC00NWExLTg5MTUtODgyMTNkMjM2OTcyIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IjVDZEgwbXQwY285NGQySXlJbGdNQWlybDlkK25mWjVpckkxY0JWSlBIbnNlaDJCbEpRaXlqVGNoTEJzWlAzcU0ifQ==
x-hclclassification: null
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:5:161b:bdc1:ccaa:90d6:7f2]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 22aa0a7f-d831-42b1-cd95-08d839f49841
x-ms-traffictypediagnostic: SG2PR04MB4090:|HK2PR0401MB2051:
X-Microsoft-Antispam-PRVS: <HK2PR0401MB20514F91C1F14EDAA00C2156E1480@HK2PR0401MB2051.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: lau7r4HM+Njm9XrKpu4Rof626QRoJdGQMSm9cDJxK+9wU/UVRGOR005XZJ8141U64JBGyWRMS0gkmolymXMEZz71gFRtezHnhHOlJTx8P0IOkviVo19uwNiJdIQsGPI5YhkKVOyf5t5W7IGh5h+pJN5cFZI+5exPhW5i7PleAqjGnomSnWujNL7fgUbmZsjAPTicbzuKJ2tMoRfz+ZHmxwYuLbiqSeRvKozXlvpAtSoiF8nuk8vFr2JrsVMQfnhElnf+Gm3Yd3AKkdsjn5cg2o+Mn82bTdgtYGa3MOfAVD0JclrSR5+X9u0OMM8eezxfkJAeAyAEBlfJXcii3z+Cohl3maGKxxd1tNUnf8twZGc/d7u8uDVpykwLhL3EZQGIUj0O50uDzq9V0mmO3Cdicg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(71200400001)(166002)(5660300002)(86362001)(83380400001)(478600001)(55016002)(9686003)(2906002)(66946007)(6916009)(6506007)(7696005)(52536014)(316002)(76116006)(186003)(9326002)(8676002)(66476007)(66556008)(66446008)(64756008)(8936002)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: JhIWrCO51YMBRq2pAuB0+fk1uT/ohRLWSjU+Al0mZkMCm05pCpd/dLesKWayncjLkjxNBY+3b9mfEGNDa4S4wVF0y+HbMCLYWK8xxPUb8U6MnpfmUBBY6ycEvR4scRZkrNLfwjj22+0lWNb92BsHeGTAtMnDG+1nVewxbCZrZOA6skgADrRhGlojYims2rV7il5HSfnCaGIDlNXGnUmD6XBPD3Kc2MM6brMV/dQE/I2rBaiyGGIZ7uVBSLMOSzrIG9RcPRnVEPAHtNqGWw6/+430Uob0oGdNBy5gWbd+WwAO2TK8thVl3HVE8zDPDZczi8CrpGghyw70k6FJy0RsMHDAiq6UbhTAqINIYI1SqPYPxqWJi/dC08keLE5IQmhw/FHKCuNS0z+9DMgaRNMdVTC4SQyTosm4YPuSsY4NPrn8F0EwIXR5J2hrvWEsFOu2T9XI0EJ8WSc22jNUHVghS3RO2WKw50HUOgxO8SiHDJd5hPB5JJWGKJT/AsMo0eFqEVkwLhZj4L6tgqOyL3jDdi54STJykA0EA2S2uWqE8nxAhfasLxA87XSSfBSrda2pURhuGvgih2Mwgck/UhkikA2TlOcvZJCg9V/DbA2nqsyA1jKA69xKzGPTKmwAcTdOSQ/I/vRaGAAaLfMiBqLvU/mKSZ/lu6fWHQH3ttwSKGM2Xf9XUz6GFgWx2F4uJbIgsi1FPz4/5abCOBOJxbrboQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB3093C5E6BF183CAEC4D5900EE1480SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB4090
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT020.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8301dfd0-a129-4110-1166-08d839f4971c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DJdJAxokqX7IcOEb10eOStQE3XrpgtenVyKk+GiP/lrsietEMsRFgF1B07WJm4l1fQp53Oeh7JXckMIMqYgoMG+F+q5TVunGmEofA02pBdCMABBJxKfIyvxVTbOBaNzqvyOVapd7mJVezu37tpGdKB7IgNzpG7QIKSa9ti2FjZOn09VJ8/NMa0JOkA6SjE2FBg+ljMk3S/IVJuoN50uYK77Ok9eQtS5p1OmjaJmgTeXfZbOTBqycxLu9zHbenSPYZfzpaWCQIru+2a05+NKstYeqtmeCy8aivM5jssCYWUdmf/ZoruuOoviGNus0c59ymJKIRxIDRlTOERnnUH8Uj0N1Srk7pGwqGgG4bAv/nYpLgpJ3GoXc6ZoNvTXnmZQtPEqRak9P1qlwbMC08miUN6Cl2pjdpB+vP2IzUdwibPcuHI549toS10iKfHxzK/fWrD8RdLHWmbuMAPelTW38H0YVGgElFAnSBrUQoY347hE=
X-Forefront-Antispam-Report: CIP:192.8.245.52; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966005)(186003)(8676002)(478600001)(55016002)(70206006)(7696005)(70586007)(2906002)(6506007)(9686003)(336012)(26005)(8936002)(33656002)(47076004)(5660300002)(6916009)(9326002)(83380400001)(82740400003)(86362001)(316002)(356005)(36906005)(82310400002)(166002)(52536014)(81166007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 10:36:35.9039 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22aa0a7f-d831-42b1-cd95-08d839f49841
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.52];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT020.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0401MB2051
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

--_000_SG2PR04MB3093C5E6BF183CAEC4D5900EE1480SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

I need to test the below features in openbmc-test-automation.
Is there any related testcases to verify those features?

1. OBMC-CONSOLE - To connect the host via BMC, we are using obmc-console-cl=
ient to login the host and check the host conections.
   (https://github.com/openbmc/obmc-console)

2. HOST LOGGER - To handle and store host's console output data, such as bo=
ot logs.
   (https://github.com/openbmc/phosphor-hostlogger)


Regards,
Jayashree

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

--_000_SG2PR04MB3093C5E6BF183CAEC4D5900EE1480SG2PR04MB3093apcp_
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
<p class=3D"MsoNormal">I need to test the below features in openbmc-test-au=
tomation.<o:p></o:p></p>
<p class=3D"MsoNormal">Is there any related testcases to verify those featu=
res?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">1. OBMC-CONSOLE - To connect the host via BMC, we ar=
e using obmc-console-client to login the host and check the host conections=
.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; (<a href=3D"https://github.com/openbmc/=
obmc-console">https://github.com/openbmc/obmc-console</a>)<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">2. HOST LOGGER - To handle and store host's console =
output data, such as boot logs.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; (<a href=3D"https://github.com/openbmc/=
phosphor-hostlogger">https://github.com/openbmc/phosphor-hostlogger</a>)<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jayashree<o:p></o:p></p>
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

--_000_SG2PR04MB3093C5E6BF183CAEC4D5900EE1480SG2PR04MB3093apcp_--
