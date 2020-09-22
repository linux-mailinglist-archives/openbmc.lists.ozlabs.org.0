Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A16127476B
	for <lists+openbmc@lfdr.de>; Tue, 22 Sep 2020 19:26:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwpBg0gSxzDqVp
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 03:26:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=djxhdsHQ; dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bwp983yVnzDqR3
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 03:25:14 +1000 (AEST)
IronPort-SDR: c3uF3Z9mmEzNf/R27RA4N+Re1PcD9nnGZr9OfQVrCd5QqJb8SrTgceWSfkpC9cdhX5DRN/wrqC
 BI0+CX1dozfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="140678825"
X-IronPort-AV: E=Sophos;i="5.77,291,1596524400"; d="scan'208";a="140678825"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 10:25:11 -0700
IronPort-SDR: 50DiqYb8WarsR9Sa7Hjw6JVSlKKnLBDpXIsYAJ8YFa8wMlj2UBbBWz6+BO5LheK43XAD9CNQVT
 lNfyoh0qhHnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,291,1596524400"; d="scan'208";a="338355536"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 22 Sep 2020 10:25:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 22 Sep 2020 10:25:10 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 22 Sep 2020 10:25:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 22 Sep 2020 10:25:10 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.51) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 22 Sep 2020 10:25:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B66fuuQUcWbhGJSHEhr/t45wljjA1/wfFPoKdMUnOfZiO9HYvBkSy3nIsMkH2LqgSCf47e6u9Hc1oohwGB6wFk00c8dhlAfAvLDIO6NZuMn9dv9vHJ1gMUQN1UEGU8T+yDw0EjWKaZBuWTAP+uYIi8R7MUuUV1LpbDGObuyxkD5DWbVPu/3l0ZRnb4mlbp2HCfamwBIXdfj9tjKcBlF1tDx6rarNPNxOu1oD1soppT5AI1Ls+/8hSbdhMVtJc9Auk5Ddo7cEETROpOBfVXbIUnvhQtusnFqcbBKARLpDAEZDrsRHKIiH5ri6WQT6Y1kKZ42oEzyvpAnpxoizgZbwZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mC0tSYWQ99EPI/9vlAaU9FJRSlyENRAvGP6J+pPY+Tw=;
 b=anocD08hPx4GeZ80OyncWwJ3uBja1z9Glq9sx6jSiTMGCidmyhDW7FNHJtg7sdZAvJPHE08Dpa+M+nObrVkBvygx4byUqU8j6uVME7cy16ElnHYtse5+fFA21di91i8vhH4zpLqtBPYYzIcToo2+YTiaLlaUUwuy9cGTIB5HAuIBPV/WaHGhPy0cKwvpyIEuEhTOYUDAHJRg9n6AIiBo5lKM2+zDkbOA6A4pld0DJ06yvfRX7f/KGvSAMqUrmbZ7m7IGGb315gxqNK4BUR1tkB1qNXJAOReCe5g8BKmbVpIHbRBVhvqx5Jd5ESow7kb3IKPSV5p50rdLGd9D0a9TKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mC0tSYWQ99EPI/9vlAaU9FJRSlyENRAvGP6J+pPY+Tw=;
 b=djxhdsHQpgLnCaRIjZuZmPCbOgPH9LIGT8tBtzT2Z47FtSvRQ2akA5ns4+rm3uVS4+mAG8UxeEwUDsBbM6UOpEgi8rLw3Y2ObHS+yiwCMbnk8UJLX9+6OfjdVvGhyy1+PVi1fMXG2wuY4gZyChhDfiHBJaXdA2KMEqaWaIer8tU=
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by DM6PR11MB2795.namprd11.prod.outlook.com (2603:10b6:5:bf::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Tue, 22 Sep
 2020 17:25:03 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::3111:9e05:e966:74d2]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::3111:9e05:e966:74d2%6]) with mapi id 15.20.3391.026; Tue, 22 Sep 2020
 17:25:02 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: i.kononenko <i.kononenko@yadro.com>, Ed Tanous <ed@tanous.net>
