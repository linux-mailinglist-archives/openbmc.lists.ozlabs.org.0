Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B946736D9E8
	for <lists+openbmc@lfdr.de>; Wed, 28 Apr 2021 16:53:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVhTW4Wpjz3000
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 00:53:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=KjT8ruMZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.132.112;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=george.hung@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=KjT8ruMZ; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320112.outbound.protection.outlook.com [40.107.132.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVhTF3Sxtz2xfy
 for <openbmc@lists.ozlabs.org>; Thu, 29 Apr 2021 00:53:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EF6LlqO0UilFMA39gtPgr8V9m5J/XZ09Flj7KDe/k3VaXRL4J7Fk4gSDOiKHtWFndWlHPr9Pv/cMm5Kfp9ohqjAT+4es+cltCdI2WtD/gLqH6Lo5radcddBChmhFZ8V0kDfEIGb9lt6OQ5tXEZklWRDuoeHBKjCeCX7HSspTdAYSklRMljwnZoa9S4JyHA2cTxUHXgX1pVeByy3pwN+4pRzQnyaR+0AHbrqFufR2TQVOL0JAlZ7TxKtpWmeSGrWbcwwX62gJpH46mJDTFcISXJxteAOUPV4bzvEbGui/5136l72BwY1XvoT+qxO08j1Adu7ygB+HyCZumW6TuU3Umg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=romwkQDLpxIzOPRqL3jHNo1RZdoUs3uGqA3xd1qAh9M=;
 b=UkOUdziWQU3e0l0UMwXayOYEkE8vFuwl8wL4v0eCHo+Er+i2Ue/vHEfatMXdqXr1dKtidsLadXsYvixawdoLDskDpoXT9aV7IsIh9tvyX8m8K3I6xqt3nWoebhTWbAUjr3GDHbFZUyRZTn4RAWpIK1FI7ISyiFKwDkeRUZMahykTRwQkoD7ALTPWWVObshwnO7pjzGgdKjCOmrKtPLu+/falCwKhZX0FYrlAWxiRLHbVS10V0izqKTa9yUreppQ575+cG8Sa00lmXYVGQUSvlXxVOO1Mfcrbfi8b2m8IHNppi6KrtsHBQOzU6jzqXmoAbXPEgh2awz4ulpskkSHzJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=romwkQDLpxIzOPRqL3jHNo1RZdoUs3uGqA3xd1qAh9M=;
 b=KjT8ruMZDp6jRPDxTEYR10ja2FQxZhornsfvvIlAZEFmw7Vejd7DYzyCwqHN1a+DpFAkqod4BX2YumX0Jy32E8oqGd16elLydxC3HC2P3PE9yFl7y/aC03JhQkDrh5dYHhNUjcztTejkRnXNjYQ2zFXUN0swux0BqvDbQQk3n9g=
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com (2603:1096:203:46::21)
 by HK0PR04MB2449.apcprd04.prod.outlook.com (2603:1096:203:44::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Wed, 28 Apr
 2021 14:53:09 +0000
Received: from HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::8522:3491:faa6:e255]) by HK0PR04MB2339.apcprd04.prod.outlook.com
 ([fe80::8522:3491:faa6:e255%4]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 14:53:09 +0000
From: =?big5?B?R2VvcmdlIEh1bmcgKKx4qb63cSk=?= <George.Hung@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: [Kernel] Nuvoton NPCM7xx unbind FIU issue
Thread-Topic: [Kernel] Nuvoton NPCM7xx unbind FIU issue
Thread-Index: Adc7yulaJSnuzQhKT6+mrR40GddPjQAPNZiAAA2DMjA=
Date: Wed, 28 Apr 2021 14:53:08 +0000
Message-ID: <HK0PR04MB2339D98C06FBE01614FECA228F409@HK0PR04MB2339.apcprd04.prod.outlook.com>
References: <HK0PR04MB233983F380954AF58F9898208F409@HK0PR04MB2339.apcprd04.prod.outlook.com>
 <CACPK8XcKhmBnXg0EY-jNaubCposQsgprvW3YaU8LqtwgkjM_VQ@mail.gmail.com>
In-Reply-To: <CACPK8XcKhmBnXg0EY-jNaubCposQsgprvW3YaU8LqtwgkjM_VQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [61.218.113.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65d82a3b-7a42-4940-bf94-08d90a5556a1
x-ms-traffictypediagnostic: HK0PR04MB2449:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR04MB24497DB11C03D819240EF8D48F409@HK0PR04MB2449.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /sG1gOYf5ltYY6U61PhNaiuvh10hTN59E8gETAzIF0FkXbEbe3DmM8fdy0SYSDxyq93xzNDjXrEDGGn6OwA94fpfSrICBM4cm3tn3qTHTgnYHYMtRLFcV9+Vg079IajsRDh1j6LpezkgiXiIBuPojXLHKHJX8dA27Jhf8Ve2s+wkmy3HEvysMbTE1/0iZOKfgZD/SvMJuvxA6PmLS+/q/WWOSTBesFIeLY0C1Dca5tpynksScihOHfsQDZg8FZmeZm5dIXdzWKdknzccVTlVGKuabnThSXtER8hD1QUU5EPVRmTFzb6A8zkxYC2eiJQPg8seuu7vPh6EOpR76iJAq8+ShvoHWpa2+mnP8AmHTp93Co+eDPiKedr0CFzjxQ9qqG18YYopklyo/P4LEnJxs9JmcTCa2INjZMKnsX+MZ8xtJ8rsqqV7bWIQo25dtdiA0Wbuk3oCloIOuLT7TpE80Shwg1VRjmgF8wsmOvhmbkXX0Uu01W4N8AtyERLh6z4g7klYscFpEnTCbXOTYZetxuksJByyeZqw0pNJ/etPVvqU4UwZZOC0IF1DRSuhwR3VeHcFi6r1d5M4il3OkYPFAIsM7GNbkYOWdtPLJF3icBKIpGZLR8MpAVYH/zNzuoH6TWu9G1WcwRdClcOdljGh83EBGeaXIVfeVdYcs6649TvRTU5Zlqqnhr6xP8jKPScz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB2339.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39850400004)(396003)(376002)(346002)(136003)(53546011)(6506007)(4326008)(186003)(107886003)(9686003)(316002)(76116006)(66446008)(66476007)(7696005)(66946007)(33656002)(64756008)(8936002)(6916009)(55016002)(66556008)(26005)(45080400002)(86362001)(8676002)(966005)(71200400001)(54906003)(52536014)(83380400001)(478600001)(122000001)(5660300002)(38100700002)(2906002)(85182001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?big5?B?ZzZrL1NkNk1jZ1ppbUU0dnBIWU54NnB3ejBoRCs4bEpOWW9IaXhjdTFla0I3dm9i?=
 =?big5?B?Zmt3SGZyR2ZYZjdEbERCR21ZV3JydlRNVUpsSE5OWVZ2MEs2VSsvSjNRNTc3YW5t?=
 =?big5?B?eXNHZWNWU3hHTzVURWNSSXhXRXo2bmVkV3U4akQzbWp1VnVCRmJYbU94TEtsWVdC?=
 =?big5?B?UnJPYk0rNnE3TzQxWFVrSnNacUYxUm03OFlOcXVDT2U0VXJEMXI5TVhZZjlEaGcx?=
 =?big5?B?UHV4NFZ4SW42M0E2cE9ZcmMrdlFIbUhXLzJURHI1eXFrNG1hdkhjUVgwNTIvUFN0?=
 =?big5?B?Tjdvek1iQStBMEMrd2dIUnZPZnNoUmY1UGE1bHR5d2xqaE9wdEN2OU9ueE96OXBT?=
 =?big5?B?dXVlUDNqVFUxQSs0QXpyNndNZHp0RzVEZE1JRkRkdUc1NDNyQTdUWXFBbG9XcWhI?=
 =?big5?B?bnJiZ2k1MDlBZHJZYXJqZWR3UXdLcEtnd3VPdW0reVA0U2t5NUFHRWNjMFQ3MFJV?=
 =?big5?B?M1pwb1lmS1JOV2JvY1JkOG9oWjhFZ3lqYU9oQmw3ODIzNTh6eXVyRTJjV3MzVEVt?=
 =?big5?B?cVlHaDVTMnZNNlU5SHNhaFR6R1IvYUVGY1owM0Mzb0xBQndyVkh5bHBTY2ZCaW5h?=
 =?big5?B?NmZCOUZpeUZvRXg5QlVJV20wcHpSTWZabjdjbjJzdElITE9uR1NXdG9BOVkzSlMw?=
 =?big5?B?SVYwZ3d6ckFuY2tPMTlRYnhZWDY3YTUwN05iWnhXcGFFOGE4MmdTbmxkY2hFRml5?=
 =?big5?B?WDRMVGlIbEMxZFU2bXNWTSsyWFY3M2hnVGZ6a0NSUVdTRWYvdTh3cXZ3SzE2K2NJ?=
 =?big5?B?SXpVM2RNdTVhTTh2blZpWGtaMC9MaGFzZmlEMURZOS9PcGEwb3VFWCswRkhaN3ZW?=
 =?big5?B?VnZMcldPTmNXVG9HM2ZHVTU3MXo3SnRFa2pmb3R1MmlNckxSU29NcmNMVDJlSHZt?=
 =?big5?B?WEZrMmlzY2ZUUGRXNWk2OHNrZ3JjTUpsNm5YZExqbzlmeXRPOGJyMWRJYVJCY0gr?=
 =?big5?B?VTljeFFYMFZnMWFuY2dTTkVXTVljeU1IemdFK3FDNHk5bHV5aVhSbHFvQ2NHNmZM?=
 =?big5?B?L2JFSFY3eU5xaTNaejc0VmNjVis0Q1drZERLMnFMdHFlS0tjZ1Fpa2k1YmNsaDZV?=
 =?big5?B?MjA2K1VlLzhPWkFKSVF0cGhKU1lyZURpSlNOS2p5cStaaUE0WW1mREgxT3dwQjJu?=
 =?big5?B?eUlFYkNpRkVZS2ozeHpLYTBkRUZzQ2NibkNjWkpSdFNDR0FtMC9OTVRPR2RGbmR2?=
 =?big5?B?czY2M3V5aitoUVBYbFM5UFpjRDZmZlQwRDF5clNMVUFaUkx3YlZpTFlFcjlhUXV4?=
 =?big5?B?WDVHWWxSVERlZGt5bWo3MG5PbTMweEYrN0txZnFvZnhJeklzdVhRMnZiZkg2bXJt?=
 =?big5?B?eUhQT1ZZenlCZERUUEVLcm5WYUJlQ1IxUzMvL1BhSHdFaFVmTUl2L0hVL3d6Tk0r?=
 =?big5?B?ZUpYSE15bTJ3RnNPRGl5ZTdtaEl0cm5GV1pvWTdNYTkwMDdtSzUxbnd1RzRtSGRp?=
 =?big5?B?K3h6dG1mOEJ5dlRvNy9OS3FkRTNLdlZ6VVRPOXVwaldGSVVONk82UWhXRVZPNTEv?=
 =?big5?B?YlYwMUJtWm4yeEJ5L1ArYjBGcEJQRXliZEorVlVtdzF5d1dOVUNCSFoybmM1QzQr?=
 =?big5?B?dmd4MXRuc1RCWE9KTUtpQXIvenM4ZnJCVHdPenpIUE1DU1cxeGlUWnUzWUtRWmNM?=
 =?big5?Q?JncdQrVgiCzmLYsZqlMQ71/52bXEDLBJnp8yMqoy55a7zche?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB2339.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d82a3b-7a42-4940-bf94-08d90a5556a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 14:53:08.9805 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V/pLc9Le6G9+Nla2h73utYVs2i059drTWYxYjaU+6sHV96GJtdHGZi3CIzjdADbZh6X2s2kEMl04Kcuf16g/irueUU6nH/jj2cCv5nnuvow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2449
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
Cc: Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?big5?B?RnJhbiBIc3UgKK59u3jBvik=?= <Fran.Hsu@quantatw.com>,
 Brandon Kim <brandonkim@google.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpvZWwgU3RhbmxleSA8am9l
bEBqbXMuaWQuYXU+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMjgsIDIwMjEgNDoyMyBQTQ0K
PiBUbzogR2VvcmdlIEh1bmcgKKx4qb63cSkgPEdlb3JnZS5IdW5nQHF1YW50YXR3LmNvbT4NCj4g
Q2M6IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz47IFdpbGxpYW0g
S2VubmluZ3Rvbg0KPiA8d2FrQGdvb2dsZS5jb20+OyBCcmFuZG9uIEtpbSA8YnJhbmRvbmtpbUBn
b29nbGUuY29tPjsgQmVuamFtaW4NCj4gRmFpciA8YmVuamFtaW5mYWlyQGdvb2dsZS5jb20+OyBG
cmFuIEhzdSAorn27eMG+KQ0KPiA8RnJhbi5Ic3VAcXVhbnRhdHcuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW0tlcm5lbF0gTnV2b3RvbiBOUENNN3h4IHVuYmluZCBGSVUgaXNzdWUNCj4gDQo+IE9uIFdl
ZCwgMjggQXByIDIwMjEgYXQgMDE6MTUsIEdlb3JnZSBIdW5nICiseKm+t3EpDQo+IDxHZW9yZ2Uu
SHVuZ0BxdWFudGF0dy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgSm9lbCwNCj4gPg0KPiA+IEZv
ciBrZXJuZWwgdjUueCwgd2UgZm91bmQgdGhhdCB3aGVuIHdlIHVuYmluZCBGSVUgbW9kdWxlIGF0
IHRoZSBmaXJzdA0KPiB0aW1lLCBpdCB3b3VsZCBjYXVzZSBrZXJuZWwgd2FybmluZyBsaWtlIHRo
YXQ6DQo+ID4NCj4gPiAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4gPiBX
QVJOSU5HOiBDUFU6IDAgUElEOiAyMTc0IGF0IGxpYi9yZWZjb3VudC5jOjE5MA0KPiA+IHJlZmNv
dW50X3N1Yl9hbmRfdGVzdF9jaGVja2VkKzB4NjAvMHhiYw0KPiA+IHJlZmNvdW50X3Q6IHVuZGVy
ZmxvdzsgdXNlLWFmdGVyLWZyZWUuDQo+ID4gTW9kdWxlcyBsaW5rZWQgaW46DQo+ID4gQ1BVOiAw
IFBJRDogMjE3NCBDb21tOiBnYnMtc3lzaW5pdC5zaCBOb3QgdGFpbnRlZA0KPiA+IDUuNC44MC1l
YmFkOGNkLWRpcnR5LWM0NjQ0NGQgIzEgSGFyZHdhcmUgbmFtZTogTlBDTTdYWCBDaGlwIGZhbWls
eQ0KPiANCj4gSG9wZWZ1bGx5IHlvdSdyZSBub3QgdXNpbmcgNS40LjgwIGFueXdoZXJlIDopDQo+
IA0KPiA+DQo+ID4gQW5kIHRoZXJlJ3MgYSBmaXggb24ga2VybmVsIGdpdGh1YiBmb3Igbm93Og0K
PiA+IGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1o
dHRwcyUzQSUyRiUyRmdpdGgNCj4gPg0KPiB1Yi5jb20lMkZ0b3J2YWxkcyUyRmxpbnV4JTJGY29t
bWl0JTJGNzk0YWFmMDE0NDRkNGU3NjVlMmIwNjdjYmEwDQo+IDFjYzY5Yw0KPiA+DQo+IDFjNjhl
ZDkmYW1wO2RhdGE9MDQlN0MwMSU3Q0dlb3JnZS5IdW5nJTQwcXVhbnRhdHcuY29tJTdDMjcyMzNl
DQo+IDNmMGQ2MDQ2DQo+ID4NCj4gZTU0YzdiMDhkOTBhMWVlZDBkJTdDMTc5YjAzMjcwN2ZjNDk3
M2FjNzM4ZGU3MzEzNTYxYjIlN0MxJTdDMCUNCj4gN0M2Mzc1NTENCj4gPg0KPiA5NTAyMTc2OTg2
MDYlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0oNCj4gUUlq
b2lWMmx1TQ0KPiA+DQo+IHpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAm
YW1wO3NkYXRhPVViTFglMkJVQVQwc2QNCj4gRkQ1Z240DQo+ID4gWnR3eUtWN1dsc3lrRW5nSVpw
Y3JIV0NsRTQlM0QmYW1wO3Jlc2VydmVkPTANCj4gPg0KPiA+IENvdWxkIHlvdSBoZWxwIHRvIHB1
bGwgdGhpcyBmaXggdG8gY3VycmVudCBPcGVuQk1DIGtlcm5lbCByZXBvLiB0byBmaXggdGhpcw0K
PiBpc3N1ZSA/DQo+IA0KPiBTdXJlLiBJJ3ZlIGFwcGxpZWQgdGhpcyBjaGFuZ2UgdG8gZGV2LTUu
MTAuDQoNCkkgZm91bmQgdGhpcyBjb21taXQsIHRoYW5rcyBhIGxvdC4NCg0KQmVzdCBSZWdhcmRz
IA0KR2VvcmdlIEh1bmcNCg0KPiANCj4gSSBpbWFnaW5lIGl0IHdpbGwgc2hvdyB1cCBpbiB0aGUg
c3RhYmxlIHRyZWUgc2hvcnRseSB0b28sIHNvIGlmIHlvdSBhcmUgcmVhbGx5DQo+IHVzaW5nIHY1
LjQgSSByZWNvbW1lbmQgbWVyZ2luZyBpbiB0aGUgbGF0ZXN0IHN0YWJsZSB0cmVlIHdoZW4gdGhh
dCBoYXBwZW5zLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gSm9lbA0K
