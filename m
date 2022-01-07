Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A16488E5E
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 02:54:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXH1j5tp3z2xvv
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 12:54:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=H0LbmyXA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.255.103;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=potin.lai@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=H0LbmyXA; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2103.outbound.protection.outlook.com [40.107.255.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVcpZ3MV0z2yZY
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jan 2022 20:08:52 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbMwCbSDBXBsEhqt5P9RpY5mVq8rpsBl+NX9z7rRMRhygG6PL7GNAuzBYAyMQ8ylgvKDOIq6+y6eHrggHfQ95W0XfM83hvk6h+3Eohc1hTn/6UARl3NMIJTo9ekr1o1RbS3WqYHvH34XqFtn4vEowQWZovfPmLwOn8i35r3DqSr7vz/SwTKELVDtAaqySKXUAcgT4RGFdQQC0sorqsQfm8myrBw7cumeEnL1aP069+9s/mqigYRckfQShHG8i/cDE0KhP62se/4SzcUwjvKYQXwEG+jAqx7NxegO8JzHfZ5O+xq4s0lq85E/5MbfyDY/1b6EksGw3ONmBJwvxPbyew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvtnwVBVTo+aVGgNXadkER8GumQyvqZQ2zONV9nfLls=;
 b=dp326IAf8Oec0y6Grj8LinlR1+hhMFA+vDDtnmAGGXKJqUPgMbjDCtAspkAnH+8BuF78B1O5PIOfKIPlGGH//mUs1aHEjPQ27XGsvCs2D10qn1LgaelVRqpHDF4OajmNwLrIreG2Y1yOyQmC0+O5Zxx/MgNZSTQJpb3+BlVqZRuxJGV8sbTcHF1MlVyjzm3TlodqwxK3PFq3GrwxJF7NYBE/1o3y3R2/8yj+w8kOwpQN7ip0UJe9KPURUbpUSbJOVOZnh0ZpaSIUacVb6+l7wmNrkBSSRd+0xcRnfGbIHLAKapCExStqMa9T4oXdTerC5us8oNgZHGi05qCB5hDOVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvtnwVBVTo+aVGgNXadkER8GumQyvqZQ2zONV9nfLls=;
 b=H0LbmyXArQlOQRfjvf30p8zliyhmwWioqw2awimLhAxBnd5js26X4RGINYbl8gg1k3GGHLj+LgOQvqgSNBl6OQlYjBDKpTkErEx///Pimmt3wiqhT1Wg/beXsB4pxZB8eLI60GKwEoEdzJHzxpjIBt0rAOPLxdRolcl0F6qPSis=
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com (2603:1096:203:89::17)
 by HK0PR04MB3154.apcprd04.prod.outlook.com (2603:1096:203:8d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Fri, 7 Jan
 2022 09:08:31 +0000
Received: from HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53]) by HK0PR04MB3282.apcprd04.prod.outlook.com
 ([fe80::8160:1a0:97e1:9e53%3]) with mapi id 15.20.4844.016; Fri, 7 Jan 2022
 09:08:30 +0000
From: =?utf-8?B?UG90aW4gTGFpICjos7Tmn4/lu7cp?= <Potin.Lai@quantatw.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 =?utf-8?B?SG93YXJkIENoaXUgKOmCseWGoOedvyk=?= <Howard.Chiu@quantatw.com>
Subject: RE: [PATCH linux dev-4.7] Porting tach driver for ast26xx from Aspeed
 linux
Thread-Topic: [PATCH linux dev-4.7] Porting tach driver for ast26xx from
 Aspeed linux
Thread-Index: AQHX5yRNtnkhQSklCEKl5+PNfzVjBKwek70AgAAE2yCAAARJgIAAB3GAgDjWPlA=
Date: Fri, 7 Jan 2022 09:08:30 +0000
Message-ID: <HK0PR04MB3282DE4F2336ED23E613FC128E4D9@HK0PR04MB3282.apcprd04.prod.outlook.com>
References: <20211202022623.182903-1-howard.chiu@quantatw.com>
 <CACPK8XcWt18nm0+BYomnWkRCRBqhYJ04y4c_P1nTczLpjyVXcA@mail.gmail.com>
 <HKAPR04MB400364D203AA1D050B753B2196699@HKAPR04MB4003.apcprd04.prod.outlook.com>
 <CACPK8XeCHTDCCd=087BSYw3mq=Hjx=vgCrM17r4ZFtVCazhfHw@mail.gmail.com>
 <70AF2EA6-A267-41BA-B90D-7730A918AC34@aspeedtech.com>
