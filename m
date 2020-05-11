Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E01401CE276
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 20:21:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LTly569tzDqbY
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 04:21:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=40.107.220.132;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=aPNb6ed3; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2132.outbound.protection.outlook.com [40.107.220.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LTkj46LZzDqSj
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 04:20:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FrGk+Z9LxdRliaMu53FW6gzebxr2dcsRQ7f+jwJOe9Xvh6kovHRPnM520JIH00yCxBN0spextJeOrnHWd8VUxaE3srnogU9W8qOwUnqkgJIkgoSacjCe84bmJC8MJJcQ9LySXTu4O2wvhTxtvpfSPAeAbe03688sbmcuA4GWYaBMObcbIJDy+Aj2caYaq86yrB2H6CJsi4nysYmhWBCRmlkK6MdYbFUtZsJ/O6ulARbXTXLBoRurCSfGdvHhh/x6FkUanVrwhI20AUPEQJNJlUiov4IGgVmiVHJKEG8vZsA6uQKsMQZ+UusjGk241i/DltdlSjkFjPyq1rYYll/S4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSLQaOvqe6dduQ/7rnHKr3yGZPVJImC6/Y0z9XrLdG4=;
 b=Ex2AC4XKPQaq5eybqkdSYs4OJ2E8n9f+qpnkMWPhUPn1FCOzgfq1CD/1S1M8CkQe1Tyet5adlfnzsCPDpJydgEj59KFepqfBOzJGNIwpyd+WREa/dqSngeKUAzLOplNQoNPCg+Un+nkapPlj0olHRbIND4sg+BaO3rigKqXojcIU8jHUuPxN8vSEMror+iDyE/60lwt+nxGa56gsPhS2IWxT2VNWHZwnrPqdcgRqOigD+KaGqS18Ezg55WJR8bI/abbPhrF/CryhmXbQr84pY5S1XihwDe2gJdNgyI+CgMHX7gmvHuvUbTgZEptLGCbiaCTsiJH4sRJ9ObARgnoHqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSLQaOvqe6dduQ/7rnHKr3yGZPVJImC6/Y0z9XrLdG4=;
 b=aPNb6ed3hO8KX29Ue64ZHtuWgV2wvpor83YG2aYihm9ZI+N9jttn51WNU5uiKndhJDxAvx2wfERNb4hIxdwfW2SwxzZvh44WC2R7KocbvTyqv2o75r459XYSNDlO/pzGJ0gnLbgyFVuerEBwJjJTSJ5kSEDjRn1gOgek2WmEehY=
Received: from CH2PR21MB1510.namprd21.prod.outlook.com (2603:10b6:610:8e::7)
 by CH2PR21MB1399.namprd21.prod.outlook.com (2603:10b6:610:8e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.2; Mon, 11 May
 2020 18:20:22 +0000
Received: from CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::6838:df24:78e3:e78a]) by CH2PR21MB1510.namprd21.prod.outlook.com
 ([fe80::6838:df24:78e3:e78a%9]) with mapi id 15.20.3000.011; Mon, 11 May 2020
 18:20:22 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Zbyszek <zbigniewku@gmail.com>
Subject: RE: [EXTERNAL] Re: [bmcweb] mTLS client authentication always succeeds
Thread-Topic: [EXTERNAL] Re: [bmcweb] mTLS client authentication always
 succeeds
