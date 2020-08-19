Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 340B7250F6B
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 04:37:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbCnW23rszDqM4
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 12:37:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.140.119; helo=jpn01-ty1-obe.outbound.protection.outlook.com;
 envelope-from=priyatharshanp@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=EbDoWUBk; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=EbDoWUBk; 
 dkim-atps=neutral
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400119.outbound.protection.outlook.com [40.107.140.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWs6X57lgzDql2
 for <openbmc@lists.ozlabs.org>; Thu, 20 Aug 2020 01:25:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6p/Ip3qTPnSKlGEo1QSoeDXFK2CXhQsqE7kxe6yFi8=;
 b=EbDoWUBkp78PrbHB9jYo9AhTqVIymCGn4GY0CmMc3woHBwM1r7mL4jhSc9gTOKLz+39cl/ULtbYg+aaE9Vmz7ZUzW2lZ0PLZ/qMviArWVko+nE98JW6/78cUfKnL980j76DEgazqR3xbfBGzj1rdcm0OHt+O9ZS4i+wXuY88kTI=
Received: from SG2PR01CA0160.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::16) by TYAPR04MB2333.apcprd04.prod.outlook.com
 (2603:1096:404:25::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Wed, 19 Aug
 2020 15:25:08 +0000
Received: from SG2APC01FT024.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:28:cafe::5b) by SG2PR01CA0160.outlook.office365.com
 (2603:1096:4:28::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Wed, 19 Aug 2020 15:25:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=permerror action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=JPN01-OS2-obe.outbound.protection.outlook.com;
Received: from JPN01-OS2-obe.outbound.protection.outlook.com (192.8.195.57) by
 SG2APC01FT024.mail.protection.outlook.com (10.152.250.185) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Wed, 19 Aug 2020 15:25:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDS/PnA7TXv2IsZ21E/lqg3TQLJWmD5mj9kn4NmGB52eiUAUgkZZuRRvk3Xzs4qqUSp8ooGtM9Z8QxYQVAs/DNBWOoBujSKVGe9SR9RYDA/5p2mqOwT1IKI/ZD3ivaZ2aiN8qTL2t1Ymw3ebDpWrQ2PS1z0RyUkoKJB0kfy7QJaLbThmgOSj6Ahw67pHQIKDgGlESpNnS9ZU/75EmfKZ0QCASRuMmwm4z4xRO8ELkpexj4CoIViecESRSuzqfm/znkQrQP60HiPctGSpmL6jfvMgPr48obICtiDb+8uzVWeYVHb/5Q7t11bkl42JcQXtVMyvA0PXkTMFU7CE5ZKr8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6p/Ip3qTPnSKlGEo1QSoeDXFK2CXhQsqE7kxe6yFi8=;
 b=njMN3W4wK98WJzSpQvyLOZucZCIQaDIwdGDEHZ4f2QoNF+ynZaCDSArLnBrCE+d4D2TmvynAJFjHa2hpaJRr2TaqM1yfySWZWNMjzU+JPgC5EhEFE/s5FCRlAFFtqM9mYmiV6A3PCOZV240D3PBhtXgdFW9l9hGig4EoesupRloU9EWv3U/rg53oGeFXXDH787e9g+4Rc0w7W/7bg+EnLzyeKUPX6GNK7v98mkkPMgWUuDMm9qwQky1LVIVAc+jPpiSo0CDLsw/civSR77dMH7mQNX/7Qek4a6b/HqvSMDma8JLAeErcGKslU9ApLLOMRhsx55RBp0jfnoyCT8gujw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6p/Ip3qTPnSKlGEo1QSoeDXFK2CXhQsqE7kxe6yFi8=;
 b=EbDoWUBkp78PrbHB9jYo9AhTqVIymCGn4GY0CmMc3woHBwM1r7mL4jhSc9gTOKLz+39cl/ULtbYg+aaE9Vmz7ZUzW2lZ0PLZ/qMviArWVko+nE98JW6/78cUfKnL980j76DEgazqR3xbfBGzj1rdcm0OHt+O9ZS4i+wXuY88kTI=
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com (2603:1096:404:94::9)
 by TYAPR04MB2286.apcprd04.prod.outlook.com (2603:1096:404:24::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Wed, 19 Aug
 2020 15:25:02 +0000
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::2cc1:aafb:c970:edb3]) by TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::2cc1:aafb:c970:edb3%7]) with mapi id 15.20.3283.028; Wed, 19 Aug 2020
 15:25:02 +0000
From: "P. Priyatharshan" <PriyatharshanP@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Facing issues in adding the package 'phospohr-gpio-monitor' to the
 image.
Thread-Topic: Facing issues in adding the package 'phospohr-gpio-monitor' to
 the image.
