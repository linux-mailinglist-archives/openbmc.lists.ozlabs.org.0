Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A71286CAE
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 04:19:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6FJc0fSgzDqRp
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 13:19:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.253.40;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=qsx+drac; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-oln040092253040.outbound.protection.outlook.com [40.92.253.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6FHr3TYXzDqRc
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 13:18:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCb7bLsKv7RXcEaDuPURKKvPkBRqgUxfDMeZZn23DQvZbuiom4mXlskwohO8nf4vVDLWniyYD3KM2C0jz2DJPJ9truXy4+wioUj9GqpUChJ3AnucJfy9+spLQQ2c0aarPfwBouPJMOO1ud/3DYbWQTp/5rqA7Yyi8WMUdsxmiI2ENHqmWChiyh543gKEBhs4pf/l4mpHhT875eC4RTIM/XxzXcg9ev4UXdeltJvheDdUzwR40g1/0PpbZhX+q4B+mVKdfpnVH7koP93thDO36qzCk+zTvufunWkndf25NokCgwgJvqNnamNKUo+Okxd1YIkOvYJq6ZpSch5+K4dOvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iyz9GAvq8K8wzixmupU3LRk6SLibiVptn0hbkXqFqPI=;
 b=E03VXKixAtWkHmxK7pSLhWfMyiHi3SzQcqCg8TSMn1yJp2GSa2Jhh4fuH4Cy+4ZOGFkiJL+EkUzdLAyHdlA8m6rWafv7MUVtY9RhbKnayCcS0d8yANa6BuGKEH9vXQ0T40eDxTo0JpvfjvJnEN43pzKjATL39Wse65X4q5e0sJjqcWnEzId6qE5/JMgIbuCp7HZ3wjqulUqvcLJYrP80pLGZ1CWflVSGEQPWYr51RTaPwNXu321oMmn6KYlDilEBug/ygObX0Hfx04ll1maSIrEUH+SeLfWpHiCNy/TxB6To+H7h5crHgbUUkk5NjwJiGw+bQOqd3pSzmbxUKBrktA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iyz9GAvq8K8wzixmupU3LRk6SLibiVptn0hbkXqFqPI=;
 b=qsx+dract5rsHw7v8QGVG5hoPuPYDwadYhzaz9cSu0YQB1K0KkjQziis5/M2PN5LmiYYsgJzXQ6R9Sxwm2lI/Dut4XLk76rmLTrGMT8mnNpVxYisKUPe0Yi+s9DGeeHldyBqS126UuvRXmaF8OLsbPB6KTFNgDiyb30ImydgGCCz0/xFC6Uv/gFfg3A5XgGL4yMan7vFlxQzT9yi7MsixJ64RuUAzyP1/GOt7e0uhzeQkIc3lFBH8UebSQe36nYI9Mrt6Fz3NdXauYHAOml725e7X5+8rFxyy03aWqamaPEd8XTLufGb0H1qMFVjdOGcmyvYPyYLClodcRg8ObIvSQ==
Received: from PU1APC01FT056.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::46) by
 PU1APC01HT186.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::424)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Thu, 8 Oct
 2020 02:18:41 +0000
Received: from HK0PR04MB2883.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebe::42) by PU1APC01FT056.mail.protection.outlook.com
 (2a01:111:e400:7ebe::354) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23 via Frontend
 Transport; Thu, 8 Oct 2020 02:18:41 +0000
Received: from HK0PR04MB2883.apcprd04.prod.outlook.com
 ([fe80::5c81:1d05:59a:3639]) by HK0PR04MB2883.apcprd04.prod.outlook.com
 ([fe80::5c81:1d05:59a:3639%4]) with mapi id 15.20.3433.046; Thu, 8 Oct 2020
 02:18:41 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: Anton Kachalov <rnouse@google.com>
