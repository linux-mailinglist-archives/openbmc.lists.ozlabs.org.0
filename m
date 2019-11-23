Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 630D6107EF6
	for <lists+openbmc@lfdr.de>; Sat, 23 Nov 2019 16:02:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47KxP90qb0zDr0p
	for <lists+openbmc@lfdr.de>; Sun, 24 Nov 2019 02:02:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.4.90;
 helo=nam02-cy1-obe.outbound.protection.outlook.com;
 envelope-from=fishbaoz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="N/V/2Aa7"; 
 dkim-atps=neutral
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-oln040092004090.outbound.protection.outlook.com [40.92.4.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47KxN60y9vzDqvj
 for <openbmc@lists.ozlabs.org>; Sun, 24 Nov 2019 02:01:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dwdq5wM8tB94L2aNoPQjdC7AMpNPB2cSRV2q4LthDg7JYudCnA7MWGTzDovoKX+vutKnq1rqM+G52Yeu9PFAIEr1j3/NyW8x6S4173Tcmdg2YZWxtcOFG1nYtM9sxcGz8e74bng55yfXTeQE9JrNQYAAu4o7zLpGIEGPHo2WNkx4V4hQLLBRy18Q98B+7Emv/7V7UxEnasinBS/yfWwzKd6IVAj27QxQybbpTfS8iL+GNydyye302lodv0ANi7WhSF4elxYf6qgD3asPqkVtNpnDaowdfInCcrxkW3fBtrDYrY3YAKNN8k1OZ45IWjWG2IjD/7321IM3Qu3g7YhS2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NU4Bw/DGtZgFd+e751u2sc4kP7i2GIeg2H4pcBmCSZk=;
 b=K+kA+3J1+WTj6P4ZsEnFBostaQr1pNJCarfUgC4zwEhB4E2NeMe3j6RAvNL4/xFbfiJryw8pUtqgzlkLTe79COwgtagtqnxgi3n7+e7VxIRTBzzApLOaouKme+UcgsPh+aDkBeBcebiXLBogSacxdUv+tZijFspeKc7xmQCPcZZnhlCNH3IsndWrKKG/sz3yPhUPsIpjmKAVerIrKJ2ksdlbkiZ8bPyzhhyq3IXXVkBVFG8I7+DwdsUamu4YCqPHE9GVNezlR6BlUjVCIOyB+xy5mWhZ75YUtj+MXdlbI6+BfVUWiNmhHtTN8qynK/U4E0L2wP/Q0EwGG4kD4nreiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NU4Bw/DGtZgFd+e751u2sc4kP7i2GIeg2H4pcBmCSZk=;
 b=N/V/2Aa7Rtsx5ZLOr5wJT11uNn3qhQCFQNlvtX49Q6D9CyN7ilM/u6ZJDKus9q+0Ho6ZojKXbzPZ/EMyXdtNhuyBqrj7a/EcIyb/wLK8ut3IxMflB7lb32DWdoGJJTVuYQTFgX8n+Gvi0s0UFYRZO6poeBbZ1ZnnoS1un+oTBd0vxsk4HLKjpKVC/KYoYym3IG0bR3swI9QN1CANtQP/6b4m9WpTZJ10d+8HF9W3xiNDT0xWHlXIUHv2yb29cfRU96k8UEq8mTYfPJYrtrbnRaZAv6SXtU4s8iUK2WzzuQo2TEQTEJDFXQgw+SiN2RkR6oZwXrNYRFdUKTrtQqfRmA==
Received: from BL2NAM02FT027.eop-nam02.prod.protection.outlook.com
 (10.152.76.60) by BL2NAM02HT176.eop-nam02.prod.protection.outlook.com
 (10.152.77.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17; Sat, 23 Nov
 2019 15:01:52 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com (10.152.76.51) by
 BL2NAM02FT027.mail.protection.outlook.com (10.152.77.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Sat, 23 Nov 2019 15:01:52 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::64f4:9bd0:ebf9:844e]) by MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::64f4:9bd0:ebf9:844e%2]) with mapi id 15.20.2474.022; Sat, 23 Nov 2019
 15:01:52 +0000
From: Zheng Bao <fishbaoz@hotmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Command systemctl start xyz.openbmc_project.State.Host hangs
Thread-Topic: Command systemctl start xyz.openbmc_project.State.Host hangs
Thread-Index: AQHVog54i75b7IGJSEuXmBpPBKVn/A==
Date: Sat, 23 Nov 2019 15:01:52 +0000
Message-ID: <MN2PR04MB66690B44AF8D2827F0E0E209CD480@MN2PR04MB6669.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:CF444702022915EE19AE917724444653B182E0F6B35E12BA42DC61D9AF962AA3;
 UpperCasedChecksum:19242FBB5AD054BFAE2E336A64785A2456A08A022C353AE8629C4378998B8965;
 SizeAsReceived:6708; Count:42
x-tmn: [F1fuV5d7h90KVpw/iUkcTxzSarHzuXV3]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 9a7bc396-24f3-4ca0-43de-08d7702612e0
x-ms-traffictypediagnostic: BL2NAM02HT176:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IOOB9aebsnr/SHdAryKVDGjwb30OToaJSFVTq4gccXHWB0mt4eEEKWB6KgPu2vBEq50CJVPtlwHTdvU1saToGSRm3wFbTHS07efrZ1nGyx55FzSOw7djNTkB6ouQXpda5BlbpkSEDo3Yw+2wpi7MRdS0hw3oFBYpQGgEyyr8Z36hn39H1R+gPkha7uzXzpK7
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MN2PR04MB66690B44AF8D2827F0E0E209CD480MN2PR04MB6669namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7bc396-24f3-4ca0-43de-08d7702612e0
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2019 15:01:52.3292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT176
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

--_000_MN2PR04MB66690B44AF8D2827F0E0E209CD480MN2PR04MB6669namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
I am trying to debug the state-manager.

I started the host state manager by running the following comand.
$ systemctl start xyz.openbmc_project.State.Host

But it hangs. I add the debug code in host_state_manager_main.cpp and host_=
state_manager.cpp and it turns out the problem is not here.

Does anyone can give me a hint which file I can look into next?

Zheng


--_000_MN2PR04MB66690B44AF8D2827F0E0E209CD480MN2PR04MB6669namp_
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
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I am trying to debug the state-manager. <br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I started the host state manager by running the following comand.<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
$ systemctl start xyz.openbmc_project.State.Host</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
But it hangs. I add the debug code in host_state_manager_main.cpp and host_=
state_manager.cpp and it turns out the problem is not here.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Does anyone can give me a hint which file I can look into next?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Zheng<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_MN2PR04MB66690B44AF8D2827F0E0E209CD480MN2PR04MB6669namp_--
