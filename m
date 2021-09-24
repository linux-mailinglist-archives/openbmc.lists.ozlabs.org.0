Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FBB416A70
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 05:33:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFyKW6zyHz302W
	for <lists+openbmc@lfdr.de>; Fri, 24 Sep 2021 13:33:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=x3kEcr+h;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.133;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=troy_lee@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=x3kEcr+h; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310133.outbound.protection.outlook.com [40.107.131.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFyJx1Lfmz2yNv
 for <openbmc@lists.ozlabs.org>; Fri, 24 Sep 2021 13:32:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwaZhA0PHKVinXb20HQszfetNR6fyBLn7t/GX04GsnDihzOFmD0lSrosHY4gyyodSiBi+UmNuIOezDkAMNpTLaeNdH+JPD41QU7wbEMIHcE8+dJ1PibgAxrpDcW7JIDt8Yh0g55slixVRvugYB7jgVb3uB/crdli8t3YdLHAverMFyKmSQ8HnmAQS0pGkRjX0rW7UpjeBGf3qXt6z0nomMPkVuSj6LDpwC4fg5L6ZsGqiQEWTojiCBbughC+iwMSwfHOxJvUm0JXneNqp2o2KcPDw0zFBq4Edq9HJAOV9fgejL0HeF8jn0Du1VvGMTtyHx/PiNR0okmlc//E16KPQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=a+QHHU769K6ozaWIwunPkR8BQDT6QS1s/J+tR4MJAy4=;
 b=iG30lVzRKEE9y1RKo9uQXby8sMt8AVmHvvy5fOFQEyjJ6kSnpwPrVvzI+Qov/vZJHjK6we5fjarDSAWqPwctZ/KTx9rNpbCSbLOHq0HjKgd/XXpPaaL4wj/FDjmANqVHLmsZqWjcfw50Z/e9SnaDccTZZJxh3CV+4WXUXRMve1DR7Ax7wExG7JpBwmShmgPzmqiRhhzrbpOmmmJMCCLjRh++/jEX3O5nDCzz23YvEax4wyBjNxgAxKVV7poArQWKdxvRj6+50DtGU/GEzwQ2bPcYEs8zhj5+jEW8jeBXXtGe3xAueIvudqKYj8tQqqirF0XniChBMe9FSTuMwS8abw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+QHHU769K6ozaWIwunPkR8BQDT6QS1s/J+tR4MJAy4=;
 b=x3kEcr+h5h1oLZP/8EfscVXOFBWRbMmMT/l3MwxZgoWVM0QQ8pR/KheQ1qUa4HwCmC5u1svss60QOvTwAQ3ja9R3FsyW9AHbqfi+cUu7v3+LkXbwceWN6FyjP+ML30fRkxPMqJUm0D6/3evOdjoNBTskBIxve4lluJoObU1MSwIgh6DMb6Hk7d2S4J6j1D3S5cNeFmfL4pRHpvRqwuGmXyL6jOXopuH5GzbwXse0x/fvOm1jMScU65CjahBcQc5HQZOZbVXnpOn+f12Ia2YdoyxntpSj0JQ9/RyWqYacMQFowk4z4gRKZyFRaj0g2IcB8HRUeGQlnOf0e5m6m6sItg==
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com (2603:1096:203:4b::20)
 by HK0PR06MB3219.apcprd06.prod.outlook.com (2603:1096:203:87::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 03:32:11 +0000
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::129:4c2d:a33b:abcb]) by HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::129:4c2d:a33b:abcb%5]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 03:32:11 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: Graeme Gregory <quic_ggregory@quicinc.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: AST2600 EVB eth0 (MAC1) Issue
Thread-Topic: AST2600 EVB eth0 (MAC1) Issue
Thread-Index: AQHXr8mYTmBOpgk5ikaBS3H2n9bWZauxT2OggADTXACAAEfAcA==
Date: Fri, 24 Sep 2021 03:32:10 +0000
Message-ID: <HK0PR06MB21457F237946252F810F07098AA49@HK0PR06MB2145.apcprd06.prod.outlook.com>
References: <8f36a6e9-eccf-5d9b-2c29-3546ded6ba5d@quicinc.com>
 <HK0PR06MB2145678C356EC1ADFB194D1E8AA39@HK0PR06MB2145.apcprd06.prod.outlook.com>
 <296f8f59-c6a5-5a1a-2567-63c7845e53d3@quicinc.com>
