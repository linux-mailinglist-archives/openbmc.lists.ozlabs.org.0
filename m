Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 916B9533512
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 03:57:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7Dhb3ZX0z301F
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 11:57:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=bQPL2nHi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:feae::708;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=chin-ting_kuo@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=bQPL2nHi; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::708])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7Dh369tKz2ypf
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 11:56:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hd+zF27+lt7A62X3XAiG9DAQeEiXMx/m3fg+Cllo84Oe1M6ofDk2N4t1XbqDofuDX7MvRXSVxr/qBpowLYm4wG/YNB7D5BovxmX0wS60moXr5MqRRgKpDafyK0INP8Na4kIrF4uJTFpMjq1y0GyJK2lJYcUmq8IzmKLvSctbsEaFCnXESGsIDtjUfy7qLhtJedL6E8yGsxwlDC7a2eNSQw0JX521sQcT3beD8UfkAGT/bSXYPBmh47fsvgNJzil3b8ipKXULhivZaVBfOHqcEk/b7VWVChP/p5J2Sm5P8jRUUgwhyqYzGAf+SCwV2zY/uUhYKVDDJ5UuxxNSUij08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qVRbCl6QKg1qwodTQIRZmtWPchX0+Ct1D1mjgYXud6c=;
 b=MbsObmOqPXM9mKZwZh+jGhW+dVuldBUkWrZFfYVK0410wdjTmgWAitbu/XdbBUmywU3rH7+CDTvXWJ2oocIUthkriVlcNlc/KYPAzEcwgLdz35X6BaWod00WMZSmR5xLrLr76mnHZR/c+0fRaQUPMxzaI0v7m6asjEIJc45P01UxHeFjjW4v6vKit6ume/iO5RO/uVzF9+Vbn5wlOXVNCas5cgBur1MhL7XN+DymPRin1I7gHEyJLsfa0b3LkcRrocUormZTq+TVr9qb4nwA7ZOimAgHaKX+bkWnJv76LEn6SUYpAV24v9cVx1D/H9UsQaIiCkEAJPlzUhOxUlfAWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qVRbCl6QKg1qwodTQIRZmtWPchX0+Ct1D1mjgYXud6c=;
 b=bQPL2nHiqNvSS9bc4P+3E8GQDdkqKWYlMDQNA7n5BMxsmW/jWQINz7isB73k0AMelS8KELMfINrKXA90PggRckzETTOKR6tLnyKU2M08dJT2d4O3UTof5q8bt6ijdxue/xs7EOTyT9V5u5BHsGTKQIp3Cvb1TQS/rDj7ctjLN3it2O/eSUOUgbQUr9whdbNbpl611Dpg+hqwDgO0kmV9n5+cy93iv3inGiA4O36CxpSM4L9CeMUc6gJlZEOys8+4gjkP9Kg1yfoUMtYXffRnn16tK8kkdnY6OPQfkE5GWQbJClybQRSqn2oo5Wog6cbLznowKEzXkTpu++D5B/K0og==
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com (2603:1096:203:5b::22)
 by SEYPR06MB5229.apcprd06.prod.outlook.com (2603:1096:101:88::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 01:56:07 +0000
Received: from HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::f9f9:f489:466b:94f4]) by HK0PR06MB2786.apcprd06.prod.outlook.com
 ([fe80::f9f9:f489:466b:94f4%3]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 01:56:06 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: RE: eMMC ABR behavior
Thread-Topic: eMMC ABR behavior
Thread-Index: AQHYb9GjeaV+IXGiw02jRpfU7xR+x60u1ZCw
Date: Wed, 25 May 2022 01:56:06 +0000
Message-ID: <HK0PR06MB278680EEC62F6223218A8B74B2D69@HK0PR06MB2786.apcprd06.prod.outlook.com>
References: <CACPK8Xe2131fjX-uidz9bBo3Luy789Twjpz9pMiCnu-=f01Hig@mail.gmail.com>
In-Reply-To: <CACPK8Xe2131fjX-uidz9bBo3Luy789Twjpz9pMiCnu-=f01Hig@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 305984d3-08a8-4745-ab3a-08da3df1bb73
x-ms-traffictypediagnostic: SEYPR06MB5229:EE_
x-microsoft-antispam-prvs: <SEYPR06MB522975D9DFB2F2CBA68644A4B2D69@SEYPR06MB5229.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KxIkJDpp45b5eT72wCxYBjKf7DxWrobFAM+o56oFJ5SZTRVH73d00+fhF5DwKi8HTOwpuTPcRzWl+1fkfHejFbll+3jyr0GS3wGlKaPdiPB0LentyBsMsCfprR1biRFHuhAi5SHPASFYzHUMWjE2RLLkrT5bYjOpzOul5NwL7H1FvzPUi5ZT+0DbcrQ8yFDj43asjOLYUjA01iqYx4s0ax2AkF2ngwSK9TKMKiSW2OnN80ckKoHjLLqfkwiI6iX2+43u8V2OoN2Sm3gwoFRZprSOxWp6TNJRhsco2eql49gwTZ10LSjSRPPTPDE9W2o/kn//22nJ1h8tNJuQ7lgPEhH2filg7zE7dn0xK71fPSzrD5nzm9UW/ORE6Qd27EaQ7Jee2uUsLnbPNNY3j/CXoVu0yu+h76Y1WKv783CccoCD9eF2XDaF4v2FZgunqChqMMYyY/QZbAeh3b8hGb4eAvGXeFnuJ0A3C0M+48/0BRcfcPze9sgqTrsvIfPAxDJHVXqx0smSrJctxKAty5oxUgvtfM5pUWhvIgq/C3D4lTUrQKfVCKtlaQ8VQlVtrFOXV1iritYP1KFWp2RE4LrPwCSj4rqmZ0qqsQP+f1PdOxJNJ1F/773Wgq/Ja0hy/Zs2608hPjAt7gBzdfvn4Hv87YdkaF2O8W88KEFtF4+sDs9oH+Vnui2d23j5cy7NgExp/Pm9SNWsyIoN0WgexS1J5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2786.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(54906003)(508600001)(186003)(53546011)(6636002)(3480700007)(110136005)(7696005)(26005)(6506007)(71200400001)(9686003)(55016003)(83380400001)(33656002)(38100700002)(107886003)(122000001)(2906002)(38070700005)(66446008)(66476007)(76116006)(66556008)(66946007)(64756008)(8676002)(7116003)(52536014)(86362001)(8936002)(5660300002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3A2Yng4Y0VOQ0JaTlIyZjJLNUdiZkx0cHpvQUJyZjYyWTZ4UWNuUDRTWmM0?=
 =?utf-8?B?MlpjS2F4ZitHYk9RcS9waXZoWVdzNThJT2JDeExNQXZyeHNCcW90amYxMTdM?=
 =?utf-8?B?STgvZDI0cXRSZy9hSDUwd3NNbU9ML0IweXl4ZXE2VG9vTGxuTTFmRFlvR2NO?=
 =?utf-8?B?K0NXVzVxM1BRS0M5ZDlLVWthYnI2QkFpamNwbXBySE8zSVJJT0t6YWQrZ012?=
 =?utf-8?B?M2NPM1JxYkttNmNwZGExWThabEp3dzhiQkpOMlVPR0FvSmwwclJ5ZEt5b0Zw?=
 =?utf-8?B?Rmtha010V0JNUUI1UUVvVkFLTktra0pBcWpZNVlWT3FNdjRTcytKeUt5NHpQ?=
 =?utf-8?B?TzJwMW02c2Z3NlI3aUVoQXAwZG9reThpUXRxK1JtYU1JU0M1VEFFVDk3b0c5?=
 =?utf-8?B?TkJpa3JCWEYxQVRaSy9MUFk0NitiblhRU1poUXBuSlI5UVBwenZBLzhUMzJt?=
 =?utf-8?B?eGsyanpiVTE5Ukx1RGFUS2JwZHU4a0lONEdFMm83czloOHpXSE1jek1wTUFY?=
 =?utf-8?B?Y3I3MUJ1VzJnQ0R2L25uaTFEclcvWGVrL1YwblZTSUZOQm9hTXlSSTZSOWMz?=
 =?utf-8?B?dVNoK2o2MForSndDd2VzQkNjOExnMmcycjBIMWVmWmNEZlJDWDAyT2hibGRX?=
 =?utf-8?B?MmVxUDlBOW90NjY5QkxOM1U0R0JEME1zRFNKK0tqdHZOVi9sTVhQKy9UeTV3?=
 =?utf-8?B?MjU0YmFXWEpXRk0xSHJnMEE2bWFMcUhlRGJaa3RIOXlWRW5rZVltTXBXVENy?=
 =?utf-8?B?cWErclE4MWZ3Q1NqWThKSkhuOHFpZUYxa3VZYzBCYlpSMXcvaGVOOWNTYVF1?=
 =?utf-8?B?cFJvaWhkMzdxdnBzK0tENHpDMUp3QlYxMWxhcVdraXRYcHN0RXIwUmxFMzR6?=
 =?utf-8?B?RWJRalpBczBGNG9KcWJaOFB5K0IxMXVYVEk5Y1FKWVk3SmVZZ1ZObVJqT1la?=
 =?utf-8?B?L3FZT05ISFpPbEsvVUxRemdGbW5qRkR3dGlTTXJramZ0cERoZ2c0TU8wWFEv?=
 =?utf-8?B?V2U1SWRsaGNjRFFmUjB2OW56a3ArVThjVlNXMVZYemNaS2FBd3VuOVV6di9Y?=
 =?utf-8?B?NEdTWXlWV3dhRGEwVXFaZTNDdnBlU0JuaGpZNmE0R3UwNjBTZVJyeHhpNzk0?=
 =?utf-8?B?elJxbFo1Y1VUQ1loNmhTalEwaFFvdzY2bzhCOUhDdEY2QlU0NDZnaEgvd25N?=
 =?utf-8?B?KzN5Sm8zWVpVSkxQRDVZbUl1a1RLejJyMFFDY253NmhtMGYyWnpITE16MUIx?=
 =?utf-8?B?QlNkVXJhc01LN3N3d1NPMUtPc2R6L1ZZU1lQRHF4Z1Jrdk5iM0RvUU9PYWlj?=
 =?utf-8?B?WkNWeHdzekRvOXRvT1ZkWDQyQ3FjOEZ1Q2JabVFOcVVyLzhOWDlFTDZwVkZr?=
 =?utf-8?B?dStteERIU3crVUd6ei9PMEo5Y0lqWkl5UmQ3amUwTFR6K1ZuQUpwelZKL3N4?=
 =?utf-8?B?NmFmYnNwYTlmS1FQdnhIWjBsNmluSXNkRW1iZ0VzeFBkanNXalpEZHVBLzhI?=
 =?utf-8?B?Z01tUDBibU9UOE03Q2twUFBwOWpjbDBPZE1pblpJNmRqOTVscTRxV081R2w3?=
 =?utf-8?B?UFZ4dVFvSWQvbndTQWdZZkxqaE1RcFo3eC9LTzN4ZnJuUmg1OHRIaEJhTloz?=
 =?utf-8?B?NTVlcnBzR2M1ODhOZTVzd2Q3YzJSVDVvWmRUNm9pV3RaMnZzZnpqNld4Mlkx?=
 =?utf-8?B?Q2FFcitqVU1mZUViZ2RJZHdIU0NlWjlpQ2ptMTJRYnlOaytSQ2FiaHhBeW1P?=
 =?utf-8?B?akdobWlPb0pLN282R2ROTzFqMHZIaytOdUpWc3d2MEQ1dnVkR0NoWE9YeDl0?=
 =?utf-8?B?UUJGRUttdVZOaER5VzBKYmRnTUZhUTBVY1dZVFlBd0FKdHUvOUhkZUVUeHM1?=
 =?utf-8?B?dkN0K3ZFeGdiU3lmZ2ZyTVZScyt0SUtYYkF2L2dMeFhSWVhwZzBxRVo4eDJ3?=
 =?utf-8?B?bVdHNmY1Wk1ra0JvbXl3c1k3bGVHcFdzYUNLeVBPWnFLYk96a0c5V3NGVWgx?=
 =?utf-8?B?MXh2bFZ5dTVSZzVQUnNsZlcvSDd4elVNbVBJbjlDemhBVUZSL3orN3JBL0F3?=
 =?utf-8?B?Vkt5Q2NHcE5TZncyVzUzSTdudU52U0tHWUM1NUJ5SnlIYktTdStMRzRGd0Fa?=
 =?utf-8?B?QmNzZ3dQdmNYRGFJT292YzFwT3FQK1hlTXdpRFl1SjNPWURMNkZGNHd2R1pL?=
 =?utf-8?B?RTBlTGhFb2pYbGZSSVN3aWhiMFhBU05CMUtVYUhIWnhqRFZaV0pGd1pRdGFw?=
 =?utf-8?B?STA2ZXlWOHJxRDZqQTAwd2lnaGNya1FnRU9adWVaK29jY0kwZXpMTHpRLy9O?=
 =?utf-8?B?WU1iSWVhd1MrRUZOcW1hWjVjZExxZlJxMnVEb1h2TzVCM0lLZUxCWGNSZk5m?=
 =?utf-8?Q?2iEDD7owKFGyz5CI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2786.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 305984d3-08a8-4745-ab3a-08da3df1bb73
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 01:56:06.7210 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f3gMlbLm0ZHcwkyGG17wXW0yW+obL3Dsm6TquSCRUrNcrrIQZAze+cYzhlJ4OaT0hvrppXUxAeV/dBaLYps7625RWBGjwxOh96M6hyi6sA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5229
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Morris Mao <morris_mao@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSm9lbCwNCg0KSWYgeW91IHdhbnQgdG8gdHJpZ2dlciBXRFQgU29DIHJlc2V0LCBuYW1lbHks
IHdhcm0gcmVib290LCBhbmQgYm9vdCBmcm9tIGJvb3QwIHBhcnRpdGlvbiwgU0VDQTBbNF0gc2hv
dWxkIGJlIGNsZWFyZWQgYnkgd3JpdGluZyAweEVBIHRvIFNFQ0EwWzIzOjE2XS4NClJlbWVtYmVy
IHRvIHVubG9jayBzZWMgcmVnaXN0ZXIgYnkgY29udHJvbGxpbmcgU0VDMDAgcmVnaXN0ZXIuDQoN
Cg0KDQpUaGFua3MuDQoNCkJlc3QgV2lzaGVzLA0KQ2hpbi1UaW5nDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4NCj4g
U2VudDogV2VkbmVzZGF5LCBNYXkgMjUsIDIwMjIgODo1MSBBTQ0KPiBUbzogUnlhbiBDaGVuIDxy
eWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+DQo+IENjOiBPcGVuQk1DIE1haWxsaXN0IDxvcGVuYm1j
QGxpc3RzLm96bGFicy5vcmc+DQo+IFN1YmplY3Q6IGVNTUMgQUJSIGJlaGF2aW9yDQo+IA0KPiBI
ZWxsbyBSeWFuLA0KPiANCj4gV2UgYXJlIHRlc3RpbmcgZU1NQyBBQlIgYnkgY29ycnVwdGluZyB0
aGUgdS1ib290IGltYWdlLiBXaGVuIHRoZSBlTU1DDQo+IEFCUiBtb2RlIGtpY2tzIGluLCB3ZSB0
aGVuIGJvb3QgYXMgZXhwZWN0ZWQgZnJvbSB0aGUgYm9vdDEgaW1hZ2UuIFdlIHRoZW4NCj4gcmVz
dG9yZSB0aGUgd29ya2luZyBib290MCBpbWFnZSwgYW5kIHJlYm9vdCB0aGUgc3lzdGVtLCB3aGlj
aCBzdGlsbCBib290cyBpbnRvDQo+IGJvb3QxLiBJbiBvcmRlciB0byBib290IGZyb20gYm9vdDAg
YWdhaW4gd2UgbXVzdCBwb3dlciBjeWNsZSB0aGUgc3lzdGVtLg0KPiANCj4gSSBzZWUgdHdvIHNj
ZW5hcmlvczoNCj4gDQo+IDEuIFRoaXMgaXMgZXhwZWN0ZWQuIFRoZSBCTUMgc29mdHdhcmUgaXMg
ZXhwZWN0ZWQgdG8gcmVjb2duaXNlIHRoYXQgdGhlIEFCUg0KPiBtb2RlIHN3aXRjaCBoYXMgb2Nj
dXJyZWQsIGFuZCBiYXNlZCBvbiBwb2xpY3ksIGNvbmZpZ3VyZSB0aGUgQUJSIHRvIGdvIGJhY2sN
Cj4gdG8gYm9vdDAgb3IgcmFpc2UgYW4gZXJyb3IuDQo+IA0KPiAyLiBUaGlzIGlzIHVuZXhwZWN0
ZWQuIFRoZSBCTUMgc2hvdWxkIGFsd2F5cyB0cnkgdGhhdCBib290MCBpbWFnZSBvbiBlYWNoDQo+
IGJvb3QsIGZyb20gYm90aCBhIHNvZnR3YXJlIHJlc2V0IG9yIGEgcG93ZXIgb24gcmVzZXQuIFdl
IHNob3VsZCBhZGQgY29kZSB0bw0KPiB0aGUga2VybmVsIHdhdGNoZG9nIGRyaXZlciB0byBlbnN1
cmUgdGhlIEFCUiBtb2RlIGlzIHJlc2V0IGJlZm9yZSBzeXN0ZW0NCj4gcmVib290cy4NCj4gDQo+
IENoZWVycywNCj4gDQo+IEpvZWwNCg==
