Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA16435B03
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 08:38:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZd9901RLz30BM
	for <lists+openbmc@lfdr.de>; Thu, 21 Oct 2021 17:38:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=AVLooYae;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=2a01:111:f400:febd::702;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chiawei_wang@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=AVLooYae; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sg2apc01on0702.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:febd::702])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZd8X2vrJz2xtD;
 Thu, 21 Oct 2021 17:38:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuadtQt/qxtOGV6GrpGRRiqG6D7dsr2c7NMD6PkMnfa1xoiLRsx60Lx5GazsJBFN3nckqgzEJVjjzMIzyVDs9KVrCqaoVos+9DCMIXQFIvF3cGaM0SWZt/bpn43FWHVcO024cHaGTdHq7M6uxmLQrG9CzHOjRRucLfY8v6RWMHxM7Hjb9iiEX+mXiBMLV3s78qVmjrQfAGeJ4yaOqobBRNo9T86YGCC5+HKRky+VGMZ1ll5yVE9ZLVUuwZlDkmDPZUGBXm4vD5k4rNfQ0BjPcAX1JFYvZ5laQ9DoGU01Dh4PxbhC2CHjMASH73dTxmuCJeHavFMF2kAlwMLHmHVNGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3q+NWxWeETyn/FWXclrbsogK42DV3CRgFMGWyfQDLmg=;
 b=cbU9AGXA/NJukYB2z46IzXFgHR/w4Xl5fWilJnvQ8QF1KCknRqWjzHAEFJhbJ3BxdhmEfZfK9lZVPaz1DKsXJUBxuid6btDU9dfItwEJEKINzJmbbURbs8L4K8cSOur/+GnAzYUXSYjuKHbqdBkdHuhAU59lxa23aaReMNyAuJY/dqDsyWMCSoIVnpHCjNqkBlBM9EwVA41eXugq17TEJQXLaviABmssT5ayA5VU7H01AVeJRESTM5bfsG9STx7N0NVq3V/qqngzBQ/qYx5VIF6k29/ysuSxXp/RCdF3ZEOfwh1f+cAFvf6L9V1smd1zyVys+V3LLcMBoX8QyR7/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3q+NWxWeETyn/FWXclrbsogK42DV3CRgFMGWyfQDLmg=;
 b=AVLooYaeHL/nPK7pvWBHVkfc84dGgsG7nNk0c+RXPYKyVMLBADcb/2vCi+7yTfKovN+bh4Spl9kMP189Egf7mdsGLMJARd6BWqK1ayoQ9OS71JB/lsZA9xzdYvDR+Ez775MZwTgjSzHFm65yYEmeG+ZPHafKigTdFAUzqJO94pX+vZpDtKAHzpctXKthD5iKKhvkX7x7rCJI7cYc4vsjL/CL+jDP3hAWv9NE9VPdtiYqzKYVKZUCc8+AUTz2ELmO+RywmD22bfDs3w1cOMLsBMyayfCdJs5BQD8w+zpu6j2Mpb/Y2ytdaPIQZr0jP1Zy46noawXFSoxYKd1M/DEvkA==
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com (2603:1096:203:b8::10)
 by HK0PR06MB3667.apcprd06.prod.outlook.com (2603:1096:203:ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Thu, 21 Oct
 2021 06:37:38 +0000
Received: from HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::f4aa:d005:b469:2a71]) by HK0PR06MB3779.apcprd06.prod.outlook.com
 ([fe80::f4aa:d005:b469:2a71%6]) with mapi id 15.20.4608.020; Thu, 21 Oct 2021
 06:37:38 +0000
From: ChiaWei Wang <chiawei_wang@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: RE: [PATCH v7 1/5] ARM: dts: aspeed: Drop reg-io-width from LPC nodes
Thread-Topic: [PATCH v7 1/5] ARM: dts: aspeed: Drop reg-io-width from LPC nodes
Thread-Index: AQHXs0fecSd6yr6yx06EH3I+ZmYC4KvIlUqAgBSN/wCAAADfYA==
Date: Thu, 21 Oct 2021 06:37:38 +0000
Message-ID: <HK0PR06MB3779F430883E60E7E47849BE91BF9@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210927023053.6728-1-chiawei_wang@aspeedtech.com>
 <20210927023053.6728-2-chiawei_wang@aspeedtech.com>
 <CACPK8Xc+9yFJn_pO1sAVQJu_FWkA1U9XnbB+TLYgfdbHi1TyaQ@mail.gmail.com>
 <CACPK8Xfj=wJBCX5ogyf02pLJsLrooVWBJ92GJ1E+jxQW5wiFEw@mail.gmail.com>
