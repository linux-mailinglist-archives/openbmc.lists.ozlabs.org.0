Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2D162065B
	for <lists+openbmc@lfdr.de>; Tue,  8 Nov 2022 02:53:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5rjb3D59z3cJ3
	for <lists+openbmc@lfdr.de>; Tue,  8 Nov 2022 12:53:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=mHKKYq8W;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.92.137; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=mHKKYq8W;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2137.outbound.protection.outlook.com [40.107.92.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5rhz1tXXz3cBD
	for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2022 12:53:05 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nC3Q2zeAUd9gEFAvTA0nOkKy76H/MfCSUXWHWVx/TR6NEG9+yOcA4cFBsRUs3p0fu0HQDD9C3eIDim83kjoBmNEDvUWBKWJl+Uh7UbDhf/d7W9wSHVRV9h3mUMvJMiLhUdUyfxE44jwvLM4sT90a4EXJvqI+McyC8o7ekcjJofMllnqSy41dKgu7ygAYmAOD4+Zmuvbap44NT4QlWI1kxmGYw1fHf+tUv3PDHCnU08KODlFnhFkhEj6iQYRU7V4vZxRQv83IfsmXw2S6v3jLlf42znbTjeagmZojpD9nSdGFz++CwAOQpuMsQ9PXU7kHp/LTZz9mrVsi/It8cBwMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gT+r3woir958lt+ISSDb7V+8MKa7KN+fzy4I794gahI=;
 b=hF60cVWceZRQwtEG4ijHBQ5VSe7Nz1RD6FXZHposQdcoOVGN7pfZn2G+OiXbk8mjy2LLTFgZ8GxsqQLHq4cgIevzACzc8yMi5X5Ua1DsWRmPu4pyFZxA3LcP5W3m+g0DDi+X2+FbWIhNIsL+Wjr6W5JVU8x8eRyvZQoqy3OSaUOPvyJAB4Zsdt4KdKpFRzZ9BldfgCfwg1zM3RwIlHiAUvlV2Xsxp5c3jPFULZiNy6DJIBhdZJ788MQR3kDWq0qulW+N5TG/wnEwuQ9J3SH4iy3xaolqafhunnT2bpyRDccQCzewtXwSZP+9scc9Ief8cnuqtGLvdPR6J9ub4r0vLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gT+r3woir958lt+ISSDb7V+8MKa7KN+fzy4I794gahI=;
 b=mHKKYq8WhKwUQYDxM4zBKutUOPVvRozZIotLZ9/6XzpRoZ4qdNY7adS2XAp8JvwSBWvHRYtawmCwvdJX5/gWRCHz0A/naqwp/F3VYu0D9op37m2WMqr2VobmIwqfgJMnSyMR7YJO7ks3exnjIBqVHXWsAzP+K7jznOXFtVcA4nM=
Received: from BL1PR01MB7747.prod.exchangelabs.com (2603:10b6:208:39a::12) by
 SN6PR01MB4783.prod.exchangelabs.com (2603:10b6:805:d5::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.23; Tue, 8 Nov 2022 01:52:44 +0000
Received: from BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::d51:dc18:9f0a:ef2d]) by BL1PR01MB7747.prod.exchangelabs.com
 ([fe80::d51:dc18:9f0a:ef2d%5]) with mapi id 15.20.5769.021; Tue, 8 Nov 2022
 01:52:43 +0000
From: Thang Nguyen OS <thang@os.amperecomputing.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: project wide changes to maintainer ACLs
Thread-Topic: project wide changes to maintainer ACLs
Thread-Index: AQHY7X19CSleHU+b706IX4VlP5pnaq40QX+AgAANGQA=
Date: Tue, 8 Nov 2022 01:52:43 +0000
Message-ID: <a364a12d-e34f-cef2-56bc-e23aeb2f5684@amperemail.onmicrosoft.com>
References: <20221031230552.5ssc33v2xnghooqy@cheese>
 <20221108010549.smzzyma5nzgon76l@cheese>
