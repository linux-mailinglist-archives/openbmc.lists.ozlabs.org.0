Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF61D1FEBE4
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 09:03:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nXvl0P1fzDrD0
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 17:03:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=outlook.com (client-ip=40.92.254.56;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=zhouyuanqing8@outlook.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=HXkX2s+9; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-oln040092254056.outbound.protection.outlook.com [40.92.254.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nXtx3x6KzDqdR
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 17:02:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4wwRjjQdcTc2GL2Zs4fWBp5k1rqg65IXY7zYXm5Glet+9hfeXdQeClfVmMZ5zInO4GCIsDpTgc7q6zzhKWFck8HuggRl7vDuUmHZ1WPIII4BiaIahn9sbwBzOUUkFHGsoBGEjnhMsEEof1vj4EGoJp9YtMyQ0BJlxQsn0O7v9zvVne+Io8vaQ3aYyLQkhv2UGlzwY1kjh3Z4I6VNCqQXZn9zs5HZHyqczoPWyhLv1FTaEGo4S7C5HH7W0j28Os5uoYZXNcvRRyYBztl0QgoxFcrZx06lgBI6WyBwbjd+Sj5QWgns+E7mzz3aLRDycsXNqhgO7kmEwyGcc064MzkWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rfPTYRlo6rpF8awxIzMb/NTK9QmmRkqRPba7+yGByM=;
 b=Pru1XTpCl7hrRsB3p0QB9mv7pX6y7qjlt7VVMagfOUeaAc8oSuGSeigpljRPvqqOEMG51hxLzexZZ+sDu4fBfMPZ2Y6Uugekgj+Ki7LSyHDsYnelf0jr7jszFQd0t3hI/pyymgIuBeVWthoXMAyFQ8694nQie+2lTcMOElW8SsYujKaUoBIxtMVs/ospnJ+At+xtLmaInSC6hX4hVlwJv8voUXz1Vbs8iO6UahO02pIDIJl50gziDW7yOnMDVjd/KDGb3OqmaADwqwvi6OrpTUSCX1HQ1AEHPmRogyX3FSqDs4FE21MQH8fKTQei6lSfU9bpMpDXhbPK52h5U/2usQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rfPTYRlo6rpF8awxIzMb/NTK9QmmRkqRPba7+yGByM=;
 b=HXkX2s+9NlKyMwwabG9aIAFsWSUxLe0zkAMJyjq4MwuisaPVfZn1sqEeuX8yaXfm3StLwhrQAelBLK7Pp4Hu5x+1QH9bB4j3WGyb9lUUFItYvjLJbu4hv1lL7q4Cb1lx8O3E+8ic6wCtmO3AqIsyAsNLdbrgIR5gaL0/Ay1OgDDo/3nzXSz+ZhRC0X4B1wmB39WBo6pfOSMvzeHLULQayEBhD/ND7aUeIQa6W1PaPchPkqbsvqYoZsPE1ygqDml8H3bnE25CoNPa7YdBWrENQvBY4+nV8xfl+I+czRpE/VYxSqd7SDn5Ga8XXkTYOFNSf10xrLOH93o6lIHenvdOgA==
Received: from SG2APC01FT049.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::43) by
 SG2APC01HT013.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::189)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Thu, 18 Jun
 2020 07:02:24 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 (2a01:111:e400:7ebd::4c) by SG2APC01FT049.mail.protection.outlook.com
 (2a01:111:e400:7ebd::463) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Thu, 18 Jun 2020 07:02:24 +0000
Received: from HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::88c3:5243:9944:700f]) by HK2PR04MB3826.apcprd04.prod.outlook.com
 ([fe80::88c3:5243:9944:700f%6]) with mapi id 15.20.3088.029; Thu, 18 Jun 2020
 07:02:24 +0000
From: =?gb2312?B?1twg1LbH5Q==?= <zhouyuanqing8@outlook.com>
To: =?gb2312?B?0/TA1w==?= <yulei.sh@bytedance.com>
Subject: =?gb2312?B?u9i4tDogVGhlcmUgaXMgbm8ga2NzIGRldmljZSBpbiB0aGUgL2RldiBkaXJl?=
 =?gb2312?Q?ctory?=
