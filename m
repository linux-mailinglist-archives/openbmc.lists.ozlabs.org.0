Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F36273853
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 04:04:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwPkh0PwgzDqnp
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 12:04:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=sharad.khetan@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=oZgwF7I9; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwPjn5lnlzDqnp
 for <openbmc@lists.ozlabs.org>; Tue, 22 Sep 2020 12:03:40 +1000 (AEST)
IronPort-SDR: JAJ1zvL7Ha/smoUjWzLRgTbRcfetQzyNjL455JaA9QCqqSpT3KpiN8ExmuswcGTLiHiIOH1KvM
 aDGpQhpFNsOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="148267812"
X-IronPort-AV: E=Sophos;i="5.77,288,1596524400"; d="scan'208";a="148267812"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 19:03:37 -0700
IronPort-SDR: zygp/4kfi9wj6JhIeIt4ZCE6eYA/AW/ROaupZ9CNwdkGU0a4RwwOnjsTVmFwtys/rPhwWyCr1u
 s7sIErnYy6kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,288,1596524400"; d="scan'208";a="338136511"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga008.jf.intel.com with ESMTP; 21 Sep 2020 19:03:37 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Sep 2020 19:03:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 21 Sep 2020 19:03:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 21 Sep 2020 19:03:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfFZqyChE47pulLtjyqOR61ftDnz8PXhQtS9TcSncZGcPohDz3earOr3zQnHkilCqd0NfRKQ5rzT65U64IhLBHmDWpuvGfJ93FG8X3F70S61iQyFHLakbsloPR6rTsdKWLZieaG9BWck4cJZe+x06zElB8uXSrKIe7gHkbCHflwCFXaxGKomtftl2yL//UJHVGRwv6nnVGFwcQRWMFS8C3Ne72QjC+KgKoVgTEsuJFi/WpzevyW4VG7Xdy6vA2Q9bAM+2QJx1tt8MZTSppGYD+j42WHR0SYdzu3t7TNAHwDjzD2CN3joto6zgtwr6bt5OuK4+EJgnhimJaKgh1OYeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbOGmSAjIBZc0hja9wenYyAVKaZHBWGMdYwPPAl1H6k=;
 b=Yqfqirw7alwDHM8x5PqcRJLhPuOvoMBOwPiS1HNDW/W7ZsZpk3LtdTgamOc2TnLuWB+/Ct0HsjRGCnUEa5h+OJ1VA9vkLlQAvrZbAPMfVGjO8LfbEwic7u23ztoaa3XelaisKg9CTrVBB85uW5lzlIuAhdzvID7lSxtxdxIxyVd5E+/RwVs/YJtGCKthO/VHdlTNJTwVe8HCIa6ENMM+XWmfHp8M3vcu8cEWS/ZAzxytTBSuTwBzuR/fOsGYj6jcbZLpVSzQYm5j340P0MlpKDWbRXfm2t+FuvxGuB6sIhLg2oJB6oAX/wnmRnwyja8Lv+JO+Tsf0ldSpzf8/3eBvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbOGmSAjIBZc0hja9wenYyAVKaZHBWGMdYwPPAl1H6k=;
 b=oZgwF7I9eyUPiqAwU+fquwbrbZ3M4Fzxe3/8QFr9XZlE4eHbTy8ioHYt7ruPRHf462ajxGYnKYDGOmzg+5YdVfSCo4/QYDfIjtCA2tvU4OV1diPxRMhtXy62fw3vXwf34H6h7yRlSMEQBJ0HKyHqD/Ruo1huTnhcJLIkkjMAhMo=
