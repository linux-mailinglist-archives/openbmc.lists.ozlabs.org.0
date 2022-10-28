Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA59610F97
	for <lists+openbmc@lfdr.de>; Fri, 28 Oct 2022 13:24:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzKvY1vyyz3cFG
	for <lists+openbmc@lfdr.de>; Fri, 28 Oct 2022 22:24:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Tt9fY2g5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.220.90; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=thang@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=Tt9fY2g5;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2090.outbound.protection.outlook.com [40.107.220.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzKtt602Dz3bc4
	for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2022 22:24:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ciHsJ8zjLW3oRtk0moZCfcG3tjWQooMOPF8jf/v+Cn34tI5YYRuMHcCuROxWbeNt36FWJcimt4Ct1Gk7ysGn7h5ApsQxhrZXfOG6S2X6gJKX7ap4CzcT2HTV5HuK0XA47n6AFTBG+IjXOqTxzfK16NYoiiPUFGMfZjeUyK3GhsBmOxu+H+y8HXS9XhYhGgV6xDx82+I0HcWZGg8Klja3e/cs4DG4U+DFbr68uOWVoagOMDKNSbnKSnrFAh6Cq2P1XNqOvJJETObukLvRmm6eLpckQJMqoeJDJ10LHEkVl3cipmvPuU5FsUFO1Q436+jJV3I6rV/Kb4WwB9HhLHsC/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLmUmtaEhVQFVeVgwGCF4Z6nIZHAQpe/9MWnm/X01FY=;
 b=A6bTHMOzTnDyTAzsslMOo6u90JTFaywHkX4v+jN1BkWw1oeheLRX3D4yq5bLc4ObF7U4wA8mu1Rk4XDusCoa+OTT4Q33q+DWTUU15mRch7drytS+l6XovEo9o7FaoQTEhBcCPnGXbLo5MxW3OGRBRMHoHrLFe/5QquLCseZpW15QUoD5Uv/VQmvUdKpwAXb6fImjR7MzyqnPmOtVTreGhCf3El7+3QyVBq83QjoNaW1hQr48rZjm5JlnzsIO1NIsheRftxjbpzDWm0Inlvl0wI+Hyc9MF42s4UsE/3Y0zzxFy8nv+kEc3B4q+0gG7XYQzrCboRIHRGVHQtMtmJQhaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLmUmtaEhVQFVeVgwGCF4Z6nIZHAQpe/9MWnm/X01FY=;
 b=Tt9fY2g50+hiRww1ZE6+rtUBf/JHbII0HF1rV3I+0GAo6LFR4DKSSAD75iAQUsBoagxmbbaYc3C2gUgrW7rNx5UkZQBNtpBH6XSLu9OiGGzoJfXNEuBgxEVMktHCJ4H51Or/FQjkIDoqcEz8E9nBd6PGzBosUA4LiQBYpbfBFaM=
Received: from LV2SPRMB0006.prod.exchangelabs.com (2603:10b6:408:17f::9) by
 BL0PR01MB5057.prod.exchangelabs.com (2603:10b6:208:68::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.23; Fri, 28 Oct 2022 11:23:44 +0000
Received: from LV2SPRMB0006.prod.exchangelabs.com
 ([fe80::125c:4b66:f052:9c4d]) by LV2SPRMB0006.prod.exchangelabs.com
 ([fe80::125c:4b66:f052:9c4d%9]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 11:23:43 +0000
From: Thang Nguyen OS <thang@os.amperecomputing.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: How to use phosphor-multi-gpio-monitor for GPIOs with both edge but
 different behaviors
Thread-Topic: How to use phosphor-multi-gpio-monitor for GPIOs with both edge
 but different behaviors
Thread-Index: AQHY6r+8mWHB/tqOgEKAWU9UIx1wdg==
Date: Fri, 28 Oct 2022 11:23:43 +0000
Message-ID: <94bedfa0-06b6-b83f-bbfd-696e36f6b4eb@amperemail.onmicrosoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2SPRMB0006:EE_|BL0PR01MB5057:EE_
x-ms-office365-filtering-correlation-id: af765192-f88a-4be8-f761-08dab8d6df65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  9g0+PVCrCwyzlg56egRs/SUcCP4jz9SZeiYfcNlvb9aP3a8+DRHTBGhjb2Bg+OlhugrZZG4z+5XzsW0ljuN3x7GiEtoxGujFpHkJyn6YvZFMODZWDm0CShL1KhU7lmDrMxY6Ozu03QZ2kCNGJl8OXBKAfBozQ6fgIK1mcLNb2eJ9dDJzyPvgFZNgxiaAsmib6NmuGtDsXE1ZZwtAoSqBArF45RVED6jFmfw5BDridbAVWfOWbz1DYj8u7uVHLJfZEeuz3IAjIThIF4NG2sx3Wj6p3bnor0UY7StI2LUeJkxWqNRDufAX9ULUdymBD+cH4i0lyYNa45/8MddK/ddksiVvRuGU3lC92q73CE6ak4ix7QIX2sQ63TSOv0YaSklW2uDXFnzCm+nZsA/YzVlxgnj+LUa7UiuYS+k9lfppqv1LAQV4tvPt9/lfqlFaypM9NLJyB5Eum8ITvd440XMqeXX45VvQYkFpDa5WE1bflKvwYQO0Bq/e0R6fhe/KSW+xn7cxEFN65m8HwI9TaxQDuHREbPlMowdKpOSoWldxqv12WSK73OvBOAOjjYEpYrhJQz6LPaYMAo8VU72VY+VEQm0b2UPfMwPlIuLsxQDQwq0Lq3YYghbWavviOOh8M/DuQ/SttP2y/U6EGHreP/vikO7+b3cwbnpxwf2h+dZ1mavNyaSzJiB0+LTTw+l6U6GgBpeaCyWyIrdMvvvbcrFI9+o6UqM3KxR2GyeAT5Y4H+4g4EykAeGE3n6MItZxnlTutvlXokWNSIjJRSsWpzFMGw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2SPRMB0006.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(396003)(39850400004)(376002)(136003)(451199015)(38070700005)(122000001)(86362001)(38100700002)(66476007)(31696002)(41300700001)(64756008)(83380400001)(4744005)(316002)(8676002)(91956017)(71200400001)(76116006)(478600001)(8936002)(6486002)(66556008)(66946007)(5660300002)(66446008)(2906002)(6512007)(186003)(6506007)(6916009)(31686004)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NjI2Z2dsUkpWWWlRNVdtbG52R0FnUHNuUmtON3lneGY1bGdLeXdmSEFnNUFR?=
 =?utf-8?B?OUZDTzNlZnVJdUh6cXIzNm04Rjl1SUFqUGpScXVORTlRWDJyUFZ3bDBKTEpT?=
 =?utf-8?B?MjFNRzIyTWtNa1BITlRnbWlFNHMxUTBaRndaS3VDSnFOV00wc0F3MStUZ3Ji?=
 =?utf-8?B?MS90b3o3dmxMT0s4Zi9NTUNnV1lkcStycHdKbFFqVXBCeVdXSVczdGRQV0RD?=
 =?utf-8?B?RlgvSFREM0JmNmNtZlE5b0w5QllabzV2Wmlqd3ExMGJpeG1xUGFjaHJDTGow?=
 =?utf-8?B?aGRIb1lRODJFRGQ5OE5MRHEzL09vc2tOcU95MWtrcVp3Mk5xRHV6UDRsQUUr?=
 =?utf-8?B?VWhiV2hWOXJjZ1UvNUxpend6bkFhZXJjc1cvMmJyY0JIVm9vK0g4bUVHS1Bu?=
 =?utf-8?B?cEt6T2diMnFkWjJYQUs3aDBkRmRhbklqYjF5K21HeVBYSUFYc0crZGxkVzR4?=
 =?utf-8?B?NkR2TStqZHJqUm44OVlsQnRhR1NmSHlQMUhYbXJuNHpkQnZabVAyb09xZnNI?=
 =?utf-8?B?MTVzditYMGM1ZW95TTEwV1lJYlJXOENFV1JnbnhlbGpuYVdZbytaOFVJUlhx?=
 =?utf-8?B?OHYxUHpKcXF0aWlNS1RUVFdvT0h3bVZoM3RUNzU2K2NGakUzY3FCb3BXTWlx?=
 =?utf-8?B?aTJjZTdheTdQWFc3U0dJRjg2NUM0aEsrUlY5WVJPTy9BaUFPcndSdkFZdU1D?=
 =?utf-8?B?N21qS3lMOUp2NDBKWlZETUNzSlJWVm0wVzZEcUMzdWtLMGduVFlLektySHRK?=
 =?utf-8?B?YUE1YUFqeXVFVjJCN1JKZCtpT0RiS1Y4R2ExTzY4K3FkN3kvZmVXVjF6LzJ6?=
 =?utf-8?B?RnloNC8rbUUvOGJxSWdxREJiekJhdE9XWmt6UlVMSGZ2VFdwbFBZd2V6eFBR?=
 =?utf-8?B?dTVkRXo4QkhRZTI3cG5uT0JBcDFTZGppUVpzdXh6SWxtUGNYMlEyRVdTeVhI?=
 =?utf-8?B?T0szdS8xTGkxbVphVGYvSEJiWFczSCttb0xESTd0cGRyYXdSRnJIemgrRUpz?=
 =?utf-8?B?OVo0dXVVdTgzKzh5elRPWEFJcnBJZHBXNkx3R1ZvRk9vZ3VvcVdNaWtzaTgy?=
 =?utf-8?B?Y1RqSFNBMDQxcWhUN3AxWUZmTW4rdGhRcnVaRzh2azU1Rjk1ZmdLV29kdTFj?=
 =?utf-8?B?Q0J5NW9NQ1h6ZlFzMm8xOUQ1Vk00K0k5N2h2cGtVUGxGd1AvejFmNzhjUndm?=
 =?utf-8?B?bjhmOGQ4aCttZktWM0JFL0tCVkRjamU3MnVpYTlEZDZCWHV1TzVKWGlwbDRN?=
 =?utf-8?B?MTVIczFxSXB0ZEJDd0RNUSswV1h0dUVjSko5bGtoRGxQV3ZnbnJsZll4WmRY?=
 =?utf-8?B?MVVobmVpOVFGVmY5c0dwTDJKRXJLdnFPOHlGdzkvR2czRC90SWlBanN0UEhT?=
 =?utf-8?B?QnNjU2JxRkxxVGNIdXNuY3p6VGQvdE91THhad1JVYmd3MzNUTFdOZjg0WVgv?=
 =?utf-8?B?TUhST0xPVTZtbnAybnhacnNpb1B4MGJ3M3ZsWkxYTjVFOFRGdmFhcWh0QUhY?=
 =?utf-8?B?cnhOM0ZYclRpR2MvcEd0UERJdlN2MEFPTDdONThMNkYrZHdHKzJ2T0Exam9V?=
 =?utf-8?B?dUJLWm9GMTY3aGNDNDcxd2k3L1JWVVpRM21iL0FVWW4ybm9nTDZjL0xKclV3?=
 =?utf-8?B?cXFwcHFrV2lNVWhUNGJQWnpQT3ByVUtEenFBTElTdGVSOG1sRTZyMmJ0UXdB?=
 =?utf-8?B?ZzF3UmVqblAvQytYVzFzS0V5ejdBMlBVSW1QbitVOFJOYTljaDViT1NIQytJ?=
 =?utf-8?B?MW4wZEJpMEtCVGFxUTB3by9IUi9KdlU4cDQ5RURrUnU5Y0xqWHlaZzdNSHpz?=
 =?utf-8?B?UElQTkl4MmpwOWFWeG5uU0lJdzZCL1Q2K0MzSXc5RG5WZ0dDa1lDTEdyTkl6?=
 =?utf-8?B?cjQvSDRQOWcySXpGLzJvdnpiSUppc3hBTEc5SElsSmNMQTY3YkcvOE5lUWJv?=
 =?utf-8?B?Z2g3Z08wWWVUcmlqalFEb3R2L2VqUFhHOGRtUVJ2R0Z0UmtnSlYvMUNmRVFL?=
 =?utf-8?B?cnJUdmQzTXg3dm5CSVBsc0RaUUhnMy92R0Q1c1BBMGNxUXZLc1hOd0J0MWxT?=
 =?utf-8?B?aWlsTDB4M3NHZElPc3lCdmtCV0dTUEN2WXA5QVVJWnp1bVhmSkM5MklNamVo?=
 =?utf-8?B?dW1VVUtlVDA4WkxPd0d1VEcvazJzTW16TDh3RjFxM0duNGFVUVh2NjVsNFZW?=
 =?utf-8?B?bmFQZ205ZlJWNUZzRk5jRy92WG8yZGxjMC9PT01JaVcyUGRjcmFUOWY2d0to?=
 =?utf-8?B?ZkRMVkV2U214NlNTeVZ6TXlROHBRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1650D42FF7B2284690E1546ED43A0EC9@prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2SPRMB0006.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af765192-f88a-4be8-f761-08dab8d6df65
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2022 11:23:43.6391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VlLLZxFg5uF4P63NP6EtUkbpuDPAgIqGcyb2XsWbDrBbQ/0PAjD3Rgf5Z1687JJAIbvhVGiI8TvObW0a0MWvcu/VvzrFH5u+CLQ9GMbw2zrDVTjo9OENMn92nqf8Ei1Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB5057
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

SGksDQoNCkRvIHlvdSBrbm93IGhvdyB0byBzdXBwb3J0IEdQSU9zIHdpdGggYm90aCBlZGdlcyBi
dXQgZGlmZmVyZW50IA0KYmVoYXZpb3JzPyBGb3IgZXhhbXBsZSwgSSBoYXZlIGEgR1BJTyBuYW1l
ZCBPdmVyVGVtcCBhbmQgSSB3b3VsZCBsaWtlIHRvIA0Kc3VwcG9ydCBsaWtlIGJlbG93Og0KDQot
IE92ZXJUZW1wID0gMTogcG93ZXIgT0ZGIHRoZSBIb3N0IHRvIHByb3RlY3QgdGhlIGhhcmR3YXJl
LiBBbmQgbG9jayB0aGUgDQpwb3dlciBjb250cm9sLg0KDQotIE92ZXJUZW1wID0gMDogdW5sb2Nr
IHRoZSBwb3dlciBjb250cm9sLg0KDQpBbHRob3VnaCBwaG9zcGhvci1tdWx0aS1ncGlvLW1vbml0
b3Igc3VwcG9ydCBCT1RIIGF0dHJpYnV0ZSwgSSBoYXZlIG5vdCANCmZvdW5kIGFueSB3YXkgdG8g
Y2hlY2sgY3VycmVudCB2YWx1ZSBvZiBHUElPIHRvIGRvIHRoZSBhcHByb3ByaWF0ZSANCmJlaGF2
aW9yLiBJIGNhbid0IGFsc28gc3BlY2lmeSAyIGVudHJpZXMgaW4gDQpwaG9zcGhvci1tdWx0aS1n
cGlvLW1vbml0b3IuanNvbiB3aXRoIFJJU0lORyBhbmQgRkFMTElORyByZXNwZWN0aXZlbHkgYXMg
DQp0aGUgZmlyc3Qgb25lIHdpbGwgYmxvY2sgdGhlIEdQSU8gbGluZS4gU28sIHRvIHN1cHBvcnQg
dGhpcyBiZWhhdmlvciBJIA0KY2FuIGp1c3Qgc3BlY2lmeSB0aGUgR1BJTyBhcyBncGlvLWtleXMg
aW4gZGV2aWNlIHRyZWUgYW5kIHVzZSANCnBob3NwaG9yLWdwaW8tbW9uaXRvciB0byBzdXBwb3J0
IGRpZmZlcmVudCBlZGdlcywgd2l0aCBpcyBub3QgZXhwZWN0ZWQuDQoNCkl0IGlzIGhlbHBmdWwg
aWYgeW91IGhhdmUgYW55IGlkZWEgdG8gdXNlIHBob3NwaG9yLW11bHRpLWdwaW8tbW9uaXRvciB0
byANCnN1cHBvcnQgb3IgYW55IGlkZWEgb24gY2hhbmdpbmcgcGhvc3Bob3ItbXVsdGktZ3Bpby1t
b25pdG9yIHRvIHN1cHBvcnQgdGhpcy4NCg0KDQpUaGFua3MsDQoNClRoYW5nIFEuIE5ndXllbiAt
DQoNCg0K
