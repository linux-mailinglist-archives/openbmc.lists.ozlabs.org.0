Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9E33DF964
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 03:51:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfZTj13bkz3bn5
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 11:51:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=p0Lgmy6Q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.132.119;
 helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=troy_lee@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=p0Lgmy6Q; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320119.outbound.protection.outlook.com [40.107.132.119])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfZTK4ytxz2yWG
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 11:51:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJfB/vwEf2bLFe9doFla/j7LQRynPyX7mNUqLoqzJg+KRwUI2NrgNv/C/0y+0yrDTfSNZWwzRdVEMxHGAMvwN/+jn/23LObxl2QwosWI1y17ua3s3f9T4kA3947E7sqT06/7eeTJtnnrs4pxcESxgN9hfzUMDgZna26YS52QqSZFHDHriSYVpVDL8UjS5C7IvocLHE6qSxL22EGrEU1GN+yr3/V4ZYhgXvtI2NjbMH/6QUPyH/FsaIHfEpN2r/HCJNaHfvKb1iUuABYV/d3b3409bK32QPUX8fU72oTwNN3kmSZXxvcRUKIyk/v3mraPMjZJtb2Fg3uccn8UqQV+8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsfFS3nBdBJDagGAgSiSpUqcpUCrHt5Ym1qnNZUQoi4=;
 b=btzA9ndbmjWTPv4l/N52cKW1Mo574+JJ4Zg1MW3avy18Oh25rCsroF3N59LI9d0/7h0mKkcUjwW8waLfHbXPh8vXeDzXH88YFt85/McHzOCCGjZaGGCD/FhjDXD+yGtV+rHc2CJBzRpymOjk7oi8esWcArv/Go0tywUl/N41z7AXaPayC7tXEG8MECmNveNZuGN8u3nFGS7zTcTrN5KZohr2ufRdJe7vEyKfOwwF+IKgWV116uuVDj+cgQOEO2NI+5fwfvMuyh8RKDIZYC8aHQMOg3sJqiDBcJL6tdyvGOp2LmagD5dY997taziS7sFcurAAsIU7+qqQGnhN69VlgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsfFS3nBdBJDagGAgSiSpUqcpUCrHt5Ym1qnNZUQoi4=;
 b=p0Lgmy6Qq5DE9lCWcDrmjYxrMcfxaxPDGtL2WYWnzOPuQFVOKz1eXxXnwRkJNTsfi9Pp1D9FD9HSr9eUNbfYTKv9kio9xDmEd4yU9JmCFsU3QmoCvDiy1Yj1AnQlLXUQYHxH8csguFiNspkNHI864xrOsRblB0BwMHvWmGVvGAYu7CX8F9m3RuxgZiS1rHwXSnDV/l3qmdS3sYWwVYw9zvOtisLB8dyPIXS2CKzGkLWpJ+5GjLGezuYbE2B1dvYEArFDmoQLJc84E7U8HlidsmR1/vNNLgMrefq/YM7/fxTBYZVwWXDP1Ajzlbg6VOAhT0L4xrzZFCrdJzgGLw7UDA==
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com (2603:1096:203:4b::20)
 by HK0PR06MB2148.apcprd06.prod.outlook.com (2603:1096:203:47::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 01:50:40 +0000
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::70d5:73da:ac03:9781]) by HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::70d5:73da:ac03:9781%5]) with mapi id 15.20.4394.016; Wed, 4 Aug 2021
 01:50:39 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: i.kononenko <i.kononenko@yadro.com>, Konstantin Klubnichkin
 <kitsok@yandex-team.ru>
Subject: RE: Installing Windows Server 2019 from a remotely mounted ISO
Thread-Topic: Installing Windows Server 2019 from a remotely mounted ISO
Thread-Index: AQHXiGtK3vPDJyYWhEy2Lm3M4BUfvKthzOaAgAAYtYCAAAUxAIAAqZJQ
Date: Wed, 4 Aug 2021 01:50:39 +0000
Message-ID: <HK0PR06MB214515C746802AB15880B80F8AF19@HK0PR06MB2145.apcprd06.prod.outlook.com>
References: <60926e52-9d00-2b20-e8ac-7fd515ddac78@yadro.com>
 <CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com>
 <3c0b0dc3-a31d-dcfb-608b-53436074397b@linux.intel.com>
 <34751627996896@mail.yandex-team.ru>
 <df77021c-a86b-1a03-9960-acdf6c324600@yadro.com>
 <6631628004052@mail.yandex-team.ru>
 <4354431a-0db6-fb9f-bc21-5ef34eba8852@yadro.com>