Subject: =?gb2312?B?u9i4tDogQWJvdXQgaW50ZWwtaXBtaS1vZW0gY29tcGlsYXRpb24gZXJyb3I=?=
Thread-Topic: About intel-ipmi-oem compilation error
Thread-Index: AQHWnHl7bgU2geH6H065g7YewPDK26mMgdMAgAB3BcY=
Date: Thu, 8 Oct 2020 02:18:41 +0000
Message-ID: <HK0PR04MB2883592DF92473820AA33910FE0B0@HK0PR04MB2883.apcprd04.prod.outlook.com>
References: <HK0PR04MB2883FCE193E758A89410FF3DFE0A0@HK0PR04MB2883.apcprd04.prod.outlook.com>,
 <CADVsX8_C8eg2u-XKzU7xWJ7AHGznLZcJKWBb0dKOWctcwh=cwg@mail.gmail.com>
In-Reply-To: <CADVsX8_C8eg2u-XKzU7xWJ7AHGznLZcJKWBb0dKOWctcwh=cwg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:66CFC94FD420CB44E659E8E35C43BE5276F86C2455E93E096E3D449D58DDD750;
 UpperCasedChecksum:16FFE67B41C356FCACABB469A24E79B262505B00BED1D97213FA8864182E68DE;
 SizeAsReceived:7072; Count:44
x-tmn: [68JEJSM7qqBzUWnBAWoRmgQZYQ8htwdu]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 1f12a11b-30fe-4c3e-ac0a-08d86b30795f
x-ms-traffictypediagnostic: PU1APC01HT186:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1VGJZ2/Py+mZFqfst6RZ+7auhkfnXe9Q8xtK/iLpsEeauHGoDONTcoIOEnDvO2cLo5DYZW/fd4BKqA8hnAiJ2MK2OjH3P6qQjwynLJ/Zg2Gx2Mnn56JSgkqxEY6AXNxP91v487Ds7KxFmGlg7IMxABrk8ZrVzg0eKPktQiSMsH80z/ABTJnXJuK6FigW7sSHOG+dmmtB58aDDFBc8w9OvkPz7CUOYY9hwIsmaa1ketnaRVr+l7lhXS/0UFjzqAin
x-ms-exchange-antispam-messagedata: rVnVOEpunFc7V5DLgs7HltV8S6ZntcotBQmCBvcLC/M9JNG1KVA663lzsUY0KToo1MFoVOIMRMf5w/5henEJS+FEtfT+WuFSVAzsty7//6/6GPL8dA/E/to7hBOER+n0dzfKx5DY7RbUrMwfEj52+A==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB2883592DF92473820AA33910FE0B0HK0PR04MB2883apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT056.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f12a11b-30fe-4c3e-ac0a-08d86b30795f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2020 02:18:41.0271 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT186
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
Cc: "uperic@163.com" <uperic@163.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB2883592DF92473820AA33910FE0B0HK0PR04MB2883apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