Thread-Index: AQHWI5i5HOV3G831BkidKbnmFPWauaibXosAgADiHgCAAABX0IAAFkgAgAbhaeA=
Date: Mon, 11 May 2020 18:20:22 +0000
Message-ID: <CH2PR21MB1510222BA2CC09AE1CC6AF90C8A10@CH2PR21MB1510.namprd21.prod.outlook.com>
References: <CAMXw96Mnk8Hf4wAB_Ot=XEqp9yecspPfMGB6oF_LSgjRFMNHvw@mail.gmail.com>
 <CAB_SOc5tEo7xRg65aMfBOWyY_yXkb6+mLmRhf8hifNhHDWGVgQ@mail.gmail.com>
 <CAMXw96NoWn+sZELD1Xd=WUyLwvOUZ9prKyqqaLFKiMwM6ChuMw@mail.gmail.com>
 <CAB_SOc6pgn2OXd-KRYNpzszxWyhfGOdBTHMB5FWbat8QaZ1CoQ@mail.gmail.com>
 <CH2PR21MB1510B40F09178BC841F62AA6C8A50@CH2PR21MB1510.namprd21.prod.outlook.com>
 <CAB_SOc7dz7ARKH5W-d7EwrFnLxd0V3Ny7i3xyxGGGxHTGW0LOg@mail.gmail.com>