In-Reply-To: <296f8f59-c6a5-5a1a-2567-63c7845e53d3@quicinc.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: quicinc.com; dkim=none (message not signed)
 header.d=none; quicinc.com; dmarc=none action=none header.from=aspeedtech.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efa5cf0d-67f8-470f-7edf-08d97f0be4d9
x-ms-traffictypediagnostic: HK0PR06MB3219:
x-microsoft-antispam-prvs: <HK0PR06MB3219D371C1D59E977810E2478AA49@HK0PR06MB3219.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0nUjjN2THCw1gaNuVkpQtXu9hb6AZXS0ZIOT0r/DfjNdYzTCwrF410wAkJqfnvXRNrA5sAZ5omXMsgUD0/e0294ARDdAp1DN2h9WdpT1paucA+qUQq5eTbbV492KhswwLdxFosPaVxIVaU8HRli3XJf8AAd/U+u1YCz0kfO7gInFNfAw/Cr6+XDtq5U5RKCgQicsCIGPi8VW9PvKBgWXvJkmxVmZpObZLMLty5OEi4lwZqnl0QQ9uzaoD8w5LqdZDhvZRrOBGP9JjlLU7s/XX3wJY0Kh0TVnuDy8eBYBKOtrt5uSo30jXrzuS2Qv9H8yj71qkEO2u+oMMntwrhPRQwMr+DVdd0tws1TIbGmhmaKvzOdOV3Q7UGy+vJhKO/YcncBeXgcL5GPoH4D77Zx+eAbgTTk/cLjoSzJUH49fxDBc2jgW4zrNghge+73yhcS6hlkWyh/bsTHjGGI8apuT5FIzPDH1nkTdpRDRAYcWr50cdavKMtZQhtWvudmqpRYhiJsx8svKFY2SqCpl+ULMileR+O2mx59IAtF4xP6/QXEHGVtX+17blnPqPfw0QQobMdXPXSkaRbICE5pCa3fp8GJWEndZkopWk2ZX4rtkXmeKxACn6QU1T6ftgPdcldBEhXaMdC5PGZ41tocrcTAchNgybv7DmYaJ/l/6zeFe2IGK1GBmmDPaYcLVd08NU6MVwU4J0ZusRzb2nZ5TGu3z2w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2145.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(366004)(136003)(39850400004)(346002)(6506007)(76116006)(8676002)(53546011)(66556008)(66476007)(122000001)(64756008)(33656002)(83380400001)(55016002)(40140700001)(66446008)(66946007)(38070700005)(2906002)(186003)(38100700002)(8936002)(508600001)(316002)(52536014)(26005)(7696005)(110136005)(9686003)(86362001)(5660300002)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVM2NDRxU0lHbFQ4TTN1djdwaHZkM09XUWhYZTVFSkE1OHBoeU1YOVM5d0Jp?=
 =?utf-8?B?aDZ3R25UcmlWbm9iaXh3YUh3L1pmWExuZzVMdEY2Sks4REJ6eFFrUzAyK3lE?=
 =?utf-8?B?MFV5K0RtQnoxaHZPQnVFcXc1dDlTTXI1bGx2a0RlbFJYckgvODg3cnJCVFFz?=
 =?utf-8?B?QnB1NkZlM0Q0VGtPbzE2UzZjWmdLSUpkQUVNYzErY3pQMktkbm8ycGVWd0dB?=
 =?utf-8?B?SFJYQ2MwRFNNMjRzYVNlbDh0UnFyZDlwQTQvSEc0UEt6RzQxdTQrN2RzajM5?=
 =?utf-8?B?L0FiZ0NFUVRYbTZzUGxQNGc4QWNTbFpKaWZ2dU0wSFZxbDVrUElJeUhBbHBS?=
 =?utf-8?B?UWx0WFdlUnFmWmx4cVI2Z2doejIxZDI1bmdkdGd6LzgxN1JWSjhqVURMSHN0?=
 =?utf-8?B?clRIblFCV3NnNXFhM3ZLb25OK0NQRThiUldrWlpoaEdMQ2JsYzByd0JHcVA4?=
 =?utf-8?B?UUZXOE5oem1QWUN0SmtqUU9WNGtkKzFlNC9veHhwNEFJYTVyMU14eHlVNUgy?=
 =?utf-8?B?Y3l4TGUxek94ZHYrcnFZYklyZTBTbklhaDh5aENqR3dWaGk5TVM1bUgzR3Av?=
 =?utf-8?B?RjdvSmg2UXlERVJ0dmFpejdCMGZ4eDZXNGJFbjRtUmlmVy8vVW9xWlozcURI?=
 =?utf-8?B?MERjOEQyelVGVHcvR1gvMWk3WTBBdFRBZWNjdDQwUVY4emNqSTMvdSt2TjR3?=
 =?utf-8?B?czhSN09jQ1JPdkJMaUc2bjlsVk9URzBTMlRrYWRPWUlMcm1YY1l6NFAvYTJz?=
 =?utf-8?B?Wk9ickZydjgyV2x3QWJka2xTSHVZa3NEWndVaVRybWZvbEpCWXlWbWdDZWd4?=
 =?utf-8?B?TTE1S1ZCaTE1NktJcEx6NEcwNkZWTVVrMTlEUlVvSDdKdFFrWnRHR0pNTWJQ?=
 =?utf-8?B?MG9jMUNjWHF2aVNrTnVwOHdNbDNUd0J1M3Y2MVlNd3hHSTdKWHBpV1FZQlNt?=
 =?utf-8?B?d1dPTll3UTBISkN4L2tieW5WMENydE1VR1pnaFhKcEpxV1JrM0NwZDBmMHlF?=
 =?utf-8?B?REhNQ1ZFR0ZqUlBpcXNHeGsvaUFHYVRkOXhLK2IvVENYV0tya3A5MHhhK3FS?=
 =?utf-8?B?N1BZQUpIdy9ZQkFkMmQ4TjZRV0tLMzFOZXZFZTFzSWhnNGdzS3dnVEJRVDQz?=
 =?utf-8?B?WXhTb3hxUS9LWUIzSGR1elc4RFZIMHNRSDFHcXNLRmxXcFZnMU5vWWl2TFRy?=
 =?utf-8?B?eEhnd3RyWXU0WWpDVXZaMjJSQUxsUWtVcnA0OFhUTk9iQitrTDM3MjlRandj?=
 =?utf-8?B?aEdHNUJCK1YwMXhLTHZMc3VlcjIwbnhabUpKMWNMMXdLM2g3R3EwWFRYOWZh?=
 =?utf-8?B?enpyb1hwbnl6eTRWMGhZVCtNVzdCdkprSi9rYmNsRG1DTGZNdXFsNkNMcGlP?=
 =?utf-8?B?dzZWVUxNa2pzd2JrVVpia0dXd2thSkZWZ1g2U2NWMllGSUx5R0Y1YmUvRWlt?=
 =?utf-8?B?czJWbENCRFV3YUdLNVRBTWs0M2MwVlZEWXMzQmFTZ2VtR01zaE9mSzJTZHlD?=
 =?utf-8?B?S1JBTU1EQjNiYUtnTUIrTXZzcGdkVXdtbktMNThJVEtSVXk3d2I0TFZiZGVo?=
 =?utf-8?B?TnRhRnBlQnVSL2ZNdjZPNzBMbW5vOGJqMG03ZlJtNFVKa29wRWVnaGNSM2dp?=
 =?utf-8?B?bGU1MFo2R0t0WGdyZlo4cFlXVkdZNDg2aWt6VUdYblh0YmtnY2FSeDNORUgy?=
 =?utf-8?B?NXZjQ2w3WjVlN3Z1cFowcmw0V2RNSVVEeUk5S01URFdIdUhneG91dXpiNWNk?=
 =?utf-8?Q?qau9r23menQwcqGiOexbawzfH0cee7RcY6w01or?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2145.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efa5cf0d-67f8-470f-7edf-08d97f0be4d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 03:32:10.9693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qvJ9sqgzOUo0aV+0jprxgLrSfDitmF8I9kWTo6S5PHP3lywWGiSqhFPx9Y7diuW5nCBfIj9s0nW0pnI4YXdfaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3219
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