VGhhbmsgeW91LCBJIHdpbGwgdXBkYXRlIHRoZSBlbnRpcmUgcHJvamVjdCBmaWxlIHRvIHRoZSBs
YXRlc3QgdmVyc2lvbi4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6
IEFudG9uIEthY2hhbG92IDxybm91c2VAZ29vZ2xlLmNvbT4NCreiy83KsbzkOiAyMDIwxOoxMNTC
OMjVIDM6MDkNCsrVvP7Iyzog1twg1LbH5SA8emhvdXl1YW5xaW5nOEBvdXRsb29rLmNvbT4NCrOt
y806IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPjsg
dXBlcmljQDE2My5jb20gPHVwZXJpY0AxNjMuY29tPg0K1vfM4jogUmU6IEFib3V0IGludGVsLWlw
bWktb2VtIGNvbXBpbGF0aW9uIGVycm9yDQoNCkhlbGxvLA0KDQpIb3cgb2xkIGlzIHlvdXIgb3Bl
bmJtYyBjaGVja291dCwgZXNwZWNpYWxseSB0aGUgcGhvc3Bob3ItaG9zdC1pcG1pZD8NCg0KVGhl
IHJlcXVlc3RlZCBmaWVsZCAibHVuIiBoYXMgYmVlbiBhZGRlZCB0aHJlZSBtb250aHMgYWdvOg0K
DQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1ob3N0LWlwbWlkL2NvbW1pdC9j
MTFjYzVjMDY5NjBkODA3YmMwZmViNjgwMzQ2YmY2ZjhlOWY4YWRiDQoNCkZyb20gdGhlIGJ1aWxk
IGxvZ3MgaXQgc2VlbXMgbGlrZSB0aGUgZXhpc3RpbmcgaGVhZGVycyBkb2Vzbid0IGluY2x1ZGUg
dGhpcyBmaWVsZC4NCg0KT24gV2VkLCA3IE9jdCAyMDIwIGF0IDA5OjI3LCDW3CDUtsflIDx6aG91
eXVhbnFpbmc4QG91dGxvb2suY29tPG1haWx0bzp6aG91eXVhbnFpbmc4QG91dGxvb2suY29tPj4g
d3JvdGU6DQpIZWxsbyBldmVyeW9uZSwNCg0KICAgICAgSSBkb3dubG9hZGVkIGludGVsLWlwbWkt
b2VtIGZyb20gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvaW50ZWwtaXBtaS1vZW0sIGFuZCBl
bmNvdW50ZXJlZCB0aGUgZm9sbG93aW5nIDIgcHJvYmxlbXMgd2hlbiBjb21waWxpbmcuIFRoZSBm
aXJzdCBwcm9ibGVtIGhhcyBiZWVuIHNvbHZlZCwgYnV0IEkgdGhpbmsgdGhlIGNvZGUgZG93bmxv
YWRlZCBmcm9tIHRoZSBjb21tdW5pdHkgc2hvdWxkIGJlIGFibGUgdG8gY29tcGlsZSBhbmQgcGFz
cy4gSSB3b3VsZCBsaWtlIHRvIGFzayBpZiB0aGVyZSBpcyBzb21ldGhpbmcgd3Jvbmcgd2l0aCBt
eSBwcm9qZWN0IGNvbmZpZ3VyYXRpb24/DQoNClF1ZXN0aW9uMToNCkluIGZpbGUgaW5jbHVkZWQg
ZnJvbSAvaG9tZS9oYXJsZXl6aG91L29wZW5ibWMvb3BlbmJtYy9idWlsZC90bXAvd29yay9hcm0x
MTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9pbnRlbC1pcG1pLW9lbS8wLjErZ2l0QVVUT0lO
QytkNzc0ODlmMThlLXIwL2dpdC9pbmNsdWRlL2lwbWlfdG9fcmVkZmlzaF9ob29rcy5ocHA6MjAs
DQogICAgICAgICAgICAgICAgIGZyb20gL2hvbWUvaGFybGV5emhvdS9vcGVuYm1jL29wZW5ibWMv
YnVpbGQvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvaW50ZWwtaXBt
aS1vZW0vMC4xK2dpdEFVVE9JTkMrZDc3NDg5ZjE4ZS1yMC9naXQvc3JjL3NlbnNvcmNvbW1hbmRz
LmNwcDoyMDoNCi9ob21lL2hhcmxleXpob3Uvb3BlbmJtYy9vcGVuYm1jL2J1aWxkL3RtcC93b3Jr
L2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL2ludGVsLWlwbWktb2VtLzAuMStnaXRB
VVRPSU5DK2Q3NzQ4OWYxOGUtcjAvZ2l0L2luY2x1ZGUvc3RvcmFnZWNvbW1hbmRzLmhwcDoxODox
MDogZmF0YWwgZXJyb3I6IHBob3NwaG9yLWlwbWktaG9zdC9zZW5zb3JoYW5kbGVyLmhwcDogTm8g
c3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0KICAgMTggfCAjaW5jbHVkZSA8cGhvc3Bob3ItaXBtaS1o
b3N0L3NlbnNvcmhhbmRsZXIuaHBwPg0KICAgICAgfCAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KY29tcGlsYXRpb24gdGVybWluYXRlZC4NCg0KUXVlc3Rp
b24yOg0KL2hvbWUvaGFybGV5emhvdS9vcGVuYm1jL29wZW5ibWMvYnVpbGQvdG1wL3dvcmsvYXJt
MTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvaW50ZWwtaXBtaS1vZW0vMC4xK2dpdEFVVE9J
TkMrZDc3NDg5ZjE4ZS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9hcm0tb3BlbmJt
Yy1saW51eC1nbnVlYWJpL2FybS1vcGVuYm1jLWxpbnV4LWdudWVhYmktZysrICAtREJPT1NUX0FM
TF9OT19MSUIgLURCT09TVF9BU0lPX0RJU0FCTEVfVEhSRUFEUyAtREJPT1NUX0NPUk9VVElORVNf
Tk9fREVQUkVDQVRJT05fV0FSTklORyAtREJPT1NUX0VSUk9SX0NPREVfSEVBREVSX09OTFkgLURC
T09TVF9OT19SVFRJIC1EQk9PU1RfTk9fVFlQRUlEIC1EQk9PU1RfU1lTVEVNX05PX0RFUFJFQ0FU
RUQgLURVU0lOR19FTlRJVFlfTUFOQUdFUl9ERUNPUkFUT1JTIC1EemludGVsb2VtY21kc19FWFBP
UlRTIC1JL2hvbWUvaGFybGV5emhvdS9vcGVuYm1jL29wZW5ibWMvYnVpbGQvdG1wL3dvcmsvYXJt
MTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvaW50ZWwtaXBtaS1vZW0vMC4xK2dpdEFVVE9J
TkMrZDc3NDg5ZjE4ZS1yMC9naXQvaW5jbHVkZSAtaXN5c3RlbSAuIC1tYXJtIC1tY3B1PWFybTEx
NzZqei1zICAtLXN5c3Jvb3Q9L2hvbWUvaGFybGV5emhvdS9vcGVuYm1jL29wZW5ibWMvYnVpbGQv
dG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxpbnV4LWdudWVhYmkvaW50ZWwtaXBtaS1vZW0v
MC4xK2dpdEFVVE9JTkMrZDc3NDg5ZjE4ZS1yMC9yZWNpcGUtc3lzcm9vdCAgLU8yIC1waXBlIC1n
IC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZm1hY3JvLXByZWZpeC1tYXA9L2hvbWUv
aGFybGV5emhvdS9vcGVuYm1jL29wZW5ibWMvYnVpbGQvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVu
Ym1jLWxpbnV4LWdudWVhYmkvaW50ZWwtaXBtaS1vZW0vMC4xK2dpdEFVVE9JTkMrZDc3NDg5ZjE4
ZS1yMD0vdXNyL3NyYy9kZWJ1Zy9pbnRlbC1pcG1pLW9lbS8wLjErZ2l0QVVUT0lOQytkNzc0ODlm
MThlLXIwICAgICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9oYXJs
ZXl6aG91L29wZW5ibWMvb3BlbmJtYy9idWlsZC90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMt
bGludXgtZ251ZWFiaS9pbnRlbC1pcG1pLW9lbS8wLjErZ2l0QVVUT0lOQytkNzc0ODlmMThlLXIw
PS91c3Ivc3JjL2RlYnVnL2ludGVsLWlwbWktb2VtLzAuMStnaXRBVVRPSU5DK2Q3NzQ4OWYxOGUt
cjAgICAgICAgICAgICAgICAgICAgICAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL2hhcmxleXpo
b3Uvb3BlbmJtYy9vcGVuYm1jL2J1aWxkL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51
eC1nbnVlYWJpL2ludGVsLWlwbWktb2VtLzAuMStnaXRBVVRPSU5DK2Q3NzQ4OWYxOGUtcjAvcmVj
aXBlLXN5c3Jvb3Q9ICAgICAgICAgICAgICAgICAgICAgIC1mZGVidWctcHJlZml4LW1hcD0vaG9t
ZS9oYXJsZXl6aG91L29wZW5ibWMvb3BlbmJtYy9idWlsZC90bXAvd29yay9hcm0xMTc2anpzLW9w
ZW5ibWMtbGludXgtZ251ZWFiaS9pbnRlbC1pcG1pLW9lbS8wLjErZ2l0QVVUT0lOQytkNzc0ODlm
MThlLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZT0gIC1mdmlzaWJpbGl0eS1pbmxpbmVzLWhpZGRl
biAgLW1hcm0gLW1jcHU9YXJtMTE3Nmp6LXMgIC0tc3lzcm9vdD0vaG9tZS9oYXJsZXl6aG91L29w
ZW5ibWMvb3BlbmJtYy9idWlsZC90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251
ZWFiaS9pbnRlbC1pcG1pLW9lbS8wLjErZ2l0QVVUT0lOQytkNzc0ODlmMThlLXIwL3JlY2lwZS1z
eXNyb290IC1mUElDICAgLVduby1wc2FiaSAtc3RkPWdudSsrMTcgLU1EIC1NVCBDTWFrZUZpbGVz
L3ppbnRlbG9lbWNtZHMuZGlyL3NyYy9zZW5zb3Jjb21tYW5kcy5jcHAubyAtTUYgQ01ha2VGaWxl
cy96aW50ZWxvZW1jbWRzLmRpci9zcmMvc2Vuc29yY29tbWFuZHMuY3BwLm8uZCAtbyBDTWFrZUZp
bGVzL3ppbnRlbG9lbWNtZHMuZGlyL3NyYy9zZW5zb3Jjb21tYW5kcy5jcHAubyAtYyAvaG9tZS9o
YXJsZXl6aG91L29wZW5ibWMvb3BlbmJtYy9idWlsZC90bXAvd29yay9hcm0xMTc2anpzLW9wZW5i
bWMtbGludXgtZ251ZWFiaS9pbnRlbC1pcG1pLW9lbS8wLjErZ2l0QVVUT0lOQytkNzc0ODlmMThl
LXIwL2dpdC9zcmMvc2Vuc29yY29tbWFuZHMuY3BwDQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gL2hv
bWUvaGFybGV5emhvdS9vcGVuYm1jL29wZW5ibWMvYnVpbGQvdG1wL3dvcmsvYXJtMTE3Nmp6cy1v
cGVuYm1jLWxpbnV4LWdudWVhYmkvaW50ZWwtaXBtaS1vZW0vMC4xK2dpdEFVVE9JTkMrZDc3NDg5
ZjE4ZS1yMC9naXQvc3JjL3NlbnNvcmNvbW1hbmRzLmNwcDoxNzoNCi9ob21lL2hhcmxleXpob3Uv
b3BlbmJtYy9vcGVuYm1jL2J1aWxkL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1n
bnVlYWJpL2ludGVsLWlwbWktb2VtLzAuMStnaXRBVVRPSU5DK2Q3NzQ4OWYxOGUtcjAvZ2l0L2lu
Y2x1ZGUvc2Vuc29yY29tbWFuZHMuaHBwOiBJbiBmdW5jdGlvbiAnaXBtaV9yZXRfdCBpcG1pOjpn
ZXRTZW5zb3JDb25uZWN0aW9uKGlwbWk6OkNvbnRleHQ6OnB0ciwgdWludDhfdCwgc3RkOjpzdHJp
bmcmLCBzdGQ6OnN0cmluZyYpJzoNCi9ob21lL2hhcmxleXpob3Uvb3BlbmJtYy9vcGVuYm1jL2J1
aWxkL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL2ludGVsLWlwbWkt
b2VtLzAuMStnaXRBVVRPSU5DK2Q3NzQ4OWYxOGUtcjAvZ2l0L2luY2x1ZGUvc2Vuc29yY29tbWFu
ZHMuaHBwOjEzODo0MjogZXJyb3I6ICd1c2luZyBlbGVtZW50X3R5cGUgPSBzdHJ1Y3QgaXBtaTo6
Q29udGV4dCcge2FrYSAnc3RydWN0IGlwbWk6OkNvbnRleHQnfSBoYXMgbm8gbWVtYmVyIG5hbWVk
ICdsdW4nDQogIDEzOCB8ICAgICBwYXRoID0gZ2V0UGF0aEZyb21TZW5zb3JOdW1iZXIoKGN0eC0+
bHVuIDw8IDgpIHwgc2Vuc251bSk7DQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXn5+DQovaG9tZS9oYXJsZXl6aG91L29wZW5ibWMvb3BlbmJtYy9idWls
ZC90bXAvd29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9pbnRlbC1pcG1pLW9l
bS8wLjErZ2l0QVVUT0lOQytkNzc0ODlmMThlLXIwL2dpdC9zcmMvc2Vuc29yY29tbWFuZHMuY3Bw
OiBJbiBmdW5jdGlvbiAnaXBtaTo6UnNwVHlwZTx1bnNpZ25lZCBjaGFyLCB1bnNpZ25lZCBjaGFy
LCB1bnNpZ25lZCBpbnQ+IGlwbWk6OmlwbWlTZW5zb3JHZXREZXZpY2VTZHJJbmZvKGlwbWk6OkNv
bnRleHQ6OnB0ciwgc3RkOjpvcHRpb25hbDx1bnNpZ25lZCBjaGFyPiknOg0KL2hvbWUvaGFybGV5
emhvdS9vcGVuYm1jL29wZW5ibWMvYnVpbGQvdG1wL3dvcmsvYXJtMTE3Nmp6cy1vcGVuYm1jLWxp
bnV4LWdudWVhYmkvaW50ZWwtaXBtaS1vZW0vMC4xK2dpdEFVVE9JTkMrZDc3NDg5ZjE4ZS1yMC9n
aXQvc3JjL3NlbnNvcmNvbW1hbmRzLmNwcDoxNDM4OjI2OiBlcnJvcjogJ3VzaW5nIGVsZW1lbnRf
dHlwZSA9IHN0cnVjdCBpcG1pOjpDb250ZXh0JyB7YWthICdzdHJ1Y3QgaXBtaTo6Q29udGV4dCd9
IGhhcyBubyBtZW1iZXIgbmFtZWQgJ2x1bicNCiAxNDM4IHwgICAgICAgICAgICAgICAgIGlmIChj
dHgtPmx1biA9PSByZWNvcmQtPmtleS5vd25lcl9sdW4pDQogICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICBefn4NCi9ob21lL2hhcmxleXpob3Uvb3BlbmJtYy9vcGVuYm1jL2J1aWxkL3Rt
cC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL2ludGVsLWlwbWktb2VtLzAu
MStnaXRBVVRPSU5DK2Q3NzQ4OWYxOGUtcjAvZ2l0L3NyYy9zZW5zb3Jjb21tYW5kcy5jcHA6MTQ0
ODoxOTogZXJyb3I6ICd1c2luZyBlbGVtZW50X3R5cGUgPSBzdHJ1Y3QgaXBtaTo6Q29udGV4dCcg
e2FrYSAnc3RydWN0IGlwbWk6OkNvbnRleHQnfSBoYXMgbm8gbWVtYmVyIG5hbWVkICdsdW4nDQog
MTQ0OCB8ICAgICAgICAgaWYgKChjdHgtPmx1biA9PSAwKSAmJiAobnVtU2Vuc29ycyA+IDApKQ0K
ICAgICAgfCAgICAgICAgICAgICAgICAgICBefn4NCi9ob21lL2hhcmxleXpob3Uvb3BlbmJtYy9v
cGVuYm1jL2J1aWxkL3RtcC93b3JrL2FybTExNzZqenMtb3BlbmJtYy1saW51eC1nbnVlYWJpL2lu
dGVsLWlwbWktb2VtLzAuMStnaXRBVVRPSU5DK2Q3NzQ4OWYxOGUtcjAvZ2l0L3NyYy9zZW5zb3Jj
b21tYW5kcy5jcHA6MTQ1MzoyNDogZXJyb3I6ICd1c2luZyBlbGVtZW50X3R5cGUgPSBzdHJ1Y3Qg
aXBtaTo6Q29udGV4dCcge2FrYSAnc3RydWN0IGlwbWk6OkNvbnRleHQnfSBoYXMgbm8gbWVtYmVy
IG5hbWVkICdsdW4nDQogMTQ1MyB8ICAgICAgICAgZWxzZSBpZiAoKGN0eC0+bHVuID09IDEpICYm
IChudW1TZW5zb3JzID4gbWF4U2Vuc29yc1BlckxVTikpDQogICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgXn5+DQovaG9tZS9oYXJsZXl6aG91L29wZW5ibWMvb3BlbmJtYy9idWlsZC90bXAv
d29yay9hcm0xMTc2anpzLW9wZW5ibWMtbGludXgtZ251ZWFiaS9pbnRlbC1pcG1pLW9lbS8wLjEr
Z2l0QVVUT0lOQytkNzc0ODlmMThlLXIwL2dpdC9zcmMvc2Vuc29yY29tbWFuZHMuY3BwOjE0NTk6
MjM6IGVycm9yOiAndXNpbmcgZWxlbWVudF90eXBlID0gc3RydWN0IGlwbWk6OkNvbnRleHQnIHth
a2EgJ3N0cnVjdCBpcG1pOjpDb250ZXh0J30gaGFzIG5vIG1lbWJlciBuYW1lZCAnbHVuJw0KIDE0
NTkgfCAgICAgICAgIGVsc2UgaWYgKGN0eC0+bHVuID09IDMpDQogICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICBefn4NCg0KDQo=

