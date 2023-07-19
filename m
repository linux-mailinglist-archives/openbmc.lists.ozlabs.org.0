Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EAE758DC7
	for <lists+openbmc@lfdr.de>; Wed, 19 Jul 2023 08:30:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector2 header.b=fC3+PNve;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5Qtl4Bzbz2yGh
	for <lists+openbmc@lfdr.de>; Wed, 19 Jul 2023 16:30:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=temperror (SPF Temporary Error: DNS Timeout) smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feab::711; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=jammy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on20711.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::711])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Qt04ch1z2xqB;
	Wed, 19 Jul 2023 16:29:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLXtwO3Lt5nGWmmmFiwOhRYkaEJ9wu+2mjHhKrvSAnyNBPV9Ii/NHA8HPJBb1dsJUx3I3d0szOWak/jUX3AVSv9FnRTxIkjxWu7SLOpKo+wEUx8VoZRaK/CSyzRe8RBB4fFpB84ibZWos8ENOCdmNLBFih5Ag2ESDNLTpgKlyCOZ2t5U3GUitPQaOGpI1LqkrMZqrySQyaNpjx6HKrpY84lrJDGnVkRZdT0fmcQgSHi0ALxdBsTZJCrfLM/7ip5lY4gSNRCoea0cEFlhokKAYz03iko6Yc7TeWhQmG+kKYqyE3fciDWjEGzVcUg27FdC7K73aVJKd6KHlahzuV8Uuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJXzym+0HZnirUS00uHhHyenT/bLb4/Za/PWRB8Bdug=;
 b=VC1do9a0jsZTQXUZZyXmhm+OA8I4Ka1MxTYCZmIuXuamLR1M/5LOydXX0qpa2Q4GOoe+Qvl2NgYIc4fcr1gF/QQKdZI5F8v3YKOpNPNA7hf30L1jcsH2bjiuiE/Iy8fwQ1W5Yd5Z8i808DKmavRxp91+qNGsAoQIZ2GvPeDEdjQPQb0uZGT90JFu/gDv2BdYmIjiOxaTGCsyCLTl7TKZ1hKuhm9gCu/TS/+8rOekgBcyR6PwrhN1NzJI0EOEwh29b388awftiMkxN4f3woy+AzMfHQYMwEq2No39q0fWF7TZU3gryeyCrGOth2CmRaTVNaLcZpxNCgrbhJw9X5p4+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJXzym+0HZnirUS00uHhHyenT/bLb4/Za/PWRB8Bdug=;
 b=fC3+PNveAEJ8FblpRY09L47BWFwhTr8XAJX/z3i+Fk2ZLaC8I9M8T6aFArOT+mro7U3kfJchu4VofBk1NC0Wb2qePjV13Z924DwdNcDU/bzS3dYJQ5UzqWChIN/VJS3HAL3lAUXXZhwtjSaEBGlENpX/Y8NlMRdHHAXZvFb+TZbjG/DqOSe6Dl/1LYkbTxueqbWYVBRYULUEAwmpkFCYTrclGqgs+wiDl6KiCwOCvZLQNd0EIzWHEFnT5w1u1NiARkqkPdn13/uYRNE0lbNNAvKucG+8tV5uGagiKlco3I8Hs/LwkNbBkNOPX0R5/E7ICEJnuONtgHpug8IeJglEtw==
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com (2603:1096:400:45f::6)
 by KL1PR06MB6577.apcprd06.prod.outlook.com (2603:1096:820:f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Wed, 19 Jul
 2023 06:29:32 +0000
Received: from TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72f5:eab8:7757:7c49]) by TYZPR06MB6568.apcprd06.prod.outlook.com
 ([fe80::72f5:eab8:7757:7c49%6]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 06:29:32 +0000
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Jammy Huang <orbit.huang@gmail.com>,
	"eajames@linux.ibm.com" <eajames@linux.ibm.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au"
	<andrew@aj.id.au>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] media: aspeed: Fix memory overwrite if timing is
 1600x900
Thread-Topic: [PATCH v2] media: aspeed: Fix memory overwrite if timing is
 1600x900
