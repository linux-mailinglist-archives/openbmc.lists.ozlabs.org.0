Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1304A24C4B0
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 19:41:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXX573nwmzDr5Q
	for <lists+openbmc@lfdr.de>; Fri, 21 Aug 2020 03:41:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.131; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=velumanit@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=HVu+1QNa; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=HVu+1QNa; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310131.outbound.protection.outlook.com [40.107.131.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXX4D0rRbzDq8x
 for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2020 03:40:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doqMiatjV46HGdplhouNkwwTZNGeZIPRpwWWnYalunY=;
 b=HVu+1QNaXGQYTqJkuCs8JpG3T77vlWmMTUF48l+OQd7D5o0TxZIDmMzVOVm1N8ESAXZF7jgTJ8YtI1TTFNeaxJIUgQaRonfszr21tgX8kvVApNxhSUeuzJ+Wgsf21oRaHcgv5zJDDjcj139t+r5xJ2wNtDvLDwDXlbvHlrDiQpE=
Received: from PU1PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:803:16::19) by HK2PR04MB3588.apcprd04.prod.outlook.com
 (2603:1096:202:33::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Thu, 20 Aug
 2020 17:40:34 +0000
Received: from PU1APC01FT025.eop-APC01.prod.protection.outlook.com
 (2603:1096:803:16:cafe::b4) by PU1PR01CA0031.outlook.office365.com
 (2603:1096:803:16::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Thu, 20 Aug 2020 17:40:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=permerror action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.57) by
 PU1APC01FT025.mail.protection.outlook.com (10.152.252.237) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 17:40:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OItDkQFkrSDAvCkL1aFzfS48oWKcIDuPvoBGzqkHc/uY+b3KuTsImASs/FJ+tUR5PAN+VG7kygJB0majijA6gGbRW5MaFI3rHjcXSAQ5P4LKAH5hmbfqaxIF0wcoaObMwXGouhOb8HLnvwRtLBiafop2/4QJy38gcbVcHdvS9PBjYXoTyhAjRmupQKxqwdQSTYg0Ih74SnGrnOQinAzW6ot1q3IWCPUc16TrysN+FNh86/Y5wIhWSxadB8xVkzDr2IL4NEKclKc1XQHd7sYFHLa4/p/GzDpCGodGrGY/vZbH27kjDIAiG3mp9zZFW8RK7W97v+NZ1Jd4jm1C0AXAFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doqMiatjV46HGdplhouNkwwTZNGeZIPRpwWWnYalunY=;
 b=O7w0LjSPHYEuQZUrjWSp50zEdxzK/NPxrJJOnkgntfDgqJEpfn9FrUKPRlFaH+SLtSqCFFXhOx2L53+n5jyWvehf8620ONac1AUIXl6D59cBsPUWXW/wBQBxEfgCofkw5uGhbWCakPWe+xPF6bwrQ06vdaCY4Gg1VeefAnXPoh4rUkR2atdevAdF6iMMi79MUkWanb9Mh+vk4/Us6jdjscjyWOfZ3lp1w2QFBuAF6Ehs+r+vlckpks3H0l78WLhIOEAmB9pB2mpB72tzuJEeQ7+ciCi4l/GFRiG2HB/T6lhqCa3yqmzbUj5ayWWWsmw90sAcikhZh8auYkog1Zte/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doqMiatjV46HGdplhouNkwwTZNGeZIPRpwWWnYalunY=;
 b=HVu+1QNaXGQYTqJkuCs8JpG3T77vlWmMTUF48l+OQd7D5o0TxZIDmMzVOVm1N8ESAXZF7jgTJ8YtI1TTFNeaxJIUgQaRonfszr21tgX8kvVApNxhSUeuzJ+Wgsf21oRaHcgv5zJDDjcj139t+r5xJ2wNtDvLDwDXlbvHlrDiQpE=
Received: from HK0PR04MB3153.apcprd04.prod.outlook.com (2603:1096:203:80::9)
 by HK2PR0401MB2161.apcprd04.prod.outlook.com (2603:1096:202:d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.24; Thu, 20 Aug
 2020 17:40:27 +0000
Received: from HK0PR04MB3153.apcprd04.prod.outlook.com
 ([fe80::f5af:ec35:8bbb:f9f]) by HK0PR04MB3153.apcprd04.prod.outlook.com
 ([fe80::f5af:ec35:8bbb:f9f%3]) with mapi id 15.20.3283.027; Thu, 20 Aug 2020
 17:40:27 +0000
From: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Pass the gpio value from phospohr-gpio-monitor to other applications
Thread-Topic: Pass the gpio value from phospohr-gpio-monitor to other
 applications
Thread-Index: AdZ3GJGMYScRBou3TC+t0UOCurFJwg==
Date: Thu, 20 Aug 2020 17:40:26 +0000
Message-ID: <HK0PR04MB31534D7547F7008B8745213BA75A0@HK0PR04MB3153.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMDc2MmU0MDUtNzMwZi00Y2RjLWIzNjgtYjFjNWFhZDQ0ZDU4IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IlZjNVhaQU1WUWZvUjA3UTBtUXhxTlNTVHhyK3ZLcTNicTVxQ1o4TWVoMXR3NXV6MHhpTStKblpxcmlla3JkOWoifQ==
x-hclclassification: null
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [171.61.236.0]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5575e595-4b57-486e-225f-08d845302315
x-ms-traffictypediagnostic: HK2PR0401MB2161:|HK2PR04MB3588:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HK2PR04MB35889BC7A6E39F38E7318D2FA75A0@HK2PR04MB3588.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: NBm+Y2lm+kO/8+Hj968s03ln5yffl7idyo8mYJ3LP0FkWjVcx9msNuY3FMrQcX6MQhNl1mFUPQle/jeSxCoPTSvWvtumq9r1LEgH2uqtibfxQQe430YVWrVLcEEqtrl76Zwt0kuCI9hqvnTBBkDbCtzHowMzAmuQfq4tpP7XHyYk16tAvbNIS/RQx0M3urASKPitviDyJB0h5bTzo/jCAFJcOUxZBa5G+fBpnwpLi+vL5xXo/LpErA73g63Furv8xKRvVs8WDS63M67o66Fbfgowyczf/x3Yxk0Id1YjCKaWAkHBUHbLhjBOHorbYgA+Ya5t1WqAHT4udRllzjt+bQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB3153.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(86362001)(6916009)(2906002)(9326002)(55016002)(9686003)(8936002)(8676002)(52536014)(26005)(66946007)(66476007)(83380400001)(64756008)(54906003)(66446008)(4326008)(316002)(478600001)(66556008)(6506007)(71200400001)(7696005)(5660300002)(76116006)(186003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 8gEaehpKflDN+njnaBCusW5xosIPYlgTo815RsKTaSTY7os7yPLYwYjq2PIzZVKNRRuuhqDzMy8m87eYx6Q4pkxWnZiPbss1du92wcsJIEYyTLl5DSp8aUd1IkaJwCQDnUR19w5mBBpy1h1HIYuECDEwFXhMh0iyqFI0Onsql82J7kllzfiuCBpHbkGlDszQa0owqKjIiKwVXg3vUg0hutV2XuL0QfMVT/bb1TaHra57AJtWkuy0k7Zlc0qqO88BTzrzGTs+S0kOJc4gff+dm3q9mY1kJBp0T43kRU/I1w0ctLMBIJsZULsmGvV1JvDOt9cC2wTtIJ4QlkyyK+MIjS20vMGvDZAfYgxwfiOBanl+Dmmi2mTDPdAJ/2MpfGX3A+sbw9+KSZqQmWq88kpsbMQooBr4UMYXv9dSeOvATB95HfLkKLro6t87/Dv6FVXhxc3KRy/cqL0XqquV243de/0yJlF12+PGjx3Za/NBtmKbkIiEw9NsFQNVANPu2pG7Kvv1YK97/5WzpwmJIM1CoQKiRUpjMGc2fXjdJglGU/9lq2RCZ2PcF774WvlKQxSatpdlF1emRtxouJBdragZU8b8A8g60ldXSGshs0V4S0Eq6s8MWQ3ga6/Qi3warpaEcIybxFnTHY04yo1qDb6wZg==
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB31534D7547F7008B8745213BA75A0HK0PR04MB3153apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0401MB2161
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT025.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0ca4672a-932d-4f00-4ca9-08d845301fff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4aCw/Wkf/hjigjoBo/GkKBaj1WDIOM9Mg5zZgj71KS7GEYeOrVXSER1BfXg0EVqAz9eVsvutoI3hb46M93986+izfwG4ohBUo9yF6eZEcjkTXHKHS6tVSCrUjpj1s+31ZVt38WqqTTntP+bhIgya/d4e6LaXjZfNp1v4CS3xZdCVaZlFV9aJgIhdwgrMAuvvNmJ+uDg2uZqyPutSvlqp+6jfxjnHaTgpVwFCCbkIfU74sNY1wT/1LDw1JsDyVls/CMfQY9hPy6c5j7gYTx7sfwaZiLo77bQHiv5cGMt/7OepOqTVMRqeoJ7erGot+hO0C0Ti9RV4MSC9AZw/UmyVe0f195Uf5g3+4mciwAvQWJ2w6GOfX2+lTyXGcSecOpQSAPmMkvaIgYPT5zcyZCSXKQ==
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(46966005)(83380400001)(70586007)(5660300002)(9326002)(70206006)(52536014)(86362001)(82310400002)(8676002)(6916009)(8936002)(2906002)(356005)(4326008)(47076004)(478600001)(33656002)(55016002)(316002)(81166007)(82740400003)(186003)(7696005)(36906005)(336012)(6506007)(54906003)(26005)(9686003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 17:40:31.0705 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5575e595-4b57-486e-225f-08d845302315
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT025.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3588
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

--_000_HK0PR04MB31534D7547F7008B8745213BA75A0HK0PR04MB3153apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

I understand, when the gpio event occurs, phospohr-gpio-monitor starts the =
target unit and exits.

So whenever gpio event occurs, is there any way to pass the gpio value from=
 phospohr-gpio-monitor to other running applications like x86-power-control=
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

--_000_HK0PR04MB31534D7547F7008B8745213BA75A0HK0PR04MB3153apcp_
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
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
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
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">I understand, when the gpio event occurs, phospohr-gpio-=
monitor starts the target unit and exits.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">So whenever gpio event occurs, is there any way to pass =
the gpio value from phospohr-gpio-monitor to other running applications lik=
e x86-power-control.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif">Velu<o:p></o:p></span></p>
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

--_000_HK0PR04MB31534D7547F7008B8745213BA75A0HK0PR04MB3153apcp_--