--_000_HK0PR04MB2883592DF92473820AA33910FE0B0HK0PR04MB2883apcp_
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
Thank you, I will update the entire project file to the latest version.<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Anton K=
achalov &lt;rnouse@google.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA10=D4=C28=C8=D5 3:09<br>
<b>=CA=D5=BC=FE=C8=CB:</b> =D6=DC =D4=B6=C7=E5 &lt;zhouyuanqing8@outlook.co=
m&gt;<br>
<b>=B3=AD=CB=CD:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&=
gt;; uperic@163.com &lt;uperic@163.com&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: About intel-ipmi-oem compilation error</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">Hello,
<div><br>
</div>
<div>How old is your openbmc checkout, especially the phosphor-host-ipmid?<=
/div>
<div><br>
</div>
<div>The requested field &quot;lun&quot; has been added three months ago:</=
div>
<div><br>
</div>
<div><a href=3D"https://github.com/openbmc/phosphor-host-ipmid/commit/c11cc=
5c06960d807bc0feb680346bf6f8e9f8adb">https://github.com/openbmc/phosphor-ho=
st-ipmid/commit/c11cc5c06960d807bc0feb680346bf6f8e9f8adb</a><br>
</div>
<div><br>
</div>
<div>From the build logs it seems like the existing headers doesn't include=
 this field.</div>