Thread-Topic: There is no kcs device in the /dev directory
Thread-Index: AQHWRQ7NnKu+sXrNAki49Znemi3j0Kjd16MAgAAZhjg=
Date: Thu, 18 Jun 2020 07:02:24 +0000
Message-ID: <HK2PR04MB382611A4F5E268A3DDD02E10FE9B0@HK2PR04MB3826.apcprd04.prod.outlook.com>
References: <HK2PR04MB3826A23CDAA3FC0CE9660D1BFE9B0@HK2PR04MB3826.apcprd04.prod.outlook.com>,
 <CAGm54UEHECbM+UjOsGvWDv3XvZr0NZq+-coDPe-MFvGyyDAOsQ@mail.gmail.com>
In-Reply-To: <CAGm54UEHECbM+UjOsGvWDv3XvZr0NZq+-coDPe-MFvGyyDAOsQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:FD7534027FBF555B9A849A3A0B223CDE18D3F1C5FCB55249B62CF53D3DD1343A;
 UpperCasedChecksum:C8DBD87BA84C28683B419705FA1319C27487C9607A62A87E8B389C6ABDA48F02;
 SizeAsReceived:7049; Count:44
x-tmn: [Cn6uD85DmHjtNSKxVpkmNuzMoSN+ECJk]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: cb1226cc-8ccb-42d2-61c8-08d813558dc5
x-ms-traffictypediagnostic: SG2APC01HT013:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0cpsKkm7Frdn3MBP7TI9aLXDRc8EfxZfRmjwzMxPnl6koyH+wPEv8dP8sV/PCGAg+wpOe1lKWxrkY6H22El7Kkk3EFcH0Po3l3IkGccRF0dCmT0x+Ss1vlkM5KhIJFeFJ0FFDJOgSg+IU7UFTwYObPtmlyw+X/TLdwCFQ3EzOIjA9f+8u5x+zExTROb44CTMehE4ubUOQ7jSZL8aUs/jKg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR04MB3826.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
x-ms-exchange-antispam-messagedata: 8EFwtoxQlSZTrfolEar0v7yuhC2uR3tzt7Ra6SV47cxPFmLY8CoDVXEeogUiJW5zBZelEdutGAeN/kA5WMqknjV0bgeKxoEYgys1Z9FK8dOy4lqtAOwcIZh4qPGF7S7n4HpWIoDB3WdqwL9EAVKKlQ==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_HK2PR04MB382611A4F5E268A3DDD02E10FE9B0HK2PR04MB3826apcp_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1226cc-8ccb-42d2-61c8-08d813558dc5
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 07:02:24.3626 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT013
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
Cc: "uperic@163.com" <uperic@163.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK2PR04MB382611A4F5E268A3DDD02E10FE9B0HK2PR04MB3826apcp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

