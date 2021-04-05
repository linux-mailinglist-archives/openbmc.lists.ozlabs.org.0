Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B88D3354341
	for <lists+openbmc@lfdr.de>; Mon,  5 Apr 2021 17:17:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDZ5q3hKKz30Cs
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 01:17:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=HGbdOn5W;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f400:fe5a::72f;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=HGbdOn5W; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::72f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDZ5Y3JcHz2yxl
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 01:17:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QOcRB1x/iVugNomW2K/7BUFzsomeOUrjbJOUfygmy0wYPXm2maP0siYy3RMYV7TJXrwOz0EHCWbWSLbILEA3uqz/iDGDRvz8IRXSAAHcm8OiaxKRkrd5w112CfxrbPQBdR+J0WYALB2YDHfPs4H0UxEZYGLLhRT6r9Im6JyZq1k42AkLR2q2vK/D2cRUZ8r3uDtBR5JLgdtouFd5/YmoNpkGx8sxYDW77t3/LJF/AeL496nI9/tdgeUhkwzCXUWv/QGtgOJfqiusxLjo4beeMTJI7GgItoKsAXxv/MXmqMbzpB0DDs2AylfLKxNgUCqJn4V69SKk+D0QT4VCDnZMzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9l/ZL3fAPORM2NkG7wnxnLmut4H2tSKsiCKV6ZIt4g=;
 b=R/tBWNokA8N6IZZW/Or3vFYC6F0QBS+J2eRPtqFRyleNuI5veMx/veKmBKiH9zrfNSaj8rCl/6MI/huhOr0xrD/AxqvYsusLRqBnDIleXh5MMSGreaWjHXPQLxpQWoro5HxLgSe8N0WnXGqghWrrx/IWeYRaLDn3448hyYedTrp2lixmhzS9R906bGHbyczvSPvUmgTXrRuUWsalG/TI3oZz1/UBxY31qEJ1hzHx/31cGK75gGRANGfEMch3XXpiYcOw231fQffoM8k4KSvqJKV4S/lgD8F6fvF16aLyhe7x40dKhgq//iLShiRacXmMV1Lk6tkNMmHA7mOkpeuXQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9l/ZL3fAPORM2NkG7wnxnLmut4H2tSKsiCKV6ZIt4g=;
 b=HGbdOn5W9wF4JPRiV8TGRVTXTE8wErsVDzreVUg4pyCPfm9z5YUfeYs5EfK54OsBjmvPV6gjsIbQsVAjWZ1ufc+41MlG993G92vmPfwF0vZNYL3ROs21qom9v90MpVaYQLvCdvsCCAhkkHIjLpFiFmvlBAKy77M4svtgftA5uCk=
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB5930.prod.exchangelabs.com (2603:10b6:5:1d8::33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32; Mon, 5 Apr 2021 15:17:10 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::fd97:f560:f2cf:d58d]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::fd97:f560:f2cf:d58d%5]) with mapi id 15.20.3999.032; Mon, 5 Apr 2021
 15:17:10 +0000
From: Thu Nguyen OS <thu@os.amperecomputing.com>
To: Matt Spinler <mspinler@linux.ibm.com>, Joseph Reynolds
 <jrey@linux.ibm.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: The common solution to support bind/unbind the hwmon driver base
 on the host state.
Thread-Topic: The common solution to support bind/unbind the hwmon driver base
 on the host state.
Thread-Index: AQHXJdOU6ZunssCJTkiHUAYwame9R6qeRj+AgAMNx4CABLrDAIAAeGaA
Date: Mon, 5 Apr 2021 15:17:10 +0000
Message-ID: <2E3157F2-E7D6-49B6-A015-A9DA00E6CD78@amperemail.onmicrosoft.com>
References: <7252DA19-35E9-4A14-A7DF-7BBC54A312C2@amperemail.onmicrosoft.com>
 <12cb9e34-d110-1575-0b39-296083bd6410@linux.ibm.com>
 <7843F2AF-30DE-4F78-B7C1-2BBDC99689B5@amperemail.onmicrosoft.com>
 <a988408c-64ad-35e6-eb12-2c2babf802c0@linux.ibm.com>
In-Reply-To: <a988408c-64ad-35e6-eb12-2c2babf802c0@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none
 header.from=os.amperecomputing.com;
