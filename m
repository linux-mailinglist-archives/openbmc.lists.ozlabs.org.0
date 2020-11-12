Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0192B08B8
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 16:45:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CX5Ww5sXhzDqsh
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 02:45:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.133; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=f11ZLnnm; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=f11ZLnnm; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320133.outbound.protection.outlook.com [40.107.132.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CX5Vk5gzDzDqsR
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2020 02:43:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10C+hBuwqkCJcE8qmYNXHP78stg4mXiTIt83VL7PFu8=;
 b=f11ZLnnmxhDGFVv4K2fgd7QIlORB57Q6U+3vFAUrY4CDeCCpp9djD3INwhpzh3+zoYYqwb4naXZs9AW54EB3iwc6RmBNa0u0NGGWQtGXrAA6loglZgtbRQnYnRy3NU5qFMre2ky7V0Zv3HHvkfrj3XSbZYHB8Z6srk3FD2+qZ00=
Received: from SG2PR06CA0179.apcprd06.prod.outlook.com (2603:1096:1:1e::33) by
 SG2PR04MB2331.apcprd04.prod.outlook.com (2603:1096:4:4::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21; Thu, 12 Nov 2020 15:43:35 +0000
Received: from SG2APC01FT059.eop-APC01.prod.protection.outlook.com
 (2603:1096:1:1e:cafe::5) by SG2PR06CA0179.outlook.office365.com
 (2603:1096:1:1e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Thu, 12 Nov 2020 15:43:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.56) by
 SG2APC01FT059.mail.protection.outlook.com (10.152.251.134) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Thu, 12 Nov 2020 15:43:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5cUWQ4Dbv1DTzEMJrfdXSa0A3wRuhs8gGeSGn/bvvJ0xn7m+q7LlXDcoqIRWsd6OtGOV3cFNZ+wc7nmGA3lBak3ra4oQqhLc0VpKzM1ExLVzyTxvwKmBUcpB1vkufwUVz6kKLmDHzutsiGJqyVeOvYWEW2jX0GZWHvsLzaHPmpgqEVRwrP5RofDcBTlygf4WXbsF+GJU1RV60F3ztpe+WiO1aCMIhtZgNVpnAPrucNZvkqNaNolR83FDPHPg3PZKQxifrCAooihNUlNeedlJH1tE3GDOtJZsFG/OaJUcpyuREJvVDKFie4Ak9aXuMCwWqojTZbLghpSvQnchvcIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10C+hBuwqkCJcE8qmYNXHP78stg4mXiTIt83VL7PFu8=;
 b=VCrjUssrus4g5GxtSomQh818O9yr6/Zdq3rUUdORSkDnC2gK/lwIAsejv7msfkCnwPXHw89Zwth+sc8DucK50DufaPTUrf7Ky7YacVF+DWsJi0jYswb8UTLAGrm3be3g+nuxFWbcX+kdLA3OCt/uM/NuY521W96muQ+cLigB0fCDOS9xA73AxzcCRgS6wj68lFdojA1bzHtXCIlqAbq1j/LuJ/2wF6lkRodfFKp2zPLQMTu8PvNtSkd8PTO+/ry6V80GjnIDRyD4RZ+cIBQfJzkAAP53G15qn9//F2OUNxe0+GlH5OvRT3yt28DmuibtMpELq+JYY7l82NZCsjg4fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10C+hBuwqkCJcE8qmYNXHP78stg4mXiTIt83VL7PFu8=;
 b=f11ZLnnmxhDGFVv4K2fgd7QIlORB57Q6U+3vFAUrY4CDeCCpp9djD3INwhpzh3+zoYYqwb4naXZs9AW54EB3iwc6RmBNa0u0NGGWQtGXrAA6loglZgtbRQnYnRy3NU5qFMre2ky7V0Zv3HHvkfrj3XSbZYHB8Z6srk3FD2+qZ00=
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK2PR04MB3618.apcprd04.prod.outlook.com (2603:1096:202:33::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 15:43:30 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::e52f:5fdf:e09d:fa29]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::e52f:5fdf:e09d:fa29%6]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 15:43:30 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Fan failures in phosphor-pid-control
Thread-Topic: Fan failures in phosphor-pid-control
Thread-Index: Ada47FMyELYHuvydRK+9g5wvavHZXQ==
Date: Thu, 12 Nov 2020 15:43:29 +0000
Message-ID: <HK0PR04MB2964AFE422A0019557CB1BA3FDE70@HK0PR04MB2964.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_1nt3rnal
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNTE3MjIzMGQtNTlhMS00NGJhLWFkMjQtMTRlMDdiMGU2MWQ2IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWWx5WHBPd1dySkNBalg2ZU5GTFAwWVFWS2NcL2dnSkdHcmhkNXBiWjdXSUw5dFZnbzRVTUZFTmkwckpjT2xhbHUifQ==
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:620d:471a:90a5:3040:7d15:e82a]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 51146abe-7007-4bce-f83c-08d88721b721
x-ms-traffictypediagnostic: HK2PR04MB3618:|SG2PR04MB2331:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SG2PR04MB2331108BD0EAA8F53DA3CDE1FDE70@SG2PR04MB2331.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: hYrXOsDrH8ChOQEkEXtjNWLHszP5PR6bHUDZfS+j/a3gFqj5F45OqRSmbbVZPMXh4rpLLpN+iaO97FBxmtcpefXc9CDQAIDGTWQRrh//iv+FSRjXm2PeAMFVw8rRNZ+3+HP814u85mDbsB+XCrkOGIXbtySeLUBGEQ1HBjJB8HG9EOt56xixRqGxOwW0Kfd574LT9ExffZ7OmyeYOhhr7TTM1kldHCLxj9GvLrErvWhVMF4L1lArP900Rl/ipHpj45f7OUF/HrOkYyXd96kpT0S7Z0w2u0QS7TAUp7N+HeHzLCHo6HydfxY42BwSUWDn
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(76116006)(86362001)(66476007)(66946007)(8676002)(66446008)(64756008)(5660300002)(66556008)(6916009)(52536014)(71200400001)(9686003)(8936002)(2906002)(33656002)(54906003)(4326008)(478600001)(83380400001)(6506007)(55016002)(7696005)(316002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: IAKQZFULXd/GI3AQRp066F0gm88394q1tNjkz1zJE94rsP0Qh/qcYpM6u364e0GTM1I7Wt/HIK5oKJM15NDdr2Vl9kzpHB2aWHO9sd/4wac408bw6sCiecCLNFvCAdl5oGVUpKKWgv67jZVVjIPFHLQPlHH1s/ZH6lX7FmzvyKUb0ECQzuYsYKr5hCnn+pse3lhu3F53ELlxiln5fqn5yB0b2nvOrHpY0iPpizvnQTUZo806OvTqSkdgGORCfCNHJbSKNr84ZCsThXTr/aapEfYVSozH9oBLT/6CTWCUnrx3ZY9o9uOKjC9ZkqMWMejU/VS3N2BnNDQjRr0TKv1cJZWFatcgTUS0yRCFebMA8lGeVCyQVW7SSqScGxJxEfO5job4R8QDIZk2DJAYxhobMVc4e8oXZtbrBojG+gaWhYKimd2uOBAL5xzxz2MhJUrPdQXVfVisSq28sPG+7gVzJyyl8UBjG7qbKAqFMy7Y7xlSFTgDXcSeUr1CpiT7tljCTAHl5u9MMP7ruuqUEAf7bfzyKGNqHCXl5VKWL7U3e69vaM+PVqvzglm0XgRGiSWiMOh23FzCpZhUA9NQ71uBLpuwWNe1WSX/8MEMmdJHQUgpLbDcPWU/AEA18PwlHjDVnMJHm8C5Or76xzE8F0LC+dhwd8kRtmQC6NeljCi/bimzHCK5MroDKDujznDryzBJ5AeUAGVLkiciOwSypuHJBg==
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB2964AFE422A0019557CB1BA3FDE70HK0PR04MB2964apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3618
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT059.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5eede47a-ccac-4779-7904-08d88721b464
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IXCjWMCYEGJ9hxqkFWF43N1UwhhI6G1CKehiYlvzdQglM6yyt73ejcirbHcnvLxTmLZ0uJQNJfBHMbShKJJ1tz7vgK3COyUwzy6zyJFn9eLugi3YV4/nJfZ191iuQUb0Ex7C+NeWK5H1rWT98X+zOqb6l8NLuOoWsI9T+S2MBcIlOQCoVB5So2M5shIC6K+WK9cAhU1+5e3bx5K7PLODI2uNUOpPaSVQMgiegDbQVrs0aEgVq246KX9Ym6afRJMfmCF4exM6Q2ke0klPkFCE+b/jZIrnwNiRmEeOMoh40zP376eF27aEEi3eqYuCbKgfkkd4FXzntO3uHdxd/ykXwUnEnFQ6C4AuZbYIzbCowQfehEwY0YRRSeC7FcLUeyrbllOLwue8vq14jpKeo2NFRQ==
X-Forefront-Antispam-Report: CIP:192.8.195.56; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(46966005)(70586007)(6916009)(6506007)(47076004)(316002)(36906005)(9686003)(86362001)(33656002)(54906003)(82740400003)(336012)(26005)(356005)(186003)(8676002)(83380400001)(55016002)(8936002)(81166007)(7696005)(5660300002)(4326008)(52536014)(478600001)(82310400003)(70206006)(2906002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2020 15:43:34.1686 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51146abe-7007-4bce-f83c-08d88721b721
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT059.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2331
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
Cc: Patrick Venture <venture@google.com>, Patrick Williams <patrickw3@fb.com>,
 Josh Lehan <krellan@google.com>, "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB2964AFE422A0019557CB1BA3FDE70HK0PR04MB2964apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Internal
Hi All,

          I wanted to handle the fan failures. If all the fans failed in th=
e system(0 rpm or < min rpm ). We have to reduce the power consumption of c=
omponents in the system/hosts.
          So that we can reduce the heat production. It would be more platf=
orm specific.

          I looked at phosphor-pid-control code, it looks like fan fail saf=
e value was set as default and fan value 0 also ignores.

          Could you please confirm if fan failure case already handled or n=
ot ?  if not, How and where we can handled this, Since this implementation =
would be platform specific ?
          Any design thoughts/inputs on this.


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

--_000_HK0PR04MB2964AFE422A0019557CB1BA3FDE70HK0PR04MB2964apcp_
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
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; I wanted to handle the fan failures. If all the fans failed in the syste=
m(0 rpm or &lt; min rpm ). We have to reduce the power consumption of compo=
nents in the system/hosts.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nb=
sp;So that we can reduce the heat production. It would be more platform spe=
cific.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;I looked at phosphor-pid-control code, it looks like fan fail safe value=
 was set as default and fan value 0 also ignores.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; Could you please confirm if fan failure case already handled or not ? &n=
bsp;if not, How and where we can handled this, Since this implementation wo=
uld be platform specific ?
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;Any design thoughts/inputs on this. <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kumar.<o:p></o:p></p>
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

--_000_HK0PR04MB2964AFE422A0019557CB1BA3FDE70HK0PR04MB2964apcp_--
