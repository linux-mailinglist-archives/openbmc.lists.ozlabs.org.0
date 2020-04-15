Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 780881A999E
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 11:54:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492HkL6y9JzDqvx
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 19:54:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vertiv.com (client-ip=2a01:111:f400:7eab::62b;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=troy.lee@vertiv.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vertiv.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vertivco.onmicrosoft.com
 header.i=@vertivco.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-vertivco-onmicrosoft-com header.b=QWjWphvA; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492HjF5TQYzDq7k
 for <openbmc@lists.ozlabs.org>; Wed, 15 Apr 2020 19:53:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V51ycOGnM8NM+lJlS11UIFJwuybzkrNy2O1WzMmKVUXYLGpHcONAiGBVqTmucdFd84/mqpSVztCq4hSBuao2WwkIm86whhIzoVPEGvzTPfXL3d5xsDRWn8Gh9KFKbO+N2faGXXVWf6y4bL9/I3ZYKTJvLVhx2yutrUeAlA6Nrz0trcy4TCU1MB8BcRX0bTK8EAPy3fiyoVdoFHuf7vKz79lqEFY0FlMyhGuDJ8adLQbCaec09/1GB2KYFb6QtF3Y+xkAHMdHnXwdXaf/FCl1rDMV2oT/0xRBXrBRzK8693kezu/VVeQRUr0T5Cb4BW+vzEIoRfiD6szj6DtlgxthpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89EXEFXwGUhlz3NpGGgyYXJdbaCq1aRGkZLp9l2DrBU=;
 b=Xe9ADbIlU8z547oLT1Hg2LQNv9TlO0wn7BFD6V42vR//kbf47TQ79mQRvZSE1MiFMcr+brhtcufNiDrk4Uf84blH2ikt8ojH8QUrK1ukJNU17igqCqtZkuh6fzCI7v1j0aQnpIQpZG2S1E9Zz3RWfsdEcPtNrSUcO408V1L2vXrRNWuzWduC9+4N4SwPXK6Gf6U39MV/yJD9lzRNGsoKPeXxj4WrDWc/Rm4xt4JnYYLrLJxJujVWX/wQH6+j3WrOTOxznXtlKcJyqBV6iXXgDQqvH/rdK+U+5NBmvpE+wQBzMfvaZzpd7LEI6ZpNGYrLS6iS70Mhjy8Pk8GikoLmeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vertiv.com; dmarc=pass action=none header.from=vertiv.com;
 dkim=pass header.d=vertiv.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vertivco.onmicrosoft.com; s=selector2-vertivco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89EXEFXwGUhlz3NpGGgyYXJdbaCq1aRGkZLp9l2DrBU=;
 b=QWjWphvAJhrsG3Zdz6YmPv2nV6iOZhZTzzgivRg43nwFC3m/ailcx0vtPZqJr2W+SsEfXk6mLpNPlh0Zwe4W/wOBKuxErZyTdO/GXEUtmMXxwekggOg5aUtwgKt9Fdqn7Bpm8bLT5W9YJkA35WoERVQmd7+5yDnlfTFJtOlJ/4E=
Received: from SN6PR13MB2480.namprd13.prod.outlook.com (2603:10b6:805:58::31)
 by SN6PR13MB2350.namprd13.prod.outlook.com (2603:10b6:805:55::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.14; Wed, 15 Apr
 2020 09:52:53 +0000
Received: from SN6PR13MB2480.namprd13.prod.outlook.com
 ([fe80::cea:373e:a199:fc26]) by SN6PR13MB2480.namprd13.prod.outlook.com
 ([fe80::cea:373e:a199:fc26%7]) with mapi id 15.20.2921.024; Wed, 15 Apr 2020
 09:52:53 +0000
From: "Troy.Lee@vertiv.com" <Troy.Lee@vertiv.com>
To: =?utf-8?B?QWRyaWFuIEFtYnJvxbxld2ljeg==?=
 <adrian.ambrozewicz@linux.intel.com>, Richard Hanley <rhanley@google.com>,
 Vijay Khemka <vijaykhemka@fb.com>
Subject: RE: [ExternalEmail] Re: Sensor history
Thread-Topic: [ExternalEmail] Re: Sensor history
Thread-Index: AQHWD3tbpXrEfh8YmEiVUlts8003SKh3iEAAgAF26YCAABv0AIAAwe4AgAAayTA=
Date: Wed, 15 Apr 2020 09:52:52 +0000
Message-ID: <SN6PR13MB2480B3B7DED9EC3C8163E659EDDB0@SN6PR13MB2480.namprd13.prod.outlook.com>
References: <EED5BF91-4AE9-4B5A-BE68-BAE3D93C3704@fb.com>
 <20200410210033.GA9295@mauery.jf.intel.com>
 <85700953-1CBE-4DFB-9A5B-AF64B9735735@fuzziesquirrel.com>
 <A785371B-1AD2-45E0-AD62-60C7E8B2C69D@fb.com>
 <CAH1kD+b4GQFs_V13APk8123dc_vL0GVxXwZLx6pPdUHiKodZRA@mail.gmail.com>
 <bbd70c99-dc36-7d2b-ef25-a17108be8de0@linux.intel.com>
In-Reply-To: <bbd70c99-dc36-7d2b-ef25-a17108be8de0@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Troy.Lee@vertiv.com; 
x-originating-ip: [103.83.160.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36cf25eb-0cad-450a-8d77-08d7e122c420
x-ms-traffictypediagnostic: SN6PR13MB2350:
x-microsoft-antispam-prvs: <SN6PR13MB2350E3E55F0AF9E2888F640BEDDB0@SN6PR13MB2350.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0374433C81
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR13MB2480.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(9686003)(86362001)(66946007)(66556008)(64756008)(66476007)(66446008)(76116006)(966005)(81156014)(7696005)(4326008)(8936002)(26005)(6506007)(53546011)(478600001)(8676002)(2906002)(186003)(5660300002)(316002)(54906003)(110136005)(52536014)(55016002)(71200400001)(33656002);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: vertiv.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KMxq08KOfWCq+QjEre5Fm/1dQZ7ye+XwRD950XnFNzwSQaqecBN8cvJnLU38TpMlRGs4b9tSfzn/Fkb0GqWBDyQ+WmkiWnKuE5YrJQ4ivNig2G36wYILlZFcEsHmUkop5cj5S/TJc08JaLk9aFZ8XJGytIqK4BnGqLfI3Zy2efjlHirO2gvku+0ZrUORegtLueX7OSOnRd4vPmVdLpMxva2lZ+1OsXmWjg8HTVQLe7rVQpb64WazPQTrOU5OJcctGBmJQLQ4WhK97g4EPMWO3Et7dtL3fsYPOok+taJr/F7lzg2g7nggaEE6w3aQl2Lj575Yg+6+2btdV7A5wCVRTnS033CRIs5jycoH1g5sC/A2LVSMCPD5zkjrevOSYmcGcAD1z5gHrpI7kkCFYND2ixVccUi4GwvzjJJCKT5h2q6/QdLe74zwjNuBgADD4Pfy1q0CVL2DvEi9fKtPelkucBsLHXpar62Zz/O0uxU8sIi0pGx5/aFqGlY+jz4T/SCFgd9vWPjHyXXTHu7ObIgUbw==
x-ms-exchange-antispam-messagedata: 18Q5t5BHhbMk6MTnF5yHlgCTqiCEj7t5IURuh8P59jrYNNlb/+czfv6rpJMu1inkhY8Nk8iNSBFyfUa+PsePJs3yFQLFscK9jTD83pF4CfI5C34MFP5TgFWGNdzI0MGVOk/JqNjdT14Tkr2w4waK2g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vertiv.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36cf25eb-0cad-450a-8d77-08d7e122c420
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2020 09:52:53.0280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 74fe92c5-ef57-4d1a-a0e7-9451117d9272
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0vX2uzPt1w2luaLT97wPaq4Xoxpwz1XWK9kGVlVNbf2tPlKJ7as/txXl26hMiL0fSKiffaoS+kyjHJMH5iXjEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR13MB2350
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

QWRyaWFuLA0KDQpUaGFua3MgZm9yIHRoZSB1cGRhdGUhDQoNClRoYW5rcw0KVHJveSBMZWUNCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNl
cyt0cm95LmxlZT12ZXJ0aXYuY29tQGxpc3RzLm96bGFicy5vcmc+IE9uIEJlaGFsZiBPZiBBZHJp
YW4gQW1icm8/ZXdpY3oNClNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMTUsIDIwMjAgNDoxNSBQTQ0K
VG86IFJpY2hhcmQgSGFubGV5IDxyaGFubGV5QGdvb2dsZS5jb20+OyBWaWpheSBLaGVta2EgPHZp
amF5a2hlbWthQGZiLmNvbT4NCkNjOiBWZXJub24gTWF1ZXJ5IDx2ZXJub24ubWF1ZXJ5QGxpbnV4
LmludGVsLmNvbT47IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgQnJhZCBCaXNob3AgPGJyYWRs
ZXliQGZ1enppZXNxdWlycmVsLmNvbT4NClN1YmplY3Q6IFtFeHRlcm5hbEVtYWlsXSBSZTogU2Vu
c29yIGhpc3RvcnkNCg0KVGVsZW1ldHJ5U2VydmljZSBpcyBjdXJyZW50bHkgaW4gZGV2ZWxvcG1l
bnQuDQoNCkludGVncmF0aW9uIHdpdGggRXZlbnRTZXJ2aWNlIHdhcyB0ZXN0ZWQgYW5kIHByb3Zl
ZCB0byB3b3JrIGZpbmUuIEludGVsIGhhdmUgcHJlcGFyZWQgZGVtbyBmb3IgMjAyMCBWaXJ0dWFs
IE9DUCBTdW1taXQgaWYgeW91IGFyZSB3aWxsaW5nIHRvIGhhdmUgc29tZSBpbnNpZ2h0IGFib3V0
IHVzZSBjYXNlcy4NCg0KV2Ugc2hvdWxkIGV4cGVjdCBzb2x1dGlvbiB0byBzdGFydCBhcHBlYXJp
bmcgaW4gdXBzdHJlYW0gc29vbmVyIHRoYW4gbGF0ZXIgYXMgZmVhdHVyZSBpcyBhbG1vc3QgY29t
cGxldGUgLSBpdCByZXF1aXJlcyBsZWdhbCBpc3N1ZXMgdG8gYmUgc29ydGVkIG91dC4NCg0KUmVn
YXJkcywNCkFkcmlhbg0KDQpXIGRuaXUgNC8xNC8yMDIwIG8gMjI6NDEsIFJpY2hhcmQgSGFubGV5
IHBpc3plOg0KPj4gSGkgVGVhbSwNCj4+DQo+PiBUaGVyZSBpcyBhIHRlbGVtZXRyeSBwcm9wb3Nh
bCBpbiBkb2NzIGFuZCByZXBvc2l0b3J5Lg0KPj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
ZG9jcy9ibG9iL21hc3Rlci9kZXNpZ25zL3RlbGVtZXRyeS5tZA0KPj4gaHR0cHM6Ly9naXRodWIu
Y29tL29wZW5ibWMvdGVsZW1ldHJ5DQo+ICA+IFRoZSBwcm9wb3NhbCBzZWVtcyBwcm9taXNpbmcg
YW5kIGNvbXBsZXRlLg0KPiAgPiBXaGF0IGlzIHRoZSBpbXBsZW1lbnRhdGlvbiBzdGF0dXM/DQo+
DQo+IEknbSBhbHNvIGN1cmlvdXMgYWJvdXQgYSBzdGF0dXMgdXBkYXRlIGhlcmUuICBXZXJlIHRo
ZXJlIGFueSBkZXNpZ24NCj4gaXNzdWVzIHRoYXQgbmVlZGVkIHRvIGJlIHdvcmtlZCBvdXQsIG9y
IGlzIGl0IHJlYWR5IHRvIGRldmVsb3A/DQo+DQo+Pj4gICAgVG8gaW1wbGVtZW50IHRoZSBSZWRm
aXNoIFRlbGVtZXRyeSBzZXJ2aWNlIHdvdWxkIHdlIG5lZWQgdG8gc3RvcmUNCj4+PnRoZW0gb24N
Cj4+PiAgICB0aGUgQk1DIGFzIHdlbGw/DQo+ICA+SXQgd2lsbCBiZSBuaWNlIGlmIHdlIGNhbiBz
dG9yZSBpdCBpbiBSQU0gYXQgbGVhc3Qgd2l0aCBsYXJnZXIgZGF0YQ0KPiBhbmQgc29tZSBkaXNr
c3BhY2UgID5XaXRoIHNtYWxsIGxvZyByb3RhdGUuDQo+DQo+IFRoZSBUZWxlbWV0cnkgU2Vydmlj
ZSBhbHJlYWR5IGhhcyBhIGNvbmNlcHQgb2YgbG9nIHJvdGF0aW9uLCBidXQNCj4gb3ZlcmFsbCBJ
IGFncmVlIHRoYXQgc3RvcmluZyBpbiBSQU0gZmlyc3Qgd2l0aCBvcHRpb25hbCBwZXJzaXN0ZW5j
ZSBpcw0KPiBiZXR0ZXIgdGhhbiB0aGUgb3RoZXIgd2F5IGFyb3VuZC4NCj4gLSBSaWNoYXJkDQpD
T05GSURFTlRJQUxJVFkgTk9USUNFOiBUaGlzIGUtbWFpbCBhbmQgYW55IGZpbGVzIHRyYW5zbWl0
dGVkIHdpdGggaXQgYXJlIGludGVuZGVkIHNvbGVseSBmb3IgdGhlIHVzZSBvZiB0aGUgaW5kaXZp
ZHVhbCBvciBlbnRpdHkgdG8gd2hvbSB0aGV5IGFyZSBhZGRyZXNzZWQgYW5kIG1heSBjb250YWlu
IGNvbmZpZGVudGlhbCBhbmQgcHJpdmlsZWdlZCBpbmZvcm1hdGlvbiBwcm90ZWN0ZWQgYnkgbGF3
LiBJZiB5b3UgcmVjZWl2ZWQgdGhpcyBlLW1haWwgaW4gZXJyb3IsIGFueSByZXZpZXcsIHVzZSwg
ZGlzc2VtaW5hdGlvbiwgZGlzdHJpYnV0aW9uLCBvciBjb3B5aW5nIG9mIHRoZSBlLW1haWwgaXMg
c3RyaWN0bHkgcHJvaGliaXRlZC4gUGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5
IGJ5IHJldHVybiBlLW1haWwgYW5kIGRlbGV0ZSBhbGwgY29waWVzIGZyb20geW91ciBzeXN0ZW0u
DQo=
