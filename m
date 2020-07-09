Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE393219BFE
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 11:22:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2W0T4pgqzDr32
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 19:22:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.99; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=eJS3dbv4; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=eJS3dbv4; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300099.outbound.protection.outlook.com [40.107.130.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2VzM51FbzDqxB
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jul 2020 19:21:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOyylcU2IY1L8xC6L0Q/tmrLwNn3yZCYH6VHfxjnmPc=;
 b=eJS3dbv40dNLETHjnZhBNkYSDQI/zJ35pSRCpj+eRvUBMLWO4XNLzsi7fHkDqdKVia9kxbEsiLEhbVwEXWKTDxX2XR484zh2O3YjyJAC+wqHySmL85LmlT+ZJ/w3TItKr6JjX2Ch2/hf9GNOhog0+zRlKzbp9D22SsPQXqQYAqg=
Received: from SG2PR06CA0123.apcprd06.prod.outlook.com (2603:1096:1:1d::25) by
 SG2PR04MB3930.apcprd04.prod.outlook.com (2603:1096:0:8::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.22; Thu, 9 Jul 2020 09:21:12 +0000
Received: from HK2APC01FT061.eop-APC01.prod.protection.outlook.com
 (2603:1096:1:1d:cafe::27) by SG2PR06CA0123.outlook.office365.com
 (2603:1096:1:1d::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Thu, 9 Jul 2020 09:21:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.54)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.54 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.54; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.54) by
 HK2APC01FT061.mail.protection.outlook.com (10.152.249.105) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Thu, 9 Jul 2020 09:21:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SXCt3Lq5HJsRAgY+0zma2ooaa4k2GknAiFROzaEIv0FlbPrTchFw4CpNFw2Z3hiDS4xEr+QPsVwkwCturGMU8SjLeQidGv1DCwkCITYaS5t66Aw/BW7jumxNm5sGzA4Y6UPwYYbl4yPbdPsEby+J3BSqGKfKut3bPq5JLN+NJ4Lo2MJ2vIX71Gd6TyJCE70c8O+oKOTvRlwEWl8KpBYeZ691+jPuqqhBAxrrVk0zprFEqKncV+tWQBiCl75MZorQbeygzsr2BexxsjRhNC8bmeKTbBrS0a80fvtKgi/e7L4opov28tyNkG9mfCVeAOLf0v254rRDYoKwbGJfvrNM+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOyylcU2IY1L8xC6L0Q/tmrLwNn3yZCYH6VHfxjnmPc=;
 b=dv0SNymFdJS1KJVkX4+qJZmXcbyE6/5ZvgAYlSolGTclrdH0oEoH2WXfTeStnJYNJ9mhdUqKg4clFdv0WT3lxcL0xRlupo0B+es1eKmGlJ+NDfacG+hiX2wEC8+1yOgeBEOZ8z0ILL6SZliL1VLOcMOI0WMcTstgywtBVAde70pIX+oJmL9tqHwpVsw63HoPoSdcBzs+vHaGbPyzEZRbT/2AkTAQ39+rkEj65vqN9cfhEKj5XtTGsAjvZCcDAvLF7k37Wkg+VCE6+oJ7ZxWTQJHNuizns8IZoDbi690CQpatC/im530O+CxUCTGjY3QpyyE6amUij3cstrwtgwDA5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XOyylcU2IY1L8xC6L0Q/tmrLwNn3yZCYH6VHfxjnmPc=;
 b=eJS3dbv40dNLETHjnZhBNkYSDQI/zJ35pSRCpj+eRvUBMLWO4XNLzsi7fHkDqdKVia9kxbEsiLEhbVwEXWKTDxX2XR484zh2O3YjyJAC+wqHySmL85LmlT+ZJ/w3TItKr6JjX2Ch2/hf9GNOhog0+zRlKzbp9D22SsPQXqQYAqg=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3899.apcprd04.prod.outlook.com (2603:1096:4:94::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.28; Thu, 9 Jul 2020 09:21:08 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::41e0:35f:a74a:e1cf]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::41e0:35f:a74a:e1cf%7]) with mapi id 15.20.3174.022; Thu, 9 Jul 2020
 09:21:07 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Issue about REST API endpoint paths in openbmc-test-automation
