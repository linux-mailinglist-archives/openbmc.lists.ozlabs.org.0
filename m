Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE13285983
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 09:27:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5mBd04MSzDqDd
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 18:27:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.254.97;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=RKZw3DZO; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-oln040092254097.outbound.protection.outlook.com [40.92.254.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5m9m3bJwzDqDC
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 18:26:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEstWkm1ALhANAO1nZ3qnIhuf9CijksIaqcrUUtPM+41hlFWYjvGQK/Gtxjo1fUz5t913kBBwHe5CVigoUzex/h8KELqS0L0DPnDJcr2Y5cFB2ntEqb49o6wXto6+p8T3sRhVJ9hYcr4dyYXtqFDZ9MgbbN7JJIWFhFCjuNpyX84zpR49PvPxEY3NWw1VN9eowjFNRkR0YRkUtQyNoAKk5HPMEQaAaPeuBUjVi2LOgMOX0o/bYPN6twMstfJrv5MAmGRyxXEQXUTnsurmCknjWkW5j7Kv/Og2a3M7q/r6QwfPhO4g4XED2SSVX4o+m8K4vvR0cAzhglD84t6Brn+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+HZjp9lP/heoER1NKWA//ReAKUAvZjf4FK8EcWoPtw=;
 b=Jkjx07qjReG6PZBY7PIAy9l4DVGThlKh2lQD5c1jisos6LpvOmqY3kULplTYrFlxekXCwKs01V1qazkaCUflBclG3J5+OH7MsqRtU/cnGr0SqOrH7dE7GNkWQIIkWweWMRNOgQP1/ebFmGbqYaCUeFbouI1eh3dZHe/wcygSESaOB54D94ThPY+Yv8tNWQFj7++xHnu87aLjH5Hv/b2QbMHZzpIKgtt+ce6I3bNeRCAMQFaUi2rgu7LeXmqANWEjcRtilTaVaDhXf5y0dyBcZXi9N3jUtMJC4U6BhAH495c+CoWcuzhrpBS/QPFKNKSzpE+82Chyivjg+ANLTUe2NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+HZjp9lP/heoER1NKWA//ReAKUAvZjf4FK8EcWoPtw=;
 b=RKZw3DZORLckotov57ZFe2ETkRE7lUGFKSP7wBttGBoZ7AJcqJTA/SPMQI68BYav60gZfSDCkbhGBxcGDUBIFMhnU0wJJz72+vCDemIB9mNURUgtlGS9ZNHyG5vGF6Jpt65w3nYhA904qkeifNrvwohJKRBoC+H1+vwEplwvlOiEWY176mNcp5FzOZkI+Zet+0vvtzNwFOsss80m2CZCiEKacUaapD99S52bkP+Ykhw5zjzpbdrRY2KhANYdi40ib+rExszzByXvVR0HenI5zJ9PWgS9smaOnN56QPXQtldO79ytUm10fKKiYSdLOxQL+r7G5E0ovY8kWXBEk/yvKQ==
Received: from HK2APC01FT018.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::40) by
 HK2APC01HT062.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::327)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Wed, 7 Oct
 2020 07:26:32 +0000