</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Wed, 7 Oct 2020 at 09:27, =D6=DC=
 =D4=B6=C7=E5 &lt;<a href=3D"mailto:zhouyuanqing8@outlook.com">zhouyuanqing=
8@outlook.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hello everyone,&nbsp;</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp; I downloaded intel-ipmi-oem from <a href=3D"https://gi=
thub.com/openbmc/intel-ipmi-oem" target=3D"_blank">
https://github.com/openbmc/intel-ipmi-oem</a>, and encountered the followin=
g 2 problems when compiling. The first problem has been solved, but I think=
 the code downloaded from the community should be able to compile and pass.=
 I would like to ask if there is
 something wrong with my project configuration?<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Question1:</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
In file included from /home/harleyzhou/openbmc/openbmc/build/tmp/work/arm11=
76jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git=
/include/ipmi_to_redfish_hooks.hpp:20,
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /ho=
me/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-linux-gnuea=
bi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-r0/git/src/sensorcommands.cpp:2=
0:</div>
<div>/home/harleyzhou/openbmc/openbmc/build/tmp/work/arm1176jzs-openbmc-lin=
ux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+d77489f18e-<span style=3D"color:rg=
b(81,167,249)">r0/git/include/storagecommands.hpp:18:10: fatal error: phosp=
hor-ipmi-host/sensorhandler.hpp: No
 such file or directory</span></div>
