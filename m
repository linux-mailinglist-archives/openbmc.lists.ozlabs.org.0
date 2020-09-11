Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B00DA265EB1
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 13:19:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BntZj05LDzDqjg
	for <lists+openbmc@lfdr.de>; Fri, 11 Sep 2020 21:19:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.99; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=hHcqtXwr; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=hHcqtXwr; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320099.outbound.protection.outlook.com [40.107.132.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BntYh3XjXzDqld
 for <openbmc@lists.ozlabs.org>; Fri, 11 Sep 2020 21:19:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwEKRVtBDC01jrtXJ29cYTMd2k75AXEqR+Cw2tPgucI=;
 b=hHcqtXwrXB7DJkxvKM2Jto9WDpgiDIIh1gpFTTvAh87bVxKftExPvxS4dBEgEQH7qSPWmbs5rB/Gv487dM16FMb9arAdd/bRSfdAbG8Jj2nnOHzxoThMijNShwhESlxpOBaCQLDbzI8ybuxDEuhsALiERnui0qQv5RketS4ivJU=
Received: from PS2PR02CA0057.apcprd02.prod.outlook.com (2603:1096:300:5a::21)
 by HK2PR0401MB2129.apcprd04.prod.outlook.com (2603:1096:202:4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 11:18:52 +0000
Received: from PU1APC01FT062.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:5a:cafe::dd) by PS2PR02CA0057.outlook.office365.com
 (2603:1096:300:5a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Fri, 11 Sep 2020 11:18:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.195.57) by
 PU1APC01FT062.mail.protection.outlook.com (10.152.253.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Fri, 11 Sep 2020 11:18:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLdH1k2FRVT9ZBhCy2DhCj2bpRQYpqhaZZDDmmu2Q5vi05G/L/ZmybgfyR50kujTyvwfKggndvslgkKJ4m6axaVzFUJBnQiAXLhbXuAbc/auNSVzSrT/Zsye5bE2c3kRNzeiX5IMRV/E47n8FOgOUZfSJkWkmYGD+wz3oXxBT+CDYnvP6jSPRZAce4fpyq5ZiaqtHR+kEyYnW2DmxZB8SiqNY3NSnY/SqjcqmgNghEt42Dw7EYYClbr6BqC6G1Kcq7am48oQh/3MEnVWHwVKqqF1dr1SV0hMmloopLxhj1D5Jbg6Dc5ZT5GVMAJaubD1lqLW6ReTOtQp8GOWQBd/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwEKRVtBDC01jrtXJ29cYTMd2k75AXEqR+Cw2tPgucI=;
 b=jlKnYY2HLMPmX5MMAN8aWUBSXvam5ug3BT9jJVaS1Tt5DUHlkQdkdJ1T8RZEmERXZz46S+zj+9OqxDL1YovhYiSgCFsgQh7cJBohJlf4+lhIBHcN320tr+gvhGrBpLX8Xdfk9x4P45n2lk7Y4koxKBnpoFJ09It4QYphZFojeKdD4RYRuKo7ekDVS0aJZnx0xPWI/UhzF2CNchLkgiPlg32O5Vzx3JBz/CJPT1scOvVaiwn0BeBmPh+gPtwB+z0qZBVvg6zlX2WfTYE2/5o0OtCIpqo5Rmd8U39FtirarsIkOkkMX8ryuuDBRiGf3PtbqZL+WnfNIgPs2BC9Hl4GGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwEKRVtBDC01jrtXJ29cYTMd2k75AXEqR+Cw2tPgucI=;
 b=hHcqtXwrXB7DJkxvKM2Jto9WDpgiDIIh1gpFTTvAh87bVxKftExPvxS4dBEgEQH7qSPWmbs5rB/Gv487dM16FMb9arAdd/bRSfdAbG8Jj2nnOHzxoThMijNShwhESlxpOBaCQLDbzI8ybuxDEuhsALiERnui0qQv5RketS4ivJU=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3221.apcprd04.prod.outlook.com (2603:1096:4:6a::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.15; Fri, 11 Sep 2020 11:18:46 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7%4]) with mapi id 15.20.3370.017; Fri, 11 Sep 2020
 11:18:46 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Connection issue in OpenBMC image
Thread-Topic: Connection issue in OpenBMC image
Thread-Index: AdaIK6vt31RmicRFTiOQBEztxwnvYA==
Date: Fri, 11 Sep 2020 11:18:46 +0000
Message-ID: <SG2PR04MB30932185827E6DCADD02F422E1240@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiN2NjOTFhYWEtYThmYy00ZjVhLTk3NDEtNDE0YTQxYTAwYzM3IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiOFcrczVNMSsrZ21WV0ZXRzRxaGdlSTVRZ1JXamxieXhZRFdYRDQxYUJpRWp4MVpnS0x0V1pMd2RFNGNkSllScCJ9
x-hclclassification: HCL_Cla5s_1nt3rnal
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:38a:3b6c:5929:7ed3:5d3f:4938]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b698218c-256b-4ca8-8ebc-08d856447677
x-ms-traffictypediagnostic: SG2PR04MB3221:|HK2PR0401MB2129:
X-Microsoft-Antispam-PRVS: <HK2PR0401MB2129390468A4BEC4D10E1C6FE1240@HK2PR0401MB2129.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: xMXB/x4GlsznE5OtafQb+qXHPAXkHAybuEx12h2WkMmieG8JFPC3QNjrgoMiSgyZt+fzktkyWOzjaRriqb0xXvMi/FhOTR/H+2jibHJ7/4JsPamy0B0Kz1uAxRXdeoQbz2dcMfWwmlAaBvapQY8ypdbiPTLZnIbA19BCMXzHbd5qw3MJF54/CsrdUaonX0rMSiLugfcGgH1pe049tEf9xxTawYPPLmGYxn3JrtcEW2yC9EKLjFdLaDCjeiulBVWWBIWLwcGv8Anqn5Le1kmZUv9EJ7c1uWwg5oPV5eF5IyUGYhfL1FD0jrO7p5qJZMSBoDo18Uc3/ATUfnIKHRe6Hv1TVC9Wczj3nfobWQYv36Vau1fVh5TO3Hq4uZhWmY4m
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(83380400001)(86362001)(7696005)(66446008)(6506007)(76116006)(66946007)(66476007)(9686003)(478600001)(66556008)(2906002)(55016002)(64756008)(6916009)(316002)(71200400001)(33656002)(5660300002)(186003)(8676002)(66574015)(52536014)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: FCoTqZu6x93+rPgkJCw2bokaDW/s9SajytPHeCe88xf1OIwFlQhennwAvwH/+2oLzvXvYv/MhTCVNPlpZOrz4COIIIvAe4ZrBTq+2sUunlZ4O2P5vNPgtNLIXZGYYCvkUwbxc70RNpR0BQi++jaSJf5ov/OGuGVtARFf3HFYnLys8v00q5P31rY6q/DMj5rTiX62trFhi8Nojy8/fSfVG4a4f862p5ySmFSS/Ns0C1wf+rVLAR56RLSMp4vUCO7raHT5eCzkL9RlCoCDY0IN5sLo6j6FjpFiC1QWo2uVSZvvBaqmej4SnM3/fbW0X6oRdGkot9FXR9st4zRd02tT7rHJe+9aex1STaL3tZYRpzOodGBOIgEIGCJVljW9RUQRcrigPGm4HomjUjinBExQ4dOD4xQqzK7w455aQr/uQQ6VF8vVMTI3THab7wSjYCkVxKADoeQRlkKHCS/3cxqTSfSs1Y3jEtyiMRqW8Q2E3K9yPU2qTlClEYCHN1YIW/7B0D/KDF3SyjsUEVZfMfe+p2x1Vk30QR3tBz4hKvj3v8IadwfCvAcHLCqa2IumyGa6jpQloU8cPdo5WpCadnudrD9rKCr9KeLO0EGsOXZhKgYqUWVFAB0prX4p1fbterboMvT3PomHUGln6qq6uWbFyuTbh1fTg8inZmepuNR2XSmLsajJZyyPaLm3KZ4FFChca7FpVp3vFYLaH4xIKwY8rQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB30932185827E6DCADD02F422E1240SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3221
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT062.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 79d62fe9-626e-4de1-aaf0-08d856447372
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R8egi1pdg7+SwyLNnNgUuEx96IpqAka/1F2w1+P77KZLtjjAbAZVjkFAjsEzYYLWSEkZF4afD+89cQ/7b/sjmpaB/xUkg0Z6Yyfzzlq8yWZO4M5BLdc+Wqa5n/W65Mt+TOxOcNwRDQS0nBEJ3O69dQFEby4IDRY2lH2X3nbDN7Z5/zTEBUIN/KnxKb7i/lVwi0Dct9Q814TeSPXWvIiPXzn14M3b4wSV/4OakurXNsYWjUo/g6HIfjrvtbX6WUcLd1LIKRn6ZE5tU8VGc1iE0KPKawwKefhaHLLe4FkgPPreRktI9wKucLCVVdzxQ8n8ZI8z89ZYOSjEy5eWTUAUgJmA2QxeVsTjDypjUKIJRpnFRsIV5RWB4gGctRldp+5ih9fJ9mzDBTpEYJHX4nTTNA==
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966005)(5660300002)(7696005)(47076004)(356005)(82310400003)(81166007)(2906002)(70206006)(86362001)(66574015)(83380400001)(70586007)(52536014)(6916009)(6506007)(336012)(33656002)(26005)(82740400003)(186003)(8936002)(8676002)(478600001)(55016002)(9686003)(36906005)(316002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 11:18:51.0910 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b698218c-256b-4ca8-8ebc-08d856447677
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT062.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0401MB2129
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

--_000_SG2PR04MB30932185827E6DCADD02F422E1240SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: HCL Internal
Hi Team,

In openbmc build, after flashing the latest image (September first week) we=
 are not able to connect tiogapass and yosemitev2 through SSH.

We tried flashing old image (August last week) in tiogapass & yosemitev2 an=
d we are able to connect both.

After flashing latest image, in uart-console, we get the below logs as "CLO=
SE_WAIT" for netstat.

root@tiogapass:~# netstat
Active Internet connections (w/o servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp       22      0 ::ffff:10.0.128.108:ssh controller.fava.net:60516 CLOSE=
_WAIT
tcp       22      0 ::ffff:10.0.128.108:ssh controller.fava.net:34652 CLOSE=
_WAIT
tcp       22      0 ::ffff:10.0.128.108:ssh controller.fava.net:58700 CLOSE=
_WAIT


Could anyone please provide comments on this?


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

--_000_SG2PR04MB30932185827E6DCADD02F422E1240SG2PR04MB3093apcp_
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
<p class=3D"MsoNormal">In openbmc build, after flashing the latest image (S=
eptember first week) we are not able to connect tiogapass and yosemitev2 th=
rough SSH.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We tried flashing old image (August last week) in ti=
ogapass &amp; yosemitev2 and we are able to connect both.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">After flashing latest image, in uart-console, we get=
 the below logs as &#8220;CLOSE_WAIT&#8221; for netstat.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">root@tiogapass:~# netstat<o:p></o:p></p>
<p class=3D"MsoNormal">Active Internet connections (w/o servers)<o:p></o:p>=
</p>
<p class=3D"MsoNormal">Proto Recv-Q Send-Q Local Address&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Foreign Address&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal">tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 22&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; 0 ::ffff:10.0.128.108:ssh controller.fava.net:60516 CL=
OSE_WAIT&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal">tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 22&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; 0 ::ffff:10.0.128.108:ssh controller.fava.net:34652 CL=
OSE_WAIT&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal">tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 22&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; 0 ::ffff:10.0.128.108:ssh controller.fava.net:58700 CL=
OSE_WAIT<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Could anyone please provide comments on this?<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
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

--_000_SG2PR04MB30932185827E6DCADD02F422E1240SG2PR04MB3093apcp_--