Received: from HK0PR04MB2883.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebc::4e) by HK2APC01FT018.mail.protection.outlook.com
 (2a01:111:e400:7ebc::183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34 via Frontend
 Transport; Wed, 7 Oct 2020 07:26:32 +0000
Received: from HK0PR04MB2883.apcprd04.prod.outlook.com
 ([fe80::5c81:1d05:59a:3639]) by HK0PR04MB2883.apcprd04.prod.outlook.com
 ([fe80::5c81:1d05:59a:3639%4]) with mapi id 15.20.3433.045; Wed, 7 Oct 2020
 07:26:32 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: About intel-ipmi-oem compilation error
Thread-Topic: About intel-ipmi-oem compilation error
Thread-Index: AQHWnHl7bgU2geH6H065g7YewPDK2w==
Date: Wed, 7 Oct 2020 07:26:32 +0000
Message-ID: <HK0PR04MB2883FCE193E758A89410FF3DFE0A0@HK0PR04MB2883.apcprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:C85846B3A04A624F6EC17CD44183FB18CC90926EFEC4F45E565C0BA5797DD63B;
 UpperCasedChecksum:CA5BD4D326837F2C425A10853C17FF931E3A52B2C0A977BB10E10D1AEF0BE24C;
 SizeAsReceived:6694; Count:42
x-tmn: [HU+BWafrP68qz3ELTBt+g9653lxLs7Wn]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 6ba52adf-f091-4046-109f-08d86a92507c
x-ms-traffictypediagnostic: HK2APC01HT062:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mp7rZUuzcpU31ibeud/UuGPvS3j5MqoS7Frzf7RuRSKafnyGZ9aZxZdUdYo6H+9ODJPY5khtFuS6DTHc1dCyQ55NV6i9WgHOcQxMV5vFAAaeLvIVyPMc+6W3ncIOKAdpyi8eIJVCBLYMPUJaRf3QCDjdUGJ7tdk6ffErED9ZkBFj/zfq6b5AXagyVj81AZFc7i6Z/PXjqYfXEvLQlcyn0X0DdFI54vH4J54WAIKc2wT+PasHxggI3HKYqsjqs+YI
x-ms-exchange-antispam-messagedata: 5Pu2JZhwVkmkl/uBzELmwlMp5134/qMMdDZCE7TJo1WktUXWy6CMRJ+BSNqpUZF3fowprNWw1uP5bnYaIOjKFYWNoNhwk/vNulpbAwdqOA9vy6hXRteu6EuqKK0O0NB6E5hgpMgXU6FIrnziDf7orA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB2883FCE193E758A89410FF3DFE0A0HK0PR04MB2883apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT018.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba52adf-f091-4046-109f-08d86a92507c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 07:26:32.0243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT062
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

--_000_HK0PR04MB2883FCE193E758A89410FF3DFE0A0HK0PR04MB2883apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGVsbG8gZXZlcnlvbmUsDQoNCiAgICAgIEkgZG93bmxvYWRlZCBpbnRlbC1pcG1pLW9lbSBmcm9t
IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2ludGVsLWlwbWktb2VtLCBhbmQgZW5jb3VudGVy
ZWQgdGhlIGZvbGxvd2luZyAyIHByb2JsZW1zIHdoZW4gY29tcGlsaW5nLiBUaGUgZmlyc3QgcHJv
YmxlbSBoYXMgYmVlbiBzb2x2ZWQsIGJ1dCBJIHRoaW5rIHRoZSBjb2RlIGRvd25sb2FkZWQgZnJv
bSB0aGUgY29tbXVuaXR5IHNob3VsZCBiZSBhYmxlIHRvIGNvbXBpbGUgYW5kIHBhc3MuIEkgd291
bGQgbGlrZSB0byBhc2sgaWYgdGhlcmUgaXMgc29tZXRoaW5nIHdyb25nIHdpdGggbXkgcHJvamVj
dCBjb25maWd1cmF0aW9uPw0KDQpRdWVzdGlvbjE6DQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gL2hv
bWUvaGFybGV5emhvdS9vcGVuYm1jL29wZW5ibWMvYnVpbGQvdG1wL3dvcmsvYXJtMTE3Nmp6cy1v
cGVuYm1jLWxpbnV4LWdudWVhYmkvaW50ZWwtaXBtaS1vZW0vMC4xK2dpdEFVVE9JTkMrZDc3NDg5
ZjE4ZS1yMC9naXQvaW5jbHVkZS9pcG1pX3RvX3JlZGZpc2hfaG9va3MuaHBwOjIwLA0KICAgICAg
ICAgICAgICAgICBmcm9tIC9ob21lL2hhcmxleXpob3Uvb3BlbmJtYy9vcGVuYm1jL2J1aWxkL3Rt
cC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL2ludGVsLWlwbWktb2VtLzAu
MStnaXRBVVRPSU5DK2Q3NzQ4OWYxOGUtcjAvZ2l0L3NyYy9zZW5zb3Jjb21tYW5kcy5jcHA6MjA6
DQovaG9tZS9oYXJsZXl6aG91L29wZW5ibWMvb3BlbmJtYy9idWlsZC90bXAvd29yay9hcm0xMTc2
anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9pbnRlbC1pcG1pLW9lbS8wLjErZ2l0QVVUT0lOQytk
Nzc0ODlmMThlLXIwL2dpdC9pbmNsdWRlL3N0b3JhZ2Vjb21tYW5kcy5ocHA6MTg6MTA6IGZhdGFs
IGVycm9yOiBwaG9zcGhvci1pcG1pLWhvc3Qvc2Vuc29yaGFuZGxlci5ocHA6IE5vIHN1Y2ggZmls
ZSBvciBkaXJlY3RvcnkNCiAgIDE4IHwgI2luY2x1ZGUgPHBob3NwaG9yLWlwbWktaG9zdC9zZW5z
b3JoYW5kbGVyLmhwcD4NCiAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4NCmNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuDQoNClF1ZXN0aW9uMjoNCi9o
b21lL2hhcmxleXpob3Uvb3BlbmJtYy9vcGVuYm1jL2J1aWxkL3RtcC93b3JrL2FybTExNzZqenMt
b3BlbmJtYy1saW51eC1nbnVlYWJpL2ludGVsLWlwbWktb2VtLzAuMStnaXRBVVRPSU5DK2Q3NzQ4
OWYxOGUtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vYXJtLW9wZW5ibWMtbGludXgt
Z251ZWFiaS9hcm0tb3BlbmJtYy1saW51eC1nbnVlYWJpLWcrKyAgLURCT09TVF9BTExfTk9fTElC
IC1EQk9PU1RfQVNJT19ESVNBQkxFX1RIUkVBRFMgLURCT09TVF9DT1JPVVRJTkVTX05PX0RFUFJF
Q0FUSU9OX1dBUk5JTkcgLURCT09TVF9FUlJPUl9DT0RFX0hFQURFUl9PTkxZIC1EQk9PU1RfTk9f
UlRUSSAtREJPT1NUX05PX1RZUEVJRCAtREJPT1NUX1NZU1RFTV9OT19ERVBSRUNBVEVEIC1EVVNJ
TkdfRU5USVRZX01BTkFHRVJfREVDT1JBVE9SUyAtRHppbnRlbG9lbWNtZHNfRVhQT1JUUyAtSS9o
b21lL2hhcmxleXpob3Uvb3BlbmJtYy9vcGVuYm1jL2J1aWxkL3RtcC93b3JrL2FybTExNzZqenMt
b3BlbmJtYy1saW51eC1nbnVlYWJpL2ludGVsLWlwbWktb2VtLzAuMStnaXRBVVRPSU5DK2Q3NzQ4
OWYxOGUtcjAvZ2l0L2luY2x1ZGUgLWlzeXN0ZW0gLiAtbWFybSAtbWNwdT1hcm0xMTc2anotcyAg
LS1zeXNyb290PS9ob21lL2hhcmxleXpob3Uvb3BlbmJtYy9vcGVuYm1jL2J1aWxkL3RtcC93b3Jr
L2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL2ludGVsLWlwbWktb2VtLzAuMStnaXRB
VVRPSU5DK2Q3NzQ4OWYxOGUtcjAvcmVjaXBlLXN5c3Jvb3QgIC1PMiAtcGlwZSAtZyAtZmVsaW1p
bmF0ZS11bnVzZWQtZGVidWctdHlwZXMgLWZtYWNyby1wcmVmaXgtbWFwPS9ob21lL2hhcmxleXpo
b3Uvb3BlbmJtYy9vcGVuYm1jL2J1aWxkL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51
eC1nbnVlYWJpL2ludGVsLWlwbWktb2VtLzAuMStnaXRBVVRPSU5DK2Q3NzQ4OWYxOGUtcjA9L3Vz
ci9zcmMvZGVidWcvaW50ZWwtaXBtaS1vZW0vMC4xK2dpdEFVVE9JTkMrZDc3NDg5ZjE4ZS1yMCAg
ICAgICAgICAgICAgICAgICAgICAtZmRlYnVnLXByZWZpeC1tYXA9L2hvbWUvaGFybGV5emhvdS9v
cGVuYm1jL29wZW5ibWMvYnVpbGQvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdu
dWVhYmkvaW50ZWwtaXBtaS1vZW0vMC4xK2dpdEFVVE9JTkMrZDc3NDg5ZjE4ZS1yMD0vdXNyL3Ny
Yy9kZWJ1Zy9pbnRlbC1pcG1pLW9lbS8wLjErZ2l0QVVUT0lOQytkNzc0ODlmMThlLXIwICAgICAg
ICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9oYXJsZXl6aG91L29wZW5i
bWMvb3BlbmJtYy9idWlsZC90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFi
aS9pbnRlbC1pcG1pLW9lbS8wLjErZ2l0QVVUT0lOQytkNzc0ODlmMThlLXIwL3JlY2lwZS1zeXNy
b290PSAgICAgICAgICAgICAgICAgICAgICAtZmRlYnVnLXByZWZpeC1tYXA9L2hvbWUvaGFybGV5
emhvdS9vcGVuYm1jL29wZW5ibWMvYnVpbGQvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxp
bnV4LWdudWVhYmkvaW50ZWwtaXBtaS1vZW0vMC4xK2dpdEFVVE9JTkMrZDc3NDg5ZjE4ZS1yMC9y
ZWNpcGUtc3lzcm9vdC1uYXRpdmU9ICAtZnZpc2liaWxpdHktaW5saW5lcy1oaWRkZW4gIC1tYXJt
IC1tY3B1PWFybTExNzZqei1zICAtLXN5c3Jvb3Q9L2hvbWUvaGFybGV5emhvdS9vcGVuYm1jL29w
ZW5ibWMvYnVpbGQvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvaW50
ZWwtaXBtaS1vZW0vMC4xK2dpdEFVVE9JTkMrZDc3NDg5ZjE4ZS1yMC9yZWNpcGUtc3lzcm9vdCAt
ZlBJQyAgIC1Xbm8tcHNhYmkgLXN0ZD1nbnUrKzE3IC1NRCAtTVQgQ01ha2VGaWxlcy96aW50ZWxv
ZW1jbWRzLmRpci9zcmMvc2Vuc29yY29tbWFuZHMuY3BwLm8gLU1GIENNYWtlRmlsZXMvemludGVs
b2VtY21kcy5kaXIvc3JjL3NlbnNvcmNvbW1hbmRzLmNwcC5vLmQgLW8gQ01ha2VGaWxlcy96aW50
ZWxvZW1jbWRzLmRpci9zcmMvc2Vuc29yY29tbWFuZHMuY3BwLm8gLWMgL2hvbWUvaGFybGV5emhv
dS9vcGVuYm1jL29wZW5ibWMvYnVpbGQvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4
LWdudWVhYmkvaW50ZWwtaXBtaS1vZW0vMC4xK2dpdEFVVE9JTkMrZDc3NDg5ZjE4ZS1yMC9naXQv
c3JjL3NlbnNvcmNvbW1hbmRzLmNwcA0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC9ob21lL2hhcmxl
eXpob3Uvb3BlbmJtYy9vcGVuYm1jL2J1aWxkL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1s
aW51eC1nbnVlYWJpL2ludGVsLWlwbWktb2VtLzAuMStnaXRBVVRPSU5DK2Q3NzQ4OWYxOGUtcjAv
Z2l0L3NyYy9zZW5zb3Jjb21tYW5kcy5jcHA6MTc6DQovaG9tZS9oYXJsZXl6aG91L29wZW5ibWMv
b3BlbmJtYy9idWlsZC90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9p
bnRlbC1pcG1pLW9lbS8wLjErZ2l0QVVUT0lOQytkNzc0ODlmMThlLXIwL2dpdC9pbmNsdWRlL3Nl
bnNvcmNvbW1hbmRzLmhwcDogSW4gZnVuY3Rpb24gJ2lwbWlfcmV0X3QgaXBtaTo6Z2V0U2Vuc29y
Q29ubmVjdGlvbihpcG1pOjpDb250ZXh0OjpwdHIsIHVpbnQ4X3QsIHN0ZDo6c3RyaW5nJiwgc3Rk
OjpzdHJpbmcmKSc6DQovaG9tZS9oYXJsZXl6aG91L29wZW5ibWMvb3BlbmJtYy9idWlsZC90bXAv
d29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9pbnRlbC1pcG1pLW9lbS8wLjEr
Z2l0QVVUT0lOQytkNzc0ODlmMThlLXIwL2dpdC9pbmNsdWRlL3NlbnNvcmNvbW1hbmRzLmhwcDox
Mzg6NDI6IGVycm9yOiAndXNpbmcgZWxlbWVudF90eXBlID0gc3RydWN0IGlwbWk6OkNvbnRleHQn
IHtha2EgJ3N0cnVjdCBpcG1pOjpDb250ZXh0J30gaGFzIG5vIG1lbWJlciBuYW1lZCAnbHVuJw0K
ICAxMzggfCAgICAgcGF0aCA9IGdldFBhdGhGcm9tU2Vuc29yTnVtYmVyKChjdHgtPmx1biA8PCA4
KSB8IHNlbnNudW0pOw0KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF5+fg0KL2hvbWUvaGFybGV5emhvdS9vcGVuYm1jL29wZW5ibWMvYnVpbGQvdG1wL3dv
cmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvaW50ZWwtaXBtaS1vZW0vMC4xK2dp
dEFVVE9JTkMrZDc3NDg5ZjE4ZS1yMC9naXQvc3JjL3NlbnNvcmNvbW1hbmRzLmNwcDogSW4gZnVu
Y3Rpb24gJ2lwbWk6OlJzcFR5cGU8dW5zaWduZWQgY2hhciwgdW5zaWduZWQgY2hhciwgdW5zaWdu
ZWQgaW50PiBpcG1pOjppcG1pU2Vuc29yR2V0RGV2aWNlU2RySW5mbyhpcG1pOjpDb250ZXh0Ojpw
dHIsIHN0ZDo6b3B0aW9uYWw8dW5zaWduZWQgY2hhcj4pJzoNCi9ob21lL2hhcmxleXpob3Uvb3Bl
bmJtYy9vcGVuYm1jL2J1aWxkL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVl
YWJpL2ludGVsLWlwbWktb2VtLzAuMStnaXRBVVRPSU5DK2Q3NzQ4OWYxOGUtcjAvZ2l0L3NyYy9z
ZW5zb3Jjb21tYW5kcy5jcHA6MTQzODoyNjogZXJyb3I6ICd1c2luZyBlbGVtZW50X3R5cGUgPSBz
dHJ1Y3QgaXBtaTo6Q29udGV4dCcge2FrYSAnc3RydWN0IGlwbWk6OkNvbnRleHQnfSBoYXMgbm8g
bWVtYmVyIG5hbWVkICdsdW4nDQogMTQzOCB8ICAgICAgICAgICAgICAgICBpZiAoY3R4LT5sdW4g
PT0gcmVjb3JkLT5rZXkub3duZXJfbHVuKQ0KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
ICAgXn5+DQovaG9tZS9oYXJsZXl6aG91L29wZW5ibWMvb3BlbmJtYy9idWlsZC90bXAvd29yay9h
cm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9pbnRlbC1pcG1pLW9lbS8wLjErZ2l0QVVU
T0lOQytkNzc0ODlmMThlLXIwL2dpdC9zcmMvc2Vuc29yY29tbWFuZHMuY3BwOjE0NDg6MTk6IGVy
cm9yOiAndXNpbmcgZWxlbWVudF90eXBlID0gc3RydWN0IGlwbWk6OkNvbnRleHQnIHtha2EgJ3N0
cnVjdCBpcG1pOjpDb250ZXh0J30gaGFzIG5vIG1lbWJlciBuYW1lZCAnbHVuJw0KIDE0NDggfCAg
ICAgICAgIGlmICgoY3R4LT5sdW4gPT0gMCkgJiYgKG51bVNlbnNvcnMgPiAwKSkNCiAgICAgIHwg
ICAgICAgICAgICAgICAgICAgXn5+DQovaG9tZS9oYXJsZXl6aG91L29wZW5ibWMvb3BlbmJtYy9i
dWlsZC90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9pbnRlbC1pcG1p
LW9lbS8wLjErZ2l0QVVUT0lOQytkNzc0ODlmMThlLXIwL2dpdC9zcmMvc2Vuc29yY29tbWFuZHMu
Y3BwOjE0NTM6MjQ6IGVycm9yOiAndXNpbmcgZWxlbWVudF90eXBlID0gc3RydWN0IGlwbWk6OkNv
bnRleHQnIHtha2EgJ3N0cnVjdCBpcG1pOjpDb250ZXh0J30gaGFzIG5vIG1lbWJlciBuYW1lZCAn
bHVuJw0KIDE0NTMgfCAgICAgICAgIGVsc2UgaWYgKChjdHgtPmx1biA9PSAxKSAmJiAobnVtU2Vu
c29ycyA+IG1heFNlbnNvcnNQZXJMVU4pKQ0KICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAg
IF5+fg0KL2hvbWUvaGFybGV5emhvdS9vcGVuYm1jL29wZW5ibWMvYnVpbGQvdG1wL3dvcmsvYXJt
MTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvaW50ZWwtaXBtaS1vZW0vMC4xK2dpdEFVVE9J
TkMrZDc3NDg5ZjE4ZS1yMC9naXQvc3JjL3NlbnNvcmNvbW1hbmRzLmNwcDoxNDU5OjIzOiBlcnJv
cjogJ3VzaW5nIGVsZW1lbnRfdHlwZSA9IHN0cnVjdCBpcG1pOjpDb250ZXh0JyB7YWthICdzdHJ1
Y3QgaXBtaTo6Q29udGV4dCd9IGhhcyBubyBtZW1iZXIgbmFtZWQgJ2x1bicNCiAxNDU5IHwgICAg
ICAgICBlbHNlIGlmIChjdHgtPmx1biA9PSAzKQ0KICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgXn5+DQoNCg0K

--_000_HK0PR04MB2883FCE193E758A89410FF3DFE0A0HK0PR04MB2883apcp_
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
Hello everyone,&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp; &nbsp; I downloaded intel-ipmi-oem from https://github.com/op=
enbmc/intel-ipmi-oem, and encountered the following 2 problems when compili=
ng. The first problem has been solved, but I think the code downloaded from=
 the community should be able to compile and pass.
 I would like to ask if there is something wrong with my project configurat=
ion?<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Question1:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
In file included from /home/harleyzhou/openbmc/openbmc/build/tmp/work/arm11=
76jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git=
/include/ipmi_to_redfish_hooks.hpp:20,
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /ho=
me/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnuea=
bi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/src/sensorcommands.cpp:2=
0:</div>
<div>/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-lin=
ux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-<span style=3D"color: r=
gb(81, 167, 249);">r0/git/include/storagecommands.hpp:18:10: fatal error: p=
hosphor-ipmi-host/sensorhandler.hpp:
 No such file or directory</span></div>
<div><span style=3D"color: rgb(81, 167, 249);">&nbsp; &nbsp;18 | #include &=
lt;phosphor-ipmi-host/sensorhandler.hpp&gt;</span></div>
<div><span style=3D"color: rgb(81, 167, 249);">&nbsp; &nbsp; &nbsp; | &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</span><=
/div>
<div><span style=3D"color: rgb(81, 167, 249);">compilation terminated.</spa=
n></div>
<br>
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif; background-color: rgb(255, 255, 255); display: inline !i=
mportant">Question2:</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif; background-color: rgb(255, 255, 255); display: inline !i=
mportant">/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbm=
c-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/recipe-sysroot-=
native/usr/bin/arm-openbmc-linux-gnueabi/arm-openbmc-linux-gnueabi-g++
 &nbsp;-DBOOST_ALL_NO_LIB -DBOOST_ASIO_DISABLE_THREADS -DBOOST_COROUTINES_N=
O_DEPRECATION_WARNING -DBOOST_ERROR_CODE_HEADER_ONLY -DBOOST_NO_RTTI -DBOOS=
T_NO_TYPEID -DBOOST_SYSTEM_NO_DEPRECATED -DUSING_ENTITY_MANAGER_DECORATORS =
-Dzinteloemcmds_EXPORTS -I/home/harleyzhou/openbmc/openbmc/build/tmp/work/a=
rm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0=
/git/include
 -isystem . -marm -mcpu=3Darm1176jz-s &nbsp;--sysroot=3D/home/harleyzhou/op=
enbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oe=
m/0.1+gitAUTOINC+d77489f18e-r0/recipe-sysroot &nbsp;-O2 -pipe -g -feliminat=
e-unused-debug-types -fmacro-prefix-map=3D/home/harleyzhou/openbmc/openbmc/=
build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOI=
NC+d77489f18e-r0=3D/usr/src/debug/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-=
r0
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;-fdebug-prefix-map=3D/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1=
176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0=3D=
/usr/src/debug/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0 &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-fdebug-prefix-=
map=3D/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-li=
nux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/recipe-sysroot=3D
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;-fdebug-prefix-map=3D/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1=
176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/re=
cipe-sysroot-native=3D &nbsp;-fvisibility-inlines-hidden &nbsp;-marm -mcpu=
=3Darm1176jz-s &nbsp;--sysroot=3D/home/harleyzhou/openbmc/openbmc/build/tmp=
/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489=
f18e-r0/recipe-sysroot
 -fPIC &nbsp; -Wno-psabi -std=3Dgnu++17 -MD -MT CMakeFiles/zinteloemcmds.di=
r/src/sensorcommands.cpp.o -MF CMakeFiles/zinteloemcmds.dir/src/sensorcomma=
nds.cpp.o.d -o CMakeFiles/zinteloemcmds.dir/src/sensorcommands.cpp.o -c /ho=
me/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnuea=
bi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/src/sensorcommands.cpp
<div>In file included from /home/harleyzhou/openbmc/openbmc/build/tmp/work/=
arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r=
0/git/src/sensorcommands.cpp:17:</div>
<div>/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-lin=
ux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/include/sensorco=
mmands.hpp: In function 'ipmi_ret_t ipmi::getSensorConnection(ipmi::Context=
::ptr, uint8_t, std::string&amp;, std::string&amp;)':</div>
<div><span style=3D"color: rgb(81, 167, 249);">/home/harleyzhou/openbmc/ope=
nbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+git=
AUTOINC+d77489f18e-r0/git/include/sensorcommands.hpp:138:42: error: 'using =
element_type =3D struct ipmi::Context'
 {aka 'struct ipmi::Context'} has no member named 'lun'</span></div>
