Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D662BA4D5
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 09:40:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcqkS61bBzDqw6
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 19:40:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.139; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=c+LhNiBK; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=c+LhNiBK; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310139.outbound.protection.outlook.com [40.107.131.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcqjD4LDrzDqw4
 for <openbmc@lists.ozlabs.org>; Fri, 20 Nov 2020 19:39:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6jC7l1etN72ZO6RVbPWWyhDmI3M7onXR5OTv6OR87E=;
 b=c+LhNiBKeYSIO5zJK7QiBRWFTf4ijTdidZqOi0MhnUeRx/FdmH+oqIJ4NM7AMxCQW0yya7bZQKzM2E28ale2N24l0XVoVk//6JiWcW3VKZm+DcRxZ5fV0ZCybB4EiJzSywz2WJQbREUfGrDJZgAte9YF5IsabsWWiqpnkFB3IaE=
Received: from PS2PR02CA0085.apcprd02.prod.outlook.com (2603:1096:300:5c::25)
 by SG2PR04MB2649.apcprd04.prod.outlook.com (2603:1096:4:65::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Fri, 20 Nov
 2020 08:39:17 +0000
Received: from PU1APC01FT036.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:5c:cafe::87) by PS2PR02CA0085.outlook.office365.com
 (2603:1096:300:5c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Fri, 20 Nov 2020 08:39:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.59)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.59; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.195.59) by
 PU1APC01FT036.mail.protection.outlook.com (10.152.252.207) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 08:39:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhRMm+0Vs4bYB8UQduYBj3I21gl/Zg+rxoJpP0wJl/e7THMTsG4EVwqC3P7ytA1PZfDTaKo/KHD+w9LZ886DTC0k/6imrE2RZJAHlQUw/kk+AoxthkgpkEphxvHRleJoLZ0QJJlgehOhxD1FSmhcx2pTve9W78Lxlji/VSPWMfgCvIF5N4/0ZQQvNCJRMIDAscFr67UeGRP+asNc4kdyvYA3bD4nNTNDaW1of84q6fCqkGaA2S8ck6NrqHtVX4wQr5g9riFSWPtiyZZYbFguI6hjiVa5+3IC+oC9tx+WIBY2Mz8+Ba6F8eD6HrGtvFyjr9UrOv/W9pEGmITihZcbyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6jC7l1etN72ZO6RVbPWWyhDmI3M7onXR5OTv6OR87E=;
 b=SKkqfhGnIaaxaznD/gfSleZxu6ys/dI00f6u64vbUpUP9O5AWMB1FV01tHxRWuIJhbNF9iMSx+/i7RpV/ZBN9FA5tW5CNrItzqh8EdVTla1Vj48j/fLXodTWRDTcg7uTuFsGmbQaIoaR/n9XvLHjJe2qrdjeQDZe8qPlHXvxl2CP0kZhStDnoK27HPYXDw8bQmfKQYrfRhUwvtTA3ynBV8UGGpCXk4nO2eVArwHs4gsmqnOjLFR/KQYY/RjR0FbOF4+orsrAgS0ghUwOcPMiamFW4EA81JXqzjFClhOYox2EHw4YFrcqzSjszqCB7vP3EFIT1XFWIIG5beFlth/Y8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6jC7l1etN72ZO6RVbPWWyhDmI3M7onXR5OTv6OR87E=;
 b=c+LhNiBKeYSIO5zJK7QiBRWFTf4ijTdidZqOi0MhnUeRx/FdmH+oqIJ4NM7AMxCQW0yya7bZQKzM2E28ale2N24l0XVoVk//6JiWcW3VKZm+DcRxZ5fV0ZCybB4EiJzSywz2WJQbREUfGrDJZgAte9YF5IsabsWWiqpnkFB3IaE=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB2377.apcprd04.prod.outlook.com (2603:1096:4:2::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20; Fri, 20 Nov 2020 08:39:10 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::600b:f294:3dde:ba29]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::600b:f294:3dde:ba29%4]) with mapi id 15.20.3589.024; Fri, 20 Nov 2020
 08:39:10 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Boot Order in Redfish and DBUS
