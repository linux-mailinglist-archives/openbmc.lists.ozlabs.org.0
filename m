Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3110350623B
	for <lists+openbmc@lfdr.de>; Tue, 19 Apr 2022 04:46:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kj7Th0Ktxz2yph
	for <lists+openbmc@lfdr.de>; Tue, 19 Apr 2022 12:46:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=LeNuzxSp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f403:704b::706;
 helo=apc01-tyz-obe.outbound.protection.outlook.com;
 envelope-from=chin-ting_kuo@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=LeNuzxSp; 
 dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::706])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kj7T55xW8z2yLg;
 Tue, 19 Apr 2022 12:45:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWNZpDuAcMeKCBsYXnAA+oAN+kneT0N5iY2llCCCgM0S1dstSqy/Y1NBbtQ8wJQ4kTnohykWEW7axDrWOHVIrceIOfN4RaPyVHynimJMqgFiL/z9riac0F/Evy6swrn9FEO/3Bm6TPn/TfMFj0q5liVQxfyuB3hgJ3JAuq5lfd/BoiuBJCEMOmxqxKZyVA+JgeJ09M0/GBNaTqm1yJ05c0qOCrjVibQIiaWdkhuymE6Clmt39lg7dnq9mk3e9Rc/a53j/uloz34NldLXhdxqbLQG/Afhhe1OIgiNIdUilZTilWJCPSeJ0N7O1cL8hz9wttVmwUCac7oj7Sef9pLC7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FavuYRdEs6IFtQfOEay7WGQWNqqYhe9wFrB9XQswVoY=;
 b=Qsg7RUNMuhWBw80QnhV73tERjxnn0X36YhHZ7sLt9XGLoqQ0oc/52SGqpZkzU1OSepjmLm58jcB2Eyz1D0MgJlGckqvplnxcqRW59r5TJuKZrv43JcdPGGDgdAegXnL2sALvbCsQn6WixQ62byAS5ypeFH1EOOSNIInL3+18yR2++QcfMSBpt5dA49aMEhqdfm7Sn0fa2d+21y2cFbSHJUjVe6Ugx23Xf+qH+sdqNQ+ShVp7D+hvhOoLT3LUJp6njG8GYn6jvs8ocNXsBFQ5QbfPYunXH5H/PogHJBm00JxC+wIH5N3ypkcssRAPXh57PazbEHcqufSReOZlldWNiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FavuYRdEs6IFtQfOEay7WGQWNqqYhe9wFrB9XQswVoY=;
 b=LeNuzxSpN4/gxRLlFJ5cPJhXKEk+b+7/gDyKhdC26C5MkWmqbbsHv5Vhky9io2ZqcPuRcgIeTTk1BXYkaGEpYDiRXI0qPJLT55jxhoJbj/7lHM5TS8RSGI4Wd6zAVpHZzIX3iWB9xwmyqk9I0MWSDX9i94WOTdmEqg+KuBt+D7xTnaG8vn7x45WReH/1z9Puju5XK1jI/yMm6XXfHPf6MDWEJzKhPbujKaczp91NlarWF+sQoviSPHr1zbCwLKSR2LPLsMjwJIBI6MKfX0AT352T3tkQ+wtQAHH7Vyn9t+k4B4O4ESMfPbd3dZIuhSt4RfeihPb8R9iIzW2eBr5NdQ==