In-Reply-To: <CACPK8Xfj=wJBCX5ogyf02pLJsLrooVWBJ92GJ1E+jxQW5wiFEw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a314bfda-39f7-4123-8b19-08d9945d469a
x-ms-traffictypediagnostic: HK0PR06MB3667:
x-microsoft-antispam-prvs: <HK0PR06MB3667A560B348D4F1693A5FD591BF9@HK0PR06MB3667.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xd1j8v+ugPEQsSsXXAMqk5CAxXxWY2AXEXfkzcSjmol/IXpOxTeST/tDnFdwF6KLW8TjJFMP8NDauDQE21D0R6C4oBHKRdmvC38qi8i3ZFOHKKsNYJNo1SDYgx71qSJWmmISSV78MAl98hXUlDLwzlvnmUM16lxt0GjiYQOfwuV3sq+Q8hPgx7NJldSZoNkZg7FpvRs9RtgwZLoAq5BKtTqB1XcOq/x83IUSGCAzz2nfWFoDnboX9AUcYrtcssF8FHrjas9feNpFanjCZtY4pDIAMNlrJd7sKckj3oodWWluMn/marAJN5PhPQk/EfaJ5IDsoqHyCXcozNUgRyOyuJ3G31EWlyfljh3dVXj2mUfAdKVhMk12voSy4gTrQt5tY5bB2RNzJoV3I3j9JG/POfJUYydhE9Wx9ypD0KKDkRn8QMpbzbzm/sblpVi6Fc3EButPGPh+0jWvktAMhNvnMYBYYOT1+2pWXcdzpH0x6dyC7pFQIT6XbVmUEMSlNIHJKtqyzo2NfChoEre8q4k+ILC1RfCmSkMTKXBgZSptrc92gWGAI8UaAEgqW1Hf6twrCfyS2vl+sKLZ8zBg3qwy3vfc5RC59pV0+5fedIK72dxucMBlULlHi3H0G0q/0ITOq2d6FmCXvNCaUag3enRAb1OchjiMdxkJtL3pA/cwJsHl8ftoEvA/EU0GLzn1gvhMp9+lp9jla3k4tft0hu/gZw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3779.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(376002)(136003)(39840400004)(366004)(7696005)(2906002)(122000001)(64756008)(4326008)(186003)(38070700005)(66446008)(66946007)(52536014)(66476007)(66556008)(8936002)(86362001)(110136005)(26005)(9686003)(8676002)(508600001)(5660300002)(76116006)(83380400001)(38100700002)(71200400001)(6506007)(33656002)(54906003)(316002)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1I3a1NsUFl5NEtMNm5BOU1tMVh0RkxQU2RTWWR5bCtZWGpueUpWLytwbm9F?=
 =?utf-8?B?cGFpbGwwWktzQldsbTBBazlTRFpQR2NnclJ3TVd3ZVdIQVFtSHNZeGp4M1pM?=
 =?utf-8?B?bk1Jdk9wNEx1VjJjdUplRlUrV0JjempkWmpRWkYvV0kxOGtQcUdxWHFJVktx?=
 =?utf-8?B?QWE1N3ZXREdibCtVWUEwMU5TLzBhWExHNHBjZGJEODRtOTF1cmozOC90Rlc0?=
 =?utf-8?B?akJLNE9QeGZudk52cFAyUzBlM3RxSjU4RlRBODd2MlNPODVaTzFNeFFuOXpV?=
 =?utf-8?B?UkdGMDZxUit6T1kzZGpFRkpmQVd3ektxcSs5aDhtL3JGWStWeGtFQW9IOThZ?=
 =?utf-8?B?MWdIV1pJZEJGdGtwU2dGM1QwV2NIa3ZWVE15ZFZITWU3b09YcVIrZXdINS9T?=
 =?utf-8?B?R2UyWGxBUnRBcXRTQ1VmbWhJeWRjeUJ3SG9iSTdLWXpxTUVpRDdYenlSUWVl?=
 =?utf-8?B?cGRSem1aRGUrem9YWXIyUCtlSGJIanl3Ykc1Qng3cDcwazJHMXpHL2lKY1V2?=
 =?utf-8?B?blU5V25yWkFBNjlMclZtQWFnVVJONDNQTVpNb3p1Sk9zNTdXajNzSzlmeFdP?=
 =?utf-8?B?U1RmbEhGOTc0enV5a2h3b1hmWWFUR0h0NFpwamU0dGlwaFZMYXhiUDRhOFZq?=
 =?utf-8?B?SngxTWg5YXB3KzFSTFM2VUdYNTNHWFNTckFqNFd6bWJOTUhmUTRrazQycXhG?=
 =?utf-8?B?UmdXZVdQNHRDcmQ4dEUzWGk4OGRLQy8rVUtuZU1xNUdXeER1YVhnb0VWS1li?=
 =?utf-8?B?SmIwVWJ2MWtrQWlub1RDdmczczhRNTh2ZXBpUzNYVjNzSUk3UHhwc1BWVWJF?=
 =?utf-8?B?NVJ5cEtEdTFJTWhjSFU1Yjc4Y2tRc25zc0NvaVNxZXFwb1gxODB5NXJ5cTN4?=
 =?utf-8?B?UjA2RyszNmY3aUloYUtPeFRpSUdZZVZEaFVOTEk4RlN6TkFtOGp5Tzk1K1dR?=
 =?utf-8?B?bzRQSTNrajVRVThFNHliM2lmaUhYdVhvcFA1WklDRWZ3bXVyUU15dURyeFJJ?=
 =?utf-8?B?SndFcVE3YThrZ2FJUXFhNjF6RnRHUllKMUlSQXgycnhzTmZvRnZyQTQxbEtl?=
 =?utf-8?B?Tk9OV0tMWFpYeXljekZJeFJ6Z3R0aVdkVVVibUQyUnl2T09ZMXA3cGdHODNY?=
 =?utf-8?B?THcycytReHluTVVEbVd5Zkp6SURzakFNaTh2WlowVXNCR3dCQ09GZ0NRYUla?=
 =?utf-8?B?cldEd2NaSVhJUUs1UTNGeGI3RnFVemMrdWRUNWx2ZzFuYmhGSGtUS211VUlG?=
 =?utf-8?B?Z1A2ZUIrSUZST2g0RzY0R2h5UFA3ZnFJUzBKcXJmNC8vTjlxRWpmUlBlT0NT?=
 =?utf-8?B?ZENFMjNVaXI4cXFCdzVNbzQyandkUmoveDg4VFd0L0N1UmxqTnVEMndWTEIw?=
 =?utf-8?B?VzhWNklPWlZLa05jS0h5Q3prWjNrN3pyRmJ0dzI0L0JTbTFWaUozdUtSeHgy?=
 =?utf-8?B?UmFLbUJJcXRMR0VUS0QzQnQ0Yjc4LzdRZVdqZUQ1alppSEczUWY5L1hJc1Vt?=
 =?utf-8?B?bVhHT1Z3RnBwNWV3MEE2ZWNhT1dyMVV4Q0t1dUFEblc0c2dLUU83RzZNc1ln?=
 =?utf-8?B?WUQrQUpSSC9hY0thTzZ5UUFIc1VoOEhEU2hMR2oyaHJYaHFJcXVRMzZmTjZE?=
 =?utf-8?B?cjByOGUzTFd4cDNTeVJhcUtscVFqOGh3NHBZNnRYTlRIR0g3a29hdjA3dHZ4?=
 =?utf-8?B?QmMxWTZvNStwKzBSWnphcUw2bTRBYnJlUTdoUUJaQXNEMjBvME44aDFnN25I?=
 =?utf-8?B?MkNvTGp4NS9hK2ZkY3d4R1BTNG5kVDBUemx4VzBNdFVNVW9PSWo4aS9mWk8v?=
 =?utf-8?B?N2d1NjdVMk1uZ0hZQmNhV0wyNERXSzk4cWpGYWQydnVhWWQzVWFsai8zRE5H?=
 =?utf-8?B?ZW1VYnd6VWtHRGdSaFVsUzhiQlkvQ29zRmhUbk0xdG4yZXhxa2crQm9tR0w4?=
 =?utf-8?Q?T6ertIsInxaVbjM7uVuvRrmdBF735VmZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3779.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a314bfda-39f7-4123-8b19-08d9945d469a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2021 06:37:38.5969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: chiawei_wang@aspeedtech.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB3667
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Oskar Senft <osk@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PiBGcm9tOiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1Pg0KPiBTZW50OiBUaHVyc2RheSwg
T2N0b2JlciAyMSwgMjAyMSAyOjI5IFBNDQo+IA0KPiBPbiBGcmksIDggT2N0IDIwMjEgYXQgMDQ6
MzUsIEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+IHdyb3RlOg0KPiA+DQo+ID4gT24gTW9u
LCAyNyBTZXB0IDIwMjEgYXQgMDI6MzEsIENoaWEtV2VpIFdhbmcNCj4gPiA8Y2hpYXdlaV93YW5n
QGFzcGVlZHRlY2guY29tPiB3cm90ZToNCj4gPiA+DQo+ID4gPiBUaGUgJ3JlZy1pby13aWR0aCcg
cHJvcGVydGllcyBhcmUgbm90IHVzZWQgYnkgTFBDIGRyaXZlcnMgbm9yDQo+ID4gPiBkb2N1bWVu
dGVkIGFzIHBhcnQgb2YgYmluZGluZ3MuIFRoZXJlZm9yZSBkcm9wIHRoZW0uDQo+ID4NCj4gPiBJ
IGFzc3VtZSB0aGV5IGFyZSB0aGVyZSBkdWUgdG8gdGhlIGxwYyBoYXZpbmcgYSAnc3lzY29uJyBj
b21wYXRpYmxlLg0KPiA+IFRIZXkgYXJlIGRvY3VtZW50ZWQgaW4gdGhlIHN5c2NvbiBiaW5kaW5n
czoNCj4gPg0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3lzY29u
LnlhbWwNCj4gPg0KPiA+IEFuZHJldywgZG8geW91IGhhdmUgYW55IGNvbW1lbnRzPw0KPiANCj4g
QW5kcmV3IGluZGljYXRlZCB0byBtZSB0aGF0IGhlIGFncmVlZCB3aXRoIG15IG9ic2VydmF0aW9u
OiB0aGUgcHJvcGVydGllcw0KPiBzaG91bGQgYmUgcHJlc2VudCBhcyB0aGV5IGFyZSB1c2VkIGJ5
IHRoZSByZWdtYXAvc3lzY29uLg0KDQpUaGFua3MuIFNoYWxsIHdlIGp1c3QgZHJvcCB0aGlzIG9u
ZSBhbmQgbW92ZSBvbiB3aXRoIHRoZSByZXN0IHBhdGNoZXM/DQpIb3dldmVyLCBsaWtlIFJvYiBt
ZW50aW9uZWQsIHdoZW4gZG9pbmcgJ21ha2UgZHRic19jaGVjaycsIHRoZXJlIGlzIGEgd2Fybmlu
ZzoNCg0KL2J1aWxkcy9yb2JoZXJyaW5nL2xpbnV4LWR0LXJldmlldy9hcmNoL2FybS9ib290L2R0
cy9hc3BlZWQtYXN0MjUwMC1ldmIuZHQueWFtbDoNCmxwY0AxZTc4OTAwMDogJ2lidEAxNDAnLCAn
a2NzQDExNCcsICdrY3NAMjQnLCAna2NzQDI4JywgJ2tjc0AyYycsICdsaGNAYTAnLCAncmVnLWlv
LXdpZHRoJyBkbyBub3QgbWF0Y2ggYW55IG9mIHRoZSByZWdleGVzOg0KJ15scGMtY3RybEBbMC05
YS1mXSskJywgJ15scGMtc25vb3BAWzAtOWEtZl0rJCcsICdecmVzZXQtY29udHJvbGxlckBbMC05
YS1mXSskJywgJ3BpbmN0cmwtWzAtOV0rJw0KRnJvbSBzY2hlbWE6IC9idWlsZHMvcm9iaGVycmlu
Zy9saW51eC1kdC1yZXZpZXcvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9h
c3BlZWQtbHBjLnlhbWwNCg0KQXMgcGFydCBvZiB0aGlzIHNlcmllcyBoYXMgYmVlbiBhcHBsaWVk
LCBtYXliZSB3ZSBjYW4gZml4IHRoaXMgbGF0ZXI/DQoNClJlZ2FyZHMsDQpDaGlhd2VpDQoNCj4g
DQo+ID4NCj4gPiA+DQo+ID4gPiBUaGlzIGlzIGluIHByZXBhcmF0aW9uIHRvIG1vdmUgYXNwZWVk
LWxwYy50eHQgdG8gWUFNTCBzY2hlbWEuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hp
YS1XZWkgV2FuZyA8Y2hpYXdlaV93YW5nQGFzcGVlZHRlY2guY29tPg0KPiA+ID4gLS0tDQo+ID4g
PiAgYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc0LmR0c2kgfCAxIC0NCj4gPiA+IGFyY2gvYXJt
L2Jvb3QvZHRzL2FzcGVlZC1nNS5kdHNpIHwgMSAtDQo+ID4gPiBhcmNoL2FybS9ib290L2R0cy9h
c3BlZWQtZzYuZHRzaSB8IDEgLQ0KPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMyBkZWxldGlvbnMo
LSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc0
LmR0c2kNCj4gPiA+IGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc0LmR0c2kNCj4gPiA+IGlu
ZGV4IGM1YWViM2NmM2EwOS4uNDVhMjVlYjRiYWE0IDEwMDY0NA0KPiA+ID4gLS0tIGEvYXJjaC9h
cm0vYm9vdC9kdHMvYXNwZWVkLWc0LmR0c2kNCj4gPiA+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRz
L2FzcGVlZC1nNC5kdHNpDQo+ID4gPiBAQCAtMzQ1LDcgKzM0NSw2IEBADQo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICBscGM6IGxwY0AxZTc4OTAwMCB7DQo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPQ0KPiAiYXNwZWVkLGFzdDI0MDAtbHBjLXYy
IiwgInNpbXBsZS1tZmQiLCAic3lzY29uIjsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmVnID0gPDB4MWU3ODkwMDAgMHgxMDAwPjsNCj4gPiA+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgcmVnLWlvLXdpZHRoID0gPDQ+Ow0KPiA+ID4NCj4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47DQo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDE+OyBkaWZmIC0t
Z2l0DQo+ID4gPiBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNS5kdHNpDQo+ID4gPiBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1nNS5kdHNpDQo+ID4gPiBpbmRleCA3M2NhMWVjNmZjMjQu
LjhlMWQwMGQ4NDQ1ZSAxMDA2NDQNCj4gPiA+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2FzcGVl
ZC1nNS5kdHNpDQo+ID4gPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzUuZHRzaQ0K
PiA+ID4gQEAgLTQzNiw3ICs0MzYsNiBAQA0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
bHBjOiBscGNAMWU3ODkwMDAgew0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb21wYXRpYmxlID0NCj4gImFzcGVlZCxhc3QyNTAwLWxwYy12MiIsICJzaW1wbGUtbWZkIiwg
InN5c2NvbiI7DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDww
eDFlNzg5MDAwIDB4MTAwMD47DQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJlZy1pby13aWR0aCA9IDw0PjsNCj4gPiA+DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsgZGlmZiAtLWdpdA0KPiA+ID4gYS9hcmNo
L2FybS9ib290L2R0cy9hc3BlZWQtZzYuZHRzaQ0KPiA+ID4gYi9hcmNoL2FybS9ib290L2R0cy9h
c3BlZWQtZzYuZHRzaQ0KPiA+ID4gaW5kZXggMWI0N2JlMTcwNGY4Li4wZDFhYWU2ODg3Y2QgMTAw
NjQ0DQo+ID4gPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtZzYuZHRzaQ0KPiA+ID4g
KysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc2LmR0c2kNCj4gPiA+IEBAIC00OTAsNyAr
NDkwLDYgQEANCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGxwYzogbHBjQDFlNzg5MDAw
IHsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9DQo+
ICJhc3BlZWQsYXN0MjYwMC1scGMtdjIiLCAic2ltcGxlLW1mZCIsICJzeXNjb24iOw0KPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgxZTc4OTAwMCAweDEwMDA+
Ow0KPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWctaW8td2lkdGggPSA8
ND47DQo+ID4gPg0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVz
cy1jZWxscyA9IDwxPjsNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI3Np
emUtY2VsbHMgPSA8MT47DQo+ID4gPiAtLQ0KPiA+ID4gMi4xNy4xDQo+ID4gPg0K
