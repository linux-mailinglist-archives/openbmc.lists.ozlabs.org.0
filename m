Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 210A72726C3
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 16:15:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw60l25xdzDqB0
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 00:15:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.128.137; helo=kor01-ps2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=IUkyiLA5; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=IUkyiLA5; 
 dkim-atps=neutral
Received: from KOR01-PS2-obe.outbound.protection.outlook.com
 (mail-eopbgr1280137.outbound.protection.outlook.com [40.107.128.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw5y62ZNYzDqZP
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 00:13:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUH1EDdONSqs4ct2aY3r6L3J/E6WVgue3GR9K1D/4yg=;
 b=IUkyiLA5nrJ2ZvdbWmx+WTTvb8NUjHT3K/t7EUD03XNNbISqjDpseksWU+rvUA6iiy8Q9/4Gl1brGCK8JhDT1/eDyX3HIzb1+CFBKJttWaFxNM4IEdFUSqTitPBFMBf0+lfCuf1ow9E80LgF3JpsayV6/sBRbWljGdErghguk90=
Received: from SL2P216CA0011.KORP216.PROD.OUTLOOK.COM (2603:1096:100:18::21)
 by PS2PR04MB3560.apcprd04.prod.outlook.com (2603:1096:300:60::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Mon, 21 Sep
 2020 14:13:04 +0000
Received: from PU1APC01FT049.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:18:cafe::b6) by SL2P216CA0011.outlook.office365.com
 (2603:1096:100:18::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend
 Transport; Mon, 21 Sep 2020 14:13:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.195.57) by
 PU1APC01FT049.mail.protection.outlook.com (10.152.253.9) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.15 via Frontend Transport; Mon, 21 Sep 2020 14:13:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSLvl8iqRkDyElwAgKmdc8Q4u0+79Lflta52o2v+lBJr2VQylwR0B9mbnv37QOP0NBgq3glpfDHfkjWD43WJSL2oH0wA/ve1/5FfyAfJ7H9/qFK2YQ+m5PRKttjgA6aILphQPSUqt901Y+iGNFMY75oXSW3Y5rZzO9+n2WOJ7Ff7/JKBilux+vKJ2AwcibkqLmvaBiCAnTi9hBZLqTxebCZ3oAIkhB7ScHjWKSrQ7jFXguXVGg5TYQ6WpMwINb6oKuztt1vrY/YEl6FY2Gu2i04AtL6DYoLBAxwUsXV7YsCMO/yREEgp/oQyHPNLhBO4IvYbylPCB6uLJoI5EfutLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUH1EDdONSqs4ct2aY3r6L3J/E6WVgue3GR9K1D/4yg=;
 b=k3p8TgVHolCZX/g8zkH8LmF47RF+ICDk4Zz48w5BKLP5pY7+I8I8bkiXzeBR9y8Ow8/BVwjSEapL1hCpLZbS2fjApQRHPiPBxVQAh1q56Inxx4T5mWRtUGMvY4Zg0O6hXGNVHcbMMXazLYEmDRx2z5qwve8G9Y1JSF6ko+u0sO+wECPA8U72yUjrpOOF3q6C8oMQte7CjywxfNkAC+f5EfRiVS3Ihuv9mlCyuSP6kwpFHciqlsWF8BLsWvwAhsoSRtY3heOywLENmcwJh//TRS+/ZLD11mtYZvyRSOadesJPugtcjkem3a3UW+hhsRoR4CTUkYvDnolvGFPWXz/RZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUH1EDdONSqs4ct2aY3r6L3J/E6WVgue3GR9K1D/4yg=;
 b=IUkyiLA5nrJ2ZvdbWmx+WTTvb8NUjHT3K/t7EUD03XNNbISqjDpseksWU+rvUA6iiy8Q9/4Gl1brGCK8JhDT1/eDyX3HIzb1+CFBKJttWaFxNM4IEdFUSqTitPBFMBf0+lfCuf1ow9E80LgF3JpsayV6/sBRbWljGdErghguk90=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB2490.apcprd04.prod.outlook.com (2603:1096:4:b::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.14; Mon, 21 Sep 2020 14:12:55 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7%4]) with mapi id 15.20.3391.026; Mon, 21 Sep 2020
 14:12:55 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Read Firmware Versions
Thread-Topic: Read Firmware Versions
Thread-Index: AdaQIMU5ljsiRzlYTUW3d3oi6MD/gw==
Date: Mon, 21 Sep 2020 14:12:55 +0000
Message-ID: <SG2PR04MB3093CAA5913439BB892C16E5E13A0@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNDdjYzQzMGQtZGI2OS00MTQwLWFlNmUtNGYyNDhmNTAwMTAzIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTWtnb3JQKzVTNW50dGFLbFM4MHJNdFZKOWU1b3NRMTd5cHpaWE5xNkNUbk5seklmRURXc3N0Vm1OMWs0RWJYdyJ9
x-hclclassification: HCL_Cla5s_1nt3rnal
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:38a:3b6c:9027:e359:d122:4b57]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5678fdff-7fd2-46f7-a66c-08d85e387451
x-ms-traffictypediagnostic: SG2PR04MB2490:|PS2PR04MB3560:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PS2PR04MB3560B4EDBCC1D189527B3938E13A0@PS2PR04MB3560.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: v6a4mToQGN3qUyeeRzpaR16SgwthzsSMZ707FrV3sYOxTqAQlQl3LJBCf74TmQAKMFVjf9Go3DMzDwjwIG1hPzoABktrUXCQGOWAgeQpe9coI+iscZdxuydeWbukhfQQxi5AWJvjmTwKCkKVvqJrDbJbAVVY/5pHjyHlEZNC1AGoPu/PMk4eZDzn2cVjjLP89ia/QHvQfbI1aC3+CsRSFATlqfCWEDMeATALPj+3bhoKmiJxsW5H5qs1MzQKHdi7zahUjYXqO+SBW6CSQ0aivVPUpODgc+w77Q1w9TcP2/d/JItAf6Va0ODMwRyC3wHk
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(66946007)(6506007)(33656002)(66476007)(7696005)(4326008)(316002)(83380400001)(76116006)(64756008)(66446008)(66556008)(2906002)(478600001)(7116003)(8676002)(6916009)(55016002)(86362001)(9686003)(52536014)(8936002)(3480700007)(71200400001)(186003)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Zse/7hBNArHDcTpHNBcPYRXVBjd3Gwgf67r2cmoUtY+exVLQuFTqLv2MpTAn7RMVgb/rqLN9AYolzmb1GDkY+lJJKGf7vPoU875NUgQrxuCUa+cM62E95D6CeHeTe1+H9h9lqNSP1im3sZ8XZk7HE+tMbJXVlQBe1qTlaDNcA/Z6X9QgGhdnHfx9+7BNbPEXAT3SZeBZCxp4Qbq3I3Dh5uW1XNlcW9L4yV9U/JSOwkaOqBIHh7X8pkrTSvtM0hZQJjI9uU2/8h2JtrhaMsr6LtFL0vGk6M3+TAXGNY09+ygnjzGk7m0AIZu+aanM6K7l4kbHD6R0GK5Tm5LfsFWpbU7rEpFqAv5qXakj90lF5HaijNCwpuskokTpDimv3/VWRBVcqson5K55dYLL6HDgdNoTao5ltSeJYASHpD2DMvnGtqFfKj0LQCRy1vwxgSZWwBdHs53mfgWOSQOO71SuAjpf5th8cxcycouMfaJRtOBgMWCrgUmhaw7IV9JVc0PB+UMWLO4jt+oq7qnZCQySjTTeSD5/ZKGt07TRY+RdbsxxUqV/TSqG3dyLKT/9lCq1BPh1Vlxad7+uxQKBnTk/g8IbqLYkr1vWoMsL1eW60ocbqWCh4GoElESDvLU1rIulO5ECcOn5NPB5gWx9VxGNPwzhxpGfXPJz41R1sOG+hitwUIeGiL0SL6GMgKXXwg6ztDsHX9y4JuHdmbQ/7O+/Bw==
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB3093CAA5913439BB892C16E5E13A0SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2490
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT049.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4e5f2909-e02a-44b9-ee7a-08d85e386fb4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X7uzqdZl17ukMs+cXHtwUQCrEYyqZzl3Z+2cxYFH8ZTSQWxFAgxTHIerqKkvhgBVbYqyw8ShCuClmxDjEjesWoRU4WpF5hlt7F5AoAl/uHbyzQ0QntZWr2pCtJX+21M2aLEnhJiD1kQEhSUjdxxcAKtsJeYJ8zPP28XIqP0UwTf33OCf4vfqeu5x5tMAfozS3q8pWMoBy3dxs+vDjteEg1T81Y5GWEUWBgTrJrRnNYZ1203Nl5S/n4gfSTZUVrn0qGBMEo9NLVH35gyBIAlBZiwwc9NTmnu9qR1YOW7I2YY/B+zOWMIglWzxbeecK4j+ZpaQcqRV1Tp7hdoaZ4tlyQC2GhxDqqt99n0QVq+gj+9VVHD7bThvYU1srpvjrYVIdKIvI+RwjErtFWIlFcdiz9SAY52S99lS8H/VaC4g10QwCWa0iYc23zct3d4IEvg0
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(346002)(376002)(46966005)(81166007)(36906005)(86362001)(33656002)(316002)(82740400003)(4326008)(52536014)(70586007)(70206006)(2906002)(7116003)(83380400001)(9686003)(356005)(34020700004)(82310400003)(55016002)(186003)(7696005)(3480700007)(5660300002)(26005)(6916009)(478600001)(336012)(8936002)(8676002)(47076004)(6506007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 14:13:02.4818 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5678fdff-7fd2-46f7-a66c-08d85e387451
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT049.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR04MB3560
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

--_000_SG2PR04MB3093CAA5913439BB892C16E5E13A0SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: HCL Internal
Hi Team,

We are working on a platform which has multi host and each host have firmwa=
re versions such as CPLD, ME, BIOS, Bridge IC and VR.
We have to display it in dbus objects.
Can you please provide your comments on which dbus objects it will be suita=
ble to store all firmware versions.

Also in phosphor-dbus-interfaces, I am seeing "System.interface.yaml" in /x=
yz/openbmc_project/Inventory/Item/.
Whether it will be suitable to store all the firmware versions (/xyz/openbm=
c_project/Inventory/Item/System/HostN).

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

--_000_SG2PR04MB3093CAA5913439BB892C16E5E13A0SG2PR04MB3093apcp_
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
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:#08298A">HCL Internal</span></b><span style=3D"font-size=
:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">Hi Team,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">We are working on a platform which has multi host =
and each host have firmware versions such as CPLD, ME, BIOS, Bridge IC and =
VR.
<br>
We have to display it in dbus objects.<br>
Can you please provide your comments on which dbus objects it will be suita=
ble to store all firmware versions.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">&nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">Also in phosphor-dbus-interfaces, I am seeing &quo=
t;System.interface.yaml&quot; in /xyz/openbmc_project/Inventory/Item/.<br>
Whether it will be suitable to store all the firmware versions (/xyz/openbm=
c_project/Inventory/Item/System/HostN).<o:p></o:p></span></p>
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

--_000_SG2PR04MB3093CAA5913439BB892C16E5E13A0SG2PR04MB3093apcp_--
