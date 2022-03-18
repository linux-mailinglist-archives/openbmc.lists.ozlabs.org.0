Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DDE4DD379
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 04:14:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKTcx157fz30QC
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 14:14:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=esLvw6oc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:febc::713;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=troy_lee@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=esLvw6oc; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-hk2apc01on0713.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febc::713])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKTcM2r2Gz2yxP
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 14:13:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V09is+P6wLTP5ub5b4kiM0PvFAvtR5kXxFE6k8FvX1LEzdHFXcUtGh3i0sll/O9KxLJ8wdWnaoN+Dqx7LUs1pN/sENrxlQPT1xFQ95diFVlpR/rsHaWu6hUwVb3OGQ/pmFgYY0kSvrA6j1tSF2Cp72Y++PJvnIZMHVa/4mxfiFP9sAhE/LNlSZClYRFEt89xVqtgUt9LYvMpGRlUWEMcJTRhayburYT0K99eBW/QJc8y3RXIEoe3mtY/jce0jPqurj9OHzHTj8qyPZkF28egbk4u/R1rIe/OEdzEuwSOCb51MYL7SkEOSXVkv7G7tnyO7Ldog8BLNIH5JgX6sAzZYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppzDSsVrG98qFGS4uDqsOe9/RFvGM1bESV6+eXBKaB0=;
 b=jHpcSsRXvPmE/rigueiN0zxeAyy7ude0FrJbH7ohHKSv5nIAEuPqRcmHpCVelJevBVaBlXfO4vZx4gPnXAvEnJ3Wb25Ube1YwoHwDIkvJQUHM11G0in0m58tDvNcu/qkETEk49TJi+HAngdPygb2fgz3EJYIChs85RjcKun4BNK21kjb+ap/vbRJ+TKyLFqj1pmd/j3H935EtDFTnPAt01/Siza5ulB3yKQiTjoUGpXqGen5s9/nxdI7sjeBW612bx1ceLIDAw7UzBFgbxo5BrjQ+lV0QE6ABQBAlYGIsfM0VsLSxzl/Hi9uTadCw2o/5VOmNew9oSdk+KM0DKFbsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppzDSsVrG98qFGS4uDqsOe9/RFvGM1bESV6+eXBKaB0=;
 b=esLvw6ockXyoiXfwv88/r5cI5T9sZLg5GuCcvIm5snn5+D/eTrdzjtpdMSDkGwQsTjn01kyVjz9YLCDO2XTx0RGBJ9fWVgL2bLewsqBAqe1weBDAaNt/F3plSIp5sycnKA81McK/rGDv5j4oD13iHjgxW9m0dBr2Ec0etCIeR5XP53JS/SNj4DsEXzsvE2hJ7u69I+2fLECS85VjFkLOGfJpP0Lb7KSOowSeQlIeiZ1Ldkx+/ca+8j0a448WvUMnnP8Q5Y9uES/qpHE5XuZPE77FsaKWS7DQ9NcHU8uE26Yh/CKoS0r6bc5tiwHfAWKKK74PL5naafbDjVzQkss/Cw==
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com (2603:1096:203:4b::20)
 by HK0PR06MB3763.apcprd06.prod.outlook.com (2603:1096:203:b5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 03:13:11 +0000
Received: from HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::8527:8820:ff85:6187]) by HK0PR06MB2145.apcprd06.prod.outlook.com
 ([fe80::8527:8820:ff85:6187%5]) with mapi id 15.20.5081.017; Fri, 18 Mar 2022
 03:13:11 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, Howard Chiu <howard_chiu@aspeedtech.com>,
 Jeremy Kerr <jk@ozlabs.org>
Subject: RE: [PATCH linux dev-5.15] ARM: dts: aspeed: ast2600-evb: Enable RX
 delay on MAC0/MAC1
Thread-Topic: [PATCH linux dev-5.15] ARM: dts: aspeed: ast2600-evb: Enable RX
 delay on MAC0/MAC1