Thread-Index: AQHZuJQ8BqR6bi4hVUyvh73dsNaSQq/AoI6AgAAC9EA=
Date: Wed, 19 Jul 2023 06:29:32 +0000
Message-ID:  <TYZPR06MB6568C3CE08659F86C301787DF139A@TYZPR06MB6568.apcprd06.prod.outlook.com>
References: <20230717095111.1957-1-jammy_huang@aspeedtech.com>
 <21e13f35-5caf-6d60-c388-3386e3540834@xs4all.nl>
In-Reply-To: <21e13f35-5caf-6d60-c388-3386e3540834@xs4all.nl>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6568:EE_|KL1PR06MB6577:EE_
x-ms-office365-filtering-correlation-id: 73fa09d3-92b7-47fd-20e1-08db8821836d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ftE6zM2W8pbYcrNnYcIpftvRzlH7f4inwQXuGMj9CHbAIA5NJXfmAlyVpI7b1/vRCzmXsJELyXjWiuSAaj7Y/qCUgXNtaNHHA3v0ZmxOM3XteA9YIy2Jaie43Ttxo5+SWvSgWdI8ebGmYslkzUacHFy17KFM+t5RZZL3PCHIQ9jVNyaYozpxMWv+oqvEvbLoBxbjljisrGIzJWyj/adF1So33Xy+krQxnrueJ1uZ+6pj+MxxAm362Alvp6vnhazilg1x+JgYZkglLgUvDCjQh+2NWn1eV++KMsdSPpSKIq9x+JLkEP9x3W9zKcp5yYNtkQXLujvW2jbKkfhhX76esHBkevc6jCWOyqzh9tL7TFFZLPKfCjA3WDJ55Xf1UIWdl/Zvuhsk8X3lGtUHt2exjMbL0B32t8ULqCclGRya+48CkevbglsM3RQkQRDn8ejtVPqb3iB6yQOAhVCLi4YFoas8jArVZvzhvq6i5+TwnKU1gQCuEGhQck7kqaECaUxEPC7B+7YHq6uo4/LlnbyfTtYl+XfjP+VfDDIDDbtPF03JaG3WgCSoxx9R0GMZJ9uNTmjcNLslHLSeH/CIL4m3leu0JoXm6U+5pxlxlFnhLnWuMQWCfDgJ7MEXM97Rs3uv
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6568.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39850400004)(346002)(376002)(366004)(136003)(396003)(451199021)(38070700005)(55016003)(316002)(26005)(53546011)(6506007)(71200400001)(7696005)(122000001)(110136005)(921005)(86362001)(33656002)(9686003)(478600001)(66446008)(64756008)(66946007)(66556008)(66476007)(2906002)(38100700002)(76116006)(186003)(7416002)(8936002)(8676002)(83380400001)(52536014)(41300700001)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aVkzcEt0MHdONlBNc3M4NlB6ZFVTWGl4d09aRTRyNnZ0YmJLQ3JuU3BFb0Rs?=
 =?utf-8?B?Nlhaa2wzU3M2d2ljVnpxeHNwZUg0Ujc2WjlPNjBob0FETDFzcXJKWWZFbVRk?=
 =?utf-8?B?ZTNCY0J6Q2ZxNG9ZUGhZMU1iNThFUmdFekxkaU1NMk1yVlhnRTlMdGVlL0ww?=
 =?utf-8?B?KzJlUXF2OWhTM0gra2xYSE80UndsMm8vd1lENWJlMU4vU3VmZDRrSXlaRHo0?=
 =?utf-8?B?Z2UrcUs3dTNZbk91bGdXSWVWWS9adXh4TVBWK0pySHhlTEVrZ2hoU0dzVzR4?=
 =?utf-8?B?eVFJU2xqK1plVTB6dTc5T3pwb1RsMC91d0JSazZmbVB3VitsZHVlUE9jckE0?=
 =?utf-8?B?RUI3N09NMi9NcFdNM1JqSjNXRzlRbjZLd3BmeVdNTTVjTkw0U1RCMzVhQUNM?=
 =?utf-8?B?SVVsZnFVMUtlQVpYYk5paUQvTkxvMy9EN1pDNjZONXRRaUZSYTJNSkFqZXdI?=
 =?utf-8?B?QVRSWDdpS2F2OG1Eb2hzOXJYRkVKTXVWUnZxYTZwTVpZQ090dU5hcW51enU5?=
 =?utf-8?B?bkhmMWQweUxYaVFFL3M2aGNwM1hBemNKQVFwR090cm5aOHpPRXlLbmlITmZJ?=
 =?utf-8?B?OG56MUxWSEFBaEJlcHowRUhXRmxNTkJzcjFDNWJqTzdCK3ZobHRhWmpPbGhP?=
 =?utf-8?B?V3lXaFdlK04yd0ZEWDhuanVVZlV0c2lsTU5vbm9IaktORFYrMnRobGRIWlBn?=
 =?utf-8?B?aDNQM29sZ1pvS2RxbytITnFKY2p2Q2hLRGFUY1FwSEtuQUY5QlNtdkRKUmNt?=
 =?utf-8?B?SFJiK3hPN0I4RWZBMHNRZ0w5ZXNkRVg5NXZwNzN4eFlOT2gxT1hnYUxZY0cw?=
 =?utf-8?B?elBsU2JzNGFBa1RLd1FVV0lHYlBBaEIvSkZndVFsNEEwU2V5Vi94UEZKTm1y?=
 =?utf-8?B?aVNHU05WeVVXaWh3UGlhUGhpQ2E3OTI5TU1TckdqNnBHZFBSdk53L2VTRnky?=
 =?utf-8?B?YWZocTZZKzdoUFdURGR2UDg0QVJteGludUhuWEt4a1VnTTcwcjBaSEdsM0xi?=
 =?utf-8?B?NmxmdlYzRG84QUp5RDIxdFpkV3JqWHRLUU43QS9scy9wVi9EOUN4YW5pTm1t?=
 =?utf-8?B?VHVVSUlNaVUvUWVvK01uMU0xbEoxNHc0VG50S0VFL0hMSjZ3cjc3MCtSaEQr?=
 =?utf-8?B?cTEzMUdmakwwR2o5bkxZL3puWExVenhHRHNMcFBGblRVQTgweHd2UjZGTHVT?=
 =?utf-8?B?TCtROTVkQ3dSSTVGUzRDNmJiRlV1VGl5ZWhpMmNGY1dGbTZLdEg2dUtzbThz?=
 =?utf-8?B?ZGZtTWQxMk40U3pUV3lwMkRkSEpWdGFYN3F5WHcxT2I4NStPeW9GRXFVQ0Fq?=
 =?utf-8?B?SWRnOWdhYk9XVzRDSFV0a2RRdk9BRjdwRks0cG92Y0RTeEdOcTRwV0J3dDRo?=
 =?utf-8?B?WjRPYnVmbUd6NHJsKzZzQnRvbEtFYjgrSGx5ektlSWtLQUF5TEdLcGJQdXhP?=
 =?utf-8?B?RlVTZ04yVlN2MTZlL2QrZmoya3dVdjFJSnJzUEdOdVh2UVJiNzhMOWcwalVQ?=
 =?utf-8?B?NUYvczhsWHByOEc5dTBocXdKZkR5bU10dm9xaHBxems4RkhtWjlheTFmR2xk?=
 =?utf-8?B?d2JlT3NoREplbGwwZVVnNkhVQUk4UERWVGhXRC9ZWjh6WEUvNG9RcDRsTkFM?=
 =?utf-8?B?WUd1RDM1ZTJEQzFyZzZFcXIrVExHS2dhbXE2ejVza1JkL2hrcjJFKzdycjNl?=
 =?utf-8?B?RFhKeXhSMUNFYjN6aG93RThMM01sUllvMVNDaFBTdWNqVThYdGpneGNwNVZw?=
 =?utf-8?B?YnRDeHpCZVNDQVdxMm5UVmZYeWkwWXJFMU9oQlJMOWlIdVJ4OHN3dTgzak8z?=
 =?utf-8?B?RXNiZ1hQMXJHOVp2M2UyYWI2dG8yVWc0UG95WnQ5bkQra05YbVBPUDljZ1NT?=
 =?utf-8?B?WFpzZ1VhSzVMVkxxWWVQTlorTWFJTENER2UyT2c0QVBhd3JTNVdLUVh4QmJ6?=
 =?utf-8?B?R05OVkkrR0Z5bE5NQVIyU0NHL3lDT1AvY0FkYXVNQkJVdHFCNUsvZUdUcmNY?=
 =?utf-8?B?WXJSd2JxT0NrK1lId1pvKy9YZzNrOS9DNmlDWWFYV3BBaVkrNjk0cHplTHVR?=
 =?utf-8?B?VVpINEJ2ZUtLam5FYUdITHhQV1pMNk5nU3NFZTNsdE1YSnJwMXZrKzIva0pk?=
 =?utf-8?B?MVRlK1ZSRENDa2QwZ0t4RmVrbkdTbUdIQ1N6Z0NmcW1KY3pwUlRDSVFBUjUv?=
 =?utf-8?B?S1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6568.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73fa09d3-92b7-47fd-20e1-08db8821836d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 06:29:32.3124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M/YwE2ePRm+QfO3pTWOzgz5vGG8ppwYiWRpv8y6eYLYWbCnx+bs1f5yGMA4+0pXD5J3Yz1bKYhQY8Jo/58uRA0IiRzSp2HvQ9JANH12+WQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6577
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