Thread-Index: AQHWdjyE9K8uF/j12EGMUJrPUoZwCw==
Date: Wed, 19 Aug 2020 15:25:01 +0000
Message-ID: <TY2PR04MB33117448BB99D5CF6AC2D3E6CA5D0@TY2PR04MB3311.apcprd04.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:6e9e:fe67:21a2:535b:c01d:ad66]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fdf36c85-027f-4935-1de9-08d844540d50
x-ms-traffictypediagnostic: TYAPR04MB2286:|TYAPR04MB2333:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <TYAPR04MB2333B15E11ACFB876A0427DACA5D0@TYAPR04MB2333.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: lwGlmDAQUAz34NnEAXWjKG33wbL2FiuD/QvZ4PAkuSoa22hGs3fLWXjSe+Y1oULgxNyzhMsPb+QW43Zlv9wUJEH4w5rzI0odJitXCuNaygFIglAM7b5wpobIFgKmPKN0Wk0tMdNcI/KsbPFNHZmqnPe4AkO55Brluw+UKzD9d6/S5YZc3HX0kDDn41+QdNmO/EdprB829vevFTpNtFPXhL6Z7CGJtS3LWn2/7XRn/4UOLkdBX+wrxOPU6dsfrGFlBIEu0WckFEgkDwDyiXm8hhjf0d+wqV3Nlh8ilvSFnkbjZciYkmZPPq7Q+PfBvAaewUIfXvAj3AMjnAHsY1zkGg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:TY2PR04MB3311.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(5660300002)(66946007)(64756008)(66556008)(66476007)(76116006)(66446008)(6916009)(9686003)(91956017)(52536014)(478600001)(71200400001)(55016002)(83380400001)(86362001)(186003)(2906002)(4326008)(316002)(8676002)(33656002)(54906003)(8936002)(7696005)(19627405001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: F/3DDV188jCZZE05T7larZbJ0/MPwId5MtHNAESy+VVKqunNobQUnw6LNr5dnuMYpjSNyBP6nOuCzt1LGsnbom1r07qRWbaJFfIq9zAUCOyvnO7k/Cf2olOgVxzWU2Kh9IL7f53h70TXP42LytE+RsQVGYQWxJ9CyfEe37n8BCmW4TKf9pufcQUoxDJ+3FFCW+883CjKvFoGwsChsVOIONhKIGaZ8xB8dR4W/4ChBtmzXq4Lex2dE07NGaX/17+33u+YC3Y22jv9VLgFC2eF4Xgc4UsAHoEnlF84pXHF+odorcXBTA0YLe9aibWfTvOA1YNyGQDe5PIpFqjuEmYcS/0SB4xKMbudpar9WswSevQ0ifip38kFP+TjXnIDE7Bm+jNXuUgZLvotRJtIBQXhAszii8FpBdCZFlo+zhvcejvxvtYirmklIyzJNPc/2FPPOcp8OnHX/BJOmdg+xSK4ceA18LGpIngDiwprkwhIUGrZHBCPhApmIITILP5XIPba9iDYvL2bPtkVdYYxLR5e90FdVcEOK77XCMdgKw6IuXk7zbRL9Bcmsxf1qW+DgBJgU7u4Iw2gTRYiapPkcGBR2n+KWMGLwo36fWRi0HGETYV6pDMUpSwYCwHVYzhUcHCO6ItS+/wTPk6aPipSy0KEv4nKMS/gO3mXP+ybdxzqKpixoQMZimhTRnt6guikg37LU8e9zqJU5eIbvz69OubYsw==
Content-Type: multipart/alternative;
 boundary="_000_TY2PR04MB33117448BB99D5CF6AC2D3E6CA5D0TY2PR04MB3311apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR04MB2286
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT024.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0b32319b-6fb2-409f-2784-08d844540ab3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: agY3bvLLAs55QNrDUMnbLSPZ2jwj68RIZlS/rzYljPOd756lbaP3GGvMZiFH7H/rVsAJaio12RNt+zFoHClP7yPnDcMKz0cATLYOnlmoQ8kTlx9J012u++Nl1ZcKWhPhk2T06lAeilz3Sw6Msj8tdI1+anXSz25REAKfM3Ak+qN1mz/ub2lb7W5zYqSrUYghiTLvZ5Isj+kwjD6xuHcdmPSReMKd2SgzDb6bideqCnoMNcoDdw8QfHd4eUZwAAlyTDKPtz/VCpKt7zwK0l5zkjpe75jx8BaaSzBcDgkeOxwuzDOj+wYGbC74R9M5vPDNKTstYOd5xhvNnnIMAi3w4OhWI+Pog0nah9OOoGZ7agGHR/3RD0V0Zsd4Ek2C/4KN99HX4BkgcqTu5Ec9xOTkjA==
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:JPN01-OS2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966005)(8676002)(8936002)(36906005)(26005)(6506007)(70586007)(6916009)(186003)(70206006)(336012)(7696005)(356005)(47076004)(316002)(83380400001)(82310400002)(33656002)(19627405001)(4326008)(2906002)(52536014)(86362001)(54906003)(82740400003)(478600001)(55016002)(5660300002)(81166007)(9686003);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2020 15:25:05.5761 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf36c85-027f-4935-1de9-08d844540d50
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[JPN01-OS2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT024.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR04MB2333
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

--_000_TY2PR04MB33117448BB99D5CF6AC2D3E6CA5D0TY2PR04MB3311apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have added the package name 'phosphor-gpio-monitor' to the packagegroup-a=
pps.bb. While building I could see the package get included to the image, b=
ut while the image is running, I could not find exe for phospohr-gpio-monit=
or or respective systemd and D-bus services.

Am I missing anything or Should I add anything else. kindly help me on this=
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

--_000_TY2PR04MB33117448BB99D5CF6AC2D3E6CA5D0TY2PR04MB3311apcp_
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
I have added the package name 'phosphor-gpio-monitor' to the packagegroup-a=
pps.bb. While building I could see the package get included to the image, b=
ut while the image is running, I could not find exe for phospohr-gpio-monit=
or or respective systemd and D-bus
 services.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div><br>
</div>
Am I missing anything or Should I add anything else. kindly help me on this=
. <br>
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

--_000_TY2PR04MB33117448BB99D5CF6AC2D3E6CA5D0TY2PR04MB3311apcp_--
