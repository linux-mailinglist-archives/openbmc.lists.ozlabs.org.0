Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFFB5E70B9
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 02:39:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYYDf1sXkz3c4w
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 10:38:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=SjJPQJ4k;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.117.117; helo=apc01-tyz-obe.outbound.protection.outlook.com; envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=SjJPQJ4k;
	dkim-atps=neutral
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2117.outbound.protection.outlook.com [40.107.117.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYYD71lWPz30D1;
	Fri, 23 Sep 2022 10:38:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Puh32ym3Y4SM2bkH1uSWpN1XdYBDLHQ1V8FHlOdPs+pd5SzK1lujZFAEN2voZRJknt/YhdFLHlb0rINauOcTIC5rRb2mMWJTBTCuWQy+y3Je0kwYJrpu4/Mg+gQ74JvnIZT27e0rAgQjBqkysRGfX1pc6NYj09vskrTDp6cgAgWEeJmil0PHiXqB8WF9Mx0L2gjIXOsnOlSeOm8m0HNHiKsmrD2/HcR2qwcF/4Oyxep2SLe070eV6DxkgdFhw1nWpXAaLLk0jNq3y55F9Ew6QBiO1EgtBYTw9BoO+HrQmm2Ht1bbLbehw/01eIM+VzLmcZul9uNRuZtdOFesXx0LXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQIVCAiTF8lFixLGVtQeq+9YKPnkFjB/yOjCH9QCaeM=;
 b=LNGbf9SCAvMomrNm2k2unbaIo+7znV8MipkeBjNPVGFiESR93O6lCVweubkqVeruGcfLxPsMwBN8nlyBNA3a9D6NBVTn+x2LsDxWRyfGJGzyYr3zp0G0e3lJgSTIQCQ5d7jV8UrazMk85wXGeph5xStN3bcwfuOAe51Xch/LvwACPVHyE1bhgFUarNQG4ztVyOyhxXm7r9+TFpKYuIpUBOPOyTRr+q2bHRT2tpW5ebBmOMg5DgePNVfe3ihA3Byh/sfarZhBbO54CXGs2mi+hBWmWqPt7e1Hs1DSqfraQFEF26J8j7776qf9gPOgh5hcuvb9YIaEtlxez8HB83jVTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQIVCAiTF8lFixLGVtQeq+9YKPnkFjB/yOjCH9QCaeM=;
 b=SjJPQJ4kBX7pc28C55ZzFX9oI4tBq2fitqFYDHiiHF17EkZyxX9A+KwreI1WMi86NlisiwlQIKdOozArrId2LCSkBkg+4pO0TVpSC/KOOKYlH/Aq34uvBxiFOPXRhbDIRM6TNEJTlT/8V9lPzNbamaqKAEI/5rSLv1As1e/4mg2p2BBrNVND+ndAoz7YkJsH1ACAyYCQHa6T1D0iFlDPirFTquaDCa05jmJBOOYzQA9z3I9B8eQ6skohcm4dmtsoK7xl8J7exRFJx+l2Y1EF13lf4n5dh2ICgO3V2/OdG+7uo89LfHIh2yHJdccjSw2XlJG6PP4QWK35UXZJ9LGBmw==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by TYUPR06MB6269.apcprd06.prod.outlook.com (2603:1096:400:351::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Fri, 23 Sep
 2022 00:38:08 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::b70:5d66:bdf1:ff47]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::b70:5d66:bdf1:ff47%7]) with mapi id 15.20.5654.019; Fri, 23 Sep 2022
 00:38:08 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: "minyard@acm.org" <minyard@acm.org>
Subject: RE: [PATCH] ipmi: kcs: aspeed: Update port address comments
Thread-Topic: [PATCH] ipmi: kcs: aspeed: Update port address comments
Thread-Index: AQHYzJVUtbRY+/SRCUqfvaXOF1k3N63r0TSAgABVS9CAAATrAIAAASRQ
Date: Fri, 23 Sep 2022 00:38:08 +0000
Message-ID:  <HK0PR06MB377992E9AF7B91CE41452B4A91519@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20220920020333.601-1-chiawei_wang@aspeedtech.com>
 <YyywI8265vECnEHv@minyard.net>
 <HK0PR06MB37794D51E9DB4A864249F96691519@HK0PR06MB3779.apcprd06.prod.outlook.com>
 <Yyz70LckHqyiNhGa@minyard.net>