<div><span style=3D"color: rgb(81, 167, 249);">&nbsp; 138 | &nbsp; &nbsp; p=
ath =3D getPathFromSensorNumber((ctx-&gt;lun &lt;&lt; 8) | sensnum);</span>=
</div>
<div><span style=3D"color: rgb(81, 167, 249);">&nbsp; &nbsp; &nbsp; | &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^~~</span=
></div>
<div><span style=3D"color: rgb(81, 167, 249);">/home/harleyzhou/openbmc/ope=
nbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+git=
AUTOINC+d77489f18e-r0/git/src/sensorcommands.cpp: In function 'ipmi::RspTyp=
e&lt;unsigned char, unsigned char, unsigned
 int&gt; ipmi::ipmiSensorGetDeviceSdrInfo(ipmi::Context::ptr, std::optional=
&lt;unsigned char&gt;)':</span></div>
<div><span style=3D"color: rgb(81, 167, 249);">/home/harleyzhou/openbmc/ope=
nbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+git=
AUTOINC+d77489f18e-r0/git/src/sensorcommands.cpp:1438:26: error: 'using ele=
ment_type =3D struct ipmi::Context'
 {aka 'struct ipmi::Context'} has no member named 'lun'</span></div>
<div><span style=3D"color: rgb(81, 167, 249);">&nbsp;1438 | &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (ctx-&gt;lun =3D=3D record-&gt;=
key.owner_lun)</span></div>
<div><span style=3D"color: rgb(81, 167, 249);">&nbsp; &nbsp; &nbsp; | &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;^~~</span></div>
<div><span style=3D"color: rgb(81, 167, 249);">/home/harleyzhou/openbmc/ope=
nbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+git=
AUTOINC+d77489f18e-r0/git/src/sensorcommands.cpp:1448:19: error: 'using ele=
ment_type =3D struct ipmi::Context'
 {aka 'struct ipmi::Context'} has no member named 'lun'</span></div>
