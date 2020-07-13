Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BAE21CF01
	for <lists+openbmc@lfdr.de>; Mon, 13 Jul 2020 07:51:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4t742VGwzDqVc
	for <lists+openbmc@lfdr.de>; Mon, 13 Jul 2020 15:51:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.104; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=MIICiXBa; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=MIICiXBa; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310104.outbound.protection.outlook.com [40.107.131.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4t6132W4zDqSC
 for <openbmc@lists.ozlabs.org>; Mon, 13 Jul 2020 15:50:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVusp25MZ95j0nQD+H3p/w2IQKLPZaZ7c9fL5Y2NRrI=;
 b=MIICiXBa5nphEj8CIfvmdKFog/LQ2w9iS71W4Xs2Ws1lkp5+XdP1jLvjleAm+9Na4W2bRqN8nJuSAop8F3jiXu080S3lxDC7vT8JDubbi7kkZLFa9rzf65LonX0/YkAAYOEWcfB3mUwJ02NjeiaZpgVl0V6alYwmBBrNY8nvHDI=
Received: from HK2PR02CA0163.apcprd02.prod.outlook.com (2603:1096:201:1f::23)
 by HK0PR04MB3009.apcprd04.prod.outlook.com (2603:1096:203:85::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Mon, 13 Jul
 2020 05:50:08 +0000
Received: from HK2APC01FT051.eop-APC01.prod.protection.outlook.com
 (2603:1096:201:1f:cafe::90) by HK2PR02CA0163.outlook.office365.com
 (2603:1096:201:1f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Mon, 13 Jul 2020 05:50:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.53)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.53; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.245.53) by
 HK2APC01FT051.mail.protection.outlook.com (10.152.248.224) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Mon, 13 Jul 2020 05:50:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bx7GxHnqBCgv6o4ocRPT5/vLV7uaxTZIq6MM2krnlzEMSBd6rJ5wszTh5Fx/Ot6Vqba28GacfqdlSiFeph1rcrWqPxOot5BK/AKW6tvQtKOE9z/qgub79iifGA7AgVMlFanYm/DkhHWWknuGsIaKbCDJWajmpzam8wUU3J6mnmozx0Nr9bZ20M9m6tj1sBc1xLsDopZg7UPGh8sbNhP+Jyr11MgW5zVjGq6q3vhjygMkw+ZA2m3aIQ8Ad/dGekoLmrulImPMzGc1/tb/Pka7sqRl14R0MRp9xUcWFa/+9mBH+mM4H5615DFst9B7ha+9N9n9CeRA3G3QIkC1VOMxxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVusp25MZ95j0nQD+H3p/w2IQKLPZaZ7c9fL5Y2NRrI=;
 b=Bcr4IKXQ4cBXFMoVHLrQw8YDMRTR1D5t2/05MzeqS+lPAsXnh/HIw/GI2zv1FNvxFUYp7Lmt9SUIaDwYA/rUjpETSNel0dxMixmI+7aumz60NLxfMfj4q13jOHSbXTzdnr3VOH+Vei98ciGQbpQIOlGueAZ/fdWLCvaKwye+H/eP6Rxyqh/EMzDHlOEbyFRXvn+t3bLI3ENHABhTBG/lZLc+m8cZMhGqwNQiQQ3T57rYoibvrYPy3C8DUR2ZVv0dH5VN1XM1G9x/fsAcu+slGIXhmUYUyUf2JpEa/ktWGx2C3ImVDtkuof7ZjsNw4N0/8rChfwcZUBA2AOjiCjRBZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVusp25MZ95j0nQD+H3p/w2IQKLPZaZ7c9fL5Y2NRrI=;
 b=MIICiXBa5nphEj8CIfvmdKFog/LQ2w9iS71W4Xs2Ws1lkp5+XdP1jLvjleAm+9Na4W2bRqN8nJuSAop8F3jiXu080S3lxDC7vT8JDubbi7kkZLFa9rzf65LonX0/YkAAYOEWcfB3mUwJ02NjeiaZpgVl0V6alYwmBBrNY8nvHDI=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3096.apcprd04.prod.outlook.com (2603:1096:4:71::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21; Mon, 13 Jul 2020 05:50:04 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::41e0:35f:a74a:e1cf]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::41e0:35f:a74a:e1cf%7]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 05:50:04 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Issue about redfish in openbmc-test-automation
