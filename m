Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6660224C4A8
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 19:39:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXX2D4cPtzDr4N
	for <lists+openbmc@lfdr.de>; Fri, 21 Aug 2020 03:39:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.135; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=velumanit@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=VY7P3pic; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=VY7P3pic; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310135.outbound.protection.outlook.com [40.107.131.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXX1Q39X8zDr42
 for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2020 03:38:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/1dD1KE1KOAKY6auJExuc07G54JdE4Ea6cOFuM9LeA=;
 b=VY7P3picJ38mR9GeH46Y9qMgQZU/MvEMXIP5l/bHqmXjj3zGdgdaUu7blOWyqfBigMTno0PLP3rqDshI4tU/dtVJJMwmzduWlNYukvAPPnQuGkw23rLCdmd4R3e4zGa/CXWuyvrOn+QHBtG10yDauAWFBWhM7bE6hgZRemrD7uA=
Received: from HK2PR0401CA0013.apcprd04.prod.outlook.com (2603:1096:202:2::23)
 by SG2PR0401MB2079.apcprd04.prod.outlook.com (2603:1096:3:8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 20 Aug
 2020 17:38:01 +0000
Received: from HK2APC01FT045.eop-APC01.prod.protection.outlook.com
 (2603:1096:202:2:cafe::74) by HK2PR0401CA0013.outlook.office365.com
 (2603:1096:202:2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Thu, 20 Aug 2020 17:38:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.52)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=permerror action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.52 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.52; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.52) by
 HK2APC01FT045.mail.protection.outlook.com (10.152.249.139) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 17:38:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCYoW2MIivDNcBVp4HWuK1MD4Wae++CWNZPFkGh5DRd79jx97kHYFXfcCY2JuLwHamPvftpSzm5aMQ0o4BYzsIU3uASoGilU3iPXvDoboYnhEutLgZugtqVzahz6PwuxWHJP8bSfb68UQaniME4yyL8hzUg1vBGanWQqQYQzK5v8/m3tL3O5bo+2/oJAAtvhHiBnYkSHbDrkhKVi6zCHrVSAK6mM4ZIngpz0n6p0PRlzmLtRADzX+Wu4wnu7uHMkCCIiTQUSrMfS2+aj6YZGVxm3Y+YXSHQzfscTT/7xTJgW9lyxnI4pOniJnCFn1TQrmbfFsYvqgaYGID6HaZJoCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/1dD1KE1KOAKY6auJExuc07G54JdE4Ea6cOFuM9LeA=;
 b=Q+rgZ9nURKBZqY+HeIRVQvUF/MUtNo2SVzRMTzGvIzoyeScBYrbxIKRztjKhBugYrkaDThFPSRQ55nX2hSteUXIKYyBSR+53fF3ZI6myJamuTqJC0r8ogWUF+Q4kUYF+j4g2wpnn7IvXfqczX8iLioFEfbegjptGc91ynIh7YgR7zf0Wq4McIOhxa6M6JwiuAeesvgINJFenn6tftIQz78zthFWh4gWGs81KlO/htJZx+9O9ToYelO/LOj8xiKHV917yNw8H4Xw5aAZalDoqfETCOPK+x6I8mG/OiY7gvozLaKvyOsGIfpqigAZFPo3pkNL5DdzUSmIr5HK1nPVv1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/1dD1KE1KOAKY6auJExuc07G54JdE4Ea6cOFuM9LeA=;
 b=VY7P3picJ38mR9GeH46Y9qMgQZU/MvEMXIP5l/bHqmXjj3zGdgdaUu7blOWyqfBigMTno0PLP3rqDshI4tU/dtVJJMwmzduWlNYukvAPPnQuGkw23rLCdmd4R3e4zGa/CXWuyvrOn+QHBtG10yDauAWFBWhM7bE6hgZRemrD7uA=
Received: from HK0PR04MB3153.apcprd04.prod.outlook.com (2603:1096:203:80::9)
 by HK2PR04MB3842.apcprd04.prod.outlook.com (2603:1096:202:31::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.18; Thu, 20 Aug
 2020 17:37:58 +0000
Received: from HK0PR04MB3153.apcprd04.prod.outlook.com
 ([fe80::f5af:ec35:8bbb:f9f]) by HK0PR04MB3153.apcprd04.prod.outlook.com
 ([fe80::f5af:ec35:8bbb:f9f%3]) with mapi id 15.20.3283.027; Thu, 20 Aug 2020
 17:37:58 +0000
From: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Facing issues in adding the package 'phospohr-gpio-monitor' to the
 image.
Thread-Topic: Facing issues in adding the package 'phospohr-gpio-monitor' to
 the image.
Thread-Index: AdZ3GCH8MWt8ih5eR9SIpFYo5CHlvQ==
Date: Thu, 20 Aug 2020 17:37:58 +0000
Message-ID: <HK0PR04MB31532870F871F31DEDB4B94AA75A0@HK0PR04MB3153.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiOTFmMjlhZjQtZmVmMi00ZTZmLWJmYTItNWQzM2ZjNjk0ZjY3IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IkhhVTlBWWdwTUFpa0FIV1V6MU14eEt2MXQ1NFhSMEZRMzhQRTVaTWpzM1pNZDRSanNDXC9MUUxzNWNPTjRIZFFkIn0=
x-hclclassification: null
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [171.61.236.0]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2a41f152-e22e-47db-24d8-08d8452fc907
x-ms-traffictypediagnostic: HK2PR04MB3842:|SG2PR0401MB2079:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SG2PR0401MB207902755779B84DD1DDE372A75A0@SG2PR0401MB2079.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: C4LvuGSR1jgKKzVRqIwmANY5mOY6j48siqZU3AyWTqL6F2SVNjXMj3E/Rk7iUpexAkyFYJ7m+1Pp4jldjcTRVYenaf5C5uHtHjjjDNqy+iQhwky/WDbmkGvWAA7Lxc3mCVVqAKaMdwcAtOPct93aY266mMQDmmQzFe3UVJYZ5aH7IpHM8xhTrGFnpI9UcsAZF01klec/ETtZveAxYX0rBW1GwBmUuuV2lXz719dg6TLk16q0zTWfhEloITujf4i5Nu1aUzBgdU5WXCPgN0/rmg/YAi864uq7/udtAkevhpe8vk+m8TF9wHuXAyX0X0h/V4HEeuARZK9BdfcG4xjfSg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB3153.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(33656002)(54906003)(76116006)(66446008)(5660300002)(7696005)(4326008)(9326002)(9686003)(52536014)(6916009)(186003)(26005)(64756008)(6506007)(66556008)(55016002)(66476007)(316002)(71200400001)(66946007)(8936002)(2906002)(86362001)(8676002)(478600001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: x6Mi9VXtAFDd8dG8OfVmbGa16JAZC2t5slarqcuRuYWivxLiq/NGBddbOs4wVZO9B9q377AxPRMVORJ2r4uGsUp2FzpHDQPkqMNVcQ5WmfI7MOHSUUEFQMwoPPqHdPhkrQfkAXCu84D6TuysU3vU20K9CcP2xS/4ixf+Cp3aFZCTM2mEklXqgE0PGnm7B5K58MGea++tPV0zZMgW5QfL8MobN8c5E86RIq9tHEYUOIwWYiPqAP7Hab5yD6TnkxWK3TDtqJk16Jdw1eIpg8VTurs45PkkTCIG9ECSPj2b1EwYhpB5m6k/8opdBxaAmQlm5rWAw39L0KcthVnvUDfDS3mQCVA/6pZgBt/8JO9CO0XRaH0oMpP3cUtmZ/2gl6SAGIazRt9aUUrAdplb2xrymywsdHJ3TUdOoA6uXP9hoPSNb70pGypKZR+2+Y/cwIz3M+7KauNhj9QsYZTr5nrC11t4Xul09cgY4yX9eokvaxCVONH2qJdGc4oKARigAtF3g9QK4m3FPbCRL6KwiF6utot4lBpqeE+FATtahqZQd91E+HVQqu9hjPMw+HPWjFLoDXy8ZQpY7FHZhdPLEMbz2RABLh2SJx8HoehqgeZX1czz9GnVwJdwgMvcBoOL1tq5pHVn3SKk7C5BL4Ja2dY0GA==
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB31532870F871F31DEDB4B94AA75A0HK0PR04MB3153apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3842
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT045.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5be1798d-4eaa-4b5a-5291-08d8452fc741
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eApiKMHWC/zX8OdElMT6GA3HFPm0oj3w6QnFmpRpzRBqS+PYEX1g+/o//lyA8IM9z5f+f/0dQb/uYBJcWHIDl00gcL/ZxOC1jGlsIW88n5j4/bevxGshLsWrGTu4wy8ynPMt2zkNimkfVagIRaF4NLLXhF8TSdEK70BRnycZXz/1dnK17hVwISTIwDduE3//A4QZfhfjZd7eFU8eQTxVa1AUaZWHPsK2rRsuSsIhIGYXFcxboi1Z75KxlDOC1+9JCwFRDLwOc4LSItDA8WtwppiWBHmIrp2ggqjzqVW9YWzt1VY2KSZcUr7OIS9Vdth55LbGp8g0MogbqVE6XFqatzCP+VYcCdk7Lqy9YvG5X1ga9wSVPDvhIRMGIVjMn0r3p8kkJR2crn+c3QOBfbxAfg==
X-Forefront-Antispam-Report: CIP:192.8.245.52; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(46966005)(336012)(83380400001)(6916009)(478600001)(9326002)(33656002)(86362001)(54906003)(47076004)(8936002)(81166007)(55016002)(9686003)(82740400003)(356005)(2906002)(36906005)(82310400002)(316002)(70586007)(4326008)(7696005)(70206006)(8676002)(186003)(5660300002)(6506007)(52536014)(26005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 17:38:00.1877 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a41f152-e22e-47db-24d8-08d8452fc907
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.52];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT045.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR0401MB2079
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
Cc: "P. Priyatharshan" <PriyatharshanP@hcl.com>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB31532870F871F31DEDB4B94AA75A0HK0PR04MB3153apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

I have added the package name 'phosphor-gpio-monitor' to the packagegroup-a=
pps.bb. While building I could see the package get included to the image, b=
ut while the image is running, I could not find exe for phospohr-gpio-monit=
or or respective systemd and D-bus services.

Am I missing anything or Should I add anything else. kindly help me on this=
.

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

--_000_HK0PR04MB31532870F871F31DEDB4B94AA75A0HK0PR04MB3153apcp_
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
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:black">I have added the package=
 name 'phosphor-gpio-monitor' to the packagegroup-apps.bb. While building I=
 could see the package get included to the image, but while the image is ru=
nning, I could not find exe for phospohr-gpio-monitor
 or respective systemd and D-bus services.</span><span style=3D"font-size:1=
2.0pt;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:black"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"color:black">Am I missing anything or=
 Should I add anything else. kindly help me on this.
<o:p></o:p></span></p>
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

--_000_HK0PR04MB31532870F871F31DEDB4B94AA75A0HK0PR04MB3153apcp_--
