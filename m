Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D77742E766D
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 07:14:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5LbF5JmfzDqGc
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 17:14:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=6269517ed=harvey.wu@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=ThwoqO33; 
 dkim-atps=neutral
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 4D5LZH2wKSzDqGb
 for <openbmc@lists.ozlabs.org>; Wed, 30 Dec 2020 17:13:26 +1100 (AEDT)
IronPort-SDR: 8bpUbsytT9fMF9aU2Fc0DFkHSjliryIjlek4MWRfYwNudlySWJ2EbAsjt0bbVFtXpE5F1KOXnl
 G7hjEptVY1Hg==
Received: from unknown (HELO mailbx05.quanta.corp) ([10.243.91.100])
 by mx01.quantatw.com with ESMTP; 30 Dec 2020 14:13:24 +0800
Received: from mailbx05.quanta.corp (10.243.91.100) by mailbx05.quanta.corp
 (10.243.91.100) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 30 Dec
 2020 14:13:23 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.125.58)
 by mailbx05.quanta.corp (10.243.91.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4
 via Frontend Transport; Wed, 30 Dec 2020 14:13:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nq3c9YRJjcJ+X5vODMGA+e3fQnj/Po4BpYm8FNpnqCvsdZVNscYxBXegOQX1V9Ix1N6qvBtUk9zhoZvc/cbIInpdW/6fwReuzAlt7FaGBzr7HAvbcvv12LUeaIinRtTXJA1avK1u4Zk0ZH2cdBmTcvXeV5XpgYVk4XUutBJtx0Q7O8Do1Y+0AZ4VNSE35h2Fhiky1LFVskrTrHuqVwlOY4Yy2ykoTV63f6ge4OBpVKNG/i8/iG7PJHpTKaXgH1EEMGLdbfSChq6Lb1Q2PojHkYPT7Hc3xbJ+LbGHErlgnQ/pyZJXiKMHTfwshxM1ADawr5rZW/nxL/wGbVOG6oHfyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXrbFkWXoSxYi8YTsL2JitobpkRq9x4bNVw+lngBgmE=;
 b=a5bv4B7RHufDlO9HpF8xWxNUPeVmgT967XE2vACwFJKPl//SWnY8JkiOYSvZg/SvGXvmlvJPSxkaUEx2N5ve2oDXNK8O3351uPgZkIkRH5aoD6K6qgZkJPkf7juJ0dTYw10S6xwNUL8ShJZNL1M6biXwmL8RN3JZ60KvMeznHlMgljytC97JRUfkPSF5vu2Rfaq/+hvXZE3wrcNXqKUaTHOFkdW+zcBrupp2zCZhyQ8S43CIn7QFVoYji6czA3xG+N15T4eGB2R+J2HNkAknutn4EjnndC7ENt1/aSM3e3xgKjfbQRjpTUKhdEXbecBm7osXyESSkjDLqz4mI/i/0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXrbFkWXoSxYi8YTsL2JitobpkRq9x4bNVw+lngBgmE=;
 b=ThwoqO33HTxkHqIZbTS6sn4zuVsb8tE+rsyJX8FwqdpSomj/7XziBCyrDXujgY+Z7oJokmRKno9cjRMqfXVTe4uuxjv+b8N6/lpI0+0bqsFxCz2Bq/tJuSzqtNcOBc+dzlThHr/s80BMsRZCuz993tfq9aSyZd2T4fA7+Be/174=
Received: from TY2PR04MB3933.apcprd04.prod.outlook.com
 (2603:1096:404:8004::16) by TY2PR04MB3517.apcprd04.prod.outlook.com
 (2603:1096:404:f7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Wed, 30 Dec
 2020 06:13:21 +0000
Received: from TY2PR04MB3933.apcprd04.prod.outlook.com
 ([fe80::e86c:66b9:97f3:22ea]) by TY2PR04MB3933.apcprd04.prod.outlook.com
 ([fe80::e86c:66b9:97f3:22ea%5]) with mapi id 15.20.3700.031; Wed, 30 Dec 2020
 06:13:21 +0000
From: =?utf-8?B?SGFydmV5IFd1ICjlkLPltIfntq0p?= <Harvey.Wu@quantatw.com>
To: Vijay Khemka <vijaykhemkalinux@gmail.com>
Subject: RE: [phosphor-virtual-sensor] Add new feature to get Warning or
 Critical property
Thread-Topic: [phosphor-virtual-sensor] Add new feature to get Warning or
 Critical property
Thread-Index: AdbeTetCIk4HSRZcQba2tGU0hZY5twABSy4AAABYFTAABRxOgAABLfRQ
Date: Wed, 30 Dec 2020 06:13:21 +0000
Message-ID: <TY2PR04MB3933D20377D54FB7D1A3067695D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
References: <TY2PR04MB39331267ECA5147A09FF691495D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
 <CAGm54UH0kgwdmvSe7ZgmE6HV1fHzeJY7KOaFHcfYgNOAnPV-EQ@mail.gmail.com>
 <TY2PR04MB39337E262BA43CA7378F2B6C95D70@TY2PR04MB3933.apcprd04.prod.outlook.com>
 <CAJTGxZHhbRs7pedZ+Ag8v7WACzXYyg43ZKYNWB75VywzoaSbpA@mail.gmail.com>
In-Reply-To: <CAJTGxZHhbRs7pedZ+Ag8v7WACzXYyg43ZKYNWB75VywzoaSbpA@mail.gmail.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=quantatw.com;
x-originating-ip: [60.251.243.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e15d007-d224-4c10-d9fc-08d8ac8a0249
x-ms-traffictypediagnostic: TY2PR04MB3517:
x-microsoft-antispam-prvs: <TY2PR04MB3517E859B3A927F6B1D58F1F95D70@TY2PR04MB3517.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W+0AcxqfLrMCKvi540YIHty8dTHWgLkWwmkJTEA4ucnjB2SoDE+1qKTixOOJP8G8kHoapJ7cJGUVoT6woQQR3EXDgC7RVPhD3ThgP+/CGD/ZIQXNjNipVvzl/aMlh2dSc/8fm5xbJ7mhWtbmsL4oYLDYvhfjpT/nb9SJ22lb2OsQIg1a9ZuVFrsEQHBiWCa5wHrqASqbEitaibcM6ccs1dEgmsanBCNgI3oo9TT7U+f9eyZFiff6Dvnsl25nD6097ewV8d7DF+WLTdVy8jPdXIhNOSXTveL/KM3/LQlN4d/d/BhXDDGnJ9es9Ft+QUbgnwG9qhpzSYesBpHd5ijtId4folPJbLizo+E2+oq2+wcaaLPq9R2viTPwx3s1YyU4n8tlMf+Vmtz6w5ZzdC2vvptqEt02pVLw06V5jFu29i720tHe9JPInlUCLo/FRLGbxd8UXmbHNqwKzOPF1tcoeA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR04MB3933.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(966005)(4326008)(2906002)(6916009)(8936002)(45080400002)(478600001)(71200400001)(66946007)(66556008)(66476007)(66446008)(64756008)(52536014)(76116006)(5660300002)(53546011)(33656002)(6506007)(26005)(8676002)(186003)(9686003)(55016002)(86362001)(7696005)(54906003)(85182001)(316002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NVkxOUtNbWJidnhoUWIvMFdzYWZ3VENOTVIxRVM3bzBKanlmVTBtdVFTa3pP?=
 =?utf-8?B?YnBHSzQxcThhOEtyUmppRW1SNlNVRGNjdFo0MjA5OGlVa0VDWDZLYWpKNlRy?=
 =?utf-8?B?OWNNRk9Bc3AyS3ZHUnRHV09QcW9yTkJaN0NIVEhremhvOXBnVTkzejZ6NVUv?=
 =?utf-8?B?Ni9qTGJNV0RKa2dWdE5LMUxJMmRhNXF4N3lPZ3dkN051cWtIVE9rMG9aZzZW?=
 =?utf-8?B?WUV0WDE4UTJIdkl4VTlLc0M5eEpXcFdLcStrd1pmSmtvcm5IaFBCR2VUVCs1?=
 =?utf-8?B?dW1CTHpWdzgyL2F4akFoa0F4U1Z3VmdBa3NUdWJVMU9mNGd1REphTmxseU9h?=
 =?utf-8?B?Zy9NaC9aQjcrUkMvQ3B4bG5rcERXL2NYeWVxa2R4cFl6ajA0MlExUDUzVGd1?=
 =?utf-8?B?c1hxdlNDRTl1UE93NHN4UHB5K0R5aGlSRmRYM2RqZkFjWk5PRmRMMm9EWTUz?=
 =?utf-8?B?S3BNenRwdE9YNEZDSzJIais3RWVmYi9OODVhYUNrdkZTekZRMDNVU2Y1U2lU?=
 =?utf-8?B?Rk9vM1pyQUk4Y0lQTUVzWHhBaGpZeER2anpxMER4SjdZTDRNYXVnOW94SFlo?=
 =?utf-8?B?ZDdLZzVpcUtIOHFVSS96ajhLMTY4enZiRWR0TURObERXKzRzOUFORTdBOFM1?=
 =?utf-8?B?SE5oZXE1SEJHZjRnWmU2WG5pMkdmcUlYOFUvUkp5VEQ1cjZRQk5VemE0ZWtJ?=
 =?utf-8?B?dzdnb2pSOG5qN2pqWnlEeStLbVQ0UmgrNVVGYXkzRnNYZ0QrSE9pczJLOG5p?=
 =?utf-8?B?dEszcmE1TndNTTV4S2RJaVM2WUlpN2k4WUNYcWVGNHBYQktNSzh4dlZoTVls?=
 =?utf-8?B?R0RFclc5UW5XOG80akEvTkRQRkw1V01mbWNhS1dlZ1ducllHS2hESmhxQVdC?=
 =?utf-8?B?UXIzSlZ1WVYvdjdneWd4UVdyN2xqY3d2SFNmQ1hvUE9JZkpSRWR1R0JMTXN6?=
 =?utf-8?B?dzJldTI3blNNK25oK1ZPWVNGeGJjamthQ1gvaGMzcWRZZ2gwSUtTQ0kxMUIw?=
 =?utf-8?B?eUMwdDBwaDc3aGxJcmU1UFV3QmxTalBaVzNEQWMxQzFSbGFOU0lGR2IxMERV?=
 =?utf-8?B?YXM0Nm9zdzc2UzBZdzZMRFpKby8zN09Wb294NGlFN0E3NEd5c1EzMWszOGNE?=
 =?utf-8?B?Y09QMkp2NEwzRGRRa0YwMG9hak1jb0hiTXBKVFRrb2lobVRVYkFvdUZGU1NQ?=
 =?utf-8?B?anFLeDM5MzU3L2t1dW5aRzhtc1VxTkRwVVZKd0ZWQTR4ZHkwd3pyM1I1Y1R5?=
 =?utf-8?B?b2VXd0pwYm8yRFBvdzUxaWw2YmpFcEt0eTZlbDVyNzB5Y3pwZmlsekRLNndS?=
 =?utf-8?Q?UiG8Se/AWwkUM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR04MB3933.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e15d007-d224-4c10-d9fc-08d8ac8a0249
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2020 06:13:21.6017 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qsa83WYrVwVArREC251ZIq+r0HViht1qJoHI6c5jNrBOXT8Col7+UPTXfXa/kVllb7X+D4fTx3vqovTP7t355w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3517
X-OriginatorOrg: quantatw.com
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
 Lei Yu <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgVmlqYXksDQoNCglCZWNhdXNlIEkgd2FudCB0byBjYWxjdWxhdGUgdGhlIGRpZmZlcmVudCB2
YWx1ZSBiZXR3ZWVuIENyaXRpY2FsSGlnaCBhbmQgY3VycmVudCBzZW5zb3IgdmFsdWUgaW4gQ1BV
IHNlbnNvciwgYW5kIHRoZW4gdGhlcmUgYXJlIHdlaWdodGluZyBhbmQgc29tZSBjb25zdCB2YWx1
ZSB0byBtdWx0aXBseSBvciBwbHVzIHRoZSBkaWZmZXJlbnQgdmFsdWUuDQpCdXQgdGhlIENQVSBz
ZW5zb3IgY3JpdGljYWwgaGlnaCB0aHJlc2hvbGQgdGVtcCBpcyBzZXQgYXMgVGpNYXgsIGFuZCB0
aGUgVGpNYXggdmFsdWUgd2lsbCBiZSBkaWZmZXJlbnQgYWNjb3JkaW5nIHRoZSBkaWZmZXJlbnQg
Q1BVIHByb2Nlc3MgdHlwZSwgbm90IGEgQ29uc3QuIFRoYXQncyB3aHkgSSB3YW50IHRvIGFkZCB0
aGlzIGZlYXR1cmUuDQoNCkZvciBleGFtcGxlLCBhY2NvcmRpbmcgdGhlIERvY3VtZW50IGJlbG93
LCBpZiB0aGUgcHJvY2Vzc29yIGlzIGk3LTM3NzBLLCB0aGUgVGpNYXggaXMgMTA1LCBhbmQgaWYg
dGhlIHByb2Nlc3NvciBpcyBVNzUwMCwgdGhlIFRqTWF4IGlzIDEwMC4NCmh0dHBzOi8vd3d3Lmtl
cm5lbC5vcmcvZG9jL0RvY3VtZW50YXRpb24vaHdtb24vY29yZXRlbXAucnN0IA0KDQpJZiB0aGUg
RXhwcmVzc2lvbiBpcyAiKFRqTWF4IC0gY3VycmVudFRlbXApICogc2NhbGFyIC0gQ29uc3QiLCB0
aGVuIGl0IHdpbGwgY2FsY3VsYXRlIGRpZmZlcmVudCByZXN1bHRzIGJldHdlZW4gdGhlc2UgdHdv
IENQVSBwcm9jZXNzb3IuDQoNCg0KSGFydmV5IFd1DQoNCkZyb206IFZpamF5IEtoZW1rYSA8dmlq
YXlraGVta2FsaW51eEBnbWFpbC5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAzMCwg
MjAyMCAxOjAyIFBNDQpUbzogSGFydmV5IFd1ICjlkLPltIfntq0pIDxIYXJ2ZXkuV3VAcXVhbnRh
dHcuY29tPg0KQ2M6IExlaSBZdSA8eXVsZWkuc2hAYnl0ZWRhbmNlLmNvbT47IG9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6IFtwaG9zcGhvci12aXJ0dWFsLXNlbnNvcl0gQWRk
IG5ldyBmZWF0dXJlIHRvIGdldCBXYXJuaW5nIG9yIENyaXRpY2FsIHByb3BlcnR5DQoNCkkgYW0g
bm90IHVuZGVyc3RhbmRpbmcgd2h5IHlvdSB3YW50IHRvIHVzZSB0aHJlc2hvbGTCoHZhbHVlcyB0
byBjYWxjdWxhdGUgbmV3IHNlbnNvciB2YWx1ZXMuIFdlIGNhbiBjZXJ0YWlubHkgYWRkIHRoaXMg
ZmVhdHVyZSBidXQgaXQgY2FuIG5vdCBiZSBiYXNlZCBvbiBuYW1lIHJhdGhlciB3ZSBoYXZlIHRv
IHRoaW5rIGRpZmZlcmVudGx5IHRvIGdldC4gSXQgd291bGQgcmVhbGx5IGhlbHAgdG8gZGVjaWRl
IG9uIGRlc2lnbiBvbmNlIHdlIGtub3cgaXQncyBhY3R1YWwgdXNhZ2UuIEkgY2FuJ3QgdGhpbmsg
b2YgYW55IHNpdHVhdGlvbiBoZXJlLg0KDQpSZWdhcmRzDQotVmlqYXkNCg0KT24gVHVlLCBEZWMg
MjksIDIwMjAgYXQgNjo0OSBQTSBIYXJ2ZXkgV3UgKOWQs+W0h+e2rSkgPG1haWx0bzpIYXJ2ZXku
V3VAcXVhbnRhdHcuY29tPiB3cm90ZToNCj4gT24gV2VkLCBEZWMgMzAsIDIwMjAgYXQgMTA6MTkg
QU0gSGFydmV5IFd1ICjlkLPltIfntq0pDQo+IDxtYWlsdG86SGFydmV5Lld1QHF1YW50YXR3LmNv
bT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBBbGwsDQo+ID4NCj4gPg0KPiA+DQo+ID7CoCDCoCDCoCDC
oCDCoFRoZSBjdXJyZW50IHBob3NwaG9yLXZpcnR1YWwtc2Vuc29yIERidXNQYXJhbSB2YWx1ZSBp
cyBmcm9tDQo+IERCdXMg4oCcVmFsdWXigJ0gcHJvcGVydHkgd2hpY2ggaW50ZXJmYWNlIGlzDQo+
IOKAnHh5ei5vcGVuYm1jX3Byb2plY3QuU2Vuc29yLlZhbHVl4oCdLg0KPiA+DQo+ID4gQmVjYXVz
ZSBJIHdhbnQgdG8gZ2V0IHRoZSBwcm9wZXJ0eSDigJxDcml0aWNhbEhpZ2jigJ0gdmFsdWUgb24g
REJ1cywgY291bGQgSQ0KPiBhZGQgYSBuZXcgZmVhdHVyZSDigJxJbnRlcmZhY2XigJ0gcHJvcGVy
dHkgaW4ganNvbiBmaWxlPyBUaGUgcHJvcGVydHkgY2FuIGJlDQo+IOKAnENyaXRpY2FsSGlnaOKA
nSAsIOKAnENyaXRpY2FsTG934oCdICwg4oCcV2FybmluZ0hpZ2jigJ0gb3Ig4oCcV2FybmluZ0xv
d+KAnS4NCj4gDQo+IA0KPiBBY2NvcmRpbmcgdG8NCj4gaHR0cHM6Ly9hcGMwMS5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0aHViLg0KPiBjb20l
MkZvcGVuYm1jJTJGcGhvc3Bob3ItdmlydHVhbC1zZW5zb3IlMkZibG9iJTJGbWFzdGVyJTJGdmly
dHVhbF8NCj4gc2Vuc29yX2NvbmZpZy5qc29uJTIzTDgtTDE0JmFtcDtkYXRhPTA0JTdDMDElN0NI
YXJ2ZXkuV3UlNDBxdWFudGF0DQo+IGh0dHBzOi8vYXBjMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24u
b3V0bG9vay5jb20vP3VybD1odHRwJTNBJTJGJTJGdy5jb20lMkYmZGF0YT0wNCU3QzAxJTdDSGFy
dmV5Lld1JTQwcXVhbnRhdHcuY29tJTdDZjc1NzA3YTc0MzFlNGRjYTcxMmUwOGQ4YWM4MDE4MmIl
N0MxNzliMDMyNzA3ZmM0OTczYWM3MzhkZTczMTM1NjFiMiU3QzElN0MwJTdDNjM3NDQ5MDEzNDQ4
OTc5MzE4JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlq
b2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmc2RhdGE9a3hU
M2k2bW9WUGdncWJZMXpKaWFnMThDcDl3R215azFjdHFyTzhYbFRVYyUzRCZyZXNlcnZlZD0wJTdD
MTQ3OWViZDVhZWRkNGI4YTdjMzMwOGQ4YWM2YTQzOTMlN0MxNzliMDMyNzA3ZmM0OTczYWM3Mw0K
PiA4ZGU3MzEzNTYxYjIlN0MxJTdDMCU3QzYzNzQ0ODkxOTY5Mzg1MDg1MyU3Q1Vua25vd24lN0NU
V0ZwYg0KPiBHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRp
STZJazFoYVd3aUxDSlhWQ0k2DQo+IE1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPTBLeXJuUmtaS3I5
TTU5REVnJTJCbnlVcnVpZWdlJTJCM0VEWGINCj4gbXh6UiUyQjZ4ZW5nJTNEJmFtcDtyZXNlcnZl
ZD0wLA0KPiB0aGUgdGhyZXNob2xkIHByb3BlcnRpZXMgYXJlIGFscmVhZHkgc3VwcG9ydGVkLg0K
DQpUaGUgIlRocmVzaG9sZCIgaW4ganNvbiBzZWVtcyBvbmx5IGNhbiBzZXQgdGhlIHNlbnNvciBj
cml0aWNhbCBvciB3YXJuaW5nIHZhbHVlLCBidXQgSSB3YW50IHRvIHVzZSB0aGUgY3JpdGljYWwg
b3Igd2FybmluZyB2YWx1ZSBpbiAiRXhwcmVzc2lvbiIuDQpBZnRlciBjaGVjayB0aGUgbmV3ZXN0
IGNvbW1pdCwgdGhpcyBmdW5jdGlvbiBzZWVtcyBkb2Vzbid0IGltcGxlbWVudCBpbiBjdXJyZW50
IHNvdXJjZSBjb2RlLg0KDQo+IA0KPiAtLQ0KPiBCUnMsDQo+IExlaSBZVQ0KDQoNCkhhcnZleSBX
dQ0K
