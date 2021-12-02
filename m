Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2087A466010
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 10:01:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4VLZ0CqCz304j
	for <lists+openbmc@lfdr.de>; Thu,  2 Dec 2021 20:01:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=quantacorp.onmicrosoft.com header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-quantacorp-onmicrosoft-com header.b=lm03E5cN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=40.107.255.127;
 helo=apc01-psa-obe.outbound.protection.outlook.com;
 envelope-from=spencer.ku@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quantacorp.onmicrosoft.com
 header.i=@quantacorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-quantacorp-onmicrosoft-com header.b=lm03E5cN; 
 dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2127.outbound.protection.outlook.com [40.107.255.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4VL15LJYz2xtp
 for <openbmc@lists.ozlabs.org>; Thu,  2 Dec 2021 20:00:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7lAgMbFeJ0VZ3CYakretExZBxceURqKi4jOxbTS81g/CqcDk5c/G5qAXrh6hnQF0cIA2AS9AkRvctJpZgxcWWGnROOxn4ksb3AHn0sTLys2wHQ9gvf2mwV7cGIPL3AnbKRBVBGEZeUAUbMPmAO3rcYNgfrzkas88fO+iPlKLiKL4WnH6ZDB61nQzKYizoxvla6shjeXuta8M9m3e0RtVzQX9XGIqKaf/re4QkAEXZcUlS12S+B2TrSoArP07t0XnvDcDEnQ3ir0zmTXQjBwOj350gSUFK+KPxLNEjJJOQwvTt0emHhpXXC3+ZI2rBl8QpWwHW0TWZ/wLbaMx5zToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIaNMhDRAhiTIUcleEPKo/SHuOVYkkfF1Y0zIoa/Nzk=;
 b=Q0TxCzHp+1TDpF8zBmS9vm/PzC0kZpB1DsNzaXCtcI0a29kphWvSmJYLjAm43DHJ8MkSa7ZMC1qxDDFEdTEZDAdT7mxzgFrDAzzmvCttZjrC/Cz1ZvwzR1JUF2BasfnVKjlv8HoI75mVwKxhZUeorYfDLsa/y8w7Nx4173RRABESXdykkR5Y81QDMnIu+7me1MLE79VrKJgJsAJlGvDe622cd+cF2zn50uWYPBQURx/ummhBBYOwgR+NxC9JZxKPTNKZFpC5qVUxY2kIX7GcoGyUt7W1JAaFgT7WmyAgjSJAoWPpXDz3j6QUHAYymys1u1GHjwZwp6Y1arhFtCzN/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quantatw.com; dmarc=pass action=none header.from=quantatw.com;
 dkim=pass header.d=quantatw.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quantacorp.onmicrosoft.com; s=selector2-quantacorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIaNMhDRAhiTIUcleEPKo/SHuOVYkkfF1Y0zIoa/Nzk=;
 b=lm03E5cN8qX08c9sZ21Od+VhYH1cRIU6Kf+eHEPe8/WGpmbx5gIRKL8g9oAnuALrmnAepwaTtwufX6R9awsnBemJoWhu/pPezj2r33yS3Smd8VqY8Ju6SXbBE0w2Z8KMa2FelUyswv6Jat3FblUX2FB5iD/+GPUxGuKSH1oneDQ=
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com (2603:1096:203:8f::22)
 by HK0PR04MB2642.apcprd04.prod.outlook.com (2603:1096:203:6b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 08:45:33 +0000
Received: from HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::d4e:4ad3:ca0e:c44c]) by HK0PR04MB3299.apcprd04.prod.outlook.com
 ([fe80::d4e:4ad3:ca0e:c44c%7]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 08:45:33 +0000
From: =?utf-8?B?U3BlbmNlciBLdSAo5Y+k5LiW55GcKQ==?= <Spencer.Ku@quantatw.com>
To: Ed Tanous <edtanous@google.com>
Subject: RE: Implement Ethernet Interface Properties
Thread-Topic: Implement Ethernet Interface Properties
Thread-Index: AdfmmeLt8bsv+QLKRK2scPouEluJvQARsvaAABzs1sA=
Date: Thu, 2 Dec 2021 08:45:33 +0000
Message-ID: <HK0PR04MB3299920FAFF33D27C503A218E4699@HK0PR04MB3299.apcprd04.prod.outlook.com>
References: <HK0PR04MB329947E4E37431B956A8D17AE4689@HK0PR04MB3299.apcprd04.prod.outlook.com>
 <CAH2-KxDx2BwNMWaGvzUeQZVt4me5WSBvkni3A0ig-ohtxiWEUQ@mail.gmail.com>
In-Reply-To: <CAH2-KxDx2BwNMWaGvzUeQZVt4me5WSBvkni3A0ig-ohtxiWEUQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quantatw.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b72c294-9ebf-45f8-701f-08d9b5701a79
x-ms-traffictypediagnostic: HK0PR04MB2642:
x-microsoft-antispam-prvs: <HK0PR04MB26426AC59F3F4A25DEBF413CE4699@HK0PR04MB2642.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zLwKCHjXUV4Ro3pEYUbqO1H9q66uOPEBAWq2FWKdiSOiHPSJa3Fp8ZTzv4cdfVUn6NIuPNbbN2+7rVMkvs2tHXM+myCER1xL6Pb9cFi/qTZG3qPzUcElAZR8rumaNkuTw4I5m50pinBv0DEdIEIqW2bQD4uk/1f6A6NDTjt+5obXqkTKpqp24l94t4/8e0reZp3XSQWkporAMVsuRSemQkPn7LguUL1YhynSzK3U3Cj0okohkMMTz8Qm6Y/vgG+KkgV6rY54qIXPT2+oTYVmkQMJmyGN76jFZ4Za2wmrX4WD8qet14g43DlOWJli1/I3Audyt/GJUrFFa8sw/TQoP/z+U1BBBl3/h9Wh10gFByH8VPYZUCpwno2atKaFlMe2iRjy6MckXyF26FgeOI6XWpnCRSz1wEPZXBtME3RDKtYDn1Q8REP1UNfw+Y2b3ZYNwAE49/a2Ywwb13K7/rzOZ1j+5eln8PUQRwlhQSjsC46OuU5mD1AO96kX9KyT21Fuq/Qplzt7x4KNdUOMRnm3WIWzO/tj0LPEnhc7VOu0wysbP/zczEju3+9jJN83TxCZnrjfHSvqUwCmjgYxxy+bUukshpSi4kZbEIC/6uE43M0npzkoyDKjRDGRU0xy4XhVwjBzIXTD/QLcdy5enYXhhYUSxxVQmLk4lxydteuT3bBecJF86vRaupo3bKSrEDzXczzLUtfHwzy1Z6og8602gQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR04MB3299.apcprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(3480700007)(53546011)(66446008)(6916009)(4326008)(33656002)(5660300002)(66556008)(64756008)(66476007)(86362001)(52536014)(9686003)(38070700005)(7696005)(83380400001)(38100700002)(6506007)(76116006)(54906003)(122000001)(55016003)(8676002)(85182001)(2906002)(316002)(26005)(71200400001)(66946007)(8936002)(508600001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RzRrT3l4RnBhbkc2Sm5pVlFLU2NrbjVReTJBMjB1MDJmVUp4TXUwNitROStS?=
 =?utf-8?B?Mk83UHkxWW5FS3lvZzk2TEJBMXpxM3dEOFBYR0U4eFpHZ0hOMFVvaDZRNU43?=
 =?utf-8?B?RlNDMTluc2Y2ZXYzQW5uVFRYUHUvSTVsZFJXbnFxc3NWWlpUWnlTNGgzRklZ?=
 =?utf-8?B?eEVKOW9HOUt1NVdjR0Z0MWkxeEtjNGhtTXIrcExySzlYcTBZLzFUUkFpVnFE?=
 =?utf-8?B?RmJpYzJIUkhMcklHZGMzUXJWYXgxd1BzaUExa3NmaVFzVDB4cm9lQXJ6VUN1?=
 =?utf-8?B?d3ozYWxBSGphYTFpdUd3cUVEczl5OEZoNWI5RHp0bkhlODNjT3QwdUpFT2Jp?=
 =?utf-8?B?RFYzL0ZGZzQyb0FGa2RHditoUWNrOHFpUHI2R2lHK2RqR01qZjVHOWRxMFlJ?=
 =?utf-8?B?UzE1anFQRGdMZXp0YS9MTVlZdVRDdlZhTkNRL3ZTcEpwMzY0Z09RdVNKTjdW?=
 =?utf-8?B?anhNUjZRbWwxbGNqZEVtamlubjNqMC9icEJNTHNuc0NNMjlIU0t1TzMvTXpG?=
 =?utf-8?B?Z3F2eUFNbkJZSllUbkJVRnlvQklKbHBWaFFZVld5bHNTcGVqUXhTcm43ajN6?=
 =?utf-8?B?UUhEaGtCaUpIV3A2Q3pNYldhZXR6bDNVWVZ2QnNiMGVCM3BIdEhVR1pMSXh6?=
 =?utf-8?B?SmloS1VZcmhBemdwVy80OFl4Ym9nOUJ0ZTE3Nzh6cTZBeTQyUm5oaE9NVkJJ?=
 =?utf-8?B?ZjVnUFBGcE5FbWFXWUF1MVdlT1R1SngvZ3RJSXVoMkl1eDFCeHFVK2lJWUE0?=
 =?utf-8?B?RitsMm52eklsMlRJMnlvejNiRE5SbEZ6RTkyKytzYTVpMHdQRytDd0pZQVMw?=
 =?utf-8?B?VENxdHVYTVN2NFdPZ3BSNnlCeitrZ3h5dVIzUmI0d2tBem1ZZzhyR1IyMTVQ?=
 =?utf-8?B?bVBZS2RodUpOYXhFZ1g1OEpDS2d5WTNTWGhZLzlSNnppVmNVRVFmYndMSFVK?=
 =?utf-8?B?WmVBaVJBWDBKU1lVNWUrQnVFWFh4M3BRdDh6RDdCMVFsSU04ZTg2aWpVN3p4?=
 =?utf-8?B?TGwyU0lWd0FJcnRvUElYb0t5TFJFSVpJaU1LUk1qVXB3SXFKZ2FuV0FWZS9i?=
 =?utf-8?B?cFpqTmJDQjQzWnhkc1ZRZjUxc25xRXV3a1U3Z1MvTzU4ak1MMGdFc0pONHo0?=
 =?utf-8?B?UVc1TmFKU1lQRVNGSVN5VWRId0MvSEpraDZyL1NEaGgrZlVhRUJxblN1bGs1?=
 =?utf-8?B?TThpWEkvSFgyd3QwSG5NQmlhWGtxa3E4YmdMSnh5TWNzd2hTZHhjWmgvNE9K?=
 =?utf-8?B?Z2dWWjVRMUY2QWxTU2l3ZHJqTXQreElFOFo0OXVWbG4zUVBHVjl4Zkg4dVQw?=
 =?utf-8?B?U2lnblo1VkRnWVE0ZUU2VFJCTUZwREx4TzhLZUZQOWQ2Nks0R3hrN0JLQWEz?=
 =?utf-8?B?ZGFtZmR6Q1ZmMUFpU2VVK3ZYWXIvdENWWUhjU2dKMzhBZ2NBYys2YmNsWVBt?=
 =?utf-8?B?WUdyVFg1R0dEYmN6L1BjZzBKS0pRcWZKZkNKYnZTWjRBYzdLNTBsVGVyck1l?=
 =?utf-8?B?YVdReGpOYXFJSUpHbjBWNlVVWkUxbFZ6ODkraVNxK0FrcmJmdjQvU1psUEZL?=
 =?utf-8?B?Sm96dDlLdmVjVitweHRIaEdaWjEvcUNpOUJ1WlpGa055a3d6Ymtjb3BVcjIz?=
 =?utf-8?B?S3J3STM4ZEp2TEI2NE5nczRmdENXankwbHdWYmVma3hsKzBMT0xDcjJQM3Av?=
 =?utf-8?B?cnBjMlpVRWE3QldaZzhyV3A5b0EzbTBsTHc1T1IzalMyd3g3OUljOGVQNE52?=
 =?utf-8?B?VHhnSkZ6Z1hKdCtZZnFHdjduWjluR1VqcERQSTV5bmhSbmxhcHlPT0VmalhQ?=
 =?utf-8?B?dFRFWTRmZjI2cGRrZjdqbFEydXZ2dDEvM3Rka0Fwc1pOUFBJWmVwYWpWUVlh?=
 =?utf-8?B?U1cwTmxjUEdtYUlwVW1HQWE2STlHRjdSQ3VQbHJBWnV6eUJrVkt4RVdGbGhL?=
 =?utf-8?B?S3FPTTZJTGJWYi9oZjNPcHhZNUJCNWQxOEZqU0c5U3o5NGdRczFUNmRiUmdv?=
 =?utf-8?B?dDI4aWorRkc2VDBPODJuTXVOc1pYOFl6TGtjQWo5L0svbTk5OVd6V2R0MkVB?=
 =?utf-8?B?SFBGNzloQ3RxRkpQamgrTHVJV3RDZXZ1VVgvaDZtcHVSNXYvQXpWUmxDcFhs?=
 =?utf-8?B?VXdzYXpGdnJVRkFPOHFLMFZnbklUS29Yajk4V3VxWCtqaXNzMlp1dU9vNjlZ?=
 =?utf-8?Q?E2lR1m5vZgC1YLPd9Shxplk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quantatw.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR04MB3299.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b72c294-9ebf-45f8-701f-08d9b5701a79
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2021 08:45:33.3287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 179b0327-07fc-4973-ac73-8de7313561b2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZydBK4DHW0m/dPwFM4TUonDW/fMZqIyX3ZmI2SAjRgWiVgITSYWvhwziodXg1Qx60FdaHz/+s6lA7xARSDIKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2642
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

PiBPbiBXZWQsIERlYyAxLCAyMDIxIGF0IDE6NTkgQU0gU3BlbmNlciBLdSAo5Y+k5LiW55GcKQ0K
PiA8U3BlbmNlci5LdUBxdWFudGF0dy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gSGkgQWxsLA0KPiA+
DQo+ID4NCj4gPg0KPiA+IFdlIHdhbnQgdG8gaW1wbGVtZW50IHR3byBuZXR3b3JrIEV0aGVybmV0
IGludGVyZmFjZSBwcm9wZXJ0aWVzDQo+IOKAnEJhbmR3aWR0aOKAnSBhbmQg4oCcRHJvcCBwYWNr
YWdlIHJhdGXigJ0sIGFuZCBleHBvc2UgdGhlIGluZm9ybWF0aW9uIHZpYQ0KPiBSZWRmaXNoLiBU
aGUgZ29hbCBpcyB0aGF0IGNsaWVudHMgY2FuIHRhbGsgdG8gYm1jIHZpYSBSZWRmaXNoIGFuZCBn
ZXQgdGhvc2UgdHdvDQo+IGluZm9ybWF0aW9uLiBJdCB3aWxsIGltcHJvdmUgdGhlIGRlYnVnZ2Fi
aWxpdHkgb2YgQk1Dcy4NCj4gPg0KPiANCj4gVGhlIG9ubHkgdGhpbmcgSSB3b3VsZCBub3RlIGlu
IHlvdXIgcGxhbiBpcyB0aGF0IFJlZGZpc2ggZ2VuZXJhbGx5IGRvZXNuJ3QNCj4gZXhwb3NlIGFu
eXRoaW5nIGFzIGEgInJhdGUiLCBpdCBleHBvc2VzIGl0IGFzIGEgY291bnQgKHBhY2tldCBjb3Vu
dCwgZHJvcCBjb3VudCksDQo+IGFuZCBsZXRzIHRoZSBjbGllbnQgZGV0ZXJtaW5lIHdoYXRldmVy
IHNhbXBsaW5nIHJhdGUgdGhleSB3YW50LiAgSSBzdXNwZWN0DQo+IHlvdSBzaG91bGQgZG8gdGhl
IHNhbWUuDQoNClRoYW5rcyBmb3IgeW91ciBleHBsYW5hdGlvbiEgSSB3aWxsIGZvbGxvdyB0aGUg
ZmVlZGJhY2sgdG8gSSBpbXBsZW1lbnQgdGhpcyBmZWF0dXJlLg0KDQo+IA0KPiBBbHNvLCBJJ20g
YXNzdW1pbmcgImRyb3AgcGFja2FnZSByYXRlIiB3YXMgYSB0eXBvIGZvciAiZHJvcHBlZCBwYWNr
ZXRzIHJhdGUiPw0KDQpZZXMgLCBpdCBzaG91bGQgYmUgImRyb3BwZWQgcGFja2V0cyByYXRlIiwg
c29ycnkgZm9yIHRoZSB0eXBvLg0KDQo+IA0KPiA+DQo+ID4NCj4gPiBBYm91dCB0aGUgaW1wbGVt
ZW50IG1ldGhvZCwgd2UgZGl2aWRlIHRoZSB3b3JrIGludG8gdHdvIHBhcnRzOg0KPiBwaG9zcGhv
ci1uZXR3b3JrKG9yIG90aGVyIHN1aXRhYmxlIHNlcnZpY2UpIHBhcnQsIGFuZCBibWN3ZWIgcGFy
dC4NCj4gPg0KPiA+IEZvciBwaG9zcGhvci1uZXR3b3JrIHBhcnQsIHdlIHByb3Bvc2UgdG8gdXNl
IGV4aXN0aW5nIHRvb2wgbGlrZSBpcGVydCB0byBnZXQNCj4gdGhlIEV0aGVybmV0IEJXL0Ryb3Ag
cGFja2FnZSByYXRlLiBPciB0aGUgb3RoZXIgbWV0aG9kIGlzIHRoYXQgcmVhZCBUWC9SWA0KPiBm
cm9tIGV0aGVybmV0IGRyaXZlciAoL3N5cy9jbGFzcy9uZXQve0V0aGVybmV0X05hbWV9KSwgdGhl
biBjYWxjdWxhdGUgdGhlDQo+IEJXL0Ryb3AgcGFja2FnZSByYXRlLiBBZnRlciB0aGF0LCB3ZSB3
aWxsIG5lZWQgdG8gcmVnaXN0ZXIgdGhlIEQtQnVzIGludGVyZmFjZQ0KPiBhbmQgc3luYyB0aGUg
cHJvcGVydHkgaW5mbyB0byB0aGF0IEQtQnVzLg0KPiA+DQo+ID4NCj4gPg0KPiA+IEZvciBibWN3
ZWIgcGFydCwgYXMgSSBrbm93IHNvIGZhciwgdGhlcmUgaGFzIG5vIHN1aXRhYmxlIGZpZWxkIHVu
ZGVyIHRoZQ0KPiBFdGhlcm5ldEludGVyZmFjZSB0byBzZXQgQlcvRHJvcCBwYWNrYWdlIHJhdGUu
IFRoZSBpZGVhIGlzIHRoYXQgcmVhZCB0aGUgdmFsdWUNCj4gZnJvbSBELWJ1cyB0aGVuIHNldCB0
aGUgcHJvcGVydGllcyB1bmRlciB0aGUgRXRoZXJuZXRJbnRlcmZhY2UgT0VNIGZpZWxkLg0KPiBQ
bGVhc2UgbGV0IG1lIGtub3cgaWYgSSBoYXZlIG1pc3NlZCBhbnl0aGluZy4NCj4gDQo+IENvbnNp
ZGVyaW5nIHRoYXQgbm90IGFsbCBOSUNzIHdpbGwgaGF2ZSB0aGlzIHRlbGVtZXRyeSwgaXQgcHJv
YmFibHkgbWFrZXMgc2Vuc2UNCj4gdG8gaGF2ZSBpdCBvbiBhIHNlcGFyYXRlIGRidXMgaW50ZXJm
YWNlLg0KDQpVbmRlcnN0YW5kLCBJIHdpbGwgbm90aWNlIHRoaXMgcGFydCB3aGVuIEkgcmVnaXN0
ZXIgdGhlIEQtQnVzIGludGVyZmFjZS4NCg0KPiANCj4gPg0KPiA+DQo+ID4NCj4gPiBXZSBhcmUg
d2lsbGluZyB0byBzZWUgYW55IHN1Z2dlc3Rpb25zIGFuZCBhbHRlcm5hdGl2ZXMgYXMgd2VsbC4g
VGhhbmtzIQ0KPiA+DQo+ID4NCj4gPg0KPiA+IFNpbmNlcmVseSwNCj4gPg0KPiA+IFNwZW5jZXIg
S3UNCg==
