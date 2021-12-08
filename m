Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D0D46CE69
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 08:34:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8878630Bz2yxx
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 18:34:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=oIVoVqc7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hotmail.com (client-ip=40.92.40.60;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=zkxz@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=oIVoVqc7; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn2060.outbound.protection.outlook.com [40.92.40.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J886c27Qsz2ymr
 for <openbmc@lists.ozlabs.org>; Wed,  8 Dec 2021 18:33:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knBuWyogP/WYvKf5ls79A3Oc9ppSW8xzTPbuR3Ox5tUUrNO7+teqnwN0AFbMDPRvkU80UeM88XiJKXg+ryhcsIsg4Fjql23nG1T1yeR3vU7w9HgcEiBGiObVFuZqOPhV/phVb+DvUNSzJ5qnnOpDFUHAKKPfWzJy00Wq/Z/SnIrmuYYp/3ODfBIdbUs1SBxJISiZDbELehKtl5Z4BSCSPPhV+NwKBhXWhgfBkn7MLQg/HrQXnRWZbvrMEum/quGSPAUm3zJOzswfmisMPuk/4UWnVBwGV9xjFoa9CM0y8Z/W1GB00j0O7acK8NDCwkVkuM3UnVVln+pcimqAp7ordQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLeKNLYTjbd79pZ/rnxEUV62HaxkM6LGL9CLWsGdw5c=;
 b=bamH5IJU0Ds2Wjx+hyvi4Dq6v/7vLu9pWfwVDDzeCloHrgK/xJRsyPb5UIHrvHssaZvBuh1NZeFHvg3ylccxiXvtmhmp8890RDvh0KM1OBR7vFXMoPT/aI93MjIPod2LVLQwJmFuiEl1yyflkc6WRjjODNc266sKo+TaZrr0KwIu3cipkDU2BRUqn48ytyLNAW4JitSzkP+UIdsCBvQI+EhUwzO8NFISzo8g40nA4bJ/hEBrOnzksjXHOY28luU9u5lDG8AoPhhWmyGX2cWlgCPxi5n5ZpOU8ip0mkBJNayZD3LHC0iTeH4UOUcVu3W++ZcynNYRhrNfynxN9DcHZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLeKNLYTjbd79pZ/rnxEUV62HaxkM6LGL9CLWsGdw5c=;
 b=oIVoVqc7CDNGau3uvtFim6JEdI+00QWsOH8lUGaoNnXTdrh2oc0xb4Re9SzmHWl/1UpyVMpDUO6kHmwHFxH+f8cRQoffI1OnwFMiqDhy6ljqxCeeZXyhTOXg3h2iVji/KgToCbtSBv6KkF5F5NZB3mNlnxuRpizPF4JE3MFKdRRjJ30IeXb/6ZT0xtctJ+NE6OBtbgR8fnPjb6J1vvJGjG7B9KXaR3jH0N2/xWTAY+z4ufWqOhuJAwUvfp96PnJee82Y9y5zALsc0Flir2aiMODw3dOeyCEpwSLuVNi5mYIZRpEeT9QrIn0wSP83VD2FNeoWsCAAkXiwLzTcooqfyQ==
Received: from SJ0PR14MB4805.namprd14.prod.outlook.com (2603:10b6:a03:376::7)
 by BYAPR14MB2279.namprd14.prod.outlook.com (2603:10b6:a02:b2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Wed, 8 Dec
 2021 07:33:20 +0000
Received: from SJ0PR14MB4805.namprd14.prod.outlook.com
 ([fe80::a07a:241:95b4:bbae]) by SJ0PR14MB4805.namprd14.prod.outlook.com
 ([fe80::a07a:241:95b4:bbae%6]) with mapi id 15.20.4755.021; Wed, 8 Dec 2021
 07:33:20 +0000
From: Kun Zhao <zkxz@hotmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: Any cmdline tools to modify DBus
Thread-Topic: Any cmdline tools to modify DBus
Thread-Index: Adfoc1KRRnzGloZ9RVOnQZdSCvUk9wAwr0KAALPnW9A=
Date: Wed, 8 Dec 2021 07:33:19 +0000
Message-ID: <SJ0PR14MB4805E542324051E7A3E55BFADC6F9@SJ0PR14MB4805.namprd14.prod.outlook.com>
References: <SJ0PR14MB48051F038B0094EDF6662CCDDC6A9@SJ0PR14MB4805.namprd14.prod.outlook.com>
 <YauoG2/JyAeyqT1z@heinlein>
In-Reply-To: <YauoG2/JyAeyqT1z@heinlein>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [CZigaXpr66X0LvQhCvZer53pqMJf+500]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1726f9a6-00ba-4e59-4111-08d9ba1d0204
x-ms-traffictypediagnostic: BYAPR14MB2279:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mkq3gNO42gytR/iIFA2yERc+adWGEii/iC0qPXRWsyDDgaUVNDuEkNyILPBHBB3AA6Dx15PM2XPHhqMXY6mRr8AwSXd/KZJsnSMplRZGqP9Hmh7Dj6Uq7P2qX+lh0qZSjnGs9fwmVFfK73f0D6afGI4Wp9rmwjVn2llDZ1yiXF45zIYNyV9PMUJDLwuPQgBw2IVG/87eEVsJKqj1ZyM5w4Be3ccZII2wlr71Qs1TmQA4nJ9eE+Qq2KuPAoNneX4S8fD7NTUBbj44hRi079ju3Dvkl9BNsSCYSHmdBe9pgsBC7ZLxzmLz67GcAO4zCMtlscF5zCYonn1X8jPE7LjIMLyJlIgrlOjYRx0NWGFq/ILaXWdpWDRCZd9lJ6+nH1G4OGVqCi5slN8YKtxYR0jlwuPHSeK/Iz2RgPjetHXCtL+YLiGQSqtSfPLMezKWSDUPEdPS+NWzHvTdsRacvJp4YLoFCi3iv2E4b4syYdIuWmnNdb1leQMJT72EHPq6+WXNrm7P63NAixjrO8D2tUIBb30rk14pQN8BSjR1AKsy0eJEIPsHG2EEahPcYdqHfCmnltOL274ixJ/XOzkl2KAKDA==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: qxP+ZmnDTUyFZF1mgxbwGSxfAHlYscBZs8OGiV8FQmd/5ao67Q88e6tOHSJ7OUswAhZvfS/70uFJ4ePH01o/LbiRWw2SC3BjIij6Q+ga02wfNdlFNxA894xNt4Y2ptH+xrHUKVvPd4Ph/w4nx9ziYuMbKWeA7TWj4WQUraacKUuFa1I3MdVWuonQcc3YyQb5EEtpmK4RiDQy/NCjzrtLum4ciXwLUM+YZI7HaJ/eYk/4WKmMrQkUHU+djoTenHovauK+HtXRLiuXdiQPR6cL6nsUlrFDcpJHaLSt72Sr/s48gSHQzToJ+0pWRlxG7lVExINdsy4NZJMi/S1Wm2TiipEx1NHgyPjM9Kz23SO6LDM1YUbfJVa9jY0qHPPA3HYJnV6T+Wnogec1jT7XeHxhAd1LlUjl5JLSAWAUmsT9cHxydI050TyqPY/uzC2tAq4hkSX9FVjQMnWsdffTVr6r+KnS0mtGokcsuMVH3BoCnK+N2bdom+or8U2+b20k8WKkJLo/iFEOqYNX9Gjm9MmkPrZ+nKlYV/MxCnPwJWx5Mcnj/A3hdToBMdqnIYgiSDN6lWpUBwuOxdIXe5/y2ryRGXLvTmbVEukUKTSnN82rCuN3ExwKQa+y7uVvMIEeQd2bxT6DfNuv0n3W069Ys8iNDXb2PFHdZed6PF/vcrHVf6lbJVnGth9AJpJuSw0cw5PqJ4HPUYan+54c3wFqmRLGsZvwY/WETUjRiW3iPlGQOzmrxt75+SRahfZ1vplKX52TLJGhe2pI38q7iY+46Ttw2yspBnfb0AO/ZDFdWWCo0pqWqshq3WTxT9cwHnyWpB3FpZwEu4QUJdW01p+65PgOwB/WrTpVn++WyjnQgA2K3mgvAj0uz9hh2F1teKvcQ8rUNuNFjpmAIKP9D1Nb2/aqHgszuxrrOPEM4fwoHkNiyHnnsajUvDehzz6rnf8DuqnS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-cd57b.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR14MB4805.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1726f9a6-00ba-4e59-4111-08d9ba1d0204
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2021 07:33:19.9491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR14MB2279
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

VGhhbmtzIFBhdHJpY2suIEFueSBwbGFuIHRvIGltcGxlbWVudCB0aG9zZT8NCg0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXRyaWNrIFdpbGxpYW1zIFttYWlsdG86cGF0
cmlja0BzdHdjeC54eXpdDQo+IFNlbnQ6IFNhdHVyZGF5LCBEZWNlbWJlciA0LCAyMDIxIDk6NDEg
QU0NCj4gVG86IEt1biBaaGFvIDx6a3h6QGhvdG1haWwuY29tPg0KPiBDYzogb3BlbmJtY0BsaXN0
cy5vemxhYnMub3JnDQo+IFN1YmplY3Q6IFJlOiBBbnkgY21kbGluZSB0b29scyB0byBtb2RpZnkg
REJ1cw0KPiANCj4gT24gRnJpLCBEZWMgMDMsIDIwMjEgYXQgMDY6MzE6NDRQTSArMDAwMCwgS3Vu
IFpoYW8gd3JvdGU6DQo+ID4gSXMgdGhlcmUgYW55IGNtZCB0byBjcmVhdGUvZGVsZXRlIGludGVy
ZmFjZS9wcm9wZXJ0eSBvZiBleGlzdGluZyBEQnVzDQo+IG9iamVjdHMgY3JlYXRlZCBieSBvdGhl
ciBzZXJ2aWNlcz8gTG9va2luZyBmb3IgYW4gZWFzaWVyIHdheSB0byBxdWlja2x5IGRvIGl0DQo+
IGZvciBkZWJ1Z2dpbmcgaW4gZWFybHkgZGV2ZWxvcG1lbnQgcGhhc2Ugd2l0aG91dCBjb2Rpbmcu
DQo+ID4gUGxlYXNlIGFkdmlzZS4NCj4gDQo+IEkgZG9uJ3Qga25vdyBvZiBhbnl0aGluZyBhdCB0
aGlzIHRpbWUuDQo+IA0KPiBPbmNlIEkgYWRkIHRoZSBjbGllbnQgYmluZGluZ3MgaW4gc2RidXNw
bHVzLCBJIGNvbnNpZGVyZWQgaXQgd291bGQgYmUgZmFpcmx5DQo+IGVhc3kgdG8gd3JpdGUgYSBz
bWFsbCBDTEkgdGhhdCBhbGxvd2VkIGludGVycm9nYXRpb24gb2YgdGhlIGRidXMgb2JqZWN0cyBp
biBhDQo+IGZyaWVuZGxpZXIgd2F5LiAgV2UgY291bGQgYWxzbyBhbGxvdyB0aGF0IHRvIHVzZSB0
aGUgc2VydmVyIGJpbmRpbmdzIHRvIGNyZWF0ZQ0KPiBzaW1wbGUgdGVzdCBleGVjdXRhYmxlcy4N
Cj4gDQo+IC0tDQo+IFBhdHJpY2sgV2lsbGlhbXMNCg==