In-Reply-To: <CAB_SOc7dz7ARKH5W-d7EwrFnLxd0V3Ny7i3xyxGGGxHTGW0LOg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [50.47.133.153]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: db918138-e167-4b2c-9d8d-08d7f5d7f800
x-ms-traffictypediagnostic: CH2PR21MB1399:
x-microsoft-antispam-prvs: <CH2PR21MB1399ED149457BAEC7568A7E7C8A10@CH2PR21MB1399.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 04004D94E2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TRptusM57etEbAX9YPwbVSxRhdW/NRTPifMPQDCxUBM9v0KTYpUkHqWt70cZtuwwP9wJ0w6XOIJKBsvZagN5fkCdtnIHtlXFznK9PCPJ91/B9r4aE7yxrGGbidzuIeD65zJs3fR/JrYEaJv5+HVDAGNKt/W37l4UUnCQzHP6ghjMljuurmtSm5nTVvkXmiDUwFqHqSxcmGWjW/i4LjndlCelCuWZP5dhftt/rDVRiaYCPwCWq0J+l/G4y9siJa743Cwg7l3MubHZSch6dzOA91XK3hi7UiZNvtda4bpVr8ICBbm+CbD2zurBWj6gBHRA5SsMygjD7xwK/ybklsay7Lwv+BCzSijGaREOzmsLggzuxa0cQeZjDGkT3FrazlZVQhFC9J6CyMtjoTmo2sS8j/jungPJ9UjGXDGEqcOdyZjBjIs5L4VyPXOVCbqn8hyrpDC3580iG9nTDb4rbliZozzsj7q3Sm8YgpQKhy9Hjew=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR21MB1510.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(33430700001)(71200400001)(82950400001)(82960400001)(66946007)(66556008)(66476007)(64756008)(66446008)(19627235002)(76116006)(7696005)(186003)(8990500004)(33440700001)(53546011)(6506007)(26005)(8676002)(86362001)(52536014)(6916009)(478600001)(8936002)(33656002)(9686003)(55016002)(10290500003)(966005)(2906002)(5660300002)(54906003)(4326008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: JlzC8VIIPvY7F5jJeHNZRptAUAxc4PGEeR6eeOO3GMfxjxzVJUEkcpzpnl01HSmpz4pRmJ+5SCIzBiiAfL9HEIIceAp52U4WSvPrkk4xO7VFZk9xNOfxlO7fay4M6qGKzg5Y0EKAWp0/BSkzw+JL58wt1sOI1OUCNTNT8zFxmvwHZ0KZ2evrrkQj4XDH51Ix9v9eKcF6Yg3iEjRNeFaKnMgyh5XMY2J3nyuo7kYwIp8/xtctTh5DJvVmJCrGMKx/J84Q0MtTv+kvS+9FAOBltmyYtB9e1Lrm13ZJ8JyE7UtQKQZdbUL0DxdC9B2eVQ2hW3GJcsOobrIUT22ys6tSUzF3GylZNvyx/PnPBrITrG8cycY+VYsLaf6h/jPL8SfY4OLUO65uUbbGB2Gk6oZs3AhfK50UXZ766GyvMsinHlrArM0iYc4c7TidvI4oKyDQK+9KniKcddplsZj71eYsYPPAvjGzu/u5hr0bG5CETeI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db918138-e167-4b2c-9d8d-08d7f5d7f800
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2020 18:20:22.2862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eYjxaDLC1n9uBv/Am2VlOra21y01YkOn1suBjaDzN9aOC6RkGEZb0280zghQVnuaTxNxerJInOWo0RgpMUS8KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR21MB1399
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Zhenfei Tai <ztai@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SSBoYXZlIGVuYWJsZWQgREJNQ1dFQl9FTkFCTEVfTVVUVUFMX1RMU19BVVRIRU5USUNBVElPTiBp
biBibWN3ZWIgIGJ1dCBJIGRvIG5vdCBzZWUgVExTQXV0aC9DZXJ0aWZpY2F0ZXMgaW4gcmVkZmlz
aC92MS9BY2NvdW50U2VydmljZSA/ICBJIHRyaWVkIHRvIHVwbG9hZCBDQSBjZXJ0IHZpYSBibWN3
ZWIgYnV0IEkgY291bGQgbm90IG1ha2UgaXQgd29yayAoIEF1dGhlbnRpY2F0aW9uIGZhaWxpbmcp
DQoNCkkgY291bGQgbm90IGZpbmQgZG9jdW1lbnRhdGlvbiB0byBlbmFibGUgdGhpcyBmZWF0dXJl
LiBpdCB3b3VsZCBiZSBncmVhdCBpZiBzb21lb25lIGNhbiBzZW5kIHN0ZXBzIHRvIGVuYWJsZSB0
aGlzIGZlYXR1cmU/IA0KDQpOZWVyYWoNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogWmJ5c3playA8emJpZ25pZXdrdUBnbWFpbC5jb20+IA0KU2VudDogVGh1cnNkYXksIE1h
eSA3LCAyMDIwIDI6MTAgQU0NClRvOiBOZWVyYWogTGFka2FuaSA8bmVsYWRrQG1pY3Jvc29mdC5j
b20+DQpDYzogWmhlbmZlaSBUYWkgPHp0YWlAZ29vZ2xlLmNvbT47IE9wZW5CTUMgTWFpbGxpc3Qg
PG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IFJlOiBbRVhURVJOQUxdIFJlOiBb
Ym1jd2ViXSBtVExTIGNsaWVudCBhdXRoZW50aWNhdGlvbiBhbHdheXMgc3VjY2VlZHMNCg0KY3p3
LiwgNyBtYWogMjAyMCBvIDEwOjE0IE5lZXJhaiBMYWRrYW5pIDxuZWxhZGtAbWljcm9zb2Z0LmNv
bT4gbmFwaXNhxYIoYSk6DQo+DQo+IEhpIFpieXN6ZWssDQo+DQo+IEp1c3QgYSBiYXNpYyBxdWVz
dGlvbiwgT25jZSBibWN3ZWIgaXMgY29uZmlndXJlZCB3aXRoIC1EQk1DV0VCX0VOQUJMRV9NVVRV
QUxfVExTX0FVVEhFTlRJQ0FUSU9OLCBjYW4gaXQgd29yayB3aXRob3V0IGNsaWVudCBjZXJ0Pw0K
DQoNClllcyBpdCBjYW4sIGJ5IGRlZmF1bHQgYWxsIGF1dGhlbnRpY2F0aW9uIG1ldGhvZHMgYXJl
IGVuYWJsZWQgZXhjZXB0IFRMUy4NCldoaWNoIG1ldGhvZCBpcyBlbmFibGVkIGNhbiBiZSBjaGVj
a2VkIHZpYSByZWRmaXNoIHNlcnZpY2UNCkFjY291bnRTZXJ2aWNlLT5PZW0tPk9wZW5CTUMtPkF1
dGhNZXRob2RzLg0KVG8gY2hhbmdlIHRoZXNlIHNldHRpbmdzIHNlbmQgUEFUQ0ggdG8NCmh0dHBz
Oi8ve3tibWNfaXB9fS9yZWRmaXNoL3YxL0FjY291bnRTZXJ2aWNlLg0KRm9yIGV4YW1wbGUgdG8g
dHVybiB0aGUgdGxzIHVzZSB0aGlzIHBhdGNoIGJvZHkgOiAgeyJPZW0iOiB7Ik9wZW5CTUMiOg0K
eyJBdXRoTWV0aG9kcyI6IHsiVExTIjogdHJ1ZX19fX0NCg0KSSB0aGluayB0aGlzIGRpYWdyYW0g
YXQgcGFyYWdyYXBoICdBdXRoZW50aWNhdGlvbiBQcm9jZXNzJw0KaHR0cHM6Ly9uYW0wNi5zYWZl
bGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0aHViLmNv
bSUyRm9wZW5ibWMlMkZkb2NzJTJGYmxvYiUyRm1hc3RlciUyRmRlc2lnbnMlMkZyZWRmaXNoLXRs
cy11c2VyLWF1dGhlbnRpY2F0aW9uLm1kJmFtcDtkYXRhPTAyJTdDMDElN0NuZWxhZGslNDBtaWNy
b3NvZnQuY29tJTdDMzA4ODg1MDM1YTg3NGMzYmJlNDkwOGQ3ZjI2NjY2ZTYlN0M3MmY5ODhiZjg2
ZjE0MWFmOTFhYjJkN2NkMDExZGI0NyU3QzElN0MwJTdDNjM3MjQ0Mzk0ODM4MDk0MDEzJmFtcDtz
ZGF0YT1QQ25YYm1EdXhxd2laY1N3NiUyQlFpbTNjWDlocWtWcEZxeEM1SkdsUHVRZDglM0QmYW1w
O3Jlc2VydmVkPTANCmNhbiBiZSB1c2VmdWwgaW4gdW5kZXJzdGFuZGluZyBob3cgdGhlIGF1dGhl
bnRpY2F0aW9uIHByb2Nlc3MgZmxvdyBsb29rcyBsaWtlLg0KKG5vdyBJIHNlZSB0aGF0IHNvbWUg
cGFydHMgb2YgdGhpcyBkZXNpZ24sIGxpa2UgcGF0aHMgcmVxdWlyZXMgdXBkYXRlcywgYnV0IHRo
ZSBkaWFncmFtIGlzIHZhbGlkKS4NCg0KDQo+DQo+IEl0IHdpbGwgYmUgZ29vZCB0byBkb2N1bWVu
dCBjdXJsIEFQSXMgdG8gZW5hYmxlIHRoaXMgZmVhdHVyZSBhbmQgdGVzdCBlbmQgdG8gZW5kIGZs
b3dzLg0KPg0KPiBUaGFua3MNCj4gTmVlcmFqDQo+DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+IEZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcytuZWxhZGs9bWljcm9zb2Z0LmNv
bUBsaXN0cy5vemxhYnMub3JnPiANCj4gT24gQmVoYWxmIE9mIFpieXN6ZWsNCj4gU2VudDogVGh1
cnNkYXksIE1heSA3LCAyMDIwIDEyOjQ5IEFNDQo+IFRvOiBaaGVuZmVpIFRhaSA8enRhaUBnb29n
bGUuY29tPg0KPiBDYzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn
Pg0KPiBTdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBbYm1jd2ViXSBtVExTIGNsaWVudCBhdXRoZW50
aWNhdGlvbiBhbHdheXMgDQo+IHN1Y2NlZWRzDQo+DQo+IMWbci4sIDYgbWFqIDIwMjAgbyAyMDox
OSBaaGVuZmVpIFRhaSA8enRhaUBnb29nbGUuY29tPiBuYXBpc2HFgihhKToNCj4gPg0KPiA+IEhp
IFpieXN6ZWssDQo+ID4NCj4gPiBUaGFua3MgZm9yIHlvdXIgcmVwbHkuIEkgbG9vayBmb3J3YXJk
IHRvIHRoZSBvZmZpY2lhbCBkb2N1bWVudGF0aW9uLg0KPiA+DQo+ID4gVGhlIGNhbGxiYWNrIGZ1
bmN0aW9uIHJldHVybnMgdHJ1ZSB3aGVuIHByZXZlcmlmaWVkID09IGZhbHNlLiBOb3Qgc3VyZSB3
aHkgaXQgc2hvdWxkIGFsd2F5cyByZXR1cm4gdHJ1ZSwgd2hpY2ggYWNjZXB0cyBhbnkgY2xpZW50
IGNlcnRpZmljYXRlLg0KPg0KPiBZZXMsIGFsd2F5cyByZXR1cm5pbmcgdHJ1ZSB3ZSBkbyBub3Qg
YnJlYWsgdGhlIHRscyBoYW5kc2hha2UgYWxsb3dpbmcgZm9yIGNvbm5lY3Rpb24uDQo+IEJ1dCB1
c2VyIHdpbGwgbm90IGJlIGF1dGhlbnRpY2F0ZWQgYW55d2F5IGJlY2F1c2UgaXRzIG5hbWUgd2ls
bCBub3QgYmUgZXh0cmFjdGVkIGZyb20gdGhlIGNlcnRpZmljYXRlLg0KPiBJbiBzdWNoIGNhc2Ug
dXNlciBzaG91bGQgcmVjZWl2ZSBwcm9wZXIgaHR0cCBlcnJvciBjb2RlIHRlbGxpbmcgaGUgaXMg
bm90IGF1dGhlbnRpY2F0ZWQuDQo+DQo+ID4NCj4gPiAvLyBXZSBhbHdheXMgcmV0dXJuIHRydWUg
dG8gYWxsb3cgZnVsbCBhdXRoIGZsb3cgaWYgKCFwcmV2ZXJpZmllZCkgeyANCj4gPiBCTUNXRUJf
TE9HX0RFQlVHIDw8IHRoaXMgPDwgIiBUTFMgcHJldmVyaWZpY2F0aW9uIGZhaWxlZC4iOyByZXR1
cm4gDQo+ID4gdHJ1ZTsgfQ0KPiA+DQo+ID4gVGhhbmtzLA0KPiA+IFpoZW5mZWkNCj4gPg0KPiA+
IE9uIFdlZCwgTWF5IDYsIDIwMjAgYXQgNDoyMiBBTSBaYnlzemVrIDx6Ymlnbmlld2t1QGdtYWls
LmNvbT4gd3JvdGU6DQo+ID4+DQo+ID4+IHB0LiwgMSBtYWogMjAyMCBvIDAyOjA3IFpoZW5mZWkg
VGFpIDx6dGFpQGdvb2dsZS5jb20+IG5hcGlzYcWCKGEpOg0KPiA+PiA+DQo+ID4+ID4gSGksDQo+
ID4+ID4NCj4gPj4gPiBJJ3ZlIGJlZW4gdGVzdGluZyBibWN3ZWIgbVRMUyBmb3IgYSB3aGlsZSBh
bmQgZm91bmQgdGhlIHVzZXIgDQo+ID4+ID4gZGVmaW5lZCB2ZXJpZnkgY2FsbGJhY2sgZnVuY3Rp
b24gcmV0dXJucyB0cnVlIGluIGFsbCBjYXNlcy4NCj4gPj4gPiAoaHR0cHM6Ly9uYW0wNi5zYWZl
bGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJQ0KPiA+PiA+IDJG
IA0KPiA+PiA+IGdpdGh1Yi5jb20lMkZvcGVuYm1jJTJGYm1jd2ViJTJGYmxvYiUyRm1hc3RlciUy
Rmh0dHAlMkZodHRwX2Nvbm5lDQo+ID4+ID4gY3QgDQo+ID4+ID4gaW9uLmglMjNMMjg3JmFtcDtk
YXRhPTAyJTdDMDElN0NuZWxhZGslNDBtaWNyb3NvZnQuY29tJTdDOGY1ZmY2MTINCj4gPj4gPiA1
ZQ0KPiA+PiA+IGRiNGI3MzRjM2UwOGQ3ZjI1YjJiNjglN0M3MmY5ODhiZjg2ZjE0MWFmOTFhYjJk
N2NkMDExZGI0NyU3QzElN0MwDQo+ID4+ID4gJTcNCj4gPj4gPiBDNjM3MjQ0MzQ1Njk1MTU3NTc1
JmFtcDtzZGF0YT0zRSUyRiUyRmR4U3VSNVNGbzlaSUklMkZaQUE3aDYlMkZEZA0KPiA+PiA+IHMx
DQo+ID4+ID4gbEhlWmFDbmJpbWNpTHclM0QmYW1wO3Jlc2VydmVkPTApDQo+ID4+ID4NCj4gPj4g
PiBJZiBjbGllbnQgYXV0aGVudGljYXRpb24gaXMgZW5hYmxlZCBpbiBibWN3ZWIsIHNob3VsZCBp
dCByZWplY3QgaWYgY2xpZW50IGNlcnRpZmljYXRlIGlzIGJhZD8NCj4gPj4NCj4gPj4gTm8sIHB1
cnBvc2Ugb2YgdGhpcyBjYWxsYmFjayBpcyB0byBvbmx5IGV4dHJhY3QgdGhlIHVzZXIgbmFtZSBm
cm9tIA0KPiA+PiB0aGUgY2VydGlmaWNhdGUgYW5kIHRoZW4gYWxsb3cgdG8gcHJvY2VlZCB3aXRo
IGRlZmF1bHQgT3BlblNTTCANCj4gPj4gdmVyaWZpY2F0aW9uIGZsb3cgd2hpY2ggc2hvdWxkIGZp
bmFsbHkgZmFpbCBpZiBzb21ldGhpbmcgaXMgd3JvbmcgDQo+ID4+IHdpdGggdGhlIGNlcnRpZmlj
YXRlIG5vIG1hdHRlciB3aGF0IHRoaXMgZnVuY3Rpb24gcmV0dXJuZWQuDQo+ID4+IFRoZSAnc2V0
X3ZlcmlmeV9jYWxsYmFjaycgZG9lc24ndCByZXBsYWNlIHRoZSB3aG9sZSB2ZXJpZmljYXRpb24g
DQo+ID4+IHByb2NlZHVyZSwgaXQgb25seSBhZGRzIGEgY2FsbGJhY2sgdGhhdCBpcyBjYWxsZWQg
d2hlbiB0aGUgZGVmYXVsdCANCj4gPj4gdmFsaWRhdG9yIGNoZWNrcyBlYWNoIGNlcnRpZmljYXRl
LiBUaGUgJ3ByZXZlcmlmaWVkJyBwYXJhbWV0ZXIsIA0KPiA+PiBwYXNzZWQgdG8gaXQgaW5kaWNh
dGVzIGlmIHZlcmlmaWNhdGlvbiBvZiB0aGUgY2VydGlmaWNhdGUgc3VjY2VlZGVkIG9yIG5vdC4N
Cj4gPj4gWW91IHNob3VsZCBiZSBhYmxlIHRvIHNlZSBpdCBpbiBibWN3ZWIgbG9ncy4NCj4gPj4N
Cj4gPj4gPg0KPiA+PiA+IFRoYW5rcywNCj4gPj4gPiBaaGVuZmVpDQo=
