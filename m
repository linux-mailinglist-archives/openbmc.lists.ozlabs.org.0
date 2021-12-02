Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CA3466045
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 10:23:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4Vql4y9jz2yw9
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 20:23:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=lk+laGX6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:febc::711;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=lk+laGX6; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0711.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::711])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4VqK01wzz2yMV
 for <openbmc@lists.ozlabs.org>; Thu,  2 Dec 2021 20:22:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqy4ki+9FDlS3+yZKtfAFZ5VA4gsa7Q2O1j3A/7kIYJllpQ+8KaQzl6AInZVSQc0VzycvhjC8xN6VmG9sGwK2qks2Fjd+Z8guZ0qSCP4h3bW3ss1PgFMUo88kpUVdea+ANNjtapQZwL+i31GXcfrqKfjHf6+/dXC3/tdwwLyMdA+BQhV00VBirbJAmiBOgvbZ3r2cVWvhqyFrxqiO76Kx9e/FekDcQxJbAERonnwdgszuvgeZi7keOjCVQOHHfVaez4s6uMEL8mZ2D9rris2HG32NbVgb07rLM62gsz95HqWiCyoOn+h/i5KRsXBrOjcONF/8lAJUIEd2a4Vzysx0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfyTQuGCcP+7BW/9TTRpQqXsmUMbyZme6jV2Q3N3+1g=;
 b=ANK5Gcj+vzpy4axYiQZK99F/K21chRggYVi2LrJXbFocvqn+QdjkEcaaO+leGgIyACv0MZ+gRy7a341v4fKDMY0pdHF8VoINIzqf8+vvmBwzKLnkonHG65r3QPAG8hrhtCXrbPJL8D4HdHSTSYPZk4TQH/RxZfqKZ+oXXsvShZXqIL1VKQiVkEas3RS3J6DTFbvpGoEf8KqdMmIaoxgacPLJk977N2/upMLDiLgQLfcUjnkXO6Zx9fBQvYCqZhm+yaDA8XrwHoGJ9ZU7cGz9P5kmzHgJALEt4eK0pDkCNVXY5oroNlMFhL9qKi5XmKi1OrtnXhkjQvJNOiCuY8e2uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfyTQuGCcP+7BW/9TTRpQqXsmUMbyZme6jV2Q3N3+1g=;
 b=lk+laGX6ZYRL3mbhuEIPPJeOJdPya1/5IrB02ClecvaJRwhb4sII6vx9ypElD4m9wmQqE9EnXS62t/QGIIWLB2NuOi+Ne9XrWXG4kimtWSYkeAI0gysXI5JtnMDMBxUuDXCvDK6lE+Q8kTcxNLHTDYlOpK+78FWaSHqE7FXtpmE=
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com (2603:1096:203:8f::22)
 by HK0PR04MB2499.apcprd04.prod.outlook.com (2603:1096:203:47::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Thu, 2 Dec
 2021 09:22:29 +0000
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::d4e:4ad3:ca0e:c44c]) by HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::d4e:4ad3:ca0e:c44c%7]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 09:22:28 +0000
From: =?utf-8?B?U3BlbmNlciBLdSAo5Y+k5LiW55GcKQ==?= <Spencer.Ku@quantatw.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: Implement Ethernet Interface Properties
Thread-Topic: Implement Ethernet Interface Properties
Thread-Index: AdfmmeLt8bsv+QLKRK2scPouEluJvQAa92AAABTOckA=
Date: Thu, 2 Dec 2021 09:22:28 +0000
Message-ID: <HK0PR04MB3299E65747A9CBE6A3A3871BE4699@HK0PR04MB3299.apcprd04.prod.outlook.com>
References: <HK0PR04MB329947E4E37431B956A8D17AE4689@HK0PR04MB3299.apcprd04.prod.outlook.com>
 <Yaf8EOu4qSY10q87@heinlein>
