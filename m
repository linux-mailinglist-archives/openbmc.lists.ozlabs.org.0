Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8956A283069
	for <lists+openbmc@lfdr.de>; Mon,  5 Oct 2020 08:42:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C4WHZ5qhnzDqFY
	for <lists+openbmc@lfdr.de>; Mon,  5 Oct 2020 17:42:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.131; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=DBqdplU5; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=DBqdplU5; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320131.outbound.protection.outlook.com [40.107.132.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C4WGf5dwbzDqFY
 for <openbmc@lists.ozlabs.org>; Mon,  5 Oct 2020 17:41:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fa2CkapEny4MW2qEQbINScfQJWKRDBIy7MFeFE9x7Os=;
 b=DBqdplU58Qv1+nokSwSuBB/4zP5os1x/12oKOvcHWk9MIUHHDyUDSnH6in+Jy32dZ7/HShyNkc8eiIJKYKtiSEiLA8e/9ClUCosVep1VlfnQvPNwbQdoUmkLIcoGZ3pbtO83m2wCq8qh4WIXQkH6r1hJucLUFQiZjB1DPV/dxd4=
Received: from HK2PR0401CA0006.apcprd04.prod.outlook.com (2603:1096:202:2::16)
 by HK2PR04MB3795.apcprd04.prod.outlook.com (2603:1096:202:3d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Mon, 5 Oct
 2020 06:41:23 +0000
Received: from HK2APC01FT041.eop-APC01.prod.protection.outlook.com
 (2603:1096:202:2:cafe::95) by HK2PR0401CA0006.outlook.office365.com
 (2603:1096:202:2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend
 Transport; Mon, 5 Oct 2020 06:41:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.195.57) by
 HK2APC01FT041.mail.protection.outlook.com (10.152.249.47) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.34 via Frontend Transport; Mon, 5 Oct 2020 06:41:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffzb0m2DNYg2kVDu+HLO7E6bD8sNo1T1ZKOnPFtsJvi6GrHD1i0fbkN5fcsHOp0Tg48JtMLXo4YRob2glNkEEpR48whbi+lJPS10cW0BpRPgDcGSUqTLarQNH0wmxG+gykK6GtFg1TxscREGhuaXPRR9/LJS6+o6MyBCVytjHvp138nIxO6N1jP6QTvzf8e0c2wTSHJWYviUw92zPJZ+2Z9h0wB78IfE/MN+Y1I50+7+VwKvvnb2BBf7T4oKFQp2vpLLIZzgJbcp4odkTI60Pc4d35X8hnGUQprrGWDT8D0qg7zi/cEAmV4cp1imLJ3EV0BDfwTwsVkDxMhBGr/0sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fa2CkapEny4MW2qEQbINScfQJWKRDBIy7MFeFE9x7Os=;
 b=MAMptq55bpODXFw5xeDHjShwrbFWChkKD4FfruX5wqsgzH8DcdVEOf+dTy5LonhDIgEWB9djQVo/euhnIRXKDvlSrxDt4pVaECKcd2OYl9XW0LxJRsvGwf/d7riI2MvwW7xzPY2vafYJOrOazpi6L25miFrdviBq8Pj46stsTaYbyDtvbW/pTocVbMA2UKB2BuvoIzlaKDv6qpgf2JC+OPFyFgXkpgmd/u6mOO/6cqQ2tBPPzoGRjKmC5JiQAiBegClDvL/OwwwALnvD4joLeFulupCTBvyA9ByBhziRCJALEB7v+eqhmESLtZLWo/jG7A0NCjxWzGrTLCYol3Szww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fa2CkapEny4MW2qEQbINScfQJWKRDBIy7MFeFE9x7Os=;
 b=DBqdplU58Qv1+nokSwSuBB/4zP5os1x/12oKOvcHWk9MIUHHDyUDSnH6in+Jy32dZ7/HShyNkc8eiIJKYKtiSEiLA8e/9ClUCosVep1VlfnQvPNwbQdoUmkLIcoGZ3pbtO83m2wCq8qh4WIXQkH6r1hJucLUFQiZjB1DPV/dxd4=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB4091.apcprd04.prod.outlook.com (2603:1096:0:2::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.39; Mon, 5 Oct 2020 06:41:11 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7%4]) with mapi id 15.20.3433.040; Mon, 5 Oct 2020
 06:41:11 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Firmware version under IPMB sensors
Thread-Topic: Firmware version under IPMB sensors
Thread-Index: Adaa20OW/+EXJZ2dS0eTjnxobOGmeQ==
Date: Mon, 5 Oct 2020 06:41:10 +0000
Message-ID: <SG2PR04MB3093F4B562F454122B7F4596E10C0@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiZDVkMjhhNDYtZjQ2Yi00MTJlLTljYTktN2U3NGQ5OTc2NWMyIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoibjNyYlhVNlNhVm5Ma1hXaXRldXdJNFRTTm16c29TSnZ4WXV5RXhESjBEWnFDTVhVZHdVRGplOGc0WWhTMkQ1USJ9
x-hclclassification: HCL_Cla5s_1nt3rnal
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:381:c1a3:f972:360d:9d73:c99]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ce297c40-d9e9-4d0d-b540-08d868f9ac3b
x-ms-traffictypediagnostic: SG2PR04MB4091:|HK2PR04MB3795:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HK2PR04MB37954D68FF177E2EC3FD5F81E10C0@HK2PR04MB3795.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 9fP4wx9aAfYoNFFxDbAhwQUYJ0aVcj985DcGU6EKsK5L5eliSzzH+MSo3NUqGNn/o43L3KY8CCvd59Qbs2h0HNKsuGNJpH0UdTkLn/scCI8aS+2s+1SkwlcKF40TIFAjhETTm8vCzUSuD+QflLTLYcVJ3awlybzM2Yq7PEv31whijbeS0G2WkuY70OFmY7Jl3BdvjLH/sVoSQdk3Tnk/SeeB/Cjiyl2RrEnj1NMWSfYI2Y5asXRPRW8lPadr75sJgd3w4rjAI8hOFNgF+e1GmRQ8jAz+9Kg8SpX4cFJgXo+7ht6+Gl6d/13GrkVtoaiE
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(186003)(478600001)(4326008)(7696005)(6506007)(2906002)(8676002)(66446008)(52536014)(55016002)(76116006)(8936002)(316002)(64756008)(66556008)(66476007)(66946007)(83380400001)(9686003)(33656002)(71200400001)(6916009)(5660300002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: qWYKLFMbopPnepzKBg02hWKp332b/+55KB2691Cj9wKdmFhIFzpsZ2NQRRn15+eo9qHazTF9CsivQKE2H+tSqEanbFHNQbhYN19gfO6b19O9uIc6gkhcH5+Y5slFAlVSD/h8ABqL48ZIc0+rsi+kwNqkFLbU2VOVETIxyqKpSws5dPOUXGnUTKWOl9hZagGrncMYQmMXrzm6PSEQEXtauNpQo7kZ/KFKw1/eHwAyvPrcxtW9JUtybsp6UOm2GYImErpD5AY1CaVdo8Gj8eTFZe+RSChrEj0IU/0CMIIk2f68TzPpOAgnt3tp6HdevYyy+zjG5Md0vO4YLpFXJHYelKVWqifjTJeqF0DWQrAJ/ikeNsRc8ZyH44KgCH9SpmvhszwJsosQUM+7UOxOCEZ+N06xZnuQkh6p4B8iKtQXafXrFGfd06SKJyXGRms9eFCD0Z3GRS8jq6abk+Ew3YDYbGxXso5TLkMZtPu781G749mpnqAp6uBIkDcRMb/UWhb3cdMyZrWjigb+Aj4uAQWTW23shLWUFO56+xDIbfgF6aJUKFao1kG5wgR6gqfRXRjt9+p8pFBXhHA+lT3pp2J/ysD+onb+rWNSzXHf6jOgnuRfHlhxfHaTObzF43Vqv8vjnwHSQgkysNHeG1lc65B4ck6Ait+idzTUpUidaAVRE1hrxb0I9X90fZa0k0f17+Bbxuq2+fMeNRfEvz7rrrc51Q==
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB3093F4B562F454122B7F4596E10C0SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB4091
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT041.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0d825cbe-c3d6-4977-848b-08d868f9a5e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5IxN3vACMu/nrfAdpXF7Ac5/yZMQH20ItlJSgpEuL0WCy8eRuOXCb+gSyEVqp6Us4P8v7eJClkpXCi4SGU88AZxkUNLAREDzmq8sxXO2YN4XIyATl8geQuFgdShIKDcgvHfseS3Q4Rw0Y93gewj7N2tkasKtT1+pyyEVv9tcx9WWWmCS72CvMh/NvixxBjV0JWUBsc+jMS99NhlM/XAz1Epy67+vKvNkgJjdLsv4jNEFKGdaZC3HgwxhcwHqYKX/oXj4QZYJfR2K4CoO7AEUPU+IZ1AqyQsYaT/2w7zM1GgLWsBV2MMPWFDcZ9Ojnm5Top8hhdmA/b3hX7lOP41bP7h1LZFE9hdbjArDslBdy3POFfFnobqTlRWSjh84HdCy7Cp1R33yBJZmTguFQPu3yFEaiCJWoSiIzIxOJuGvAsOmN8IFzxYnyipRF3V7M6HB
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(136003)(346002)(46966005)(34020700004)(7696005)(82310400003)(9686003)(356005)(36906005)(478600001)(82740400003)(8676002)(52536014)(26005)(8936002)(4326008)(83380400001)(47076004)(316002)(2906002)(55016002)(5660300002)(33656002)(336012)(6916009)(86362001)(70586007)(6506007)(81166007)(186003)(70206006);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2020 06:41:20.4151 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce297c40-d9e9-4d0d-b540-08d868f9ac3b
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT041.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3795
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

--_000_SG2PR04MB3093F4B562F454122B7F4596E10C0SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: HCL Internal
Hi Team,

In my system, host is connected to IPMB and host related information is ret=
rieved using IPMB bus.
I plan to add firmware versions in the dbus-sensors. Adding this as another=
 entity as like ipmbsensor.
This will help in having all transaction in IPMB sensor.

Please provide your comments on this.

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

--_000_SG2PR04MB3093F4B562F454122B7F4596E10C0SG2PR04MB3093apcp_
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
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:#08298A">HCL Internal</span></b><span style=3D"font-size=
:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In my system, host is connected to IPMB and host rel=
ated information is retrieved using IPMB bus.<br>
I plan to add firmware versions in the dbus-sensors. Adding this as another=
 entity as like ipmbsensor.<br>
This will help in having all transaction in IPMB sensor.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please provide your comments on this.<o:p></o:p></p>
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

--_000_SG2PR04MB3093F4B562F454122B7F4596E10C0SG2PR04MB3093apcp_--
