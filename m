Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA2C250F51
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 04:35:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbClq6MMqzDqQB
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 12:35:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=hcl.com (client-ip=2a01:111:f400:feac::71d;
 helo=kor01-sl2-obe.outbound.protection.outlook.com;
 envelope-from=priyatharshanp@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=M8aeGTOR; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=M8aeGTOR; 
 dkim-atps=neutral
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-sl2kor01on071d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feac::71d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWs2Q0ZVZzDqkc
 for <openbmc@lists.ozlabs.org>; Thu, 20 Aug 2020 01:21:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJVdZnfY5/vu+9pruzsmc5H3CZNPQA+7C33raYCx+x8=;
 b=M8aeGTOR2+Y7KaW6ZW3A0F8S14n3gNvTJuYGbQuM+AgBtrPeGNpZqb6qtIQ8wpJqrKYaGOKuMAjINm9RJOrCvASzH3R6mk+KPerHJTudjFyzN4L1SKZovG8fsBgFIoNTYufUVD2Iyxwx/ygashDsbkvEeM4GyK7PztEHkW9wTp0=
Received: from PS1P15301CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:803:2::33)
 by PS2PR04MB3752.apcprd04.prod.outlook.com (2603:1096:300:6c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Wed, 19 Aug
 2020 15:21:29 +0000
Received: from PU1APC01FT022.eop-APC01.prod.protection.outlook.com
 (2603:1096:803:2:cafe::69) by PS1P15301CA0023.outlook.office365.com
 (2603:1096:803:2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.2 via Frontend
 Transport; Wed, 19 Aug 2020 15:21:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.59)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=permerror action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.59; helo=JPN01-OS2-obe.outbound.protection.outlook.com;
Received: from JPN01-OS2-obe.outbound.protection.outlook.com (192.8.195.59) by
 PU1APC01FT022.mail.protection.outlook.com (10.152.253.83) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 15:21:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f88yFHbcTd9wmeWy8QLuXY03jqfWXxzZ2qxNuKcDqCswFGFt8zAcdAZR/R8GZOuOtw90E8/YBoUTIz6+ch67j0IhgGP1Dv/81m6zwMbMQsWRN/V94uj3kDCOKRnMnjFaaNP3eLEOVjZQ1zmI7yrGeyhXYpq57Lj+oZpR5AFHG4E02n1eN/Pqzy9uT/egB+hyQZSPA3g+HUSZkI4NSWV9bIXn+4VyA6fqOrDWKOeKACIziMVERixFNy8b6RQMKamcGBziNL7X9T89X+RbT3YKi70kwznZqMEY/SOq+3cwEQACGzxa7JqnAxz67GBtZblVlXD/dqpWRQd55ygTjBYWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJVdZnfY5/vu+9pruzsmc5H3CZNPQA+7C33raYCx+x8=;
 b=lgViFAbghtXuxv2zpc6TaJgLqpvzfNLc9W6Bc316+eubcVqEYNF+ZXZDR02nD414rY/Na9GolEby/p/5o6JBFRlVegi8ol6iGXfT62viZLFnnXL/nJPCZmTsjUgiIpEVo6d8PUhYfZsnvgpl9u6d28qLzOU6iQMSn8ubAczcQBmqKPBZwLOVrHs+VvSM8Ho1gv0+RMLCD0HVKRP+ZHcuJ25FxKN1nJgZgljcFsKS04xaO1P4d5jeqFYv2BaKb5Ex3ckwADsuYm/e3u6FFGwk8frYy56F2h93p5vLW0ssOwjNkULVfB6NO6VgobmQwvaZQT9ivmTukdZLhXtdq7ZF/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJVdZnfY5/vu+9pruzsmc5H3CZNPQA+7C33raYCx+x8=;
 b=M8aeGTOR2+Y7KaW6ZW3A0F8S14n3gNvTJuYGbQuM+AgBtrPeGNpZqb6qtIQ8wpJqrKYaGOKuMAjINm9RJOrCvASzH3R6mk+KPerHJTudjFyzN4L1SKZovG8fsBgFIoNTYufUVD2Iyxwx/ygashDsbkvEeM4GyK7PztEHkW9wTp0=
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com (2603:1096:404:94::9)
 by TYAPR04MB2461.apcprd04.prod.outlook.com (2603:1096:404:19::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Wed, 19 Aug
 2020 15:21:23 +0000
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::2cc1:aafb:c970:edb3]) by TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::2cc1:aafb:c970:edb3%7]) with mapi id 15.20.3283.028; Wed, 19 Aug 2020
 15:21:23 +0000
From: "P. Priyatharshan" <PriyatharshanP@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Pass the gpio value from phospohr-gpio-monitor to other applications
Thread-Topic: Pass the gpio value from phospohr-gpio-monitor to other
 applications