In-Reply-To: <Yaf8EOu4qSY10q87@heinlein>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac98c5f0-0de8-4b8e-b23a-08d9b57542fb
x-ms-traffictypediagnostic: HK0PR04MB2499:
x-microsoft-antispam-prvs: <HK0PR04MB24991DE5F8AB768AB6334CF4E4699@HK0PR04MB2499.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kGNJwA24mtVjH8MQzhq21V2guF8OZvNuprwDOvNPfJVTzJBJ5LcfvY+yJ0Ho/HtI9lsPL0/kiMQpXs4t5k8Dnd0mX//f1Aoz2+DAxwBjLPVXgnCftUdJYwf/nxXlZe294/oN9FpsJoycMJCPfhwVr2qBnDiSKq6FAsAxeO1fefmnw2WYBKneS1l2EgVFPCvFFS+yjNyN20scciuwHCGeISp5ZwNhok3DXbuquHH4OzTWCr8zRs+hz4N5sLDq9EfgVoxz5zCqRL7Sj2WWd4koMvFlQBTDpnDJQ7gXYd7DPp91RU2ehRz3V6mS8KW/yrrTxlBqoypBw+NWbvvUC9+k51qbxCx5aq/2bGgA72TrExQVnT7KsBpiCScaGdzCrrmnuhJcnz2B9k4aizWKVUApjG3d8HRjYQ4i9vLHDYusBx/H00m88oQwLOwbhdfBCrLzRLJrQcDn3mzFkTYBiTqZ/fAFuB0VwKTY2UC4GEV4Uqtlj2/vVAbX5Mll1JAFtmL4Rrnh5lasSWxLaceriu+hHpN0kUKnAcLMSgveck4/tXZlECzk7QCJpAPtMwjma4YCO1Uc9PYcWD17aMzGmfIhyWHT8z8lyhyndiyZ2xNyBlIWN6vk1niX8t698usaRlTjlQdVjiqxwfISQleIpQGgtgTkknlWCSkpOzW5nY2YLb2FR4ItH72NdmG5f5cTbMLqmvH/2vocy48WTwQLVy7E2Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3299.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(71200400001)(3480700007)(9686003)(7696005)(66476007)(38100700002)(54906003)(38070700005)(52536014)(186003)(66946007)(66556008)(64756008)(316002)(66446008)(76116006)(6916009)(86362001)(8936002)(33656002)(508600001)(6506007)(26005)(122000001)(5660300002)(4326008)(55016003)(85182001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cnJkZWMxSyt2S3BodHB5OHRoSWNaRjFEcTBxbmxDbTNQWE4zTEE3cFU3K2Fh?=
 =?utf-8?B?VGpKeTlNYW9HYmEwWndoa1d5enpnV0xnMDBrMXBiTlZDUmN3Y0tsZldnR2pI?=
 =?utf-8?B?eVBZMmlMcDAzcVRYV3RiN2Y2aGlLRGo4NVNmN3E3QXNlWHRrL09VTTdjV1h5?=
 =?utf-8?B?TnAvR0lUbXhzSDRxa1VFaVYwNm0wT294TE80R3hrY1dmM0k2Nkhpend3NjhX?=
 =?utf-8?B?MXoyVThjcGVueXo1Tlh1dnN0SFBSYTZjMFFTeUJCbkNiRE0zb1MzeWl5cjA3?=
 =?utf-8?B?blJmYkdUNjloeXlLbWl2U0RBVFl4eHd3dTJJY051Q1JjeGgvWUdpaTU3dDhM?=
 =?utf-8?B?TzZRT1JETzVsT0dYSHprS0s3bkJKUUNrQjUwMXdJZkNjNXFJYnVKUTBrdDFT?=
 =?utf-8?B?RUFWVW40dGlvUGRPdjNHL0dDbyszUFlnbFgwNnlSdGtOV283c3Zrc29LNlJw?=
 =?utf-8?B?ZUhPWVpmN2hzSDduMWZUTWJSN2xxT0c2VGF3TDI2eE5pNTlUakg0QmxUU2xE?=
 =?utf-8?B?dHhoLzlyVkhPZlVoOXpjSVNDdnJCa252N0FYNGVvQWIrRG1HUlpuWk9lbi9C?=
 =?utf-8?B?ZEYxZnp5dzZHeW9UNkdaZXhyTFpvb2NaRVhKeWhheko4TjJtakt6SVRXdlBJ?=
 =?utf-8?B?T3JzK1U4eEIweGJjemxKNXpDZVBPZTRFR2ZiVlNNdnlQTUtYWnU5OG1SOVV6?=
 =?utf-8?B?ek1ZNzk2NVMzcVh3UzFNeHZZazhXL0xlamxnakE5dkc5a2RCL3hSUC84R1Ex?=
 =?utf-8?B?eGtkMExyV3VDYTlWZkNqam50TFloN1dnSlVrNjI4cUZIeEU0cldsZHE5Rmhk?=
 =?utf-8?B?eXFVUC9NdzZJS3JiRmRIbmdLZHdDQld2cjVQdUZxblBTT3dsNStUeU95RDZu?=
 =?utf-8?B?Z1AyV2NWUkhvdmdZTitvTXUvRGRSc0ZaZ2M2ZWdxeVNxdWcxOVNvRUFYRkQr?=
 =?utf-8?B?SkllWUJIZERKYkRFSExMT1lsd052Q3RDZ2dtcElDSEFvT00reXd4TWJVQldG?=
 =?utf-8?B?eEdQcHB1OVJ1SlhSV3RzcHJuUWJ2Y3Z3enBzZ3dDZGFHRDN6c0tYR2F1elhN?=
 =?utf-8?B?cDZTT3E5LzZaYU9IU2FXRitKSW1hMFdXbnlWMU5UZDByZ1N4MEVaTmZEQXBQ?=
 =?utf-8?B?TXVkTC9VMC92K3NUWm9oS29xNHJaRENYeUhFa2ZVZGRnL29iOUhiTUZDYjlO?=
 =?utf-8?B?VkdvVUhCZjFPc3dFRm5LTzRWVm9RbHNjWVA5aFNrbDFBODE1OEVkUlBGQkFK?=
 =?utf-8?B?M203NkZraVhlV2J1TVVaMTJlNXFoUC9Wd0V4ZmxJc3h4T0dNb0xYWkp1QXgw?=
 =?utf-8?B?NkNob1VJaytKdUF1eFlUbEZkYzkyQjJVcUZISHBFOW0ybko4N2xWdHB3VnJn?=
 =?utf-8?B?TlgzbHdXR2VrWURCRGJUQ3RqcWNiQVpUZXZWZkcvQkF3bWhxSVNxVjlsSmZJ?=
 =?utf-8?B?SjU4Mm1GY2xqd080N1hWbUNjOWxUVnoyeGoxbTRBdVRvNlkzYWtvRlFpcjhr?=
 =?utf-8?B?OUEyTUFVSzJ2YWNobXVIaFdtUW1EckNwR3E0dkJqQjVTS2diQmY1V1loYTkr?=
 =?utf-8?B?dERkZmhqWWNxYktjWlV1ZGVuQXFBeVlUNVlLeG9wSkM5c1d3U2cyWVAyMEcv?=
 =?utf-8?B?NjRockcwZ0d6Ukl2WUc3a3lHQ25VdVRNQ3lMUlpjL0hBejlJY0Z5Q0FuTTVs?=
 =?utf-8?B?cFljYmpoQ0cyMldIbjdyUGhOT0p3d3p1TG1HVE1VRnRqbzZNcGZpbFVqKytB?=
 =?utf-8?B?OEpkZU5hTVhpMHZvMFZLOEtxYzFYRW05VTdoMlRSV2FoNmgxaWdjQmRnalRN?=
 =?utf-8?B?YnJndW5oQ2l0dERreGtTeVJUQnhGNTlJWGIrV0w4U05La2EyeXNXdjR3Vjda?=
 =?utf-8?B?dEpGQzh3TkxSWHJTc2taWUZpZEsycW1XWWRBSkdzRnNnMU5nMGdSMWkvUlRK?=
 =?utf-8?B?S0hOS2gvcWJuK05UMHBLTTBQZmc1U2NXdENVcVlGTWE5S1daQUJEaDQrbEtR?=
 =?utf-8?B?eEQ4NnR6bjZrMThpNjNvQ2Nwd2M5dDhaWEw0TFpTREdOMmFZandRemE0b0Nn?=
 =?utf-8?B?OVgzVW1sUmJqSkNDWmZHckYzV1FEL3VZZGcyNW5JaVZJcEFCRjVWcnBYVDRk?=
 =?utf-8?B?L21HVUN6bWpQQ3JKRzlHcWlyTk9ORGFXUCt6c29OeElyYmt3YlU0WUJESkFP?=
 =?utf-8?Q?/Xx+5YH2Wqm9ewL6JEXuv7M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3299.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac98c5f0-0de8-4b8e-b23a-08d9b57542fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2021 09:22:28.7509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7v5ZaiG/YRImN65UWqDf2fy87TmNASPXvhh4vi5v1pJ0nvtEe5nMQc/3p4PrRm1RkSqr1Cn9ZZGdtuiN5thAEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2499
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?utf-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 =?utf-8?B?TGl0enVuZyBDaGVuICjpmbPliKnnkK4p?= <Litzung.Chen@quantatw.com>,
 Nan Zhou <nanzhou@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBPbiBXZWQsIERlYyAwMSwgMjAyMSBhdCAwOTo1ODo0MUFNICswMDAwLCBTcGVuY2VyIEt1ICjl