<div><span style=3D"color: rgb(81, 167, 249);">&nbsp;1448 | &nbsp; &nbsp; &=
nbsp; &nbsp; if ((ctx-&gt;lun =3D=3D 0) &amp;&amp; (numSensors &gt; 0))</sp=
an></div>
<div><span style=3D"color: rgb(81, 167, 249);">&nbsp; &nbsp; &nbsp; | &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^~~</span></div>
<div><span style=3D"color: rgb(81, 167, 249);">/home/harleyzhou/openbmc/ope=
nbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+git=
AUTOINC+d77489f18e-r0/git/src/sensorcommands.cpp:1453:24: error: 'using ele=
ment_type =3D struct ipmi::Context'
 {aka 'struct ipmi::Context'} has no member named 'lun'</span></div>
<div><span style=3D"color: rgb(81, 167, 249);">&nbsp;1453 | &nbsp; &nbsp; &=
nbsp; &nbsp; else if ((ctx-&gt;lun =3D=3D 1) &amp;&amp; (numSensors &gt; ma=
xSensorsPerLUN))</span></div>
<div><span style=3D"color: rgb(81, 167, 249);">&nbsp; &nbsp; &nbsp; | &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;^~~</span></div>
<div><span style=3D"color: rgb(81, 167, 249);">/home/harleyzhou/openbmc/ope=
nbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+git=
AUTOINC+d77489f18e-r0/git/src/sensorcommands.cpp:1459:23: error: 'using ele=
ment_type =3D struct ipmi::Context'
 {aka 'struct ipmi::Context'} has no member named 'lun'</span></div>
<div><span style=3D"color: rgb(81, 167, 249);">&nbsp;1459 | &nbsp; &nbsp; &=
nbsp; &nbsp; else if (ctx-&gt;lun =3D=3D 3)</span></div>
<div><span style=3D"color: rgb(81, 167, 249);">&nbsp; &nbsp; &nbsp; | &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^~~=
</span></div>
<br>
<br>
</span></div>
</body>
</html>

--_000_HK0PR04MB2883FCE193E758A89410FF3DFE0A0HK0PR04MB2883apcp_--
