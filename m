Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3731D9130
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 09:39:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R77K3PHPzDqQt
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 17:39:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.253.91;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=NMksZopE; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253091.outbound.protection.outlook.com [40.92.253.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R6qQ3kh8zDrNN
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 17:25:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dI8Ap0KZhfl7ICwiswjWSXoonxVw23ZNED+X9zskquB68mrl9vAUqEBMXhY6mYCJwNc/ztnfJrafqJSG+CBD+jWOqSmJLVYCESDzfDSS6ghxjVDT5vlBIpsji2kVdVHBCiQN82pIkV8U8FZGQ4hP2ZifJWy3T8FY+nPoRr7bQv7D2PJ2hwwWAydUqdPJJ9RhlZsIZkiNIn6KB9D1abeKiWhcvHtzyk9261zdISsZvjy3Q7DEMzmCPffQBK/9JfrmKqPiTlBCKz6wJd6sM4WgW7GNwA7JWEUpyLCKwZPGz9sN5Irq+Ge/kaxIdX8ktLy0KHGzyXjsvyzVwkJBXEAyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLjQonGOj2p90GZ81ezk4xoWdbcEZzIBZQIgfWK7eeI=;
 b=VcNdPGodd/u8DVbMYHi7tdeW7IIZXEtEXod5ig0y2L8JRo2UNR49NeZ0Ldu/NewKCI/1kK4Xk5OcMoAHRZE88cS3tWYeRIYPjlya/VwzrgGzU1LVUwpMaNktXNfkJPP8sY5Egorf1rtmg5LxGOlr8eAOdc6BcJ+1gcJGe3xN1gAOPrToXPv9wrn7AYKiMjNK7QSZKxg2QR54x9e0/uzzkV7pNG/BeEh207d4/bBn9h27pfgtwdNNzBXHr7vb4vLmWJbdhPNlo7+ja4SnhnHaMZ2jwN+RNNFkT+CiQb1HfZ4LPY629KLsZJFCjf06egUYp7lXyhluK3BHegQIF/qvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLjQonGOj2p90GZ81ezk4xoWdbcEZzIBZQIgfWK7eeI=;
 b=NMksZopEzx+cRUJAgTOWfIuvCJvR/FjiX6NkPKbTuJnou1oH50U1syfXtzsUbk5EhEr/4nNyjnodBbFmR3n1f7G1E+Ptky8Zy/nCSTM42hlcLCoJqDQ0Mf/cFCH+tw9pEuTQaFQtDfXeKADL44pRhhgeKLsH8j9ap5acjUzcs9X0p6cEqWAXKshTfMKPHHAhIwoZzivwE91YovAwhFB0I8buup8F1a/knui+82oMi5se2HIV0S2somNaVpcSjqCIQAQDMoincOg90Zfg95y9ka/FZXuNReDAKzW3oW0xMx8KPSATEppIcX1vzlp3amMUC9WP6v1I7AQM+e/KLnVdng==
Received: from SG2APC01FT064.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::42) by
 SG2APC01HT077.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::238)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19; Tue, 19 May
 2020 07:25:33 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebd::49) by SG2APC01FT064.mail.protection.outlook.com
 (2a01:111:e400:7ebd::485) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19 via Frontend
 Transport; Tue, 19 May 2020 07:25:33 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::48eb:bda9:d490:c17c%3]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 07:25:33 +0000
From: "zhouyuanqing8@outlook.com" <zhouyuanqing8@outlook.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: When I use virtual media to install the OS, the CPU usage reaches 100%
Thread-Topic: When I use virtual media to install the OS, the CPU usage
 reaches 100%
Thread-Index: AQHWLa3m7vOKsJpja0aRdndzrca/TA==
Date: Tue, 19 May 2020 07:25:33 +0000
Message-ID: <HK2PR04MB3826347690398FC26C302F74FEB90@HK2PR04MB3826.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:18CE38CAB533C0596C23F79C13A583C4B52271C863A83D02162B13D12F07ACFA;
 UpperCasedChecksum:297E3D29099B947AD1496F0770D7DE05600E944E2A67B2A5591E85A27B95A888;
 SizeAsReceived:6821; Count:43
x-tmn: [+UNrlHRdNng3iD/qvesvrqEo8fJAYbdr]
x-ms-publictraffictype: Email
x-incomingheadercount: 43
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 067efca0-0825-4dfd-86ba-08d7fbc5d140
x-ms-traffictypediagnostic: SG2APC01HT077:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zXA2+QDo58hsen32Vjg2vBfvZk5/QoWnw/cXcPmXKHRJ/p9pnb3Kb6FJ9wBNhkXeSajEJk17NoPe3hpetwCJ4DzDM2QeXHL2neRP3HqWjBZZEy8EzOgo/zqcSaaPAKMcDNiK0/kzWGmu2x/z7E4tCaoEM285S5u2d9OH6U3iQw6Wxj9+j0QxAET7oCZFNz4cF3aln0e3lGzzF5+sWSXwtQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: 19pqCDBeb97p9qUsdoQc/6BYER86FhM6VZJg6nfC+8NbQv7mzveslS7dk2b5FvyWWulBGYEyrQlZb2ePVrBbl7MzUHPzurSGeH4lhc9tWZozSyKstPJyrF0mmESE36qUEoRChK6lYdLc7noqVUQdxQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB3826347690398FC26C302F74FEB90HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 067efca0-0825-4dfd-86ba-08d7fbc5d140
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 07:25:33.0952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT077
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
Cc: "uperic@163.com" <uperic@163.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK2PR04MB3826347690398FC26C302F74FEB90HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQWxsLA0KDQoNCiAgICBXaGVuIEkgdXNlZCB2aXJ0dWFsIG1lZGlhIHRvIG1vdW50IGFuIElT
TyBpbWFnZSBmaWxlIHRvIGluc3RhbGwgdGhlIE9TLCB0aGUgQVNUMjUwMCBDUFUgdXNhZ2UgcmVh
Y2hlZCAxMDAlLg0KDQogICAgIE1heSBJIGFzayBpZiBhbnlvbmUgZWxzZSBoYXMgYSBzaW1pbGFy
IHByb2JsZW0gYW5kIHdoZXRoZXIgdGhlcmUgaXMgYSBwbGFuIHRvIHNvbHZlIGl0Lg0KDQpUaGFu
a3MNCg0KDQoNCg==

--_000_HK2PR04MB3826347690398FC26C302F74FEB90HK2PR04MB3826apcp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi All,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; &nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; </div>
<div>&nbsp; &nbsp; When I used virtual media to mount an ISO image file to =
install the OS, the AST2500 CPU usage reached 100%.&nbsp;</div>
<div><br>
</div>
<div>&nbsp; &nbsp; &nbsp;May I ask if anyone else has a similar problem and=
 whether there is a plan to solve it.</div>
<div><br>
</div>
<div>Thanks</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_HK2PR04MB3826347690398FC26C302F74FEB90HK2PR04MB3826apcp_--