Received: from SG2PR06MB2794.apcprd06.prod.outlook.com (2603:1096:4:24::9) by
 SG2PR06MB3593.apcprd06.prod.outlook.com (2603:1096:4:98::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.20; Tue, 19 Apr 2022 02:45:09 +0000
Received: from SG2PR06MB2794.apcprd06.prod.outlook.com
 ([fe80::b55e:b9da:2f4c:a262]) by SG2PR06MB2794.apcprd06.prod.outlook.com
 ([fe80::b55e:b9da:2f4c:a262%3]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 02:45:09 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH 1/1] spi: aspeed: Update SPI clock frequency configuration
Thread-Topic: [PATCH 1/1] spi: aspeed: Update SPI clock frequency configuration
Thread-Index: AQHYT+pqfNUxw0XB1UKBgZNDC4FSoqz2KY0AgABk6EA=
Date: Tue, 19 Apr 2022 02:45:08 +0000
Message-ID: <SG2PR06MB2794226DDA6B0AEB8EAE6387B2F29@SG2PR06MB2794.apcprd06.prod.outlook.com>
References: <20220414102829.3892843-1-chin-ting_kuo@aspeedtech.com>
 <20220414102829.3892843-2-chin-ting_kuo@aspeedtech.com>
 <e1138a33-a935-7edf-8038-f4ab61754865@kaod.org>
In-Reply-To: <e1138a33-a935-7edf-8038-f4ab61754865@kaod.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82706fbc-4e73-4ccc-cca4-08da21ae9e9b
x-ms-traffictypediagnostic: SG2PR06MB3593:EE_
x-microsoft-antispam-prvs: <SG2PR06MB3593AB7FB6F4AE2A178108B7B2F29@SG2PR06MB3593.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3d9k/87UgabNAyQuXITNAhTGaprWSmyr+jgB/EYpMEj7uQkOGbcoVnC7ZxQRNWz5z+uZeI0+d1JudGkHFskFSJAzlD5QHCVDKPodzb1v6yVzwfCo9i5QLlz1HB2Bvewyu8REQ7recwpRfTJshz7BFUgNlqGmUbtqv7irE7ewtHtAGgi+EOLC8QgbbvIXoJpqbX9mwAKtlsdbJw2dIzwzzLc5u3I43MQ4IotFC89z+dMhXiISXqK1d2EYQ3DpJ/TkFT9FlaC3m8tk9myBZUcvervLODyRZFVKB/VNSg95pn2e7IwetpnyYPMv+XgMEUxA5Ro4Lp6zh0ImlCAXMtXoaJOu8844giMaIM/h9v0MHj+YkO8x2yF57h723L65URshN6s759RKn41KuygPnOWe5WU/E8kX2hOtnUi2bzvBY+ecSYW7BtG4ts3UH56QD/nq4p+Bo8+dK7lF54Q6Wmm0/8uVku+++wHWsbJGhr9/evwvHt2QzU+CD5ZYKZUrXX7Ow7SWAjDLys8gQFLWgz8ZT1keiTzaza+JDg1AdTBFn5KfbE6bmenkKq4piqdPHv7vzNsulUIEAbAFH6vjs311PX50zDwdSmnkiDT3lTw8C9xebjiWmyLAX6V6UE3Hp7AgDm03EsghE2OHCI5oUoydaC/ZKANwkr8uYrAoc81r4+FGeOuuXwdNkCsPqwKzDLUroOoPYBtJVBP4EJpYzi78LQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB2794.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39850400004)(396003)(376002)(346002)(136003)(366004)(86362001)(186003)(83380400001)(316002)(33656002)(110136005)(15650500001)(38100700002)(122000001)(66476007)(66556008)(64756008)(4326008)(66946007)(76116006)(66446008)(26005)(66574015)(107886003)(8676002)(2906002)(8936002)(5660300002)(52536014)(30864003)(53546011)(9686003)(7696005)(6506007)(71200400001)(508600001)(38070700005)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWRhQVhucWI5UnlxemxER1g2dDllVnkrR01RNW5Tci9zcExRZWNVQkNjcTQ4?=
 =?utf-8?B?M3BzcW5URDVPcFpOYmZ6eldUMm9zUStKcFdYWHQwTFBoSlYvVy9hZTJ0UU56?=
 =?utf-8?B?Y3MzbTk3S0dQazVCd2FiRHVvTEFQRHM3bkhsTXpTSzgzLzBkNmVpSHp3QXll?=
 =?utf-8?B?dldOcEI3RGR4ZVZlM004L2lycVpiSnhCN2FEYUU0M3h0dzlQb2QxRWRra0JY?=
 =?utf-8?B?d1cwamt3dnJTaFlsM2tWMllGdElONkVHK2FCdmpNaEtXb2NRRm1laEllOCtr?=
 =?utf-8?B?S3lXVlh6MXRMMDV0RWhSVnlNTndCdW5IMmpsVjFxQk5yczhwZytkanhXOHRr?=
 =?utf-8?B?eVEvS256N29DTWxsMEJ6NUpPOEplQmdXbE85UEt3dzJrNklLWXFpYldUbmN6?=
 =?utf-8?B?RUxTSENhcTduME1DeUZUcUNEQVFlNHBFOVJydGpUVDNoc21HSlcvNHMvN2pt?=
 =?utf-8?B?VktMc2QwYVZQWmVzb0dBd3FhN3BTVHdrQlQxYVRxN1pGeVFqUDh4ZllHVzdV?=
 =?utf-8?B?YVlSSGIxdlJOa0l1NjQzRTVtaFAxampmZEtsZytLVmZoRkFUNXJWZXM3NmEv?=
 =?utf-8?B?TGQrQkRXTjVxU0RRazBjcHhVaXdWTnJWN1U3d2pZOUZRTjhEa1FuamplaU1o?=
 =?utf-8?B?S0tFVC9MTDFFU3k1RW9qbk9UZ3Zod2VOMGVPanplVnFaekFvK3VTRFpmd1NP?=
 =?utf-8?B?YUxoSXpBcTNjL3R1RFhybTBTQ3QwZkhTWUI1OGhyNzFWVm9aRGEzY0RBa3h2?=
 =?utf-8?B?ak1Dd29xMlJsb0paSGFUc0NuV29xNTdhdWlMS0NGM3JlM3U5RW16RXFtSWJu?=
 =?utf-8?B?aUhxS0tUR3pQVGtoS3l3VVFVSnEwTy9oMEJ4RFhVU0VZc0dsZlpqb3BteEdV?=
 =?utf-8?B?andCemZCb1F4c3BNT3VVVzBwZGtnc1RCOGZWQWVxUFE3MWJ0WFc2MytnNU8z?=
 =?utf-8?B?V2xrYkdjWTlzdTQwekxmSU9TQkJrYjBzN2oxSWpUTDVHaHNhKzlGN0NrMm1U?=
 =?utf-8?B?WHNPMFNyRzVocnd1WFhMR2l3alZxanZ6L0NOMnhLRGFjdUpjVk83dlV1bjV5?=
 =?utf-8?B?S1VlczYraDF4bjB6WGpjSkRtMGt5NlpQeVJpSkNEWXd0WTZtdzRDeHp6Slcy?=
 =?utf-8?B?OTA1MDdEcXBUTnFEWHBKeWNRZDdQaFdrZXNkb0hib2U1TzhtLzcwUXEzL21n?=
 =?utf-8?B?dE9qNFdISndoSldCRGg3VWwwK0crNUxQdTlFdjF1OHRDWHEvd3dKQzJrbWF1?=
 =?utf-8?B?Y0l4c2JRanBkZytVMWY4SzhKN2Z5RmJ1RzJaay9keGN3a2IvTGFJTFA1aHgv?=
 =?utf-8?B?NkVXdExGSnVMazgxbk1MRzdKdVZST3lWaDhIdmhiT3I0Uy9OdmxSVWFMMy9s?=
 =?utf-8?B?L0ZVdS9OdmlGSzlxcGhndTR1QnE4eE5jTjlZUmVKVVR5ZTRjZFpldi9VdnFt?=
 =?utf-8?B?VnJEa3pQc1R5UUIxNzNYTGw3L0NKK29yaXVvTk5Rb3lER3lzWGx6bnQybVNT?=
 =?utf-8?B?Njh1WmcvV3I0U25lMWR2REM5YkpmWWFhN2ZJdEVMcy9XVkUzcmdOODhhTEdq?=
 =?utf-8?B?bjI3d1k3UUxhbzhPdEcySUtHZmZGNmlNMDFnTWRoeG96Skd5RDhMTXI3ZjdB?=
 =?utf-8?B?d0dYRzU5dnBxeUExbVR1SDVWeWhIWWxPK2NSVHhGSjc4WHVlYUdGcitFR3M1?=
 =?utf-8?B?aFU3dU1rMy9ZcmQ2bGd6WGN0R1JHbXJYbExQckpUSzZGRmdYOVVDQXhvWDN1?=
 =?utf-8?B?UWllSldqQk0wOFRpdWZ6RXZZRFg3MElxWjhGUDdRK3RDZWlyZEV0Q0w0Rmsz?=
 =?utf-8?B?U0tnTVhuRHlkWmh6RDdDSFVLbEZuM2hOR3pjT25jOWhZaFZQOEJKTDhHdHhk?=
 =?utf-8?B?c2pXSWhvbVE0TEwwaWE2UTFEVlQrV1hMRTRuRjBlZ0xtWDErVjdSLytmZ25z?=
 =?utf-8?B?MXg3b29POEtGS2p5dXJjVWZWa3NZektGaGdReFVkbjZCeGpneUloWEwyelpQ?=
 =?utf-8?B?NlF6NDNBNENabGlLQUFWcUtKQk5EMERQTlp1K1hNbnpMa1JIRGNFaVRFdHZ1?=
 =?utf-8?B?aVJvUlFsVXR2U1hjSHdmVVN6NDlEeFVVdy9xMnhhU0RnRExaUW1xYXpZOTJX?=
 =?utf-8?B?SVZoODV3aUhFbTNmWGx6Z1dDbzBrYndBMFg2b3RCWVRiS3FWdjMxZ3lQWTNj?=
 =?utf-8?B?R2N0aVFaMGlKMnRYSHNQYis0SmtCUWUxOS80bTBYSTAyWWhuNk1tR3ZvTGNn?=
 =?utf-8?B?b0dlTzg3eVR6dTZxM0l6a25rdUdRUnlrMEZkSW1ra09SZzEzZkYveWdibDdV?=
 =?utf-8?B?OENxVFJwYlJTQWs0ZVI2RUZFQ2N1OGQreGxFMDFaU2VBWXlocTJMV1VFRnND?=
 =?utf-8?Q?avmdTq/sluQpcKEQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB2794.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82706fbc-4e73-4ccc-cca4-08da21ae9e9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 02:45:08.9914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kXk3ylRqUh04A/OaG000YzB2KirnIP41nlvUNg4tyCUkxUAnf0t8T/1RMR88KjSIYvJbcZmdDJKcolhDigKc7Zd5U4LI/hhxGUpCVGYLTzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB3593
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQ8OpZHJpYywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDw6lk
cmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCAxOSwg
MjAyMiA0OjQyIEFNDQo+IFRvOiBDaGluLVRpbmcgS3VvIDxjaGluLXRpbmdfa3VvQGFzcGVlZHRl
Y2guY29tPjsNCj4gbGludXgtYXNwZWVkQGxpc3RzLm96bGFicy5vcmc7IG9wZW5ibWNAbGlzdHMu
b3psYWJzLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMV0gc3BpOiBhc3BlZWQ6IFVwZGF0
ZSBTUEkgY2xvY2sgZnJlcXVlbmN5IGNvbmZpZ3VyYXRpb24NCj4gDQo+IEhlbGxvIENoaW4tVGlu
ZywNCj4gDQo+IE9uIDQvMTQvMjIgMTI6MjgsIENoaW4tVGluZyBLdW8gd3JvdGU6DQo+ID4gSW5z
dGVhZCBvZiB1c2luZyB0aGUgc2xvd2VzdCBvbmUsIHRoZSBtYXhpbXVtIGNsb2NrIGZyZXF1ZW5j
eQ0KPiA+IGNvbmZpZ3VyZWQgaW4gdGhlIGRldmljZSB0cmVlIHNob3VsZCBiZSBrZXB0IHdoZW4g
bm8gdGltaW5nDQo+ID4gY2FsaWJyYXRpb24gcHJvY2VzcyBpcyBleGVjdXRlZC4NCj4gPiBCZXNp
ZGVzLCBhbiBleHRyYSBjYWxsYmFjayBmdW5jdGlvbiBpcyBhZGRlZCBpbiBvcmRlciB0byBjYWxj
dWxhdGUNCj4gPiBjbG9jayBmcmVxdWVuY3kgY29uZmlndXJhdGlvbiBmb3IgZGlmZmVyZW50IEFT
UEVFRCBwbGF0Zm9ybXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGluLVRpbmcgS3VvIDxj
aGluLXRpbmdfa3VvQGFzcGVlZHRlY2guY29tPg0KPiANCj4gSSBnYXZlIHRoaXMgcGF0Y2ggYSB0
cnkgb24gYW4gQVNUMjYwMCBBMyBFVkIgYW5kIGFuIEFTVDI1MDAgRVZCIGFuZCBpdA0KPiBiZWhh
dmVkIGFzIGV4cGVjdGVkLiBUaGUgZGVmYXVsdCBzZXR0aW5nIGZyb20gdGhlIERUIGlzIGNob3Nl
biB3aGVuIHRoZSBmbGFzaA0KPiBjb250ZW50cyBhcmUgdG9vIHVuaWZvcm0uDQo+IA0KPiANCj4g
PiAtLS0NCj4gPiAgIGRyaXZlcnMvc3BpL3NwaS1hc3BlZWQtc21jLmMgfCAxNjYNCj4gKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNDkg
aW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYw0KPiA+IGIvZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1z
bWMuYyBpbmRleCAyMjc3OTdlMTM5OTcuLjcyODE2M2QwMDQ1ZCAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jDQo+ID4gKysrIGIvZHJpdmVycy9zcGkvc3BpLWFz
cGVlZC1zbWMuYw0KPiA+IEBAIC0zLDcgKzMsNyBAQA0KPiA+ICAgICogQVNQRUVEIEZNQy9TUEkg
TWVtb3J5IENvbnRyb2xsZXIgRHJpdmVyDQo+ID4gICAgKg0KPiA+ICAgICogQ29weXJpZ2h0IChj
KSAyMDE1LTIwMjIsIElCTSBDb3Jwb3JhdGlvbi4NCj4gPiAtICogQ29weXJpZ2h0IChjKSAyMDIw
LCBBU1BFRUQgQ29ycG9yYXRpb24uDQo+ID4gKyAqIENvcHlyaWdodCAoYykgMjAyMC0yMDIyLCBB
U1BFRUQgQ29ycG9yYXRpb24uDQo+ID4gICAgKi8NCj4gPiAgICNpbmNsdWRlIDxsaW51eC9jbGsu
aD4NCj4gPiBAQCAtODQsNiArODQsNyBAQCBzdHJ1Y3QgYXNwZWVkX3NwaV9kYXRhIHsNCj4gPiAg
IAl1MzIgKCpzZWdtZW50X3JlZykoc3RydWN0IGFzcGVlZF9zcGkgKmFzcGksIHUzMiBzdGFydCwg
dTMyIGVuZCk7DQo+ID4gICAJaW50ICgqY2FsaWJyYXRlKShzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlw
ICpjaGlwLCB1MzIgaGRpdiwNCj4gPiAgIAkJCSBjb25zdCB1OCAqZ29sZGVuX2J1ZiwgdTggKnRl
c3RfYnVmKTsNCj4gPiArCXUzMiAoKmNsa19jb25maWcpKHN0cnVjdCBhc3BlZWRfc3BpX2NoaXAg
KmNoaXAsIHUzMiBtYXhfaHopOw0KPiA+ICAgfTsNCj4gPg0KPiA+ICAgI2RlZmluZSBBU1BFRURf
U1BJX01BWF9OVU1fQ1MJNQ0KPiA+IEBAIC05NTksNyArOTYwLDEwIEBAIHN0YXRpYyBpbnQgYXNw
ZWVkX3NwaV9kb19jYWxpYnJhdGlvbihzdHJ1Y3QNCj4gYXNwZWVkX3NwaV9jaGlwICpjaGlwKQ0K
PiA+ICAgCXUzMiBjdGxfdmFsOw0KPiA+ICAgCXU4ICpnb2xkZW5fYnVmID0gTlVMTDsNCj4gPiAg
IAl1OCAqdGVzdF9idWYgPSBOVUxMOw0KPiA+IC0JaW50IGksIHJjLCBiZXN0X2RpdiA9IC0xOw0K
PiA+ICsJaW50IGksIHJjOw0KPiA+ICsJdTMyIGJlc3RfZnJlcSA9IDA7DQo+ID4gKwl1MzIgZnJl
cTsNCj4gPiArCXUzMiBjbGtfY29uZjsNCj4gPg0KPiA+ICAgCWRldl9kYmcoYXNwaS0+ZGV2LCAi
Y2FsY3VsYXRlIHRpbWluZyBjb21wZW5zYXRpb24gLSBBSEIgZnJlcTogJWQNCj4gTUh6IiwNCj4g
PiAgIAkJYWhiX2ZyZXEgLyAxMDAwMDAwKTsNCj4gPiBAQCAtOTgwLDcgKzk4NCw3IEBAIHN0YXRp
YyBpbnQgYXNwZWVkX3NwaV9kb19jYWxpYnJhdGlvbihzdHJ1Y3QNCj4gYXNwZWVkX3NwaV9jaGlw
ICpjaGlwKQ0KPiA+ICAgCW1lbWNweV9mcm9taW8oZ29sZGVuX2J1ZiwgY2hpcC0+YWhiX2Jhc2Us
IENBTElCUkFURV9CVUZfU0laRSk7DQo+ID4gICAJaWYgKCFhc3BlZWRfc3BpX2NoZWNrX2NhbGli
X2RhdGEoZ29sZGVuX2J1ZiwgQ0FMSUJSQVRFX0JVRl9TSVpFKSkNCj4gew0KPiA+ICAgCQlkZXZf
aW5mbyhhc3BpLT5kZXYsICJDYWxpYnJhdGlvbiBhcmVhIHRvbyB1bmlmb3JtLCB1c2luZyBsb3cN
Cj4gPiBzcGVlZCIpOw0KPiANCj4gbWF5IGJlIGNoYW5nZSBkZXZfaW5mbygpIHRvICIuLi4sIHVz
aW5nIGRlZmF1bHQgZnJlcSINCg0KT2theS4NCg0KPiANCj4gPiAtCQlnb3RvIG5vX2NhbGliOw0K
PiA+ICsJCWdvdG8gZW5kX2NhbGliOw0KPiA+ICAgCX0NCj4gPg0KPiA+ICAgI2lmIGRlZmluZWQo
VkVSQk9TRV9ERUJVRykNCj4gPiBAQCAtOTkwLDcgKzk5NCw3IEBAIHN0YXRpYyBpbnQgYXNwZWVk
X3NwaV9kb19jYWxpYnJhdGlvbihzdHJ1Y3QNCj4gPiBhc3BlZWRfc3BpX2NoaXAgKmNoaXApDQo+
ID4NCj4gPiAgIAkvKiBOb3cgd2UgaXRlcmF0ZSB0aGUgSENMSyBkaXZpZGVycyB1bnRpbCB3ZSBm
aW5kIG91ciBicmVha2luZyBwb2ludA0KPiAqLw0KPiA+ICAgCWZvciAoaSA9IEFSUkFZX1NJWkUo
YXNwZWVkX3NwaV9oY2xrX2RpdnMpOyBpID4gZGF0YS0+aGRpdl9tYXggLSAxOw0KPiBpLS0pIHsN
Cj4gPiAtCQl1MzIgdHYsIGZyZXE7DQo+ID4gKwkJdTMyIHR2Ow0KPiA+DQo+ID4gICAJCWZyZXEg
PSBhaGJfZnJlcSAvIGk7DQo+ID4gICAJCWlmIChmcmVxID4gbWF4X2ZyZXEpDQo+ID4gQEAgLTEw
MDIsMjcgKzEwMDYsMTQ5IEBAIHN0YXRpYyBpbnQgYXNwZWVkX3NwaV9kb19jYWxpYnJhdGlvbihz
dHJ1Y3QNCj4gYXNwZWVkX3NwaV9jaGlwICpjaGlwKQ0KPiA+ICAgCQlkZXZfZGJnKGFzcGktPmRl
diwgIlRyeWluZyBIQ0xLLyVkIFslMDh4XSAuLi4iLCBpLCB0dik7DQo+ID4gICAJCXJjID0gZGF0
YS0+Y2FsaWJyYXRlKGNoaXAsIGksIGdvbGRlbl9idWYsIHRlc3RfYnVmKTsNCj4gPiAgIAkJaWYg
KHJjID09IDApDQo+ID4gLQkJCWJlc3RfZGl2ID0gaTsNCj4gPiArCQkJYmVzdF9mcmVxID0gZnJl
cTsNCj4gPiAgIAl9DQo+ID4NCj4gPiAgIAkvKiBOb3RoaW5nIGZvdW5kID8gKi8NCj4gPiAtCWlm
IChiZXN0X2RpdiA8IDApIHsNCj4gPiAtCQlkZXZfd2Fybihhc3BpLT5kZXYsICJObyBnb29kIGZy
ZXF1ZW5jeSwgdXNpbmcgZHVtYiBzbG93Iik7DQo+ID4gLQl9IGVsc2Ugew0KPiA+IC0JCWRldl9k
YmcoYXNwaS0+ZGV2LCAiRm91bmQgZ29vZCByZWFkIHRpbWluZ3MgYXQgSENMSy8lZCIsDQo+IGJl
c3RfZGl2KTsNCj4gPiArCWlmIChiZXN0X2ZyZXEgPT0gMCkNCj4gPiArCQlkZXZfd2Fybihhc3Bp
LT5kZXYsICJVc2UgdGhlIGRlZmF1bHQgdGltaW5nIHNldHRpbmciKTsNCj4gPiArCWVsc2UNCj4g
PiArCQlkZXZfZGJnKGFzcGktPmRldiwgIkZvdW5kIGdvb2QgcmVhZCB0aW1pbmdzIGF0IEhDTEsv
JWQiLCBpKTsNCj4gPg0KPiA+IC0JCS8qIFJlY29yZCB0aGUgZnJlcSAqLw0KPiA+IC0JCWZvciAo
aSA9IDA7IGkgPCBBU1BFRURfU1BJX01BWDsgaSsrKQ0KPiA+IC0JCQljaGlwLT5jdGxfdmFsW2ld
ID0gKGNoaXAtPmN0bF92YWxbaV0gJiBkYXRhLT5oY2xrX21hc2spIHwNCj4gPiAtCQkJCUFTUEVF
RF9TUElfSENMS19ESVYoYmVzdF9kaXYpOw0KPiA+IC0JfQ0KPiA+DQo+ID4gLW5vX2NhbGliOg0K
PiA+ICtlbmRfY2FsaWI6DQo+ID4gKwlpZiAoYmVzdF9mcmVxID09IDApDQo+ID4gKwkJYmVzdF9m
cmVxID0gbWF4X2ZyZXE7DQo+ID4gKw0KPiA+ICsJY2xrX2NvbmYgPSBkYXRhLT5jbGtfY29uZmln
KGNoaXAsIGJlc3RfZnJlcSk7DQo+ID4gKwkvKiBSZWNvcmQgdGhlIGZyZXEgKi8NCj4gPiArCWZv
ciAoaSA9IDA7IGkgPCBBU1BFRURfU1BJX01BWDsgaSsrKQ0KPiA+ICsJCWNoaXAtPmN0bF92YWxb
aV0gPSAoY2hpcC0+Y3RsX3ZhbFtpXSAmIGRhdGEtPmhjbGtfbWFzaykgfCBjbGtfY29uZjsNCj4g
PiArDQo+ID4gICAJd3JpdGVsKGNoaXAtPmN0bF92YWxbQVNQRUVEX1NQSV9SRUFEXSwgY2hpcC0+
Y3RsKTsNCj4gPiAgIAlrZnJlZSh0ZXN0X2J1Zik7DQo+ID4gICAJcmV0dXJuIDA7DQo+ID4gICB9
DQo+ID4NCj4gPiArLyogSENMSy8xIC4uCUhDTEsvMTYgKi8NCj4gPiArc3RhdGljIGNvbnN0IHUz
MiBhc3BlZWRfc3BpX2hjbGtfbWFza3NbXSA9IHsNCj4gPiArCTE1LCA3LCAxNCwgNiwgMTMsIDUs
IDEyLCA0LA0KPiA+ICsJMTEsIDMsIDEwLCAyLCA5LCAgMSwgOCwgIDANCj4gPiArfTsNCj4gDQo+
IFRoaXMgbmV3IGFycmF5IGlzIGEgYml0IHJlZHVuZGFudCB3aXRoIGFzcGVlZF9zcGlfaGNsa19k
aXZzW10NCj4gDQoNClllcywgSSB3aWxsIHRyeSB0byBtZXJnZSB0aGlzIGFycmF5IGludG8gYXNw
ZWVkX3NwaV9oY2xrX2RpdnMuDQoNCj4gPiArDQo+ID4gK3N0YXRpYyB1MzIgYXNwZWVkX3NwaV9h
c3QyNDAwX2Nsa19jb25maWcoc3RydWN0IGFzcGVlZF9zcGlfY2hpcCAqY2hpcCwNCj4gPiArCQkJ
CQkgdTMyIG1heF9oeikNCj4gPiArew0KPiA+ICsJc3RydWN0IGFzcGVlZF9zcGkgKmFzcGkgPSBj
aGlwLT5hc3BpOw0KPiA+ICsJdTMyIGFoYl9mcmVxID0gYXNwaS0+Y2xrX2ZyZXE7DQo+ID4gKwl1
MzIgaGNsa19kaXYgPSAwOyAvKiBkZWZhdWx0IHZhbHVlICovDQo+ID4gKwl1MzIgaTsNCj4gPiAr
CWJvb2wgZm91bmQgPSBmYWxzZTsNCj4gPiArDQo+ID4gKwkvKiBGTUMvU1BJUjEwWzExOjhdICov
DQo+ID4gKwlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShhc3BlZWRfc3BpX2hjbGtfbWFza3Mp
OyBpKyspIHsNCj4gPiArCQlpZiAoYWhiX2ZyZXEgLyAoaSArIDEpIDw9IG1heF9oeikgew0KPiA+
ICsJCQlmb3VuZCA9IHRydWU7DQo+ID4gKwkJCWJyZWFrOw0KPiA+ICsJCX0NCj4gPiArCX0NCj4g
PiArDQo+ID4gKwlpZiAoZm91bmQpDQo+ID4gKwkJaGNsa19kaXYgPSBhc3BlZWRfc3BpX2hjbGtf
bWFza3NbaV0gPDwgODsNCj4gPiArDQo+ID4gKwlkZXZfZGJnKGFzcGktPmRldiwgImZvdW5kOiAl
cywgaGNsazogJWQsIG1heF9jbGs6ICVkXG4iLA0KPiA+ICsJCWZvdW5kID8gInllcyIgOiAibm8i
LCBhaGJfZnJlcSwgbWF4X2h6KTsNCj4gPiArDQo+ID4gKwlpZiAoZm91bmQpIHsNCj4gPiArCQlk
ZXZfZGJnKGFzcGktPmRldiwgImhfZGl2OiAlZCAobWFzayAleClcbiIsDQo+ID4gKwkJCWkgKyAx
LCBhc3BlZWRfc3BpX2hjbGtfbWFza3NbaV0pOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCXJldHVy
biBoY2xrX2RpdjsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIHUzMiBhc3BlZWRfc3BpX2Fz
dDI1MDBfY2xrX2NvbmZpZyhzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlwICpjaGlwLA0KPiA+ICsJCQkJ
CSB1MzIgbWF4X2h6KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgYXNwZWVkX3NwaSAqYXNwaSA9IGNo
aXAtPmFzcGk7DQo+ID4gKwl1MzIgYWhiX2ZyZXEgPSBhc3BpLT5jbGtfZnJlcTsNCj4gPiArCXUz
MiBoY2xrX2RpdiA9IDA7IC8qIGRlZmF1bHQgdmFsdWUgKi8NCj4gPiArCXUzMiBpOw0KPiA+ICsJ
Ym9vbCBmb3VuZCA9IGZhbHNlOw0KPiA+ICsNCj4gPiArCS8qIEZNQy9TUElSMTBbMTE6OF0gKi8N
Cj4gPiArCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGFzcGVlZF9zcGlfaGNsa19tYXNrcyk7
IGkrKykgew0KPiA+ICsJCWlmIChhaGJfZnJlcSAvIChpICsgMSkgPD0gbWF4X2h6KSB7DQo+ID4g
KwkJCWZvdW5kID0gdHJ1ZTsNCj4gPiArCQkJYnJlYWs7DQo+ID4gKwkJfQ0KPiA+ICsJfQ0KPiA+
ICsNCj4gPiArCWlmIChmb3VuZCkgew0KPiA+ICsJCWhjbGtfZGl2ID0gYXNwZWVkX3NwaV9oY2xr
X21hc2tzW2ldIDw8IDg7DQo+ID4gKwl9IGVsc2Ugew0KPiA+ICsJCS8qIElmIEZNQzEwWzEzXSBp
cyBzZXQsIGFuIGV4dHJhIGRpdl80IGNhbiBiZSBpbnRyb2R1Y2VkLiAqLw0KPiA+ICsJCWZvciAo
aSA9IDA7IGkgPCBBUlJBWV9TSVpFKGFzcGVlZF9zcGlfaGNsa19tYXNrcyk7IGkrKykgew0KPiA+
ICsJCQlpZiAoYWhiX2ZyZXEgLyAoKGkgKyAxKSAqIDQpIDw9IG1heF9oeikgew0KPiA+ICsJCQkJ
Zm91bmQgPSB0cnVlOw0KPiA+ICsJCQkJYnJlYWs7DQo+ID4gKwkJCX0NCj4gPiArCQl9DQo+ID4g
Kw0KPiA+ICsJCWlmIChmb3VuZCkNCj4gPiArCQkJaGNsa19kaXYgPSBCSVQoMTMpIHwgKGFzcGVl
ZF9zcGlfaGNsa19tYXNrc1tpXSA8PCA4KTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlkZXZfZGJn
KGFzcGktPmRldiwgImZvdW5kOiAlcywgaGNsazogJWQsIG1heF9jbGs6ICVkXG4iLA0KPiA+ICsJ
CWZvdW5kID8gInllcyIgOiAibm8iLCBhaGJfZnJlcSwgbWF4X2h6KTsNCj4gPiArDQo+ID4gKwlp
ZiAoZm91bmQpIHsNCj4gPiArCQlkZXZfZGJnKGFzcGktPmRldiwgImhfZGl2OiAlZCAobWFzayAl
eClcbiIsDQo+ID4gKwkJCWkgKyAxLCBhc3BlZWRfc3BpX2hjbGtfbWFza3NbaV0pOw0KPiA+ICsJ
fQ0KPiA+ICsNCj4gPiArCXJldHVybiBoY2xrX2RpdjsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3Rh
dGljIHUzMiBhc3BlZWRfc3BpX2FzdDI2MDBfY2xrX2NvbmZpZyhzdHJ1Y3QgYXNwZWVkX3NwaV9j
aGlwICpjaGlwLA0KPiA+ICsJCQkJCSB1MzIgbWF4X2h6KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3Qg
YXNwZWVkX3NwaSAqYXNwaSA9IGNoaXAtPmFzcGk7DQo+ID4gKwl1MzIgYWhiX2ZyZXEgPSBhc3Bp
LT5jbGtfZnJlcTsNCj4gPiArCXUzMiBoY2xrX2RpdiA9IDB4NDAwOyAvKiBkZWZhdWx0IHZhbHVl
ICovDQo+ID4gKwl1MzIgaSwgajsNCj4gPiArCWJvb2wgZm91bmQgPSBmYWxzZTsNCj4gPiArDQo+
ID4gKwkvKiBGTUMvU1BJUjEwWzI3OjI0XSAqLw0KPiA+ICsJZm9yIChqID0gMDsgaiA8IDB4Zjsg
aisrKSB7DQo+ID4gKwkJLyogRk1DL1NQSVIxMFsxMTo4XSAqLw0KPiA+ICsJCWZvciAoaSA9IDA7
IGkgPCBBUlJBWV9TSVpFKGFzcGVlZF9zcGlfaGNsa19tYXNrcyk7IGkrKykgew0KPiA+ICsJCQlp
ZiAoaSA9PSAwICYmIGogPT0gMCkNCj4gPiArCQkJCWNvbnRpbnVlOw0KPiA+ICsNCj4gPiArCQkJ
aWYgKGFoYl9mcmVxIC8gKGkgKyAxICsgKGogKiAxNikpIDw9IG1heF9oeikgew0KPiA+ICsJCQkJ
Zm91bmQgPSB0cnVlOw0KPiA+ICsJCQkJYnJlYWs7DQo+ID4gKwkJCX0NCj4gPiArCQl9DQo+ID4g
Kw0KPiA+ICsJCWlmIChmb3VuZCkgew0KPiA+ICsJCQloY2xrX2RpdiA9ICgoaiA8PCAyNCkgfCBh
c3BlZWRfc3BpX2hjbGtfbWFza3NbaV0gPDwgOCk7DQo+ID4gKwkJCWJyZWFrOw0KPiA+ICsJCX0N
Cj4gPiArCX0NCj4gPiArDQo+ID4gKwlkZXZfZGJnKGFzcGktPmRldiwgImZvdW5kOiAlcywgaGNs
azogJWQsIG1heF9jbGs6ICVkXG4iLA0KPiA+ICsJCWZvdW5kID8gInllcyIgOiAibm8iLCBhaGJf
ZnJlcSwgbWF4X2h6KTsNCj4gPiArDQo+ID4gKwlpZiAoZm91bmQpIHsNCj4gPiArCQlkZXZfZGJn
KGFzcGktPmRldiwgImJhc2VfY2xrOiAlZCwgaF9kaXY6ICVkIChtYXNrICV4KVxuIiwNCj4gPiAr
CQkJaiwgaSArIDEsIGFzcGVlZF9zcGlfaGNsa19tYXNrc1tpXSk7DQo+ID4gKwl9DQo+ID4gKw0K
PiA+ICsJcmV0dXJuIGhjbGtfZGl2Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICAgI2RlZmluZSBUSU1J
TkdfREVMQVlfREkJCUJJVCgzKQ0KPiA+ICAgI2RlZmluZSBUSU1JTkdfREVMQVlfSENZQ0xFX01B
WAk1DQo+ID4gICAjZGVmaW5lIFRJTUlOR19SRUdfQVNUMjYwMChjaGlwKQkJCQlcDQo+ID4gQEAg
LTEwOTcsNiArMTIyMyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX3NwaV9kYXRhDQo+
IGFzdDI0MDBfZm1jX2RhdGEgPSB7DQo+ID4gICAJLnNlZ21lbnRfc3RhcnQgPSBhc3BlZWRfc3Bp
X3NlZ21lbnRfc3RhcnQsDQo+ID4gICAJLnNlZ21lbnRfZW5kICAgPSBhc3BlZWRfc3BpX3NlZ21l
bnRfZW5kLA0KPiA+ICAgCS5zZWdtZW50X3JlZyAgID0gYXNwZWVkX3NwaV9zZWdtZW50X3JlZywN
Cj4gPiArCS5jbGtfY29uZmlnICAgID0gYXNwZWVkX3NwaV9hc3QyNDAwX2Nsa19jb25maWcsDQo+
ID4gICB9Ow0KPiA+DQo+ID4gICBzdGF0aWMgY29uc3Qgc3RydWN0IGFzcGVlZF9zcGlfZGF0YSBh
c3QyNDAwX3NwaV9kYXRhID0geyBAQCAtMTEwOSw2DQo+ID4gKzEyMzYsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGFzcGVlZF9zcGlfZGF0YSBhc3QyNDAwX3NwaV9kYXRhID0gew0KPiA+ICAgCS5o
ZGl2X21heCAgICAgID0gMSwNCj4gPiAgIAkuY2FsaWJyYXRlICAgICA9IGFzcGVlZF9zcGlfY2Fs
aWJyYXRlLA0KPiA+ICAgCS8qIE5vIHNlZ21lbnQgcmVnaXN0ZXJzICovDQo+ID4gKwkuY2xrX2Nv
bmZpZyAgICA9IGFzcGVlZF9zcGlfYXN0MjQwMF9jbGtfY29uZmlnLA0KPiA+ICAgfTsNCj4gPg0K
PiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBhc3BlZWRfc3BpX2RhdGEgYXN0MjUwMF9mbWNfZGF0
YSA9IHsgQEAgLTExMTcsMTINCj4gPiArMTI0NSwxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFz
cGVlZF9zcGlfZGF0YSBhc3QyNTAwX2ZtY19kYXRhID0gew0KPiA+ICAgCS53ZTAJICAgICAgID0g
MTYsDQo+ID4gICAJLmN0bDAJICAgICAgID0gQ0UwX0NUUkxfUkVHLA0KPiA+ICAgCS50aW1pbmcJ
ICAgICAgID0gQ0UwX1RJTUlOR19DT01QRU5TQVRJT05fUkVHLA0KPiA+IC0JLmhjbGtfbWFzayAg
ICAgPSAweGZmZmZmMGZmLA0KPiA+ICsJLmhjbGtfbWFzayAgICAgPSAweGZmZmZkMGZmLA0KPiAN
Cj4gSSB0aGluayB0aGlzIGNoYW5nZSBvZi4gaGNsa19tYXNrIGFuZCB0aGUgb25lIGJlbG93IHNo
b3VsZCBiZSBpbmNsdWRlZCBpbiB0aGUNCj4gaW5pdGlhbCBwYXRjaHNldC4gSSB3aWxsIHdoZW4g
SSBwdWJsaXNoIHY1Lg0KPiANCg0KT2theS4NCg0KDQpUaGFua3MuDQoNCkNoaW4tVGluZw0KDQo+
IFRoYW5rcywNCj4gDQo+IEMuDQo+IA0KPiA+ICAgCS5oZGl2X21heCAgICAgID0gMSwNCj4gPiAg
IAkuY2FsaWJyYXRlICAgICA9IGFzcGVlZF9zcGlfY2FsaWJyYXRlLA0KPiA+ICAgCS5zZWdtZW50
X3N0YXJ0ID0gYXNwZWVkX3NwaV9zZWdtZW50X3N0YXJ0LA0KPiA+ICAgCS5zZWdtZW50X2VuZCAg
ID0gYXNwZWVkX3NwaV9zZWdtZW50X2VuZCwNCj4gPiAgIAkuc2VnbWVudF9yZWcgICA9IGFzcGVl
ZF9zcGlfc2VnbWVudF9yZWcsDQo+ID4gKwkuY2xrX2NvbmZpZyAgICA9IGFzcGVlZF9zcGlfYXN0
MjUwMF9jbGtfY29uZmlnLA0KPiA+ICAgfTsNCj4gPg0KPiA+ICAgc3RhdGljIGNvbnN0IHN0cnVj
dCBhc3BlZWRfc3BpX2RhdGEgYXN0MjUwMF9zcGlfZGF0YSA9IHsgQEAgLTExMzEsMTINCj4gPiAr
MTI2MCwxMyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFzcGVlZF9zcGlfZGF0YSBhc3QyNTAwX3Nw
aV9kYXRhID0gew0KPiA+ICAgCS53ZTAJICAgICAgID0gMTYsDQo+ID4gICAJLmN0bDAJICAgICAg
ID0gQ0UwX0NUUkxfUkVHLA0KPiA+ICAgCS50aW1pbmcJICAgICAgID0gQ0UwX1RJTUlOR19DT01Q
RU5TQVRJT05fUkVHLA0KPiA+IC0JLmhjbGtfbWFzayAgICAgPSAweGZmZmZmMGZmLA0KPiA+ICsJ
LmhjbGtfbWFzayAgICAgPSAweGZmZmZkMGZmLA0KPiA+ICAgCS5oZGl2X21heCAgICAgID0gMSwN
Cj4gPiAgIAkuY2FsaWJyYXRlICAgICA9IGFzcGVlZF9zcGlfY2FsaWJyYXRlLA0KPiA+ICAgCS5z
ZWdtZW50X3N0YXJ0ID0gYXNwZWVkX3NwaV9zZWdtZW50X3N0YXJ0LA0KPiA+ICAgCS5zZWdtZW50
X2VuZCAgID0gYXNwZWVkX3NwaV9zZWdtZW50X2VuZCwNCj4gPiAgIAkuc2VnbWVudF9yZWcgICA9
IGFzcGVlZF9zcGlfc2VnbWVudF9yZWcsDQo+ID4gKwkuY2xrX2NvbmZpZyAgICA9IGFzcGVlZF9z
cGlfYXN0MjUwMF9jbGtfY29uZmlnLA0KPiA+ICAgfTsNCj4gPg0KPiA+ICAgc3RhdGljIGNvbnN0
IHN0cnVjdCBhc3BlZWRfc3BpX2RhdGEgYXN0MjYwMF9mbWNfZGF0YSA9IHsgQEAgLTExNTIsNg0K
PiA+ICsxMjgyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhc3BlZWRfc3BpX2RhdGEgYXN0MjYw
MF9mbWNfZGF0YSA9IHsNCj4gPiAgIAkuc2VnbWVudF9zdGFydCA9IGFzcGVlZF9zcGlfc2VnbWVu
dF9hc3QyNjAwX3N0YXJ0LA0KPiA+ICAgCS5zZWdtZW50X2VuZCAgID0gYXNwZWVkX3NwaV9zZWdt
ZW50X2FzdDI2MDBfZW5kLA0KPiA+ICAgCS5zZWdtZW50X3JlZyAgID0gYXNwZWVkX3NwaV9zZWdt
ZW50X2FzdDI2MDBfcmVnLA0KPiA+ICsJLmNsa19jb25maWcgICAgPSBhc3BlZWRfc3BpX2FzdDI2
MDBfY2xrX2NvbmZpZywNCj4gPiAgIH07DQo+ID4NCj4gPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
YXNwZWVkX3NwaV9kYXRhIGFzdDI2MDBfc3BpX2RhdGEgPSB7IEBAIC0xMTY3LDYNCj4gPiArMTI5
OCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX3NwaV9kYXRhIGFzdDI2MDBfc3BpX2Rh
dGEgPSB7DQo+ID4gICAJLnNlZ21lbnRfc3RhcnQgPSBhc3BlZWRfc3BpX3NlZ21lbnRfYXN0MjYw
MF9zdGFydCwNCj4gPiAgIAkuc2VnbWVudF9lbmQgICA9IGFzcGVlZF9zcGlfc2VnbWVudF9hc3Qy
NjAwX2VuZCwNCj4gPiAgIAkuc2VnbWVudF9yZWcgICA9IGFzcGVlZF9zcGlfc2VnbWVudF9hc3Qy
NjAwX3JlZywNCj4gPiArCS5jbGtfY29uZmlnICAgID0gYXNwZWVkX3NwaV9hc3QyNjAwX2Nsa19j
b25maWcsDQo+ID4gICB9Ow0KPiA+DQo+ID4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBhc3BlZWRfc3BpX21hdGNoZXNbXSA9IHsNCg0K
