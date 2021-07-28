Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DECF53D859A
	for <lists+openbmc@lfdr.de>; Wed, 28 Jul 2021 03:47:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZGk269qHz3bWh
	for <lists+openbmc@lfdr.de>; Wed, 28 Jul 2021 11:47:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com header.a=rsa-sha256 header.s=selector1 header.b=PF/sYk+/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=40.107.131.132;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=luke_chen@aspeedtech.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aspeedtech.com header.i=@aspeedtech.com
 header.a=rsa-sha256 header.s=selector1 header.b=PF/sYk+/; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310132.outbound.protection.outlook.com [40.107.131.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZGjd3cyKz2ysv
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jul 2021 11:46:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYQ4OG/KN4jJKKmTQE1DHwbPPOap6PJRrvyuJnxjTJlPuPFl8aBUY06WSKGnDMsF8Uk7zvFB36uHb+LNpQSO2BvbELPrRcuQo4s+p3I14OKdZOluKivDzXPd2hSPzniF65YCMuWaT6HVHwtA7QAXJWg3u7srod4tClOqAUKCaks1eySksnCHtmSX6T9CKHFnvo59Q+HCC6cmTXcQQifcdmX+inaTtr3MhrWR+mWIJqIPTEazpCzJfIQ6kF2KE5fmTjayei3HjsymT7/XeYfo5EWy+BCcLqi0cFSlhUYTqlE0g1ER7vnAFOIpzw14MOSEDqpiuknhx0Q125P/VEAQcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0thbTaYIPCaMZC4iYC0IhQPL/WDUoM3YPt4xW0GJts=;
 b=MDKJvg2/shtqGEFm7UF2nTbVtODoN1mVINweGAqrZI1gYjUetUZLlCkwQyGkK9j+QWU9BH5L+91mqqwPULxap6EtR2stKwvrtdcqsgTfYZPvjBXg+zblDF9gmzWDtldDwYQw5KGm1PHnUrUSC4N18JSE7KYuWZBDOtPOh/x6F4R9FFh9DYmcKnN0tZVUYDPoo9CICFa8N47vzW8pXV1SLFOE8Csp3rQP1p+wXKb8wAOkXzoGsVvqTXutAPLWTy3lwH9v72g9jpoOaIchqEI/vHiw481JC2jCuHiJGe6dcv7Mg1UgbWgU0Pzz+JeJ7d2QCGRbCx4Pqn0UAl6Sm2q+VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0thbTaYIPCaMZC4iYC0IhQPL/WDUoM3YPt4xW0GJts=;
 b=PF/sYk+/d76/96lfKUSEu4+OcEF9+DlEMmUZpmRwkzO95+z0w6+btjghp9azkPUZWZmE7Z4cFc52xfEoqp6hjYOG/RO7xZXRsdnfOpSoV8/HOOC6mHbpXTDYYl3cuQvbnVliJRbz1Tp9Jlqrug8uWKdbrBxwnrKA4fDXrhhSmPbW5tM3ZZ09mvkgjLWlFSVdFF+FdBf8MNRhUIwdtjdbfuDcycZyrxVw2N/dEO6s0/2fvOZQJuiKGdciLfiPOwK6H/aM2nULkanCS8OcaPzxXuije0oYGUsjPMh4SCrejHQ5ToMj4k9z95nGGsmzxz9C01bAMLfvfMe4sfAf2Qe61g==
Received: from HK0PR06MB2321.apcprd06.prod.outlook.com (2603:1096:203:49::11)
 by HK2PR0601MB1969.apcprd06.prod.outlook.com (2603:1096:202:6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Wed, 28 Jul
 2021 01:46:24 +0000
Received: from HK0PR06MB2321.apcprd06.prod.outlook.com
 ([fe80::10d4:b8ce:9878:23bc]) by HK0PR06MB2321.apcprd06.prod.outlook.com
 ([fe80::10d4:b8ce:9878:23bc%5]) with mapi id 15.20.4373.018; Wed, 28 Jul 2021
 01:46:24 +0000
From: Luke Chen <luke_chen@aspeedtech.com>
To: krtaylor <kurt.r.taylor@gmail.com>, "bradleyb@fuzziesquirrel.com"
 <bradleyb@fuzziesquirrel.com>
Subject: RE: Signed CLA from ASPEED
Thread-Topic: Signed CLA from ASPEED
Thread-Index: AdSF/BDVNQADm2VBRuejwbddN04pK6tWXgwg2qORTID//0LOwA==
Date: Wed, 28 Jul 2021 01:46:24 +0000
Message-ID: <HK0PR06MB2321A8B7BED54402A7FB7DD7E1EA9@HK0PR06MB2321.apcprd06.prod.outlook.com>
References: <623110cb8acb4bbc99c43c47b37f5457@TWMBX01.aspeed.com>
 <9C742B6B-8604-4EC1-9AE8-98844ACB557D@fuzziesquirrel.com>
 <HK0PR06MB23218108A08BC07208A93909E1FF0@HK0PR06MB2321.apcprd06.prod.outlook.com>
 <CAN9Jwz375dV0fFbBaE_SK6Cw8t0pyC-j-fPFuK5tm_EATWoFmA@mail.gmail.com>
 <HK0PR06MB23215E570FE7381C47EEA024E1E99@HK0PR06MB2321.apcprd06.prod.outlook.com>
 <791d8a3c-3bcc-8310-69ab-6b7917bdf30c@gmail.com>
In-Reply-To: <791d8a3c-3bcc-8310-69ab-6b7917bdf30c@gmail.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67ce00cb-a3cc-49a3-a906-08d951698252
x-ms-traffictypediagnostic: HK2PR0601MB1969:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR0601MB19696C98ADD6DC86B800B051E1EA9@HK2PR0601MB1969.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y8OXttxj/zWoZcRMO1RNelOge/gzXCBz1xJeJRxzlCbu6tMDar+ayTEfkum35O/0tTIbi9pvVXdxg2dFeh9zRXXS3+6R3cC2kp8Eb4rUHdTnryRIqyEXpJBPST5sD4N2KnFWcj/RKsZ6BMoFKFm392l2WdhW5ypkye6JysriU+iM2vvews/zHg33iRXm2zkKuo3Uhfa+sDppshDGku7Nwb2lfMYg7aeQliaQmAoFWDvPRxiXTndl2WY9nGdne1qB/j9RuP0U1mJztt8+gTmdT+8rS11T9SCnnNayrb7Hq8PJK7c2Q1rKrc/nqD+eNEfLuJB9CrbJmEuEvErWC82i1ik0Ey7LeWd1CHHjG17iFZ6nJwgOY4P3g2Vz080NJoz1miPoH4ASiG9vEcDeKPFKy3cOoXDKQ2TUB2CAzuPJoZSAN1Pu8H2tG5y62vfpvUMNmdJSeK6NP1rRHeLdCablyJ+FGVtL1+x+TpD6WkVDsNNrpDj5W6u5yEhSckEqz1Xfiv2dJZjxDsH1pC6hz9ZQ6Uiv505wbd65cRN6qRMdjsJrAMP2DDIwFHGI2rYwvuQnCmeTbb7eTBNo7KwDsPMedWKPf/Ly9whb3JULZsiiiqN/vqg8kRVbrE8P47cQmhXWZjFRE6IyiawCnU1Vq1te3qI2uz25v0E70xERrXttWAY9Wv+U91NcDxbThsAf0R3mueCXmYroi7iNpMymjT/oKg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB2321.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39830400003)(366004)(376002)(136003)(396003)(346002)(3480700007)(122000001)(38100700002)(33656002)(316002)(38070700005)(76116006)(26005)(2906002)(52536014)(5660300002)(55016002)(9686003)(8936002)(7696005)(83380400001)(478600001)(66946007)(66556008)(53546011)(6506007)(71200400001)(66446008)(110136005)(66476007)(64756008)(4326008)(54906003)(8676002)(86362001)(107886003)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUwrVTRwc1lITkkzL3FGOUM2OFN5SndZOVcycm5DaTV4RGh1MlE5eEpTNDJm?=
 =?utf-8?B?QStTVkxVTUlXRGJBTDJtMEhXTGljRFFtQ2MrMlNiY3NIL0hqZ2xTQXFVQ0hX?=
 =?utf-8?B?ODdkZVNMN1FuaHVEQnNMUmRYSUJMVVVUc3I4Ri9TajRpcGhSM1c1RVM5WkV5?=
 =?utf-8?B?dU95aWwzVmRyQ3ZZVllac3RkUUNlcGd1d3A3bFlhK2I1TzN4bkhGZy9CZmQy?=
 =?utf-8?B?eGxqM0UwRDNzbTJ6K0FicnFtcnR5MUIrVzVnd242dGtPWERHdnVta3RCYnUw?=
 =?utf-8?B?eEk0RE5nYVZIM2s1aGg1T09BSGxaSDFYd1E3aFdXTS9SN2NkMzJoQ29nUnk4?=
 =?utf-8?B?SGI3R2NXWis2d2xVeDExalNGdVAvS3FqaEtsZmxXMWhtTjEyNXpBbWdRR3Bk?=
 =?utf-8?B?ZEdlR3drNS9UN0hnUkRVU2FEMktDaFZKT3RBeUdoMUhlWmM1OVZONXdibm9j?=
 =?utf-8?B?c0lPTTNZcUhFKzZUQUtEUFN0TTdaMmJkQ1RoQVgxRDg1UVFPaGdRUWd6dmVu?=
 =?utf-8?B?VG5qcjg3TnJCYmlaa0dyczVpZ1NxN0xvRUN4YVFGYU9JMG1rSFpmaXpORUsw?=
 =?utf-8?B?WldXZ29MOW9kQnc1cGVSRjJoUnZPc29seW5CbUF0T21veDIyWS9uMk16QzAy?=
 =?utf-8?B?SUJ0N0ZuSGF5MVlSSU1xR3Z5VTNzYVhwWURmYUlUMTJXOERuc0ZpdGU3ME5C?=
 =?utf-8?B?SER5OHVrcC9ZYThhRlZId1dYVkpmNDRhMWJSSXpUU1VidE5oNFJGbXpKcFNP?=
 =?utf-8?B?S3N0MkREd3pRcjJmVVE4ZTJnMmh2NUk0bE14NlNOUkIwc2VNbFBEbUV1UWdx?=
 =?utf-8?B?ME95bElmTGZuZVdWSnpnK0g3WHluQlc0YTJHWGh6UXB3ZVNSTFYyaFF0aEFW?=
 =?utf-8?B?Sm4vcTJJUU9JV2JiSFNmbFVhL3BESWMrT1JBS2JGR0N0aHdoSXVVSzBJWnUw?=
 =?utf-8?B?SEQ1cVQ5SWh0L2VyTnJNbXhydk5ZLy9KV2tCZmMrbVNBQUkxZEMxbWkwSmQz?=
 =?utf-8?B?TGRqVlIyZ0hUaFN3UjVDWk02dklFYkdoUkpzWHFmL2FqZFZVOVRjNVpWdFlr?=
 =?utf-8?B?bXh3cUVLR1Q5aktMTTJlK2wxeHZjM211NkJXTjRZWWhTbkhiSGZ3MHBIQjkw?=
 =?utf-8?B?Y1lkaklUeGduRGRoZWRIdVdrM1BMR0U0NThTY2RSa0Z3dnBUNXJiVWJ1Y2RZ?=
 =?utf-8?B?V0ZITmRyMC9HSE9xOFlERWk0Nmc4eXd6bG1Wbk1jWUhsWXBxeURwZ3VEeEVR?=
 =?utf-8?B?WG1IYkxsQ3EyRm9ub09iR3lVa3Z1dXVuM21vTW9YZjVlU2hHMnhuTGFnQ09R?=
 =?utf-8?B?NzFIeWRmTjBhb2ZtN2RGalZMc1VQbzBSOGxKalo5K0U3MnovTUkrWmVNUzYv?=
 =?utf-8?B?b3dJMEVVNCtRWGlhTTFZL3N0aEhPNTNzK3VkNnp0WXJaZHVZU21WWlBGalUr?=
 =?utf-8?B?Mmw3YWErQUcrOTcvS3FkNGY5VW1zdGlqcTg3VHpmT1NyclNUWjVtSDltMTk5?=
 =?utf-8?B?R2llM3JLemZ0ZWNTYnhUcmhpeW1jRGlDOVlyM1RvdWxqenF0WC85U3BmWGZW?=
 =?utf-8?B?QU91d2F6MlNNYmUxRFVJSjBjWS9JRk8zV0N0Q2VDSTdseXBiWGRmTEdWMGs2?=
 =?utf-8?B?SU4rVTlxUG94MnArT0NtTVMxQmNGaE93RDhlVFluN2NJLzQ5ZEtKR2M3cSti?=
 =?utf-8?B?NzQ5dDY3dGIwc0l1UWZNNFJrNlJJSWg5dU50Q04rYXp5dWhuMEROb0lsaXdn?=
 =?utf-8?Q?ngMKhyTxrZEeEYAI56/Wtt0ys9CKg8btXrP5kRk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB2321.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ce00cb-a3cc-49a3-a906-08d951698252
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 01:46:24.7528 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nIaEPCMSCwHiWTgZ49KXzJLi7qAL43GWbsa3fmLKeQ75k9DCO6pNvrVmfoU2onn0LYmMc4V65icy2wYm1WDVFvG7KKOztq3bGynEgZ8AU6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0601MB1969
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

SGkgS3VydA0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIQ0KDQoNCkJlc3Qgd2lzaGVzDQoNCkx1a2Ug
Q2hlbg0KKE8pIDogKzg4Ni0zLTU3NTExODUNCihNKSA6ICs4ODYtOTM1LTU5Mi04OTINCjRGLCBO
by4xLFNlYy4gMyxHb25nZGFvIDV0aCBSb2FkLCBFYXN0IERpc3QuLA0KSHNpbmNodSBDaXR5LCAz
MDA2OSxUYWl3YW4sUi5PLkMuDQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IGtydGF5bG9yIDxrdXJ0LnIudGF5bG9yQGdtYWlsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBKdWx5
IDI3LCAyMDIxIDEwOjI5IFBNDQpUbzogTHVrZSBDaGVuIDxsdWtlX2NoZW5AYXNwZWVkdGVjaC5j
b20+OyBicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20NCkNjOiBtYW5hZ2VyQGxmcHJvamVjdHMu
b3JnOyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IFRyb3kgTGVlIDx0cm95X2xlZUBhc3BlZWR0
ZWNoLmNvbT4NClN1YmplY3Q6IFJlOiBTaWduZWQgQ0xBIGZyb20gQVNQRUVEDQoNCk9uIDcvMjcv
MjEgMTo0MyBBTSwgTHVrZSBDaGVuIHdyb3RlOg0KPiBIaSBNYW5hZ2VyLCBCcmFkDQo+IA0KPiBJ
IHdvdWxkIGxpa2UgdG8gdXBkYXRlIENDTEEsIEkgYWRkZWQgMiBtb3JlIHRlYW0gbWVtYmVycyBp
bnRvIHRoZSBDQ0xBLg0KPiBTdGV2ZW4gTGVlLCBzdGV2ZW5fbGVlQGFzcGVlZHRlY2guY29tDQo+
IEphbWluIExpbiwgamFtaW5fbGluQGFzcGVlZHRlY2guY29tDQo+IA0KPiBQbGVhc2UgcmVmZXIg
dG8gdGhlIGF0dGFjaGVkIHNpZ25lZCBDQ0xBLg0KPiBBbmQgcGxlYXNlIGhlbHAgdG8gYXBwcm92
ZSBpdCwgdGhhbmtzLg0KDQpIaSBMdWtlLCB5b3VyIENDTEEgaGFzIGJlZW4gYWNjZXB0ZWQuIFRo
YW5rcyBmb3Iga2VlcGluZyBpdCB1cGRhdGVkIQ0KDQpLdXJ0IFRheWxvciAoa3J0YXlsb3IpDQoN
Cj4gDQo+IA0KPiBCZXN0IHdpc2hlcw0KPiANCj4gTHVrZSBDaGVuDQo+IChPKSA6ICs4ODYtMy01
NzUxMTg1DQo+IChNKSA6ICs4ODYtOTM1LTU5Mi04OTINCj4gNEYsIE5vLjEsU2VjLiAzLEdvbmdk
YW8gNXRoIFJvYWQsIEVhc3QgRGlzdC4sIEhzaW5jaHUgQ2l0eSwgDQo+IDMwMDY5LFRhaXdhbixS
Lk8uQy4NCj4gDQo+IA0KPiANCj4gLS0tLS0tLS0tLSBGb3J3YXJkZWQgbWVzc2FnZSAtLS0tLS0t
LS0NCj4gRnJvbTogTHVrZSBDaGVuIDxsdWtlX2NoZW5AYXNwZWVkdGVjaC5jb20+DQo+IERhdGU6
IE1vbiwgTm92IDIzLCAyMDIwIGF0IDEwOjE2IEFNDQo+IFN1YmplY3Q6IFJFOiBTaWduZWQgQ0xB
IGZyb20gQVNQRUVEDQo+IFRvOiBCcmFkIEJpc2hvcCA8YnJhZGxleWJAZnV6emllc3F1aXJyZWwu
Y29tPg0KPiBDYzogbWFuYWdlckBsZnByb2plY3RzLm9yZyA8bWFuYWdlckBsZnByb2plY3RzLm9y
Zz4sIA0KPiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9y
Zz4NCj4gDQo+IA0KPiBIaSBCcmFkDQo+IEkgd291bGQgbGlrZSB0byB1cGRhdGUgQ0NMQS4NCj4g
DQo+IEFTUEVFRCBtb3ZlZCB0byBuZXcgb2ZmaWNlLCBzbyBJIGNoYW5nZWQgdGhlIG9mZmljZSBh
ZGRyZXNzIGluIHRoaXMgQ0NMQS4NCj4gQW5kIEkgYWxzbyBhZGRlZCBhIGZldyBBU1BFRUQgdGVh
bSBtZW1iZXJzIGluIHRoZSBsaXN0Lg0KPiBJIGFtIGFsc28gYXR0YWNoaW5nIHRoZSBkb2MgZmls
ZSwgc28gaXQgaXMgZWFzeSBmb3IgeW91IHRvIGNvcHktcGFzdGUgdGhlIGVtYWlsIGFkZHJlc3Nl
cyBvZiBteSB0ZWFtIG1lbWJlcnMuDQo+IA0KPiBQbGVhc2UgaGVscCB0byBhcHByb3ZlIGl0LCB0
aGFua3MuDQo+IA0KPiANCj4gQmVzdCB3aXNoZXMNCj4gDQo+IEx1a2UgQ2hlbg0KPiAoTykgOiAr
ODg2LTMtNTc1MTE4NQ0KPiAoTSkgOiArODg2LTkzNS01OTItODkyDQo+IDRGLCBOby4xLFNlYy4g
MyxHb25nZGFvIDV0aCBSb2FkLCBFYXN0IERpc3QuLCBIc2luY2h1IENpdHksIDMwMDY5LFRhaXdh
bixSLk8uQy4NCj4gDQo+IA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBv
cGVuYm1jIA0KPiA8b3BlbmJtYy1ib3VuY2VzK2x1a2VfY2hlbj1hc3BlZWR0ZWNoLmNvbUBsaXN0
cy5vemxhYnMub3JnPg0KPiBPbiBCZWhhbGYgT2YgQnJhZCBCaXNob3ANCj4gU2VudDogV2VkbmVz
ZGF5LCBOb3ZlbWJlciAyOCwgMjAxOCA5OjMyIFBNDQo+IFRvOiBMdWtlIENoZW4gPGx1a2VfY2hl
bkBhc3BlZWR0ZWNoLmNvbT4NCj4gQ2M6IG1hbmFnZXJAbGZwcm9qZWN0cy5vcmc7IG9wZW5ibWNA
bGlzdHMub3psYWJzLm9yZw0KPiBTdWJqZWN0OiBSZTogU2lnbmVkIENMQSBmcm9tIEFTUEVFRA0K
PiANCj4gDQo+IA0KPj4gT24gTm92IDI2LCAyMDE4LCBhdCA5OjU0IFBNLCBMdWtlIENoZW4gPGx1
a2VfY2hlbkBhc3BlZWR0ZWNoLmNvbT4gd3JvdGU6DQo+Pg0KPj4gSGkgU2lyDQo+PiBIZXJlIGlz
IHRoZSBzaWduZWQgQ0xBIGZyb20gQVNQRUVELg0KPj4gUGxlYXNlIGhlbHAgdG8gYXBwcm92ZSBp
dCwgdGhhbmtzLg0KPiANCj4gVGhhbmtzIEx1a2UhICBDQ0xBIGFjY2VwdGVkLg0KPiANCj4gLWJy
YWQNCj4gDQoNCg==
