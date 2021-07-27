Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 047DA3D6FA5
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 08:48:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYnRl6ZLbz307g
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 16:48:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=VyOPNFby;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.130.100;
 helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=luke_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=VyOPNFby; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300100.outbound.protection.outlook.com [40.107.130.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYnRQ5qXMz301F
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 16:47:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SoKCU5bU/Md3Y2ltyyPl1eHJVpPGNBIZQQEOhrhh42PIrqehKdcbXuhzIdFmvqg75S24xYGI+QdOCNmtQy6lzcE3mwqHNB4S+tqhf8+IcN6TAnutna2K5Ci/qpHRgDXMCBCqPr3IrOFjh1tjFCRK4rcc/Y0aIH9AjQZPU+5PLuzfE/IC3rvIiCPkk+yAvR/4VaoEY3OlPhgb4XzLd1SU/EVhIn2gyp2+VhRo0X5GM+Z7lhhfgwOX2uWm/MEId5MQl/2LIv7V/Lp1aMTwzCG0QTGVvf9Nn+fKeKy+tpnh1FR17n2ih8GNUYWa5OhnaYwtWp4OJNUp4JGUlf/5z0GYKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/VvzdiI4Ia530xV4evWQe5UzEbnu2KE3QIKlFXcbF8=;
 b=lPDpjDjpfEAaJ9ugWixHiXgHz05O6swHyjd2J9wsx1MpYvF4MDo2rGw29jM/SPKOCOQJl/f9vvqsTf9ln+X1tSGaDNX03UOUmcT+gHx/Y4/+xvVSzbUZIEB0JQlaU+UTKxEbLPpJ4yx/A2S8NA1Kt9yR7RhqdgDAWK9LYQodFjlMfUbUc5QXIhpMVAqVrybA47EG/acLEr4u0toQf/La6oaLRsTci1cAUuv/XrSMC/iuBfwe48V5RdHyaQi3RwFb2+xIhlnMG/HHbil42fIRI98l1RpKoqM0tt+uPwW2oB2IhBySWy6l0H34K/v4gjxnjVG01o+boqQ38VKyKBxAmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/VvzdiI4Ia530xV4evWQe5UzEbnu2KE3QIKlFXcbF8=;
 b=VyOPNFby5k13sZwLzufZ34qzt4yhx/Phz+aeEyd5mmq5tFjNG75DsREAfWL1DmKY4oxwg61L96VsFwdn+oyjK6CEDgnaU0payr21yXv16KO5sJJd8RfRIlekBO5Cn0FiU9FcH0ZKf8iWGoHtLMkxKdfrrEoE6L0lIJwTKO/D+TwZVbxuBNS9kUpSJr9qJNL8CjSHlKlxkRA9NWFw6CBy2U2raLk2/fdPa5Uv22MuWuA1JoJa1+CpDpw+5SrTw6pMPO9aeHBnX6zG1CmEAVOUsXnVnx+6+VTVwzjzhEOdUPGJIFI2vM621mlGQJ+UL4QmfSR4kfKiCBIkhVPOpOsFWA==
Received: from HK0PR06MB2321.apcprd06.prod.outlook.com (2603:1096:203:49::11)
 by HK2PR06MB3506.apcprd06.prod.outlook.com (2603:1096:202:3a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Tue, 27 Jul
 2021 06:47:25 +0000
Received: from HK0PR06MB2321.apcprd06.prod.outlook.com
 ([fe80::10d4:b8ce:9878:23bc]) by HK0PR06MB2321.apcprd06.prod.outlook.com
 ([fe80::10d4:b8ce:9878:23bc%5]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 06:47:25 +0000
From: Luke Chen <luke_chen@aspeedtech.com>
To: "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>
Subject: RE: Signed CLA from ASPEED
Thread-Topic: Signed CLA from ASPEED
Thread-Index: AdSF/BDVNQADm2VBRuejwbddN04pK6tWXgwgpVzwJFA=
Date: Tue, 27 Jul 2021 06:47:25 +0000
Message-ID: <HK0PR06MB2321716D4130BC0F706AB274E1E99@HK0PR06MB2321.apcprd06.prod.outlook.com>
References: <623110cb8acb4bbc99c43c47b37f5457@TWMBX01.aspeed.com>
 <9C742B6B-8604-4EC1-9AE8-98844ACB557D@fuzziesquirrel.com>
 <HK0PR06MB23218108A08BC07208A93909E1FF0@HK0PR06MB2321.apcprd06.prod.outlook.com>
 <CAN9Jwz375dV0fFbBaE_SK6Cw8t0pyC-j-fPFuK5tm_EATWoFmA@mail.gmail.com>
 <HK0PR06MB23215E570FE7381C47EEA024E1E99@HK0PR06MB2321.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB23215E570FE7381C47EEA024E1E99@HK0PR06MB2321.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none;fuzziesquirrel.com; dmarc=none action=none
 header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fea71e0c-ea1b-46f3-6be5-08d950ca64fd
x-ms-traffictypediagnostic: HK2PR06MB3506:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR06MB3506CDEC5FFAD6F2F5062C42E1E99@HK2PR06MB3506.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iyA0nZ86CO4v5hoYvLnyxvYwNS9M8TlINYPn/mwknKwZlbMMRuzoBK3MBr5cHQD4pNUFsq40nM7p70khwv1aJB26Zh5rlPRqoeBxSyA78vsduGfOg7PVwij/H6kpfsY93d+3ie6VuMNFHAVfKB6HkGpOREbNL1AA/80h2sjiccnTn8En4lFK01/OGGQB2Le1ylXwUTnjBmG5xJTH87iPm+J24cu94cyqo6nqm+7yyzRqRyTh4Z02CwyNU10Y1NC1BmF+iHcIsQaAP43KfsIL4my/F848SsfP/Nq770wnb3+y1LtogpgTX7Xcy9CydG/m3x7fkaKCHhMXQGSI56RB2/b8aVB8dUe8gCJkhIqHzsSNGHDjH8IZAPbKpXEIhhPrUMzKrMjO147NZ4ZlgDKJK1QjOncZYhVbzL4EPhhH27QS6jnj5aCW8S1iEa+i8ENIs30Ykx3cMVL2yfuuO5UYz4uYMKrmbRrlnH2MrvgIe+9fD8K9ZdSKXFXPiX+3Fmtl/c6JKbd/ui2bdLVgxEDSSrxPaMEpL3TTAVBKLIrvHiW0QN6Vjy7LGP8dFFOIUNL168kdTqEcjvgHQYMR1sS0R5C7DPz81ykUp0FfspY5Juqi8Dmtp2pzA59h/TVhhiYDY3epGD2jHDSc8N/HmqCP5+g6D5jGF1AXz3/mVdfsi+daCOfk0oFMNXPJi31WsSipaMgotgtKEi1VLLpwbC/8UA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2321.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(136003)(39840400004)(366004)(86362001)(33656002)(5660300002)(6916009)(2940100002)(66476007)(2906002)(186003)(107886003)(8936002)(26005)(52536014)(71200400001)(66946007)(76116006)(64756008)(54906003)(53546011)(6506007)(316002)(9686003)(83380400001)(8676002)(478600001)(7696005)(3480700007)(66556008)(4326008)(122000001)(55016002)(38100700002)(66446008)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVJMRFEwTVBPY3dSMGRTYkQ3U0ErS1didlVkUXArSjlKaGhFVTVHSnRxUTN0?=
 =?utf-8?B?RXFFcjhKeGFmOG9aODFwOFpmMXFhMzc1ckxaS1JaNHlUaWRaVmxsYU43Mi95?=
 =?utf-8?B?NzZzS0dpakxoV2g0RmhUZG91bWd4RVduaUlmeEFObWNYT0I4WDNNOUYxaEJH?=
 =?utf-8?B?TGhybzZKaCt5ZWx0WHJuc3ZVUEZRd1ZGUG0vOVFEUlp1cmxxMWhBMURTZjdW?=
 =?utf-8?B?TlFxMTdTYW8veWZITzZzNXpSVkJHNWp0QXVQQmQreEFEZXRDS090WW94ZnRD?=
 =?utf-8?B?TThXZ3lsOGJMdHZ2ZFc0K2o4ckFuU1l6WWwxMTVUS1RQTzhUUXFXU1BKMmRq?=
 =?utf-8?B?a1ZlbzYyajh3UkVYWWNqcThIUWwyNHl0QlJucVhBbG5ZYUdOWFJvMUZMb2M2?=
 =?utf-8?B?WjNFUU5hZnN0VnNVMllkSE5nZ2lycmlwTFBkNnJNWCs1OEJ4N25rcnc0bnVQ?=
 =?utf-8?B?K2k4OFhhTlBRSkpBRW5JNEd2SXRzbnVyK3Zyb01NazFndVBObDZiV2xOK1VF?=
 =?utf-8?B?cUtncmF1b290RXp4SktPbkUzRXdQajQ1Sk5RdFZvWndmeUx6K3ljbXV3enVC?=
 =?utf-8?B?V0xsc3MyME85MkJaUTZPYklodkZOWXkyT205T0N1cS9WQ2xWSjFqR0dVYm40?=
 =?utf-8?B?WGZDbzdrQVI5SHJ6bHhqNlQ0aVE4alJjT21Yc0MzaVY2Q3NPYTdpVlRjaGps?=
 =?utf-8?B?WnozSldQaGZQNjRqb0d0R3hHWFRONkdPNkk1bjJmZjh6bGVUL3Y3d1AxSjRZ?=
 =?utf-8?B?cVJLeEtFMHFmaDhTNVVLMXhXZXhRR21wZFVoanlnY2RocGk1SzNqMmdyWDJp?=
 =?utf-8?B?akJTb2JrdkJVaEhzamhxYkJvd3ZValUzemQ5cWtxbndPazZPRkFKTU5PVlhr?=
 =?utf-8?B?S2RHL3VGQWNOT0h6N1plUFplRlBGOEc3eHp0VjcyZjZHaDBYbmpKeml5c2Jt?=
 =?utf-8?B?bk54S1ptNzd5OW1EbVlxL3V3KzJCejhWaXQ5RkpJZVFLYXkvL3FuT1ZpTnM5?=
 =?utf-8?B?cFpDbHZNczJ6dVVVMjI5cHVWdUJIZ0lzc0NDQVBITjd2aE5ZbkJvQVFlYU0z?=
 =?utf-8?B?bUlEK2NudlMxU1VRU3J6OUpDNVRlNUszdER1L2ZjTG1XUzUzak0xQTF2dFNG?=
 =?utf-8?B?UTBUZ3ZzQ0FHajJSbERIYytqMEh2c2VnNVBncDR5dm1VZHVXYUcvdzJsOERs?=
 =?utf-8?B?QWlnZG9rK3NTZWFkMG9EV29abUtxYWJYOUZCTU5sclc3SHdiRkZpeWtsMDNj?=
 =?utf-8?B?N1ZlOWkyc1BkK3ZNV1g1M2thNG4zZ3RGck5KelQ0RmNnQ2dPQ2ZFUEZZeGpy?=
 =?utf-8?B?V3NXbmhwTmJVS2E2L090bW5JWDdrTHlHT1FZUkxnbDNHcFFQckQ3S0FjbnFN?=
 =?utf-8?B?TXBHSE00TmpQczRCT1J4SWRYeEsrZFZsYy9ldnQ3M2lQNFRlVUMwdVpwNUZa?=
 =?utf-8?B?cFVISUE3RzhkTU8xdTNwdldKclJSVlZLdXM1VHVRN2c3TkR0eDJZT1hkUXd2?=
 =?utf-8?B?cExJblYxS1hkNHJDa0M2OGJnYzNTR1BMRUVWemxtTjRLc3cvcHNGWnJtdWhp?=
 =?utf-8?B?MHlsTUtYcjcxSTZzRkVjamlReVBjSWJYVURPYUhDaFZQUityQ2xMQmczcnZx?=
 =?utf-8?B?MHBqdXVibHU2YVRoaEFVV3hmbXVkaVRwVElZS0x4TGVBbEVrMHR2N1BWUmpt?=
 =?utf-8?B?QS9VZS9jUXBOUUtHTHFwWFNtTmhvY2VTcDFuR0Zsc3hsQTBrM0dja1czOWQx?=
 =?utf-8?Q?w3cXbN0rDriX2B6y2S9W4eibfrxnF3f6P8NcehF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2321.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea71e0c-ea1b-46f3-6be5-08d950ca64fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 06:47:25.6392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 84Hhr326pUaZOGz4uXx+cKsskGFPixMSHF4hsAkYXlpfcT0LfBnNwoir+4ue/C5uho7/B7FQigsx9r+BwTMzZz1bT6opQn3+Jrxr3QivK90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3506
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
Cc: "manager@lfprojects.org" <manager@lfprojects.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQnJhZCwgTWFuYWdlcg0KDQpJdCBzZWVtcyBteSBwcmV2aW91cyBlbWFpbCB3YXMgYmxvY2tl
ZCBvdXQgZHVlIHRvIHRoZSBhdHRhY2htZW50IGZpbGUgc2l6ZSBpcyBvdmVyIDEyOEtCLg0KVGhl
IGF0dGFjaG1lbnQgZmlsZSB3aGljaCBJIHNlbnQgeW91IGlzIHRoZSBzaWduZWQgQ0NMQSBwZGYg
ZmlsZS4NClBsZWFzZSBsZXQgbWUga25vdyBob3cgY2FuIEkgc2VuZCB5b3UgdGhlIHBkZiBmaWxl
Pw0KDQpUaGFua3MuDQoNCg0KQmVzdCB3aXNoZXMNCg0KTHVrZSBDaGVuDQooTykgOiArODg2LTMt
NTc1MTE4NQ0KKE0pIDogKzg4Ni05MzUtNTkyLTg5Mg0KNEYsIE5vLjEsU2VjLiAzLEdvbmdkYW8g
NXRoIFJvYWQsIEVhc3QgRGlzdC4sDQpIc2luY2h1IENpdHksIDMwMDY5LFRhaXdhbixSLk8uQy4N
Cg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTHVrZSBDaGVuIA0KU2VudDog
VHVlc2RheSwgSnVseSAyNywgMjAyMSAyOjQzIFBNDQpUbzogYnJhZGxleWJAZnV6emllc3F1aXJy
ZWwuY29tDQpDYzogbWFuYWdlckBsZnByb2plY3RzLm9yZzsgb3BlbmJtY0BsaXN0cy5vemxhYnMu
b3JnOyBUcm95IExlZSA8dHJveV9sZWVAYXNwZWVkdGVjaC5jb20+DQpTdWJqZWN0OiBSRTogU2ln
bmVkIENMQSBmcm9tIEFTUEVFRA0KDQpIaSBNYW5hZ2VyLCBCcmFkDQoNCkkgd291bGQgbGlrZSB0
byB1cGRhdGUgQ0NMQSwgSSBhZGRlZCAyIG1vcmUgdGVhbSBtZW1iZXJzIGludG8gdGhlIENDTEEu
DQpTdGV2ZW4gTGVlLCBzdGV2ZW5fbGVlQGFzcGVlZHRlY2guY29tDQpKYW1pbiBMaW4sIGphbWlu
X2xpbkBhc3BlZWR0ZWNoLmNvbQ0KDQpQbGVhc2UgcmVmZXIgdG8gdGhlIGF0dGFjaGVkIHNpZ25l
ZCBDQ0xBLg0KQW5kIHBsZWFzZSBoZWxwIHRvIGFwcHJvdmUgaXQsIHRoYW5rcy4NCg0KDQpCZXN0
IHdpc2hlcw0KDQpMdWtlIENoZW4NCihPKSA6ICs4ODYtMy01NzUxMTg1DQooTSkgOiArODg2LTkz
NS01OTItODkyDQo0RiwgTm8uMSxTZWMuIDMsR29uZ2RhbyA1dGggUm9hZCwgRWFzdCBEaXN0Liwg
SHNpbmNodSBDaXR5LCAzMDA2OSxUYWl3YW4sUi5PLkMuDQoNCg0KDQotLS0tLS0tLS0tIEZvcndh
cmRlZCBtZXNzYWdlIC0tLS0tLS0tLQ0KRnJvbTogTHVrZSBDaGVuIDxsdWtlX2NoZW5AYXNwZWVk
dGVjaC5jb20+DQpEYXRlOiBNb24sIE5vdiAyMywgMjAyMCBhdCAxMDoxNiBBTQ0KU3ViamVjdDog
UkU6IFNpZ25lZCBDTEEgZnJvbSBBU1BFRUQNClRvOiBCcmFkIEJpc2hvcCA8YnJhZGxleWJAZnV6
emllc3F1aXJyZWwuY29tPg0KQ2M6IG1hbmFnZXJAbGZwcm9qZWN0cy5vcmcgPG1hbmFnZXJAbGZw
cm9qZWN0cy5vcmc+LCBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcgPG9wZW5ibWNAbGlzdHMub3ps
YWJzLm9yZz4NCg0KDQpIaSBCcmFkDQpJIHdvdWxkIGxpa2UgdG8gdXBkYXRlIENDTEEuDQoNCkFT
UEVFRCBtb3ZlZCB0byBuZXcgb2ZmaWNlLCBzbyBJIGNoYW5nZWQgdGhlIG9mZmljZSBhZGRyZXNz
IGluIHRoaXMgQ0NMQS4NCkFuZCBJIGFsc28gYWRkZWQgYSBmZXcgQVNQRUVEIHRlYW0gbWVtYmVy
cyBpbiB0aGUgbGlzdC4NCkkgYW0gYWxzbyBhdHRhY2hpbmcgdGhlIGRvYyBmaWxlLCBzbyBpdCBp
cyBlYXN5IGZvciB5b3UgdG8gY29weS1wYXN0ZSB0aGUgZW1haWwgYWRkcmVzc2VzIG9mIG15IHRl
YW0gbWVtYmVycy4NCg0KUGxlYXNlIGhlbHAgdG8gYXBwcm92ZSBpdCwgdGhhbmtzLg0KDQoNCkJl
c3Qgd2lzaGVzDQoNCkx1a2UgQ2hlbg0KKE8pIDogKzg4Ni0zLTU3NTExODUNCihNKSA6ICs4ODYt
OTM1LTU5Mi04OTINCjRGLCBOby4xLFNlYy4gMyxHb25nZGFvIDV0aCBSb2FkLCBFYXN0IERpc3Qu
LCBIc2luY2h1IENpdHksIDMwMDY5LFRhaXdhbixSLk8uQy4NCg0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK2x1a2VfY2hlbj1hc3Bl
ZWR0ZWNoLmNvbUBsaXN0cy5vemxhYnMub3JnPg0KT24gQmVoYWxmIE9mIEJyYWQgQmlzaG9wDQpT
ZW50OiBXZWRuZXNkYXksIE5vdmVtYmVyIDI4LCAyMDE4IDk6MzIgUE0NClRvOiBMdWtlIENoZW4g
PGx1a2VfY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCkNjOiBtYW5hZ2VyQGxmcHJvamVjdHMub3JnOyBv
cGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBTaWduZWQgQ0xBIGZyb20gQVNQ
RUVEDQoNCg0KDQo+IE9uIE5vdiAyNiwgMjAxOCwgYXQgOTo1NCBQTSwgTHVrZSBDaGVuIDxsdWtl
X2NoZW5AYXNwZWVkdGVjaC5jb20+IHdyb3RlOg0KPg0KPiBIaSBTaXINCj4gSGVyZSBpcyB0aGUg
c2lnbmVkIENMQSBmcm9tIEFTUEVFRC4NCj4gUGxlYXNlIGhlbHAgdG8gYXBwcm92ZSBpdCwgdGhh
bmtzLg0KDQpUaGFua3MgTHVrZSEgIENDTEEgYWNjZXB0ZWQuDQoNCi1icmFkDQo=