In-Reply-To: <70AF2EA6-A267-41BA-B90D-7730A918AC34@aspeedtech.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9d16e1b-efa9-4cd4-1c3d-08d9d1bd4665
x-ms-traffictypediagnostic: HK0PR04MB3154:EE_
x-microsoft-antispam-prvs: <HK0PR04MB3154720888C458C0C80B9EA78E4D9@HK0PR04MB3154.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aC4c0qFQnIpkeNCbTtdOwh96uVDRiV0KLR+Q6pX4RqLXj+nIXX1T9DZTjTStgCTIlKIYEs+IBCAhQjut6fgo8dHFq45GiOJEVZ7hyg0h8EWBfXgUrOQvOUsok7tp+yl6PRzVNKmxRky/zMqVduEN+zAsbKihUSZT1QSNz/E5xAfJtEsA+9GoeHY0zprHSWi5L7GmSHIn6rO9WNHeD8n0N5cFwgRjBeHuGUj29p3wuoCEyb9TUSQmZOqLU+cu0WWkD/iPdHJWU61ocgTizclP1YFkvvmIYSirimRAbXHF8Hat3j/87rI/cUI88NQg9TdqYbFdHJr5d6/72e4XVitGKCj07NyZBmYOEIPLAPdGqbOB+rdEi070KMaVy451+sQ15WiOxZtE9pn3vqoMWFnoGv1d+TqV6f6p36EltDyF7vwEBN027vuVTMAnJup5HKWE7BAtR6Kn/vAXSn+0viuzHGRfKjaU6d01FbUHo6Es1p50MV7ZBcDGOQlDHobAFFJI/aYCYGTD2iJuLZ6nINaWVzGmOnUAwPpwqqvZGdklXUp5aH/BcgH4pbcB6og5kC5uATYm+vbh0uOzWIDX7YA690zCeA6xxb0jL9q6x9BKfj6XPZSQL25eN+vPaceLvUFvW2guhQj5oG+oxEyBKYHukBWPd732pIqIMoLFs4BV18jxYlNIXdNysJ8f1VfbCYdT7v4bmBwTDIMlQruJQK8c2w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3282.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(4326008)(38100700002)(122000001)(66556008)(7696005)(186003)(2906002)(38070700005)(5660300002)(55016003)(66946007)(52536014)(85182001)(316002)(26005)(33656002)(6506007)(9686003)(8676002)(53546011)(86362001)(8936002)(66446008)(54906003)(66476007)(6636002)(64756008)(110136005)(76116006)(71200400001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SkNiTG0xdjlRU0tBcnJCRTd4T3Q0VDZqV0pXeWFycGFuNmtIczBLNnh3SFU0?=
 =?utf-8?B?dWd6RE82S01mcTlabFhXRVg1OGhXSU1OSDVra1F6cW1SRWtPZHp4VWg5eFVL?=
 =?utf-8?B?LzZCa3pzWEc5Z0ZSR0FESzV6dXFZUnhnSWpJVlJ4amJZdUtpd3ZUbFozbUIz?=
 =?utf-8?B?aFdPYjJCc2R0bXJ5TFRoY2xwNzIvQ1ZLSFRRcS9tcitvMmhldllXZWlZVTFH?=
 =?utf-8?B?SE5KdVNsemZCSjhEOW8zMnBZVWlJTXdVd0YvNnZEQmxGRFY5NDlsaWFmbmY2?=
 =?utf-8?B?RklWbXk4Z1hJRVZ2N0V3dTVITHNzbHZmS0s0S0tyeGxBekprUGNFVUg3emF3?=
 =?utf-8?B?VUtzSHAzNVJFN1hjOHNWZFlrZytRQ0syWWhEMWh6cXpuZ2dNUXhVdnRsZUJs?=
 =?utf-8?B?WXhUazl3Vzlsa3VqZnlidFdJOFBWRkpIc2wwbUM5bkhKbGRPWUludlJ3Yi92?=
 =?utf-8?B?eWcwdlZFZlFwZ1gvV1ZuTnJLQ0tQalRHSW1kcmZGcXZSTFZlZ0E0dVJSTnRy?=
 =?utf-8?B?dE85cUJJQ0FFTzZ3Q2NDb2hqb2prZlNCMjlOTzhBVlFpRlBBOW5ETE85RFB1?=
 =?utf-8?B?WkhMWTdNYitZMjVRNytpb2wySWpSNHZTRThxdjA0YVJtWDA3VmdTbkZLaFZQ?=
 =?utf-8?B?VnFaTlVTczlhYXNXVndMRGRxeDd0SHFBdGdJa0RXdHZTMUlqY0ppS2VueGow?=
 =?utf-8?B?aUlxMlVDQUpvZ2VVUE9XZm9CSW9heHV2NHhmRWc5Z0hvNEZlWXJ2SVFRYXlN?=
 =?utf-8?B?eTFNQUsrSTZwVzNlbFZJemNDVklYWTE2SnBQeTRQcVE1bUJBQ2lYZ1BiaVJa?=
 =?utf-8?B?QkVHekFJZWdPaTZVU3RXekdnMWZGcXFEQmNPM2k3NCtiR2M3czhzeGFqOGts?=
 =?utf-8?B?clZLS282R202d09kOGo0REh1QUdHaUtOKzMzc05yWXg1YUlGRXFSd29sV3RT?=
 =?utf-8?B?ZmVwdjZVMG53SnZIRTFIdjJPUGZmV0dqUDhVSHJRWVpDYTBjcW53eTFsRE1N?=
 =?utf-8?B?ekhjMXBGV21xR3RtWGpiaUN5aUh6SHVmN3FYQlFBNWs2ckxrU0JaSUJYUm9N?=
 =?utf-8?B?Lzd2Ni82bWlZY1BDb3dHRkN4L3I3U242aXA5SGQ2a0tEUXBpNHNNVi9GUS9B?=
 =?utf-8?B?NEN3RldwS1MxT2NZQXJJaTFmOE8wNWpqYTE2aDFHa1BDcVQwTWpLaTNIMy9X?=
 =?utf-8?B?NFFsWDBjaEJhVDE1MVFDck9Ob25OS2RNdittSnE2ajZ5MUJwSHFoM1dXNWE3?=
 =?utf-8?B?V0xGV3U4MUl2VVFVY1c0MDhQZktYUldTTU5ET1NRb2dNQnB6aG1Na2FKZmVz?=
 =?utf-8?B?a3hrWW1vZmdtVXcwZU5iQTVsUFA2dUNjemlCZnM1OXg0Q1ZqY0ZsdTVDNkw0?=
 =?utf-8?B?aEF1cmlsdy83Nm1GUGxmTjU4V2o5RlgwVHpBSEUwSEdYcDJ4T0RQYnNFQTRO?=
 =?utf-8?B?amJSMHBZVHZGRnNtTTN6RlZXQnhaL1RYc1F6aE1VakxSR2VvY2R4MDJWWnFP?=
 =?utf-8?B?elpnVWNQSkx4ZGcvMFlqQXliazBjUkQyVmVjb0ZhR3FQSUNWUndsL2R3OFRu?=
 =?utf-8?B?MndHRlZKZHBXOXQ1ODM0TTBuSjU3aUxzNUpVMURrVWVnQVQyU0hCV3R5OWpz?=
 =?utf-8?B?MVZuVHZ5SDNodiswWjl6ZWoxK1NlbngzQ3N0UC81dUphWG1HdnIyeDFpeklF?=
 =?utf-8?B?OW9pWkFaSDFLT0xpNUthT1dBZzVyUXduQk1BVlU4UTFHZFFEbkd1YUR6cWgr?=
 =?utf-8?B?ZExwc3loem0xOXRuakt6QS9kdDc4OGhOU010dTYzeU4yWGN2TWU2WERNQXVS?=
 =?utf-8?B?VnFPcWJFNHZtbFZHL05za01KTm9KOVczakZkM01JNHMrdGNlNG0yYmIrVVAz?=
 =?utf-8?B?cndmZ1FyV3F3NmRBdlUweENSUmZjYlozdFV4Qm1SSlFLZktLSGVtV2JrR0xa?=
 =?utf-8?B?UUlyOTlEWno5YzlZNktLL2JacERqUldWZnNlQUQvcy9EaXBFY1JBc3c0cUhh?=
 =?utf-8?B?V1BKK1l1OWJZMEpILzVDYVQ1RFRKbEVZRUhsWFZxMnQvWmxhUGRIR24xMEIr?=
 =?utf-8?B?S0dKa2dkUDVXbklMYWwvTHJ5cHJQbFMrQjRwcU0wNjBhcG1ySmc4QlM2TVVx?=
 =?utf-8?B?L05WanQ2dmJ1QVZMY3JSc2I0dU80eVl4ZnBLejNWWFdna2YrcUxPVk1ndDl5?=
 =?utf-8?Q?mZLyFs19YZ4PVT17PgXEK6s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3282.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d16e1b-efa9-4cd4-1c3d-08d9d1bd4665
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2022 09:08:30.8441 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JnF4v1app7f9Rq9a5LjirwYvdDFco/NRNZz8vzhD1V9sndswzG1N/8bOhxmFNBgohfWYMfcJ051o3kYF7VVfVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3154
X-Mailman-Approved-At: Mon, 10 Jan 2022 12:50:43 +1100
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
Cc: Howard Chiu <howard10703049@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQmlsbHksDQoNCkp1c3Qgd29uZGVyaW5nIHRoYXQgYXJlIHRoZXJlIGFueSBwbGFuIG9yIGRh
dGUgZm9yIGFzdDI2eHggUHdtL1RhY2ggZHJpdmVycy4NCkFzIEhvd2FyZCBtZW50aW9uZWQgZWFy
bGllciwgT3VyIHBsYXRmb3JtIHdpbGwgbmVlZHMgdGhlIGRyaXZlcnMgcmVhZHkuDQoNCkJlc3Qg
cmVnYXJkcywNClBvdGluDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBCaWxs
eSBUc2FpIDxiaWxseV90c2FpQGFzcGVlZHRlY2guY29tPiANClNlbnQ6IFRodXJzZGF5LCBEZWNl
bWJlciAyLCAyMDIxIDEyOjU5IFBNDQpUbzogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT47
IEhvd2FyZCBDaGl1ICjpgrHlhqDnnb8pIDxIb3dhcmQuQ2hpdUBxdWFudGF0dy5jb20+DQpDYzog
SG93YXJkIENoaXUgPGhvd2FyZDEwNzAzMDQ5QGdtYWlsLmNvbT47IE9wZW5CTUMgTWFpbGxpc3Qg
PG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz47IFBvdGluIExhaSAo6LO05p+P5bu3KSA8UG90aW4u
TGFpQHF1YW50YXR3LmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggbGludXggZGV2LTQuN10gUG9y
dGluZyB0YWNoIGRyaXZlciBmb3IgYXN0MjZ4eCBmcm9tIEFzcGVlZCBsaW51eA0KDQpIaSBKb2Vs
LA0KDQpPbiAyMDIxLzEyLzIsIDEyOjMyIFBNLCAiSm9lbCBTdGFubGV5IiA8am9lbEBqbXMuaWQu
YXU+IHdyb3RlOg0KDQogICAgT24gVGh1LCAyIERlYyAyMDIxIGF0IDA0OjI5LCBIb3dhcmQgQ2hp
dSAo6YKx5Yag552/KSA8SG93YXJkLkNoaXVAcXVhbnRhdHcuY29tPiB3cm90ZToNCiAgICA+ICAg
Pg0KICAgID4gICA+IEhpIEpvZWwNCiAgICA+ICAgPg0KICAgID4gICA+IFllcywgdGhpcyBwYXRj
aCBpcyB2MTQgSSBqdXN0IGRvd25sb2FkZWQgZnJvbSBwYXRjaHdvcmsgYW5kIHRlc3RlZCBpdCB3
aXRoIEZhY2Vib29rIEJsZXRjaGxleSBwbGF0Zm9ybS4NCiAgICA+ICAgPiBJIGFtIG5vdCBzdXJl
IGlmIHRoZXJlIHdvdWxkIGJlIGZ1cnRoZXIgcmV2aXNpb24gb2YgdGhpcyBkcml2ZXIsIGJ1dCBt
eSBwbGF0Zm9ybSBuZWVkcyBhc3QyNnh4IFBXTS9UYWNoIGRyaXZlci4NCiAgICA+ICAgPiBJIHdp
bGwgc3luYyB0aGlzIGRyaXZlciB3aXRoIEJpbGx5J3Mgd29yay4NCg0KICAgID4gICA+VGhhbmtz
IGZvciB0aGUgZXhwbGFuYXRpb24uIEluIHRoZSBmdXR1cmUsIGl0IHdvdWxkIHBheSB0byByZWZl
cmVuY2UNCiAgICA+ICAgPnRoZSB3b3JrIHlvdSd2ZSBiYXNlZCB5b3VyIHBhdGNoIG9uLCBhbmQg
a2VlcCB0aGUgb3duZXJzaGlwDQogICAgPiAgID5pbmZvcm1hdGlvbiBpbiB0aGUgcGF0Y2guDQoN
CiAgICA+ICAgQmlsbHksIGFyZSB5b3UgaGFwcHkgd2l0aCB1cyBwdXR0aW5nIHYxNCBpbnRvIHRo
ZSBvcGVuYm1jIHRyZWU/DQoNClN1cmUuIERvIEkgbmVlZCB0byBzZW5kIGFub3RoZXIgcGF0Y2gg
Zm9yIHRoZSBvcGVuYm1jIG9yIHlvdSB3aWxsIGFwcGx5IHRoZSB2MTQgaW50byB0aGUgb3BlbmJt
YyB0cmVlPw0KDQpCZXN0IFJlZ2FyZHMsDQpCaWxseSBUc2FpDQoNCg0K