Thread-Topic: Boot Order in Redfish and DBUS
Thread-Index: Ada/GHipV90cO13xRsGWrbeHoNjQ3g==
Date: Fri, 20 Nov 2020 08:39:10 +0000
Message-ID: <SG2PR04MB309381BFAE06A3462E57E0C6E1FF0@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiYjU2MmE0NDItNTI5Zi00ZTI1LWIyMGEtMTcxNGY5NDkzMGI0IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiR01GT0lURFwvSkxXT3FFRlluUGtMY1FEWDVDZmpjSVZvR05sQWFlbGhDVTVadEFBUnNGbnRWSEZTcDdSOUZORGMifQ==
x-hclclassification: HCL_Cla5s_1nt3rnal
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:111:c53c:f9b4:1c1b:d638:fb92]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 398ed37d-c5bb-41c6-ab84-08d88d2fc39f
x-ms-traffictypediagnostic: SG2PR04MB2377:|SG2PR04MB2649:
X-Microsoft-Antispam-PRVS: <SG2PR04MB264911EA31BE54A53E3135A1E1FF0@SG2PR04MB2649.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: RbOE+Ct/qHqrEoUL2U5jJUeTpIG+O45UWlw9zjq0sNgee24GFK0T0DP55uuxVd99/jwpx34AnzPREE7/ZX3m8gHWyEnI53woPdHmOfI1lYszBT7CkSfuLHdHdVo+/DDBossQTY1R5x6WK573P2j79T9B3+XX1eHn4bL0i0cWkhWo9SZEsyqIOYLQUZ8V0g8plETk1JkKI0ooPcCOVlC9BebuGUGHqc3M+z3w0Jqg6IXmj0TvQEz5hKWxzPYH2wp5T9lTwCVJDtkVrZqx36DU79Ttgr0pJR2pxxyBNH23eKtK6O4ksF8rhVt3YMcj2v0GfkpUESe4Nx8sIi4i7+L9/Q==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(9686003)(86362001)(66556008)(71200400001)(186003)(478600001)(6506007)(316002)(8676002)(33656002)(66446008)(55016002)(5660300002)(6916009)(7696005)(52536014)(64756008)(2906002)(76116006)(66946007)(8936002)(83380400001)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+X6stP2aySfyKUU3JfFtKkjISQ9whutTg/OBRv8jBQ7ceae/cpQOV5a4E2b4?=
 =?us-ascii?Q?edSPD75JayKzhJkf22LmhhV5gAujwxLBIbBtX/ia/EQwipqNI0Jxe+ufX5nK?=
 =?us-ascii?Q?WME3X751P73eGCUyIkiCfugyaHxHtDgbRS/DG7D8NKZBuMk3xWAfPBkiI4CD?=
 =?us-ascii?Q?m/CTikoircLMovo9F635T9glkqignkHZ/gCPKupdg5OFi3erjwLw7+M70l/5?=
 =?us-ascii?Q?xSazTiMW4TmJ1wzhkTY+Y734jSKqvvsEP3pt51Nx4NFyQrlJgitpG/UbwHZg?=
 =?us-ascii?Q?wZWBxp768OLZBvc7zw5xrJl0RQjLX0tRmL1Mg7NFXhkji0Kb0Rze69jhFBmo?=
 =?us-ascii?Q?axEiQQulwSUpJ6YIi3JcumVLKeIB06wwPM6epuhk/SSIImcixseSQxrbALF+?=
 =?us-ascii?Q?54BYKKIFVdqtm8cTktFqvUFUieZFR/sTMHheIL6u98WCPnqRVzMojj5qvZNW?=
 =?us-ascii?Q?Jo39PgwIdEJN+lYfgI34bX0525YyDkVONa895aiPP4TRBDFIIPhpOTr6RexU?=
 =?us-ascii?Q?LhPKki1pNxWiRZ4soervlTKAWzzTIcJ1hZWhgniXSciB2l+5/sfNT2rRY72M?=
 =?us-ascii?Q?ryOl0cqe1FdmM4EiHiIZJs9Ijuv/hX8AsSVhZV95gGKGXRQ2u9LzQ6UHBrJv?=
 =?us-ascii?Q?gtI2cNzFngragg5fI+zwKclCHHhOlPwcg1PPk+VrIof/z22tG7M84aaci14H?=
 =?us-ascii?Q?Zgv64bIGdyScPVEf04BzU+kCpLU5O9CmvpXwQFNWg3nCT3GC07tnX30ChWer?=
 =?us-ascii?Q?zCtxHGNwzYSGiYNzRTC4C88yH+2wyj7dxhn5A508WctW4UtxQicUqbJw6IZw?=
 =?us-ascii?Q?ooWnoXnpQablwkG8oJi4cxFNApSdnp1lpm62dPF2aaAjDrn5rqAnppCILbwx?=
 =?us-ascii?Q?3Krta1hXoDCYTC7FQCg4DdSzQ1VmViLScreeFV+YnAcVsZ24ZNkASlZguc1T?=
 =?us-ascii?Q?Ez+TFczxwRJvMIO6ad6ufw=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB309381BFAE06A3462E57E0C6E1FF0SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2377
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT036.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: efa17259-70a7-4c06-8761-08d88d2fc075
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gQGBSL//ME0gtWbGApygGWjFkLvz5DaH3wkBlzvNmnI5YjJIqY8ty2i8EoIKa78deTW1qSBNvtYyLIU3vxjZ0rgkGO/dOg99TW8frZwYpms6+FmkOPJlpq4/l65FVS+/9Sq1iRAun27WahXvtmNPe30onQutoOtUm+alaiQ2pgS5WblpNW2UECTbJfE5vvStJXjV0QnhMjWpMZdJ5Iv/QirL11QYgbdHK6AOgH5SSp3CAIin6leOWkjmDdr6SRuNzBmCG+3aXyYjHaCH9UJYp7zEZIsREU3o1PV7lVGrzHwGeUbPr629F8VBPnoC1KGd2AChlbA8LNAXwDeNa6WhC2dfzx+dpRQ6OU5kqK/+8EElGg+amEdBvF7aqOK6jUN/Nr1bJJ9Zt9AIcPObrJX2PQ==
X-Forefront-Antispam-Report: CIP:192.8.195.59; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966005)(478600001)(6506007)(186003)(6916009)(55016002)(26005)(9686003)(8936002)(52536014)(2906002)(82310400003)(8676002)(81166007)(70206006)(356005)(83380400001)(5660300002)(86362001)(7696005)(33656002)(70586007)(316002)(336012)(36906005)(47076004)(82740400003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 08:39:14.6029 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 398ed37d-c5bb-41c6-ab84-08d88d2fc39f
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.59];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT036.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2649
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

--_000_SG2PR04MB309381BFAE06A3462E57E0C6E1FF0SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Internal
Hi Team,

I am working on BIOS boot order in my environment, to get and set the boot =
order sequence.
How the boot order settings is handled using dbus interfaces and also in re=
dfish ?
Please provide your inputs/suggestions on this.

Thanks,
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

--_000_SG2PR04MB309381BFAE06A3462E57E0C6E1FF0SG2PR04MB3093apcp_
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
pan style=3D"color:#08298A">Internal</span></b><span style=3D"font-size:12.=
0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am working on BIOS boot order in my environment, t=
o get and set the boot order sequence.<o:p></o:p></p>
<p class=3D"MsoNormal">How the boot order settings is handled using dbus in=
terfaces and also in redfish ?<o:p></o:p></p>
<p class=3D"MsoNormal">Please provide your inputs/suggestions on this.<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Jayashree<br>
<br>
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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

--_000_SG2PR04MB309381BFAE06A3462E57E0C6E1FF0SG2PR04MB3093apcp_--
