Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DEA11C098
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 00:32:02 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YCrG6r1KzDqvL
	for <lists+openbmc@lfdr.de>; Thu, 12 Dec 2019 10:31:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.124; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.b="nshd5iMM"; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.b="nshd5iMM"; dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320124.outbound.protection.outlook.com [40.107.132.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Xxc95CxWzDq9k
 for <openbmc@lists.ozlabs.org>; Wed, 11 Dec 2019 23:50:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmjBV9QDJQltU+9oWIbg5nn94FGexm29HGfK/HzI6/4=;
 b=nshd5iMM6MDPnBclS8APKoWIdg0FfZiOpCkdPN9QknFbb1kFGE2CiFd9RMKrLgtEBMqyJlpVRdH6AuzcDZpcwsQJ9Ech74vbih8s9rsJ8863545ct8Vs3/LJZBfAXmcbj7uLBfR0/9rfSZKei+u/7usHUwswdxA8O3+pnCFuxdA=
Received: from HK2PR0401CA0005.apcprd04.prod.outlook.com (2603:1096:202:2::15)
 by HK2PR04MB3588.apcprd04.prod.outlook.com (2603:1096:202:33::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13; Wed, 11 Dec
 2019 12:50:25 +0000
Received: from HK2APC01FT031.eop-APC01.prod.protection.outlook.com
 (2a01:111:f400:7ebc::201) by HK2PR0401CA0005.outlook.office365.com
 (2603:1096:202:2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.14 via Frontend
 Transport; Wed, 11 Dec 2019 12:50:25 +0000
Authentication-Results: spf=pass (sender IP is 192.8.195.59)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.59; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.195.59) by
 HK2APC01FT031.mail.protection.outlook.com (10.152.248.189) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.25 via Frontend Transport; Wed, 11 Dec 2019 12:50:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfZGdTCXFleJu6PtXfiqCDm+4INfRtX/HUk9h/+JMoOUBeV++U2N5HuZxSNJysb9TvaNzK9aa7/C8gzGrh19e7IMunGVvFDSIzBcUWrqqfuLiwUWFS95+uuMfk3wvJrmJEFzSbYNUv4VdX3HyClktcUHDTNwcUuImnv0TrixycbLiAu9U3EnhsN006QWnRKPw12r7h702Vgs1Oisbnktd+0OizNcOgxlQMdHzpiiSbsNB14IjUCsudk/BQSU2Oqy0rdDzfQjds4FdNEljKa+S782aFYhJ01UMyAIO9zQOvbZ+dMf1a93lHCV6Ncg9VBPINuPI767FmhMZmWY2qKegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmjBV9QDJQltU+9oWIbg5nn94FGexm29HGfK/HzI6/4=;
 b=mN+fn5xBxBENL6zwDK/pD59ZGnAhf/SWSlmasNQygG0h3yTzN+UK03jfZeCewKavmPJ4e/vI+X8jKk0pZHZwfwXTptV4OdzUGk26MT5Dbp3Zum2wNcBQpM9ZiKzLFDPVyRLISyLI++BecwzLUgkQBuD2rOYabIzgY/A+fSOAxOF8yE6rK4UN4s4TCx4HniB07ae0AiJN7hCJu8I8swcNDA5WvP2C9UOxlvMXe1gSEqiRyYnEMJ/HdNxaGPWkvOkpWXB3L9LpPSj8N81IatG5IJ9ToKOYYQK3e9EXDCXlrnQskgfYT1OFNCW8isp9S9hV9L2u8BsrddOf0D5/mDY3UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmjBV9QDJQltU+9oWIbg5nn94FGexm29HGfK/HzI6/4=;
 b=nshd5iMM6MDPnBclS8APKoWIdg0FfZiOpCkdPN9QknFbb1kFGE2CiFd9RMKrLgtEBMqyJlpVRdH6AuzcDZpcwsQJ9Ech74vbih8s9rsJ8863545ct8Vs3/LJZBfAXmcbj7uLBfR0/9rfSZKei+u/7usHUwswdxA8O3+pnCFuxdA=
Received: from SG2PR04MB3029.apcprd04.prod.outlook.com (20.177.93.17) by
 SG2PR04MB3580.apcprd04.prod.outlook.com (20.178.157.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Wed, 11 Dec 2019 12:50:19 +0000
Received: from SG2PR04MB3029.apcprd04.prod.outlook.com
 ([fe80::34a4:b6ee:359e:a447]) by SG2PR04MB3029.apcprd04.prod.outlook.com
 ([fe80::34a4:b6ee:359e:a447%4]) with mapi id 15.20.2516.018; Wed, 11 Dec 2019
 12:50:19 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: GPIO-Direction issue
Thread-Topic: GPIO-Direction issue
Thread-Index: AQHVsB1YioCulj/BSEKzev0Y80Jx0w==
Date: Wed, 11 Dec 2019 12:50:19 +0000
Message-ID: <SG2PR04MB302999E339EF294C04B14DB6FD5A0@SG2PR04MB3029.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_Publ1c
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiOTNmMDQ4OWItODhmOS00Yjk2LWI1YTMtN2Q2YWI0MzRiNDk0IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IndMcnFYS0tUTVRxMFh6SjN1WjMxc2MxdzlIK1FtYWN3REFSNnBNTVwvYW1OMnBta1hJRFdkbzJpRmdKb24yOTduIn0=
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=thangavel.k@hcl.com; 
x-originating-ip: [192.8.254.10]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9f41faea-6d11-4f81-d21f-08d77e38b104
X-MS-TrafficTypeDiagnostic: SG2PR04MB3580:|HK2PR04MB3588:
X-Microsoft-Antispam-PRVS: <HK2PR04MB35888F33B0E54A26702F4B06FD5A0@HK2PR04MB3588.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:6430;
x-forefront-prvs: 024847EE92
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(189003)(199004)(53754006)(38564003)(52536014)(6916009)(86362001)(33656002)(8676002)(76116006)(71200400001)(26005)(66446008)(316002)(3480700005)(478600001)(66556008)(66946007)(81166006)(81156014)(64756008)(6506007)(66576008)(9686003)(8936002)(2906002)(7696005)(5660300002)(55016002)(186003)(9326002)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SG2PR04MB3580;
 H:SG2PR04MB3029.apcprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: hcl.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Z1WsWW1NFFZrffa5v6ONzBR65e3YGqO1yjdJsI3eutmwQkv0cpDPbqXuFHBqOQ6krOCCp3xft826SenPpYWKeE/W67jF18DZBSCJ6U+80XN+/K9EgVH/LIyRX8m6wleuijIVDPCHR992+aVIoQYCnMCcaj2dF4Wva0dTBn/87h0D2seFzghqGMQ/odMLbTdiEj71uQypdXyhnBhw6X0U7HV3Dn3BMXr7Q1ZT6lnYD8RhtNwfdnDEoz+WsQW+Su2oE0aipoOOoB21uQ/Y30RSfNoSPMougms8evubf2iW0J65EWRvtiTO5RXHCDCZYzGsOb/LRK5hSALVcwSaQeYIo9ybkvdkvx4+7HI9YMJPtQTLw7PBKwKHNHWH5AyXI7SyJxsgn9KcLYNZW15u3RRW0nTGN7Y+mNn84c+h0/HCVmUGXNEjPtHB9Hks4810X6QvQ37pdghkNbvd6RW8F+gQP0+4dLKofoU+SyMmT6IEp7dUCORKydd9L8goF7yjzDv0Pl5LuxU0I/0PyhtDgyjWGQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_005_SG2PR04MB302999E339EF294C04B14DB6FD5A0SG2PR04MB3029apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3580
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT031.eop-APC01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:192.8.195.59; IPV:CAL; CTRY:IN; EFV:NLI;
 SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(39860400002)(346002)(396003)(136003)(53754006)(199004)(189003)(38564003)(6506007)(5660300002)(52536014)(8936002)(55016002)(478600001)(235185007)(33656002)(26826003)(36906005)(316002)(26005)(2906002)(70206006)(9326002)(6916009)(66576008)(8676002)(186003)(356004)(81156014)(7696005)(76130400001)(336012)(9686003)(3480700005)(86362001)(81166006)(70586007)(2022615005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:HK2PR04MB3588;
 H:APC01-SG2-obe.outbound.protection.outlook.com; FPR:; SPF:Pass; LANG:en;
 PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1170537a-61a9-4c8c-5937-08d77e38addd
X-Forefront-PRVS: 024847EE92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p7Z3+cYs+2cAerK5/FwQf/y0w+tyLuwNbBG+cMuaWqYAgXj+FN0nXnf6+iNwt85nV4Wn3WsXkg6BnTzdrR04OBn44PofzuaRIQM+r6i137Mv1D84Hyd+gTjbVfuxIXHlSQX1Hy0n8hjfOHkPwj7JELI5TvApY9oEfvKJErsUVh1/gldfiITgHwueiEQSyF/vZiJOo/b31QNO7gmpFCM7sRL9xfJGANDUBqmvRiJ+ddu/3QAEZjzNkhoF1XeXJtBJWy1/CLWQjlUu3jtMwmXoJDDj75i6E9Qw4NkHFUVlFFnXmcgcqA9u75035VGaO/EwbsIYN2Inulef0+cky/omiRQcMaeWu4USVqYlw8Hn5TvLCHvFhiytaHKeVhsr0PwddE4EGTbo6KXEvlweUenog3hFMB0K+AA05WQsKT7crIlcjG7H67CYEmeku5E3bnUzB6fheBWZrgxJQbSDftth3OgGMV9wbd+lNrTnmXNEXabOkeRdmwLnia5eqUYI1u7SE88zv5l8uxNWl0xFTc75otbKnhonL647taVxglOUaxE=
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2019 12:50:23.3163 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f41faea-6d11-4f81-d21f-08d77e38b104
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.59];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3588
X-Mailman-Approved-At: Thu, 12 Dec 2019 10:31:03 +1100
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

--_005_SG2PR04MB302999E339EF294C04B14DB6FD5A0SG2PR04MB3029apcp_
Content-Type: multipart/alternative;
	boundary="_000_SG2PR04MB302999E339EF294C04B14DB6FD5A0SG2PR04MB3029apcp_"

--_000_SG2PR04MB302999E339EF294C04B14DB6FD5A0SG2PR04MB3029apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

        I am using entity manager configuration file(.json) to enable the G=
PIO pin.
        The gpio node was created in /sys/class/gpio/* using configuration =
files.
        I set Direction as "Out" in json. But it was not getting changed in=
 /sys/class/gpio/gpio*/Direction. The Direction was still remains as "in".

        Please find the attached logs for your reference.

        Could you please let us know how to set direction of GPIO.

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

--_000_SG2PR04MB302999E339EF294C04B14DB6FD5A0SG2PR04MB3029apcp_
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
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-compose;
	font-family:"Times New Roman",serif;
	color:black;}
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
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Hi All,=
<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I am using entity manager configuration=
 file(.json) to enable the GPIO pin.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The gpio node was created in /sys/class=
/gpio/* using configuration files.
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I set Direction as &quot;Out&quot; in j=
son. But it was not getting changed in /sys/class/gpio/gpio*/Direction. The=
 Direction was still remains as &quot;in&quot;.
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Please find the attached logs for your =
reference.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Could you please let us know how to set=
 direction of GPIO.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Thanks,=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Kumar.<=
o:p></o:p></span></p>
</div>
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

--_000_SG2PR04MB302999E339EF294C04B14DB6FD5A0SG2PR04MB3029apcp_--

--_005_SG2PR04MB302999E339EF294C04B14DB6FD5A0SG2PR04MB3029apcp_
Content-Type: image/png; name="GPIO_log.png"
Content-Description: GPIO_log.png
Content-Disposition: attachment; filename="GPIO_log.png"; size=32834;
	creation-date="Wed, 11 Dec 2019 12:41:03 GMT";
	modification-date="Wed, 11 Dec 2019 12:41:03 GMT"
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAABVYAAAMACAYAAADPPjzCAAAABHNCSVQICAgIfAhkiAAAABl0RVh0
U29mdHdhcmUAZ25vbWUtc2NyZWVuc2hvdO8Dvz4AACAASURBVHic7N13nBT1/cfx9x5L5w6OJsVG
V0FFikoTC2fvPRpM1Nhix9h/GmOixhJii73GxMReiKfJ2ukdBCuK0nvvcHfz++PYdW5uZnZmdrbd
vp6Px/fB7Xe+820ze8LH73wnsmrVKkMAAAAAAAAAAM+ihkFcFQAAAAAAAAD8KMp2BwAAAAAAAAAg
37BiFQAAAAAAAAB8YsUqAAAAAAAAAPjEilUAAAAAAAAAdc71N9+qHRU79OD996Wl/mjQEyOqUuPt
c7WlQWcZLHwFAAAAAAAA4MPHn36mFi2a64D991ckEgmlzs2bNysSKVLjxo00febMn/O3bJFRVaWm
TZuG0o4UcCuAiKrUaNX/tGPM+Wq88n1FVJVyRx578ikNO/Z4TZ8xM3lhn0447fREvYZh6NXX39Dq
1atDbSNd9WbK/z78SMOOPT6RjjnpFF18+RUaN2FCoox5HusiL3MAAAAAAAAy7+bbfq977n+gVv4f
7/mzTvvFubI+kf3JZ5/r6BNP1tatW323tWz5cg079nitWbvW9nhlZaU++uRTXfTbK2rFslauWqWj
TjipVhp27PF68R//TNr2q2+8qWHHHq87776nRv5no0frymuv0+nn/FL3PjBSmzZt8j2ubFm0eLHO
Hv4r22MNGzbU2rXrNH/BglDamjRlin55wW90+TXX1jp22ZVX6dzzL9TY8eNDaUvysRXAtqKF2lDx
kyKqp+b1W2h1/dVq13J/zZvaSM27LNfapdtUVVGl5p1bqdFuxb47Mnb8BJW2aKHR48ap9/77+T4/
GcMwZBiGNm/ZordGjVK3rl1VWloauL4XXvqHFixcpNtuvlGSQqs3WwwZ6tChvR4Z+RcZhqGtW7fq
088/1x/vuVfPPfm42u2yS3W5nfNYF3mdAzfW+8IpDwAAAAAAeHdQ/376579fqRGTMAxD02fMVGVV
lb79bo56dO+WODZz1iz16rmPGjZs6DuOES/vFANZtWq13v/f/zT8nF/o3r+MrFGuVcuW+uDdt2uU
X7d+vc4e/ivtv9++rn1ZvXq1/vnvV7T/vvvW6MeUadP0yONP6Pabb1KHDh30xNPP6Pd/vEv333OX
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
NW9eop/mzdN333+vNWvX6unnnq8+befYWjRvrp/mzdOGDRu0wtRPGYaal5To8EOH6uHHHteixYu1
adMmPf3cC4pEIhoyaODOsjXnwvxG+oqKCo0ZN14bN23SuvXrtXDxYhUXF3ua06BJpv07nJJ5Ht3m
x21emzZtqmGHH6aHH3tc8xcs0I4dO/TdnDmaNXt21sbudQ6aNm2q1q1a6eNPP9O6des0bcYMjRs/
ocY5dveFXV79+vV18IEH6tHHn1SvnvtkbIwkEolEIpFIJBKJRCLlc+rXp4++/W6Ofpo/Tz333rvG
sb59DtCo8vfVp3fvRF6yOESLFi108IH99fhTT2vZsuXatm2bpk6fnojRJEtO5aqqqvTp56N1xGFD
a+RHo1Hts/deat+uvXO9+vlpWcMwdObpp+kf//q3vvr6G61Zu1YPPfqYeu69V+IdQObUsUMHPfbQ
gxoyaKCaNGmiJk2aaMigQfrbQ39Vq5YtM3KN3n/nLb3/zlt68emn1L5du0QQMn6szwG9tXrNGknV
i/OWLlsmwzBUWloauM0Tjj1GTZo00bgJE/Xam285lnv1jTc1cfJkNWncWCcce2zKY02+YnWniopK
Pf/8aPXYq50++uirGsd2LP5U9Zp307Zvn5Oqku9BGjd+4kQNHnBwraXY+++3r5o1a6pxEycl8hYv
WarLrrpGF172W1VVVemOW2+pcY7b8fPOPUevvvGmnn3x77X6MOKqK9SmdWtdNeJ3Ovf8C/XSyy9r
5apV6t+3r44/9hjd/H+36+rfXa+mTZvWWHI98OCDVa9ekX590SV69PEna9V71W8v0949uuum/7td
519ymZYuW6r777lL9evXTzova9et06jycl1wyWU678KL9M2332rE1VcmPS/dzPOYbH6c5lWSfnvx
xeq59976vzvu1BnnDtd9Ix/UgoXVe8/m6tjjRlx9paZOm65fXXSJ/vHyv9Vt54bHcXb3hdO9MvSQ
wVq5apUOGTQoo2MAAAAAACBftSwt1Z577K4e3bqrkeXp4v59+2jHjh2JF1fFucUhJOmaK69QNBrV
ry++ROdffKnm/vij7ZPLcff+ZaROOuNMnXTGmdqydatu+8OdOumMM3XHn+5OlPnyq6+0afPmxErK
uEgkouuuvkr9+hxgrdZRvz4H6JLfXKjHn35Gv73qGtWL1tMtN97gWL5N69a65Ybr9ca//qk3/vVP
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
RHXt0kWbN2/WrC+/VO/99lfL0lLbdk89+SRVVFRoyrRpOv2Uk7XH7rurfft2qqoybPMrKys1cfJk
/e/DjxKBwzHjxquyslJHHelv5eTxxxyjRx5/QsMv+I2OKhumE487Vnv16FGr3PLly3X7nX/Sxo0b
NeeHH7Rq1Spd8psLE8ftgrNh2r59u5YtW65JU6Zo/oIF6tG9u6c9VsNUFInod9deo4t/e4VG3HCT
tm3bpssuvkgdO3TIaD8AAADyzV/vv1dXXHOtfpj7o64ccZ0ikYi+/2Gu2rdrp5H3/TlwvQRWAQAA
suTDjz9Rs6ZNdfCBB0qSpkybrsWLl+jQoYfo7j/cIUk66MD+uvb6GxPnzPxilmbM/EJnnHqKLr3o
N5Kkn+bN0/gJE7V+/QYdNnSoRj78iMZPnKjzzj1HU6dPV0VFhQ4/dKhju4MHDtCMmTM1Zdo0HTJk
cI29VO3yq6qq1KZ1a302eoxuGLFNDRs21Kefj1ZRUVEiWOvV2WeeoVatWunxp5/W2++O0tvvjtKQ
QYN0xaWXaLfddk2U27hpkz78+OdVDfXrR7V27VpVVlaqXr16vtqcN3++3n53VI28C351noqLi23L
33jrbTU+N23aRCNM+79mUs+999YJxx6rd997T106d9Y5Z52ZlX4AAAD4FV+h6rSCNZ3atmmjRx/8
ayK4KkntdtlFD498QO3btQtcL4FVAACALJj95VdasnSpjjvmaNWvX1+StGTJEklyfUnU3J9+klT9
0qfX3nyrxrElS5eqR/du6tO7t6bNmKGNGzdqwsRJKiqKaOghQxzb9auoqEgnHn+cnn3hRY2bMEEH
H3SQJk2ZooP690usiq1Xr54qKnbUOndHRUXiuFS90vTIYUfo0EOG6ONPP9M7//mPRo8dq1mzZ+ul
559Vq5YtJUmdO3XSP55/Vhs2bNCChYv07nvv6ZXX31BJSYnOP2+4r/4vXbZMr7z+Ro28s8443TGw
2qvnPurQvr2aNWumbl266JDBg1Va2sJXm2EaMnig3n3vPQ0ZNNB3UBkAAKBQ1Y/WV8OGDX/+XL++
GjZo6HJGcgRWAQAAsiD20UeSpLIjjkjkRaPVfzUrcnmsvbi4mSTpjFNP0aFDD6lxbLddO0qShh1+
mKZMm6ZJU6ZqwqTJ2n/f/RIBSrt2gzjx+OP0/N9f0v8+/EiRSETbtm2r8QKltm3aaPmKFaqqqlJR
UVEif9myZZKkXdq2rVFfgwYNdPSRZTr6yDI99Ojf9Mrrb2jCxEk67pijLeMv1j5776XOnTrpP+Xl
GjNunO/A6kH9+/va08v88iqr+LWqsHnxwAAAIABJREFUMqp89SEV6d72AAAAIB2ysVI1btXq1bry
2uv007x5iT1V582frytHXKdHHxyZ+LuyXwRWAQAAMqyqqkoff/qZSktbqF+fAxL5e+5R/Ze8mbNm
6eQTT7A9t/Oee0qqfjv9Afvvb1tm6CFDdP9fH9S/X3tNS5YuTTwu7tSuJBXtXPm4ceMmT/ltWrfW
4IEDNW7CRO3YUaHGjRvrkMGDE8e7dums0WPH6fU339KZp58mSVq+YoViH32soqIi7bnnHomx7tuz
ZyL4ahhGoq14ENnOrC9nq6rKUP1osFW3YWnWrLqPP/74U1b7AQAAYDboMPf/iT72k48y1JPccN2N
NyeCqo8+OFKSdMU1IzRv/nyNuOEmvfjMU4HqJbAKAACQYdNmzNCq1at1+ikn11jN2XOffbRvr576
b+xDRaNR7dqxY+JFU3GdO3XSkEED9enno3XzbberV8+eWrdunZYsXao//v52SVLzkhL179tXEyZV
bwNw6M5tAJzalaSO7dtLkp585ln9MHeuDMPQb87/tWO+JJ1y0gn6fMwYjZswQccefZQaNfr5Uarz
f3Wexo4frwcf/Zve++C/Kikp1tfffKvNmzfr5BNPUNs2bbRs2XJdduXVatGihTp32lP1o/U15/vv
tXrNGu2+227qe8DPWyLEX161afMmLV++QvPmz5dUvXJWku68+x5VVFRqzdo1kqTxEydq1erqn++8
/f+CX6wkotGo9urRQ998+61u+f0dqqqs0viJE9PWHgAAgBeGYWS7Cwl+nhRKl+/mzFG3rl018r4/
J1anPvrgSI244SbN+f77wPUSWAUAAMiwr7/5Vt26dtVRR5bVOnbf3XfpLw8+rLHjxkuRiAYNOFhb
tmypUeaO2/5PTz3zrMaMG69Jk6eoY8eO6tK5swzDSDwmPuzwwzRh0iTtt+++atWqVdJ2jywbpukz
Z2ripMl665131XOfvV3zJenAfv3UoX17LV6yREeVDatR317du+vJvz2qp555TnN//FELFy1Sxw4d
dPSRZTpr5wrWaLSezjr9NE2YNFnffPudqqoq1bZNGx1z1JH6xVlnqmnTJon64i+vql8/qpalLdV7
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
AACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAA
QCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBC
wioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRV
AAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAA
AAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAA
AAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAU
ElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSs
AgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUA
AAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAA
AFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACg
kLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFh
FQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioA
AAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAA
AIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAA
hYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJ
qwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYB
AAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAA
AAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAA
KCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBI
WAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAK
AAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAA
AACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAA
QCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBC
wioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRV
AAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAA
AAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAA
AAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAU
ElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSs
AgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUA
AAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAA
AFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACg
kLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFh
FQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioA
AAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAA
AIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAA
hYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJ
qwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYB
AAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAA
AAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAA
KCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAKAAAAAFBI
WAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAAAACgkLAK
AAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAAQCFhFQAA
AACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBCwioAAAAA
QCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRVAAAAAIBC
wioAAAAAQCFhFQAAAACgkLAKAAAAAFBIWAUAAAAAKCSsAgAAAAAUElYBAAAAAAoJqwAAAAAAhYRV
AAAAAIBCwioAAAAAQCFhFQAAAACgUP2iHgAAAAAAwOKkWq3m6bHP5pVXX02SDB68ZjZaf/3U1f3n
PFVhFQAAAACgmafHPpvnX3ih6fPnn38hlVqy8UYbNs1zKQAAAAAAgGZeeeWV+ea93GKesAoAAAAA
0EzDjBkdzhNWAQAAAAAKCasAAAAAAIWEVQAAAACAQsIqAAAAAEAhYRUAAAAAoJCwCgAAAABQSFgF
AAAAACgkrAIAAAAAFBJWAQAAAAAKCasAAAAAAIWEVQAAAACAQsIqAAAAAEAhYRUAAAAAoJCwCgAA
AABQSFgFAAAAACgkrAIAAAAAFBJWAQAAAAAKCasAAAAAAIWEVQAAAACAQsIqAAAAAEAhYRUAAAAA
oJCwCgAAAABQSFgFAAAAACgkrAIAAAAAFBJWAQAAAAAKCasAAAAAAIWEVQAAAACAQsIqAAAAAEAh
YRUAAAAAoJCwCgAAAABQSFgFAAAAACgkrAIAAAAAFBJWAQAAAAAKCasAAAAAAIWEVQAAAACAQsIq
AAAAAEAzvXv3nm9enz595vlcWAUAAAAAaGbw4DXnm7fWmoPm+bx+YQ0GAAAAAGBJsNH66ydJXn3l
1STJ4DXXzAZz5s0lrAIAAAAANFNXV5dNNtwwm2y4YdvrLMTxAAAAAAAsFYRVAAAAAIBClWOOOaa2
qAcBAAAAALAkqUyYMEFYBQAAAAAo0HTzqlqtlkqlkkqlsijHAyxCtVotkyZNyttvv5111llnnmVP
P/10RowYkalTpy6i0QGLg5VXXjl77rlnNmxxAXevI4D2XkcAACyNmsKq/wwBlUolffv2zYgRI+b7
D9GIESOy0kor5eMf/3hWXXXV1NW5RDMsq2bOnDnfPK8jgPZeRwAALI3qa7XGKwGIJEDSeCyYNm1a
5h4b5po6dWp23XXXDB48OHV1dQIKLMNqtdp8xwivI4Ck7dcRAADNvfjii4t6CF3W/BfI9e2sBzCP
fv36iaqAYwAAALDABgwYsKiHUGzChAnzfC6sAp3WHW/1Pe+889LQ0NDuOv/6179y1llnLdB+gCXT
0KFD884777S7zowZM3LppZcupBEBAAC0rr4zb9N54sl/5IUXnu+2t/RUKpW8d733ZZNNNu2W7QHd
ryfewnfFFVfk29/+dpvLJ0+enNGjR+eWW27p9n0D3asnjhEXXnhhTjzxxDaXO0bAksOlAACAjiyp
rxeaj7tTZ6w+//xzWXed93bb9dOq1WpeGPe8sArLmD59+uQHP7g248a1vvyb39wikydPXqhjAhYf
9fX1jhEAAMASo1NnrFar1QwaNKhbd/zc82O7dXtA9+qp3xyNG5eMGjWs1WXDho3qkX0C3c8xAmjP
knoGCgBAR4rPWK1Wq3n11Vdzwsknd3htxI707t07F5x7bqrV6gJtB1g67LTTzhk9euckwxfxSIDF
kWMEAACwuOp0WK3VamloaMga6wxKnz59Mn369KbltWqtcZ1qLdXZ1VRr1dSq1VSr1VRn/+fjWrWa
hukNqdVqwios80Zlp+v/ZioAAB+wSURBVJ2Gz/l4eDvrAcsmxwgAAFjWzZ49O/f89b789pZb8+JL
L+W0od/PFh94f4dfd9/9Y3LFVVfnZz/5cbs34b75d7flmuuuz7Zbb51TTjiueHydvhTA3PVmzpqV
Lx1yeKa9806uueHnqdVq/wmnsxuD6dyIWp3d7ONqNbXZ1SSVxrDq7UGwWOvZt/CNyp//vEuGD98p
o0eP6sH9AD3FMQJoj0sBAAAd6czrhbcmTcpdf/pTPnvAZ/Kj//pxUqt16uvuve9v2Xbrj7W7n0mT
JudXv70p799s0ySd227L7RWdsZoky9XX5/Krr8wJX/9WDjngoNz421+nlkqqqUs11dTVVVKdXZda
pZpq5T9BtVqpplapZubM2YvdGauvv/FGbrr1d3ngwYcy/s03s/JKK2XNNQdl660+mk/ts0+WW265
JMmhRxyVN8aPT9JYzOsqlVTm3NDrW1/7avbaY/eFMt7f3nxL/vunl6euri61ajUrr7Jytttmm3zz
q8fmXe96V5Jk6tSpufyqq/PoY49nwsSJGbTGGvnUvvtkr913WyhjhJbGjBmTJNlii1sybNjw3HLL
B3PNNdckGde0ziOPNN6Upm/fvrnuuuvy5JNP5qyzzmpzm+dccFE+8P7NsscnPzHfsvMuujibbLzR
Av/Mt7ePEtVqNfsfcliuveLyrLzySk3zGxoacvDnj8z1V12ZFVZYIa+9/nquue76PPnU03Oub71G
9tt7r2y3zTZJki9//ZuZMHFi02/c3vfe9fK1L38paw0enCR5++23c9uIO3LHnSOz1uA1c/bppy3Q
uG+/4/e5+ufXpa6uLtVqNSuvtFK22vIjOfqoI5uOja059pvH5c0JE5I0Hi8rlUrTDRCPPurI3PK7
29pdPm7cuLzzr3/nuK9/tWmbzz3/QoadcWb+66IL0nfVVRfocbH4uffee5N0/hhxySWXZOzYsbn0
0kvb3ObQ007Phz64RT61zz7zLRt+xpn5wGab5TOf2m+Bxt3ePkpUq9V8fPc9c+uvb8wqq6zSNH/6
9OnZfd9P5fabfpMVV1wxL7/ySi67/Io8/vd/ZHa1mrUGD85nD9g/u+y0Y5Lk4M8dkfFvvplKpZJK
pZINN1g/Jx9/fNZ5z9pJGl8E/vTKn+Xue/+a5ZdfPocdfFB23nHHLo+7M69JWtPRa6pf/urX7S5/
9rnnMu2df+XUb5/ctM1nxo7N8ad8J9f97Ir069evy48JAIDFx4DVVstpQ7+fJLn4vy/r1NfMnDkz
Dz78cIZ+55R217v2+huy/TbbZIUVls/4N9/s0vi6dMbqV77wpUx4663c8Kv/me+t/vOepVqbb3ml
0muRhNUrr7k2662zTj6+y87zzL/nr/fl7PMvyB6f/ES+c9IJWXeddVKrJS/986X8+qabc9hRX8y5
Z56edd7zntxwzVVNX/flr38jhx9ycFPs6ImxtWfH7bfL8FO/lyQZP358Tv3B6bnp1t/lswfsnwkT
JuZrxx2fXXbeKWefcVpW698/Y599LlOnTV3gsbLs6M4zTcaMGZM777wzL7xwTYYPT3bZJdl55745
8sgj51u3b9++ufrqq3PLLbdk9OjRbW6zoaEhjz72WI4+8vPdNs6O9nHD/9yY96y9dnbYbtumdVqb
tyDOPv+CfGiLLfL1Y7+S+l698szYZ1Opm/dtC2cMG5qNN9owkydPzk2/uy1XXn1thp/63STJhIkT
07t37xz62QMz+u57umVMW2+1VU467puN258wIWdfcFH+9/d/yH5779Xm1/z44ouaPj7pu6fmgE9/
Kltt+ZGmeZ/4+K7tLn976tR87bgT8tzzL+R9710vSfLzG36R/T+1n6i6mOjOY8S9996bm266qVuP
EdOnT88DDz2cbxx7bLeNs6N9tPbveVf+jW/PqcNPy1Yf3TLfPunE1PfqlSeeeip1lbp51rn4/PPy
/s02zVuTJuWXN/4ql/z4x7ng7B8mSX527c/zxvjxufKy/86EiRPzrRNPzuoDV88mG2/U5TG195qk
LR29pmr+y+rWlk+Z8nYO/8IX88zYsdlwgw2SJD+58mc57ODPiqqLCWesAgAd6crrhVonzix9+JFH
07t372y04YZtrvvU00/nwYcfzn9ffFFuvvV3ReNZ4DNWb/ztjZk6dVrq63qlmkpqlcazVauVaupa
nKVarVRSq9Y1BtZKNbOrtabLByxMr732Wvq1+M/4U888kzPOPidnn3FaPrj55vMs22D99fPdk0/K
//zq1zntrB/msksubvfMi+4eW4mBAwdmtyH/L//36KNJksuvuio777hDvvSFo5rWaTytGRaNn/70
pxk+fHR23jkZPjwZNixJRiXZKcOHj5pv/VGjRuXFF19sd5sP/d8jWXfdddK/f/9uH29b+3hj/Pis
2uLvamvzumraO+/kny+/knPOOD19+vRJkmzezrVj+vbtm1123DHn/+hHTfPeu956ee966+W++8d0
y5haGjBgQHbZaYf8/R9P9Mj251pl5ZVz0P6fzrXX35DThp6ahx95JBMmTnDW/VLqggsu6PZjxN/G
PJD13/feDBiwWrePt619tPbv+YL+G9/c1GnT8uJLL+WyS36U5ZdfPknykQ99qM31+/frl08OGZLh
Z5yZpPE397+77fZc9dOfZPnll8/aa62VT++7T26/444FCqvNtXxN0lNWXXWVHHHYobns8itz0Xnn
5P4HHsz48W9m/wU8AxkAgCXfffffn20+tlWb11atVqu5/Kqr89kDD8gqK6+8QPuq63iVpNrs+gUz
Z83KW5MnZ8bMGXOmmZkxo/HjmTNmNH7cMOfPps8bMmNGQ2bMmJEk7Z6x+s477+QLXz42v7n5lnz2
8M/nJ1dcmSR57fXX853vD8v+hxyWQ484Ktf94pfzFOL2lp/+w7Nz73335errrs+Bhx6eRx57LEly
2eVXZr+998oHN988E996K0NPOyMHHf75HPWlr+SwI7+Qv40ZkwM+8+nMnDmr02d+vfzyKznupFOy
/yGH5ctf/0aeeuaZpmVX//y67H/wodn/kMPyla9/M5OnTGlzbKXmPqcNDTPyxz/9OZ898IBW15s8
ZUoOOPSwHo8iMNcll1zSFEySxmgyfHgybty6mTLlQ7n44ouzyy67NE3HHXdcRo8enXHjxuWYY45p
c7v33X9/tv3Yx5o+/+fLL+e7Q4fniGO+nHMuuCgvv/JK07JXX3stQ087I1/8yldz0ndPzbPPPZ8k
OfOc83LTnN9MJcmLL72Uz33xmMyePXu+fVx4yaUZ8+BD+Z9f/yZHH/u1/P2JJ1qdd+Y55+b2EXc0
bbNarebIL305EyZO7PC5WnGFFdKvb9/8fuRdnfpN2cS33sodd97ZbljpCbVa4+Ma9+KLOeLoL82z
7Ohjv5Znnn22W/az25AhmTxlSh546KFc94tf5ojDD0t9fad+H8gS5Nxzz+3yMeL4449vc7uj774n
O+2wQ9Pn4158MV877oR86sDPZuhpp+fFl/7ZtKytf7u/8/1h+cWNv2pa7/kXXsg++x+YWbNmzbeP
1v49b23et78/NL+5+ZambVar1XzqoIM79dajlVZcMav1759bb//fTh0j3pwwIbfcdlu2/thWSZJn
nn02q6yyyjyxefMPfCCPPvZ4h9sqMfc1yXPPP5/9DjxonmUHHnp4nnzq6W7Zz75775VJkyflr/f9
LZf/7Gc59pijHSMAAJZxs2bNypgHH2q6vmpr/nDXH1OtVrP7J4Ys8P46fSmAuSF0ufr6xjNOK43X
VT37jDMbLxyb5IRTTppzlmqzywLMubbq3LNYay2215rnX3ghU6ZMydWX/yS9e/dOtVrNd74/LLvu
vFPO/MGwTHzrrZxwynfSd9VVs/eee3S4/Pvf+XZO/+HZ2XTjjZuupTZ+/Pg89vjj+d4pJ6VWq+V7
w4bn/Ztt1vR22i9/vfFtr7169coWm38gzz73fIY0e+tqW8/Td4YOy0EH7J+9dt8tfxo1Oj8446zc
cM1Vefa553Lr7bfn8v+6NAMHDsyrr72Wvquu2urYStRqtbwxfnz+cNdd2X7bbfPSP/+Zfv36tflW
2ZVWXDF7fPKTGTRojeJ9sWzpjrfwjRkzJv36XZJRo5JRo5Kdd/7PVKmsmxdffCSPPPLIPF8z9/Nj
jjkmW221VavbnTlzZh5+5JF8/tBDkjT+3Tvr3POy2yeGZM/ddstrr7+RSy/7SdOyM885L/vtvVeG
fHzX3PPX+3L+jy7Ojy++KNtvu3X+9/d35tP7Nl4b8b77x2Sbj22VXr16zbeP47/x9Vx4yaXZcIMN
ms6afP+mm843b8KEibnzj39sehvrP558MqsPHJgBq3V81lylUskpJxyfSy+7LH8e/Zd8et+9s+P2
28/3W7ahp5+RSqWSmTNnZrnllss3jv1Kh9vuDrVaLW9OmJA/j/5Ltt7qoz2+v169euWozx2ecy/6
UTbcYP189CMf6fiLWGi64xhx7733pk+fc7p0jDj++OOz3XbbtbrdGTNmZMwDD+QrR38hSeNx4LtD
h2ffvffKZ/bbN6+8+mrOPu+CpmVt/du9y8475uZbfpdDDjowyZyQuv12qa+vn28frf17/sHNN2/l
9cebuW3EiKYzKx997PGsOWiNDHz3uzt8viqVSk4b+v2cff4F+cPIu3LwQQdkyK67zneMOP7kU5I5
x4h3vetd+c5JJyRJJk6cmH79+s6zbv/+/fLWpEkd7rszWr4m6Wm9evXKV7/0pQw748xsuvHG2Xab
rXt8n3SeSwEAAB3p0qUAOrh51aOPPZ76+vpsstFGra43deq0/OLGX+Xk47+VSqUyZ3uZMy2ESwHM
nDVrnuumfuuUExrf9t90HdV5r6vadFmAOddYXa53n05dY/XQzx7U9FbYfzzxRKa9804OP+TgVCqV
vHvAgBxy0IEZ8Yc/ZO8998iTTz3V7vLWvPTPl7PCCitk4LvfnaefGZtxL76Yi88/v+nmKcst95+n
Zu21BufRx//e4fP0xJNPZcrbbzcV7+233SZnn3d+Xnv99fTp0yczZ8zMK6+9loEDB2bNQYM6fuLb
8Zd77s3/26Px+oYrrLBCttpyyxy0/2cy7sWX5rseY3P19fU58nOHN31+xtnn5tnnns0Zw4ZlrbUG
59wLL8pB++/fdJMLKHHeeeeloaGhxdwj8sgjj2TVVR/Jzjsn6623bu66664F2s/DjzyatQevlQED
BiRJnn5mbBoaZmSfPfdMpVLJ2msNzrvnLHtm7LOZOm1adt15pyTJxz66ZS758WV5Y/yb+eiWW+ay
K36WCRMmZMCAAbnv/jH54pzrqbbcR2dtteVHctkVV+atSZPSv1+/3Pe3+7NdwX/2N9xg/fzovHMz
8o9/yi9/9Zvcfsfv841jv5K111qraZ3Tvn9qNt5owzQ0NOTJp57OhZf+V1ZeeaVs/v62LxvQmkcf
fzxnnXt+0+dDdt0lXzzyiPnW+9uYMTng0MbjxvLLL58PbbFF9tlzj7z2+utF++uKD26xefr365c9
d3MJgKXB0KFD884777SYO/8x4qGHHlqg/Yx58KGss857MnDgwCTJP554MtMbGnLgZz6dSqWSdd7z
nqy+euOy9v7t3n6bbXLhxZdk/PjxGThwYP5yz71Nv8houY/O2m6brXPBxZdk4sSJWW211TL67ruL
bh616SYb5+rLf5LbR9yRq6+9Lr+9+dama8TPdeG55+T9m22ahoaGPPb433P62edklZUbb4jVMsK2
9+LxwYcfzveG/aDp8z132y3f+Or8v8hp6zVJ83cO9JSPbvmRrLZa/3x6v317fF8AACz+/nr//dl6
q4829b2W/vyXv2TatGk5/YfnNM2bPXt2arVaDjvqi7n+qiuL9lccVue5rmqlxRmpTWepzrmu6pzP
my9P2r8UQGvenDAhaw5aY57/DAxec81MmDCxU8tbM3XatPSfc3OD115/PQNWG5DevVu/hurMGTOb
1u1onNP//e8c/Lkjmub17ds3//rXv7PB+u/Licd9K+dfdHH69OmdIw4/LDu0caZNZzS/UURz67xn
7bw18a1Mm/ZOVlppxXa38cb48Xlj/Bs5+fjjc9oPz873Tjkpf//HEznhm2t2eVwsu6644op8+9vf
nm/+qFGj8vnPX5NRo5Jrrz0i6647boH3dd/992ebrf9zNutbk95Kv379Wr1+ysS3Jmb69OlNZ6En
yaqrrJLp0/+dQWusng9tsUX+9sCD+dAWW2Tq1KnZbJNNWt1HZ62wwgr54Oab5/4HHshuQ4bkbw88
mHPPPD11dXXp07t3ZsycMc/6DQ0N6dWrV9MvkpLGs7B2+8SQDPn4rrn+lzfmwksuzUXnntNyV+nd
u3c+uMXm2f0TQ/Lgw/9XHFa3+MAHcuN113a4XvObVy0K9fX1Wc7be5d4F154YU488cT55vfEMWL0
3XfPcxmACRMnZsBq/Vs9RrT3b/fgNdfMVltumbvv/Wu2+uiWmfL229li8w+0uo/OWnHFFbPlRz6c
u+/9a/bde6/cfe9fc9mlFzceI/r0ScOMeY8R0+ccI+ZeUzVpPEbsu/de2WuP3XPFVVfn9B+enZ/9
ZP47pPbu3Tsf3fIj2W/vvXLf/fdn5512zKRJk+dZZ/LkKVlttdavVb3lhz+cP9x2a4ePqa3XJAvL
cvXLOUYAAJDZs2dnzIMP5cRvfqPNdfbZc4/s0+IkzGuv/0XGv/lml/7f2+lLAcxdb8bMGalWay3O
Uq22eZZqtVqbZ3nvFRovJVAtON13tf6r5fXX30itVmv6T9Frb7ye1eecJdLR8tYMWmP1vDF+fGq1
Wvr17ZvJU6Zk9uzZ6dWrV7PHXZuzrTey1podx8bV+vfPoEGDcu2Vl7e6fJeddszOO+6Qhx95JGf8
sPHskbn/Qesuffr0yQ7bb5df/fa3Oerzn2t33Wefey5bfvjD2XSTjfPVLx2Tk797av7frrvM8xyw
7Co9Jb9Pnz75wQ+uzbhxzeeOy7Bh12T48HXzrW9dlErl0Yybd4Vis2bNyoMP/18OPvDApnl9+/bN
pEmT5jkGzNWvb7+sPnBgLr3w/JabStJ4dtodf7gzDQ0N2XabrVNXV9fqPkpst83WuetPf8571l47
qw98d9NlAAYNWiPPjB2bbZpdG/bpsWOz+sCBrf42rVevXtljt0/k9jvumO/41FxdXV3+/e9/d2ms
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
YII=

--_005_SG2PR04MB302999E339EF294C04B14DB6FD5A0SG2PR04MB3029apcp_
Content-Type: image/png; name="GPIO_config.PNG"
Content-Description: GPIO_config.PNG
Content-Disposition: attachment; filename="GPIO_config.PNG"; size=3220;
	creation-date="Wed, 11 Dec 2019 12:46:24 GMT";
	modification-date="Wed, 11 Dec 2019 12:46:24 GMT"
Content-Transfer-Encoding: base64

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
VkRkGj9//g9TucNsfqfxLAAAAABJRU5ErkJggg==

--_005_SG2PR04MB302999E339EF294C04B14DB6FD5A0SG2PR04MB3029apcp_--