In-Reply-To: <Yyz70LckHqyiNhGa@minyard.net>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HK0PR06MB3779:EE_|TYUPR06MB6269:EE_
x-ms-office365-filtering-correlation-id: 2488154e-5b35-40fe-05cd-08da9cfbe2be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Rz7gJiNjI5lX0Wq0enDshCzbc489BBGdv1EhpiPrRyTN+amMMsbQ0TZcVDt9d5KQpSGmTt02wDB1SllwFiCd4jEEFFCJuZdgQ/uthOBOgLsAyBmDdFHyVIsFuO+UFTjRdP6sFL1urWpVv2CMJVkhcUi2srO6KHqpntZODo8iMOkSvYRZ9Dt0BERNxcWvGIZZxbpqzC43D36dbYi0n3+bUBvnipu2TRuYlxBmd0lCBw+pJnSJzHrAjl9jibsi801OzZw6F/fnmLTjXk28Zv1L6THUDfah9DtBubVy6riBpKMZpPWFhRUN0nbgqFVtSQUVOnOmWyqEpiUZR6ye0MHx9a99zr5YbEYDCUQ/kd6Cc/I6eMuIh3i8NVXAvityUxP20rxEium/uTgSO514+YXwSfauUOCgd7QXQoC0ZbyXkM7S8Extmxx6Mp+A7pI6R4tWJzxo4MYCZwgR9muBJlGJiWFDzt3SBo3hImoNyDc85FgIGomJa03k5XGrKCtnB/JzKvPS2Tk5ogmz88d0619cbMICjVUcs7xDB796R995pZch5j3EswxjDcpm6P107Dc/IY2zyQ+wCGDr63wcvmsKjR5/ZtS59SsFRjBK0rt6jsiwMmixS5hxUh2NRSv0BR4l1IJKGXI0yEkDzPtFlpA1fkQNQHzHh5HwFlmRiXyB/7l07qKMrbT5QU/de5/HKzDG1lAfEiTR/TPKLC1q2p863ANsq614h145onR3S7aXK4U6+IR2ufqCWgU/DcxOfqlLc5eq2LnkOyD/wrnfDq4Ycw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB3779.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(366004)(376002)(136003)(39850400004)(451199015)(54906003)(6916009)(316002)(2906002)(38100700002)(33656002)(66946007)(15650500001)(76116006)(8936002)(6506007)(7696005)(4326008)(26005)(41300700001)(64756008)(66556008)(38070700005)(66446008)(66476007)(86362001)(8676002)(52536014)(5660300002)(55016003)(122000001)(478600001)(186003)(83380400001)(9686003)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cTlWRW5SMzVOQndaZ29qWWJYb2pzcmRSdVYvcG9oeU1lM2JGSllGampqN3pm?=
 =?utf-8?B?bVgyYWpRUWMybk40R1lVNXg3RC93eGRiUVQydTBjbWgySndHdytMNFRqTzV6?=
 =?utf-8?B?dnZKQXplQXg0djBQR3JRcDFYWTUrZzZTc3VtSThiSDk2cVFpTVh6OFNGZW11?=
 =?utf-8?B?RXBHeThYOHRoOTBxcE9KQWNOV1dXVXNKMXNFSFU3MFlXQTZlaE15OVEzRHVy?=
 =?utf-8?B?bVNwZnlPWnVhbFRDK1hBQitIVndobVNvS0EvbkdPeWxVU2hEN0xFOHgyZ3dO?=
 =?utf-8?B?ZCs0TWwxZTFZd01FbmlONTNpYzJUb2ZhRjFydFdmbEd0R1lhbUxLRzQ1cVlr?=
 =?utf-8?B?MEpvWEpYdjlBR2IrbkVYTnA0WVhGeHdmeFJoOHVrblZNVDJ5WkY5SU5hdUNT?=
 =?utf-8?B?RHZGUmVpZUorSjgzYUprSGc4RkRlcmJhNFoxR0s0dFhlOXp0QjBTOS9mbEhH?=
 =?utf-8?B?c0loMWoxaStWNHJjVmFJMk1pVnVKWDErY213bDI0QTJSTktDN3d4N2YxQlZ2?=
 =?utf-8?B?a0grVkZEZENQUW50amhYQVBDa2ZjR2MvQzJzK0dTYkJLZU14MUpwajB1V013?=
 =?utf-8?B?NmRMSTZwWlgrSENtNVRtTkZEbWVxdGxVMmp5MERoVVprekxLN3NmT2RHdDNB?=
 =?utf-8?B?cWVTVjBNeGMxZGozbFROSGczRTF0R2t1Y21mQy9rWGhDZFJUMXhrZ3g0RUEz?=
 =?utf-8?B?OUNXY3hMbjVqa2FRVDJzVUJJbnpkdy9oYkp0WmRxZ1hzeDdCazIybGM1dndS?=
 =?utf-8?B?NVUwcDRKSU1VSFNQUGRXb1czVldsR3hMRlJFS0Q0TzFHNTQ2RUQ4b0szRW9C?=
 =?utf-8?B?N2pFZXUrb2NVaUZVSCtMaUtCT1JqbVB3Z1RNdnN3anp4UDZIb1BObXJnUkRu?=
 =?utf-8?B?Z0t6bUhSWG9BVlZrQVFzOExXRUVOZUQ0SmxnN0E1blpudkF0ZTZNeFRHNzBm?=
 =?utf-8?B?QWZPdTFzTW1qeEVkS3pQa1NFU1Jlc1YybTFsOHArTWNKaXpDM1NYdi9DekV2?=
 =?utf-8?B?R0RyaloyYnFwVEh5UTl5RkJ5QzJka2psdDFrN2U5MnZSb3dSbERmUUNFWS92?=
 =?utf-8?B?dDB5T2tJd2VHb3NVTnRyQXlwOEUzNXkzZzU5bjI1SUJkVEFING91elJPQjcr?=
 =?utf-8?B?a28zTEs0cWx4c0FNWThycDJxVWxzWEY5eXRoRk8vb053aGt6cEhHVmd6aHo2?=
 =?utf-8?B?NmhNSXcvek5IVnFwZGF4dWE4THFiNmNWVjBhVlNkOTlVUkhlYVBUS3pZRllB?=
 =?utf-8?B?aGx3WUszMmpOUWdzNDQrUk42N2MxanZIMmpmQ0dhVWxFdVVMV2xMVEE2VDRz?=
 =?utf-8?B?NTJHalE2U3R3SUZYQkpFend4UGU0REN5WW42VWVnRzEvcjZpeGVnSnB5ZTJC?=
 =?utf-8?B?YXptYmtQWmhIblFEd3R6NGpSNE8zczhOZC81eE1pTDRIZVlxSnVNbDZXcDhW?=
 =?utf-8?B?NWw0M2Z1ZWtWWjlNTGhFRm1xUUF4QkZpL0NqNkFNTkNWZG5KM3A0MXZXLzV1?=
 =?utf-8?B?NmtIUzVaWXJkWEh5dDU3ZVdHZEZvUXMrTjc3REpubXF2L3YzMEtTUVp2Vi9O?=
 =?utf-8?B?aWpSdDJYM25rTEVINHEyVFo3MHNkZzUzR0hMazZyYXMwdXlPT2Q2OWxuTXJK?=
 =?utf-8?B?ZUx5WmV1SnViQmFtR0pzeVlyOENMcERnWGhFUVZxVE9YUCtBY0twMUliOW9H?=
 =?utf-8?B?RjlJQitEMkRNZGIwSzlQTCtFaFBINHJQc21iWEh2dk9pYlFVUU93Rk9LcUdI?=
 =?utf-8?B?SExNWTZ6ZXpSdDI2T0VqZ3dJWEhMaG9weEhDZjBZbjd5MXRxdGFkY3VXaXFQ?=
 =?utf-8?B?UUoxcFM5ZmR5emhqdUxwWms5ZUlUbHpqcEVmRyttRGw5cW0yQzY1aElFdGJF?=
 =?utf-8?B?V0s3OEtqQ0txTW55S01mcFFzdzNPZU1hM0RoUXdqQlZrSzBBRzJpRm0xRmNw?=
 =?utf-8?B?R0VnZVh0d0JxcGZtR3krM0hvSjRJTmNLUDJvcHhZZklMOHc4SGtKYXdxdUZn?=
 =?utf-8?B?amQyZ2piN0UrT3p3YkVvU3lJZVFOSlBST2luMGozV01mUFpBUDZwK0F5Nzgy?=
 =?utf-8?B?L1I1Z1hOc0U5ZnFPVXNtME44eHFsUXdGZ3JSWktha0ZsbVczb3lKQWE0TnJy?=
 =?utf-8?B?blZHU3Nza3NONG1yOTJVZ3dLaWp1UVEzcTZwUnRENWNLZWkvN3hubUUzWXJH?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2488154e-5b35-40fe-05cd-08da9cfbe2be
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2022 00:38:08.0706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gZP9uSuFr89EMVWwkiNBtIQv/f78AnSR1JOlMzgznI8vndzNhkqOv7kdvz8Lu1RyvGEEE0AXPU/lVRWZ30WrcBdJ0goRnuyCxPD0mTNLDfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6269
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "andrew@aj.id.au" <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBDb3JleSBNaW55YXJkIDx0Y21pbnlhcmRAZ21haWwuY29tPiBPbiBCZWhhbGYgT2Yg
Q29yZXkgTWlueWFyZA0KPiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciAyMywgMjAyMiA4OjIxIEFN
DQo+IA0KPiBPbiBGcmksIFNlcCAyMywgMjAyMiBhdCAxMjowODowN0FNICswMDAwLCBDaGlhV2Vp
IFdhbmcgd3JvdGU6DQo+ID4gSGkgQ29yZXksDQo+ID4NCj4gPiA+IEZyb206IENvcmV5IE1pbnlh
cmQgPHRjbWlueWFyZEBnbWFpbC5jb20+IE9uIEJlaGFsZiBPZiBDb3JleQ0KPiBNaW55YXJkDQo+
ID4gPiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciAyMywgMjAyMiAyOjU4IEFNDQo+ID4gPg0KPiA+
ID4gT24gVHVlLCBTZXAgMjAsIDIwMjIgYXQgMTA6MDM6MzNBTSArMDgwMCwgQ2hpYS1XZWkgV2Fu
ZyB3cm90ZToNCj4gPiA+ID4gUmVtb3ZlIEFTVF91c3JHdWlkZV9LQ1MucGRmIGFzIGl0IGlzIG5v
IGxvbmdlciBtYWludGFpbmVkLg0KPiA+ID4NCj4gPiA+IEV2ZW4gaWYgaXQncyBubyBsb25nZXIg
bWFpbnRhaW5lZCwgaXMgaXQgdXNlZnVsPyAgSXQgc2VlbXMgYmV0dGVyIHRvDQo+ID4gPiBsZWF2
ZSBpbiB1c2VmdWwgZG9jdW1lbnRhdGlvbiB1bmxlc3MgaXQgaGFzIGJlZW4gcmVwbGFjZWQgd2l0
aCBzb21ldGhpbmcNCj4gZWxzZS4NCj4gPg0KPiA+IFRoaXMgZG9jdW1lbnQgaGFzIG5vIHBlcm1l
YW50IHB1YmxpYyBsaW5rIHRvIGFjY2Vzcy4NCj4gPiBBc3BlZWQgaGFzIGRyb3BwZWQgdGhpcyBm
aWxlIGJ1dCB3ZSBrZWVwIHJlY2VpdmluZyBjdXN0b21lciByZXF1ZXN0IGFza2luZw0KPiBmb3Ig
dGhpcyBkb2N1bWVudC4NCj4gPiBUaGUgbW9zdCBpbXBvcnRhbnQgcGFydCByZWdhcmRpbmcgS0NT
IHBvcnQgcnVsZSBpcyBzdGlsbCBrZXB0IGluIHRoZSB1cGRhdGVkDQo+IGNvbW1lbnQuDQo+IA0K
PiBJIG1lYW4sIGlmIHlvdSBoYXZlIGNvZGUgdGhhdCBpcyBpbXBsZW1lbnRpbmcgd2hhdCBpcyBk
b2N1bWVudGVkLCB3aHkgZGlkDQo+IHlvdSByZW1vdmUgdGhlIGRvY3VtZW50PyAgSSBkb24ndCB1
bmRlcnN0YW5kIHdoeSB5b3Ugd291bGQgcmV0aXJlDQo+IGRvY3VtZW50YXRpb24gdGhhdCBwZW9w
bGUgc3RpbGwgd2FudCB0byB1c2UuDQo+IA0KPiBJIGNvdWxkIHB1dCBpdCBvbiB0aGUgSVBNSSBz
b3VyY2Vmb3JnZSBvciBnaXRodWIgcGFnZSBhcyBhIGhpc3RvcmljYWwgZG9jdW1lbnQuDQoNClRo
aXMgZG9jdW1lbnQgaXMgYSBwZXJzb25hbCBub3RlIG9mIG9uZSBvZiBvdXIgZm9ybWVyIGVtcGxv
eWVlLg0KSXQgaXMga25vd24gdG8gb25seSB0aGUgb3duZXIgYW5kIGhpcyBzdXBwb3J0aW5nIGN1
c3RvbWVycy4NCk1vc3Qgb2YgdXMgaGFzIG5vIGFjY2VzcyB0byB0aGlzIGRvY3VtZW50Lg0KSW4g
YWRkaXRpb24sIGFmdGVyIGNoaXAgcmV2aXNpb24sIGNlcnRhaW4gaW5mb3JtYXRpb24gaXMgbm90
IGd1YXJhbnRlZWQgYW55bW9yZS4NCg0KUmVnYXJkcywNCkNoaWF3ZWkNCg==