j6TkuJbnkZwpIHdyb3RlOg0KPiANCj4gPiBGb3IgcGhvc3Bob3ItbmV0d29yayBwYXJ0LCB3ZSBw
cm9wb3NlIHRvIHVzZSBleGlzdGluZyB0b29sIGxpa2UgaXBlcnQgdG8gZ2V0DQo+IHRoZSBFdGhl
cm5ldCBCVy9Ecm9wIHBhY2thZ2UgcmF0ZS4gT3IgdGhlIG90aGVyIG1ldGhvZCBpcyB0aGF0IHJl
YWQgVFgvUlgNCj4gZnJvbSBldGhlcm5ldCBkcml2ZXIgKC9zeXMvY2xhc3MvbmV0L3tFdGhlcm5l
dF9OYW1lfSksIHRoZW4gY2FsY3VsYXRlIHRoZQ0KPiBCVy9Ecm9wIHBhY2thZ2UgcmF0ZS4gQWZ0
ZXIgdGhhdCwgd2Ugd2lsbCBuZWVkIHRvIHJlZ2lzdGVyIHRoZSBELUJ1cyBpbnRlcmZhY2UNCj4g
YW5kIHN5bmMgdGhlIHByb3BlcnR5IGluZm8gdG8gdGhhdCBELUJ1cy4NCj4gDQo+IElzIHRoaXMg
c29tZXRoaW5nIHRoYXQgc3lzdGVtZC1uZXR3b3JrZCBtaWdodCBiZSBpbnRlcmVzdGVkIGluIGV4
cG9zaW5nPw0KPiBXZSBzaG91bGQgYXNrIHRoaXMgcXVlc3Rpb24gdXBzdHJlYW0gdGhlcmUgdG8g
c2VlIGlmIHRoZXkgd291bGQgYmUgaW50ZXJlc3RlZA0KPiBpbiB0aGUgY29udHJpYnV0aW9uLg0K
DQpUaGF0IHdpbGwgYmUgZ29vZCBpZiBzeXN0ZW1kLW5ldHdvcmtkIGNhbiBleHBvc2UgdGhvc2Ug
aW5mb3JtYXRpb24uIEkgd2lsbCB0cnkgdG8gY29udGFjdCB0aGVtIGFza2luZyBhYm91dCB0aGlz
IHF1ZXN0aW9uLg0KDQo+IA0KPiBJJ2QgcHJlZmVyIHVzaW5nIHRoZSBzeXNmcyBpbnRlcmZhY2Ug
ZGlyZWN0aW9uIHJhdGhlciB0aGFuIHdyYXBwaW5nIGEgdG9vbCBpbg0KPiBgc3lzdGVtKClgIGNh
bGxzLg0KPiANCj4gRGlkIHlvdSBtZWFuICdpcGVyZic/ICBIb3cgZG8geW91IGdldCB0aGUgZHJv
cCByYXRlIGZyb20gdGhhdD8gIERvbid0IHlvdQ0KPiBuZWVkIGFub3RoZXIgc3lzdGVtIHRvIGFj
dCBhcyB0aGUgb3RoZXIgc2lkZSBvZiBpcGVyZj8NCg0KSXQgc2hvdWxkIGJlICJpcGVyZiIgaGVy
ZS4gWWVzLCBpcGVyZiBuZWVkIGEgY2xpZW50IHRvIGFjdCwgc28gaXQgbWF5IG5vdCBiZSBzdWl0
YWJsZSBpbiB0aGlzIGltcGxlbWVudGF0aW9uLg0KSSB3aWxsIGZvY3VzIG9uIHRoZSBtZXRob2Qg
b2Ygc3lzZnMgaW50ZXJmYWNlIGRpcmVjdGlvbi4gU29ycnkgZm9yIHRoZSBjb25mdXNpb24gYW5k
IHR5cG8uDQoNCj4gDQo+IC0tDQo+IFBhdHJpY2sgV2lsbGlhbXMNCg==