Thread-Topic: Issue about REST API endpoint paths in openbmc-test-automation
Thread-Index: AdZV0Z/NgMD4HztuTlWeuvbnEd1mXQ==
Date: Thu, 9 Jul 2020 09:21:06 +0000
Message-ID: <SG2PR04MB3093BDC2C56A104905AC1114E1640@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMjY2Yzg5OTgtMDQ2Mi00NWFhLTllNmMtMzk4ZDE0YjMzZmVhIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlJ1V25kMEdzeDVvMytleU52VWRwTWNKTzNCQTZabEJrT2t3Q1hBUXMwSllROVUzVU9RY1F1SWNVWlp6aW9aM3oifQ==
x-hclclassification: null
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [157.50.75.7]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 12e784a5-a4d8-4c15-731e-08d823e96b54
x-ms-traffictypediagnostic: SG2PR04MB3899:|SG2PR04MB3930:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SG2PR04MB3930FD393D1B4B895A32B153E1640@SG2PR04MB3930.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:4125;
x-forefront-prvs: 04599F3534
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: pXsQ8WK/iVctHVB/lHuPzWTCGEQ9G/q2JzDaqzCfft9OuD2Nx93X+4k3Reu5YI7sGK5bR2AofdM/tPeNqOWoZ4bLvDeEeUNIyQXSuI33PHO3Egp83kF1y2b4QImKuloAzz1qwLHZBi/PySQPjjl405dlUM9epHojxGxZxMY3T41dpchEqF5+F7JUNr3BjyfcW8/xbLKoHf70qfp6bVNzjeoJCsDEFXbojJPlBM2A8g/Uh9JET+2ixmUWOzk1INgrEDrFSfFQB9fJLGvTgXl2veECu9bmN+Wr+1iInwOonMeCke2lc8pOXEhu+6/amMp7M8ye05P+4NGTanvFHzoK4g==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(52536014)(6506007)(966005)(5660300002)(26005)(66446008)(66556008)(66476007)(2906002)(64756008)(6916009)(33656002)(55016002)(9686003)(86362001)(8676002)(76116006)(66946007)(4326008)(8936002)(83380400001)(7696005)(9326002)(316002)(478600001)(186003)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Deci5ZimSNzkumZ2mSmnUWIWCjqAclv+sBFMXGDIOxbh5fZuDOPzu4pMOWi5BRdCK8ZNHoqETDAJGSdfBbYrXM4Kzu99b/Y9yTRDzBf+AHH3oTMja8ZzAmSrY3BGqTp2TM1XC2OpuAdHAtgDt2l+K1/M8hYsTykD1Iey/+Y2+hXBvoRRkhdpai4pclYAh9pwcUu3WmFoXIf3ASY5LpC0pVMtHI0K/WpuGt3VNlyw07epU6vPZGTuWuDp4KviWdgybCgI0fKymFY8Qvr/ceNFuul5dcW8IZZwMxL95XMyndmgQNIMNmFBYL2PxdJx7qIDoUSaNCMUphIG7a1StOQ/Pu/Rox7mE9xE7Zv8qVvs+GXnDrklfh31SRhwj9lMi+Y8YCa7SBcGKQi9GN7ECKSrvHWCY+RovEoH56dglr/jbTnq/61nMQLvmUdlHePCb9UcpRnL9jJaCxsTsdUww+PADg9wXjbz7FJiYzz2osJVT/E=
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB3093BDC2C56A104905AC1114E1640SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3899
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT061.eop-APC01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:192.8.245.54; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(46966005)(70206006)(6916009)(2906002)(186003)(336012)(26005)(6506007)(86362001)(7696005)(36906005)(4326008)(478600001)(33656002)(316002)(82310400002)(55016002)(8936002)(9686003)(966005)(8676002)(70586007)(9326002)(83380400001)(47076004)(356005)(82740400003)(52536014)(5660300002)(81166007);
 DIR:OUT; SFP:1102; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 00c37390-b9f7-4129-80e0-08d823e9697b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C/uLrC1RZ1COIYZtnuw47Np1Uy5Iwwe5qVN+QmDn5woGiGeddmxaHjSEWEpfhmYd1t4H73dnXtgvKHkPNxidxIpHCt89fewEzCmpzCDymRbdaVKZLOchDUAMRtWNufB8J9etje6iMoXj8CvnHFdTzsEtXKKpl2kMha/yLFqh33OaZ8Gnh+bT4yztHZi6jG/OPk73LGn7oaoBqEkhDytl6UvsxzVIfv9Lw+giQjb97VJqs7pH95ENvIoE4vXEnzYM9RYJJopeboGQr2WgPZ6tvGkckr1p7u1sSQ1M3WZlB4ctOlT+byKGuau6lJ0DJGkYXOSBcYmMhbVf04HQXLylWnGo6Np+L6bWn+B1Cq20cpN0IwJbERrdpCTcrbIOKubxjG6fobXT0d+BBY65xlmpBQ==
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2020 09:21:10.2246 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e784a5-a4d8-4c15-731e-08d823e96b54
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.54];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT061.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3930
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
Cc: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SG2PR04MB3093BDC2C56A104905AC1114E1640SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi All,

