Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8C025BAAF
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 07:58:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bhqqr6DjlzDr2K
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 15:58:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=james.mihm@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=oeFX0X5P; dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bhqq1596JzDqhK
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 15:57:57 +1000 (AEST)
IronPort-SDR: OTeLYkf/SlRQE2d0HSppLS/iCrKjfuEx7w/HsEirReWfl2UHF7vfpBKIEFPtMXS9dBhC5N5gHe
 66W7vXljv3pw==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="242341743"
X-IronPort-AV: E=Sophos;i="5.76,385,1592895600"; d="scan'208";a="242341743"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 22:57:50 -0700
IronPort-SDR: KF+m6kqE6fY2LBWH/qB53iQuZYub2qafWlA5NdINUkMXqcSjzfPzuzB0CVgbbiCEraXQjEpH0X
 2vSOq2rGOM0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,385,1592895600"; d="scan'208";a="341666449"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 02 Sep 2020 22:57:50 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 2 Sep 2020 22:57:50 -0700
Received: from orsmsx151.amr.corp.intel.com (10.22.226.38) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 2 Sep 2020 22:57:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX151.amr.corp.intel.com (10.22.226.38) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 2 Sep 2020 22:57:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 2 Sep 2020 22:57:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgGgFaKxLBYsEcwA3z1NjEOaPLB1al/NqycQ9KorGu0RSf12oHfJCqrAeBonF20ElEwFSTK+lIeJXehJuqz8j7R4jNMxNt9x/v/Hvmg3suwjhadxWmNuiiZDMJpvz9Dn58H3r0kyr/I/2/yESJGB42cQRTcp57aq6lqg6hDOoIoSdcQcvDXXJX7ZCLWyk+EBzDWmmA9Dfg/pFmLjQwPT6o0Nixyqb9Z48yTwhBSwzUWRiVBoKvLASTqciPzwob3zCc6YX+RIOhpgKg36DySOh/rZBydSzHAsvNz07cr6Us5l0KPV+gsbP+iohT/I8hisadzRfDLEKd1mTYOq1K+84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFfP7H/h51VSJaNKX+mVjU361v1CKTjpQT2sYLLplHQ=;
 b=TuaFDGqNBjSx+hAo1tGyUiT1ZE01uKa+143WVhhnf1OBp8QvUjOrgTc4YeY4lH1t3dx1yo6ZBQzpdIZIhqCXEbdujphYZiGeyYTYRv+u5Wy9krj3WSPXhu0ZsHDhVNw0ExDd0yj0eKYMklQYsTmgY98fUqIZSIc2v9Q6WOJsgOEifLpk8uViCbLt0yKsr1hSbGr4fmYRQlc4CZkxJPlkqJk6m3UQDs8uG2YmmB0hJzeZc+lgJpj4lvy4rUsvpbbZwMkslvOveQN9nRCJdnEiMkp9w7lOO8kyvwNs06ccVUVV+xfo4jXwXZ3ATZ2dD/weZdmZ2n+hwFKxH9DIlgz9Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFfP7H/h51VSJaNKX+mVjU361v1CKTjpQT2sYLLplHQ=;
 b=oeFX0X5P0+oQ5FuOnx/cgVzGhTiHyq6OpJh39wo0XubRJfS4W3beXJGNGhOA3gglt/c6kfnhZCVsJvpu5tUlo23Tf3R6kEmWCP0zd5KWLpWr3aIeJEizh8U7FlLQcSk/FwDpn1BFNKpfPpXe6myBl3jO/s+KqBOzcJQXs9zOdyg=
