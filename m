Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4046B2E0466
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 03:44:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0LJw1l8xzDqPR
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 13:44:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.97;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=dylan_hung@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=aspeedtech.com
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310097.outbound.protection.outlook.com [40.107.131.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0LJ64cX3zDqNZ;
 Tue, 22 Dec 2020 13:43:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlG0g+xmu2iHLg/5TKAyEeB/kN58e5reNuwqstWjriFvC0wlOGdf51lN0UZIfof1NM4yDETqDbtAdq8wEiEgINOnP5SFyrchDx47KL/3ibet/ZQeEA+yp3q+c6MEbx6uQMXT1Co/57godCzXuskuy2OcUDUaG6FAr9HmCIY9scZU5CYPl/iST3vZzd7AfLVNezyaSTAXWT5absZnp/DdEqf4S/02Tbfk7XTKMLsO/OVe59wUC//cEhuU1yZkU5oRvRD5CNRMjyXgpE3q1/19/b4rsiQyO7KkyByvALTApfSlQUWpHYzzM7vRXnt2fp1oVxUwQUI6VDb24T+mep7ENA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMNR5FwNHFYnadMPsYVA6gXPkH3Llm/qAFC0ca/vpM8=;
 b=ejk3/MV8F49d7/BJCcpy037n5M9PSPv+4l6By2VmrHV8NO0IuG6e50uFZl6wcf30xK9CnXnwOIKvEIg+3+PHZZeDLSLe9fZ/hlhV7yjKUWr1nqYYEIba2/hKk1iO977jxEFJJvftwHfgYMvkvF5ey4d3PDWWyvvMsZ3qHTLaXcqUtrV+hnjr64ESZ0tKC8IFm7EKpbMWnWrcfZ+OrFXgl6XN0vwYDNZk55WtdH9V6anol8U8+lFRCbNaz5x+nKiipvJpTef9HT5XQXWKkNLnWBeY1v69CmR99Zi2bDvDXh+ntmhxRg9qppcZX9B3ghkCoAOLM/7t2qu4VVbJnR51nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK0PR06MB2834.apcprd06.prod.outlook.com (2603:1096:203:5c::20)
 by HK0PR06MB3025.apcprd06.prod.outlook.com (2603:1096:203:87::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Tue, 22 Dec
 2020 02:43:40 +0000
Received: from HK0PR06MB2834.apcprd06.prod.outlook.com
 ([fe80::9899:8ffc:f4ba:d27a]) by HK0PR06MB2834.apcprd06.prod.outlook.com
 ([fe80::9899:8ffc:f4ba:d27a%6]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 02:43:40 +0000
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, Hongwei Zhang <hongweiz@ami.com>, Ryan Chen
 <ryan_chen@aspeedtech.com>
Subject: RE: [Aspeed, ncsi-rx, v1 0/1] net: ftgmac100: Fix AST2600EVB NCSI RX
 issue
Thread-Topic: [Aspeed, ncsi-rx, v1 0/1] net: ftgmac100: Fix AST2600EVB NCSI RX
 issue
Thread-Index: AQHW0xpPdVjgzk5uYUq+vS77FcOy5qoBz3CAgACeDICAAAM4UA==
Date: Tue, 22 Dec 2020 02:43:39 +0000
Message-ID: <HK0PR06MB2834133F49A2093B163139519CDF0@HK0PR06MB2834.apcprd06.prod.outlook.com>
References: <20201215192323.24359-1-hongweiz@ami.com>
 <20201221170048.29821-1-hongweiz@ami.com>
 <CACPK8Xe8_S6jgs-DxpB0Veu=25JXftTLeK7nGhLJ51GghSeVHw@mail.gmail.com>
In-Reply-To: <CACPK8Xe8_S6jgs-DxpB0Veu=25JXftTLeK7nGhLJ51GghSeVHw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 611f60b5-f2b2-462d-1338-08d8a62363ce
x-ms-traffictypediagnostic: HK0PR06MB3025:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB302536BE38B249A1F607FCE79CDF0@HK0PR06MB3025.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pRt0oqOoZCHfO3atuGRxFXMbwkmr301KkXRxippYUapiCmmuykSu3/uV3qBAPsxPQMlg6c5A7Hyelm4EBNtBW6z4sNswjgaUGqGQ/1ZRQtR9+GaegXf5mQsouIulmBDADCKKgC2bNL/p4g2uLo8St9Lago2jriYPkInQBmONOgQrph+Ra6JdXa74MFo9BaUwO3efhsqSOXQibC/fctQ34GNhoC1z+bgBX5qQI3eYHz35mCxR4n7w8ylSVsihkxg1EHcfsc8hVd7dGcL3lxCes/rId4LJmhNSOMPagylHBkE2k/1mpYqkO8GjaF8FpwAGFpnZTDgb9KJbZ6rix6LDxses+8Zw5rZq841PIbv5ksuUA/Ik2bCRsMXpLCddJ+3y
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2834.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39840400004)(136003)(366004)(396003)(478600001)(76116006)(4326008)(52536014)(9686003)(2906002)(66946007)(8936002)(55016002)(33656002)(66556008)(66476007)(7696005)(71200400001)(54906003)(6636002)(316002)(64756008)(8676002)(110136005)(55236004)(6506007)(26005)(53546011)(5660300002)(83380400001)(66446008)(186003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OTUvV0hGTDR1My9CMVZDUEJZV2FraDVRQy9zaFhjRHhWMmRUcHU3N2JnODVM?=
 =?utf-8?B?ckhNa2pKZ1lrUVZMbFA2MmlzeDFoVDQ2aFQ0d2ZvY3hJWGlnVXVMTk50b2Rr?=
 =?utf-8?B?Q3FyUEV4RGFmMG8xUEdkQWNHNm13VUFtYjRCMDVDTmxxQ2pvUUhyZXo1c0ps?=
 =?utf-8?B?SzFhQnJhWDhtQTUzcnoyMWtwOUZneXhpanZkUGVXZGlBdkNRUUxMNUVVNDho?=
 =?utf-8?B?SWU0SDFrRy9xZFVEYXdDSG5zMnRvTzRpaW5WYnl0NXFEVGNDek5NQ1FXS2tw?=
 =?utf-8?B?Z3lBNWJXQVkyek9VeTBLYkR2VHl1K011N21VMDUyMmN3TFM5cWhBdnN4UndM?=
 =?utf-8?B?VFlUZEdVVlJRSXVWam81YUdMNFIwbDZKTXh0bFBEVXFmY2pnTjNPUStPNHlM?=
 =?utf-8?B?MHJJQVVWVTFXczdUTUo4SUZOUjQ0K0ZNdWEya3BzTFhpT0hlZmhlNTA2SkNn?=
 =?utf-8?B?YVlrdmh1QjVuUTBKVVdlMGt4MHU3RVNOVUxVVkgvTkpEcENEdVFwRG9Qd3o3?=
 =?utf-8?B?T0Mxek5PbmdLQzRMREE5azJSTFd1bWRZQ2JMcldLSUhNQ2wzRGxVdFJJajAv?=
 =?utf-8?B?NzR5d1Q4TER4eGFHTUF2L3Rpb01NWld2Uk9QYVFNRjhJZXc5WjBCbFB5Q1Vy?=
 =?utf-8?B?YlBxc295MG5XK1RTYW92QjE3S1dJbmpUQmRPaHc4eUl5ZXAzZjc2b1ZYd1Z0?=
 =?utf-8?B?M2xzdzVSTzd6VUhkNVJUZHJKam1YV243QTlPQnJBTm04d3FiYUhwR0taOSs1?=
 =?utf-8?B?WGVwa09kc3k2SWJUZlZVWU5mdVIrVlNNdFI0blBvcWRERjNKT05RMGx3Z05z?=
 =?utf-8?B?TFV1Y1duK0RqRUpkaDlwQmRUUzdJRWZSbEs4TGhPcmZYSUpuUEZlZU9zTDhs?=
 =?utf-8?B?eGJiS1ByaEtnaldMZk5FUllRdHQ2Mk5Qbi8vYzgrNkpPSjE2THVpejNMNm9U?=
 =?utf-8?B?ak1PZ1ZWR2J4bGtHOHBXMjNMY0drblJVblFPNFRaeTFpeFRCYW9lRHdaOXdT?=
 =?utf-8?B?bG8wWkdqd0VNaGFvK21LdHE3YjJzbWpabml0QXZxbXJ2K1RsU0NuZ0h3WUg2?=
 =?utf-8?B?bTd6Y2puU0swWEkwWXdhTHRPNkNQcWJRK1dhTjJ4UUVzcFQ0dGd0RTBpU2pt?=
 =?utf-8?B?S2dnQTdNdEUyMUdaSlZaOWpkNUpEeEk5c21oN3ZUWVUwa0pldHVFNGpvUUdi?=
 =?utf-8?B?clRDdWFieHJCb1Y3Szh5dDJiOXlsZzlkYURFYkFacjlDckMxdnlWMzRBamd0?=
 =?utf-8?B?bml6SHJFSDAvT1kyZnh6TFE0ZFB1Qkg2Q0Zac0Y4clEvVGRHMmJnUHI1R1NL?=
 =?utf-8?Q?JabjOY2cBjxMo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2834.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 611f60b5-f2b2-462d-1338-08d8a62363ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2020 02:43:39.8562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JkDlAbtQz9+2cUfmR/P5+jqhZAGMTojfZHEevN/vG5tBCZWDTL7BLOgAzfTvPQ+rLjCelFNY5SrSgMtUITzzB04tv5td8VHu7ApXp+aSE3I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3025
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 netdev <netdev@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, David S Miller <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSG9uZ3dlaSwNCg0KVGhlIE5DU0kgc2hvdWxkIHJ1biBvbiAzLjNWIFJNSUkuICBBY2NvcmRp
bmcgeW91ciBsb2csIHlvdSBlbmFibGVkIE5DU0kgb24gZnRnbWFjMTAwQDFlNjYwMDAwIHdoaWNo
IGNhbiBvbmx5IHN1cHBvcnQgMS44ViBJL08gdm9sdGFnZS4NCkRpZCB5b3Ugb2JzZXJ2ZSB0aGUg
c2FtZSBlcnJvciBvbiBmdGdtYWMxMDBAMWU2NzAwMDAgKE1BQzMpIG9yIGZ0Z21hYzEwMEAxZTY5
MDAwMCAoTUFDNCk/DQoNCi0tDQpEeWxhbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IExpbnV4LWFzcGVlZA0KPiBbbWFpbHRvOmxpbnV4LWFzcGVlZC1ib3VuY2VzK2R5
bGFuX2h1bmc9YXNwZWVkdGVjaC5jb21AbGlzdHMub3psYWJzLm9yZ10NCj4gT24gQmVoYWxmIE9m
IEpvZWwgU3RhbmxleQ0KPiBTZW50OiAyMDIw5bm0MTLmnIgyMuaXpSAxMDoyNiBBTQ0KPiBUbzog
SG9uZ3dlaSBaaGFuZyA8aG9uZ3dlaXpAYW1pLmNvbT47IFJ5YW4gQ2hlbg0KPiA8cnlhbl9jaGVu
QGFzcGVlZHRlY2guY29tPg0KPiBDYzogbGludXgtYXNwZWVkIDxsaW51eC1hc3BlZWRAbGlzdHMu
b3psYWJzLm9yZz47IG5ldGRldg0KPiA8bmV0ZGV2QHZnZXIua2VybmVsLm9yZz47IE9wZW5CTUMg
TWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz47DQo+IExpbnV4IEtlcm5lbCBNYWls
aW5nIExpc3QgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBKYWt1YiBLaWNpbnNraQ0K
PiA8a3ViYUBrZXJuZWwub3JnPjsgRGF2aWQgUyBNaWxsZXIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+
DQo+IFN1YmplY3Q6IFJlOiBbQXNwZWVkLCBuY3NpLXJ4LCB2MSAwLzFdIG5ldDogZnRnbWFjMTAw
OiBGaXggQVNUMjYwMEVWQiBOQ1NJIFJYDQo+IGlzc3VlDQo+IA0KPiBPbiBNb24sIDIxIERlYyAy
MDIwIGF0IDE3OjAxLCBIb25nd2VpIFpoYW5nIDxob25nd2VpekBhbWkuY29tPiB3cm90ZToNCj4g
Pg0KPiA+IERlYXIgUmV2aWV3ZXIsDQo+ID4NCj4gPiBXaGVuIEZUR01BQzEwMCBkcml2ZXIgaXMg
dXNlZCBvbiBvdGhlciBOQ1NJIEV0aGVybmV0IGNvbnRyb2xsZXJzLCBmZXcNCj4gPiBjb250cm9s
bGVycyBoYXZlIGNvbXBhdGlibGUgaXNzdWUuIE9uZSBleGFtcGxlIGlzIEludGVsIEkyMTAgRXRo
ZXJuZXQNCj4gPiBjb250cm9sbGVyIG9uIEFTVDI2MDAgQk1DLCB3aXRoIEZUR01BQzEwMCBkcml2
ZXIsIGl0IGFsd2F5cyB0cmlnZ2VyDQo+ID4gUlhERVMwX1JYX0VSUiBlcnJvciwgY2F1c2UgTkNT
SSBpbml0aWFsaXphdGlvbiBmYWlsdXJlLCByZW1vdmluZw0KPiA+IEZUR01BQzEwMF9SWERFUzBf
UlhfRVJSIGJpdCBmcm9tIFJYREVTMF9BTllfRVJST1IgZml4IHRoZSBpc3N1ZS4NCj4gDQo+IEkg
d29yayB3aXRoIGEgZmV3IHN5c3RlbXMgdGhhdCB1c2UgdGhlIGkyMTAgb24gdGhlIDI2MDAuIFdl
IGhhdmVuJ3Qgc2VlbiB0aGlzDQo+IGlzc3VlIGluIG91ciB0ZXN0aW5nLg0KPiANCj4gSXMgdGhl
cmUgc29tZXRoaW5nIHNwZWNpZmljIGFib3V0IHRoZSBzZXR1cCB0aGF0IHlvdSB1c2UgdG8gdHJp
Z2dlciB0aGlzPw0KPiANCj4gUnlhbiwgaXMgdGhpcyBhbiBpc3N1ZSB0aGF0IEFzcGVlZCBpcyBh
d2FyZSBvZj8NCj4gDQo+IENoZWVycywNCj4gDQo+IEpvZWwNCj4gDQo+ID4NCj4gPiBIZXJlIGFy
ZSBwYXJ0IG9mIHRoZSBkZWJ1ZyBsb2dzOg0KPiA+IC4uLi4uLg0KPiA+IFsgICAzNS4wNzU1NTJd
IGZ0Z21hYzEwMF9oYXJkX3N0YXJ0X3htaXQgVFhERVNPPWIwMDAwMDNjDQo+ID4gWyAgIDM1LjA4
MDg0M10gZnRnbWFjMTAwIDFlNjYwMDAwLmV0aGVybmV0IGV0aDA6IHR4X2NvbXBsZXRlX3BhY2tl
dCA1NQ0KPiA+IFsgICAzNS4wODcxNDFdIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgw
OiByeF9wYWNrZXRfZXJyb3INCj4gUlhERVMwPTB4YjAwNzAwNDANCj4gPiBbICAgMzUuMDk0NDQ4
XSBmdGdtYWMxMDBfcnhfcGFja2V0IFJYREVTMD1iMDA3MDA0MCBSWERFUzE9ZjA4MDAwMDANCj4g
UlhERVMyPTg4ZjgNCj4gPiBbICAgMzUuMTAxNDk4XSBmdGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJu
ZXQgZXRoMDogcnhfcGFja2V0X2Vycm9yDQo+IDB4YjAwNzAwNDANCj4gPiBbICAgMzUuMTA4MjA1
XSBmdGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJuZXQgZXRoMDogW0lTUl0gPSAweGIwMDcwMDQwOg0K
PiBSWF9FUlINCj4gPiBbICAgMzUuMjg3ODA4XSBpMmMgaTJjLTE6IG5ld19kZXZpY2U6IEluc3Rh
bnRpYXRlZCBkZXZpY2Ugc2xhdmUtbXF1ZXVlIGF0DQo+IDB4MTINCj4gPiBbICAgMzUuNDI4Mzc5
XSBmdGdtYWMxMDBfaGFyZF9zdGFydF94bWl0IFRYREVTTz1iMDAwMDAzYw0KPiA+IFsgICAzNS40
MzM2MjRdIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiB0eF9jb21wbGV0ZV9wYWNr
ZXQgNTYNCj4gPiBbICAgMzUuNDM5OTE1XSBmdGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJuZXQgZXRo
MDogcnhfcGFja2V0X2Vycm9yDQo+IFJYREVTMD0weGIwMDcwMDQwDQo+ID4gWyAgIDM1LjQ0NzIy
NV0gZnRnbWFjMTAwX3J4X3BhY2tldCBSWERFUzA9YjAwNzAwNDAgUlhERVMxPWYwODAwMDAwDQo+
IFJYREVTMj04OGY4DQo+ID4gWyAgIDM1LjQ1NDI3M10gZnRnbWFjMTAwIDFlNjYwMDAwLmV0aGVy
bmV0IGV0aDA6IHJ4X3BhY2tldF9lcnJvcg0KPiAweGIwMDcwMDQwDQo+ID4gWyAgIDM1LjQ2MDk3
Ml0gZnRnbWFjMTAwIDFlNjYwMDAwLmV0aGVybmV0IGV0aDA6IFtJU1JdID0gMHhiMDA3MDA0MDoN
Cj4gUlhfRVJSDQo+ID4gWyAgIDM1Ljc5NzgyNV0gZnRnbWFjMTAwX2hhcmRfc3RhcnRfeG1pdCBU
WERFU089YjAwMDAwM2MNCj4gPiBbICAgMzUuODAzMjQxXSBmdGdtYWMxMDAgMWU2NjAwMDAuZXRo
ZXJuZXQgZXRoMDogdHhfY29tcGxldGVfcGFja2V0IDU3DQo+ID4gWyAgIDM1LjgwOTU0MV0gZnRn
bWFjMTAwIDFlNjYwMDAwLmV0aGVybmV0IGV0aDA6IHJ4X3BhY2tldF9lcnJvcg0KPiBSWERFUzA9
MHhiMDA3MDA0MA0KPiA+IFsgICAzNS44MTY4NDhdIGZ0Z21hYzEwMF9yeF9wYWNrZXQgUlhERVMw
PWIwMDcwMDQwIFJYREVTMT1mMDgwMDAwMA0KPiBSWERFUzI9ODhmOA0KPiA+IFsgICAzNS44MjM4
OTldIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgwOiByeF9wYWNrZXRfZXJyb3INCj4g
MHhiMDA3MDA0MA0KPiA+IFsgICAzNS44MzA1OTddIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5l
dCBldGgwOiBbSVNSXSA9IDB4YjAwNzAwNDA6DQo+IFJYX0VSUg0KPiA+IFsgICAzNi4xNzk5MTRd
IGZ0Z21hYzEwMF9oYXJkX3N0YXJ0X3htaXQgVFhERVNPPWIwMDAwMDNjDQo+ID4gWyAgIDM2LjE4
NTE2MF0gZnRnbWFjMTAwIDFlNjYwMDAwLmV0aGVybmV0IGV0aDA6IHR4X2NvbXBsZXRlX3BhY2tl
dCA1OA0KPiA+IFsgICAzNi4xOTE0NTRdIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhlcm5ldCBldGgw
OiByeF9wYWNrZXRfZXJyb3INCj4gUlhERVMwPTB4YjAwNzAwNDANCj4gPiBbICAgMzYuMTk4NzYx
XSBmdGdtYWMxMDBfcnhfcGFja2V0IFJYREVTMD1iMDA3MDA0MCBSWERFUzE9ZjA4MDAwMDANCj4g
UlhERVMyPTg4ZjgNCj4gPiBbICAgMzYuMjA1ODEzXSBmdGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJu
ZXQgZXRoMDogcnhfcGFja2V0X2Vycm9yDQo+IDB4YjAwNzAwNDANCj4gPiBbICAgMzYuMjEyNTEz
XSBmdGdtYWMxMDAgMWU2NjAwMDAuZXRoZXJuZXQgZXRoMDogW0lTUl0gPSAweGIwMDcwMDQwOg0K
PiBSWF9FUlINCj4gPiBbICAgMzYuNTkzNjg4XSBmdGdtYWMxMDBfaGFyZF9zdGFydF94bWl0IFRY
REVTTz1iMDAwMDAzYw0KPiA+IFsgICAzNi42MDI5MzddIGZ0Z21hYzEwMCAxZTY2MDAwMC5ldGhl
cm5ldCBldGgwOiB0eF9jb21wbGV0ZV9wYWNrZXQgNTkNCj4gPiBbICAgMzYuNjA5MjQ0XSBmdGdt
YWMxMDAgMWU2NjAwMDAuZXRoZXJuZXQgZXRoMDogcnhfcGFja2V0X2Vycm9yDQo+IFJYREVTMD0w
eGIwMDcwMDQwDQo+ID4gWyAgIDM2LjYxNjU1OF0gZnRnbWFjMTAwX3J4X3BhY2tldCBSWERFUzA9
YjAwNzAwNDAgUlhERVMxPWYwODAwMDAwDQo+IFJYREVTMj04OGY4DQo+ID4gWyAgIDM2LjYyMzYw
OF0gZnRnbWFjMTAwIDFlNjYwMDAwLmV0aGVybmV0IGV0aDA6IHJ4X3BhY2tldF9lcnJvcg0KPiAw
eGIwMDcwMDQwDQo+ID4gWyAgIDM2LjYzMDMxNV0gZnRnbWFjMTAwIDFlNjYwMDAwLmV0aGVybmV0
IGV0aDA6IFtJU1JdID0gMHhiMDA3MDA0MDoNCj4gUlhfRVJSDQo+ID4gWyAgIDM3LjAzMTUyNF0g
SVB2NjogQUREUkNPTkYoTkVUREVWX1VQKTogZXRoMDogbGluayBpcyBub3QgcmVhZHkNCj4gPiBb
ICAgMzcuMDY3ODMxXSBJUHY2OiBBRERSQ09ORihORVRERVZfVVApOiBldGgxOiBsaW5rIGlzIG5v
dCByZWFkeQ0KPiA+IC4uLi4uLi4uLi4uLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBhZGQgYSBjb25m
aWd1cmFibGUgZmxhZywgRlRHTUFDMTAwX1JYREVTMF9SWF9FUlJfQ0hLLCBpbg0KPiA+IEZUR01B
QzEwMCAgZHJpdmVyLCBpdCBpcyBZRVMgYnkgZGVmYXVsdCwgc28ga2VlcCB0aGUgb3JpZ25hbCBk
ZWZpbmUgb2YNCj4gPiBSWERFUzBfQU5ZX0VSUk9SLiBJZiBpdCBpcyBuZWVkZWQsIHVzZXIgY2Fu
IHNldCB0aGUgZmxhZyB0byBOTyB0bw0KPiA+IHJlbW92ZSB0aGUgUlhERVMwX1JYX0VSUiBiaXQs
IHRvIGZpeCB0aGUgaXNzdWUuDQo+ID4NCj4gPiBIb25nd2VpIFpoYW5nICgxKToNCj4gPiAgIG5l
dDogZnRnbWFjMTAwOiBGaXggQVNUMjYwMCBFVkIgTkNTSSBSWCBpc3N1ZQ0KPiA+DQo+ID4gIGRy
aXZlcnMvbmV0L2V0aGVybmV0L2ZhcmFkYXkvS2NvbmZpZyAgICAgfCA5ICsrKysrKysrKw0KPiA+
ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9mYXJhZGF5L2Z0Z21hYzEwMC5oIHwgOCArKysrKysrKw0K
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IC0tDQo+ID4g
Mi4xNy4xDQo+ID4NCg==