RXJyb3IgcmVwb3J0ZWQgZHVyaW5nIGtlcm5lbCBzdGFydHVwo6xDYW4geW91IGhlbHAgdG8gY2hl
Y2sgd2hlcmUgdGhlIGNvbmZpZ3VyYXRpb24gaXMgd3Jvbmejvw0KDQpbICAgIDEuMDc1OTAxXSBp
cG1pLWJ0LWhvc3QgMWU3ODkxNDAuaWJ0OiBVc2luZyBJUlEgMzMNCg0KWyAgICAxLjA3NjU0N10g
YXN0LWtjcy1ibWMgMWU3ODkwMDAubHBjLWJtYzprY3MxQDA6IG5vIHZhbGlkICdrY3NfYWRkcicg
Y29uZmlndXJlZA0KDQpbICAgIDEuMDc2NzQzXSBhc3Qta2NzLWJtYyAxZTc4OTAwMC5scGMtYm1j
OmtjczJAMDogbm8gdmFsaWQgJ2tjc19hZGRyJyBjb25maWd1cmVkDQoNClsgICAgMS4wNzY5MjJd
IGFzdC1rY3MtYm1jIDFlNzg5MDAwLmxwYy1ibWM6a2NzM0AwOiBubyB2YWxpZCAna2NzX2FkZHIn
IGNvbmZpZ3VyZWQNCg0KWyAgICAxLjA3NzEwMl0gYXN0LWtjcy1ibWMgMWU3ODkwODAubHBjLWhv
c3Q6a2NzNEAwOiBubyB2YWxpZCAna2NzX2FkZHInIGNvbmZpZ3VyZWQNCg0KWyAgICAxLjA4MzAy
MF0gU2VyaWFsOiA4MjUwLzE2NTUwIGRyaXZlciwgNiBwb3J0cywgSVJRIHNoYXJpbmcgZW5hYmxl
ZA0KDQpUaGUgY29uZmlndXJlIGluIGFzcGVlZF9ndC5kdHM6DQogbHBjX2JtYzogbHBjLWJtY0Aw
IHsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
ImFzcGVlZCxhc3QyNTAwLWxwYy1ibWMiLCAic2ltcGxlLW1mZCIsICJzeXNjb24iOw0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAgMHg4MD47DQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnLWlvLXdpZHRoID0gPDQ+Ow0K
DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8MT47DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI3NpemUtY2Vs
bHMgPSA8MT47DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmFuZ2Vz
ID0gPDB4MCAweDAgMHg4MD47DQoNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBrY3MxOiBrY3MxQDAgew0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjUwMC1rY3MtYm1jIjsNCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8
OD47DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrY3Nf
Y2hhbiA9IDwxPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfTsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrY3My
OiBrY3MyQDAgew0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJhc3BlZWQsYXN0MjUwMC1rY3MtYm1jIjsNCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8OD47DQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrY3NfY2hhbiA9IDwy
PjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1
cyA9ICJkaXNhYmxlZCI7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fTsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrY3MzOiBrY3MzQDAg
ew0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJhc3BlZWQsYXN0MjUwMC1rY3MtYm1jIjsNCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8OD47DQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBrY3NfY2hhbiA9IDwzPjsNCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNh
YmxlZCI7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsNCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsNCg0KDQpUaGUgY29uZmlndXJlIGluIGFzcGVl
ZC1ibWMtb3BwLXN0YXIuZHRzOg0KJmtjczEgew0KICAgICAgICBzdGF0dXMgPSAib2theSI7DQp9
Ow0KDQoma2NzMiB7DQogICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCn07DQoNCiZrY3MzIHsNCiAg
ICAgICAgc3RhdHVzID0gIm9rYXkiOw0KfTsNCg0KJmtjczQgew0KICAgICAgICBzdGF0dXMgPSAi
b2theSI7DQp9Ow0KDQomaWJ0IHsNCiAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KfTsNCg0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLOiDT9MDXIDx5dWxlaS5zaEBi
eXRlZGFuY2UuY29tPg0Kt6LLzcqxvOQ6IDIwMjDE6jbUwjE4yNUgMTM6MjUNCsrVvP7Iyzog1twg
1LbH5SA8emhvdXl1YW5xaW5nOEBvdXRsb29rLmNvbT4NCrOty806IG9wZW5ibWMgPG9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZz47IHVwZXJpY0AxNjMuY29tIDx1cGVyaWNAMTYzLmNvbT4NCtb3zOI6
IFJlOiBUaGVyZSBpcyBubyBrY3MgZGV2aWNlIGluIHRoZSAvZGV2IGRpcmVjdG9yeQ0KDQpPbiBU
aHUsIEp1biAxOCwgMjAyMCBhdCAxMjo1MSBQTSDW3CDUtsflIDx6aG91eXVhbnFpbmc4QG91dGxv
b2suY29tPiB3cm90ZToNCj4NCj4gSGkgZXZlcnlvbmUsDQo+DQo+ICAgICBUaGVyZSBpcyBubyBr
Y3MgZGV2aWNlIGluIHRoZSAvZGV2IGRpcmVjdG9yeaOsSSB1c2VkIHRoZSBmb2xsb3dpbmcgY29t
bWFuZCB0byBmaW5kIGl0IGluIHRoZSByb290IGRpcmVjdG9yeSwgYW5kIEkgZGlkIG5vdCBmaW5k
IGlwbWkta2NzIGRldmljZSwgcGxlYXNlIGhlbHAgZ3VpZGUsIHRoYW5rIHlvdS4NCg0KUHJvYmFi
bHkgeW91IGNvdWxkIGNoZWNrIHRoZSBkZXZpY2UgdHJlZSB0byBzZWUgaWYgdGhlIGtjcyBpcyBl
bmFibGVkIG9yIG5vdC4NCg0KPg0KPiAxLmZpbmQgLyAtbmFtZSAqa2NzKg0KPg0KPiAyLkJlbG93
IGlzIG15IGtlcm5lbCBjb25maWd1cmF0aW9uDQo+IENPTkZJR19TRVJJQUxfTUNUUkxfR1BJTz15
DQo+ICMgQ09ORklHX1NFUklBTF9ERVZfQlVTIGlzIG5vdCBzZXQNCj4gIyBDT05GSUdfVFRZX1BS
SU5USyBpcyBub3Qgc2V0DQo+ICMgQ09ORklHX0hWQ19EQ0MgaXMgbm90IHNldA0KPiBDT05GSUdf
SVBNSV9IQU5ETEVSPXkNCj4gIyBDT05GSUdfSVBNSV9QQU5JQ19FVkVOVCBpcyBub3Qgc2V0DQo+
ICMgQ09ORklHX0lQTUlfREVWSUNFX0lOVEVSRkFDRSBpcyBub3Qgc2V0DQo+ICMgQ09ORklHX0lQ
TUlfU0kgaXMgbm90IHNldA0KPiAjIENPTkZJR19JUE1JX1NTSUYgaXMgbm90IHNldA0KPiAjIENP
TkZJR19JUE1JX1dBVENIRE9HIGlzIG5vdCBzZXQNCj4gIyBDT05GSUdfSVBNSV9QT1dFUk9GRiBp
cyBub3Qgc2V0DQo+IENPTkZJR19JUE1JX0tDU19CTUM9eQ0KPiBDT05GSUdfQVNQRUVEX0tDU19J
UE1JX0JNQz15DQo+IENPTkZJR19BU1BFRURfQlRfSVBNSV9CTUM9eQ0KPiBDT05GSUdfSFdfUkFO
RE9NPXkNCj4gQ09ORklHX0hXX1JBTkRPTV9USU1FUklPTUVNPXkNCj4gIyBDT05GSUdfUkFXX0RS
SVZFUiBpcyBub3Qgc2V0DQo+ICMgQ09ORklHX1RDR19UUE0gaXMgbm90IHNldA0KPiAjIENPTkZJ
R19YSUxMWUJVUyBpcyBub3Qgc2V0DQo+ICMgZW5kIG9mIENoYXJhY3RlciBkZXZpY2VzDQo+DQo+
IFRoYW5rcw0KPiBIYXJsZXkNCg==