I am trying to use the test automation for my platform (tiogapass), while t=
rying I met an issue in "Verify CPU Functional State" which fails because i=
t shows the list is empty for cpu in the given path.

         ${cpu_list}=3D  Get Endpoint Paths  ${HOST_INVENTORY_URI}system  c=
pu*
        Should Not Be Empty  ${cpu_list}

When I used curl command to verify the test, I am able to get the data from=
 the given path.

        [root@odc ~]# curl -k -H "X-Auth-Token: $token" https://${bmc}/xyz/=
openbmc_project/inventory/system/chassis/motherboard/
        {
          "data": [
                "/xyz/openbmc_project/inventory/system/chassis/motherboard/=
CPU_1",
                "/xyz/openbmc_project/inventory/system/chassis/motherboard/=
CPU_2"
              ],
          "message": "200 OK",
          "status": "ok"
        }

As per my validation, the endpoint path is mentioned as cpu* (lowercase let=
ters) but in my case the endpoint names are present in uppercase letters su=
ch as CPU_1,CPU_2.
I am also facing this same issue for some other test cases. Can we have the=
 search for both CPU and cpu?
Is there any naming convention to be followed in REST api?


Thanks,
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

--_000_SG2PR04MB3093BDC2C56A104905AC1114E1640SG2PR04MB3093apcp_
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
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">I am trying to use the test automation for my plat=
form (tiogapass), while trying&nbsp;I met an issue in &quot;Verify CPU Func=
tional State&quot; which fails because it shows the list is empty
 for cpu in the given path.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;${cpu_=
list}=3D &nbsp;Get Endpoint Paths &nbsp;${HOST_INVENTORY_URI}system &nbsp;c=
pu*<br>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Should Not Be Empty &nbsp;${cpu_list}=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">When I used curl command to verify the test, I am =
able to get the data from the given path.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;[root@odc ~]=
# curl -k -H &quot;X-Auth-Token: $token&quot; https://${bmc}/xyz/openbmc_pr=
oject/inventory/system/chassis/motherboard/<br>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;{<br>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&quot;data&quot;: [<br>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&quo=
t;/xyz/openbmc_project/inventory/system/chassis/motherboard/CPU_1&quot;,<br=
>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&quo=
t;/xyz/openbmc_project/inventory/system/chassis/motherboard/CPU_2&quot;<br>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;],<br>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&quot;message&quot;: &quot;200=
 OK&quot;,<br>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&quot;status&quot;: &quot;ok&q=
uot;<br>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">As per my validation, the endpoint path is mention=
ed as cpu* (lowercase letters) but in my case the endpoint names are presen=
t in uppercase letters such as CPU_1,CPU_2.<br>
I am also facing this same issue for some other test cases.</span><span sty=
le=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif">
</span><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,san=
s-serif">Can we have the search for both CPU and cpu?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">Is there any naming convention to be followed in R=
EST api?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">Jayashree<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
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

--_000_SG2PR04MB3093BDC2C56A104905AC1114E1640SG2PR04MB3093apcp_--
