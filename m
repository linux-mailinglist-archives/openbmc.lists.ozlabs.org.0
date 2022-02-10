Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 687634B177A
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 22:16:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvqKq0Yqgz3bN6
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 08:15:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=9PsdpfdR;
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=9PsdpfdR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=2a01:111:f400:fe02::62b;
 helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=gilbert.chen@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=9PsdpfdR;
 dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com
 header.i=@armh.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-armh-onmicrosoft-com header.b=9PsdpfdR; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe02::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvqKG4Cb1z2xsY
 for <openbmc@lists.ozlabs.org>; Fri, 11 Feb 2022 08:15:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDeai/163zgStBlsFNxWc07W+6vrE+hzTpK44g/WgBQ=;
 b=9PsdpfdRlSCP4WDwpcyHORxlrL/pB1dLJVsKljIWKKnkYCzASScxCeWFl6zYDVdaXNGn6sHoOBsGCgqkovGx5PwyQkJST7dAFkaDmblzhfv/xk3fVxffLrjp/pL7l8V6f/kH3jjRSy1e4Xkfv9wp/DZUzo79x0yxmWnxtBDH2fk=
Received: from AS9PR06CA0205.eurprd06.prod.outlook.com (2603:10a6:20b:45d::31)
 by PA4PR08MB6045.eurprd08.prod.outlook.com (2603:10a6:102:ef::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 21:14:58 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::bd) by AS9PR06CA0205.outlook.office365.com
 (2603:10a6:20b:45d::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14 via Frontend
 Transport; Thu, 10 Feb 2022 21:14:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 21:14:57 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Thu, 10 Feb 2022 21:14:56 +0000
X-CR-MTA-TID: 64aa7808
Received: from d3710bd83cea.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 70E1028A-C039-492A-AC20-521BB0D4AEEA.1; 
 Thu, 10 Feb 2022 21:14:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d3710bd83cea.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Feb 2022 21:14:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJP6e+6iW2p9QGH2JPOk1qoZq5dRlGrxPiK/cr45WaWd7l0AGrXS+jkZox77s9l96vnjb+vWM/elF23tZ1FFmxk5KvtEVZnLcUZp2uhoupaVabCcspAC0+O5g/cyBWP8hzG1qGmfKCC1qn+fwE4Ni6yPu+wIal105y8hVYHbcN5eO+5VbZqglFlanE1qFGlQZGKmLbp0HjlVoP5OVyV4E8dfljiIMhhy626AKevKbcF7bWDO5Ta8rJexTFUCon7Hm8eL6hB4j5ZO4S7xAoPFXhInLvmRPzlVPsP553JTfJtdIsQdcOW1FYiDkC9G5v6ioW2rslTynxSoaEDY2IQOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDeai/163zgStBlsFNxWc07W+6vrE+hzTpK44g/WgBQ=;
 b=mnk7HP9vVcIHRWCt1ky7MXDruk/DLR8xToqSgtYpwL9+VLUHebMjdoomwNEihEKQSTZfT1gbOahpS72Suv2GVEE4kOQYXGun3yqhbOZQPlUf2EKhtsD7gmi4tbHWA/LEWuGd6pVZKX+SOt10XVEkccn1UHgM2v5j7OfHhKfx55+RJRaTro89TIpD+sL+AHojH7IKtdEoIn4VxaC36wQ7caTedc9799jg4AMU0WxsLppbNq2+7lTOWejOTwWyaXutzkh8swLOBPiTci4+DLsIyKEfnlFIw6P8MP2vXDYomap8AFkxLo+UAv37RYgr95oxKgdlTHYuqenDC7v4DbtBcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDeai/163zgStBlsFNxWc07W+6vrE+hzTpK44g/WgBQ=;
 b=9PsdpfdRlSCP4WDwpcyHORxlrL/pB1dLJVsKljIWKKnkYCzASScxCeWFl6zYDVdaXNGn6sHoOBsGCgqkovGx5PwyQkJST7dAFkaDmblzhfv/xk3fVxffLrjp/pL7l8V6f/kH3jjRSy1e4Xkfv9wp/DZUzo79x0yxmWnxtBDH2fk=
Received: from PAXPR08MB6560.eurprd08.prod.outlook.com (2603:10a6:102:12d::23)
 by AM8PR08MB5810.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.12; Thu, 10 Feb
 2022 21:14:44 +0000
Received: from PAXPR08MB6560.eurprd08.prod.outlook.com
 ([fe80::e535:68c7:ce64:ca0e]) by PAXPR08MB6560.eurprd08.prod.outlook.com
 ([fe80::e535:68c7:ce64:ca0e%5]) with mapi id 15.20.4951.019; Thu, 10 Feb 2022
 21:14:44 +0000
From: Gilbert Chen <Gilbert.Chen@arm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: request to add Gilbert Chen to CLA repository ACL
Thread-Topic: request to add Gilbert Chen to CLA repository ACL
Thread-Index: AdgefHr+K+LPiKmjTIejIcfAs/OXJQAOuZyAAALgWqA=
Date: Thu, 10 Feb 2022 21:14:43 +0000
Message-ID: <PAXPR08MB6560E663519DBD5399A077CB862F9@PAXPR08MB6560.eurprd08.prod.outlook.com>
References: <PAXPR08MB6560EBD9F7A7DB8A23A9997E862F9@PAXPR08MB6560.eurprd08.prod.outlook.com>
 <af16b2be83e516ee1315ed6c238e98384fdf473b.camel@fuzziesquirrel.com>
In-Reply-To: <af16b2be83e516ee1315ed6c238e98384fdf473b.camel@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 46AB925791F21546AC0C17FB734DAE9C.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3ca7bf83-db95-4709-2ad0-08d9ecda63ee
x-ms-traffictypediagnostic: AM8PR08MB5810:EE_|VE1EUR03FT020:EE_|PA4PR08MB6045:EE_
X-Microsoft-Antispam-PRVS: <PA4PR08MB6045A0CA98C5CEB7FA6E18AE862F9@PA4PR08MB6045.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: uc0BP1C9MzZCge/6R2bCPUpLT9cuT7JsXZXoqmNy1t9YWBy6LuPUEFmxkiyuIRScNgCfr3K0kbfGP0h7F8HUaTiXVcQW/gRME73ESzDHDelLWlMt9knHxgyca00iy0FRxi9seRWpGWH/4eKUOz69qP1V0SdLqOFOvUHFe/pRBV3YwmxmZMiD+PYrpovVFqGpdWnHzWX/pEHkRPCT+wkq8apr9/uPpCaujtLmtfcPh2WaBpM1wRTgaoD6BvWZ0glKbhd0vPace/bSdKRteiGxEKBjhXiaKvJ/rsoFrvl6sYclbFf83au4tHcsaHF0HPIRGErQG1sIGbz4W6G8XpPVUXzCQsEC4UQHbVHP/LidfaeRW+3Q63Mdzl1fWSup8MCmFdjvKAWVHaIoggsaZ9uH/kKQ/WHlyBvdieb6zfGaRGDY7Sd94m0ty8zLOMDInDiKHplfFLK8ItR3YDPJ8SXBRuzg8VkSnA44JnBHw6BHJq6ILSJrQL2QIAUkF4tRAH4KLtcCxnmsgioitDdenhmvzlDXCDDfacinXUyZKBmm3I2kL2qnf6pJrLaYVFM9H9/N+ZQfitLQyNlbUmeIfiIRGFGIq71s8MM6wJwVjM7lYrg62NyDQkJUo4DJMStdU4efQByrL1NDFBJ0Wh/tk/7JdwZJbav745PxmbKFvQTmt/n0xVGESr1o1iUwtdJ2EaYI3VIgLMxrirdKIFXl78jN6O4thL8AE8xWnxNIcwrjcbPKOY/tfIO9bjhleAz81p+mxv6QMyDmxq5WwRh2YVGeU7mepeuRmmTTsTDVlWpksiU=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PAXPR08MB6560.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(84040400005)(122000001)(6506007)(110136005)(38100700002)(53546011)(7696005)(316002)(83380400001)(2906002)(33656002)(9686003)(52536014)(71200400001)(8936002)(86362001)(508600001)(55016003)(5660300002)(66946007)(66476007)(64756008)(38070700005)(66556008)(76116006)(66446008)(966005)(8676002)(186003);
 DIR:OUT; SFP:1101; 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5810
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8ffb9e71-50a2-407f-a441-08d9ecda5c0e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oDko7lA7oytFKFAZecD/pcsBTz9IRYjlC4xv5qaLoN/NoTvU3FFOgLGh9pkoS4E/uaozV6o6hDgpzu8I8MrlFlWcVc0nV/auVVZfKZ12NDrylxPaonbxErRJq6VfkXV0TIBpLJlWjI3lMovrfhNKgCQGAVvgKau8qD4ObeRDncPoQ/O0MLIq4z10zAtI1BQ6+fk9yGskY2AYQBk0nbXzBOAVRCNxtkIhK/QR/OQKQr+sarZ8FJ8mNJSko4kCJMzqzrMEfeCcb8QaERBUUAK7WZQioxxfuYV+gfAB/tveVhalinwKkIacm8OrpBJKPICib3yMJOJ7UZvvecOX9QLlV+KOWFAog48dzHn7emr80DSmoMU8avG3CpjUq2vZUucnQQQLSaUW5OCGW+LU2DMxp1D9ZycMDDL9kv2jLZfTePl+TLuVX8n9b9wG3LUR7Dz3ijBUVrRx/7oqPyoA10NRNkqSAQiOO94p+fF2Riyw1GvFgXK5ZXTFK2D+NbtZrDHDOarZXcTCwfqy6GbjLNSMZJ8pvcJPFFCKNG2gU5qc4MMo4Hy8LVe7gX6D1jxXLE1OGHh/pAJ0B2oJhkKdH1ml9tuBbj5umkPStgiyZb25NIhbJEPt7BIxG5IEVfW7J1odVORpwETzFAgprskXO5Z0MDPchxBpf1ZnOw3/1zRaAoX5qy5U4v22Rcu5C2FEQCWmfLC1E8g6ubItUzGInGJ+Vtpqh3maVWrMN6Qms0TGWnN7bk1TLeq6u55RG1jNeDWs
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230001)(4636009)(84040400005)(40470700004)(36840700001)(46966006)(966005)(81166007)(36860700001)(55016003)(2906002)(508600001)(40460700003)(186003)(26005)(5660300002)(356005)(336012)(70206006)(52536014)(82310400004)(53546011)(9686003)(47076005)(83380400001)(316002)(86362001)(110136005)(8676002)(8936002)(7696005)(70586007)(33656002)(6506007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 21:14:57.2120 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca7bf83-db95-4709-2ad0-08d9ecda63ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6045
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

SGkgQnJhZCwNCg0KVGhhbmtzIGZvciB5b3VyIGhlbHAuIEkgaGF2ZSBzdWJtaXR0ZWQgYSBjaGFu
Z2UgdG8gYWRkIGFybSBpbiAvamVua2lucy91c2VyaWQtdmFsaWRhdGlvbg0KaHR0cHM6Ly9nZXJy
aXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMvb3BlbmJtYy1idWlsZC1zY3JpcHRzLysv
NTExMjUNCg0KR2lsYmVydA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQnJh
ZCBCaXNob3AgPGJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbT4NClNlbnQ6IFRodXJzZGF5LCBG
ZWJydWFyeSAxMCwgMjAyMiA3OjUwIFBNDQpUbzogR2lsYmVydCBDaGVuIDxHaWxiZXJ0LkNoZW5A
YXJtLmNvbT47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6IHJlcXVlc3Qg
dG8gYWRkIEdpbGJlcnQgQ2hlbiB0byBDTEEgcmVwb3NpdG9yeSBBQ0wNCg0KT24gVGh1LCAyMDIy
LTAyLTEwIGF0IDEyOjUyICswMDAwLCBHaWxiZXJ0IENoZW4gd3JvdGU6DQo+IEhpLA0KPg0KPiBD
YW4geW91IGhlbHAgYWRkIG1lIHRvIGFwcHJvcHJpYXRlIENMQSByZXBvc2l0b3J5IEFDTCBzaW5j
ZSBJIHdhbnQgdG8NCj4gc3VibWl0IGNvZGUgY2hhbmdlcyB0byBnZXJyaXQgYnV0IHRoZSBnZXJy
aXQgc2hvd3MgIk9wZW5CTUMgQ0kgLSBVc2VyDQo+IG5vdCBhcHByb3ZlZCwgc2VlIGFkbWluLCBu
byBDSSIuDQo+DQo+IEkgaGF2ZSBiZWVuIGFkZGVkIGluIEFSTSBDQ0xBLg0KPiBodHRwczovL2Ry
aXZlLmdvb2dsZS5jb20vZmlsZS9kLzFpMFNrZkx2UjlfbG9SVFowelptQzZMX3NET1p5UWpaQi92
aWV3DQo+DQo+IFRoYW5rcywNCj4gR2lsYmVydA0KDQpIaSBHaWxiZXJ0DQoNCkkgY3JlYXRlZCBh
cm0vY2ktYXV0aG9yaXplZCBhbmQgYXJtL2NpLWF1dGhvcml6ZWQtb3duZXJzIGdyb3VwcyBvbiBH
ZXJyaXQuICBJIHB1dCBTYW1lciBpbiBhcm0vY2ktYXV0aG9yaXplZC1vd25lcnMgc28gaGUgc2hv
dWxkIGJlIGFibGUgdG8gYWRkIGFkZGl0aW9uYWwgcGVvcGxlIHRvIGFybS9jaS1hdXRob3JpemVk
IGluIHRoZSBmdXR1cmUuDQoNCkJlZm9yZSBDSSB3aWxsIHVzZSB0aGVzZSBncm91cHMgdGhvdWdo
LCB5b3UnbGwgaGF2ZSB0byBzdWJtaXQgYSBjaGFuZ2Ugc2ltaWxhciB0byB0aGlzIG9uZToNCg0K
aHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMvb3BlbmJtYy1idWls
ZC1zY3JpcHRzLysvNDYwOTMNCklNUE9SVEFOVCBOT1RJQ0U6IFRoZSBjb250ZW50cyBvZiB0aGlz
IGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGNvbmZpZGVudGlhbCBhbmQgbWF5IGFsc28g
YmUgcHJpdmlsZWdlZC4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxl
YXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IGFuZCBkbyBub3QgZGlzY2xvc2UgdGhl
IGNvbnRlbnRzIHRvIGFueSBvdGhlciBwZXJzb24sIHVzZSBpdCBmb3IgYW55IHB1cnBvc2UsIG9y
IHN0b3JlIG9yIGNvcHkgdGhlIGluZm9ybWF0aW9uIGluIGFueSBtZWRpdW0uIFRoYW5rIHlvdS4N
Cg==