x-originating-ip: [2402:800:6344:7949:70c3:a30c:c4:854d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3a16300-8e8b-4971-4aca-08d8f845e226
x-ms-traffictypediagnostic: DM6PR01MB5930:
x-microsoft-antispam-prvs: <DM6PR01MB5930DDA9825D77952AE8437C90779@DM6PR01MB5930.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CJCnSBeHUDt5rlgmGTRm2ImvcjagRGWX3XhxnxUj2E8IWUM9rM/MEXoZ5b+J45V7xo+RTbDDO+4Vj9WR9AZeX4gsPLtdahFMtC7MHVWZgwkX4BStUyf6E48P/7GKhFeciIlU8RCkQonGtVLuOdDofSPE7eXQCFVOku+XlccWL93TYMaChH5Zgtc3uT8zQe8kZGPjWkk9bA7khZWCrxBzMVu6prUyGAImZfeq5U1cdUdOO5uMqt5OpC0jYhaEShBG1vb703qDgigmdIw6ex2Z44YtRZpCNrzBf8rvvJH6yepJy0fRRvqHXsXnuGPNbRBQ0nBBFJSN0CxPDRiIY4mtg50TvoihVfbg1HUSV/2AvET8JC2JEuNch7WF4iOLfBcmkmRNGm2MFBT1TGA64KYP+uKtfxlhGQjYJYKS0/uNtLKrrWgYfeKP3fM/H3uKzBoVY6vM9Gm2eaUlu1OV8dxpMrVqS0Awuj+4QttfeUNeJJcUzQ0qCZ7unE7OqcgIleVieexnM8fqWK1zVqythw7MMeFZzBkNymr+mPKIPkl1BvSzR0pCi6EuPwWACn3OfujBCrvgxGL5vOX1zcBpWKUA0giBqqK3EICkd83RkpueIiHPTbHV2R1GTZl5bIyJP8yOpg9ueSuOaptDpp5tav4X3g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39840400004)(346002)(136003)(71200400001)(86362001)(33656002)(316002)(110136005)(478600001)(9686003)(6512007)(8936002)(6486002)(186003)(66946007)(8676002)(91956017)(2906002)(6506007)(5660300002)(66446008)(64756008)(66556008)(66476007)(76116006)(83380400001)(38100700001)(53546011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NjdYTERxQ0NKZ1pJU0Y1ZzRDaVFrSXplK2xvTmVpSWZITmhCOVpVU1hRSXUw?=
 =?utf-8?B?N2l1Rmh3Z1JocjlBZUJrUWE5c3Q4RjZzbGFORHVVV0tIU08rclVJWS9JaklQ?=
 =?utf-8?B?QkwwNXFJQlloaFRCSW5MWENkVitaQ29wcFIvT0psdnQxelFycXZGMmJ0ZG1C?=
 =?utf-8?B?WXpsWUYwRDIxelZGcW9BU1RjUFkrcmVDd3JkcDNkeVlNRi9pV3Zrem53N2Z6?=
 =?utf-8?B?emhxby83c25OZVRQWXA3ZHF4RTZPbkQrYkJiRUtPQTdYcStmaGJkNFRkY1B5?=
 =?utf-8?B?MXhzYjhrMTdVc1RKeGtiV3BIeHFkb0RmeWc1RUJXaGRDK09Md05Sd2hITU5Y?=
 =?utf-8?B?Vjkvd1hZZ29BTnNGd2FneURPZjMrclVPZStIMEVkNEl3OFFMTEtLZTlkY2JI?=
 =?utf-8?B?L0tpY1RaMHpNSmx3emFpYzJkUmxpellaR3g1Y1ErM3pRWTcwelcyeUJKN2ZS?=
 =?utf-8?B?Mmpjb0piM3dScTVNWDNlNHI2OW95Q0JLTXBHemMvT3BjQjRaSXFkalFGYldr?=
 =?utf-8?B?VmZmZjRLcHkrZ1pmSC9yV0hoV1lUKzZQVkVkQjBLTTg5d3huQ1o2UWVDbHNw?=
 =?utf-8?B?WkRrSjhvdlpTaEV2V1BML0kranNDOW9INmpCWnNmUldMY1JUSkVpVXEwaTJJ?=
 =?utf-8?B?cUJ3eVgwQzMwbURlVGFBSmxhZjJTMGNnODJJZFFqeitEamlLMExieDFUd2RU?=
 =?utf-8?B?R1hmTjU2L3FjZ0UwS2tCUEp4UmhkN0lmamFDUnlsMEp4dm9PS0phZlNQblJi?=
 =?utf-8?B?eXFScGZWelgvUkFSa3NKTUU1MTRoVTlaUGhZNHo2WjhGMFcyVEJ4MEllbzAy?=
 =?utf-8?B?WHdXYmJmUWM4ckJFY0FTUEVEZXlBMEpoMnJYdkRMVHFObjBoNmVkSmVRSGps?=
 =?utf-8?B?Y2NqVzFoRTQ2RnVFT0htaGI0aHhLMzE4NTdXWnJHVUFXbEoyQldhWHF3OGJy?=
 =?utf-8?B?ay91bXBIbWNwOUNIbUJaZ0hQUWhxbmhrd2RVQXlsa201SmFBQjFLODlKdGd1?=
 =?utf-8?B?UHhhUk9NNTJXRm9WdTViaE90cU4xUWlPMFNmSFBaZWNVbzRaWTd4WENQYVJV?=
 =?utf-8?B?clhFcEdiVkV0cFYydGFYVll3ZjI4d2JCYmdUSnN3ZUU1ampXZjFheVg2NjZx?=
 =?utf-8?B?em83VVFKRUZ3Wmg4M24veGJlcGtXNldqTjRxZTNvLzB4dnlJN2J0enlXV0NM?=
 =?utf-8?B?SllLZTU4S0NPWnRRaW5KMFJMb3VHTjNQbFpPT1N0UUhLS253V3RwRlVXSDMw?=
 =?utf-8?B?cDZCUzNaMElkVHNGdEpYa09QamR2Sno1M3UvMndkRXJ0TXhuNTdFMlRHSW13?=
 =?utf-8?B?R2VMOXNLNzRRaHpkR1FVYmlsekEyZjRlSkduNEk0SURxK2RpNVhEZVhWL1VI?=
 =?utf-8?B?T2djb0NSYkt0SlIzT3ZYOEFKTG5wdlZYY1Vrc2ZNME1GTzNwc1BJdFpKNzRl?=
 =?utf-8?B?Wm9MNDZtcTFXam1ORlJNODlhMDZYVUxCRCtFZE92ZjZwdWZLQllsQ3BHRmRQ?=
 =?utf-8?B?VWx6RjhzYzkxc2hZbC9DL1hCeXNFeGpaUi9QY0xIMytjaUNxQkZFenZNaEl2?=
 =?utf-8?B?bDUySFhUWVQ1cWJqY0x4MW9ZRmxXM1FkbldyK3pzbWZBRG96bDJUZ1pHT1pk?=
 =?utf-8?B?UmJCclV0c2pHbzB0RXBMNGx6WmtUcXRDcVJRWUNQMFhtR1dnQTMzL3NRNWZG?=
 =?utf-8?B?VVFzRlV3K1k5WGtIV3J4SGRzYUp6Uktoek5PYVJ2MFYvSEtOYXNXc2tFZTJM?=
 =?utf-8?B?WUJZNjBPWG5ueHBIb05EWm9FRmFtSEdoR3p6cTR0RDhUeU9tZ3l1eEtUYTFT?=
 =?utf-8?B?NlBkK1M5SlRrNkNpNitJeUF3cmxSQWhhd0VRQkxsNnlEOXhNcFZvUmUzQTBx?=
 =?utf-8?Q?gzxzCKBknSur/?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FEDBD80DA997349AE01DEE6248D6500@prod.exchangelabs.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a16300-8e8b-4971-4aca-08d8f845e226
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2021 15:17:10.2128 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dRzOBNmVo/1ckyVT+4TbLf+yPZUv3n36T0iBeAubj7g9SPjYXtX83H7fnfvbSObnVJLZDqepaYFwqbJXDax1xNQRwECS6ObgkEihddveuFs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5930
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

U3VyZSwgSSB3aWxsIHByZXBhcmUgdGhlIGNvZGUuDQoNCjEuIERvIHlvdSBzdWdnZXN0IHRoZSBu
YW1lIG9mIHJlcG8/IEkgdGhvdWdoIHdlIGNhbiB1c2UgcGhvc3Bob3ItZHJpdmVyLWJpbmRlci4N
CjIuIEJlbG93IGlzIGZvcm1hdCBvZiB0aGUgY29uZmlndXJhdGlvbiBmaWxlIHdoaWNoIEknbSB1
c2luZy4NCnsNCiAgICAgICAiaG9zdERyaXZlcnMiIDoNCiAgICAgICB7DQogICAgICAgICAgICAg
ICJiaW5kRGVsYXkiIDogMCwNCiAgICAgICAgICAgICAgInVuYmluZERlbGF5IiA6IDAsDQogICAg
ICAgICAgICAgICJkcml2ZXJzIiA6DQogICAgICAgICAgICAgIFsNCiAgICAgICAgICAgICAgICAg
ICAgIHsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAibmFtZSIgOiAiIiwNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAicGF0aCIgOiAiIg0KICAgICAgICAgICAgICAgICAgICAgfSwN
CiAgICAgICAgICAgICAgICAgICAgIHsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAibmFt
ZSIgOiAiIiwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAicGF0aCIgOiAiIg0KICAgICAg
ICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgICBdDQogICAgICAgfSwNCiAgICAgICAicG93
ZXJEcml2ZXJzIiA6DQogICAgICAgew0KICAgICAgICAgICAgICAiYmluZERlbGF5IiA6IDAsDQog
ICAgICAgICAgICAgICJ1bmJpbmREZWxheSIgOiAwLA0KICAgICAgICAgICAgICAiZHJpdmVycyIg
Og0KICAgICAgICAgICAgICBbDQogICAgICAgICAgICAgICAgICAgICB7DQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIm5hbWUiIDogIiIsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
InBhdGgiIDogIiINCiAgICAgICAgICAgICAgICAgICAgIH0sDQogICAgICAgICAgICAgICAgICAg
ICB7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgIm5hbWUiIDogIiIsDQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgInBhdGgiIDogIiINCiAgICAgICAgICAgICAgICAgICAgIH0NCiAg
ICAgICAgICAgICAgXQ0KICAgICAgICB9DQp9DQpXaGVyZToNCiogaG9zdERyaXZlcnM6IEpzb24g
ZW50cnkgdG8gZGVmaW5lIHRoZSBkcml2ZXJzIHdoaWNoIGJpbmQvdW5iaW5kIHdoZW4gdGhlIGhv
c3QgY2hhbmdlIHN0YXRlLg0KKiBiaW5kRGVsYXk6IFRoZSBkZWxheSB3aWxsIGJlIGFwcGxpZWQg
YmVmb3JlIHN0YXJ0IGJpbmRpbmcgdGhlIGRyaXZlcnMgaW4gdGhlIGxpc3QuDQoqIHVuYmluZERl
bGF5OiBUaGUgZGVsYXkgd2lsbCBiZSBhcHBsaWVkIGJlZm9yZSBzdGFydCB1bmJpbmRpbmcgdGhl
IGRyaXZlcnMgaW4gdGhlIGxpc3QuDQoqIGRyaXZlcnM6IERlZmluZSB0aGUgbGlzdCBvZiBkcml2
ZXJzIGluIG9uZSBkcml2ZXIgdHlwZS4NCiogbmFtZTogZGVmaW5lIGRyaXZlciBuYW1lLg0KKiBw
YXRoOiBpcyB0aGUgcGF0aCBvZiB0aGF0IGRyaXZlciB3aGljaCBoYXZlIGJpbmQgYW5kIHVuYmlu
ZCBiaW5hcnkuDQoNCiogcG93ZXJEcml2ZXJzOiBKc29uIGVudHJ5IHRvIGRlZmluZSB0aGUgZHJp
dmVycyB3aGljaCBiaW5kL3VuYmluZCB3aGVuIHRoZSBwb3dlciBjaGFuZ2Ugc3RhdGUuDQoNCkRv
IHlvdSB0aGluayB0aGUganNvbiBmb3JtYXQgaXMgb2s/DQoNClJlZ2FyZHMuDQpUaHUgTmd1eWVu
Lg0KDQrvu79PbiAwNS8wNC8yMDIxLCAyMjowNiwgIk1hdHQgU3BpbmxlciIgPG1zcGlubGVyQGxp
bnV4LmlibS5jb20+IHdyb3RlOg0KDQoNCg0KICAgIE9uIDQvMi8yMDIxIDI6NTIgQU0sIFRodSBO
Z3V5ZW4gT1Mgd3JvdGU6DQogICAgPiBJIHRob3VnaHQgdGhhdCBPcGVuQm1jIGNvbW11bml0eSBo
YXZlIHRvIGhhdmUgdGhlIHNvbHV0aW9uIGZvciB0aGlzLg0KICAgID4gSSBjYW4gcHJvcG9zZSBt
eSBzb2x1dGlvbiBidXQgSSBkb24ndCB0aGluayBpdCBpcyBjb21tb24gZW5vdWdoLg0KDQogICAg
SSBoYXZlbid0IHNlZW4gYW55IGNvZGUgdGhhdCBkb2VzIGEgYmluZC91bmJpbmQgb24gcG93ZXIg
b24sIHNvIEkgd291bGQgDQogICAgd2VsY29tZSB5b3VyIHNvbHV0aW9uIGJlaW5nIHVwc3RyZWFt
ZWQuICBXZSBwdXQgc2ltaWxhciBmdW5jdGlvbmFsaXR5IA0KICAgIGludG8gcGhvc3Bob3ItZ3Bp
by1wcmVzZW5jZSB0aGF0IGNhbiBiaW5kL3VuYmluZCBhcm91bmQgcHJlc2VuY2UgDQogICAgZGV0
ZWN0aW9uIHdoZXJlIHRoZSBkcml2ZXJzIGFyZSBhbHNvIGxpc3RlZCBpbiBhIGNvbmZpZyBmaWxl
Lg0KDQoNCiAgICA+DQogICAgPiBSZWdhcmRzLA0KICAgID4gVGh1IE5ndXllbi4NCiAgICA+DQog
ICAgPiBPbiAzMS8wMy8yMDIxLCAyMzoxNCwgIkpvc2VwaCBSZXlub2xkcyIgPGpyZXlAbGludXgu
aWJtLmNvbT4gd3JvdGU6DQogICAgPg0KICAgID4gICAgICBPbiAzLzMwLzIxIDk6MTQgUE0sIFRo
dSBOZ3V5ZW4gT1Mgd3JvdGU6DQogICAgPiAgICAgID4gSGkgQWxsLCBDdXJyZW50bHksIEluIE10
amFkZSBwbGF0Zm9ybSBvZiBBbXBlcmUsIHdlIGhhdmUgU01Qcm8gbWRmDQogICAgPiAgICAgID4g
ZHJpdmVycyAoU01Qcm8gaHdtb24sIFNNUHJvIGVycm1vbiwgU01Qcm8gbWlzYyBkcml2ZXIpLiBU
aGUgZHJpdmVycw0KICAgID4gICAgICA+IHdpbGwgYmUgbG9hZGVkIGJ5IGtlcm5lbCB3aGVuIHRo
ZSBCTUMgYm9vdCB1cC4gQnV0IHRoZXkgYXJlIG9ubHkNCiAgICA+ICAgICAgPiBiaW5kZWQgd2hl
biB0aGUgaG9zdCBpcyBhbHJlYWR5IE9uLiDigI0g4oCNIOKAjSDigI0NCiAgICA+ICAgICAgPg0K
ICAgID4gICAgICA+IEhpIEFsbCwNCiAgICA+ICAgICAgPg0KICAgID4gICAgICA+IEN1cnJlbnRs
eSwgSW4gTXRqYWRlIHBsYXRmb3JtIG9mIEFtcGVyZSwgd2UgaGF2ZSBTTVBybyBtZGYgZHJpdmVy
cw0KICAgID4gICAgICA+IChTTVBybyBod21vbiwgU01Qcm8gZXJybW9uLCBTTVBybyBtaXNjIGRy
aXZlcikuDQogICAgPiAgICAgID4NCiAgICA+ICAgICAgPiBUaGUgZHJpdmVycyB3aWxsIGJlIGxv
YWRlZCBieSBrZXJuZWwgd2hlbiB0aGUgQk1DIGJvb3QgdXAuIEJ1dCB0aGV5DQogICAgPiAgICAg
ID4gYXJlIG9ubHkgYmluZGVkIHdoZW4gdGhlIGhvc3QgaXMgYWxyZWFkeSBPbi4NCiAgICA+ICAg
ICAgPg0KICAgID4gICAgICA+IFRoZXkgYXJlIGFsc28gdW5iaW5kZWQgd2hlbiB0aGUgaG9zdCBp
cyBPZmYuDQogICAgPiAgICAgID4NCiAgICA+ICAgICAgPiBUbyBzdXBwb3J0IGJpbmRpbmcvdW5i
aW5kaW5nIHRoZSBTTVBybyBkcml2ZXNyLCB3ZSBoYXZlIG9uZSBzZXJ2aWNlDQogICAgPiAgICAg
ID4gbmFtZSBkcml2ZXItYmluZGVyLg0KICAgID4gICAgICA+DQogICAgPiAgICAgID4gIDEuIFdo
ZW4gdGhlIERidXMgcHJvcGVydHkgQ3VycmVudEhvc3RTdGF0ZSBvZiBzZXJ2aWNlDQogICAgPiAg
ICAgID4gICAgIHh5ei5vcGVuYm1jX3Byb2plY3QuU3RhdGUuSG9zdCBjaGFuZ2VzIHRvIOKAnG5v
dCBPZmbigJ0sIHdlIHdpbGwgYmluZA0KICAgID4gICAgICA+ICAgICB0aGUgZHJpdmVycy4NCiAg
ICA+ICAgICAgPiAgMi4gV2hlbiB0aGUgRGJ1cyBwcm9wZXJ0eSBSZXF1ZXN0ZWRIb3N0VHJhbnNp
dGlvbiBvZiBzZXJ2aWNlDQogICAgPiAgICAgID4gICAgIHh5ei5vcGVuYm1jX3Byb2plY3QuU3Rh
dGUuSG9zdCBPUiBEYnVzIHByb3BlcnR5DQogICAgPiAgICAgID4gICAgIFJlcXVlc3RlZFBvd2Vy
VHJhbnNpdGlvbiBvZiB4eXoub3BlbmJtY19wcm9qZWN0LlN0YXRlLkNoYXNzaXMNCiAgICA+ICAg
ICAgPg0KICAgID4gICAgICA+IGNoYW5nZSB0byBPZmYsIHdlIHdpbGwgdW5iaW5kIHRoZSBkcml2
ZXJzLg0KICAgID4gICAgICA+DQogICAgPiAgICAgID4gVGhlIGRyaXZlci1iaW5kZXIgaXMgd29y
a2luZyBhcyBleHBlY3RlZCwgaXQgaGF2ZSB0aGUgY29uZmlndXJhdGlvbg0KICAgID4gICAgICA+
IGZpbGUgdG8gY29uZmlndXJlIHdoaWNoIGRyaXZlcnMgd2lsbCBiZSBiaW5kZWQvdW5iaW5kZWQu
DQogICAgPiAgICAgID4NCiAgICA+ICAgICAgPiBCdXQgdGhhdCBpcyBvdXIgc29sdXRpb24uDQog
ICAgPiAgICAgID4NCiAgICA+ICAgICAgPiBEbyB3ZSBoYXZlIGFueSBjb21tb24gc29sdXRpb24g
dG8gZG8gdGhhdCBqb2I/DQogICAgPiAgICAgID4NCiAgICA+DQogICAgPiAgICAgIFRodSwNCiAg
ICA+DQogICAgPiAgICAgIEkgZG9uJ3QgaGF2ZSBhIHNvbHV0aW9uLiAgQnV0IEkgZG8gd2FudCB0
byBiZSBhYmxlIHRvIGJpbmQgYW5kIHVuYmluZA0KICAgID4gICAgICBkcml2ZXJzIGZvciB0aGUg
Qk1DLWF0dGFjaGVkIFVTQiBwb3J0cyAoYXMgdGhlIHVuZGVybHlpbmcgbWVjaGFuaXNtIHdoZW4N
CiAgICA+ICAgICAgdGhlIEJNQyBhZG1pbiBkaXNhYmxlcyB0aGUgcG9ydHMpLCBzbyBJIHRoaW5r
IGl0IHdvdWxkIGJlIGdvb2QgdG8gaGF2ZSBhDQogICAgPiAgICAgIGNvbW1vbiBzb2x1dGlvbiBv
ciB1bmRlcnN0YW5kIHRoZSBiZXN0IHByYWN0aWNlcy4NCiAgICA+DQogICAgPiAgICAgIEpvc2Vw
aA0KICAgID4NCiAgICA+ICAgICAgPiBSZWdhcmRzLg0KICAgID4gICAgICA+DQogICAgPiAgICAg
ID4gVGh1IE5ndXllbi4NCiAgICA+ICAgICAgPg0KICAgID4NCiAgICA+DQoNCg0K
