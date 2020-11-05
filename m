Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DCC2A7E83
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 13:24:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRjQ36TD6zDqwh
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 23:24:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.111; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=Kfjm9kGU; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=Kfjm9kGU; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320111.outbound.protection.outlook.com [40.107.132.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRjMQ0R2fzDqwM
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2020 23:22:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OI4TYaHzNmn65OfmR5VCMcmhvfhZ2qlLx39T69CKhoo=;
 b=Kfjm9kGUw7rOISyv5gYYGVbh7l78IiTmb0/wWVMoi5IFUMCdwet7rlklhkF5otR1mo3L4bT0l408Zmzj51GMiKvO2FzDxEbmJQ4hH4rCA1xB3rE4FA8FkpqKPfCMIiMTLcK7xTL5ZMIu4KYwYGJQ+mGVVS72H62y7vBvqQ+1xbU=
Received: from SL2PR04CA0022.apcprd04.prod.outlook.com (2603:1096:100:2d::34)
 by TY2PR04MB3950.apcprd04.prod.outlook.com (2603:1096:404:8012::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Thu, 5 Nov
 2020 12:22:13 +0000
Received: from PU1APC01FT016.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:2d:cafe::89) by SL2PR04CA0022.outlook.office365.com
 (2603:1096:100:2d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Thu, 5 Nov 2020 12:22:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.195.56) by
 PU1APC01FT016.mail.protection.outlook.com (10.152.252.219) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Thu, 5 Nov 2020 12:22:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9eNktAmh72fBbMltgcHUDp6yrT0qNV1XEzCF1lhBio0w9IriooANgkDW0Nzb9k4W7lKNf8oR8euBWPkZAp+bGPLuiJRkpLR0YkbKfgzZLZpNUdyzosNgnk6Nq0mQgfyzmRzcWe99dK/b4O5UIAtLYhwFFhdsvX1Vyg+ajDIejZUM9pI3rRU2Z+b7VlKhlGmgk3W1Zkob7/BOoMh28kQA83/kam+kJd5xkFhJfNK9efJui3ViuhkRpuBy86BOhtBku5BomcRePsdNyuiwip2dcmYZdVTYxgvV2clHmpCowbb6DyOgwiAVUZ7BjASQXETmZbbZLULEzQ21W7cvjstxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OI4TYaHzNmn65OfmR5VCMcmhvfhZ2qlLx39T69CKhoo=;
 b=TbImN14plFeDQciYuE3/Ov4DmXxDnkumeJkoa09jf8kdf8Zso4jZgu12GPqz6+Tda5ZllYJs+nNGQgBt0Ku3gy4ulwIdLjJsVclhxvF85d+E/Xt7YA0asgSD/MuomkFho6EwhkuokiDXoBI5FbjO6RZaTgNyFH/1qUnx99DrdqWmL4YaQcpR7MZHu8ZLRPNQxOb902CaOIXasdTk7Nobfh/eBkyA4z9x1g+xZrXi31V+rqQ1LtxHeshiJo49mmKXwaD2W2UTu06mMpgqGeNf0NwzlDoPydd/oQZ6Ps3aGRIOVr7C21ocMExSirU4TB7QwOlyuHeAsKHUZnEpgjFucQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OI4TYaHzNmn65OfmR5VCMcmhvfhZ2qlLx39T69CKhoo=;
 b=Kfjm9kGUw7rOISyv5gYYGVbh7l78IiTmb0/wWVMoi5IFUMCdwet7rlklhkF5otR1mo3L4bT0l408Zmzj51GMiKvO2FzDxEbmJQ4hH4rCA1xB3rE4FA8FkpqKPfCMIiMTLcK7xTL5ZMIu4KYwYGJQ+mGVVS72H62y7vBvqQ+1xbU=
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK2PR0401MB2019.apcprd04.prod.outlook.com (2603:1096:202:9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Thu, 5 Nov
 2020 12:22:06 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::89f5:e366:be7b:b4f0]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::89f5:e366:be7b:b4f0%3]) with mapi id 15.20.3499.032; Thu, 5 Nov 2020
 12:22:06 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Queries in phosphor-pid-control(swampd)