Thread-Topic: Issue about redfish in openbmc-test-automation
Thread-Index: AdZY2B6R730Q6RZ4TOSFtBUmr2jI5A==
Date: Mon, 13 Jul 2020 05:50:04 +0000
Message-ID: <SG2PR04MB309395DAE41A04DFB435D1BDE1600@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiOTg1YzM1YTQtNzAwZS00MzU1LWJlYjUtMThjZmIyYjJmN2FkIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6ImxjMzU2VmdySjNBT0x0eWY1U3VubDJuMkh6SFV3VXh6cWM4KzJ2TFVqOTV5Z1c0dEdkejdzakhDUmtZaU55ekUifQ==
x-hclclassification: null
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [27.57.46.79]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fde4a967-ead0-4019-b7d5-08d826f09958
x-ms-traffictypediagnostic: SG2PR04MB3096:|HK0PR04MB3009:
X-Microsoft-Antispam-PRVS: <HK0PR04MB3009145BD730696F4EEC5E67E1600@HK0PR04MB3009.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: zEQ0TNNO0+wAWanCjp4oTYmnfEkLReyw1s4RwVB7CLG5G8PV7lRPccV06iije/nU60TIOLAgxyIeZa0LKDCCUpjoO5qFyTeuCOAkOFlmc0HRQ9bWSfq5Sp1127P0UnbW8bVdnj9VNpPUrkxrVSDGEqFmjgSmLKitewn6Cjdc0rpi+ehRJyNzGZZ95uKykTCaiU3YZOh2fFnbegZ02NmiqW0OLmOO4QqnhFnNW1xEpuYrTUWV9lPFeb8f58xK+bHeu4EaMnrMT9pGcZkrBS52wfRWVN8UbdD7JWal+TtHo2959wfzgy8jZuw01JOneTre0rGUjm1kt33qSR+qajBVKZcKHM1CN7iuDnBTimMkEg06AeGJotS55a2+grXnGnEXj8bvXXUxG1a6nwkYj7dzCg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(39860400002)(346002)(396003)(376002)(136003)(33656002)(8936002)(5660300002)(166002)(55016002)(8676002)(7696005)(83380400001)(6506007)(478600001)(9326002)(52536014)(76116006)(2906002)(9686003)(186003)(64756008)(66476007)(6916009)(66446008)(26005)(316002)(966005)(86362001)(66556008)(66946007)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: V9Ubd8yyAOlagT3SDpWkPfe2QXJ/jJHJWptb3ObuUB0VtOq4Fe2n5G/qIiLCewQ6L3t+VyoS2e0VProQigurj0GP1GgO6CFKfhlRZm3q6UPBzvQJODdbq2FOaLDpfuUFNN7naAn+Trha7k/gKcHNCLajFl0kE7jfaSLf6ylARyVOogTIH2ZdCFGcSTMh8uHLNHzuIFehWIITyChaC54Qvj2JVcBBMXDwL6oQPEM8kDdiXNt5qITCqCcerydXz8QwfLlyQ8IkqgdrOpuHGMxijLRRSAIfSOm82fiCfkPB2Yonj3cJm50KNXQ9LQyXH/v3z5Mpyys7Zuv67FU1+4BICobeVSUn/7J85E29rafY9MlKLE8BnqXTtawuEPxLETx0quDn3PnwpLQ2FCN5uNJi72+7Gdhv/E45Mw0KEy9dVHP9JdZdCA+FmwWyhUnookR63JHxLNV2pQ2nuc28nSt8Ju7RljSRhu4xIBzmjQz+z98=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB309395DAE41A04DFB435D1BDE1600SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3096
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT051.eop-APC01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:192.8.245.53; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966005)(52536014)(186003)(26005)(5660300002)(33656002)(55016002)(9686003)(336012)(7696005)(478600001)(47076004)(6506007)(82740400003)(2906002)(8676002)(8936002)(316002)(9326002)(36906005)(81166007)(86362001)(166002)(966005)(6916009)(70206006)(82310400002)(356005)(83380400001)(70586007);
 DIR:OUT; SFP:1102; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c887e779-cf39-47ad-428c-08d826f0975b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OpKjA4LdYEgctmT5qltw/wP2EgARa/L7FaG2XUDgtz0zwfWIFc/Ewu/+aGI0Cm7s3+SvIJnjnQ5G1qrCSvX9Om0tGNQggdmyvSW8R+lbEB+/37CmndpuGGKeT3je3y1oFULMrvxMbvW02fUit75cpvhYZL2/+ixN2fWuZw4/EO1D7PKdzHI9VcCITFEvPVCpOF2eh2VLZQ7Z4fmS68ATtPSwyCz6bxgiPu79CtTVFQ5zezidVowc++C35Zi/fsn/yCJY4ehDbLBElzNGTyDaDpJ1OH0OE3Jky6pc3mxr3asS8oC6gpCoZuIRoTpq3NrVaJ7Mcw93KURKb24QT4CSIVYfdMAFz23xQWwEZgfgckgc+k5w7Swugmht3zBJTdzReApU2YWVXOd03/AjbDqGNomOrgLsW+kYUT+89U4IyNhG2j+kRlclv9hvrK/tFComMbNrj1AyXyHjllEDOSbaLfrAx6sWVostNRVS31qwizI=
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2020 05:50:07.1493 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fde4a967-ead0-4019-b7d5-08d826f09958
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.53];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT051.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3009
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

--_000_SG2PR04MB309395DAE41A04DFB435D1BDE1600SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi All,

I am facing the below issue in my environment (tiogapass) and it is already=
 raised in Github.
This will be really helpful if the chassis-id is dynamically available. Is =
there any update on this issue?

https://github.com/openbmc/openbmc-test-automation/issues/2091

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

--_000_SG2PR04MB309395DAE41A04DFB435D1BDE1600SG2PR04MB3093apcp_
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am facing the below issue in my environment (tioga=
pass) and it is already raised in Github.<o:p></o:p></p>
<p class=3D"MsoNormal">This will be really helpful if the chassis-id is dyn=
amically available. Is there any update on this issue?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/openbmc-test-a=
utomation/issues/2091">https://github.com/openbmc/openbmc-test-automation/i=
ssues/2091</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jayashree<o:p></o:p></p>
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

--_000_SG2PR04MB309395DAE41A04DFB435D1BDE1600SG2PR04MB3093apcp_--
