Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A175F510D
	for <lists+openbmc@lfdr.de>; Wed,  5 Oct 2022 10:43:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mj7QG21Hcz3bj7
	for <lists+openbmc@lfdr.de>; Wed,  5 Oct 2022 19:43:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=2eCoCise;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=40.107.255.139; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=dylan_hung@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=2eCoCise;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2139.outbound.protection.outlook.com [40.107.255.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mj7Pb5J2cz2yph
	for <openbmc@lists.ozlabs.org>; Wed,  5 Oct 2022 19:42:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/mJdIYaUrIu4nb65CKkfFWD6MqRqTnXApyPmazu/e91bmJr/55gyG4zBecI3xj8uMq76SC/men+3JvcbzXytXUb8rDkHkIoQ0PlXzs1fXFWWWICW9/YInPHOeSGw4LtA4eBey1qcN4iGgMjDRe8hX9rxHMkanrKlqXnoMstvpfM74xoNVGU7aKEF9c7ZJi176t8eKioH5HEI22YPNFtc0SNf18hb2ACwTC2cKZpVL26cTVhXTvPTE7/LuKesaAJ0WxlJHC6/yxCIF/O5iipu+sT2IYNWjcqUZoNXKUBmYhaQubE8fRc2pJ2VZBHfunIBIxjgJyLQZ7lkjFAOKyEew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hW93TBphRkMK4jmykNb0DyoDv1J8K8bz3JU1D11j0FQ=;
 b=Ps1xo8vROMgFBCqM1WAeTD1TClAQLqRHaKPcnK5Cqfd0PW669OxbuWxsJYuVHvOgFEPLxZLP2vM9YgjqRf9p35bg+NBB/wL1cGCrI92PMX1vRvT+E0cIWCiPUV8bOCv6zrdFTTnycru+IVgjcH0Hktnn9AttpSWkrSiE6yqR6iSvqLfcE9Gv2MtvSRZc+0L2P8XcTdWR+xzhBsl7odsDDlv1ygG70heLnyH9Cw9bRW3xPZrt1w4AMAT+zoHKOd0KOF33B3VDT/rJiW5DUt+fgifALSrxHfxK0ClCW/qj6tkNPF/qLcpcnUvsqSw67W15F8Jhh8I0bEiTMYkHLZ+xlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hW93TBphRkMK4jmykNb0DyoDv1J8K8bz3JU1D11j0FQ=;
 b=2eCoCiseeV0/yv9JOw2ZMBLpKReULd+KhPJY/iSe5zV1PyJCyf+bqsTXSpqSMI6WByaa8E0kY/ywfOI1QfNHHpRCtjoVWpsljjc0dP2IIPYmY7+YHeaKqRWcNHsDlRsX/dcrDp2O/dhYmyhv752hcmvxQ9LsdG6GjoZPWlYK9Z3kkAUSpzZsVdwNaUqb7W73b78dsuI0rxwbAGrEmgDMgAlGSmcSOQCGBXp89gqs9HqJJXVbI7dlp8MVRIh6crmnwOW1s/k80MkedznenMSWIwPP1V1yhaH3oOM1dr7i2QhETrTBWpYktjzB6wAtIilH+w7A5rmqo+gJG4DvJA7Y1g==
Received: from HK0PR06MB2834.apcprd06.prod.outlook.com (2603:1096:203:5c::20)
 by SEYPR06MB5489.apcprd06.prod.outlook.com (2603:1096:101:b7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Wed, 5 Oct
 2022 08:42:35 +0000
Received: from HK0PR06MB2834.apcprd06.prod.outlook.com
 ([fe80::7d28:9007:dcf1:1a30]) by HK0PR06MB2834.apcprd06.prod.outlook.com
 ([fe80::7d28:9007:dcf1:1a30%7]) with mapi id 15.20.5676.031; Wed, 5 Oct 2022
 08:42:35 +0000
From: Dylan Hung <dylan_hung@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: [Phishing Risk] [External] AST2500 u-boot breakage with
 CONFIG_RAM=y
Thread-Topic: [Phishing Risk] [External] AST2500 u-boot breakage with
 CONFIG_RAM=y
Thread-Index: AQHY1RDmsWzOOzOSqE2Us+TJXzrKZq3435kAgAMc1eCAAEiEgIADOGdA
Date: Wed, 5 Oct 2022 08:42:35 +0000
Message-ID:  <HK0PR06MB2834DFBBED0FDC2C1B22B9B79C5D9@HK0PR06MB2834.apcprd06.prod.outlook.com>
References: <Yzda9uALobTbT7B/@hatter.bewilderbeest.net>
 <CA+J-oUuhA_akVPbTp=ARqJOaaFp6j43QakSiyjMiNz8NGpVZYQ@mail.gmail.com>
 <HK0PR06MB2834AE1581020A5B7CE191839C5B9@HK0PR06MB2834.apcprd06.prod.outlook.com>
 <CACPK8XfYg9SO81=1B1TVy0NO7LzMWc7TsRXVEFcN7c+0J-31hQ@mail.gmail.com>
In-Reply-To:  <CACPK8XfYg9SO81=1B1TVy0NO7LzMWc7TsRXVEFcN7c+0J-31hQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HK0PR06MB2834:EE_|SEYPR06MB5489:EE_
x-ms-office365-filtering-correlation-id: 103ecfa8-d127-4832-7df7-08daa6ad8d07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  I2G7nOICtF0by6zOngWf/CqKpmxLIFmfCcjxUWSg9sl0+rdSL1kivRupG9PYscYjQ8Ph6R9JDgctaSR2CrSOoZY3LSWxTfST2/SDU1slh599Z+T6BFgoHHYcdxkcyafFBFyLgh8PRYwK05kmMLRhEBUGOgof3/6jxWyGxHcJPIvrrGIEyovLsENAEbTjxQhuDL8xO71O2kZ40zfyu9h9XxNfILotAmLS/mt21pLaNxZgdhraPXW0kCGegx/F9Ata4sax/9nqsipWCY7n1/Jx6NvNNBQzUWjUw+mbXhMOYgOLXmKBSKyJA8yiBk+CWO25Lo6WcM9JXxx5A95nrgK1mxFbbxdawGv+jFbqdakvP9O6xc2hluUvqBrVCvtff6Bi4uFlc30u8Mq07baT+HHPSzmTue8k+mgdo6C81JGpaWxyFeoImYY/BzrumwZpL7Oq5yG8fNhVCJzxtDn8FA7J5mS5l6bpEi8W5VoixsoosYVO5ogQkeTFyuX7MtLziG6eW6e2C0GxsqaAjyfAVBUaZ1buJwLZubhxTsNcqFAKAT67FAwCoV2ovInRsbxEHl/eoYNvJDLmooyg4aYHdR4+GbmH0c1D7scNoykPO5wqjza+RKQbe3t9jXUakMJIqXJezNPmubcAbMQiKSiM4MF/GWNMBALus4C4o+Hoqt7QWaLZ0fAVp7wL551RVwutfsrQ
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR06MB2834.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39840400004)(376002)(346002)(396003)(366004)(451199015)(316002)(76116006)(66946007)(66446008)(38100700002)(66476007)(2906002)(38070700005)(55016003)(64756008)(86362001)(33656002)(66556008)(5660300002)(8676002)(4326008)(8936002)(52536014)(41300700001)(71200400001)(7696005)(478600001)(9686003)(107886003)(53546011)(26005)(6506007)(6916009)(54906003)(186003)(83380400001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  00uo+4tpssZQy2N5qTO6/IRaB3TA29Ir4+jwR40k5IgTYmup5hbq+LU9EF4zJfyhqZHuQ1jutnEE8CinVFEkHTlAhsZ93Ejm/sa7tU9wb2q6Tuvubp4prj+l9Q8BdX9tbaDjd/u+g6ssm48IeHpaAF5DzMUhZKCdvk9JcErDaPfMtCMG0PLMA8L+ESVRsdXWKfMEWPX01qplwho8etZTHIl1LHjW0rdS1vgR5Fj8qDfZmLtik760KRdokUKr1wFN4dBni4mK6+zj0a1RJpK7yzb7wFzOkX7K/Ev08oohGo3d044620LnJ3uXCPBs60Cv2vrRSpknyQ475zy0FA5kE9N6k6GGlUyGmHPyFW6HnHQcHebN/Tn9v/GEtbuQIohBCtllVjgVhKq9rVL3ui3SkqQFD4PkY1pSYqj5PBdScIk=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2834.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 103ecfa8-d127-4832-7df7-08daa6ad8d07
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 08:42:35.1353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eYals+GcNCOSf6DySEDgurnfcNhPtA62ETEcbUnn+8okJ33vIaOD/ZPvnACQMlBgeb1wFDQuRc0m4eTu1qGejaeGgsvfeh783dxnlRMbxzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5489
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Zev Weiss <zev@bewilderbeest.net>, Andrew Jeffery <andrew@aj.id.au>, ChiaWei Wang <chiawei_wang@aspeedtech.com>, Zhang Jian <zhangjian.3032@bytedance.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKb2VsIFN0YW5sZXkgW21haWx0
bzpqb2VsQGptcy5pZC5hdV0NCj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDMsIDIwMjIgMzoxMyBQ
TQ0KPiBUbzogRHlsYW4gSHVuZyA8ZHlsYW5faHVuZ0Bhc3BlZWR0ZWNoLmNvbT4NCj4gQ2M6IFpo
YW5nIEppYW4gPHpoYW5namlhbi4zMDMyQGJ5dGVkYW5jZS5jb20+OyBaZXYgV2Vpc3MNCj4gPHpl
dkBiZXdpbGRlcmJlZXN0Lm5ldD47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgQW5kcmV3IEpl
ZmZlcnkNCj4gPGFuZHJld0Bhai5pZC5hdT47IENoaWFXZWkgV2FuZyA8Y2hpYXdlaV93YW5nQGFz
cGVlZHRlY2guY29tPjsgUnlhbg0KPiBDaGVuIDxyeWFuX2NoZW5AYXNwZWVkdGVjaC5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbUGhpc2hpbmcgUmlza10gW0V4dGVybmFsXSBBU1QyNTAwIHUtYm9vdCBi
cmVha2FnZSB3aXRoDQo+IENPTkZJR19SQU09eQ0KPiANCj4gT24gTW9uLCAzIE9jdCAyMDIyIGF0
IDA0OjA5LCBEeWxhbiBIdW5nIDxkeWxhbl9odW5nQGFzcGVlZHRlY2guY29tPg0KPiB3cm90ZToN
Cj4gPg0KPiA+IEhpIFpldiwgWmhhbmcsDQo+ID4NCj4gPiBBc3BlZWQgcmVjb21tZW5kcyB1c2lu
ZyAiQ09ORklHX1JBTT1uIiBvbiBBU1QyNTAwIHNpbmNlIHBsYXRmb3JtLlMgaXMNCj4gY3JlYXRl
ZCBieSBBc3BlZWQuDQo+IA0KPiBDYW4geW91IHNlbmQgYSBmaXggdG8geW91ciBTREsgKHdoaWNo
IEkgd2lsbCByZWJhc2UgaW50byB0aGUgb3BlbmJtYw0KPiB0cmVlKSB0aGF0IG1ha2VzIGl0IGNs
ZWFyIHRoYXQgQ09ORklHX1JBTT1uIG1lYW5zIGl0IHdpbGwgdXNlIHBsYXRmb3JtLlM/DQo+IA0K
PiBJdCB3b3VsZCBiZSBldmVuIGJldHRlciBpZiB0aGVyZSB3YXMgb25seSBvbmUgd2F5IHRvIGRv
IHRoZSBEUkFNIHRyYWluaW5nIGluDQo+IHRoZSB0cmVlLiBDb3VsZCBBc3BlZWQgbG9vayBhdCBp
bXByb3ZpbmcgdGhpcz8NCg0KSG93IGFib3V0IEkgZm9yY2UgcGxhdGZvcm0uUyB0byBpbml0aWFs
aXplIHRoZSBEUkFNLCBhbmQgcmVtb3ZlIHRoZSBjb21waWxlDQpvcHRpb24gZm9yIEMgZHJpdmVy
Pw0KDQphcmNoL2FybS9tYWNoLWFzcGVlZC9hc3QyNTAwL3BsYXRmb3JtLlMNCg0KICAgIGxkciAg
IHIwLCA9MHgxZTZlMDAwMA0KICAgIGxkciAgIHIxLCA9MHhGQzYwMDMwOQ0KICAgIHN0ciAgIHIx
LCBbcjBdDQorIC8qDQorICAqIEFzcGVlZCByZWNvbW1lbmRzIHVzaW5nIHBsYXRmb3JtLlMgZm9y
IERSQU0gaW5pdGlhbGl6YXRpb24uDQojaWZkZWYgQ09ORklHX1JBTQ0KCW1vdiAgIHBjLCBscg0K
I2VuZGlmDQorICovDQoNCmRyaXZlcnMvcmFtL2FzcGVlZC9NYWtlZmlsZQ0KDQppZm5kZWYgQ09O
RklHX1NQTF9CVUlMRA0KLSBvYmotJChDT05GSUdfQVNQRUVEX0FTVDI1MDApICs9IHNkcmFtX2Fz
dDI1MDAubw0Kb2JqLSQoQ09ORklHX0FTUEVFRF9BU1QyNjAwKSArPSBzZHJhbV9hc3QyNjAwLm8N
CmVuZGlmDQplbHNlDQotIG9iai0kKENPTkZJR19BU1BFRURfQVNUMjUwMCkgKz0gc2RyYW1fYXN0
MjUwMC5vDQpvYmotJChDT05GSUdfQVNQRUVEX0FTVDI2MDApICs9IHNkcmFtX2FzdDI2MDAubw0K
ZW5kaWYNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gSm9lbA0KDQotLQ0KRHlsYW4NCg==