<div><span style=3D"color:rgb(81,167,249)">&nbsp; &nbsp;18 | #include &lt;p=
hosphor-ipmi-host/sensorhandler.hpp&gt;</span></div>
<div><span style=3D"color:rgb(81,167,249)">&nbsp; &nbsp; &nbsp; | &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</span></div=
>
<div><span style=3D"color:rgb(81,167,249)">compilation terminated.</span></=
div>
<br>
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; background-c=
olor:rgb(255,255,255); display:inline">Question2:</span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; background-c=
olor:rgb(255,255,255); display:inline">/home/harleyzhou/openbmc/openbmc/bui=
ld/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTOINC+=
d77489f18e-r0/recipe-sysroot-native/usr/bin/arm-openbmc-linux-gnueabi/arm-o=
penbmc-linux-gnueabi-g++
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
<div><span style=3D"color:rgb(81,167,249)">/home/harleyzhou/openbmc/openbmc=
/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTO=
INC+d77489f18e-r0/git/include/sensorcommands.hpp:138:42: error: 'using elem=
ent_type =3D struct ipmi::Context' {aka
 'struct ipmi::Context'} has no member named 'lun'</span></div>
<div><span style=3D"color:rgb(81,167,249)">&nbsp; 138 | &nbsp; &nbsp; path =
=3D getPathFromSensorNumber((ctx-&gt;lun &lt;&lt; 8) | sensnum);</span></di=
v>
<div><span style=3D"color:rgb(81,167,249)">&nbsp; &nbsp; &nbsp; | &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^~~</span></d=
iv>
<div><span style=3D"color:rgb(81,167,249)">/home/harleyzhou/openbmc/openbmc=
/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTO=
INC+d77489f18e-r0/git/src/sensorcommands.cpp: In function 'ipmi::RspType&lt=
;unsigned char, unsigned char, unsigned
 int&gt; ipmi::ipmiSensorGetDeviceSdrInfo(ipmi::Context::ptr, std::optional=
&lt;unsigned char&gt;)':</span></div>
<div><span style=3D"color:rgb(81,167,249)">/home/harleyzhou/openbmc/openbmc=
/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTO=
INC+d77489f18e-r0/git/src/sensorcommands.cpp:1438:26: error: 'using element=
_type =3D struct ipmi::Context' {aka
 'struct ipmi::Context'} has no member named 'lun'</span></div>