SGkgR3JhZW1lLA0KDQpXZSdkIGxpa2UgdG8gYXNrIHlvdSB0byBkdW1wIFNDVSByZWdpc3RlcnMg
KDB4MWU2ZTIwMDAgfiAweDFlNmUyZmZmKSB3aXRoIHlvdXIgY3VycmVudCBpbWFnZSwgdGhlbiB3
ZSBjb3VsZCBjaGVjayB0aGUgbWFjIGNsb2NrIGRlbGF5IGlzIGNvcnJlY3RseSBzZXQuIA0KWW91
IGNvdWxkIHVzZSBVQVJUIGRlYnVnIGNvbnRyb2xsZXIgKGRhdGFzaGVldCBzZWN0aW9uIDExKSBp
ZiBkZXZtZW0gaXMgbm90IGF2YWlsYWJsZS4NCg0KVGhhbmtzLA0KVHJveSBMZWUNCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHcmFlbWUgR3JlZ29yeSA8cXVpY19nZ3Jl
Z29yeUBxdWljaW5jLmNvbT4NCj4gU2VudDogRnJpZGF5LCBTZXB0ZW1iZXIgMjQsIDIwMjEgNToy
MyBBTQ0KPiBUbzogVHJveSBMZWUgPHRyb3lfbGVlQGFzcGVlZHRlY2guY29tPjsgT3BlbkJNQyBN
YWlsbGlzdA0KPiA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KPiBTdWJqZWN0OiBSZTogQVNU
MjYwMCBFVkIgZXRoMCAoTUFDMSkgSXNzdWUNCj4gDQo+IE9uIDIzLzA5LzIwMjEgMTA6MDksIFRy
b3kgTGVlIHdyb3RlOg0KPiA+IEhpIEdhZW1lLA0KPiA+DQo+ID4gV2hpY2ggc29jIHJldmlzaW9u
IGFuZCBldmIgYm9hcmQgcmV2aXNpb24gYXJlIHlvdSB1c2luZz8NCj4gPiBDYW4geW91IHRyeSB0
byB1c2UgcGh5LW1vZGUgPSAicmdtaWktcnhpZCIgZm9yIGV0aDAvMSBpbiB5b3VyIGR0cz8NCj4g
Pg0KPiA+IFRoYW5rcywNCj4gPiBUcm95IExlZQ0KPiANCj4gSGkgVHJveSwNCj4gDQo+IFNvYyBS
ZXY6LQ0KPiANCj4gVS1Cb290IDIwMTkuMDQtMDAwODMtZ2U1OTAyMTc0ZDktZGlydHkgKFNlcCAy
MiAyMDIxIC0gMTU6MTA6MDMgKzAwMDApDQo+IA0KPiBTT0M6IEFTVDI2MDAtQTENCj4gDQo+IA0K
PiBFVkIgUmV2Oi0NCj4gDQo+IEFTVDI2MDAtRERSNCBFVkIgVjEuNA0KPiANCj4gDQo+IHBoeS1t
b2RlID0gInJnbWlpLXJ4aWQiIGluc3RlYWQgb2YgInJnbWlpIiBpbXByb3ZlcyB0aGUgaXNzdWUg
YW5kIEkgbm93IGdldA0KPiBESENQIG9uIHRoYXQgaW50ZXJmYWNlLCBidXQgcGFja2V0IGxvc3Mg
aXMgc3RpbGwgaGlnaHQgY29tcGFyZWQgdG8NCj4gZXRoMSAoTUFDMikuDQo+IA0KPiBldGgwDQo+
IHBpbmcgLWYgMTkyLjE2OC4yMjIuMTE5DQo+IFBJTkcgMTkyLjE2OC4yMjIuMTE5ICgxOTIuMTY4
LjIyMi4xMTkpIDU2KDg0KSBieXRlcyBvZiBkYXRhLg0KPiAuLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uDQo+IC4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4NCj4gLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u
Li4uLi4uLi4uLi4uLi4uLi4uXkMNCj4gLS0tIDE5Mi4xNjguMjIyLjExOSBwaW5nIHN0YXRpc3Rp
Y3MgLS0tDQo+IDU5NyBwYWNrZXRzIHRyYW5zbWl0dGVkLCAzMzAgcmVjZWl2ZWQsIDQ0LjcyMzYl
IHBhY2tldCBsb3NzLCB0aW1lIDY3NzVtcw0KPiBydHQgbWluL2F2Zy9tYXgvbWRldiA9IDAuMDc4
LzgwOS44NDUvMzI2Ni4yNjMvMTA5OS4yMDggbXMsIHBpcGUgMjA1LA0KPiBpcGcvZXdtYSAxMS4z
NjcvMzAuMDI0IG1zDQo+IA0KPiBldGgxDQo+IHBpbmcgLWYgMTkyLjE2OC4yMjIuMzANCj4gW3N1
ZG9dIHBhc3N3b3JkIGZvciBnZ3JlZ29yeToNCj4gUElORyAxOTIuMTY4LjIyMi4zMCAoMTkyLjE2
OC4yMjIuMzApIDU2KDg0KSBieXRlcyBvZiBkYXRhLg0KPiAuXkMNCj4gLS0tIDE5Mi4xNjguMjIy
LjMwIHBpbmcgc3RhdGlzdGljcyAtLS0NCj4gNTA1OTEgcGFja2V0cyB0cmFuc21pdHRlZCwgNTA1
OTAgcmVjZWl2ZWQsIDAuMDAxOTc2NjQlIHBhY2tldCBsb3NzLCB0aW1lDQo+IDU1NTBtcyBydHQg
bWluL2F2Zy9tYXgvbWRldiA9IDAuMDgzLzAuMTA1LzAuODE2LzAuMDA0IG1zLCBpcGcvZXdtYQ0K
PiAwLjEwOS8wLjEwNCBtcw0KPiANCj4gVGhhbmtzDQo+IA0KPiBHcmFlbWUNCj4gDQo+ID4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IG9wZW5ibWMgPG9wZW5ibWMtDQo+
ID4+IGJvdW5jZXMrdHJveV9sZWU9YXNwZWVkdGVjaC5jb21AbGlzdHMub3psYWJzLm9yZz4gT24g
QmVoYWxmIE9mDQo+IEdyYWVtZQ0KPiA+PiBHcmVnb3J5DQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwg
U2VwdGVtYmVyIDIyLCAyMDIxIDExOjQ5IFBNDQo+ID4+IFRvOiBPcGVuQk1DIE1haWxsaXN0IDxv
cGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQo+ID4+IFN1YmplY3Q6IEFTVDI2MDAgRVZCIGV0aDAg
KE1BQzEpIElzc3VlDQo+ID4+DQo+ID4+IEhpLA0KPiA+Pg0KPiA+PiBJIGtub3cgQTAgdmVyc2lv
bnMgb2YgdGhlIEFTVDI2MDAgaGFkIGFuIGlzc3VlIHdoZXJlIGV0aDAgd2FzIG5vdA0KPiA+PiB3
b3JraW5nLCBidXQgdGhlIGVycmF0YSBpbmRpY2F0ZXMgdGhpcyBpcyBmaXhlZCBpbiBsYXRlciBy
ZXZpc2lvbnMuDQo+ID4+DQo+ID4+IEkgYW0gc2VlaW5nIGFuIGlzc3VlIG9uIHRoZSBFVkIgYm9h
cmQgdGhvdWdoIHdoZXJlIGV0aDAgKE1BQzEpIGlzIG5vdA0KPiA+PiBmdW5jdGlvbmFsLiBUaGUg
b3RoZXIgdGhyZWUgcG9ydHMgYWxsIGZ1bmN0aW9uIGFzIGV4cGVjdGVkLg0KPiA+Pg0KPiA+PiBP
biBteSBESENQIGhvc3QgbWFjaGluZSBJIGNhbiBzZWUgREhDUCByZXF1ZXN0cyBmcm9tIHRoZSBB
U1QyNjAwLA0KPiBhbmQNCj4gPj4gcmVwbGllcyBhcmUgc2VudC4gTG9va2luZyBhdCAvcHJvYy9p
bnRlcnJ1cHRzIGl0IGxvb2tzIHZlcnkgbXVjaCBsaWtlDQo+ID4+IG5vIElSUXMgYXJlIGV2ZXIg
Z2VuZXJhdGVkIGZvciBpbmNvbWluZyBwYWNrZXRzLg0KPiA+Pg0KPiA+PiBUaGFua3MNCj4gPj4N
Cj4gPj4gR3JhZW1lDQo+ID4+DQo=
