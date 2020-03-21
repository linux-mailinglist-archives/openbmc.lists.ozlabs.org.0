Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1527519026F
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 01:07:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mWlH0jGTzDqxD
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 11:07:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.111; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=l3GIIQl4; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=l3GIIQl4; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310111.outbound.protection.outlook.com [40.107.131.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kzMm6brDzDrhQ
 for <openbmc@lists.ozlabs.org>; Sat, 21 Mar 2020 22:44:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BYKndKr9cXs2DDbHeXZ4VQ1amyVBnShIWi6Lsr+ecg=;
 b=l3GIIQl4OM9W8uMpM8WkyuHQyZImRi8rYXHpQQ+EAwaxXl/FCeE4XaSbCfFaYb3SJznj/81QrEdsKNfpzPZSpwrK5BVAcnSVwC0igOu1XG3V68c3bwMPc9YjFY8+pgdFCgx9Ue//2nHlF5T4rILt55fI3BfxS7AgYky3Y0ADrUg=
Received: from SGBP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::30) by
 HK0PR04MB3298.apcprd04.prod.outlook.com (2603:1096:203:80::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.19; Sat, 21 Mar 2020 11:44:45 +0000
Received: from SG2APC01FT057.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:b0:cafe::e4) by SGBP274CA0018.outlook.office365.com
 (2603:1096:4:b0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18 via Frontend
 Transport; Sat, 21 Mar 2020 11:44:45 +0000
Authentication-Results: spf=pass (sender IP is 192.8.245.54)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.54 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.54; helo=KOR01-PS2-obe.outbound.protection.outlook.com;
Received: from KOR01-PS2-obe.outbound.protection.outlook.com (192.8.245.54) by
 SG2APC01FT057.mail.protection.outlook.com (10.152.251.133) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.13 via Frontend Transport; Sat, 21 Mar 2020 11:44:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcmL7sMSxZfACXMIoyztBfT8x9JqLFcW0ABvyUi/NopE8Re6pjc0X2UFn0pZ5vOBiKuupyFxyjIzFSTHLJTVOZ88wWRw03v0xitBygGUhv7Ffw/ARzriJViA3i/ibyh0H0MZMoFdbYhbIvFH77GZmqYbamAjHo7Zl27Bry61hoqDC2dUUZwvRiLOt7IyP+NMTABfroQ45HduyppO7CLQegT7KjAhNi6Eo+iQCl1PS9CqxrC0VuHA3AnsnmbRrodyNnyDgXQ/lXL+L5TCJfaaOlY1cqrG6HihC/NKmWbi+XinzzGDnct9MIEtGRgcq+MhDjs5SGylJ0oqNvnl5nodDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BYKndKr9cXs2DDbHeXZ4VQ1amyVBnShIWi6Lsr+ecg=;
 b=cQZQ9YapKMaKcH/nhnNwyxdVbqkVl6C26vyGtTvyLtqY8lBH0T28etRis9KE26TQBdstPGEqPL++IvBt6h+RogYoMJm0/NAQ7NfXio1axhBQNwvWVoTX2+W4qtoI7E0GdkkjgRT+R8otgloTjIfvrSVY2jAsTY7Nz/W755O9LEH6R0ooGLkcyNbaAIVMzsJqFbPoRVN9TWJiJfa544z4g00qA2y4ajxxnb3RIJ6tIn9h0C0vWgMExfvESSgMDPuD1DZbo1birhVtmqCfckaqAuFabqs1Lgi/3EAIJdrSyEDXhTeU7j7/OX6qDqWe1nWnQSl0y4vud1358kMtp1Wpyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BYKndKr9cXs2DDbHeXZ4VQ1amyVBnShIWi6Lsr+ecg=;
 b=l3GIIQl4OM9W8uMpM8WkyuHQyZImRi8rYXHpQQ+EAwaxXl/FCeE4XaSbCfFaYb3SJznj/81QrEdsKNfpzPZSpwrK5BVAcnSVwC0igOu1XG3V68c3bwMPc9YjFY8+pgdFCgx9Ue//2nHlF5T4rILt55fI3BfxS7AgYky3Y0ADrUg=
Received: from PS2PR04MB3544.apcprd04.prod.outlook.com (20.179.114.79) by
 PS2SPR01MB0004.apcprd04.prod.outlook.com (20.177.131.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Sat, 21 Mar 2020 11:44:41 +0000
Received: from PS2PR04MB3544.apcprd04.prod.outlook.com
 ([fe80::e993:932c:5643:a969]) by PS2PR04MB3544.apcprd04.prod.outlook.com
 ([fe80::e993:932c:5643:a969%7]) with mapi id 15.20.2814.025; Sat, 21 Mar 2020
 11:44:41 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: libpam issue in latest openbmc
Thread-Topic: libpam issue in latest openbmc
Thread-Index: AdX94N4ZmgbwTykXRC2eRg0qGgl3SQBlQdHA
Date: Sat, 21 Mar 2020 11:44:41 +0000
Message-ID: <PS2PR04MB3544B78F99800D631CAF5223FDF20@PS2PR04MB3544.apcprd04.prod.outlook.com>
References: <SG2PR04MB3029044A332B70F9FD918606FDF40@SG2PR04MB3029.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB3029044A332B70F9FD918606FDF40@SG2PR04MB3029.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=thangavel.k@hcl.com; 
x-originating-ip: [223.181.226.45]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 40b89250-832f-455a-6b3b-08d7cd8d405e
x-ms-traffictypediagnostic: PS2SPR01MB0004:|HK0PR04MB3298:
X-Microsoft-Antispam-PRVS: <HK0PR04MB3298C4DF484204F04EF3A426FDF20@HK0PR04MB3298.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:6430;
x-forefront-prvs: 034902F5BC
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(199004)(55016002)(2906002)(6916009)(5660300002)(33656002)(7696005)(9686003)(52536014)(8676002)(8936002)(9326002)(76116006)(66476007)(64756008)(66446008)(66556008)(66946007)(81166006)(26005)(81156014)(71200400001)(478600001)(86362001)(316002)(186003)(53546011)(6506007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:PS2SPR01MB0004;
 H:PS2PR04MB3544.apcprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: hcl.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 35C4m5dP0SaUOZTGC77q7Qg59tyob0OTCGmzSLns8iS16y+GuwMeSTTJj2iLP2Ir0HAeUOBVyhEmEIikbXolrXA4x4NNtb+Utg6mbLQl0z6NNB5FPXO/R1spt0qUM4Uoxq/1DA6eKXpl5cn8b7j36GGBKc1OKycT0pWA6tiDcslSGXVfBdsjXm0gHpe58OXPUbrjCCOLzgjEtExIPee3rtrEqjqZRoMCpO3qGk1N+HXrR2WoKwwqJ16LV3+7O3IxsBFRcmzUW1ZZVZ+QtJGF8WZ/0yCguZ17dBBsHrRrVaTDLXlzYYxmIECs6vj3zyZQjz5PLS4U9/bEDO3UsZaXQGu34d97Ie327hIKA4qUsDtnSmhJj4YtA1fuMw3FFPiox+fd2W+mJilLAA/vkMOymLyPXOtuQz8stGX8FimEY96jWdlb93olpQu63rbc3/lw
x-ms-exchange-antispam-messagedata: uu2VLUg0hsezLyoPmanZ7cXBVzBgVaHmeqba0iW+s3oLolP6znoiVxvzWvrRSqPrBk+AKN+8aFMfyvPdD9cJEuYbBlYw3Jaytmz0RfRhJL9pgru1At3mNdkV+RMa+/oxJIeiQncdA7ee4C2ctlr7Zg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_PS2PR04MB3544B78F99800D631CAF5223FDF20PS2PR04MB3544apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2SPR01MB0004
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT057.eop-APC01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:192.8.245.54; IPV:; CTRY:IN; EFV:NLI; SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(199004)(46966005)(36906005)(478600001)(52536014)(55016002)(70586007)(6916009)(7696005)(70206006)(2906002)(5660300002)(356004)(8676002)(81156014)(47076004)(186003)(53546011)(86362001)(6506007)(336012)(26005)(33656002)(8936002)(316002)(9686003)(9326002)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:HK0PR04MB3298;
 H:KOR01-PS2-obe.outbound.protection.outlook.com; FPR:; SPF:Pass; LANG:en;
 PTR:InfoDomainNonexistent; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 815ea739-2882-477b-6647-08d7cd8d3e48
X-Forefront-PRVS: 034902F5BC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /imPlGbPwUoCY7VntMOsup6+fOyF0cxB2KNC1DspnQniirSTeDF86b+khQHRq2iYwkQh3qgsPAB8odl4OGzgchHyaKNc/AnD1RNPiWpidV6GXPJEwVctS3wjwLBXO09h6tsNd168KdUDkA7rHyZJHbiY2A1zysNEQmiC2+oHj3veeMI+ssWS5nHDzYT34oJsQ5JN4pUiwaIufB2+Kkvf1capLhQzz4f6BWbH5/WpGsZX5qAhpClisjFdxNs8udV+CXFa8hGwpcmwX0K0+NPV/r7sb2m1Pdh8MT/calqUErJ5FH4SwgADwatsiE5poaPCW2R7bRRjz0nRUjoJxQTb3tlcRVuRabAtrV5UZl+1IGVwVgAUhYfkyfQaBRLUPltJudpVrGAZKCYCVLuOuK6wmKcz66A97FaqoekUyA2n1TnXBrunI+F2FWQuzYX8a6oFQ2L9gze8f2cl0BJli61TdRG8MwDvb8EtYxeocHbtTCwlU8mQcOr636n4b5j9OHvkRNpIXZ7mUq5ossuRzYV+/Q==
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2020 11:44:44.5403 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b89250-832f-455a-6b3b-08d7cd8d405e
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.54];
 Helo=[KOR01-PS2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3298
X-Mailman-Approved-At: Tue, 24 Mar 2020 11:05:25 +1100
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

--_000_PS2PR04MB3544B78F99800D631CAF5223FDF20PS2PR04MB3544apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

            Today I have cloned latest openbmc image again and tried to bui=
ld it. I am getting the same libpam compilation issue.

             Any suggestions on this ?

Thanks,
Kumar.

From: Kumar Thangavel
Sent: Thursday, March 19, 2020 4:57 PM
To: openbmc@lists.ozlabs.org
Subject: libpam issue in latest openbmc

Hi All,

             I have cloned the latest openbmc image and tried to build it. =
I am getting the libpam compilation issue while generating the image.
             Please find the attached log.

             Could you provide the suggestions on this ?

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

--_000_PS2PR04MB3544B78F99800D631CAF5223FDF20PS2PR04MB3544apcp_
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hi All,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Today I have cloned latest ope=
nbmc image again and tried to build it. I am getting the same libpam compil=
ation issue.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Any suggestions on this =
?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Thanks,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Kumar.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Kumar Thangavel <br>
<b>Sent:</b> Thursday, March 19, 2020 4:57 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> libpam issue in latest openbmc<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; I have cloned the latest openbmc image and tried to bu=
ild it. I am getting the libpam compilation issue while generating the imag=
e.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp;&nbsp;&nbsp;Please find the attached log.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp;&nbsp;&nbsp;Could you provide the suggestions on this ?<o:p></o:p>=
</p>
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

--_000_PS2PR04MB3544B78F99800D631CAF5223FDF20PS2PR04MB3544apcp_--
