Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DE34949BC
	for <lists+openbmc@lfdr.de>; Thu, 20 Jan 2022 09:43:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfbdS5KYDz30Qt
	for <lists+openbmc@lfdr.de>; Thu, 20 Jan 2022 19:43:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=Ue9Nwo3e;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=2a01:111:f400:feab::719;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=Ue9Nwo3e; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::719])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jfbd01YMnz2xXs
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jan 2022 19:43:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecHfuRe9rvZ0puA3EGJ1CTkg12Ff6wYAKtx2zXjymyPNtE4H7NFDV8xMskoG1+5GfTc6nTzmgmcTDEACpMOFExavQZE6LSX8cbV2Gupg2/XNQBZZRe5R5lEYKrCesqDKPucUNj36epCfNkxD0NvLJ0mxa4F6I+QpMX54PDiGjFwvIsdDjMKsdNWhbQZNyOLdIVcyGXo2V7InYlaSHgEiekpNIkP2ByVnxug81A2ecp4AT+es2j1sVdWP07OuDoTfbLzfUXmFKHVjZ9gv7cvu1agL3uNx/nLYZzDkI2mPjb/wEQD+QObVdbIFT746D3xH4MxpqQcOiqt31pw3tg3iqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzTh/oN0nXQcDaCz2NIwMFLSqALKithvHGs2vw+bqSI=;
 b=GaF/r68kou7994qjWRKGwaTSjTiyeA1Zeok3M7A+VsksF9GfgC+/MCUr4xGY+pe2K2mpcR+63gOYY2433n9f712d7+Oh/ZuVxOtGgGDENXHO3+Weu75buri/2iaUdw3843AY0yIcmMcpiB+q/5zkAT8yUkuvN239fz1oZYyj9sa0jGADb4iyjaN9xiTZHXga1H81h7v3AoJvR24kUNbTTcQRHLV8d2hahpGuHVYm3/LfpAlCRq11nKTGwCaqw92D5EemcRfZIhjrJ4/87/biQj3jRDUa4G9Hz6eoln8p87SFwClea9QAW9hhz/dXi7+DL1tP6fllIm7ttT7RwVjE4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzTh/oN0nXQcDaCz2NIwMFLSqALKithvHGs2vw+bqSI=;
 b=Ue9Nwo3eEr9HGWQky7POqiCNX70h4SPO5s7jSSmsJRNYynQKmo41wkoSnmS77DLRdv9pXRgsHT3559psn37QezxH/vh8vPE6zZTD8pgWxJVvpa7ecGPetK/oy5KQsmB4aQl0b0fZIehY97sx0PU/c4rVKuowaLo2//eoCf7YBpc=
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com (2603:1096:203:8f::22)
 by SG2PR04MB3708.apcprd04.prod.outlook.com (2603:1096:4:9c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Thu, 20 Jan
 2022 08:42:50 +0000
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::5994:f7bb:bf49:351c]) by HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::5994:f7bb:bf49:351c%5]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 08:42:50 +0000
From: =?utf-8?B?U3BlbmNlciBLdSAo5Y+k5LiW55GcKQ==?= <Spencer.Ku@quantatw.com>
To: =?utf-8?B?U3BlbmNlciBLdSAo5Y+k5LiW55GcKQ==?= <Spencer.Ku@quantatw.com>, Ed
 Tanous <edtanous@google.com>
Subject: RE: Implement Ethernet Interface Properties
Thread-Topic: Implement Ethernet Interface Properties
Thread-Index: AdfmmeLt8bsv+QLKRK2scPouEluJvQARsvaAABzs1sAJbZHE8A==
Date: Thu, 20 Jan 2022 08:42:50 +0000
Message-ID: <HK0PR04MB3299DA39BBF0596CA83BC41EE45A9@HK0PR04MB3299.apcprd04.prod.outlook.com>
References: <HK0PR04MB329947E4E37431B956A8D17AE4689@HK0PR04MB3299.apcprd04.prod.outlook.com>
 <CAH2-KxDx2BwNMWaGvzUeQZVt4me5WSBvkni3A0ig-ohtxiWEUQ@mail.gmail.com>
 <HK0PR04MB3299920FAFF33D27C503A218E4699@HK0PR04MB3299.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB3299920FAFF33D27C503A218E4699@HK0PR04MB3299.apcprd04.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b3e98cb-786b-4132-c00a-08d9dbf0d7d2