Thread-Index: Adg5yIom2fJaweEkRDCXav6Ed9+PkwApmFkAAAAWeZA=
Date: Fri, 18 Mar 2022 03:13:11 +0000
Message-ID: <HK0PR06MB21453F0015E428FC63721E238A139@HK0PR06MB2145.apcprd06.prod.outlook.com>
References: <SG2PR06MB23152A66322ADC7B9CDFF895E6129@SG2PR06MB2315.apcprd06.prod.outlook.com>
 <CACPK8XdAZdURVBdmnZ-+ch+xmbCv_N38EbQD93neENmh3-9Lqw@mail.gmail.com>
In-Reply-To: <CACPK8XdAZdURVBdmnZ-+ch+xmbCv_N38EbQD93neENmh3-9Lqw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9f68724-debe-4f1c-dfbe-08da088d3bcb
x-ms-traffictypediagnostic: HK0PR06MB3763:EE_
x-microsoft-antispam-prvs: <HK0PR06MB3763978BFFADD3DDE7EDAAAC8A139@HK0PR06MB3763.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a8tAe02aI7p5lgWVFuGoaK5MTyDybTJkKtPVvi+7dEN4f8fonnDkBxJkI+0WsPRjqjjUdBKru/rDMkIUxmL4/kIQR4HM9nKMkrDg7HXd/hDy1WPcDFgBdiTUxcMA6zgltDHQmC3ug0ruAnSmBIUzHzSolHq8IpkBO6YQEIzY7wVRBrPuvZ6565l2L1QDIQfe0zpUsQ3ARJXXNzYbDk06P01rcHoT4IbO1jKCHkgoSJNOIjbdE4SAm77ehM845Kkhqf2Gl6GbRCfdR0C5WiRuThrmN/NJfHVzRvNmz9eakGIFe4JXrnAOyRCjMNymgVIzB9NzJXFWxEEfU3YAI2e+9EELVu682MEoe3uwzZFSXEZWP9VNVjZ6vbML2VplbrTmuJDiTuolO6HODP5M6QKu6b4p4q5DCb7Lqb6PMMfY5N3Qi7eNNN5GbLxY7Thly7BXO98jSU8F8b2L9w5lmb4L4HMFMEwpxwIbrlGGJKlxVzjyEZr1nq259hgt5Esu28WUpW8YimpyOFSUOr06sG9P6z5AsB14PRdKwRWgpXQIZ8YVCARWBMSpRt4qYE/+DswqnOo4PBNPotdfwnhEIviDUEPvXmjOrJ5+NcTqUUZ2Su3WulHfZzG1UlkzqRK9wGQqzjOV8+up7K15CAwyHjGpBmvCqlwDLCxIf0cS71GF/IaYXK7kNVwQdMSq19aWRmWtK7978TwohyIt7zSd2mVBkGv1J5jFzW0f+eD1gj/4SfnFoLYQlsSkpXDdwf9PlXx/eSgf5rBk9pT8WPAIEdhhOwp30Pnol6uQzVu/y20Nec0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2145.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(396003)(346002)(376002)(136003)(39840400004)(366004)(52536014)(8936002)(2906002)(7696005)(6506007)(508600001)(966005)(55016003)(71200400001)(33656002)(316002)(53546011)(9686003)(110136005)(83380400001)(66556008)(4326008)(8676002)(66476007)(64756008)(66446008)(66946007)(26005)(76116006)(86362001)(186003)(122000001)(38070700005)(5660300002)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0U2WEE4MUV1UWFnWXFIT3JBakdUVzh3WnE3NHJ1U1laa0ZJU25NM1pSZFMr?=
 =?utf-8?B?RVBYY3l3c284WmsvamZWQWRaVTdQUW1tOU4yR3JaV3JMZG0zRmZzVUtWeE8x?=
 =?utf-8?B?NlV0NlN5ZU1vbEtLUitJRTRlMVlqNVg5bS80QlVzTFlVWG00bExIZ0w2ZGlz?=
 =?utf-8?B?V0FwcnRwdGp1a0NNOTZxUzJ0bVQrcExZaG56eEhNZk0zU1lBbUNxTmxsdjdK?=
 =?utf-8?B?Z1Ixd3BVeTh3MU9QQ0dXcTY2aWswUDBZMHZFOFJuZk44ZEFqdmZVQVB6NGRs?=
 =?utf-8?B?Ky9jWkhaS3NNMWE3SG56KzlFNTNyenFsRlBxbFFxTnFNM1lHVGFaZ1hWdU50?=
 =?utf-8?B?d2FrZ1dCUXdETnBjcWJEeHovOG90NXUxbDBqUElpNk9JbXA3bDFTVkE5ZWhF?=
 =?utf-8?B?QWZVTUpsM04za2pYVitYejJPendEOGtJUXJSeFBYWXN6L1U4R3MwTWhPWFJT?=
 =?utf-8?B?WGdoYTVUVFpTOXVGTU9yOGFFYXBiTm5qWHM0czZXZ2ZFQnpXNFVlMUxVRnV2?=
 =?utf-8?B?NjFRb3lldlg4eCtoRjNmOG9hTldrTkhzTzRjRkdvREFEeUpmdWp3emhrb2JI?=
 =?utf-8?B?WkR6S2t2QWhUdVltMWNOdFVhOVBCb2E5R2N0MERYU01LNStLZG40WFdSeXV4?=
 =?utf-8?B?QW9rZ0RTNjc5SGhsVkVCdFREN1crdnJhOHI1dzU0R2RsZGxyVjlGSWNLM01E?=
 =?utf-8?B?ZmRlUUc2SS8wMTdjWmF0TmJtc0dvZHkzU3piSElQNE5ONE1XQVRlbzlyQ3Nx?=
 =?utf-8?B?VzdNbmQ5R216dEJSV3JPSnQ1M1F1V0pORHk5a21udENLdUgzWVZ0R2ZJU2F2?=
 =?utf-8?B?em9hT2FlZDBCOFYrcnJkRE1vazQwNkNwVkpyajNBMmI4a3k0cmxQeFRWUkRZ?=
 =?utf-8?B?a0ZCVzdJUitBOUlIUGlibE9jaU9kN1RWY1A5M3B2cHA0aVRKRFJjb1ZKbGVr?=
 =?utf-8?B?UkxndWJtSEN5a0xReWJ1T3hVNTFQNXlNLzlzYzVVbE1aazlaQjlQMXRmUHRC?=
 =?utf-8?B?SCsvcDZFRklBbFo0aUtZZEdKZERvK042Zjh4dlZoUlArZGtKNDJiN0drZDlz?=
 =?utf-8?B?Qi9yTkdzS2ZaVFc5MDlYRVBhR3J5VnVsOGMwUWxiTDJGbVRobWg4cUV4MWNJ?=
 =?utf-8?B?eWZSdi9DSmdxcGRIZzhJbzhqZDhsVE1xbS9hUS91bVJ0eTVCRmZtTTRzclZN?=
 =?utf-8?B?VDJaZ0ExOHVVYUZESlBhQ3RlUmozRUFWdUMzdkR2TitLb0RuYU1zNmVCQldo?=
 =?utf-8?B?enBEWXZ6akxCd3pVZE9zVlMwdlQ0M1pBaUJVWmZPUmEyeFZFU0pKL3Y5RzRw?=
 =?utf-8?B?VFBTKy9SN2lwbXhXd2xobll2Q1NQWVlRSGVWZzg4SWNDSCszSGF6bU0vRy9Z?=
 =?utf-8?B?YmxuZzlpV0lpTi9Vb1lFWUZGUWV4K3pxM00zN29iaGVLK2VEUHNSbmpRVUtq?=
 =?utf-8?B?SDBZNjUvSnJ3cVF6UTBNNXpHSGZGbzl6Tm1OMm9WOWhrOXlGODFVSURnWWRS?=
 =?utf-8?B?dm1ud0dacEdRSFhjaXZLNFFPZWUyR3FHQVJqQzU4RWJtTExSWUFaT0dVSFBh?=
 =?utf-8?B?Sm5CK3BsbDk0aDI4WUNVc1ZGSy9ic2pRbkMreUpuSkYwZWg3eFBOQzF2UGRV?=
 =?utf-8?B?SktpejE4N3lpSzFqNlYzRFJBRjBMK2wwMjZJRXNqVE5Yb1p0SHdYNHZVSHh3?=
 =?utf-8?B?SU5BbW5lZWZtYUV3WG5pS2VGaWlkem5DUTBMOTNoeWJmK1VMekZDZ1dVMzZO?=
 =?utf-8?B?T3lpSGFSbHluK1hJTmpZeHhwRHQwSWxoYitWaG93cDlYY0Npc1JhemJOeU0v?=
 =?utf-8?B?cHFYb1Zja2dpUVlNM2dRcDliYUxnaHJOT294SHd5akpRSFd0TmJmNlBXc2JR?=
 =?utf-8?B?NmszWTRFYkludHRzS0NUNnFMMVk5VlFFNzU2a2o2S2h2UjVvMlVBb3FGbWNF?=
 =?utf-8?Q?0PbAmFr5DBBr6igS7gQVzrT45ul/SSDA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2145.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f68724-debe-4f1c-dfbe-08da088d3bcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2022 03:13:11.1880 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4RQ2dR9r+hbPm4kulJT8DSR8dHuc6Kro6OjzUwZ9qNY3YkVqFcUE8LoD0O9JMKCxi9Vy5T1LmB5NtYIMPPJvwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3763
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