Received: from DM5PR11MB1884.namprd11.prod.outlook.com (2603:10b6:3:112::19)
 by DM6PR11MB3436.namprd11.prod.outlook.com (2603:10b6:5:65::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.22; Thu, 3 Sep
 2020 05:57:48 +0000
Received: from DM5PR11MB1884.namprd11.prod.outlook.com
 ([fe80::b1a1:52cb:5a75:4041]) by DM5PR11MB1884.namprd11.prod.outlook.com
 ([fe80::b1a1:52cb:5a75:4041%5]) with mapi id 15.20.3348.015; Thu, 3 Sep 2020
 05:57:48 +0000
From: "Mihm, James" <james.mihm@intel.com>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: RE: PECI patchset status
Thread-Topic: PECI patchset status
Thread-Index: AQHWf3TU9Z7PObe4C0CIS3wcTpAcqalWL2yg
Date: Thu, 3 Sep 2020 05:57:48 +0000
Message-ID: <DM5PR11MB188419A3302F33CE6FE80740902C0@DM5PR11MB1884.namprd11.prod.outlook.com>
References: <CACPK8XddFvszC1daDKTtqwkE-XDfB7uYFP_H4HZXNUxvNHUaqw@mail.gmail.com>
In-Reply-To: <CACPK8XddFvszC1daDKTtqwkE-XDfB7uYFP_H4HZXNUxvNHUaqw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=intel.com;
x-originating-ip: [67.189.33.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6240dd25-b038-490c-f105-08d84fce495e
x-ms-traffictypediagnostic: DM6PR11MB3436:
x-microsoft-antispam-prvs: <DM6PR11MB34369470BD33212B795D3120902C0@DM6PR11MB3436.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M/Lw/qp7BWEtBEhI8JZvhbW47S2Wc3PtJii4lKDhAVL6K3Rlwx9yWFxn08wfqhtuVYclrDRqpEILTLH4JW2KYZPqnnhlwaiNj203aPSwQbIsEmlA1BpbQNbh5BQ2/Z524aVwvm/o0R/H6G67/UzTKqqO7iWBx0hto0VcUysvOjHlH022b+GvsF0fm7YLXO2x0qKeidKy4qmYGKKRixbEY1oElVOL0z5ekiWuqRIbhEa7Tkt3DvdmBAzPukp/TD6/Bdc/EIAwaRWCIQ/ZMl2b6TXx2nkrysYbjFeo3N/6QcZ70Gx6w/waB7oQDefe2rb0RLnF6wj/MLklCz8D9c7gwUAkj3Z4nBoaOtzE3AZwPPsgnu2/xU2jA/G6BW5C+rmr18UYC2wPLLgWi8a7kpDGBQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1884.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(110136005)(86362001)(8936002)(5660300002)(7116003)(966005)(7696005)(3480700007)(66556008)(66946007)(66476007)(53546011)(71200400001)(66446008)(26005)(55016002)(33656002)(316002)(6506007)(76116006)(8676002)(52536014)(478600001)(64756008)(186003)(83380400001)(9686003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 8mXAgBIWlnch9TLgE6THGQxLMey964dGeudQdZTXN6G7VRZh2cewNzTSxSVfMa6Oz+Jy9OddL0cVVcFiS3puA0aU1hig7gPnnGTbnnO9pEr4I7RdqJEZtmHhZrAjZtiDZdIe5coaZKCCfIeCBjkhiriNoKNA/HKWxZCx5H+y25jEiQWsjHEPjakX4kBQyRb0HhAmhkR33t+MuMhsg0Hstqm0TB8abPgvJbQZD0eWYuq0NPh9g7jCkErQ+6STvqDl1/5M2d1ZDOqwaEzDB+hijnz97QOr3CR7Sd3vYigX4qZf7ubtJneiAiFjWNUJT83a9nQ54c40XyxiwZbSVmFhRo6wHqRhrLv9pM/j5a8kOtfFdAkkSWTqFsfq6OrhIgYzWy3uJl4ysIrO8uz5p7bk/4A7bp7PVMElM7yupyu4F3TSgCFxRVmzBopHss2lEzdpa/1RKLiAkDkLvJ6YNYhs1qjg8yf5jwJtnB1trQulQwA4OwpaqYnuD+LC4DScNBE0OKRDn5aDhnmzBkq/k1yV5B8vIDm0dPhht2QpqmyJKYSBsuzT6fuGXN3QB/6E8XYhF9DHxGB3lyvGq6wIzwrKGsSB4ZNK+q6wCOdPksEtcAqo2WzjShktrRtiLTUj5+ZMSE6Mtq7bdrzKmyST5apMyQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1884.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6240dd25-b038-490c-f105-08d84fce495e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2020 05:57:48.4201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EupjDB09YQt1KAb3jElYL0yF9f6kQW8V/DQohIvJU7MjEDZaAcp6RpMi5uOI+JKZ7cyCnY7zdeuoBrvB1bK0gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3436
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhhbmsgeW91IEpvZWwgZm9yIGNhcnJ5aW5nIHRoaXMgcGF0Y2hzZXQsIGFuZCBJbnRlbCBkb2Vz
IGhhdmUgYW4gaW50ZXJlc3QgaW4gZ2V0dGluZyBvdXIgcGF0Y2hzZXRzIHVwc3RyZWFtZWQuDQoN
ClNpbmNlIEludGVsIGhhcyBhIGxhcmdlIHNldCBvZiBwYXRjaGVzIHRoYXQgbmVlZCB0byBiZSB1
cHN0cmVhbWVkIG91ciBwbGFuIGlzIHRvIGZvcmsgdGhlIGtlcm5lbCBpbiBnaXRodWIvaW50ZWwt
Ym1jIGFuZCBhcHBseSB0aGUgaW50ZWwgcGF0Y2hzZXRzLiBVcHN0cmVhbSByZWNpcGVzIGNhbiB0
aGVuIHB1bGwgdGhlIGtlcm5lbCBmcm9tIHRoZSBpbnRlbCBmb3JrIHdpdGggdGhlIGludGVsIHBh
dGNoZXMuIEludGVsIHdpbGwgZW5zdXJlIHRoYXQgdGhpcyBmb3JrIHRyYWNrcyB0aGUgb3BlbmJt
YyBrZXJuZWwgdmVyc2lvbiBhbmQgbWFpbnRhaW4gdGhlIGludGVsIHBhdGNoc2V0cyB3aGlsZSBp
biB0aGUgcHJvY2VzcyBvZiBnZXR0aW5nIHRoZW0gdXBzdHJlYW1lZC4NCg0KVGhhbmtzLCBKYW1l
cy4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5ibWMgPG9wZW5ibWMt
Ym91bmNlcytqYW1lcy5taWhtPWludGVsLmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYg
T2YgSm9lbCBTdGFubGV5DQpTZW50OiBNb25kYXksIEF1Z3VzdCAzMSwgMjAyMCAxOjU3IEFNDQpU
bzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDog
UEVDSSBwYXRjaHNldCBzdGF0dXMNCg0KSGVsbG8gT3BlbkJNQ2VycywNCg0KVGhlIFBFQ0kgcGF0
Y2hzZXQgaGFzIGJlZW4gY2FycmllZCBpbiB0aGUgb3BlbmJtYyB0cmVlIGluIHNvbWUgZm9ybQ0K
c2luY2UgaXQgd2FzIGZpcnN0IHBvc3RlZCBpbiBEZWNlbWJlciAyMDE3Lg0KDQpJdCBoYXMgbm90
IG1hZGUgaXQgdXBzdHJlYW0gaW4gdGhhdCB0aW1lLCBwbGFjaW5nIHRoZSBtYWludGVuYW5jZQ0K
YnVyZGVuIG9uIG1lIGFzIHRoZSBrZXJuZWwgbWFpbnRhaW5lci4gR2VuZXJhbGx5IHRoaXMgaXNu
J3QgYSBsYXJnZQ0KYW1vdW50IG9mIHdvcmssIGFsdGhvdWdoIGluIHNvbWUgY2FzZXMgaXQgaGFz
IGhlbGQgdXAgcmVsZWFzaW5nIGtlcm5lbA0KYnJhbmNoZXMuIFRvZGF5IEkgbm90aWNlZCB0aGF0
IHRoZSBpY290bCBudW1iZXIgaXQgY2hvc2UgaGFzIGJlZW4NCmNsYWltZWQgYnkgYSBkaWZmZXJl
bnQgaW9jdGwgaW4gbGludXgtbmV4dCwgbWVhbmluZyB3ZSBhcmUgZ3VhcmFudGVlZA0KdG8gaGF2
ZSBmdXR1cmUga2VybmVsL3VzZXJzcGFjZSBpbmNvbXBhdGliaWxpdHkuDQoNCk9wZW5CTUMgaGFz
IHN0cm9uZyBydWxlcyBhYm91dCB1cHN0cmVhbWluZyBrZXJuZWwgcGF0Y2hlcywgYW5kIGluDQpw
YXJ0aWN1bGFyIHVzZXJzcGFjZSBmYWNpbmcgY29kZSwgdG8gYXZvaWQgdGhpcyBpc3N1ZS4NCg0K
R2l2ZW4gdGhlIGxhY2sgb2YgcHJvZ3Jlc3MgSSBwcm9wb3NlIGRyb3BwaW5nIGl0IGZyb20gdGhl
IE9wZW5CTUMNCmtlcm5lbCB0cmVlIHVudGlsIGl0IGlzIG1lcmdlZCB1cHN0cmVhbS4gVGhpcyB3
b3VsZCBuZWNlc3NpdGF0ZQ0KcmVtb3ZpbmcgdGlvZ2FwYXNzIGZyb20gdGhlIE9wZW5CTUMgQ0ks
IGFzIGl0IHJlbGllcyBvbiBQRUNJIHN1cHBvcnQNCmluIHRoZSBrZXJuZWwgdG8gYnVpbGQuDQoN
CklmIHlvdSBoYXZlIGFuIGludGVyZXN0IGluIHRoZSBwYXRjaHNldCBzdGF5aW5nIGluIG9wZW5i
bWMsIHdlIHdvdWxkDQpuZWVkIHNvbWVvbmUgKG9yIGEgdGVhbSkgdG8gdGFrZSB0aGUgcGF0Y2hz
ZXQgKHYxMSBpcyB0aGUgbGF0ZXN0WzFdKQ0KYW5kIHN1Ym1pdCBmb3IgaW5jbHVzaW9uIGluIHRo
ZSBtYWlubGluZSBrZXJuZWwsIGluY2x1ZGluZyBhbiBlbnRyeSBpbg0KTUFJTlRBSU5FUlMgdG8g
Y29tbWl0IHRvIGZ1dHVyZSBtYWludGVuYW5jZS4gTm93IGlzIHRoZSBwZXJmZWN0IHRpbWUNCnRv
IHN1Ym1pdCBmb3IgaW5jbHVzaW9uIGluIDUuMTAuDQoNClsxXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1od21vbi8yMDE5MTIxMTE5NDYyNC4yODcyLTEtamFlLmh5dW4ueW9vQGxpbnV4
LmludGVsLmNvbS8NCg0KQ2hlZXJzLA0KDQpKb2VsDQo=