Thread-Index: AQHWdjvfQJk7fZujf0WdCNot4iEW8A==
Date: Wed, 19 Aug 2020 15:21:23 +0000
Message-ID: <TY2PR04MB3311737F6BCE7E669B161003CA5D0@TY2PR04MB3311.apcprd04.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:6e9e:fe67:21a2:535b:c01d:ad66]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6bc3c1e5-f0f1-4fab-03a5-08d844538b3d
x-ms-traffictypediagnostic: TYAPR04MB2461:|PS2PR04MB3752:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PS2PR04MB3752C07BD5A290386A5081D6CA5D0@PS2PR04MB3752.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: bolpO0qNOs0wxLftOZ2g5EB0ElDBrltjjrnFLW3fhIY0JskHJaHvYBBhvdE889uRTeFqbYOXYCFm6qLX2gfZx2Dshwqg7kt6FmyuPQ4TcqztN9PPRKGEtsCSPuBDDzh/Gh3lukZiYTski/2/33P+9elV3xgaIz0SCWPOMCqiA6i9TOS69KSI3nj3kOe9Jav9OXOA8TrMCO41A8roUoIk4z2v4584Ox3Phrh9bBQ3T7hq/KWOEoUke1cWkNszjScxzqb0tZ8sk996/p+kV6CmemQ4Ujq/6rQhtttYPF1TcJwFY575ITcMEcS4DSJWomkCqpWWMHYImvbhbg53SIsSZA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:TY2PR04MB3311.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(9686003)(64756008)(66446008)(66946007)(186003)(6506007)(478600001)(7696005)(5660300002)(8676002)(19627405001)(71200400001)(33656002)(86362001)(6916009)(52536014)(8936002)(66556008)(91956017)(66476007)(76116006)(2906002)(83380400001)(55016002)(316002)(54906003)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: eySO7D49ARVWSJLfLF3jIAm1Yr3R3D+uiSfOVYc2wxOnifh/pBEtr7oqzIJwsYafwXGUPYTjNXrKvGV/M+njZPKt3LNSYhfiUnyI9Ekd0QvdtIi8AYmLgSi/+NbvQT7u4q//NKMWvvWhPrCtDGE4/Fykty8d7fQhaAOMTXGHwPzh7sOYgs/bOsrvYfB4Dey8j/BBk0n4WgIRkPcIFKN8RRu753bL9AXaWMu8TOCMGwXAkxaOignkWSRt91xJpvrbLVYgBpHyd0O6i807Is5p3bmvpDmpf3log23I3hRl8Yu6EPlFJ3cxO3ps5T+UyVAjffLSNEaMWsr49SNGOKDPwRfdUdvqo5CTbvwwceUy0XYaYUtRM0XQxeWecWhTCfNgi5r2BULLy8KpB/jtaGcCag4xcuzS8ubvV9QK4E56A0qNU2LrYKrf0Io9uceba2rxbzYFHFDPZYc0A+gWecK3zd7M38BBpBNI/wp4xcoi8dD2gH5S8CVwSbd1PtF7DdqriL/7/XPxbvrThtCcBnhkuFqZAILrW3yBCQHtljURgjARGYiLIbzmaz7qO2TBip6c6scSXDoc3Pin3G3j2CnA23vqSTWGuGRL2hXdRJAQxdX9+JSrBlbuOJtw8iuIawciMAX/f3cToCQ1cv7OWMB5PGCVzGqnxkbsj/yDvlB6GPq0phIYLoUygKnSpKneubxz9UiYMcV3eD4eB0ff7P+DGw==
Content-Type: multipart/alternative;
 boundary="_000_TY2PR04MB3311737F6BCE7E669B161003CA5D0TY2PR04MB3311apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR04MB2461
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT022.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9d9ef08a-3127-4227-d2f8-08d844538844
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EUnKzDWdm0lC7/uHgF4OzZqxGDvRMLanDgYxcjnRcpBkdjaRvk3z+4GyfXTBn3/lH3JRMPi1FXymLstCSYTiMx7zW9kcWkyc8dyU0B5PZ7TvASUQtvmlR9FQ9o7+jLEMZVBc1weOLK/sQefS2Byi+fBsISGIfhvf9AOehGaeYALrHutK9Nx7DJyEo+jCalS0ee72vscBkb29TAm5L506QzI4XxUO1cHYuDEHc29ZufzGk967KA2o59Gv/tyEce2LYB9JgfhOqvlKf23QQWsQV6dAsVRfo7jTLe2x0oCUSzm79QztlxCoU+nR6EtrOYpJ1uj3Rbdqj4mbwN6Gq+JKYAuhWO/hUdVdJAHnaFdOSxZSdVVcITrVmSMK5bEDqQc7/S9lBnXHzKBPG+o+IMPJ2Q==
X-Forefront-Antispam-Report: CIP:192.8.195.59; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:JPN01-OS2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(46966005)(9686003)(6916009)(55016002)(54906003)(2906002)(5660300002)(81166007)(316002)(47076004)(82740400003)(70586007)(33656002)(82310400002)(83380400001)(70206006)(36906005)(478600001)(356005)(52536014)(19627405001)(26005)(336012)(186003)(8936002)(6506007)(86362001)(4326008)(7696005)(8676002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 15:21:27.2465 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc3c1e5-f0f1-4fab-03a5-08d844538b3d
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.59];
 Helo=[JPN01-OS2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT022.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR04MB3752
X-Mailman-Approved-At: Tue, 25 Aug 2020 12:34:56 +1000
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
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_TY2PR04MB3311737F6BCE7E669B161003CA5D0TY2PR04MB3311apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I understand, when the gpio event occurs, phospohr-gpio-monitor starts the =
target unit and exits.

So whenever gpio event occurs, is there any way to pass the gpio value from=
 phospohr-gpio-monitor to other running applications like x86-power-control=
.

Thanks,
Priyatharshan P
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

--_000_TY2PR04MB3311737F6BCE7E669B161003CA5D0TY2PR04MB3311apcp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I understand, when the gpio event occurs, phospohr-gpio-monitor starts the =
target unit and exits.
<div><br>
</div>
So whenever gpio event occurs, is there any way to pass the gpio value from=
 phospohr-gpio-monitor to other running applications like x86-power-control=
.<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Priyatharshan P</div>
</div>
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

--_000_TY2PR04MB3311737F6BCE7E669B161003CA5D0TY2PR04MB3311apcp_--