Received: from MWHPR11MB0046.namprd11.prod.outlook.com (2603:10b6:301:67::30)
 by MWHPR1101MB2110.namprd11.prod.outlook.com (2603:10b6:301:4f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Tue, 22 Sep
 2020 02:03:31 +0000
Received: from MWHPR11MB0046.namprd11.prod.outlook.com
 ([fe80::6d7b:11d7:359a:dbfb]) by MWHPR11MB0046.namprd11.prod.outlook.com
 ([fe80::6d7b:11d7:359a:dbfb%7]) with mapi id 15.20.3370.025; Tue, 22 Sep 2020
 02:03:31 +0000
From: "Khetan, Sharad" <sharad.khetan@intel.com>
To: Ed Tanous <ed@tanous.net>
Subject: RE: interest in a minimal image recipe
Thread-Topic: interest in a minimal image recipe
Thread-Index: AQHWi589ZL1TIJ3aQEmLrkPkZZNN0altUs8AgAAT74CABdNRgIAAtkgA
Date: Tue, 22 Sep 2020 02:03:31 +0000
Message-ID: <MWHPR11MB0046AE288AB542281C042D96F13B0@MWHPR11MB0046.namprd11.prod.outlook.com>
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
 <CACWQX80tELWA-EW0A8-DnJGFmJyMxDC04YTq4B+--bRaoV8rOQ@mail.gmail.com>
 <MWHPR11MB004670BBADCA48F5EE9BE9C7F13E0@MWHPR11MB0046.namprd11.prod.outlook.com>
 <CACWQX82k+zN8ZgE6Fm+wEQWS4Fsnndy7vTaV4K8ChQL2QR_THA@mail.gmail.com>
In-Reply-To: <CACWQX82k+zN8ZgE6Fm+wEQWS4Fsnndy7vTaV4K8ChQL2QR_THA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: tanous.net; dkim=none (message not signed)
 header.d=none;tanous.net; dmarc=none action=none header.from=intel.com;
x-originating-ip: [104.153.203.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22bb0881-721f-4727-0d20-08d85e9bb482
x-ms-traffictypediagnostic: MWHPR1101MB2110:
x-microsoft-antispam-prvs: <MWHPR1101MB2110477B014CAA97D5962910F13B0@MWHPR1101MB2110.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ost0Tr/2Izli02lZhl3d6Tt0GdnEUhjZcF8yg8uZ6ZNCh+nFfoUjx9NCXhAvPEJcZRqc1XbLRX+BdqUJHyBO+yblL7BIb9N9xzfdBQ9+coNrIGs5ZgspLyh1aIe2UVlKC/XZ/QrRrttH8JEGyjo5o+XjILj0wtN3xfDEHGvBgrLYMllijQ4LpwZvqPxo6j0gIhbQlMRPfZ44/ZQuPfll/p4TULzHCCAlbde/MqYZsEUEVNmS/QaEhFYz8mMO6vrIhZYlKXab8qNbmF1xCNFtugp4v5DCYrKGv9YUVf7OSVYh+DVV4SpBLThtiRpb9lqGVUSy8CCSB+APHHTzgTui57M7xlkm1/1EInUg6HXxFYAEL+pYlQRauBiPm5pli8ljJXYBn3rVT0hl2VyNrLArWg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(66476007)(7696005)(316002)(66446008)(66556008)(66946007)(8936002)(55016002)(71200400001)(8676002)(76116006)(478600001)(186003)(4326008)(966005)(52536014)(6916009)(9686003)(54906003)(2906002)(26005)(53546011)(64756008)(6506007)(86362001)(33656002)(83380400001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: hj4leK0XZO8I8TwazPEgJOc9NuWVoOZRVfV3ZfCnJJ3O/bdWdfR2KUfnKE+zIELhlWu2CfEVDYPuNm+fPDULFHX68vp7b5u/rzN1ABNe2fx0RikDN7D5EIDhRaNGOkNVy9BbpZDdc6RRlcT9gyHHbR/Rph+DccFUitvzxtM+x9vuk2DDvLW+Mt5QV7RSCjCZGyrzF90lnmwx79R3GfDeHMyGC9DzaGiQN4SsQsofjwiVC/n+eh8NYaSgGVc42rlb9+tThgITTsy/PxW2EAibgKlu9XXAZc3baXr50+58mUPorvIGFdVjMQXRPgerqMtTsW0R9JRC1zbAUuJ4xKtb0M38i/3wqwkInIcOHNBLOrJFVLMSsrtJI9yAwyY+Zmq2Ybobwj8FpJiDfKe/eusJenNHte2P5J+m9m1oJ5Nil91AKHM7IAuD5x31isw3jqh71EIWncLgewefi/qd5+TPI/BoojdPXdQJK/dlRgiQDhVnQziSe1et/paZblWjRSf5emBbXB5GCGsQhZQCfK0HtwPym1SkudcWGyeywlj5fx/7Irg4lHc9ArVGbihdXlhQ7LuNRFrJ6tDmU3l8m9lSITL9rppQX59UNUvCLIzGJ4d83jwuN+bz27KXyAsQw+3m37dqJtgUQivBdV9Q9ETiHw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bb0881-721f-4727-0d20-08d85e9bb482
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 02:03:31.3589 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ri6sKQ3wkOODqPn4v0j2WEWP6woffw5Uw7JQqI8sevFYtL8A0kyAQ5WdGC38069gLST1kl55H286ziqGzwDvvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2110
X-OriginatorOrg: intel.com
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBFZCBUYW5vdXMgPGVkQHRhbm91
cy5uZXQ+IA0KU2VudDogTW9uZGF5LCBTZXB0ZW1iZXIgMjEsIDIwMjAgODowNiBBTQ0KVG86IEto
ZXRhbiwgU2hhcmFkIDxzaGFyYWQua2hldGFuQGludGVsLmNvbT4NCkNjOiBCcmFkIEJpc2hvcCA8
YnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tPjsgT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogUmU6IGludGVyZXN0IGluIGEgbWluaW1hbCBpbWFn
ZSByZWNpcGUNCg0KT24gVGh1LCBTZXAgMTcsIDIwMjAgYXQgMzoyMiBQTSBLaGV0YW4sIFNoYXJh
ZCA8c2hhcmFkLmtoZXRhbkBpbnRlbC5jb20+IHdyb3RlOg0KPg0KPiBFZCwgd2VsY29tZSBiYWNr
IC4NCg0KDQpUaGFua3MhICBHbGFkIHRvIGJlIGhlcmUuDQoNCj4NCj4NCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmJtYyANCj4gPG9wZW5ibWMtYm91bmNlcytzaGFy
YWQua2hldGFuPWludGVsLmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYgDQo+IE9mIEVk
IFRhbm91cw0KPiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDE3LCAyMDIwIDE6NTcgUE0NCj4g
VG86IEJyYWQgQmlzaG9wIDxicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+DQo+IENjOiBPcGVu
Qk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQo+IFN1YmplY3Q6IFJlOiBp
bnRlcmVzdCBpbiBhIG1pbmltYWwgaW1hZ2UgcmVjaXBlDQo+DQo+IE9uIFR1ZSwgU2VwIDE1LCAy
MDIwIGF0IDE6MzEgUE0gQnJhZCBCaXNob3AgPGJyYWRsZXliQGZ1enppZXNxdWlycmVsLmNvbT4g
d3JvdGU6DQo+ID4NCj4gPiBJJ3ZlIGhlYXJkIGEgaGFuZGZ1bCBvZiB0aW1lcyB0aGF0IG1ldGEt
cGhvc3Bob3IgdXNlcnMgb2Z0ZW4gaGF2ZSB0byANCj4gPiByZW1vdmUgdGhlIGxhdGVzdCBmZWF0
dXJlIGFkZGVkIGJ5IGRlZmF1bHQgdG8gb2JtYy1waG9zcGhvci1pbWFnZS4NCj4gPg0KPiA+IEkg
aGF2ZSBhbiBSRkMgZm9yIGFuIGVtcHR5IGltYWdlIHRoYXQgdGhlc2UgdXNlcnMgY291bGQgYmJh
cHBlbmQgYW5kIA0KPiA+IG9wdC1pbiB0byBzcGVjaWZpYyBpbWFnZSBmZWF0dXJlcyBpbnN0ZWFk
IG9mIGhhdmluZyB0byByZXBlYXRlZGx5IA0KPiA+IG9wdC1vdXQuDQo+ID4NCj4gPiBJZiB5b3Ug
bGlrZSB0aGUgb3B0LWluIGFwcHJvYWNoLCBwbGVhc2UgZHJvcCBhICsxIGFuZC9vciByZXZpZXcg
bXkgcGF0Y2g6DQo+ID4NCj4gPiBodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mv
b3BlbmJtYy9tZXRhLXBob3NwaG9yLysvMzY1MTYNCj4gPg0KPiA+IEkgYnJpbmcgdGhpcyB1cCBu
b3cgYmVjYXVzZSBJLCBhbmQgb3RoZXJzIGhhdmUgYmVlbiBhZGRpbmcgbmV3IGltYWdlIA0KPiA+
IGZlYXR1cmVzIHRvIG9ibWMtcGhvc3Bob3ItaW1hZ2UgKGUuZy4gdHVybmVkIG9uIGJ5IGRlZmF1
bHQpLCBhbmQgSSANCj4gPiB3b3VsZCBsaWtlIHRvIHN0YXJ0IGEgZGlzY3Vzc2lvbiBhYm91dCB3
aGF0IGl0IG1lYW5zIGZvciBhbiANCj4gPiBhcHBsaWNhdGlvbiB0byBiZSBpbiB0aGUgT3BlbkJN
QyBnaXRodWIgb3JnYW5pemF0aW9uLiAgSSB3b3VsZCANCj4gPiBwcm9wb3NlIHRoYXQgaXQgbWVh
bnMgaXQgaXMgZW5hYmxlZCBhbmQgdHVybmVkIG9uIGJ5IGRlZmF1bHQgaW4gb2JtYy1waG9zcGhv
ci1pbWFnZS4NCj4gPg0KPiA+IExvb2tpbmcgZm9yd2FyZCB0byB5b3VyIHRob3VnaHRzLg0KPiA+
DQo+ID4gLWJyYWQNCj4NCj4gQXMgYSBnZW5lcmFsIGRlc2NyaXB0aW9uLCB0aGlzIHNvdW5kcyBn
cmVhdCwgYnV0IGFzIGFsd2F5cyB0aGUgZGV2aWwgaXMgaW4gdGhlIGRldGFpbHMuICBUaGUgYmln
Z2VzdCBvYnN0YWNsZSB0byB0aGlzIEkgc2VlIGlzIHRoYXQgd2UnZCBuZWVkIGEgcG9saWN5IGFu
ZCBkZXNpZ24gYXJvdW5kIHN1cHBvcnRpbmcgbWl4LWFuZC1tYXRjaCBvbiBmZWF0dXJlcywgd2hp
Y2ggSSBkb24ndCB0aGluayB3ZSByZWFsbHkgaGF2ZSB0b2RheS4gVG9kYXksIG1vc3QgZmVhdHVy
ZXMgZG9uJ3QgbWl4IGFuZCBtYXRjaCB3ZWxsLCBvbmUgZXhhbXBsZSBvZiB0aGlzIGJlaW5nIGVu
dGl0eS1tYW5hZ2VyIHJlcXVpcmluZyBpbnRlbC1pcG1pLW9lbS4gIFRodXMgZmFyIGZvciB0aGF0
IHNpbXBsZSBleGFtcGxlLCBub2JvZHkgaGFzIHN0ZXBwZWQgdXAgdG8gbWFrZSBpdCBhIGdlbmVy
aWMgeW9jdG8gZmVhdHVyZSBhbmQgc2VwYXJhdGUgb3V0IHRoZSBjb2RlLCBkZXNwaXRlIHByZXR0
eSB3aWRlc3ByZWFkIGFkb3B0aW9uLiAgSSB0aGluayB0aGUgaWRlYSB0aGF0IHdlJ3JlIHN1ZGRl
bmx5IGdvaW5nIHRvIGp1c3Qgc3RhcnQgZG9pbmcgYSBiZXR0ZXIgam9iIG9mIGZlYXR1cmUgc2Vw
YXJhdGlvbiBiZWNhdXNlIG9mIGEgc2luZ2xlIHBhdGNoIGlzIGEgbGl0dGxlIG5haXZlLCBhbmQg
SSdkIHJlYWxseSBsaWtlIHRvIHNlZSB0aGUgcHJvamVjdCBtYWtlIHN0ZXBzIGZvcndhcmQgdG93
YXJkIHRoYXQgYmVmb3JlIHdlIGNyZWF0ZSBhIG1pbmltYWwgaW1hZ2UuDQo+DQo+IElmIHdlIHdh
bnQgdG8gZG8gdGhpcyBnb2luZyBmb3J3YXJkLCBteSBwZXJzb25hbCBvcGluaW9uIGlzIHRoYXQ6
DQo+IDEuIFNvbWVvbmUgbmVlZHMgdG8gZ28gZmlndXJlIG91dCBhbiBleGFtcGxlIGZvciBvbmUg
bm9uLXRyaXZhbCwgY3Jvc3MgYXBwbGljYXRpb24gZmVhdHVyZSB3aXRoIG11bHRpcGxlIG9wdGlv
bnMsIGFuZCBnZXQgeW9jdG8gc29ydGVkIHN1Y2ggdGhhdCBzYWlkICJmZWF0dXJlIiBlbmFibGVz
IHRoZSByaWdodCBjb21wb25lbnQgb3B0aW9ucy4gIEVudGl0eSBtYW5hZ2VyIG1pZ2h0IGJlIGEg
Z29vZCBvbmUsIHBob3NwaG9yLXdlYnVpIHZzIHdlYnVpLXZ1ZSBtaWdodCBiZSBhbm90aGVyIGdv
b2Qgb25lIChJJ20gbG9va2luZyBpbnRvIHRoaXMgY3VycmVudGx5KSwgb3IgaW5kaXZpZHVhbCBS
ZWRmaXNoIHJlc291cmNlcyBpbiBibWN3ZWIgbWlnaHQgYmUgYW5vdGhlci4gIFRoZXJlIGFyZSBh
IGJ1bmNoIG9mIGV4YW1wbGVzIG9mIHRoaXMgeW91IGNvdWxkIHN0YXJ0IHdpdGguDQo+IDIuIERv
Y3VtZW50IGEgcG9saWN5IGFyb3VuZCB3aGF0IGl0IG1lYW5zIHRvIGJlIGEgImZlYXR1cmUiIGlu
Y2x1ZGluZyBzb21lIHJlbGV2YW50IGV4YW1wbGVzLiAgSXMgUmVkZmlzaCBhIGZlYXR1cmU/ICBJ
cyBJUE1JIGEgZmVhdHVyZT8gIG9yIGFyZSB0aG9zZSBqdXN0IGludGVyZmFjZXMgdG8gYWNjZXNz
IG90aGVyIGZlYXR1cmVzPyAgRG8gd2UgbmVlZCBhIGhpZXJhcmNoeSBvZiBmZWF0dXJlcz8gIFdo
ZW4vd2hlcmUgc2hvdWxkIHdlIHVzZSBEQnVzIHRvIGRldGVybWluZSBmZWF0dXJlIGVuYWJsZW1l
bnQsIGFuZCB3aGVuIHNob3VsZCBpdCBiZSBhIGNvbXBpbGUgb3B0aW9uPyAgV2UndmUgYmVlbiB2
ZXJ5IGluY29uc2lzdGVudCBhYm91dCB0aGVzZSBxdWVzdGlvbnMgaW4gdGhlIHBhc3QsIGFuZCBp
dCdzIHBhcnQgb2YgdGhlIHJlYXNvbiB0aGF0IGFkZGluZyAiZmVhdHVyZXMiIHByb3Blcmx5IGlz
IGhhcmQuDQo+IDMuIFNvbWVvbmUgbmVlZHMgdG8gZ28gdGhyb3VnaCB0aGUgdXNlci1mYWNpbmcg
Y2xpZW50cyAocGhvc3Bob3ItaXBtaSwgYm1jd2ViLCBlY3QpIGFzIHdlbGwgYXMgdGhlIHJlY2lw
ZXMsIGFuZCBtYWtlIHN1cmUgY29tbWFuZCBoYW5kbGVycyBhcmUgb3JnYW5pemVkIGluIHN1Y2gg
YSB3YXkgdGhhdCB0aGV5J3JlIGVuYWJsZWQgb3IgZGlzYWJsZWQgYnkgZmVhdHVyZSwgYW5kIHdl
IGNhbiBzdWNjZXNzZnVsbHkgZW5hYmxlIG9uZSBmZWF0dXJlIGF0IGEgdGltZS4gIFRoaXMgd2ls
bCBsaWtlbHkgZXhwb3NlIHNvbWUgaW50ZXJlc3RpbmcgZGVwZW5kZW5jaWVzIChsaWtlIGhvdyBJ
UE1JIGNvbW1hbmRzIGhhdmUgdG8gYmUgZW5hYmxlZC9kaXNhYmxlZCBieSBsaWJyYXJ5KSB0aGF0
IHdlJ2xsIGxpa2VseSBuZWVkIHRvIHRhY2tsZS4NCj4NCj4+IElmIHRoZSBhYm92ZSB0YXNrcyBq
dXN0IGZhbGwgb250byB0aGUgc3Vic3lzdGVtIG1haW50YWluZXJzLCB3aG8gbm93IGhhdmUgdG8g
ZmllbGQgdGhlICJJIGVuYWJsZWQgWCBvbiBteSBtaW5pbWFsIGJ1aWxkIGFuZCBpdCBkb2Vzbid0
IHdvcmsiIHR5cGUgYnVncywgdGhhdCBzZWVtcyBsaWtlIGEgbm9uLXN0YXJ0ZXIsIGFuZCBsaWtl
bHkgdG8gY2F1c2UgbW9yZSBjb25mdXNpb24gdGhhbiB0aGUgY3VycmVudCBzdGF0dXMgcXVvLiAg
SWYgc29tZW9uZSBvciBncm91cCBvZiBzb21lb25lcyBpcyB3aWxsaW5nIHRvIGdvIGRvIHRoZSB3
b3JrLCBJIHRoaW5rIGl0J2QgYmUgYSBncmVhdCBiZW5lZml0IHRvIHRoZSBwcm9qZWN0LCBhbmQg
c29tZXRoaW5nIHRoYXQgd291bGQgaGVscCBhIGxvdCBvZiBwZW9wbGUuICBJJ20gaGFwcHkgdG8g
cGl0Y2ggaW4gYXMgd2VsbCB3aGVyZSBJJ20gYWJsZS4NCj4NCg0KPj4gQWxsIHRoZSBpc3N1ZXMg
KGFuZCBjb25zaWRlcmF0aW9ucyB0byByZXNvbHZlKSwgeW91IGJyaW5nIHVwIGFyZSBncmVhdC4g
SXQgd2lsbCBuZWVkIHBvbGljaWVzLCBkZWZpbml0aW9ucywgYW5kIGNhdGVnb3JpemF0aW9ucyBh
cyB5b3UgcG9pbnQgb3V0LiBJIHRoaW5rIGl0IHdpbGwgdGFrZSBxdWl0ZSBzb21lIHRpbWUgdG8g
Z2V0IHRoZXJlIGFuZCBpdHMgdW5saWtlbHkgdGhhdCB3ZSB3aWxsIGFjaGlldmUgcGVyZmVjdGlv
bi4gU28gd2UgbWF5IGhhdmUgdG8gc3RhcnQgd2l0aCBiYXNpYywgYWRkIGEgYnVuY2ggb2YgdGhp
bmdzIHRvIG1ha2UgaXQgYSBtaW5pbXVtIEJNQyAoSSB0aGluayB0aGUgZmlyc3Qgc3RlcCB3aWxs
IGJlIGFncmVlIHdoYXQgdGhvc2UgbWluaW11bSBmZWF0dXJlIHNldCBpcyksIGFuZCB0aGVuIGJl
IGFibGUgdG8gYWRkIGZyb20gdGhlcmUuIEl0IG1heSBub3QgYmUgdmVyeSBncmFudWxhciAoYXMg
dGhlcmUgd2lsbCBiZSBpbnRlcmRlcGVuZGVuY2llcyksIGJ1dCBldmVuIGlmIHdlIGhhdmUgYSBm
ZXcgc3VjaCBjb25maWd1cmF0aW9ucy9jb21iaW5hdGlvbiBvZiBmZWF0dXJlIGl0IHdpbGwgYmUg
dXNlZnVsIGZvciBzb21lb25lIHRvIHN0YXJ0IHdpdGguIEkgcmVhbGl6ZSB0aGlzIGRvZXNu4oCZ
dCBzb2x2ZSB0aGUgcHJvYmxlbSBmdWxseSwgYnV0IEkgdGhpbmsgaXQncyBtdWNoIGxlc3MgZWZm
b3J0IGFuZCBoZW5jZSBlYXNpZXIgdG8gc3RhcnQgd2l0aC4NCj4NCj4NCg0KPkkgbGlrZSB0byB0
aGluayB0aGF0J3Mgd2hhdCBJIHByb3Bvc2VkLCBzdGFydGluZyBzbWFsbCwgd2l0aCAxIGV4YW1w
bGUgb2YgaG93IHRvIGRvIGl0ICJyaWdodCIsIHRoZW4gYnVpbGRpbmcgb24gaXQuICBJJ20gbm90
IGxvb2tpbmcgZm9yIHBlcmZlY3Rpb24sIGJ1dCBJJ20gbG9va2luZyBmb3IgY29tbWl0bWVudCB0
aGF0IHdlJ2xsIGNvbnRpbnVlIHRvIHB1c2ggdGhpcyBmb3J3YXJkIGluIHBsYWNlcyB3aGVyZSB3
ZSBoYXZlbid0IGJlZW4gdGhhdCBzdWNjZXNzZnVsIGluIHRoZSBwYXN0LiAgSWYgbm90LCBJIHRo
aW5rIGl0IGhhcyB0aGUgcG90ZW50aWFsIHRvIGNvbmZ1c2Ugd2hhdCBpcyBhbHJlYWR5IGEgY29t
cGxleCBhbmQgYmlmdXJjYXRlZCBidWlsZCBlbnZpcm9ubWVudCBldmVuIGZ1cnRoZXIuDQoNCj5P
bmUgbWlub3IgdGhpbmcgdG8gY2xhcmlmeTogIEkgaGFkIGltYWdpbmVkIEJyYWRzIHByb3Bvc2Fs
IG9mIGEgIm1pbmltdW0iIEJNQyB3b3VsZCBoYXZlIGVzc2VudGlhbGx5IG5vdGhpbmcgYWRkZWQs
IGFuZCB3b3VsZCBqdXN0IGJlIGEga2VybmVsIHRoYXQgYm9vdHMsIHdpdGggbm8gaW50ZXJmYWNl
cywgc2VydmljZXMsIG9yIGhhbmRsaW5nLiAgSXMgdGhhdCB3aGF0IHlvdSB3ZXJlIHRoaW5raW5n
PyAgSSBoYWQgbm90IGltYWdpbmVkIHRoYXQgd2Ugd291bGQgbmV2ZXIgImFkZCBhIGJ1bmNoIG9m
IHRoaW5ncyIuICBJZiBzbywgbWF5YmUgSSBtaXN1bmRlcnN0b29kIHdoYXQgQnJhZCBwcm9wb3Nl
ZD8NCg0KSXQncyBhbHJlYWR5IGhhc2hlZCBvdXQgYmV0d2VlbiBCcmFkIGFuZCB5b3UuIFllcyBJ
IHdhcyB0aGlua2luZyBhYm91dCB0aGUgImJhc2ljIEJNQyB3aXRoIG5vIGZlYXR1cmVzIGFkZGVk
IiAoYWN0dWFsbHkgQnJhZCdzIGlkZWEpIHRvIHN0YXJ0IHdpdGguIEkgYWxzbyBob3BlIHRvIGdl
dCBhIG1pbmltdW0gZmVhdHVyZWQgQk1DIChpbnN0ZWFkIG9mIG5vIGZlYXR1cmVzKSBhdCBzb21l
IHBvaW50IG9mIHRpbWUgd2lsbCBiZSB1c2VmdWwuIERlZmluaW5nIHN1Y2ggYSBjb25maWd1cmF0
aW9uIHdpbGwgaW52b2x2ZSBzb21lIHN1YmplY3Rpdml0eSwgYnV0IHdpbGwgYmUgdXNlZnVsIGZv
ciBuZXdjb21lcnMgdG8gZ2V0IHNvbWV0aGluZyB1c2VmdWwgd2l0aG91dCBhIGxvdCBvZiBlZmZv
cnQgKGFuZCBidWxrKS4NCg0KIA0K