--_000_HK2PR04MB382611A4F5E268A3DDD02E10FE9B0HK2PR04MB3826apcp_
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
<div style=3D"margin: 0px; font-style: normal; font-variant-caps: normal; f=
ont-weight: normal; font-stretch: normal; font-size: 12px; line-height: nor=
mal; font-family: Helvetica;">
Error reported during kernel startup=A3=ACCan you help to check where the c=
onfiguration is wrong=A3=BF<br>
</div>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica">[<span=
>&nbsp; &nbsp; </span>
1.075901] ipmi-bt-host 1e789140.ibt: Using IRQ 33</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica">[<span=
>&nbsp; &nbsp; </span>
1.076547] ast-kcs-bmc 1e789000.lpc-bmc:kcs1@0: no valid 'kcs_addr' configur=
ed</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica">[<span=
>&nbsp; &nbsp; </span>
1.076743] ast-kcs-bmc 1e789000.lpc-bmc:kcs2@0: no valid 'kcs_addr' configur=
ed</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica">[<span=
>&nbsp; &nbsp; </span>
1.076922] ast-kcs-bmc 1e789000.lpc-bmc:kcs3@0: no valid 'kcs_addr' configur=
ed</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica">[<span=
>&nbsp; &nbsp; </span>
1.077102] ast-kcs-bmc 1e789080.lpc-host:kcs4@0: no valid 'kcs_addr' configu=
red</p>
<p style=3D"margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica">[<span=
>&nbsp; &nbsp; </span>
1.083020] Serial: 8250/16550 driver, 6 ports, IRQ sharing enabled</p>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
The configure in aspeed_gt.dts:<br>
<span>&nbsp;lpc_bmc: lpc-bmc@0 {<br>
</span>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; compa=
tible =3D &quot;aspeed,ast2500-lpc-bmc&quot;, &quot;simple-mfd&quot;, &quot=
;syscon&quot;;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg =
=3D &lt;0x0 0x80&gt;;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reg-i=
o-width =3D &lt;4&gt;;<br>
</div>
<div><br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; #addr=
ess-cells =3D &lt;1&gt;;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; #size=
-cells =3D &lt;1&gt;;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; range=
s =3D &lt;0x0 0x0 0x80&gt;;<br>
</div>
<div><br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kcs1:=
 kcs1@0 {<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; compatible =3D &quot;aspeed,ast2500-kcs-bmc&quot;;<b=
r>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; interrupts =3D &lt;8&gt;;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; kcs_chan =3D &lt;1&gt;;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; status =3D &quot;disabled&quot;;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };<br=
>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kcs2:=
 kcs2@0 {<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; compatible =3D &quot;aspeed,ast2500-kcs-bmc&quot;;<b=
r>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; interrupts =3D &lt;8&gt;;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; kcs_chan =3D &lt;2&gt;;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; status =3D &quot;disabled&quot;;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };<br=
>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; kcs3:=
 kcs3@0 {<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; compatible =3D &quot;aspeed,ast2500-kcs-bmc&quot;;<b=
r>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; interrupts =3D &lt;8&gt;;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; kcs_chan =3D &lt;3&gt;;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; status =3D &quot;disabled&quot;;<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };<br=
>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; };<br>
</div>
<span></span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif; background-color: rgb(255, 255, 255); display: inline !i=
mportant">The configure in aspeed-bmc-opp-star.dts:</span><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif; background-color: rgb(255, 255, 255); display: inline !i=
mportant"><span>&amp;kcs1 {<br>
</span>
<div>&nbsp; &nbsp; &nbsp; &nbsp; status =3D &quot;okay&quot;;<br>
</div>
<div>};<br>
</div>
<div><br>
</div>
<div>&amp;kcs2 {<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; status =3D &quot;okay&quot;;<br>
</div>
<div>};<br>
</div>
<div><br>
</div>
<div>&amp;kcs3 {<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; status =3D &quot;okay&quot;;<br>
</div>
<div>};<br>
</div>
<div><br>
</div>
<div>&amp;kcs4 {<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; status =3D &quot;okay&quot;;<br>
</div>
<div>};<br>
</div>
<div><br>
</div>
<div>&amp;ibt {<br>
</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; status =3D &quot;okay&quot;;<br>
</div>
<div>};<br>
</div>
<span></span><br>
</span></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif; background-color: rgb(255, 255, 255); display: inline !i=
mportant"><br>
</span></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B7=A2=BC=FE=C8=CB:</b> =D3=F4=
=C0=D7 &lt;yulei.sh@bytedance.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2020=C4=EA6=D4=C218=C8=D5 13:25<br>
<b>=CA=D5=BC=FE=C8=CB:</b> =D6=DC =D4=B6=C7=E5 &lt;zhouyuanqing8@outlook.co=
m&gt;<br>
<b>=B3=AD=CB=CD:</b> openbmc &lt;openbmc@lists.ozlabs.org&gt;; uperic@163.c=
om &lt;uperic@163.com&gt;<br>
<b>=D6=F7=CC=E2:</b> Re: There is no kcs device in the /dev directory</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Thu, Jun 18, 2020 at 12:51 PM =D6=DC =D4=B6=C7=
=E5 &lt;zhouyuanqing8@outlook.com&gt; wrote:<br>
&gt;<br>
&gt; Hi everyone,<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; There is no kcs device in the /dev directory=
=A3=ACI used the following command to find it in the root directory, and I =
did not find ipmi-kcs device, please help guide, thank you.<br>
<br>
Probably you could check the device tree to see if the kcs is enabled or no=
t.<br>
<br>
&gt;<br>
&gt; 1.find / -name *kcs*<br>
&gt;<br>
&gt; 2.Below is my kernel configuration<br>
&gt; CONFIG_SERIAL_MCTRL_GPIO=3Dy<br>
&gt; # CONFIG_SERIAL_DEV_BUS is not set<br>
&gt; # CONFIG_TTY_PRINTK is not set<br>
&gt; # CONFIG_HVC_DCC is not set<br>
&gt; CONFIG_IPMI_HANDLER=3Dy<br>
&gt; # CONFIG_IPMI_PANIC_EVENT is not set<br>
&gt; # CONFIG_IPMI_DEVICE_INTERFACE is not set<br>
&gt; # CONFIG_IPMI_SI is not set<br>
&gt; # CONFIG_IPMI_SSIF is not set<br>
&gt; # CONFIG_IPMI_WATCHDOG is not set<br>
&gt; # CONFIG_IPMI_POWEROFF is not set<br>
&gt; CONFIG_IPMI_KCS_BMC=3Dy<br>
&gt; CONFIG_ASPEED_KCS_IPMI_BMC=3Dy<br>
&gt; CONFIG_ASPEED_BT_IPMI_BMC=3Dy<br>
&gt; CONFIG_HW_RANDOM=3Dy<br>
&gt; CONFIG_HW_RANDOM_TIMERIOMEM=3Dy<br>
&gt; # CONFIG_RAW_DRIVER is not set<br>
&gt; # CONFIG_TCG_TPM is not set<br>
&gt; # CONFIG_XILLYBUS is not set<br>
&gt; # end of Character devices<br>
&gt;<br>
&gt; Thanks<br>
&gt; Harley<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_HK2PR04MB382611A4F5E268A3DDD02E10FE9B0HK2PR04MB3826apcp_--
