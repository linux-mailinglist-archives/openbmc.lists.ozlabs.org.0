Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EF7268879
	for <lists+openbmc@lfdr.de>; Mon, 14 Sep 2020 11:33:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bqh4v3DGnzDqW0
	for <lists+openbmc@lfdr.de>; Mon, 14 Sep 2020 19:33:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.129.90; helo=kor01-sl2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=knzSd0rE; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=knzSd0rE; 
 dkim-atps=neutral
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-eopbgr1290090.outbound.protection.outlook.com [40.107.129.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bqh3l2FMHzDqVk
 for <openbmc@lists.ozlabs.org>; Mon, 14 Sep 2020 19:32:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHRXW8xzicelox4El9M/bAvRF8j4AjCBN17ugwMStk0=;
 b=knzSd0rE/2lsVE0fqCQN0vYIlB8Imuh/kSKpPaf2xlh8HJ0TSLffIvnlJeD/fe7pyPGFpcI16XDdErwgz2ys89YGlntSBBEDJAH5It4g16x+jvqglvdI6O6g2Jz2YtmSjmJ7KfINr1Nrtan/+CJddjq09ZBK/uPghAw3YgKLzQ8=
Received: from PS2PR02CA0092.apcprd02.prod.outlook.com (2603:1096:300:5c::32)
 by SL2PR04MB3036.apcprd04.prod.outlook.com (2603:1096:100:3a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Mon, 14 Sep
 2020 09:32:41 +0000
Received: from PU1APC01FT045.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:5c:cafe::3) by PS2PR02CA0092.outlook.office365.com
 (2603:1096:300:5c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Mon, 14 Sep 2020 09:32:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.52)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.52 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.52; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.52) by
 PU1APC01FT045.mail.protection.outlook.com (10.152.253.32) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Mon, 14 Sep 2020 09:32:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbuWw3fknuDHTNZDv4KcQ6yVu2ELRnt5rK6Nu8e6xV5HG5fnsZjllF+1ob5Oih58fLYwJ1V3EX72qL6+kaE8Rx084GsD8UTaqsR5EFvW/M8WfLouxip3r3GBCZF5T7jgnXrzrWSPIJihOG7mdRNBPVBShDAet8JaFwhfaLNHQ9sSw3ogIWWkBNPQ76lA4NyMDN+yioak9z/HOp70GHFX2uqfiWVFxE6csoEZ1icSVoZ4IVmNwe9LCzWf3hXpIz0l/gfhoBW7sPX3CNcRPM+iKQVjYfCsPDiQhuzL/ANheZcRui9qmGyZzILEJSjgTyGWm8uwjEuquZjpbc3Z3QZUjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHRXW8xzicelox4El9M/bAvRF8j4AjCBN17ugwMStk0=;
 b=PoJDKgp72oE0LOTbyPs3ZWnO+fb/F9tD0lz6aF6NFVM1UkdE12k5JT4kFNjz11sOW9YAhSDK44xtx4KwHXOSYl669qpzGHuTwpkp92Qa26mWVRNj/qDm2/y3bFb9RiykDYLAstVjaE+S6yG9HzvQ/WUnWySEsqXW23uqhXifuPDMxQnVbrYLktyZOavlf0Wop9yK+szs4ubdUYJuwOZMtb0Hr4UptYTwxqPWJabQFPKZHrAh9712GTEDaCWMTZbA51p+E4mx0UR0gpvR3dGzczVk2SqwVyc8Sw463rBlR0nETYTq2M4drk2cuFS67di4ISvkLGalw8Zy3aqfa81/Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHRXW8xzicelox4El9M/bAvRF8j4AjCBN17ugwMStk0=;
 b=knzSd0rE/2lsVE0fqCQN0vYIlB8Imuh/kSKpPaf2xlh8HJ0TSLffIvnlJeD/fe7pyPGFpcI16XDdErwgz2ys89YGlntSBBEDJAH5It4g16x+jvqglvdI6O6g2Jz2YtmSjmJ7KfINr1Nrtan/+CJddjq09ZBK/uPghAw3YgKLzQ8=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3561.apcprd04.prod.outlook.com (2603:1096:4:a0::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.17; Mon, 14 Sep 2020 09:32:34 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::b93f:17bd:c016:eec7%4]) with mapi id 15.20.3370.019; Mon, 14 Sep 2020
 09:32:34 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Connection issue in OpenBMC image