<div><span style=3D"color:rgb(81,167,249)">&nbsp;1438 | &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (ctx-&gt;lun =3D=3D record-&gt;key.=
owner_lun)</span></div>
<div><span style=3D"color:rgb(81,167,249)">&nbsp; &nbsp; &nbsp; | &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;^~~</span></div>
<div><span style=3D"color:rgb(81,167,249)">/home/harleyzhou/openbmc/openbmc=
/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTO=
INC+d77489f18e-r0/git/src/sensorcommands.cpp:1448:19: error: 'using element=
_type =3D struct ipmi::Context' {aka
 'struct ipmi::Context'} has no member named 'lun'</span></div>
<div><span style=3D"color:rgb(81,167,249)">&nbsp;1448 | &nbsp; &nbsp; &nbsp=
; &nbsp; if ((ctx-&gt;lun =3D=3D 0) &amp;&amp; (numSensors &gt; 0))</span><=
/div>
<div><span style=3D"color:rgb(81,167,249)">&nbsp; &nbsp; &nbsp; | &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^~~</span></div>
<div><span style=3D"color:rgb(81,167,249)">/home/harleyzhou/openbmc/openbmc=
/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTO=
INC+d77489f18e-r0/git/src/sensorcommands.cpp:1453:24: error: 'using element=
_type =3D struct ipmi::Context' {aka
 'struct ipmi::Context'} has no member named 'lun'</span></div>