x-ms-traffictypediagnostic: SG2PR04MB3708:EE_
x-microsoft-antispam-prvs: <SG2PR04MB3708F0F0849992CDFE7EE081E45A9@SG2PR04MB3708.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 62DzphhlI9NwEdSSMNqPSQ4fcHCeziv/fC+xXDCfn9lErRRiREIVWrOuSNDjBkKMoHITkeAjv4SBt1a9letoJuB+gCBLsJbL9tPptRUq/nv7ltoLURntziYexUSuSjnR2KQdhWZveQBeAXZ81QENBup6kYAAHoM5TuUYSgj85r1uyP/Eq0ZgpdebumvWJmDbwE/r7hF7f4uq8KT4lZnEIdYFW5tx1YVG4oD2Loyyi19m2VK2WbP+2OkxWd5rFPvJiEnckcFqdAO3zCocqn+VemzoFmJdiRUGU+NQppGz1KU5tJ93uLRg/W2/dPPTMsO89ubY1PtbQiZPSbx1ptdngl2mpc/GfKCndeybhMwZVWbOT/NMUyo+j1s7DC6R3Q/FQjUQnXRWaDciZnHygzwgv+IYIjq+MbrV4T3ShD8BbxZwtPEvhO/uJZOnfk9mLfscl8WJ4Rnltp9Yi3VjtF61xwF1W1lzHEAXkQy31Et4Yh18fHpRibjUmocbbC0n9mGIk/JQCLQgkdmRGi3bxGCCSO9ueL0E+dv/5Zc/KG7vLzGwcfqEWA89nENDtLs75EVPAZiBf8gvINFDLbg6dp4Johu4FK8I7VxwD1Fms3U/LQfKabRcU0WqsXF8m6b1Q69t+m8m3OjbQqYNFKjLa5VW0xlvbEIgMhya45tfEdWtTN/rXwpgJp5tYPeF4rP2kLWpke95cVmTvoi7v3152aCeJ7dhBgeyqon/ZjjmHZsJyEFo+HtjPYnphgl+ZkR8r8nTU3bpkzTutODh28+7p5msRw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3299.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38070700005)(66476007)(66446008)(6506007)(186003)(66946007)(8676002)(76116006)(66556008)(38100700002)(316002)(3480700007)(7696005)(64756008)(8936002)(55016003)(5660300002)(9686003)(2906002)(71200400001)(83380400001)(54906003)(966005)(4326008)(86362001)(26005)(85182001)(52536014)(122000001)(508600001)(110136005)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1drN2JsWEhBMkw1Q3IvR2swWGRpSHFFZXpCMnlGN1hvaVNoTXJKN3VQYTZP?=
 =?utf-8?B?T3hVZ0ZhNFd3Mk1HVUFHS1RIRDNnblVLZE1OOUNqQ2FGdlRabCtRSDVTU0tn?=
 =?utf-8?B?T2hTK3htcXVnd3pkZXhpbjczaXU0cUM1SmdjbjhVS2VxUHBZTTdpTnlua2FP?=
 =?utf-8?B?NXBMYkV0Q3gzUzZ0N2RjZjVJUmZCdFY0bGxndXdldUtjNjNHM3cyZGptanhj?=
 =?utf-8?B?ZnhhWGtnRTdPY3ZNTWg5N3ZuMW9WL3A0NFdtcjRBSUZ2UUlqQXlCYWN0YWFt?=
 =?utf-8?B?WTQ3OWJ4RDNWSnZ2Q2tzQ2N6VExCQ3g3T210cGlnck9oblhvMnR1b0xJTmhu?=
 =?utf-8?B?eUFzMHB6em9WQTNJMmFGWGdkQU9aZ0lEZEZEdGdkbTV3eXNVcWVzRVlTNmx0?=
 =?utf-8?B?RWNQM01HL0h3MTBHdzlZaDBaRXVaUFBwbjFPTVBaMk0wR01OTjI3ZHhDK0h6?=
 =?utf-8?B?NW1PeUFldTkybVY2U2tRbStIODFRWEpxK1ByRWVpaXMvNjNXd05YZkFZdFg1?=
 =?utf-8?B?b045ZkZqRVMzVWFUVGNGaU5lYmc1K1Z5dFdGeUxPL1IxVEJVNVRUcFgxaVhq?=
 =?utf-8?B?YmJBM1V4NWlzZ1QzdnlZTWtpSHYvVzluaHlkK2RaWWlTbVRQeHV2ZkNFblRj?=
 =?utf-8?B?NGpUOGh4UUUwemZhejZjTExCdXY3U01JMUY1M05mTEwybHl6ajRZYnVXTlh5?=
 =?utf-8?B?d012R2o5QW1pYU5GaDhsY2xNTUErRTQ0NjVqRHZsZXdhT043R2ZRNk5pSWRK?=
 =?utf-8?B?NVh3Sk1lSUNvcUhtQm9mZFZZK3ZkQmt4dHc1N013Sk8wT2tKWFhkU0didTFy?=
 =?utf-8?B?aVBPV2pRZnl4KzZiVm9zbjljWVdLcThIaFlZbGVWeEZFVG5QUnhBdHJCa3FT?=
 =?utf-8?B?dGMyUk42eFZiNGVxbjl4ZUhUMUxabHptODlJcXVsRmVQSkZ6eE1mZHNXaWlF?=
 =?utf-8?B?bzBvZC93YWZnVmkzNjlzMWpJR2ZhVlNpbWJwWkpYc0E5SHhvRnllOGFqQXhH?=
 =?utf-8?B?czdUUEszbzV6eGRLalRuVWRFZHZ2L3kySjYzOE5Ca1M5bGRZazdNaE8vZHVm?=
 =?utf-8?B?TkkyUkVpc25rUDRkaXltcGVzNDcxdmxTN0RmVWhvZTBXRlorenU2bmtzQmVz?=
 =?utf-8?B?bUFCYXNMbGdvQmpNb1l4d3FqZVpnZDZqK01TT2hid1ppaWUwVmRFbElDMEty?=
 =?utf-8?B?YWZjZ0h1NlpPSHlKK2dKMlE3SVNJbSt3bUt0VDJ2NlVJeGFIajdRTVFubzUv?=
 =?utf-8?B?ZjdtbEdORWVtMGxIYnp1WXF1elE0dmxZdkQ3MDliaExqOE0xNGhoeDdGVEhE?=
 =?utf-8?B?V0g1Y3loNWlVczc4L3JjMk81bnp3OE1EYUZwY1ZablRQWmtyaXNvWTU4M1ZB?=
 =?utf-8?B?ZHo2azNXWm5xdTE1Y0szQTYyM1lDN2x2NlhJSlVza2ZjUDY5aWdvUjdXU0dL?=
 =?utf-8?B?SjZFWTRNYkVkd3l2NjNkVndycWhpU0ZJSVN1NGNOS20vNFNrS2dkekpSNmxW?=
 =?utf-8?B?RlBLdkdmNzNYUlBDY1JYWE5lTHh6d2I2Q0FzU1BEa2gvZU9FTVA1UCtkb0VP?=
 =?utf-8?B?NU02NkxTcmw3NmdpOExlSG82OWlOb0FFcmJQdVhGV1gzNUdJMnE4Tis4ZFNP?=
 =?utf-8?B?aURCOGUzYkRFenYvZmMwMWFnck1zWWpjQm9SckpvMk9QdUlld3NaK25nVUlq?=
 =?utf-8?B?WjV6bjdac3FBQllNeTdhMkEzWXE4ZXFIY3IxMmZiSWQxSCs3aG5COHFnWmx1?=
 =?utf-8?B?OTVvVkF3SmJMVnY2b0U5R3RnaXFRZXFuVURNQUE2N21pNjNmY3lid3hsZTgw?=
 =?utf-8?B?LysyZ1pDS0FtUjhld2xpVTFGYUlKZmpUTTgzM2VWYUxNTFVpWWFKWnpiNUdK?=
 =?utf-8?B?NXNWYUxsa0hOL0NVOFZCUWRYd0VRVkRFd084UjNJakVsR0lsVXUvbnNzaHJB?=
 =?utf-8?B?QUZUN3ZjWmo3VlBXVXpLUHdiT3QvL3JBY0x3aVpVOFFxNFdVNnFjd2c3ZFh6?=
 =?utf-8?B?amxDaE9PN3JyK1BUTDBNdUFOelJxRU45RDBTZ3VNN3dQcjZmWlcwdzhVWXhh?=
 =?utf-8?B?MFowY1p4Qk9ycmlyb0JOZ04wYTdDNEF3Nk9KZm5mNUhzN0RzbkFIYzQ2MEFD?=
 =?utf-8?B?RXV2cHEzZzc2UDV4aUlsMXQ0TFc2YU5ZUG5lOEdxWHJtYURySVE2K2ttaHZ1?=
 =?utf-8?B?NXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3299.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3e98cb-786b-4132-c00a-08d9dbf0d7d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 08:42:50.8558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MujBf3jcaUBCkgFrRY8++sJyoO+XIbmV684tBZZg2XB159X01tiIrh86bUyJVa7Sm2tPZyMlPyYnvwZj0U5SEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3708
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