SGkgSGFucywNCg0KQVNQRUVEJ3MgbWFpbCBzZXJ2ZXIgaGFkIHNvbWUgcHJvYmxlbSB0aGVzZSBk
YXlzLiBJIHdpbGwgdHJ5IHRvIHJlc2VuZCB0aGUgcGF0Y2guDQoNClRoYW5rIHlvdS4NCk9uIDIw
MjMvNy8xOSDkuIvljYggMDI6MTgsIEhhbnMgVmVya3VpbCB3cm90ZToNCj4gSGkgSmFtbXksDQo+
DQo+IE9uIDE3LzA3LzIwMjMgMTE6NTEsIEphbW15IEh1YW5nIHdyb3RlOg0KPj4gV2hlbiBjYXB0
dXJpbmcgMTYwMHg5MDAsIHN5c3RlbSBjb3VsZCBjcmFzaCB3aGVuIHN5c3RlbSBtZW1vcnkgdXNh
Z2UgaXMNCj4+IHRpZ2h0Lg0KPj4NCj4+IFRoZSB3YXkgdG8gcmVwcm9kdWNlIHRoaXMgaXNzdWU6
DQo+PiAxLiBVc2UgMTYwMHg5MDAgdG8gZGlzcGxheSBvbiBob3N0DQo+PiAyLiBNb3VudCBJU08g
dGhyb3VnaCAnVmlydHVhbCBtZWRpYScgb24gT3BlbkJNQydzIHdlYg0KPj4gMy4gUnVuIHNjcmlw
dCBhcyBiZWxvdyBvbiBob3N0IHRvIGRvIHNoYSBjb250aW51b3VzbHkNCj4+ICAgIyEvYmluL2Jh
c2gNCj4+ICAgd2hpbGUgWyBbMV0gXTsNCj4+ICAgZG8NCj4+IAlmaW5kIC9tZWRpYSAtdHlwZSBm
IC1wcmludGYgJyIlaC8lZiJcbicgfCB4YXJncyBzaGEyNTZzdW0NCj4+ICAgZG9uZQ0KPj4gNC4g
T3BlbiBLVk0gb24gT3BlbkJNQydzIHdlYg0KPj4NCj4+IFRoZSBzaXplIG9mIG1hY3JvIGJsb2Nr
IGNhcHR1cmVkIGlzIDh4OC4gVGhlcmVmb3JlLCB3ZSBzaG91bGQgbWFrZSBzdXJlDQo+PiB0aGUg
aGVpZ2h0IG9mIHNyYy1idWYgaXMgOCBhbGlnbmVkIHRvIGZpeCB0aGlzIGlzc3VlLg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IEphbW15IEh1YW5nIDxqYW1teV9odWFuZ0Bhc3BlZWR0ZWNoLmNvbT4N
Cj4NCj4gWW91ciBlbWFpbCBhZGRyZXNzIHlvdSBzZW50IHRoaXMgZnJvbSBkaWZmZXJzIGZyb20g
eW91ciBTb0IuIENhbiB5b3UgcG9zdA0KPiBhZ2FpbiBmcm9tIHRoZSBjb3JyZWN0IGVtYWlsIGFk
ZHJlc3M/IENoZWNrcGF0Y2ggY29tcGxhaW5zIGFib3V0IHRoaXMuDQo+DQo+IFJlZ2FyZHMsDQo+
DQo+IAlIYW5zDQo+DQo+PiAtLS0NCj4+ICB2MiBjaGFuZ2VzDQo+PiAgIC0gQWRkIGhvdyB0byBy
ZXByb2R1Y2UgdGhpcyBpc3N1ZS4NCj4+IC0tLQ0KPj4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
YXNwZWVkL2FzcGVlZC12aWRlby5jIHwgNCArKy0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9hc3BlZWQvYXNwZWVkLXZpZGVvLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRm
b3JtL2FzcGVlZC9hc3BlZWQtdmlkZW8uYw0KPj4gaW5kZXggMzc0ZWI3NzgxOTM2Li4xNDU5NGY1
NWE3N2YgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FzcGVlZC9hc3Bl
ZWQtdmlkZW8uYw0KPj4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hc3BlZWQvYXNwZWVk
LXZpZGVvLmMNCj4+IEBAIC0xMTMwLDcgKzExMzAsNyBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfdmlk
ZW9fZ2V0X3Jlc29sdXRpb24oc3RydWN0IGFzcGVlZF92aWRlbyAqdmlkZW8pDQo+PiAgc3RhdGlj
IHZvaWQgYXNwZWVkX3ZpZGVvX3NldF9yZXNvbHV0aW9uKHN0cnVjdCBhc3BlZWRfdmlkZW8gKnZp
ZGVvKQ0KPj4gIHsNCj4+ICAJc3RydWN0IHY0bDJfYnRfdGltaW5ncyAqYWN0ID0gJnZpZGVvLT5h
Y3RpdmVfdGltaW5nczsNCj4+IC0JdW5zaWduZWQgaW50IHNpemUgPSBhY3QtPndpZHRoICogYWN0
LT5oZWlnaHQ7DQo+PiArCXVuc2lnbmVkIGludCBzaXplID0gYWN0LT53aWR0aCAqIEFMSUdOKGFj
dC0+aGVpZ2h0LCA4KTsNCj4+ICANCj4+ICAJLyogU2V0IGNhcHR1cmUvY29tcHJlc3Npb24gZnJh
bWUgc2l6ZXMgKi8NCj4+ICAJYXNwZWVkX3ZpZGVvX2NhbGNfY29tcHJlc3NlZF9zaXplKHZpZGVv
LCBzaXplKTsNCj4+IEBAIC0xMTQ3LDcgKzExNDcsNyBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfdmlk
ZW9fc2V0X3Jlc29sdXRpb24oc3RydWN0IGFzcGVlZF92aWRlbyAqdmlkZW8pDQo+PiAgCQl1MzIg
d2lkdGggPSBBTElHTihhY3QtPndpZHRoLCA2NCk7DQo+PiAgDQo+PiAgCQlhc3BlZWRfdmlkZW9f
d3JpdGUodmlkZW8sIFZFX0NBUF9XSU5ET1csIHdpZHRoIDw8IDE2IHwgYWN0LT5oZWlnaHQpOw0K
Pj4gLQkJc2l6ZSA9IHdpZHRoICogYWN0LT5oZWlnaHQ7DQo+PiArCQlzaXplID0gd2lkdGggKiBB
TElHTihhY3QtPmhlaWdodCwgOCk7DQo+PiAgCX0gZWxzZSB7DQo+PiAgCQlhc3BlZWRfdmlkZW9f
d3JpdGUodmlkZW8sIFZFX0NBUF9XSU5ET1csDQo+PiAgCQkJCSAgIGFjdC0+d2lkdGggPDwgMTYg
fCBhY3QtPmhlaWdodCk7DQo+Pg0KPj4gYmFzZS1jb21taXQ6IDI2MDVlODBkMzQzOGM3NzE5MGY1
NWI4MjFjNjU3NTA0OGM2ODI2OGUNCj4NCi0tIA0KQmVzdCBSZWdhcmRzDQpKYW1teQ0K