<div><span style=3D"color:rgb(81,167,249)">&nbsp;1453 | &nbsp; &nbsp; &nbsp=
; &nbsp; else if ((ctx-&gt;lun =3D=3D 1) &amp;&amp; (numSensors &gt; maxSen=
sorsPerLUN))</span></div>
<div><span style=3D"color:rgb(81,167,249)">&nbsp; &nbsp; &nbsp; | &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^=
~~</span></div>
<div><span style=3D"color:rgb(81,167,249)">/home/harleyzhou/openbmc/openbmc=
/build/tmp/work/arm1176jzs-openbmc-linux-gnueabi/intel-ipmi-oem/0.1+gitAUTO=
INC+d77489f18e-r0/git/src/sensorcommands.cpp:1459:23: error: 'using element=
_type =3D struct ipmi::Context' {aka
 'struct ipmi::Context'} has no member named 'lun'</span></div>
<div><span style=3D"color:rgb(81,167,249)">&nbsp;1459 | &nbsp; &nbsp; &nbsp=
; &nbsp; else if (ctx-&gt;lun =3D=3D 3)</span></div>
<div><span style=3D"color:rgb(81,167,249)">&nbsp; &nbsp; &nbsp; | &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^~~</sp=
an></div>
<br>
<br>
</span></div>
</div>
</blockquote>
</div>
</div>
</body>
</html>

--_000_HK0PR04MB2883592DF92473820AA33910FE0B0HK0PR04MB2883apcp_--