SGkgQWxsLA0KDQpXZSBmaW5hbGx5IGRlY2lkZSB0byBpbXBsZW1lbnQgc2l4IHByb3BlcnRpZXMg
dG8gRXRoZXJuZXQgaW50ZXJmYWNlOiANClJ4UGFja2V0cywgVHhQYWNrZXRzLCBSeEJ5dGVzLCBU
eEJ5dGVzLCBSeERyb3BwZWQsIGFuZCBUeERyb3BwZWQuDQoNClRob3NlIGluZm9ybWF0aW9uIGNv
bWUgZnJvbSBFdGhlcm5ldCBzdGF0aXN0aWNzIGFuZCB3ZSBjYW4gcmVhZCB0aGUgZmlsZSANCnRv
IGdldCB0aGUgcHJvcGVydHkgdmFsdWUgZGlyZWN0bHkuICh1bmRlciAvc3lzL2NsYXNzL25ldC88
RXRoZXJuZXQgbmFtZT4vc3RhdGlzdGljcykNCg0KRm9yIHRoZSBzdWl0YWJsZSBwcm9wZXJ0eSBp
biBFdGhlcm5ldEludGVyZmFjZSBtb2RlbCwgd2UgZ290IHRoZSBmZWVkYmFjayANCmZvcm0gUmVk
ZmlzaCBmb3J1bSBhbmQgdGhleSBzYWlkIE9FTSBwcm9wZXJ0aWVzIHdvdWxkIGJlIHRoZSBvbmx5
IG90aGVyIA0Kb3B0aW9uIGF0IHRoaXMgdGltZS4gRm9yIG1vcmUgZGlzY3Vzc2lvbiBkZXRhaWw6
DQpodHRwczovL3JlZGZpc2hmb3J1bS5jb20vdGhyZWFkLzU3OS9hZGRpdGlvbmFsLWluZm9ybWF0
aW9uLWV0aGVybmV0LWludGVyZmFjZQ0KDQpUaGUgZm9sbG93aW5nIG91dHB1dCBpcyB0aGUgcmVz
dWx0IG9mIG15IGN1cnJlbnRseSBPRU0gaW1wbGVtZW50Og0KaHR0cHM6Ly8ke2JtY30vcmVkZmlz
aC92MS9NYW5hZ2Vycy9ibWMvRWhlcm5ldEludGVyZmFjZXMvZXRoMA0Kew0KICAiQG9kYXRhLmlk
IjogIi9yZWRmaXNoL3YxL01hbmFnZXJzL2JtYy9FdGhlcm5ldEludGVyZmFjZXMvZXRoMCIsDQog
IC4uLg0KICAiT2VtIjogew0KICAgICJTdGF0aXN0aWNzIjogWw0KICAgICAgew0KICAgICAgICAi
UnhCeXRlcyI6IDQ4MjQ0MDI2LA0KICAgICAgICAiUnhEcm9wcGVkIjogMjIyODU2LA0KICAgICAg
ICAiUnhQYWNrZXRzIjogNDg0MzE1LA0KICAgICAgICAiVHhCeXRlcyI6IDgyNTg0NSwNCiAgICAg
ICAgIlR4RHJvcHBlZCI6IDAsDQogICAgICAgICJUeFBhY2tldHMiOiA1NDcyDQogICAgICB9DQog
ICAgXQ0KICB9LA0KICAiU3BlZWRNYnBzIjogMTAwLA0KICAuLi4NCn0NCg0KQnV0IGl0IGNhbm5v
dCBwYXNzIHRoZSBSZWRmaXNoIHZhbGlkYXRvciwgYW5kIGhlcmUgaXMgdGhlIGVycm9yIG1lc3Nh
Z2VzOg0KRVJST1IgLSBUaGlzIGNvbXBsZXggb2JqZWN0IFJ4Qnl0ZXMgc2hvdWxkIGJlIGEgZGlj
dGlvbmFyeSBvciBOb25lLCBidXQgaXQncyBvZiB0eXBlIC4uLg0KRVJST1IgLSBSeEJ5dGVzOiBD
b3VsZCBub3QgZmluaXNoIGNoZWNrIG9uIHRoaXMgcHJvcGVydHkgKCdpbnQnIG9iamVjdCBpcyBu
b3QgaXRlcmFibGUpDQoNCklzIHRoZXJlIGFueXRoaW5nIEkgZGlkbid0IG5vdGljZT8gT3IgaGFz
IHRoZXJlIGFueSBzcGVjIG9yIGV4YW1wbGUgdGhhdCBJIGNhbiBmb2xsb3cgdG8gaW1wbGVtZW50
PyANCg0KSSBoYWQgYWxyZWFkeSBwdXNoIHRoZSBpbXBsZW1lbnRhdGlvbiB0byBnZXJyaXQgYW5k
IG1hcmsgYXMgV0lQLiBIZXJlIGlzIHRoZSBsaW5rOg0KaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1w
cm9qZWN0Lnh5ei9jL29wZW5ibWMvYm1jd2ViLysvNTA1MjINCg0KV2UgYXJlIHdpbGxpbmcgdG8g
c2VlIGFueSBzdWdnZXN0aW9ucyBhbmQgYWx0ZXJuYXRpdmVzIGFzIHdlbGwuIFRoYW5rcyENCg0K
U2luY2VyZWx5LA0KU3BlbmNlciBLdQ0K