Thread-Topic: Queries in phosphor-pid-control(swampd)
Thread-Index: Adazbf3YeT9VL1BqQCaDxpW9/aG0cA==
Date: Thu, 5 Nov 2020 12:22:06 +0000
Message-ID: <HK0PR04MB29646B09A78169E38B903C6CFDEE0@HK0PR04MB2964.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_1nt3rnal
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiZWFiMzU1MjQtMTFjOC00M2U1LWE3M2MtYzEyZGU1N2RjZDE4IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiR1EzYklrZ1A1UFNlZnNpek9FWWJjVEZ2VDVkRDBsUGdmYng2Qm1GSTJINmkyQWlDckNuM0J4UnUyWmpJT3VlMiJ9
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [106.211.243.206]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3b3e3467-a2f2-4948-a570-08d881856bc2
x-ms-traffictypediagnostic: HK2PR0401MB2019:|TY2PR04MB3950:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <TY2PR04MB3950253C3D3D3E4D0279FAAFFDEE0@TY2PR04MB3950.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: BiDOD+21Oem+rsvmmrpWgiUdIjPBeh9ux/WJfY/V/lqOyq/LfzMAfpWDplOnHi9gC8+MzZgLYmyKPGIx/ewhNPyjBvrjpu57BN5NcGoKF/cJS6ny20t9WiiKH6SdrkZHiz56ASj4CHxsD9atuHvHrKDnm4mnv4rnKax6di2dVnlXIXHS1C6hXLCGchPXG4LXjrhTyYNGRMAcPfw3836bSzcx7TFBP2GRUb7XL3pJJuO68B1Kl9R7q0Zu3dtPd6VGeKj3pR9iAshial3845dY9oYtb3iH6XSn6xBDQzyxRystoyJIgTeajTvOcKjJ8UZYwJP1JF1BgsvekjnTzGHPTA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(55236004)(8676002)(9686003)(55016002)(6916009)(8936002)(26005)(83380400001)(54906003)(4326008)(7696005)(6506007)(186003)(52536014)(71200400001)(478600001)(66946007)(66556008)(66476007)(76116006)(2906002)(64756008)(86362001)(33656002)(5660300002)(66446008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: nyERc4jDb/Jt+tlcn8SReU01VTLQxrB2ZNMzWF3OKW+FDV+4ezhGkCHgOxbvn90M1Ol4IsmBW8AX9Y6zeyMx18xi9g0Cz0A1MNaO3LkqtxLYt5hTnXZrfQqKcWoGTsjGa4lWkfV8GCX8MQ4ZL1znsh7b0+8CnEHbcBF5tKl4EE2tWX7Q8PuPsCVFQdArtVZ9bDVQMnVZ/JX8ngg/nYKe+t93/grLdBaWfvPdlwrWD3TFM02emnBZ+YQC+VZVum3c8YsIF2FIZILIeeQhKqHbDiee6zSiGoPxUjZTWMMmwBmjHh3RgFmaEloDghfcweRDK0DjY01FYqCHyKMr7lL0jfMUFUN5QB+1+vlLjAGvRUGRVGj3uL91u1H/4WQslzgCTS5dUE3EpkKMEugfH26RLyko2CDH1phuh+VAx632PKr4lqE1UF+5V5ls8AO4VyCHVM9LIfFLHk4vV5wXBQXBXgWLR0/3p0MJNJQTlVB4YuuQmpzpqvw0vonyQck8+f1psiy1T902ZIcKe3piVvk6mWY/mUZAz09X6/AU2XdF8In9FosQeP4OlFwkZ+uB3tlnqmCsUGvUYlv3NDuxoExdFYmmOVSPl/c4AX3Uk53+qh5JROAtyAqyCR5XFDUmKTmr57txz4/OWydz27Pzi+ayWw==
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB29646B09A78169E38B903C6CFDEE0HK0PR04MB2964apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0401MB2019
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT016.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ea980269-f342-42aa-8448-08d8818568e2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MF+1V2lrVIC2ovTwiDXr2PeMtHkkXEQub08qQtqO+dudWpxHOirYpsDU+0jmeXwfbhMuospNcv+NciV2gUmgZuoxk2HOPRun5J/TpnbUYqaPq17Ok+0/lttMM9sBi8JSeWHHxPnAMPP8htKEVRJhGKYrj6iBCacg3B9s5D8BWwis39Sdne2monY0l6G7ub6RApiBbGHTMYIeVagOvEFf9VlJw5ReR8EfB7/hKoYrLnRg50DiUul/qfEnxzgEk68J68RkR93o7JIGuiAsVGSRXaKKsdO6sUiYrtxSqUSvACTmy8wrMMTLozUIvm73OdJSABSOU11C+tCtKMsVE002hqATB3hTy4VkzFiMbKgsa/zivbjzVoTZc0WiOgLt8tpbEYd5o/je71y84pLrKPAZeg==
X-Forefront-Antispam-Report: CIP:192.8.195.56; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966005)(316002)(70586007)(6916009)(47076004)(36906005)(54906003)(9686003)(55016002)(70206006)(5660300002)(7696005)(52536014)(82310400003)(6506007)(4326008)(86362001)(2906002)(356005)(81166007)(336012)(55236004)(186003)(8936002)(478600001)(83380400001)(82740400003)(26005)(33656002)(8676002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2020 12:22:10.2591 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3e3467-a2f2-4948-a570-08d881856bc2
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT016.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3950
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
Cc: Patrick Venture <venture@google.com>, Vijay Khemka <vijaykhemka@fb.com>,
 Josh Lehan <krellan@google.com>, "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB29646B09A78169E38B903C6CFDEE0HK0PR04MB2964apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Internal
Hi All,

      Does the current phosphor-pid-control handled the fan failures or if =
fan values is 0 ?  Looks like, it ignores the fan values is 0 case.
      Could you please clarify me, how the fan(single/both) failures handle=
d. if both fan failures, Do we need to power off the chassis or need to do =
power sled cycle ?

Thanks,
Kumar.
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

--_000_HK0PR04MB29646B09A78169E38B903C6CFDEE0HK0PR04MB2964apcp_
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
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Does the current phos=
phor-pid-control handled the fan failures or if fan values is 0 ?&nbsp; Loo=
ks like, it ignores the fan values is 0 case.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Could you please=
 clarify me, how the fan(single/both) failures handled. if both fan failure=
s, Do we need to power off the chassis or need to do power sled cycle ?<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kumar.<o:p></o:p></p>
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

--_000_HK0PR04MB29646B09A78169E38B903C6CFDEE0HK0PR04MB2964apcp_--