SGkgSm9lbCwNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9lbCBTdGFu
bGV5IDxqb2VsQGptcy5pZC5hdT4NCj4gU2VudDogRnJpZGF5LCBNYXJjaCAxOCwgMjAyMiAxMDoy
MiBBTQ0KPiBUbzogSG93YXJkIENoaXUgPGhvd2FyZF9jaGl1QGFzcGVlZHRlY2guY29tPjsgSmVy
ZW15IEtlcnINCj4gPGprQG96bGFicy5vcmc+DQo+IENjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5v
cmc7IFRyb3kgTGVlIDx0cm95X2xlZUBhc3BlZWR0ZWNoLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCBsaW51eCBkZXYtNS4xNV0gQVJNOiBkdHM6IGFzcGVlZDogYXN0MjYwMC1ldmI6IEVuYWJs
ZQ0KPiBSWCBkZWxheSBvbiBNQUMwL01BQzENCj4gDQo+IE9uIFRodSwgMTcgTWFyIDIwMjIgYXQg
MDY6MzAsIEhvd2FyZCBDaGl1DQo+IDxob3dhcmRfY2hpdUBhc3BlZWR0ZWNoLmNvbT4gd3JvdGU6
DQo+ID4NCj4gPiBUaGUgcHJvcGVydHkgJ3BoeS1tb2RlJyBvbiBhc3QyNjAwIG1hYzAgYW5kIG1h
YzEgaXMgcmVjb21tZW5kZWQgdG8NCj4gc2V0IHRvICdyZ21paS1yeGlkJw0KPiA+IHdoaWNoIGVu
YWJsZXMgdGhlIFJYIGludGVyZmFjZSBkZWxheSBmcm9tIHRoZSBQSFkgY2hpcC4NCj4gPiBSZWZl
ciBwYWdlIDQ1IG9mIFNESyBVc2VyIEd1aWRlIHYwOC4wMA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogSG93YXJkIENoaXUgPGhvd2FyZF9jaGl1QGFzcGVlZHRlY2guY29tPg0KPiANCj4gVGhhbmtz
IEhvd2FyZC4gVGhpcyBtYWtlcyBNQUMwIG9uIG15IEFTVDI2MDBBMyBldmIgd29yayBhZ2FpbiEN
Cj4gDQo+IG1hYzEgd2FzIHdvcmtpbmcgZmluZSB3aXRob3V0IHRoZSBwYXRjaC4gRG8geW91IGtu
b3cgd2h5Pw0KPiBXaHkgZG8gd2UgZG8gdGhpcyBmb3IgbWFjMCBhbmQgbWFjMSwgYnV0IG5vdCBt
YWMyIGFuZCBtYWMzPyANCk1hYzAvMSBhbmQgbWFjMi8zIGFyZSBwaHlzaWNhbGx5IGxvY2F0ZWQg
b24gZGlmZmVyZW50IGRpZSwgc28gdGhleSBoYXZlIGRpZmZlcmVudCBwcm9wZXJ0aWVzIGJ5IG5h
dHVyZS4gDQpNYWMwLzEgaGFzIHNtYWxsZXIgZGVsYXkgc3RlcC4gDQoNCj4gQmVjYXVzZSB0aGUg
dXNlciBndWlkZSBpcyBub3QgcHVibGljLCBjYW4geW91IHBsZWFzZSBxdW90ZSB0aGUgcmVsZXZh
bnQNCj4gaW5mb3JtYXRpb24gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KVGhlIFNESyBVc2VyIEd1
aWRlIGNhbiBiZSBkb3dubG9hZCBmcm9tIEFzcGVlZCBnaXRodWIuDQpodHRwczovL2dpdGh1Yi5j
b20vQXNwZWVkVGVjaC1CTUMvb3BlbmJtYy9yZWxlYXNlcy9kb3dubG9hZC92MDguMDAvU0RLX1Vz
ZXJfR3VpZGVfdjA4LjAwLnBkZg0KDQpUaGFua3MgZm9yIHRlc3RpbmcsIGRvIHlvdSB0aGluayB0
aGlzIHBhdGNoIHNob3VsZCBzZW5kIHVwc3RyZWFtIG1haW5saW5lIGFzIHdlbGw/DQoNClRyb3kg
TGVlDQoNCj4gVGVzdGVkLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pg0KPiANCj4g
PiAtLS0NCj4gPiAgYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWFzdDI2MDAtZXZiLmR0cyB8IDQg
KystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1hc3QyNjAw
LWV2Yi5kdHMNCj4gPiBiL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1hc3QyNjAwLWV2Yi5kdHMN
Cj4gPiBpbmRleCBhNjM4MjA4MmQzOGMuLjlhMTk3OTU0MWQyZCAxMDA2NDQNCj4gPiAtLS0gYS9h
cmNoL2FybS9ib290L2R0cy9hc3BlZWQtYXN0MjYwMC1ldmIuZHRzDQo+ID4gKysrIGIvYXJjaC9h
cm0vYm9vdC9kdHMvYXNwZWVkLWFzdDI2MDAtZXZiLmR0cw0KPiA+IEBAIC0xMTYsNyArMTE2LDcg
QEAgZXRocGh5MzogZXRoZXJuZXQtcGh5QDAgew0KPiA+ICAmbWFjMCB7DQo+ID4gICAgICAgICBz
dGF0dXMgPSAib2theSI7DQo+ID4NCj4gPiAtICAgICAgIHBoeS1tb2RlID0gInJnbWlpIjsNCj4g
PiArICAgICAgIHBoeS1tb2RlID0gInJnbWlpLXJ4aWQiOw0KPiA+ICAgICAgICAgcGh5LWhhbmRs
ZSA9IDwmZXRocGh5MD47DQo+ID4NCj4gPiAgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVs
dCI7DQo+ID4gQEAgLTEyNyw3ICsxMjcsNyBAQCAmbWFjMCB7DQo+ID4gICZtYWMxIHsNCj4gPiAg
ICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4gPg0KPiA+IC0gICAgICAgcGh5LW1vZGUgPSAicmdt
aWkiOw0KPiA+ICsgICAgICAgcGh5LW1vZGUgPSAicmdtaWktcnhpZCI7DQo+ID4gICAgICAgICBw
aHktaGFuZGxlID0gPCZldGhwaHkxPjsNCj4gPg0KPiA+ICAgICAgICAgcGluY3RybC1uYW1lcyA9
ICJkZWZhdWx0IjsNCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo=