In-Reply-To: <4354431a-0db6-fb9f-bc21-5ef34eba8852@yadro.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfe492c4-4caf-4fdc-e74e-08d956ea4322
x-ms-traffictypediagnostic: HK0PR06MB2148:
x-microsoft-antispam-prvs: <HK0PR06MB214804F41BF095805439A3528AF19@HK0PR06MB2148.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eJEVInfkzF6jGlk3bmANkO5LReUCNlm5k/1MummP7sy6PArdUI6YugGTXIkOu7Oegx5HSrL8W55hQ2RMrI6oSlfxPQimf3/zc7ou/kQ/r7x0yDh1XUdVsdBM6j+yoGhJzv2C5uynpZCkdq4bJlh6wWNpx6r87Xl8Ux8T5bmT2UdMRCb1Dpn5Hj5Z3/gys1IxC4BnhZK/fmV88byaRrlOZe/i2wqsVLfY2wDRlHr1Bg8SNdsyU42tjPnx7og7Y1P9ZaoeKFGLXbXv1x0sW3UDF0hTL+PDqpua/dzNftiRt1bG7g+wowvknaJd7fIgh3erV4LwrjNI1gmJJ/JVFXRHEMNGW/NQc5gOZat7Sif/YLv9ALNik7bDsOCC0CM+PepKSDkqGTGGHGOxFoEi2/DV3UUc3GgGXlVOST7fjC9zbZggS38fH5UejrRRjNedBDF9Ln+IlDgK+QhItxhGXhioO+K1A2ZX7LvaCNcKrP0vP0YWiXRbTeEYW3n97BLE2R7r4BdXsfFbWf/kKkpjyy14XOKWgZP2QSUVS5Rke2fl7ikLDRKI+letBQOPYiXTJtHrVUoOYpZkuxVqcA7OcGnnbqMlz4Tk4Emvd7/b8nERhF0aMI144fwxpKkhgZWHYzDuqbWFpWl9nS57xCaE3fUa3wJMWoPPAcJCVTz5iS9psqofx0xVaAg7Re4jnFMLyIrKEb7qc5S+Xbwvtzzq+A8Vl7TZOMEqECCr5G4D2F0Ql3VF/AiEAthRTZ4knYyYpmEJbPBPAMxO8zXgUBqPjcObJIWoFtrkZZH+qa52ugWsXKI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2145.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(396003)(136003)(366004)(39830400003)(83380400001)(5660300002)(8936002)(86362001)(33656002)(71200400001)(966005)(4744005)(53546011)(6506007)(186003)(26005)(7696005)(9686003)(508600001)(316002)(55016002)(110136005)(122000001)(66446008)(8676002)(38100700002)(76116006)(38070700005)(52536014)(4326008)(66946007)(2906002)(66556008)(64756008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUV1Y3F2RUNaeUJTY1paQitCMjBrS09MOGdKd2pzRnJmaERIZzQ5QnNySGVJ?=
 =?utf-8?B?TGNGMXp6bGVWb29xVU9XNlU5ZUoyNS9oa3dlK2tONzF2cnVaL2ZlOC9JNi85?=
 =?utf-8?B?VHJBN2c0QitWbXg3QmQwQTIzMUlBVFAwN0hSY1VBVUJYbXlteUMxMEtJQnp1?=
 =?utf-8?B?Y0xoc2xWV01rMXhiazhrMHgxZkRKdHowYk5HMFFxeGdHcXFxTHJIWVdPK2Jt?=
 =?utf-8?B?YWE5cTgzZ3RvZG13TDZjU0d5VEcweWFqcE9KSjluV2x6SVp0Z0d1eGdXS2JS?=
 =?utf-8?B?MHFqNzBKbVpiOG4ySWN1alJpWi8vTEl3WU80dFVkSThnamJzb2xDWDFyTmRN?=
 =?utf-8?B?MVR4amRDckFzRWUwS0lwQjZlK0preTZPMlhjWkRPSWtZa2FGMFZvK0lXdHFu?=
 =?utf-8?B?V3N4VXFBdjhiaS9LenFtNUptbEY3MitpYW5HWnM0NElnaXFCY0wzVjJpZ0o0?=
 =?utf-8?B?RnZLa0kwVGh5L2g2eUpyWDhFMVR2SFk2SElDeFdYQ0xhVkdmWG5rY0lMNmF1?=
 =?utf-8?B?RjhNZE04R0Vab2tjWGZGWXJvaGtYcHRqdVZ5elpvR0pXd3UrWnVCTzNzTnlR?=
 =?utf-8?B?ekgwMThXUC9XdTEvb3QxWEZmMzZudXNocDBHMXVUbDR3eHZQUGhmZjk4a0Vl?=
 =?utf-8?B?RTdHbk1Yak0zdGUrQ3I1MkVCK3Y2VDBJeTBIVTRVcTFCY0lLTGZOL0FNa2ZJ?=
 =?utf-8?B?K09BK3k0WmxMV0RzbnRFY3V2aG5rbUtvVTFWeWZrZGx6MUNPa2FCdjZyME42?=
 =?utf-8?B?cm5sN2lhelFpY0ovWFJOaitnQTRibnR6dTZ2b3VteFJBM0RNdDFiTk9GSzBj?=
 =?utf-8?B?MElWMVVFS2RjeUlGNS9HUXZPeFROamEwNGM2K082R04zZG91eHB4bHdLRXp6?=
 =?utf-8?B?Umh6V3psaEFxVWk4OXBQT2VtL3N1elJtRkF0Z2ptb1RKZUdqZG93dUdsYmN4?=
 =?utf-8?B?c2tuMk9VWVE4eWxuK3BIZkE1VGtadXkxQ2NZMGN5UGVVSFBUWHZoYVYxTXhp?=
 =?utf-8?B?bU91OGtneDBweCs5VjhNL0JIaTEzcEIrWFZCeEt6dm1RWm5DeERZaFNBRHNs?=
 =?utf-8?B?UnMrT29SdmdQTHZxaUNEbit1Ry9zQytyQ013WitpdHRibnE4QUNDTTZQaUpO?=
 =?utf-8?B?aDRoZEVld294VGRpK2ZKYXZIWlliZmlhQm9jVGxwanRwUTN5TjVyNmtpNUpi?=
 =?utf-8?B?bHZORk5taW1WM2JDMU5yUEFHQmN1NytLVGNCMXVXai8wKzE1aS93eFoxeFlI?=
 =?utf-8?B?V0oxajJDcFZNOEpjM0Z1RldoQnAzSWoxQzk2NmhSSnhod2U4b1dRek5xb252?=
 =?utf-8?B?bzBVaDNLRmRGcUdCT3NsVDNMUGNNbHZyL0pKeGM1U0dmYklQRkVkRGJPSTI2?=
 =?utf-8?B?NnlpUEpyeDZmaGgvQmMwTWNGOXdnVjNtVWlub3JPZ2QvWWh2Q0tHYjhqT0xz?=
 =?utf-8?B?NGNNZFJVdU1zMDZ3WXlUTWVhK2ZCUXRkTEttc2VPVEZJb3lJeTNYeE91d3Y2?=
 =?utf-8?B?SUY4RHhXWjE3dENnWEhHL3JhNUx4RGk4RlRUaURRMU43T0ZqckxIdnRqNldS?=
 =?utf-8?B?azh5UjFZUGVMcVQwZTRPNmRKKzRHbkNmSVpBTDA4MWpPQkZwTlk3TlRiTkJS?=
 =?utf-8?B?VXZ1Q2RFR3dYT0RuUTNvVVdNMVk0L0x0blFhYlZLS0FsckxOdklLTHJWeHBT?=
 =?utf-8?B?YUcrOGkxSTFJamFQM0loazFwbDcrcWRTQjFkNzArVjVyYzE4ZWZaUE5HSDlr?=
 =?utf-8?Q?JW7pYStvaDOsppizHihPr2+dbmLtC5XMBShAdGM?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2145.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe492c4-4caf-4fdc-e74e-08d956ea4322
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2021 01:50:39.5774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1dfJDVBTBzhQdJqjugcE2oBrSJ/3upEIJvtvu5kKtSmhf3+rJLSxBrL/s/qqVxpkU0ai2INh7dwnOFOiKwOgew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2148
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSWdvciwNCg0KQ3VycmVudGx5LCB0aGUgcmVtb3RlIHZpcnR1YWwgbWVkaWEgZW11bGF0ZSB0
aGUgZ2FkZ2V0IGRyaXZlciBhcyB1c2IgdGh1bWIgZHJpdmUgaW5zdGVhZCBvZiBjZC1yb20uDQpQ
bGVhc2UgaGF2ZSBhIGxvb2sgb24gbXkgcGF0Y2g6DQpodHRwczovL2dlcnJpdC5vcGVuYm1jLXBy
b2plY3QueHl6L2Mvb3BlbmJtYy9vcGVuYm1jLysvNDI5ODYNCg0KVGhhbmtzLA0KVHJveSBMZWUN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91
bmNlcyt0cm95X2xlZT1hc3BlZWR0ZWNoLmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYg
T2YgaS5rb25vbmVua28NClNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCAzLCAyMDIxIDExOjQwIFBNDQpU
bzogS29uc3RhbnRpbiBLbHVibmljaGtpbiA8a2l0c29rQHlhbmRleC10ZWFtLnJ1Pg0KQ2M6IG9w
ZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6IEluc3RhbGxpbmcgV2luZG93cyBT
ZXJ2ZXIgMjAxOSBmcm9tIGEgcmVtb3RlbHkgbW91bnRlZCBJU08NCg0KT24gMDMuMDguMjAyMSAx
ODoyMSwgS29uc3RhbnRpbiBLbHVibmljaGtpbiB3cm90ZToNCj4gV29ya3MgbGlrZSBhIGNoYXJt
IHdpdGggYWxsIElTTyBJIGhhZCBvbiBoYW5kcywgdGhhbmsgeW91IQ0KDQpLb25zdGFudGluLA0K
DQpQbGVhc2Ugbm90ZSwgSSBnb3QgZmVlZGJhY2sgZnJvbSBzb21lIGlzc3VlcyBhYm91dCB1c2lu
ZyBDREZTIGltYWdlcy4NCkkgd29yayB0byBzb2x2ZSB0aGUgaXNzdWUgb2YgdXNpbmcgc3VjaCBJ
U08gZm9ybWF0cy4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQoNCklnb3IgS29ub25lbmtvDQo=
