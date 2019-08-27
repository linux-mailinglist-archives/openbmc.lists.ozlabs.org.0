Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 829829E516
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 12:00:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hkrq00nJzDqwv
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 20:00:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=hotmail.com
 (client-ip=40.92.14.19; helo=nam05-dm3-obe.outbound.protection.outlook.com;
 envelope-from=fishbaoz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.b="UTfkHNg0"; 
 dkim-atps=neutral
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-oln040092014019.outbound.protection.outlook.com [40.92.14.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hkr51NTtzDqc6
 for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2019 19:59:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZssr84Yd3ewQX0XYseu0kFjYCPfZgT+124vXcJf92FGmjmwtBMDjXHC6+hd/IPPrH0a0LauKP7RmazndUBHZNw0X+HvYF0BM6zJZlSUnFgZMJOiXilBJpanHBHCihdlZ1zMc6/zQ0tVBTZGTzYIAYB0v2diumP5rUUoRvzf1INCpLTbh5MnwRbie3KHeACx4DizijN8tEg22ejdqmtavTlSH/02asbjzXuf5eF6jQVWNCclbteigNtx522dwPhus3l2GBXJoNHCPEXZFkAE9IMNX36fCjqXyTBLTm7OGGKeyYj9K34aySv5zdSsQlXHpBGHP2IoFVXAbvEW09uMEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqU8BJ+30WikKcG+D38TXut7x5F+0rpBfq+DfqH4KeI=;
 b=V8mkofl9+bmg3StPnbtRv9wwznVU8YJDF+SbeN5MfU85Vcw99ld1wGCw2QPsJxys2JZasoqt/qtETHoEBus5hUCUWITSZ7MXOVaUFLOx23luvtlvC5pQ1djcVICdQXIdPRcIpvZGL5RQ2zs7w+JmgE4GtdR9WhCInBhdGMYWhlt7EaxQ89Sgxaym4vb8Lu+SF2h9xvw560cTprVwubNw1SSao44pL/ihOEb1I/DJvUnS3OxoC4YghP5i/1nYL4ImxHKJeSsQZTR1YfrvjAz24myOktdSMfjW0gKFgBeL3iRv/TL3znD9LtbChDitQ1gDmQMN8W6PO+xgb7BVgWw4CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqU8BJ+30WikKcG+D38TXut7x5F+0rpBfq+DfqH4KeI=;
 b=UTfkHNg0blnXrs/WdKT7GR/FXCngu+rj5m7/unIYCnTcMK1Ou/peA0uXADpUVbRkt+coyQNkc/CWa2+JcazX+BudwkkIFZyuOFL9LbLTpknF3bSQwQZlBMEblO0k08qex8eyvpMVBi3I4S/gt+QE6+DEpX4I5xe9t0hl82tK5PhJqZkzfmDP9EpB3UtbBixzDbQazyKKXaq12mWOtXIMv+p7LPyVXEXyi6TQmfUrCD5bdE+KJ4ltDUMDXyTWiooo8du/i1tCFCcsS1dbtP6pQnxm434jU/WghkukgPvBNUoGE/I8MZXv3a//KxXPUQARt4c9iZdyEMtu1e84vos8hg==
Received: from BY2NAM05FT010.eop-nam05.prod.protection.outlook.com
 (10.152.100.56) by BY2NAM05HT176.eop-nam05.prod.protection.outlook.com
 (10.152.101.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2220.7; Tue, 27 Aug
 2019 09:59:43 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com (10.152.100.60) by
 BY2NAM05FT010.mail.protection.outlook.com (10.152.100.147) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.7 via Frontend Transport; Tue, 27 Aug 2019 09:59:43 +0000
Received: from MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::647f:2fe9:ff83:e676]) by MN2PR04MB6669.namprd04.prod.outlook.com
 ([fe80::647f:2fe9:ff83:e676%2]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 09:59:42 +0000
From: Zheng Bao <fishbaoz@hotmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: KCS ipmi interface doesnt work
Thread-Topic: KCS ipmi interface doesnt work
Thread-Index: AQHVXL0FNY1lkmYW5kevDWfpz1e0Xw==
Date: Tue, 27 Aug 2019 09:59:42 +0000
Message-ID: <MN2PR04MB6669921B935ABDEC69C6DB6ECDA00@MN2PR04MB6669.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:BF34683C226DB1D3E8B9619DD57F8D874C0E07FAD4865043BCF22080B05722BE;
 UpperCasedChecksum:273055002E1EE62C0026299C394FFB3BB367B569EE0DF97214CCDD4605B74D31;
 SizeAsReceived:6492; Count:40
x-tmn: [sCyrQGsMx4KkL9zOEPCtanIkRGjdLRUS]
x-ms-publictraffictype: Email
x-incomingheadercount: 40
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:BY2NAM05HT176; 
x-ms-traffictypediagnostic: BY2NAM05HT176:
x-microsoft-antispam-message-info: 47vKte25YoUTYTpFzNRGgC6B0Ys3EI3uYMJzMO83eFVcW37Aqw/Pz+v9ijA7hjV1vVCedss8YwzFqWDXs24FsKD/HBLi/NHF2xDuVQvkKRdfeV1KBwAQ3M8uSYQT7fTF7Vep9K5Q0ewh6ac+Tgsh+kBvVa49M1WomYx6TE1RFeJfGH7eUqPxwSj2p5kfIswb
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_MN2PR04MB6669921B935ABDEC69C6DB6ECDA00MN2PR04MB6669namp_"
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f99ef32-8046-4b70-90c9-08d72ad54879
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 09:59:42.7390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2NAM05HT176
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

--_000_MN2PR04MB6669921B935ABDEC69C6DB6ECDA00MN2PR04MB6669namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi, All,
My server BIOS tries to send ipmi command "self test", but openbmc( I tried=
 Zaius)  doesn't response.

Is this right? Or how can I debug this? Thanks.

Joe (Rookie)


--_000_MN2PR04MB6669921B935ABDEC69C6DB6ECDA00MN2PR04MB6669namp_
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
Hi, All,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
My server BIOS tries to send ipmi command &quot;self test&quot;, but openbm=
c( I tried Zaius)&nbsp; doesn't response.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Is this right? Or how can I debug this? Thanks.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Joe (Rookie)<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_MN2PR04MB6669921B935ABDEC69C6DB6ECDA00MN2PR04MB6669namp_--
