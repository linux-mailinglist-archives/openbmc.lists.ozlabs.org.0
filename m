Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 655022FAB10
	for <lists+openbmc@lfdr.de>; Mon, 18 Jan 2021 21:10:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKNF65jx3zDr0N
	for <lists+openbmc@lfdr.de>; Tue, 19 Jan 2021 07:10:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=40.107.131.93;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=mohammed.habeeb@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=icEMS9Y7; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310093.outbound.protection.outlook.com [40.107.131.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKNDF4sSczDqrn
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 07:09:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfxFYbxyWCEZdMT2r95K9l1Yj8IvHI/i3W2D94E/TCMWxzwZoNmq5gA+Dv9U1WFL6dFN792PWaAOeVvBqwdXHAe63cP0z64JzykKwy2nj0ShUViEK+bskuNLTqBFVcL7R1H0Xrq5E/Q/YqDBlldx8ah2qMkdZAZuXejGERuOX55KlJYc+4MjZLwnsD2G1AMaCBSFrAj3OkiekEArv1F7P5m0DSS+uqFwqfvMlksSHS46pwoBLO+KqH+FmjxFgpC2ab1+eX8ftAWUYqJJ6sJwKVxaqgI1pkjqyl0adHExBOXV/jlGqj7qrLSwqXcEZbyoCMIbMNp+6q/0aZAtjZc5/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mS8h7lC6L3nBaBWotR+zlsQCeHj3tlkamhibaD5DZI=;
 b=aBKKKOCb9YqaUbn9pzIX31w/WrN89r4fqH3t5EwNqK5I4F74aGhkE1u/dHmgXW9m3p9n1V50kRH3DPVviYuZafB1h338zb1gNpzcC6HtfZLVZ4OwoGuurveinWtSigZHjISWBFMd0T+3Xg02+COASU8DDCkJElL82jUjKLnbME+psi5AJxrMXx4UNS48oWdv/LwY6d4wOd1P1zxsF9VRR/O5x7aesWAJApns/4SIyrIrnmUeOfvwgdqdBTueJwrLrhe9cLn+fbgPGo8TsggoW4wr/VaqsWg+0jZJ4GiZzIRSspq6vECaEl8YXXT/MNV4oIrPhkwbm//vmoVwGQEOpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mS8h7lC6L3nBaBWotR+zlsQCeHj3tlkamhibaD5DZI=;
 b=icEMS9Y7wFCIhEpwLQ/DlzYPppRzZoYwqOY2uLLITVkktcXxgaAcTNYK3nrf7ezoGF9E+p/TPWIMJvqyL7GL/TknQP4HriYSBb376yIyDDdAN2UOBegNsGSufAqAQMklffSykooK29WeuKRBWBjCM2ECZKfGbwBycwjSMnwoysg=
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com (2603:1096:300:48::10)
 by PU1PR02MB2396.apcprd02.prod.outlook.com (2603:1096:803:1a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Mon, 18 Jan
 2021 20:09:23 +0000
Received: from PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::4cc2:cac1:a003:53f4]) by PS2PR02MB3541.apcprd02.prod.outlook.com
 ([fe80::4cc2:cac1:a003:53f4%6]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 20:09:23 +0000
From: Mohammed.Habeeb ISV <mohammed.habeeb@inventec.com>
To: Joel Stanley <joel@jms.id.au>
Subject: RE: Regarding eth0 (ftgmac100): transmit queue 0 timed out
Thread-Topic: Regarding eth0 (ftgmac100): transmit queue 0 timed out
Thread-Index: AdbpEdaHpYSz7LXNTyeSXhPDaKGwTgBv41sAAMAsVJA=
Date: Mon, 18 Jan 2021 20:09:22 +0000
Message-ID: <PS2PR02MB354148796874D72BBE0CB97890A40@PS2PR02MB3541.apcprd02.prod.outlook.com>
References: <PS2PR02MB3541276EFDDDD18BDAA34A2D90AA0@PS2PR02MB3541.apcprd02.prod.outlook.com>
 <CACPK8XdeUy82d10a9OTu_SPp_Mmr4413SHAEEe4t-D2Mzu9gZg@mail.gmail.com>
In-Reply-To: <CACPK8XdeUy82d10a9OTu_SPp_Mmr4413SHAEEe4t-D2Mzu9gZg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=inventec.com;
x-originating-ip: [207.140.31.146]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ec40c483-c7a6-44d6-c4a0-08d8bbecf2b2
x-ms-traffictypediagnostic: PU1PR02MB2396:
x-microsoft-antispam-prvs: <PU1PR02MB23961B9B986E4AD33F4A670290A40@PU1PR02MB2396.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qGStz+oiVcqKQoe2zckVXHiroIalcNpuoNqDBUBMiSPG0uvNCRi/NZQwTEp4eh1O4Wffwdk8hbGzEMNtfNhVGYlWvQGeyNzdjWdCXdqa42RX7Amy0+aeORB0ZoghF/YRiJCxkqJbUg8Xp/y0MmV9z6DabUWXpXeUv0WrJCRD9YIrRUsD0YjRE7kX/vI7NQalFnmAGFBQDT5IswZb6AoUpdk2IqDCM2v4MjHNnhXeVXGwJ5a9gCCngBSyRqOBCiX87jjGDKOjpn/XyUY6JhC8mcZe8cLYqD1xsQxM/3j1XfoBj7PbscgzfNsIek7I4GE2S5xml4J4aQR8fQ31F/Xo0S7CccdmMVdxZmmTG35HVL3qHbC5+dG79+9vfdKPk+UQCo6HJUFxviYHXYoZ9ir6nhJnrrPn/z6tkyomqDVod+c5hQ9uLkSaJNNsbKdJGqq2Wnwva/MRNWs8ObO+kCM6NQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS2PR02MB3541.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(2906002)(9686003)(7696005)(55016002)(6506007)(6916009)(316002)(5660300002)(33656002)(8676002)(66946007)(66446008)(4326008)(86362001)(8936002)(478600001)(26005)(53546011)(186003)(966005)(83380400001)(76116006)(71200400001)(66476007)(66556008)(64756008)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?VElCMlBxcGpLeUt0OEd2MyttQm9IRVpzZE9tNVZVaXVqKzlXUmRzQWJ2b2U4?=
 =?utf-8?B?NEZucnN6d01FelI5NXIya3ZrUGtWTkh1a2h3bUhLcEJwcFJobFljWklTNUdW?=
 =?utf-8?B?dzlhdjg1WDR5MFNnc1VTS3RIaTlMcGQwQzViNnJZRjNsNXRHZ0YvUXpuRFd5?=
 =?utf-8?B?eGRtM3hwQmNsdm9HSkN1dHpjdG96ZnYyY0pteWY0YTI4VGNxWWJnWTFaNnAv?=
 =?utf-8?B?bDdXQmhjUUhsTXMwT2txZlRORm1tK3BLNmxpNlJXV2MwSmRMZFliUFZtd0dN?=
 =?utf-8?B?THFHR2dmLzJMWVhKekNaS1IxME0zelpnbFdnVS9BczhhdTErU2xKMzRsaEZx?=
 =?utf-8?B?cEpnN2ZlNjNYY01aNEhIVmNEelI5K2NUWlJzaW9mb0x0RWhlT0gvTFh6MzdJ?=
 =?utf-8?B?bGp5aEt6UUFKOWJzNkRFLy94eFVyNGxQNnZsWC9kUzhya0VreEw0ZzBHMnpS?=
 =?utf-8?B?bGdxVXlIT1lxZTVEQTR6aG5mWmZYbmhaTTdBMEMyV0hHSFVMYkdkUFVRMnIv?=
 =?utf-8?B?ZWZFajR4NTFrQlVoR0M0cm1aUjRBREJCamRNY0RPRFN5d0RIa3hIODFWOU1J?=
 =?utf-8?B?Z0tGNHEybWtvaXV0QlV2YlROS1JYQ1Jab2tEWWlZeVMxWXlOelRnSEx2Y2cz?=
 =?utf-8?B?WEJnREFIVm51bEltaDg3enBXeUNldktVd2I1Sml4R2l5UDVhcmw1amZ4QVRC?=
 =?utf-8?B?SzNrOU05WHIyYWQ1Qzl1VWE2WVFwNVB0SnhrQ0hwbk9pUlQycnFmRmh1Y1Vj?=
 =?utf-8?B?dlJUQks2ZmRSekNRbVA2SUZDRGh2N1puMVp6eHQ3UjFKZlRKVzNUY2dWWGN5?=
 =?utf-8?B?TVJ5akNGWHFvdndHSHN6ZWtMN3dQSTRvR0g3bUdCZ2FTY0RqcnV6VVduSEh2?=
 =?utf-8?B?ekpiWjh4eXZLbWxtd2I4NGR4SjMrMFVYVGF2MTNIWC9YY3lZbzh5K1oway9B?=
 =?utf-8?B?NllaZlU0Mk9BRDJGdjNySWZ1Tk9XRnRyQzFjZzRmdUl2WG01bi9Sb2xPT2dQ?=
 =?utf-8?B?YitocG1YWVI1QmxkVnFGaU1CUkY5dEtSSUFPYWdwTDVqcGpYM1dpeVlGdnhW?=
 =?utf-8?B?TnlTa29OTEY1SFJaNkJzL3N5aEZmSHF2Z05mK2lEZ0NwUnlCam1NbHdrVlpo?=
 =?utf-8?B?ZG1XRTU0N1hmeUlJemhkYnArakdCUG1QTkhHaUNvaWlsRjVMQ3k0Y0t1NTNR?=
 =?utf-8?B?bG9ZU2pGenVkRXYvQzlXUmR1MDU1SGY5bFVDUjJqOHZ5dTVvaEZHbkxpbUxX?=
 =?utf-8?B?aUxNU09zZkNTWHd2bFl0VXZCWEVYSFd6ZUZIcUFkYXpvTWQ0SlFMTjVYeFlG?=
 =?utf-8?Q?bczBAlz5sa14Q=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PS2PR02MB3541.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec40c483-c7a6-44d6-c4a0-08d8bbecf2b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2021 20:09:22.9254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V3I77bEg6XetZ5yxRD7OgEwIuqRD0Qwz3yW7TNWJlJIICYh+eVcVGkynzhJRaQAW26eRNbCgfSOMVyXOCwKNiZ4LvhBKWuqmji/4go26K8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR02MB2396
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBKb2VsIFN0YW5sZXkgPGpvZWxA
am1zLmlkLmF1PiANClNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDE0LCAyMDIxIDQ6MDAgUE0NClRv
OiBNb2hhbW1lZC5IYWJlZWIgSVNWIDxtb2hhbW1lZC5oYWJlZWJAaW52ZW50ZWMuY29tPg0KQ2M6
IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6IFJlZ2FyZGluZyBldGgwIChm
dGdtYWMxMDApOiB0cmFuc21pdCBxdWV1ZSAwIHRpbWVkIG91dA0KDQpPbiBUaHUsIDE0IEphbiAy
MDIxIGF0IDIzOjQ4LCBNb2hhbW1lZC5IYWJlZWIgSVNWIDxtb2hhbW1lZC5oYWJlZWJAaW52ZW50
ZWMuY29tPiB3cm90ZToNCj4NCj4gSGkgQWxsLA0KPg0KPg0KPg0KPiBXZSBzZWUgYmVsb3cgYmFj
a3RyYWNlIG9uIG91ciBydW5CbWMgYm9hcmQuIEFuZCBuZXR3b3JraW5nIGRvZXMgbm90IHdvcmsg
b24gZXRoMC4NCj4NCj4gTm8gREhDUCBhbmQgc3RhdGljIElQIGFkZHJlc3MgY2FuIHdvcmsuIFBp
bmdzIGFuZCBBUlAgZmFpbHMsIG5vIHBhY2tldHMgcmVjZWl2ZWQgc2VlbiBydW5uaW5nIHRjcGR1
bXAuDQo+DQo+IFVzaW5nIDIuNyB2ZXJzaW9uIG9mIG9wZW5CbWMuIFBsZWFzZSBsZXQgbWUga25v
dyBpZiB0aGVyZSBpcyBhIGtub3duIGZpeCBvciBwYXRjaCBmb3IgdGhpcy4NCj4NCj4NCj4NCj4g
dHJhbnNmb3JtZXJzOn4jIFsgIDE1OC4wODIyNTFdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0t
LS0tLS0tLS0tLQ0KPg0KPiBbICAxNTguMDg3NDQyXSBXQVJOSU5HOiBDUFU6IDEgUElEOiAwIGF0
IG5ldC9zY2hlZC9zY2hfZ2VuZXJpYy5jOjQ0NyANCj4gZGV2X3dhdGNoZG9nKzB4MmQ0LzB4MmY4
DQo+DQo+IFsgIDE1OC4wOTY2ODFdIE5FVERFViBXQVRDSERPRzogZXRoMCAoZnRnbWFjMTAwKTog
dHJhbnNtaXQgcXVldWUgMCANCj4gdGltZWQgb3V0DQo+DQo+IFsgIDE1OC4xMDQyNzldIENQVTog
MSBQSUQ6IDAgQ29tbTogc3dhcHBlci8xIE5vdCB0YWludGVkIA0KPiA1LjQuOC02NzFmNjIyLWRp
cnR5LWY1ODQ1ZmQgIzENCg0KVGhpcyBpcyBhIHN5bXB0b20gb2YgbmV0d29ya2luZyBub3Qgd29y
a2luZzsgdGhlcmUncyBtYW55IHBvc3NpYmxlIHJvb3QgY2F1c2VzLg0KDQpJcyB0aGlzIGFuIGFz
dDI1MDA/DQotSXQgaXMgYW4gYXN0MjYwMC4NCg0KRnJvbSB5b3VyIGxvZywgaXQgYXBwZWFycyB5
b3UncmUgdXNpbmcgYSA1LjQga2VybmVsOg0KDQpbICAxNTguMTA0Mjc5XSBDUFU6IDEgUElEOiAw
IENvbW06IHN3YXBwZXIvMSBOb3QgdGFpbnRlZCA1LjQuOC02NzFmNjIyLWRpcnR5LWY1ODQ1ZmQg
IzENCg0KVGhpcyBpcyBub3QgbWFpbnRhaW5lZCBieSBhbnlvbmUsIGFuZCBpcyBwcm9iYWJseSBt
aXNzaW5nIHBhdGNoZXMuIEl0IHdvdWxkIGJlIGJlc3QgaWYgeW91IG1vdmVkIHRvIHRoZSBsYXRl
c3Qgb3BlbmJtYyBrZXJuZWwgdHJlZSwgYnV0IGlmIHlvdSBjYW4ndCBkbyB0aGF0IHRoZW4gbG9v
ayBhdCB0aGUgaGlzdG9yeSBvZiB0aGUgZXRoZXJuZXQgZHJpdmVyIGluDQpkZXYtNS44IGFuZCBz
ZWUgd2hpY2ggcGF0Y2hlcyB5b3UncmUgbWlzc2luZzoNCg0KJCBnaXQgbG9nIC0tbm8tbWVyZ2Vz
IC0tb25lbGluZSB2NS40Li4uZGV2LTUuOA0KZHJpdmVycy9uZXQvZXRoZXJuZXQvZmFyYWRheS9m
dGdtYWMxMDAuKg0KOWY1NWQ3ODI1Yjk2IG5ldDogZnRnbWFjMTAwOiBFbnN1cmUgdHggZGVzY3Jp
cHRvciB1cGRhdGVzIGFyZSB2aXNpYmxlDQo4ZGUwMTQxYzI1MjQgbmV0OiBmdGdtYWMxMDA6IEZp
eCBBc3BlZWQgYXN0MjYwMCBUWCBoYW5nIGlzc3VlIGU2YjQ1ZWU3OTBlYyBuZXQvZmFyYWRheTog
Zml4IGdyYW1tYXIgaW4gZnVuY3Rpb24NCmZ0Z21hYzEwMF9zZXR1cF9jbGsoKSBpbiBmdGdtYWMx
MDAuYw0KODZlZWI5N2RlNzEwIGZ0Z21hYzEwMDogUmVtb3ZlIHJlZHVuZGFudCBqdWRnZW1lbnQN
CmQ1NjBiNzMzZWQ1MyBuZXQvZmFyYWRheTogRGVsZXRlIGRyaXZlciB2ZXJzaW9uIGZyb20gdGhl
IGRyaXZlcnMNCmYxMjk0NjE3ZDJmMyBuZXQ6IGNvbnZlcnQgc3VpdGFibGUgbmV0d29yayBkcml2
ZXJzIHRvIHVzZSBwaHlfZG9faW9jdGwNCjAyOTBiZDI5MWNjMCBuZXRkZXY6IHBhc3MgdGhlIHN0
dWNrIHF1ZXVlIHRvIHRoZSB0aW1lb3V0IGhhbmRsZXINCjBjNjViMmI5MGQxMyBuZXQ6IG9mX2dl
dF9waHlfbW9kZTogQ2hhbmdlIEFQSSB0byBzb2x2ZSBpbnQvdW5pdCB3YXJuaW5ncyA5YmNlNGIy
N2YzZWMgbmV0OiBmdGdtYWMxMDA6IFVuZ2F0ZSBSQ0xLIGZvciBSTUlJIG9uIEFTUEVFRCBNQUNz
DQowYWM2MjRmNDdkZDMgZG9jczogZml4IHNvbWUgYnJva2VuIHJlZmVyZW5jZXMNCg0KVGhlIHRv
cCB0d28gcGF0Y2hlcyAibmV0OiBmdGdtYWMxMDA6IEVuc3VyZSB0eCBkZXNjcmlwdG9yIHVwZGF0
ZXMgYXJlIHZpc2libGUiIGFuZCAibmV0OiBmdGdtYWMxMDA6IEZpeCBBc3BlZWQgYXN0MjYwMCBU
WCBoYW5nIGlzc3VlIiBhcmUNCmFzdDI2MDAgc3BlY2lmaWMuDQoNCi1BcHBsaWVkIGFsbCB0aGVz
ZSBwYXRjaGVzIHRvIHN5bmMgZHJpdmVycy9uZXQvZXRoZXJuZXQvZmFyYWRheS8qIHdpdGggbGF0
ZXN0IGRldi01LjgsIHN0aWxsIEkgc2VlIHRoZSBiYWNrdHJhY2UuIA0KPg0KPg0KPg0KPiBGZXcg
aXNzdWVzIHdlcmUgcmVwb3J0ZWQgYnV0IG5vIHJlc29sdXRpb24uDQo+DQo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvaXNzdWVzLzMxOTINCj4NCj4gaHR0cHM6Ly9naXRodWIu
Y29tL29wZW5ibWMvb3BlbmJtYy9pc3N1ZXMvMjIyOA0KDQpUaGVzZSB0d28gaXNzdWVzIHdlcmUg
c3BlY2lmaWMgdG8gdGhlIGJyb2FkY29tIG5ldHdvcmsgZGV2aWNlIHVzZWQgb24gdGhhdCBwbGF0
Zm9ybS4gSSBkb3VidCB0aGV5IHJlbGF0ZSB0byB5b3VyIGlzc3VlLg0KDQo+DQo+DQo+DQo+IFRy
aWVkIGJlbG93IHBhdGNoICwgc2VlbXMgZG9lcyBub3Qgd29yay4NCj4NCj4gaHR0cDovL2xrbWwu
aXUuZWR1L2h5cGVybWFpbC9saW51eC9rZXJuZWwvMjAxMC4xLzA1OTU3Lmh0bWwNCj4NCj4NCj4N
Cj4gRllJIC4uV2UgdHJpZWQgb3BlbkJtYyAyLjkgdmVyc2lvbi4gSXQgY2FuIHdvcmsgZmluZS4N
Cj4NCj4NCj4NCj4gQXR0YWNoZWQgaXMgdGhlIGNvbXBsZXRlIGJhY2t0cmFjZS4NCj4NCj4NCj4N
Cj4gVGhhbmtzDQo+DQo+DQo=