In-Reply-To: <20221108010549.smzzyma5nzgon76l@cheese>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR01MB7747:EE_|SN6PR01MB4783:EE_
x-ms-office365-filtering-correlation-id: 6ee17607-a8d2-4bcb-849b-08dac12bed61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  6DKo8ifNSUb3aI4ds4YTXeUxpAafSfNfA+J6Ezw5I38X0iqx7z7vbO22Hqbk/EjgcY5zbDyyttNzL55Segk9f1aXKxJDUb4yIlGqy7sp7gUgTWWfQ/vGXkpJFx18PQgDyG/qmTAxanywHoH30HoeseW5CKfcZd105pPczBCfBs5v0uKxjYGEAvfFtpNgOnXg9zmk5/xLtBrQipN5SBllGV+xH4F2B6UdCXdsjTgau4FTx85iYv+0w1uPxf94AnBDqCsAwi/sEHYwrd362H9HCA7HMBcEfFj6wmd+HhnfshDqKJ/rHe4fGSOp/q0Opu/RWdwo/Idws9p2DJuLl3RK76YfSEuLy28z8mdGKqVfw9al+zF5pTZ2xMTeZxsmmQrh6sLS1kZxpKPNj/0+Xe6Hu15ccDY+ntCvPca0ddAMqqbygcj2PiiHVQK83m9Q5snicWdUhNGq0zJKwpl6QrlbhmJouhRlu+MgfGyYQ3nXjTafc7ziXITvFqixUjwjZhh+n4r5qYRU5EVj+pvLKZ2vGADVYd3tCj4zBEtyobPmxORMfsFuGCL+tfU4m9VSIKgZu1rWM6POhrWkMi1A5NemaQ/Lei05LmxzRzUM2+JZz75aOw2CLeX+nP+9+U9HkZk3uwoLIERnXlAnwvCsrTJsZDNyakMaLMBCZs2R5XGatXVqFvBr5cTZb7PtlvF64KySGGCln/qXlbLYhcHB2b/Pj8mLUZggfnW2+1UO3aezKQd/jL+dPoSdbWJIFVBiIQ4aea3iJkp7vPB2gd4XE5e+3Cq3AaeCjUz+04Fdj2RZ0kubctIPnPrnAyoiro3OzQeo
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR01MB7747.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(366004)(39850400004)(451199015)(31686004)(6506007)(6512007)(9686003)(53546011)(186003)(26005)(31696002)(122000001)(71200400001)(66946007)(64756008)(66476007)(66556008)(66446008)(8676002)(6916009)(316002)(38070700005)(38100700002)(76116006)(478600001)(91956017)(83380400001)(41300700001)(8936002)(86362001)(2906002)(5660300002)(6486002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OTZwbFhtdWtodjJNZVZkbGdJL3F3N3VrM3JKY1Y1UXphY040UlJ0S1NNbkYx?=
 =?utf-8?B?UHg3Y0hTUEN3cU1FQVR3THhmWExaSHBYanNndDRSdXF5YlRXWXhRU0tiN1V4?=
 =?utf-8?B?NFRSaHFENEUvYTg1Z1RKNUd0TmJFcjNBcmowT2NpK053STB3WDBvMFBXWEpW?=
 =?utf-8?B?bm5BVEZhbTlpd3BtZnVicXFySyswMm1tUUFDYmRiYnVzRzRBak05SHJndWZN?=
 =?utf-8?B?OG11blNqQTJ2V293Mlpzek9ScjR3SGFqRmFLUEJXRzk1WjJUVjJLV1VPTklX?=
 =?utf-8?B?ZS9LY1NBVWNoajNwTDQzbm1ZZVFuMVQ0NVB4YlpWS3BIMkZFSzlMcXA1V044?=
 =?utf-8?B?c2EwMVcwVGJ6dU1mZitFTEhpM1kyMjBaSGlLYjhjLzZtTVMrT3NtOU03aUVH?=
 =?utf-8?B?dEk0WUl1eEhpbHlwSmZBeGFqMFdGVUh3RkI0ODZGUEdmME12T3NsV2w0aFFX?=
 =?utf-8?B?QWNJbXFlNitpV2xpWk8xeGUrUElKMDFkOE56ZEw5WjlBaVpqQTBoc2cxZGt5?=
 =?utf-8?B?Sm8vOHhtU0JjQiswQ0cxZzVGYkxLcmgyeHg1aG0xZHlQUkd5U21XVnVxSm5K?=
 =?utf-8?B?Y2FtNllHajhhWlYyb3d3aUJvL3pKRzRJSXZHVjNjbGRmMUZTZ3FpY1k4dnA4?=
 =?utf-8?B?UDJ0aWM2UEEvMjc3YnZOU2hnc28zVWg0WHhvbHczVlFCYzVCc1RUMGZ0dkhm?=
 =?utf-8?B?ZlpyK3VaZnZUYU04V2k0Y1VVUnVQQ1ZUV3ZUVVVIWm1jektMQ2pMaXd5T0dT?=
 =?utf-8?B?dUhrbEVudGl4cUhMOWM3ckFkVTNGZ2hZUGREeHBMMmJ4QXY2OVR2SnBxZzZY?=
 =?utf-8?B?OWJUOXdSb3UvdGw1SENobU9iNS95Z096dlZyQzU5Vzc4UEpPRGI2ZzdvZnJm?=
 =?utf-8?B?eWNGdXJPTWNXbDlMUWpORGswSHIrMzYvamZoQ04rRGFXUENxbG0ybnlSRzdV?=
 =?utf-8?B?WmFZT3dBNVlVRWFQWnJiZnBaSUtVeGdVdnlQRXhVOFFPQWJhTnFBeFBnbWZO?=
 =?utf-8?B?QVhhV3dJeGpWanEzTDhCOE5BRnhwdnBHcGxRWTJJTzd1Q05jaGdBa1FEam5z?=
 =?utf-8?B?S2x1RTdaY1FaejVxa0k2b1d5cWxjWS9KQlFQZ0FMRExNR1lqK2NxZ2lCREc3?=
 =?utf-8?B?U3VQdHdnOGlGWlJaVnBiUjYrK1Z5bVVlRlhlZlZkQjFuZDV5NnYwaWVkZVg5?=
 =?utf-8?B?dm5OWEZxbit5My9WMml2Y0FmSXNic0RzUzF4azJXV0ZFYWVYNno4Z3hBT2Jh?=
 =?utf-8?B?MnNXNnpUcVFnaG9aYUVwVVZYNHRxZzgrOE9zd2xUVG1DNDNlYXNaNGZTMkZ6?=
 =?utf-8?B?Qm51dDg5STVRcGtVMkh2TThvbGZTZzZGNXFDZkxBd0F0Z3BMR3BaSnR1MzF4?=
 =?utf-8?B?MGR0SnptQXlaa3FlbGZ2WFZaSTllWmVBVnhXUWFZZFpaam11K1FyOHZRampi?=
 =?utf-8?B?WjBJUlpYYTRLVjI3cy9HMDBIWFdpaWtiU08yeHlhVGRIVGphMktoai8xR0Vj?=
 =?utf-8?B?MXlwRlYxQlVCai9QakNhZEIzeU0zVXljTTFSb3RvMGJzZkFOUkcwQ3RzN1hM?=
 =?utf-8?B?UnIwOUlrUHZocVphNGs3NEkwOC9UcUxSbWNUYS9RQ29DTW1JeWNpRWlFUFN2?=
 =?utf-8?B?TkxjYmRTWGl4L0ZpdHJqUVRvaUVIb2dubGxrR0FDWXlkQlZ5dHBKK1NnK3Zi?=
 =?utf-8?B?TVpWcHVaUldQYXF1VXlqKytpR3p0L0NWbkxGQXMweFdiYWttUGpKNzFNKzhS?=
 =?utf-8?B?OXpvVndZOHp6Z2MxS1ZZK2lHK0N5RVhnM2ZpemMxcjFxeEZxUnFvcTJoSlJI?=
 =?utf-8?B?MFhIQ1IvT2JGMkRSTnhHSGIrUE1kU29wMGZpekpyUktzQUg1a1lERmpwQXFv?=
 =?utf-8?B?cEprN2pmWUJCWmNLSEFHYXRNMy9LdVUzdkxIR0JyaFpQcmFUYTJVTG00b2hY?=
 =?utf-8?B?QzVuTzJacTlQaUFxa01yeG9pazJ0YWpMd2VqcEJnTWo1eHdrRlJzajRZS2x3?=
 =?utf-8?B?NnRidXFKSjRLbi9zamZ5QVdvQnBjalVCRFFBOHNLd3VDekEzelhhSXVva1ZW?=
 =?utf-8?B?U0tqZjNnOGRpRHlxcW9NZTBWUzNaVS82ZzRLRHJSamQzdGtSNzhsYnFiL0xo?=
 =?utf-8?B?S2w2bisrNEYrb1E5dk5QTHh1ZWEvb2RTOXdKeC9hNm5vZnJFWDB6c1NITnVH?=
 =?utf-8?B?Q1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <303FF6989DFF5444BAD5E1948C411E7C@prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR01MB7747.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee17607-a8d2-4bcb-849b-08dac12bed61
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2022 01:52:43.6379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: se4ae+FG4G2cGnodINtaecP2o2c1hUNFm4OBH0cAzsA5NFYvllwxQkeIgd2L7x47JvAZTraU1dQjvyL1TAHgZUdzCdq2y0hhnLmuoc9+o09SWTwsdBLQvFrVSeDxUTxG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4783
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

T24gMDgvMTEvMjAyMiAwODowNSwgQnJhZCBCaXNob3Agd3JvdGU6DQo+IE9uIE1vbiwgT2N0IDMx
LCAyMDIyIGF0IDA3OjA1OjUyUE0gLTA0MDAsIEJyYWQgQmlzaG9wIHdyb3RlOg0KPj4gT3BlbkJN
QyBtYWludGFpbmVycw0KPj4NCj4+IFRoaXMgY29taW5nIFN1bmRheSwgTm92ZW1iZXIgNnRoLCBh
YnNlbnQgYW55IGZlZWRiYWNrIGhlcmUgSSBhbSANCj4+IHBsYW5uaW5nIG9uOg0KPj4NCj4+IDEg
LSBSZW1vdmluZyBhZG1pbiByZXBvc2l0b3J5IGFjY2VzcyBieSA8eHl6Pi1tYWludGFpbmVycyBn
cm91cHMgZnJvbSANCj4+IGFsbCBwcm9qZWN0cyBvbiBHaXRodWIgdGhhdCB1c2UgdGhlIE9wZW5C
TUMgR2Vycml0IGluc3RhbmNlIGZvciBwZWVyIA0KPj4gcmV2aWV3IChubyBjaGFuZ2UgZm9yIHBy
b2plY3RzIHRoYXQgZG8gbm90IHVzZSB0aGUgR2Vycml0IGluc3RhbmNlIA0KPj4gbGlrZSB0aGUg
a2VybmVsLCB1LWJvb3QsIG9yIHFlbXUpLg0KPj4gMiAtIENvcHlpbmcgdGhlIHN1Ym1pdCBwcm9s
b2cgcnVsZXMgZnJvbSB0aGUgb3BlbmJtYy9vcGVuYm1jIEdlcnJpdCANCj4+IHByb2plY3QgdG8g
dGhlIG9wZW5ibWMtYWxsLXJlcG9zIEdlcnJpdCBwcm9qZWN0Lg0KPg0KPiBIaSBhbGwgLSBJIGZv
cmdvdCB0byBkbyB0aGlzIFN1bmRheSAtIG9vcHMuwqAgSSd2ZSBkb25lIGl0IGp1c3Qgbm93LCBh
cyANCj4gZmFyIGFzIEkgY2FuIHRlbGwgdGhlIG93bmVycyBwbHVnaW4gaXMgcmVhZHkgZm9yIHVz
ZSBvbiBhbGwgDQo+IHJlcG9zaXRvcmllcyBub3cuDQo+DQo+IEknbSBzdXJlIHNvbWV0aGluZyB3
aWxsIGJyZWFrIC0gaWYgaXQgZG9lcywgb3IgeW91IGhhdmUgYW55IHRyb3VibGUgDQo+IGFwcHJv
dmluZyBhbmQvb3Igc3VibWl0dGluZyBjaGFuZ2VzIG9uIEdlcnJpdCBwbGVhc2UgcmVwbHkgdG8g
dGhpcyANCj4gbWFpbCBvciBjb21lIGZpbmQgbWUgaW4gRGlzY29yZC4NCj4NCj4gVGhhbmtzLA0K
PiBCcmFkDQoNCkhpIEJyYWQsDQoNCkkgZG9uJ3QgaGF2ZSArMiBwZXJtaXNzaW9uIGZvciBhbXBl
cmUtaXBtaS1vZW0gYW55bW9yZS4gSG93IGNhbiBJIA0KYXBwcm92ZSBhbmQgc3VibWl0IGNvbW1p
dHMgaW4gdGhpcyByZXBvPw0KDQpUaGFua3MsDQoNClRoYW5nIFEuIE5ndXllbg0KDQo=