Thread-Topic: Connection issue in OpenBMC image
Thread-Index: AdaIK6vt31RmicRFTiOQBEztxwnvYACTHsXg
Date: Mon, 14 Sep 2020 09:32:34 +0000
Message-ID: <SG2PR04MB3093E7C8F543D9AD318B4653E1230@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB30932185827E6DCADD02F422E1240@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB30932185827E6DCADD02F422E1240@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiN2NjOTFhYWEtYThmYy00ZjVhLTk3NDEtNDE0YTQxYTAwYzM3IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiOFcrczVNMSsrZ21WV0ZXRzRxaGdlSTVRZ1JXamxieXhZRFdYRDQxYUJpRWp4MVpnS0x0V1pMd2RFNGNkSllScCJ9
x-hclclassification: HCL_Cla5s_1nt3rnal
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:38a:3b6c:61e3:50b4:4d2c:d17c]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 98b0695b-188f-4000-ec55-08d858911ff5
x-ms-traffictypediagnostic: SG2PR04MB3561:|SL2PR04MB3036:
X-Microsoft-Antispam-PRVS: <SL2PR04MB30366865545025880081F044E1230@SL2PR04MB3036.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: euYdbA/8WK80I0YwLad03B6Q47r4LHbZKqpEMYoSbd9/kIinTpwMuml6orOmLd7UdyAx5XGRSOM7OncaQmerNp20t2H2pPOMMU1FRU00bCOMPs8CGnExuFP6q+ioV+qAn+cX4D7gcaS5dzpJGWJbE7x6FVyql50xQwXsEq6NwxAULywiQpHDlEt+0Xqw90Kg/TqfsAuesXhEkfWydT+Ectb5O9CaGE0a6f+Yc2AkGEC1ZjfDDn8BypzmXLUR6g3WR51F0e4IuEnx+Q1iYlMUfhw/4fIMDlMlGTgI5KOfBLXeMYm94L1Z7cV1U4FbX4C2E1WnOYtVyBmyKh6JuUbQGg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(66446008)(83380400001)(508600001)(5660300002)(6916009)(316002)(52536014)(76116006)(86362001)(55016002)(66946007)(64756008)(66476007)(66556008)(9686003)(8936002)(7696005)(8676002)(6506007)(53546011)(2906002)(71200400001)(186003)(66574015)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: QE1lc9TSGQOzf1LY5AP6oYwiAu3T9j1f9v6vjJw3rAip4OkKyALPLxzfhjfXOQXLFsvSC9jsI/lI5HEu+CBRnhCHaDUPcJ6GCP+S6fQcYwA80kpCLMiDxLeyBNiUZwEMkP3zp7vzQefWbJlLTziItR/xNUBFIdNOg0Gl9giIJvgNvdj35bsfMWwXw8SCAQ9d9MVwhvZ6gWl44HggxFEs5Zz5//Tk8izqNC21gthoA53ZdaFmhCJo/AvGfdbnW5wYw5zuU8gZMkfxx5ZwBHlqR+00n0N0rkf4Eszm5FylAx8/y9NIhu9iG263Hs3LqG4AmNJexl6RiYCDSZBGeexTRgksKKVO3YingQs9ZIlMU2E3cdFJh/QgRWzxevb2nhqizcWNu7o5xNStOUS/mfEfw86Ey24CA2IoQb/vcFMRjBrNlI2sYDKgJKTW+wCChevFxn6GA/wb5F3EipSD3cP3wCeiyFhct9QBEDkpWFNlIvjZBooPZiyA8XSnbOYb5BwobeRgi75o74oGvHg4ezoa/F917882KrEAl5rH9Q+NGY4dLlSdO/dKQU8Ty/a7GFe56I75qy2CvSHbEW7QzHC2S5APnB4r8TKqllu6sXC6I7RaJgqRl2O+8h8iPRmw74ZXtQWylSIgEHo1MKqGcYD4jynNaeN9ZkfRvRQP2hAJJl9AIF2Odu2QKqA4UTS4CeWbn7ZS6raRULYQObUjqHA5PQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB3093E7C8F543D9AD318B4653E1230SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3561
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT045.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: d5de546c-667b-425c-bbf5-08d858911c85
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k8LYLYWfCwPRd1RrbuNRhnpTdKn0wB+o3/om0LRrtjH1lPk8IqeR+hTerfEi2IFAtUN8YtFtjJx8FDGD9DLXEbUXw7DQvQjRzhdq/RG42YgR9PnV3KniFIFGgM0fBB0rOEk2Za2fgYP0SOi7FFKcT5KtJAfkbCabKnLRyxRwCPVr8sJxkXWcuM2zyCCDhjRqZ2rsqn2B6S4uzzd6YzL06M/lG1qsRtyeTKaNPg2C+q0htXRz8T8/RdhxR/sejz/xUzMOjuXpgVBAMWVNDE3bPHfyVhWwkEiJsSgBUmxQPFXrkxeJQwMrikbrtiblapNDi1Dz3g24KbBLl2H0Cs+U7TFM09vQXg/pc3xTIr6Jb2eAIkMsKREQa6L1i9hWIcdrvllv4yJKa9LaEZL6SB01cg==
X-Forefront-Antispam-Report: CIP:192.8.245.52; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966005)(5660300002)(336012)(7696005)(33656002)(6506007)(186003)(316002)(508600001)(36906005)(8936002)(9686003)(2906002)(26005)(53546011)(82310400003)(55016002)(86362001)(70206006)(70586007)(6916009)(52536014)(66574015)(81166007)(356005)(8676002)(83380400001)(82740400003)(47076004);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2020 09:32:39.5781 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b0695b-188f-4000-ec55-08d858911ff5
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.52];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT045.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR04MB3036
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

--_000_SG2PR04MB3093E7C8F543D9AD318B4653E1230SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: HCL Internal
Hi Team,

In the latest openbmc build, after flashing the image in the target, we are=
 not able to connect the tiogapass and yosemitev2 through SSH. Is this due =
to any latest changes in the commit ?

Regards,
Jayashree


From: Jayashree D
Sent: Friday, September 11, 2020 4:49 PM
To: openbmc@lists.ozlabs.org
Subject: Connection issue in OpenBMC image

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

--_000_SG2PR04MB3093E7C8F543D9AD318B4653E1230SG2PR04MB3093apcp_
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
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:#08298A">HCL Internal</span></b><span style=3D"font-size=
:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hi Team,<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">In the latest openbmc =
build, after flashing the image in the target, we are not able to connect t=
he tiogapass and yosemitev2 through SSH. Is this due to any latest changes =
in the commit ?<br>
<br>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Regards,<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Jayashree<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b>From:</b> Jay=
ashree D <br>
<b>Sent:</b> Friday, September 11, 2020 4:49 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> Connection issue in OpenBMC image<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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

--_000_SG2PR04MB3093E7C8F543D9AD318B4653E1230SG2PR04MB3093apcp_--
