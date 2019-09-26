Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC433BF004
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 12:48:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fBV52Wv2zDqnk
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 20:48:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hotmail.com
 (client-ip=40.92.10.79; helo=nam04-co1-obe.outbound.protection.outlook.com;
 envelope-from=fishbaoz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="OtA/4r2v"; 
 dkim-atps=neutral
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-oln040092010079.outbound.protection.outlook.com [40.92.10.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fBTR0CgNzDqdq
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 20:47:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGRxUDBb4isH/l16gdlLzkq4DaOJAaOmCM39fuU/Yjcg+SJWe9SIbnLJfVBb5GF3pHJA56CsiI9ze0rhseEdDEW7hbMOGtpLQOGBSw+ljorpXDdtYI0gboHENl6OoMDAL7VyBb94diSb0ln9SOS7z8AEWoaGZsXha3RzUGfHPjxoseWaGq2Vr3IvgBKECBizUQo2DIJTXCPAKcstITK/LyHokr4nOr8xkE9ovM2hwH1psrx2CwDVANF9T0eof0vgtwOdYPDgz4mpWv3jtZn+5mljSJCDA9uHzthrPJZOHFVcW/1ZlRRA1UQZZqU2TzHV6hJFZwj7EEvxRp+nPFTr8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fG4hpsO9NbJiaU44q09Wm/QDjGc/P7XmYlXZ60hdk5g=;
 b=Nne57GFwDpOS+VlkOKofYUzq3Q6RmYES7iQJMb7C80wXUFiXUjSd9AoKBHaeLM204hK+68nBYVTPqqRo09HaKDRdwhPzHBdxEYfxVDHBp8sA3ku/+pb14cg6ObHVOhQcS4fb24rsJ/IadbmsVdNVKY62EP2NkcFAtpGTqcxc6+WSbQ3Q7jL0104cVpqA/KrSAhLHFzJ6VkWe0JvcYLm3MXmBZMMuT8KCQubHrFH9tzKgqgY8tcdsHG7n4Sz9mvPoTQ9O5msi8VrrIKTJzgIoOQLWHM7F1KJP15LfNVj3KRCAc0CcYhx7Fxge7ssx1b8TmUwdTvJ2zrwCxBSSWtV6xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fG4hpsO9NbJiaU44q09Wm/QDjGc/P7XmYlXZ60hdk5g=;
 b=OtA/4r2vzAxR3XFaHInhQa5SEg42i6SYxTA+XCPGXQJhWCs5hk3dmGRnmuNE8acENTkHyNcs0k4SlJBk1VZdYHn/lcTJtJF7lrujw9OFQBq1mAU7bFfSLMDcbJHDz7WwqZB8GLDS17QLA/U175VXRbvY/n6ZIdLrEXHvE88Zv6Q3Puq9sJtY/RcVYUlHzSeBCBY5ddQD7oG8fzszBzl+x75A4HWzhwWKD+BuVJAriLqglW3lHl8G1eV9g5MDg7W6LX6ihbwRgPb+oNcLxdowntplGzuJia4xZp6eWESUA8/BrNQGczycZL6Tc9lYDjwbdd+DHmnsrADel0JzNW94QA==
Received: from SN1NAM04FT013.eop-NAM04.prod.protection.outlook.com
 (10.152.88.53) by SN1NAM04HT072.eop-NAM04.prod.protection.outlook.com
 (10.152.88.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.25; Thu, 26 Sep
 2019 10:47:32 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com (10.152.88.51) by
 SN1NAM04FT013.mail.protection.outlook.com (10.152.88.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Thu, 26 Sep 2019 10:47:32 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::647f:2fe9:ff83:e676]) by MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::647f:2fe9:ff83:e676%2]) with mapi id 15.20.2284.023; Thu, 26 Sep 2019
 10:47:32 +0000
From: Zheng Bao <fishbaoz@hotmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [AST2500]The eth0 interface can not work
Thread-Topic: [AST2500]The eth0 interface can not work
Thread-Index: AQHVdFdbcJs/Slel4kClfvSqSubl0A==
Date: Thu, 26 Sep 2019 10:47:32 +0000
Message-ID: <MN2PR04MB66691B6B826B456D250D21E9CD860@MN2PR04MB6669.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:A7E1D84709E3984390208FF6E98CCFF26B85F827F1A4DCD487D8CBDC2C8C35DB;
 UpperCasedChecksum:F4E1C48FBDD5FE3E6A95CCD5D8CBB6963E1398593F0D2F6C8D54135C894944A2;
 SizeAsReceived:6612; Count:41
x-tmn: [N883R/7mINPDR+2icD60a+uFG9/C6GcG]
x-ms-publictraffictype: Email
x-incomingheadercount: 41
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119205)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031323274)(2017031324274)(2017031322404)(2017031321001)(1601125500)(1603101475)(1701031045);
 SRVR:SN1NAM04HT072; 
x-ms-traffictypediagnostic: SN1NAM04HT072:
x-microsoft-antispam-message-info: +GLX0vcJkb3r82C3da+2dFCJQcJ9Uk3QgvlpUMUEeLYV+87V7LR6mVTJ1AQ9EwdJwX9E6gewt7TVrzrmvHN1QgxvQ6nHYGGzrUCnfCi16aVaIBFoJZo1B32d0j07dTaH5PSUSAOL2iNxx+TEJUDC+imG/y44I/apDB+i0E2p4nILHXZ3Aio6NoJ0VLa3QVTJ
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MN2PR04MB66691B6B826B456D250D21E9CD860MN2PR04MB6669namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c8df48ad-efe6-420f-6cc4-08d7426eef26
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 10:47:32.1142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM04HT072
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

--_000_MN2PR04MB66691B6B826B456D250D21E9CD860MN2PR04MB6669namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[   15.634717] 8021q: adding VLAN 0 to HW filter on device eth0
[   32.249877] ftgmac100 1e660000.ethernet eth0: NCSI: No channel found to =
configure!
[   33.289813] ftgmac100 1e660000.ethernet eth0: Wrong NCSI state 0x100 in =
workqueue

I tried to use the network on AST2500. Everything seems to be good and I ca=
n use ping and webui,
until I rebuilt an image.
The part of dmesg is above. I can not trace back to a working image. :(

Is there any suggestion?

Zheng

--_000_MN2PR04MB66691B6B826B456D250D21E9CD860MN2PR04MB6669namp_
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
<span>[ &nbsp; 15.634717] 8021q: adding VLAN 0 to HW filter on device eth0<=
br>
</span>
<div>[ &nbsp; 32.249877] ftgmac100 1e660000.ethernet eth0: NCSI: No channel=
 found to configure!<br>
</div>
<span>[ &nbsp; 33.289813] ftgmac100 1e660000.ethernet eth0: Wrong NCSI stat=
e 0x100 in workqueue</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I tried to use the network on AST2500. Everything seems to be good and I ca=
n use ping and webui,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
until I rebuilt an image.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
The part of dmesg is above. I can not trace back to a working image. <span =
id=3D"&#55357;&#56897;">
:(&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span id=3D"&#55357;&#56897;"><br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span id=3D"&#55357;&#56897;">Is there any suggestion?</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span id=3D"&#55357;&#56897;"><br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<span id=3D"&#55357;&#56897;">Zheng</span><br>
</div>
</body>
</html>

--_000_MN2PR04MB66691B6B826B456D250D21E9CD860MN2PR04MB6669namp_--
