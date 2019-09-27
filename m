Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD6FBFD98
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 05:25:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fcd55yHxzDqpR
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 13:25:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=apc01-sg2-obe.outbound.protection.outlook.com
 (client-ip=40.107.131.71; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=ctcchien@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="W/oRq5TK"; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310071.outbound.protection.outlook.com [40.107.131.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fcc85ZpNzDqbg
 for <openbmc@lists.ozlabs.org>; Fri, 27 Sep 2019 13:24:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fxf3apyZBVS0Nz4gr3ex3+CYp9HF7vwncaRjqmRjjYDVEozYwj6Jh594jRRtGqv5DM2KycKoddAJwdcTsySEFneW9BWHzHuJZq8umeFVWdpQ/bRbcKO3zpkqcEtCRLIrMX6I4/wEJbte4XMY0mumPyM9JHf1PtES+4C8dBUxgTV2CAvcZ6php+WTY1d38XSNvXYlU9odbUGy3KwCgNXEVX9zP0lDGgYuL8XY6278DDN+XUqEhBDB2TKnD6MPUJWTfdEmx5msbX2+3PSifrfnDQ0rgD1XAvm1A77w8brlJBROp/mc1rICm7RqiAnvE9cXcr3CGLXAd3kUN4svGyAhEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u53+XvW98KWtp0FIeJpKmlUnHRWgQtVEPmzWasRW3mc=;
 b=dscrpWkuYn1IaE/3t6qNlZQfesp39N7whj4JJOuPqFsD87ARdyGgHfrVyx8RupVb6BMCfMHWQW5qDb2gA8p+eO+qUx/y53W/opCR6FPgUTYUHlbij/N3h74VNY151zDMkBIQOoj4swdSEvGWLKvQifGZTNwZida/KFGACXVfL0LRy+qvWfXPXK3Tsv0d0q0cp52bR+osR40cfgFTwVswXeO6m8Qp0fgLuUtOvGHnkTPw6pRdSMgLLJhrngafhvt9nllX1u9FbmXkZv8zi2st0nTXANqtEZ7Twv2AKJQM2ijEyv/alu5QMpLRBjWRLNQBI8aeC5oAq//+2sV8QFjy2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u53+XvW98KWtp0FIeJpKmlUnHRWgQtVEPmzWasRW3mc=;
 b=W/oRq5TK5nPUuJOd27+wXgpQYZ8nR7ZgNsK3F2gLIyBWOWwN6jSgulF8t2tTnU2a/lD5VX6vPBpA12eRIHo8OxDIlbb3bLcOaoV5X9Ur/NyKQQz2Ib+m4ii8dD34DOq083JK2qFAeGGN/lPeW9N/N7H0w9Zsw6fjuqzRbeAqqJE=
Received: from HK0PR03MB5123.apcprd03.prod.outlook.com (52.132.237.76) by
 HK0PR03MB4116.apcprd03.prod.outlook.com (20.177.165.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.13; Fri, 27 Sep 2019 03:24:46 +0000
Received: from HK0PR03MB5123.apcprd03.prod.outlook.com
 ([fe80::9400:18ff:9877:eed1]) by HK0PR03MB5123.apcprd03.prod.outlook.com
 ([fe80::9400:18ff:9877:eed1%5]) with mapi id 15.20.2327.009; Fri, 27 Sep 2019
 03:24:46 +0000
From: CS20 CTCchien <CTCCHIEN@nuvoton.com>
To: Patrick Venture <venture@google.com>
Subject: RE: phosphor-ipmi-flash: A problem in BMC FW update over LPC
Thread-Topic: phosphor-ipmi-flash: A problem in BMC FW update over LPC
Thread-Index: AdVZo6Jl7YalvxqwR/SsXogzldHHZQAHWEgAAd5Z28ABflm+AAMEkbhAAATqboAANF9CcAATBCCAABmeUnA=
Date: Fri, 27 Sep 2019 03:24:46 +0000
Message-ID: <HK0PR03MB5123CF14A8A07F9D4A0D4875DF810@HK0PR03MB5123.apcprd03.prod.outlook.com>
References: <HK0PR03MB4068E6EB742A7088B92362A7AEA40@HK0PR03MB4068.apcprd03.prod.outlook.com>
 <CAO=notyaNX1JO2S6AdJd39oP-JqKef62G5w=2h2j-AXCrz1-WQ@mail.gmail.com>
 <HK0PR03MB5123707BA82D7033A19F36EADFBE0@HK0PR03MB5123.apcprd03.prod.outlook.com>
 <CAO=notwu0jC6+UMeadRtuHtT2Ywbu1iW0jMgtoJwnQUjak_Eag@mail.gmail.com>
 <HK0PR03MB51238E446D25BACAEA63D42ADF870@HK0PR03MB5123.apcprd03.prod.outlook.com>
 <CAO=notwkXhMERGn0Zq75QLFDTNvZKvr3vtCaTvsvcA0o-FvTFA@mail.gmail.com>
 <HK0PR03MB51234C094514020D58C9C68BDF860@HK0PR03MB5123.apcprd03.prod.outlook.com>
 <CAO=notz3Q9ZE4oVbHD8kBBHyt_fixECv7tzzkMLzHsemPJPdBA@mail.gmail.com>
In-Reply-To: <CAO=notz3Q9ZE4oVbHD8kBBHyt_fixECv7tzzkMLzHsemPJPdBA@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=CTCCHIEN@nuvoton.com; 
x-originating-ip: [60.250.194.161]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79d590f0-ad8e-4637-9f04-08d742fa3f0e
x-ms-traffictypediagnostic: HK0PR03MB4116:|HK0PR03MB4116:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <HK0PR03MB4116965980EB6563CD28BF18DF810@HK0PR03MB4116.apcprd03.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39850400004)(396003)(346002)(136003)(366004)(376002)(13464003)(189003)(199004)(99286004)(71200400001)(66066001)(7696005)(71190400001)(76176011)(64756008)(66446008)(76116006)(3846002)(66476007)(66556008)(486006)(33656002)(6116002)(2906002)(966005)(15650500001)(14454004)(26005)(446003)(6916009)(186003)(476003)(11346002)(102836004)(478600001)(4326008)(6506007)(66946007)(74316002)(52536014)(5660300002)(53546011)(6246003)(6306002)(8936002)(9686003)(81166006)(81156014)(7736002)(305945005)(6436002)(25786009)(256004)(8676002)(14444005)(86362001)(316002)(229853002)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HK0PR03MB4116;
 H:HK0PR03MB5123.apcprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nuvoton.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: exW0yj0Yj+FQL6+b4vrPxCFTiohKLxr8NRmwA97d8XQ1vQ0CBN1D6qOtbFDO5fFf6/IttRKVVb+W8jZ1Bgkkjqzbr76BgRUj7Z5lWE/+h1BM1KgSWsTfdr1dRq4RAX1pepxx43GXgdBylLmwvuhCDUkaYCkoAWf0oJnTRJzuUDYZn25nQ31cHxGR6JKpKRbUXAL13bKT9xmSJieFsUi/SkeLbnDlVjhs+reYFroC/bpMhIpJkcx+no1v3Q1G09ZF71xqilGZ7OPFSk/eJpfFhUAt2Yb+MvR++FZwtC/jqsehDA4TFnyQM6noOsKZPYJD/wSi5ggcQlY5GQtkD0voKGjnTJ0LyE0qL37GR2bWwyjaw/gjiWv13OTCHejKaEryseynBavK+JS2yYBqChd7s8hCI9pCxsz3nLZ1KbUvIZC9ToXE9qZI230McMwJwd4LLtbujVE2EWpmZbR/B77Uag==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d590f0-ad8e-4637-9f04-08d742fa3f0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 03:24:46.2994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G8UtluhGwQ8yKI6IPtqCV1Z1wL1U38c0gyPsD7qhgtir/JlvrHSuO04v1FRA/gOi3AlPNmveBglAS7RhQBXdAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB4116
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGVsbG8gIFBhdHJpY2ssDQoNCkkgYWRkIHRoZSBjb2RlIHRvIHBob3NwaG9yLWlwbWktZmxhc2gu
DQpCdXQgYnVpbGQgZmFpbGVkLA0KRG8geW91IGtub3cgaG93IGNvdWxkIEkga25vdyB3aGF0IGlz
IHRoZSBlcnJvcj8NClRoYW5rcw0KDQoNCg0KQi5SLg0KTWVkYWQNCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IFBhdHJpY2sgVmVudHVyZSA8dmVudHVyZUBnb29nbGUuY29tPg0K
U2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAyNiwgMjAxOSAxMDozMyBQTQ0KVG86IENTMjAgQ1RD
Y2hpZW4gPENUQ0NISUVOQG51dm90b24uY29tPg0KQ2M6IE9wZW5CTUMgTWFpbGxpc3QgPG9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IFJlOiBwaG9zcGhvci1pcG1pLWZsYXNoOiBB
IHByb2JsZW0gaW4gQk1DIEZXIHVwZGF0ZSBvdmVyIExQQw0KDQpPbiBXZWQsIFNlcCAyNSwgMjAx
OSBhdCAxMDozMCBQTSBDUzIwIENUQ2NoaWVuIDxDVENDSElFTkBudXZvdG9uLmNvbT4gd3JvdGU6
DQo+DQo+IEhlbGxvIFBhdHJpY2ssDQo+DQo+IFNob3VsZCBJIG1vdmUgZW5hYmxlLW51dm90b24t
cDJhLW1ib3ggYW5kIGVuYWJsZS1udXZvdG9uLXAyYS12Z2EgdG8gUEFDS0FHRUNPTkZJRyBpbiBw
aG9zcGhvci1pcG1pLWZsYXNoX2dpdC5iYj8NCg0KUGxlYXNlIGFkZCB0aGUgY29kZSB0aGF0IHN1
cHBvcnRzIHRoZW0gZmlyc3QgdG8gcGhvc3Bob3ItaXBtaS1mbGFzaC4NCk90aGVyd2lzZSB0aGV5
J3JlIGludmFsaWQgb3B0aW9ucy4NCg0KQWxzbywgcGxlYXNlIGFsd2F5cyBpbmNsdWRlIHRoZSBt
YWlsaW5nIGxpc3QgdW5sZXNzIHRoZSBjb21tdW5pY2F0aW9uIGlzIHN0cmljdGx5IGNvbmZpZGVu
dGlhbCBhbmQgdGhlbiBmb2xsb3cgd2hhdGV2ZXIgcnVsZXMgYXBwbHkuDQoNClRoYW5rcy4NCg0K
Pg0KPiBCLlIuDQo+IE1lZGFkDQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IFBhdHJpY2sgVmVudHVyZSA8dmVudHVyZUBnb29nbGUuY29tPg0KPiBTZW50OiBXZWRuZXNk
YXksIFNlcHRlbWJlciAyNSwgMjAxOSAxMjoyOSBQTQ0KPiBUbzogQ1MyMCBDVENjaGllbiA8Q1RD
Q0hJRU5AbnV2b3Rvbi5jb20+DQo+IFN1YmplY3Q6IFJlOiBwaG9zcGhvci1pcG1pLWZsYXNoOiBB
IHByb2JsZW0gaW4gQk1DIEZXIHVwZGF0ZSBvdmVyIExQQw0KPg0KPiBPbiBUdWUsIFNlcCAyNCwg
MjAxOSBhdCA3OjEwIFBNIENTMjAgQ1RDY2hpZW4gPENUQ0NISUVOQG51dm90b24uY29tPiB3cm90
ZToNCj4gPg0KPiA+IEhlbGxvIFBhdHJpY2ssDQo+ID4NCj4gPiBZb3UgbWVudGlvbmVkICIgSWYg
eW91IGRyb3BwZWQgdGhlc2UgdmFsdWVzIGluIG1ldGEtcGhvc3Bob3IvcmVjaXBlcy1waG9zcGhv
ci9pcG1pL3Bob3NwaG9yLWlwbWktZmxhc2hfZ2l0LmJiLCBJIHdvdWxkICsyIGl0LiINCj4gPg0K
PiA+IEluDQo+ID4NCj4gPiBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJs
P3U9aHR0cHMtM0FfX2dlcnJpdC5vcGVuYm1jLQ0KPiA+IDJEDQo+ID4gcHJvamVjdC54eXpfY19v
cGVuYm1jX21ldGEtMkRwaG9zcGhvcl8tMkJfMjU0NDBfM19udXZvdG9uLTJEbGF5ZXJfcmUNCj4g
PiBjaQ0KPiA+IHBlcy0yRHBob3NwaG9yX2lwbWlfcGhvc3Bob3ItMkRpcG1pLTJEZmxhc2gtNUYt
MjUyNTI1LmJiYXBwZW5kLTIzNSZkDQo+ID4gPUQNCj4gPiB3SUZhUSZjPXVlOG1POHpnQzRWWjRx
X2FOVkt0OEc5TUMwMVVGRG1pc3ZNUjFrLUVvRE0mcj1IcVQ0U2NiU1kyWU5UNA0KPiA+IHNGDQo+
ID4gQm1ERXJ6TmdNRGVLZlFtVGlSMDh4MnF0b2JnJm09cFUyZ0E4TW5EOGQ1TUxBeHFQVnREMWE0
Y09pZW5DM0YwSC0zQkcNCj4gPiA1YSBaODAmcz1JSXBLcHUxSVJGQ2cxZWd0TDdPbF9yZEhNY0pL
b2p1ckVfVUI1UnlvUFFvJmU9DQo+ID4NCj4gPiBkbyB5b3UgbWVhbiBJIHNob3VsZCBtb3ZlIHRo
ZXNlIHZhbHVlcyB0byBwaG9zcGhvci1pcG1pLWZsYXNoX2dpdC5iYiA/DQo+DQo+IFRoZSB0aHJl
ZSBudXZvdG9uIG5hbWVkIHZhbHVlcy4geWVhaD4gSWYgeW91IHB1dCB0aG9zZSB0aGVyZSwgdGhh
dCdkIG1ha2Ugc2Vuc2UgdG8gbWUuDQo+DQo+ID4NCj4gPiB0aGFua3MNCj4gPg0KPiA+IEIuUi4N
Cj4gPiBNZWRhZA0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiAgVGhlIHByaXZpbGVnZWQgY29uZmlk
ZW50aWFsIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGVtYWlsIGlzIGludGVuZGVkIGZv
ciB1c2Ugb25seSBieSB0aGUgYWRkcmVzc2VlcyBhcyBpbmRpY2F0ZWQgYnkgdGhlIG9yaWdpbmFs
IHNlbmRlciBvZiB0aGlzIGVtYWlsLiBJZiB5b3UgYXJlIG5vdCB0aGUgYWRkcmVzc2VlIGluZGlj
YXRlZCBpbiB0aGlzIGVtYWlsIG9yIGFyZSBub3QgcmVzcG9uc2libGUgZm9yIGRlbGl2ZXJ5IG9m
IHRoZSBlbWFpbCB0byBzdWNoIGEgcGVyc29uLCBwbGVhc2Uga2luZGx5IHJlcGx5IHRvIHRoZSBz
ZW5kZXIgaW5kaWNhdGluZyB0aGlzIGZhY3QgYW5kIGRlbGV0ZSBhbGwgY29waWVzIG9mIGl0IGZy
b20geW91ciBjb21wdXRlciBhbmQgbmV0d29yayBzZXJ2ZXIgaW1tZWRpYXRlbHkuIFlvdXIgY29v
cGVyYXRpb24gaXMgaGlnaGx5IGFwcHJlY2lhdGVkLiBJdCBpcyBhZHZpc2VkIHRoYXQgYW55IHVu
YXV0aG9yaXplZCB1c2Ugb2YgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIG9mIE51dm90b24gaXMg
c3RyaWN0bHkgcHJvaGliaXRlZDsgYW5kIGFueSBpbmZvcm1hdGlvbiBpbiB0aGlzIGVtYWlsIGly
cmVsZXZhbnQgdG8gdGhlIG9mZmljaWFsIGJ1c2luZXNzIG9mIE51dm90b24gc2hhbGwgYmUgZGVl
bWVkIGFzIG5laXRoZXIgZ2l2ZW4gbm9yIGVuZG9yc2VkIGJ5IE51dm90b24uDQo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo+ICBUaGUgcHJpdmlsZWdlZCBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gY29udGFpbmVk
IGluIHRoaXMgZW1haWwgaXMgaW50ZW5kZWQgZm9yIHVzZSBvbmx5IGJ5IHRoZSBhZGRyZXNzZWVz
IGFzIGluZGljYXRlZCBieSB0aGUgb3JpZ2luYWwgc2VuZGVyIG9mIHRoaXMgZW1haWwuIElmIHlv
dSBhcmUgbm90IHRoZSBhZGRyZXNzZWUgaW5kaWNhdGVkIGluIHRoaXMgZW1haWwgb3IgYXJlIG5v
dCByZXNwb25zaWJsZSBmb3IgZGVsaXZlcnkgb2YgdGhlIGVtYWlsIHRvIHN1Y2ggYSBwZXJzb24s
IHBsZWFzZSBraW5kbHkgcmVwbHkgdG8gdGhlIHNlbmRlciBpbmRpY2F0aW5nIHRoaXMgZmFjdCBh
bmQgZGVsZXRlIGFsbCBjb3BpZXMgb2YgaXQgZnJvbSB5b3VyIGNvbXB1dGVyIGFuZCBuZXR3b3Jr
IHNlcnZlciBpbW1lZGlhdGVseS4gWW91ciBjb29wZXJhdGlvbiBpcyBoaWdobHkgYXBwcmVjaWF0
ZWQuIEl0IGlzIGFkdmlzZWQgdGhhdCBhbnkgdW5hdXRob3JpemVkIHVzZSBvZiBjb25maWRlbnRp
YWwgaW5mb3JtYXRpb24gb2YgTnV2b3RvbiBpcyBzdHJpY3RseSBwcm9oaWJpdGVkOyBhbmQgYW55
IGluZm9ybWF0aW9uIGluIHRoaXMgZW1haWwgaXJyZWxldmFudCB0byB0aGUgb2ZmaWNpYWwgYnVz
aW5lc3Mgb2YgTnV2b3RvbiBzaGFsbCBiZSBkZWVtZWQgYXMgbmVpdGhlciBnaXZlbiBub3IgZW5k
b3JzZWQgYnkgTnV2b3Rvbi4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KIFRoZSBwcml2aWxlZ2VkIGNvbmZpZGVudGlh
bCBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlbWFpbCBpcyBpbnRlbmRlZCBmb3IgdXNl
IG9ubHkgYnkgdGhlIGFkZHJlc3NlZXMgYXMgaW5kaWNhdGVkIGJ5IHRoZSBvcmlnaW5hbCBzZW5k
ZXIgb2YgdGhpcyBlbWFpbC4gSWYgeW91IGFyZSBub3QgdGhlIGFkZHJlc3NlZSBpbmRpY2F0ZWQg
aW4gdGhpcyBlbWFpbCBvciBhcmUgbm90IHJlc3BvbnNpYmxlIGZvciBkZWxpdmVyeSBvZiB0aGUg
ZW1haWwgdG8gc3VjaCBhIHBlcnNvbiwgcGxlYXNlIGtpbmRseSByZXBseSB0byB0aGUgc2VuZGVy
IGluZGljYXRpbmcgdGhpcyBmYWN0IGFuZCBkZWxldGUgYWxsIGNvcGllcyBvZiBpdCBmcm9tIHlv
dXIgY29tcHV0ZXIgYW5kIG5ldHdvcmsgc2VydmVyIGltbWVkaWF0ZWx5LiBZb3VyIGNvb3BlcmF0
aW9uIGlzIGhpZ2hseSBhcHByZWNpYXRlZC4gSXQgaXMgYWR2aXNlZCB0aGF0IGFueSB1bmF1dGhv
cml6ZWQgdXNlIG9mIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBvZiBOdXZvdG9uIGlzIHN0cmlj
dGx5IHByb2hpYml0ZWQ7IGFuZCBhbnkgaW5mb3JtYXRpb24gaW4gdGhpcyBlbWFpbCBpcnJlbGV2
YW50IHRvIHRoZSBvZmZpY2lhbCBidXNpbmVzcyBvZiBOdXZvdG9uIHNoYWxsIGJlIGRlZW1lZCBh
cyBuZWl0aGVyIGdpdmVuIG5vciBlbmRvcnNlZCBieSBOdXZvdG9uLg0K