Subject: RE: Naming DBus paths of CPU objects
Thread-Topic: Naming DBus paths of CPU objects
Thread-Index: AQHWf8D1A1a3qKkat0aP6+4fK9uDlqlS4FIAgCG4VgCAAGaGcA==
Date: Tue, 22 Sep 2020 17:25:02 +0000
Message-ID: <DM6PR11MB4410B25BE8A4F5691E9C49AD943B0@DM6PR11MB4410.namprd11.prod.outlook.com>
References: <65194bdf-93e7-0cf5-6fce-2b5b0aee5c9c@yadro.com>
 <CACWQX80Fj2fiF9fW56meL0kQucKfkQc4QbL5-nC-_amRb8O-zg@mail.gmail.com>
 <31453c1b-def5-145a-9bc9-6d621fb9fe1e@yadro.com>
In-Reply-To: <31453c1b-def5-145a-9bc9-6d621fb9fe1e@yadro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.11.44.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa5d2284-e407-425c-1a41-08d85f1c70cc
x-ms-traffictypediagnostic: DM6PR11MB2795:
x-microsoft-antispam-prvs: <DM6PR11MB2795BB108E33672D6E4B19C2943B0@DM6PR11MB2795.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Szvy+UIcHt8ybHkmuE+vZJlp/ZvFRkzna/NtTQlWXMFhizD/sbyaE7O3EjMulaWqv7+yaWKi+pPZJz+uUjY4eK/8eImd9PuouoyR68sIIfLTdH6pPDDRUe+BH0qGtmo1dtY/UumE+znG1VWHRUS9oyqfgw+8XTSproMzAfvlbCNUbYTO/1ttKJE0FYzk9kazPgbPJAORyyqBw/teVdDZGoxrVppf7irn1eUSUMWMjU30R7vjW4QUQTGWJP9GRftZ/VzMQpMUcvBHyDDW0l9TD/ufQX+ecjkFopkJf1oYRME/Exyy8n3nh1mz2jFyinDYbD7yTuiOKjYF4U5vayEjNA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(53546011)(66476007)(66556008)(66446008)(5660300002)(55016002)(33656002)(76116006)(71200400001)(66946007)(316002)(9686003)(83380400001)(52536014)(86362001)(110136005)(64756008)(26005)(478600001)(8936002)(6506007)(8676002)(2906002)(186003)(4326008)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: tuf5qofYFjK9JAWMqMS149g2POePLgT54IdbHtugi71ILbqJ+hqXDXHyrFdv/86orb2YprP9zNHvILv4GNXfKlzDHWQzefnvmPKici93YsyDakjpO5Ldwpc3jPPjMxJZaVr0sfHxz/k2rZW177GmDpI43KWAgqbfQUn/KxFs6vT3XAEiZhSCb4B95FpnAw4yNfkSuv8ZVUOy22gU3HNtUhrhapZykTpPWOPKyU22WZWrtOzGpskevemhrwm+oxWogbsjK/rJfZYDxS9vP0YWRWo59VxvJSK2H+4XwDbBhs596sIrExJeqkKtWUHomDCyyAIoUPb6WA1n/ItIW/Gi4597cc9GuK2yt3Rav9hCGD81GENn9+xKZdr+Wyaq2MEQb+0dR8EFH8vWfOH+aA0mssAgZpgmq8nJiIMMcAgAxbWEAMge/Yqy6y0A6HURGSMBvAOIOhcKE/RqeED9H4DVwwD8EDcbMEOm346su4O8zTvdDjYCwyCUHHlR/8XQkZFQ7SS/sG7+gABS9qitPEZp9pMsfVZ9XGqPJWvH+PeXFVprHPTrLUjeu0PVeyeOVqIQ+nbvJCdTed9wKxBzC+L5CkJQyROILl5nfKnRXRMUjYlZdyl925PKeMyu36zCAiHB1ozIJ1EOYahnkLvDFPTSZQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5d2284-e407-425c-1a41-08d85f1c70cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2020 17:25:02.7593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n3h3SIs+1dYqYKW8WNDXSSkQbTZp5p8D+1Ljg0jA6o9CiwoJGtiqNz6TMMx0HTtG4Bhs8jikB+PjqSKcNmoiCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2795
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SSBhbSB3b3JraW5nIG9uIHNvbWUgQ1BVIHJlbGF0ZWQgcHJvcGVydGllcy4gUGxlYXNlIHVwbG9h
ZCB0byBHZXJyaXQgaWYgeW91IGhhdmUgc29tZSBQT0MgcGF0Y2ggcmVhZHkuDQoNClRoYW5rcywN
ClpoaWt1aQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmJtYyA8b3Bl
bmJtYy1ib3VuY2VzK3poaWt1aS5yZW49aW50ZWwuY29tQGxpc3RzLm96bGFicy5vcmc+IE9uIEJl
aGFsZiBPZiBpLmtvbm9uZW5rbw0KU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDIyLCAyMDIwIDM6
MzUgQU0NClRvOiBFZCBUYW5vdXMgPGVkQHRhbm91cy5uZXQ+DQpDYzogT3BlbkJNQyBNYWlsbGlz
dCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogUmU6IE5hbWluZyBEQnVzIHBh
dGhzIG9mIENQVSBvYmplY3RzDQoNCkVkLCBoZWxsbw0KU29tZSB0aW1lIGFnbyBJIG9wZW5lZCBk
aXNjdXNzaW9uIGFib3V0IG5hbWluZyBvZiBDUFUgZGJ1cy1vYmplY3RzIGFuZCB3YXkgdG8gY291
cGxlIG9mIGl0cy4NCkJ1dCwgbXkgYmFkLCBJIHdhcyBtaXNzaW5nIHlvdXIgYW5zd2VyLiBTbyBz
b3JyeSwgSSdkIGtpbmRseSBhc2sgdG8gc3RhcnQgZGlzY3Vzc2lvbiBhZ2Fpbg0KDQpCZWxsb3cg
YXJlIG15IHRob3VnaHRzIGFib3V0IHRoaXMuDQoNCk9uIDAxLjA5LjIwMjAgMDI6MzksIEVkIFRh
bm91cyB3cm90ZToNCj4gT24gTW9uLCBBdWcgMzEsIDIwMjAgYXQgMTA6NTUgQU0gaS5rb25vbmVu
a28gPGkua29ub25lbmtvQHlhZHJvLmNvbT4gd3JvdGU6DQo+Pg0KPj4gSGksDQo+Pg0KPj4gSSdt
IHdvcmtpbmcgb24gaW1wcm92aW5nIG9mIHRoZSBPcGVuQk1DIFJlZEZJU0ggQVBJLiBJbiBwYXJ0
aWN1bGFyLCB0aGUgZW5kcG9pbnQgb2YgdGhlIFByb2Nlc3Nvci4NCj4+IFRvIHByb3ZpZGUgYWxs
IHRoZSBwcm9wZXJ0aWVzIG9mIHRoZSBhcHBsaWVkIFJlZEZJU0ggc2NoZW1hLCB3ZSBuZWVkIA0K
Pj4gdG8gZ2V0IGZyb20gREJ1cyBldmVyeXRoaW5nIHJlbGF0ZWQgdG8gdGhlIENQVSBvYmplY3Qu
DQo+PiBJdCBjYW4gYmUgQ1BVLCBTZW5zb3IgQ1BVIHRlbXAsIFNlbnNvcnMgQ29yZSBDUFUsIGV0
Yy4NCj4gDQo+IA0KPiBJJ20gYSBsaXR0bGUgY29uZnVzZWQuICBUaGUgUHJvY2Vzc29yIHNjaGVt
YSBkb2Vzbid0IGhhdmUgYSBUaGVybWFsIA0KPiBwcm9wZXJ0eSAoZGlkIHRoZXkgYWRkIG9uZT8p
IHNvIENQVSB0ZW1wZXJhdHVyZXMgYW5kIGNvcmUgdGVtcHMgd291bGQgDQo+IG5lZWQgdG8gZ28g
dW5kZXIgYW4gZXF1aXZhbGVudCBBc3NlbWJseSBvciBDaGFzc2lzLiAgSSB0aGluayB0b2RheSBm
b3IgDQo+IHNvbWUgcGxhdGZvcm1zIHRoZXkncmUgYWRkZWQgdW5kZXIgdGhlIGJhc2Vib2FyZCwg
d2hpY2ggaXNuJ3QgDQo+ICJjb3JyZWN0IiBidXQgaXMgY2xvc2UgZW5vdWdoLiAgQ2FuIHlvdSB0
YWxrIGEgbGl0dGxlIG1vcmUgYWJvdXQgd2hhdCANCj4geW91J3JlIHdhbnRpbmcgdG8gYWNjb21w
bGlzaCBpbiB5b3VyIGltcHJvdmVtZW50cz8gIFdoYXQgd291bGQgdGhlIGVuZCANCj4gcmVzdWx0
IGxvb2sgbGlrZT8NCg0KWWVzLCB0aGUgUHJvY2Vzc29yIHNjaGVtYSBkb2Vzbid0IGhhdmUgVGhl
cm1hbCBwcm9wZXJ0eSwgYnV0IGxldCdzIGxvb2tzIHRvIGltcGxlbWVudGF0aW9uIG9mIENQVVNl
bnNvcnMuDQpJdCdzIGJlIG1vcmUgcHJlY2lzZSBleHBsYW5hdGlvbiBvZiB3aGF0IEkgd2FudCB0
byBhY2NvbXBsaXNoLg0KDQpUaGUgQ1BVU2Vuc29ycyB0YWtlcyB0aGUgREJ1cyBjb25maWd1cmF0
aW9uIG9iamVjdCB3aGljaCBpcyBkZWZpbmVkIGF0IHRoZSBFbnRpdHlNYW5hZ2VyLg0KVGhpcyBv
YmplY3QgaW1wbHMgdGhlIGB4eXoub3BlbmJtY19wcm9qZWN0LkNvbmZpZ3VyYXRpb24uWGVvbkNQ
VWAgYW5kIGB4eXoub3BlbmJtY19wcm9qZWN0LkludmVudG9yeS5JdGVtYC4NClRoZSBsYXN0IG9u
ZSBhZGp1c3QgYFByZXNlbnRgIGFuZCBgUHJldHR5TmFtZWAgcHJvcGVydGllcy4gU28sIGtub3du
IHRoYXQgYXQgbGVhc3QsIHdlIGNhbiBhZGp1c3QgUHJvY2Vzc29yJ3Mgc2NoZW1hIGZpZWxkcyAi
U3RhdHVzIjogIkhlYWxmIiBBbmQgIlN0YXRlIi4gDQoNCk1vcmVvdmVyLCB0aGUgQ1BVU2Vuc29y
cyB1c2luZyBkYXRhIG9mIGB4eXoub3BlbmJtY19wcm9qZWN0LkNvbmZpZ3VyYXRpb24uWGVvbkNQ
VWAgcmV0cmlldmUgdGhlIHNlbnNvcnMgdGFyZ2V0IHZhbHVlcyBmcm9tIGBod21vbmAgYW5kIGRl
ZmluZSBjcHUtY29yZSBkYnVzIG9iamVjdHMsIGluIHBhcnRpY3VsYXIuIEVhY2ggb25lIGNwdS1j
b3JlIG9iamVjdCBhbHNvIHdhbnQgaGF2ZSBgUHJlc2VudGAgcHJvcGVydHkuIEhhdmluZyB0aGlz
IGluZm9ybWF0aW9uIGFib3V0IGVhY2ggQ29yZSBvZiBDUFUgd2UgY2FuIGFkanVzdCBmaWVsZCAi
VG90YWxFbmFibGVkQ29yZXMiLg0KU3VtbWFyeSwgaWYgdGhpcyBvYmplY3RzIHdpbGwgYmUgY291
cGxlIHRoZW4gd2UgY2FuIHByZXNlbnQgdGhlIFByb2Nlc3NvciBzdGF0ZSBpbmZvcm1hdGlvbiBh
dCBhIGZpcnN0IGFwcHJveGltYXRpb24uDQoNCkF0IG5leHQgdGltZSwgd2hlbiBhbGwgc3BlY2lm
aWMgQ1BVIGluZm9ybWF0aW9uIHdpbGwgYmUgdGFrZW4gZnJvbSBhIDNkLXBhcnR5IHBsYWNlIChl
LmcuIHNtYmlvcy1tZHJ2Mikgd2Ugd291bGQgd2FudCBhZGRzIHRoaXMgdG8gdGhlIGV4aXN0cyBD
UFUgaXRlbS4NCkZvciB0aGF0IG1pZ2h0IGJlZW4gaGFwcGVuIHdlIG11c3QgZGVmaW5lIHdheSB0
byBjb3VwbGUgYWxsIGRidXMtb2JqZWN0IGFib3V0IHRoZSBzYW1lIHRoaW5nIHBoeXNpY2FsIHBy
b2Nlc3Nvci4gDQooRU0tY29uZmlndXJhdGlvbiwgQ1BVU2Vuc29ycy1lYWNoLXNlbnNvcnMsIENQ
VVNlbnNvci1oZWFsZi1vYmplY3QsIFNtYmlvc19tZHJ2Mi1tYW51ZmFjdHVyZXItZGF0YSwgZS5n
LikNCg0KSSdkIHN1Z2dlc3QgdG8gZG8gdGhpcyB3aXRoIG9iamVjdC1tYXBwZXIncyBhc3NvY2lh
dGlvbnMuIEkgaGF2ZSBwYXRjaCBzZXQgYW5kIEkgY2FuIHB1c2ggaXQgdG8gZ2Vycml0LCBpZiBh
bnlib2R5IGludGVyZXN0ZWQgb2YgdGhlIHB1cnBvc2VzIGRlc2NyaWJlZCBhYm92ZS4NCg0KVGhh
bmtzIQ0KDQo+IA0KPj4NCj4+DQo+PiBIb3dldmVyLCBzb21lIHNlcnZpY2VzIGhhdmUgZGlmZmVy
ZW50IG5hbWVzIGZvciB0aGUgc2FtZSBwaHlzaWNhbCBwcm9jZXNzb3IuDQo+PiBJbiBwYXJ0aWN1
bGFyIGl0IGlzIGFib3V0IGBlbnRpdHktbWFuYWdlcmAsIGBkYnVzLXNlbnNyb3NgLCBgc21iaW9z
LW1kcl92MmAuDQo+PiBgU21iaW9zLW1kcl92MmAgKGp1c3QgbGlrZSBgaHdtb25gKSBuYW1lcyB0
aGUgcHJvY2Vzc29yLCBpbmRleGluZyBpdCANCj4+IGZyb20gMDsgaW4gYGVudGl0eS1tYW5hZ2Vy
YCBhbmQgYGRidXMtc2Vuc29yYCBpbmRleGluZyBzdGFydHMgZnJvbSAxLg0KPj4NCj4+IEkgd2Fu
dCB0byBhZGQgZGJ1cy1hc3NvY2lhdGlvbnMgYmV0d2VlbiBhbGwgUHJvY2Vzc29yJ3Mgb2JqZWN0
LCBidXQgDQo+PiBmb3IgdGhhdCBJIHRoaW5rIHdlIG5lZWQgdG8gYWRvcHQgYSBuYW1pbmcgY29u
dmVudGlvbiBmb3IgdGhlIHNhbWUgREJ1cyBvYmplY3RzLg0KPiANCj4gDQo+IENhbiB5b3UgdGFs
ayBhYm91dCB3aHkgeW91IG5lZWQgdGhpcz8gIEtlZXAgaW4gbWluZCwgdGhlcmUgYXJlIGxvdHMg
b2YgDQo+IHN5c3RlbXMgdGhhdCBoYXZlIHByb2Nlc3NvcnMgb24gYWRkIGluIGNhcmRzLCBvciBz
ZXBhcmF0ZSANCj4gYWNjZWxlcmF0b3JzLiAgTWFraW5nIHRoZSBzdGF0ZW1lbnQgImFsbCIgbWFr
ZXMgbWUgdGhpbmsgeW91J3JlIA0KPiB3YW50aW5nIHRvIG1ha2UgYSBibGFua2V0IGFzc29jaWF0
aW9uIGZyb20gc3lzdGVtLT5wcm9jZXNzb3IsIHdoaWNoIA0KPiBJJ20gbm90IHN1cmUgd2UgY2Fu
IGRvIGFzIGEgZ2VuZXJhbGl6YXRpb24gd2l0aG91dCBicmVha2luZyB0aG9zZSB1c2UgDQo+IGNh
c2VzICh3aGljaCBhZG1pdHRlZGx5IGFyZW4ndCBtb2RlbGVkIHZlcnkgd2VsbCB0b2RheSkuICBJ
IHdvdWxkIGhvcGUgDQo+IHdlIGRvbid0IG5lZWQgdG8gcmVseSBvbiBhIGNvbW1vbiBuYW1pbmcg
Y29udmVudGlvbiB0byBkbyBpdC4NCj4gDQo+Pg0KPj4NCj4+IEkgbGlrZSB0byBpbmRleCBpdCBm
cm9tIDAsIGp1c3QgbGlrZSBkb2luZyB0aGF0IHRoZSBgaHdtb25gLCBmb3IgZXhhbXBsZS4NCj4g
DQo+IA0KPiBJIGNvbXBsZXRlbHkgYWdyZWUgdGhhdCB3ZSBzaG91bGQgc3RhbmRhcmRpemUgdGhl
IG5hbWluZyBjb252ZW50aW9uIA0KPiB3aGVyZSB3ZSBjYW4sIHRoZSBvbmx5IHByb2JsZW0gaGVy
ZSBpcyB0aGF0IHRoZSBvdmVyYXJjaGluZyBnb2FsIGlzIA0KPiB0aGF0IHdlIG1hdGNoIHRoZSBz
aWxrc2NyZWVuIG1hc2sgb24gdGhlIGJvYXJkLCBzb21lIG9mIHdoaWNoIHplcm8gDQo+IGluZGV4
LCBzb21lIG9mIHdoaWNoIG9uZSBpbmRleC4gIFdpdGggdGhhdCBzYWlkLCBJIGtub3cgdGhhdCBh
IGxvdCBvZiANCj4gdGhlIGV4aXN0aW5nIGNvbmZpZ3MgZG9uJ3QgY3VycmVudGx5IG1hdGNoIHRo
ZSBzaWxrc2NyZWVuLg0KPiBzbWJpb3MtbWRyX3YyIHRvIG15IHVuZGVyc3RhbmRpbmcgc2hvdWxk
IGJlIHVzaW5nIDEgaW5kZXhpbmcuDQo+IA0KPj4NCj4+DQo+PiAtLQ0KPj4gQmVzdCBSZWdhcmRz
IQ0KPj4gSWdvciBLb25vbmVua28NCg0KLS0NCmJlc3QsDQoNCklnb3IgS29ub25lbmtvDQo=
