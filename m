Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D49826E850
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 00:23:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bss1t2VDMzDqgd
	for <lists+openbmc@lfdr.de>; Fri, 18 Sep 2020 08:23:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=sharad.khetan@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=bFevHSgy; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bss0L3GYYzDqg6
 for <openbmc@lists.ozlabs.org>; Fri, 18 Sep 2020 08:22:21 +1000 (AEST)
IronPort-SDR: wOPzq6N98vfcZ3TMhFUQik5ZVRWfKMv2YhbRcuBUR2A7WaCT7I70OdMpjRUQmhBtHI1IJaxQs6
 xfWniYo94JAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="159110729"
X-IronPort-AV: E=Sophos;i="5.77,272,1596524400"; d="scan'208";a="159110729"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 15:21:23 -0700
IronPort-SDR: T+mVGioh1UWXSuO6rVDrJN8IohfzXBkd8a07qrtLtKa1eAVgOGpRcTuy3nxgGkB0DC0N07aI2R
 rsE4/eMlpwUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,272,1596524400"; d="scan'208";a="307641000"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 17 Sep 2020 15:21:21 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 17 Sep 2020 15:21:21 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 17 Sep 2020 15:21:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 17 Sep 2020 15:21:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 17 Sep 2020 15:21:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flpLGlBhGL0t0jNK5fhHlioaCcWxNtA8WvZ/yy6q+WGcxzK7Z9OP0qskX5RUWj8177B/7R7YSBcqQPae82299jWRibHPzR6vj12Ziw+LRrHSbqaTqy2ZWptNSdrHylwe6OhjC/8NZspqVSg2axsOaEN6QOTzUX7JvA692ltVY337wYcw9cGVzBz++wsSBIHt3xIYeK4FgafQyuoETi+qBcn/jwArUSZ+14FvAfBF+KcKLTO8bxi4o7D1YUu4Chd9ueREq/PqA7cNQI+p9o+jODnfYhZZB47p4QN1PaoqubkcXsljrWy3XKUeSSvcIUwtMOnIsgVX5A6PRvn4znhcyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0taJHYdVmbwzcloYBtwtLFwo0HrWM/Uuk4Qri+2228=;
 b=dlUiRy4wqAxxrLLFaXDtEbOOXAo3uP1UuBQYLabDEkQFe8oiGHaiu68TQjT4gEDGPwVrH99lX3ZagpyxhBWVQ5SYjMnqg1o2bWudqYSGl2Pbc8QTvQaoG8ZdSIAwCx5XdNcBu4DyqDGN4uDNJ9RMAifv/sJ1/sZ6k9p0xXsmzXXXSOzEE6itYtCveg04cnqmVZqzVKOnAa1dFQKyF6VNKCRxmcf9B2qw+rE+r7U9mQwBzkqUrt1ASfrr7HzVCbIdP+WkEFYNKZA1iZwCb5Wt+BGh347ceP1WlYlUiAsSYBYauI2kLN4AWFgag/Rvk6QDGvK6PApTwGo6GBqKMVvWOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0taJHYdVmbwzcloYBtwtLFwo0HrWM/Uuk4Qri+2228=;
 b=bFevHSgySyw41p4zRdWe74OjUl9i0WuskEibpwf3sLV3vLQ5rVCV6hpYfiBQxYlcoBzO61/gY5w135L8qbVd7NZnKxaJt0yuOLT7YlTq31PCsZY8cC4Cb/VRzeMZ/DXCuUZCZjeE0hP0SAohwlEBPIWIH+lymmeMi+h7uIY40As=
Received: from MWHPR11MB0046.namprd11.prod.outlook.com (2603:10b6:301:67::30)
 by MWHPR11MB2029.namprd11.prod.outlook.com (2603:10b6:300:27::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 22:21:17 +0000
Received: from MWHPR11MB0046.namprd11.prod.outlook.com
 ([fe80::6d7b:11d7:359a:dbfb]) by MWHPR11MB0046.namprd11.prod.outlook.com
 ([fe80::6d7b:11d7:359a:dbfb%7]) with mapi id 15.20.3370.017; Thu, 17 Sep 2020
 22:21:17 +0000
From: "Khetan, Sharad" <sharad.khetan@intel.com>
To: Ed Tanous <ed@tanous.net>, Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: interest in a minimal image recipe
Thread-Topic: interest in a minimal image recipe
Thread-Index: AQHWi589ZL1TIJ3aQEmLrkPkZZNN0altUs8AgAAT74A=
Date: Thu, 17 Sep 2020 22:21:16 +0000
Message-ID: <MWHPR11MB004670BBADCA48F5EE9BE9C7F13E0@MWHPR11MB0046.namprd11.prod.outlook.com>
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
 <CACWQX80tELWA-EW0A8-DnJGFmJyMxDC04YTq4B+--bRaoV8rOQ@mail.gmail.com>
In-Reply-To: <CACWQX80tELWA-EW0A8-DnJGFmJyMxDC04YTq4B+--bRaoV8rOQ@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: ca2977e8-e8fb-4eff-3b8b-08d85b57ff2a
x-ms-traffictypediagnostic: MWHPR11MB2029:
x-microsoft-antispam-prvs: <MWHPR11MB2029074227B1EACBF0D538A9F13E0@MWHPR11MB2029.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cL1zHjUHMZ2BWLDMynD19ges2oF39jp6DPc8jOLvQEFX7Z3ac8o3xopsyasRnzEF2lzXCmGVrLQziaG3HSdFkXmFNrG6hm2kChf2XO156XzOkeD/+x7t9GWmlhV22TtjHUeVOss3IVHCvatatnVhxK00TlI871fCD++11mFN2P6V+suuRC3ChP6W5cF9sf0GF25iC2s01SJv1HeKQ9eLmSRcFzMfDBopEpNtQ8ZIF9g6OoNUY/HMlYa/wOXqEMM8ydtRo7usDHjE/yVE6jeJVB+skw84OYxgrfh5PDpDgBdN6eDAjQf2fsciua01XL0yYCrfwMgf/Om+oSAmq3BBB+7giBPx6T2yPK5RUfo3LIFceoRqS3yj8+oeb2BEdJEHRaYXDRGFVg5Ey9wo2KriLJQZkz+48GZ1ysr8VdPhpeVp/zPdSBnGi6AkK94hkd3GwYa5+EcbUHaAw/8h0DPa/Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(71200400001)(52536014)(86362001)(966005)(66556008)(66476007)(5660300002)(66946007)(9686003)(76116006)(64756008)(66446008)(110136005)(55016002)(6506007)(33656002)(7696005)(316002)(8936002)(2906002)(8676002)(53546011)(4326008)(83380400001)(478600001)(186003)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: b59QgnQbqC1qoFFanjVUdH96eZus7b8xaAVIYqcf4aPK/wAQOj8ys5fERNMoV9W9KDahlUgr4TE/6XZV+sJIZKTP5eFw3H6bZCOdf/LYEG3hgDuAjttDRkHS4fJ3/gCwlEjkeko9aclfDQmCWTvK9HP5cjWKtKXgZ2rnr+NTNZmkcP4uDKen5OTANK//zFWm8LQnaAv8M6RK9GUQxEiAWjPwvsy21UdjYdpOXs4u77qSjVhuQ9skYPh4LzjAhArN+IM96tYVOGwvNe0bC8LZSfCeNq7/K+gpBkXfjPOkQyaRvbiPdnvP+HVU/nQ7kXl5Kij9/kCw6fwom9A7S7s4/XBtUWjA116T5U+EWWeYKUqlRQP9iaBJBvLiYkClAVsQ/4qf8NAFreO6d4YRynZOJ8eLWvIRahFBssWzYB81IT4grA98CGEYZPnIYkgnSBcoKXprUgFjr/wDO+BLhNK2VvVhoREc3jNo44QzGCKie+kSJ1XWThbthz8knxciOouLu/k79V17SNQdF+xHoYWC1hGDTohJwWn6rqSNAgODkNvFlmHD2ZxbysKXzySvNZ/GxZDEn+zb7UDJfclavXKvfdWh36lHjvRm05ZeXgLNcR1iFc90pMH6KCibviY3/I/3Suu/11kDtGwdAVyONG1ewQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2977e8-e8fb-4eff-3b8b-08d85b57ff2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 22:21:17.1666 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FIepoV9N7FzLyfaPgAGfHZQFeAlMZRafAsw7bxHuIAwJEA5J1yB/vm6CTLZJU2hoQNGwFeu/zB8BJUCiuZ0+KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2029
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

RWQsIHdlbGNvbWUgYmFjayDwn5iKLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJv
bTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK3NoYXJhZC5raGV0YW49aW50ZWwuY29tQGxpc3Rz
Lm96bGFicy5vcmc+IE9uIEJlaGFsZiBPZiBFZCBUYW5vdXMNClNlbnQ6IFRodXJzZGF5LCBTZXB0
ZW1iZXIgMTcsIDIwMjAgMTo1NyBQTQ0KVG86IEJyYWQgQmlzaG9wIDxicmFkbGV5YkBmdXp6aWVz
cXVpcnJlbC5jb20+DQpDYzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMu
b3JnPg0KU3ViamVjdDogUmU6IGludGVyZXN0IGluIGEgbWluaW1hbCBpbWFnZSByZWNpcGUNCg0K
T24gVHVlLCBTZXAgMTUsIDIwMjAgYXQgMTozMSBQTSBCcmFkIEJpc2hvcCA8YnJhZGxleWJAZnV6
emllc3F1aXJyZWwuY29tPiB3cm90ZToNCj4NCj4gSSd2ZSBoZWFyZCBhIGhhbmRmdWwgb2YgdGlt
ZXMgdGhhdCBtZXRhLXBob3NwaG9yIHVzZXJzIG9mdGVuIGhhdmUgdG8gDQo+IHJlbW92ZSB0aGUg
bGF0ZXN0IGZlYXR1cmUgYWRkZWQgYnkgZGVmYXVsdCB0byBvYm1jLXBob3NwaG9yLWltYWdlLg0K
Pg0KPiBJIGhhdmUgYW4gUkZDIGZvciBhbiBlbXB0eSBpbWFnZSB0aGF0IHRoZXNlIHVzZXJzIGNv
dWxkIGJiYXBwZW5kIGFuZCANCj4gb3B0LWluIHRvIHNwZWNpZmljIGltYWdlIGZlYXR1cmVzIGlu
c3RlYWQgb2YgaGF2aW5nIHRvIHJlcGVhdGVkbHkgDQo+IG9wdC1vdXQuDQo+DQo+IElmIHlvdSBs
aWtlIHRoZSBvcHQtaW4gYXBwcm9hY2gsIHBsZWFzZSBkcm9wIGEgKzEgYW5kL29yIHJldmlldyBt
eSBwYXRjaDoNCj4NCj4gaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5i
bWMvbWV0YS1waG9zcGhvci8rLzM2NTE2DQo+DQo+IEkgYnJpbmcgdGhpcyB1cCBub3cgYmVjYXVz
ZSBJLCBhbmQgb3RoZXJzIGhhdmUgYmVlbiBhZGRpbmcgbmV3IGltYWdlIA0KPiBmZWF0dXJlcyB0
byBvYm1jLXBob3NwaG9yLWltYWdlIChlLmcuIHR1cm5lZCBvbiBieSBkZWZhdWx0KSwgYW5kIEkg
DQo+IHdvdWxkIGxpa2UgdG8gc3RhcnQgYSBkaXNjdXNzaW9uIGFib3V0IHdoYXQgaXQgbWVhbnMg
Zm9yIGFuIA0KPiBhcHBsaWNhdGlvbiB0byBiZSBpbiB0aGUgT3BlbkJNQyBnaXRodWIgb3JnYW5p
emF0aW9uLiAgSSB3b3VsZCBwcm9wb3NlIA0KPiB0aGF0IGl0IG1lYW5zIGl0IGlzIGVuYWJsZWQg
YW5kIHR1cm5lZCBvbiBieSBkZWZhdWx0IGluIG9ibWMtcGhvc3Bob3ItaW1hZ2UuDQo+DQo+IExv
b2tpbmcgZm9yd2FyZCB0byB5b3VyIHRob3VnaHRzLg0KPg0KPiAtYnJhZA0KDQpBcyBhIGdlbmVy
YWwgZGVzY3JpcHRpb24sIHRoaXMgc291bmRzIGdyZWF0LCBidXQgYXMgYWx3YXlzIHRoZSBkZXZp
bCBpcyBpbiB0aGUgZGV0YWlscy4gIFRoZSBiaWdnZXN0IG9ic3RhY2xlIHRvIHRoaXMgSSBzZWUg
aXMgdGhhdCB3ZSdkIG5lZWQgYSBwb2xpY3kgYW5kIGRlc2lnbiBhcm91bmQgc3VwcG9ydGluZyBt
aXgtYW5kLW1hdGNoIG9uIGZlYXR1cmVzLCB3aGljaCBJIGRvbid0IHRoaW5rIHdlIHJlYWxseSBo
YXZlIHRvZGF5LiBUb2RheSwgbW9zdCBmZWF0dXJlcyBkb24ndCBtaXggYW5kIG1hdGNoIHdlbGws
IG9uZSBleGFtcGxlIG9mIHRoaXMgYmVpbmcgZW50aXR5LW1hbmFnZXIgcmVxdWlyaW5nIGludGVs
LWlwbWktb2VtLiAgVGh1cyBmYXIgZm9yIHRoYXQgc2ltcGxlIGV4YW1wbGUsIG5vYm9keSBoYXMg
c3RlcHBlZCB1cCB0byBtYWtlIGl0IGEgZ2VuZXJpYyB5b2N0byBmZWF0dXJlIGFuZCBzZXBhcmF0
ZSBvdXQgdGhlIGNvZGUsIGRlc3BpdGUgcHJldHR5IHdpZGVzcHJlYWQgYWRvcHRpb24uICBJIHRo
aW5rIHRoZSBpZGVhIHRoYXQgd2UncmUgc3VkZGVubHkgZ29pbmcgdG8ganVzdCBzdGFydCBkb2lu
ZyBhIGJldHRlciBqb2Igb2YgZmVhdHVyZSBzZXBhcmF0aW9uIGJlY2F1c2Ugb2YgYSBzaW5nbGUg
cGF0Y2ggaXMgYSBsaXR0bGUgbmFpdmUsIGFuZCBJJ2QgcmVhbGx5IGxpa2UgdG8gc2VlIHRoZSBw
cm9qZWN0IG1ha2Ugc3RlcHMgZm9yd2FyZCB0b3dhcmQgdGhhdCBiZWZvcmUgd2UgY3JlYXRlIGEg
bWluaW1hbCBpbWFnZS4NCg0KSWYgd2Ugd2FudCB0byBkbyB0aGlzIGdvaW5nIGZvcndhcmQsIG15
IHBlcnNvbmFsIG9waW5pb24gaXMgdGhhdDoNCjEuIFNvbWVvbmUgbmVlZHMgdG8gZ28gZmlndXJl
IG91dCBhbiBleGFtcGxlIGZvciBvbmUgbm9uLXRyaXZhbCwgY3Jvc3MgYXBwbGljYXRpb24gZmVh
dHVyZSB3aXRoIG11bHRpcGxlIG9wdGlvbnMsIGFuZCBnZXQgeW9jdG8gc29ydGVkIHN1Y2ggdGhh
dCBzYWlkICJmZWF0dXJlIiBlbmFibGVzIHRoZSByaWdodCBjb21wb25lbnQgb3B0aW9ucy4gIEVu
dGl0eSBtYW5hZ2VyIG1pZ2h0IGJlIGEgZ29vZCBvbmUsIHBob3NwaG9yLXdlYnVpIHZzIHdlYnVp
LXZ1ZSBtaWdodCBiZSBhbm90aGVyIGdvb2Qgb25lIChJJ20gbG9va2luZyBpbnRvIHRoaXMgY3Vy
cmVudGx5KSwgb3IgaW5kaXZpZHVhbCBSZWRmaXNoIHJlc291cmNlcyBpbiBibWN3ZWIgbWlnaHQg
YmUgYW5vdGhlci4gIFRoZXJlIGFyZSBhIGJ1bmNoIG9mIGV4YW1wbGVzIG9mIHRoaXMgeW91IGNv
dWxkIHN0YXJ0IHdpdGguDQoyLiBEb2N1bWVudCBhIHBvbGljeSBhcm91bmQgd2hhdCBpdCBtZWFu
cyB0byBiZSBhICJmZWF0dXJlIiBpbmNsdWRpbmcgc29tZSByZWxldmFudCBleGFtcGxlcy4gIElz
IFJlZGZpc2ggYSBmZWF0dXJlPyAgSXMgSVBNSSBhIGZlYXR1cmU/ICBvciBhcmUgdGhvc2UganVz
dCBpbnRlcmZhY2VzIHRvIGFjY2VzcyBvdGhlciBmZWF0dXJlcz8gIERvIHdlIG5lZWQgYSBoaWVy
YXJjaHkgb2YgZmVhdHVyZXM/ICBXaGVuL3doZXJlIHNob3VsZCB3ZSB1c2UgREJ1cyB0byBkZXRl
cm1pbmUgZmVhdHVyZSBlbmFibGVtZW50LCBhbmQgd2hlbiBzaG91bGQgaXQgYmUgYSBjb21waWxl
IG9wdGlvbj8gIFdlJ3ZlIGJlZW4gdmVyeSBpbmNvbnNpc3RlbnQgYWJvdXQgdGhlc2UgcXVlc3Rp
b25zIGluIHRoZSBwYXN0LCBhbmQgaXQncyBwYXJ0IG9mIHRoZSByZWFzb24gdGhhdCBhZGRpbmcg
ImZlYXR1cmVzIiBwcm9wZXJseSBpcyBoYXJkLg0KMy4gU29tZW9uZSBuZWVkcyB0byBnbyB0aHJv
dWdoIHRoZSB1c2VyLWZhY2luZyBjbGllbnRzIChwaG9zcGhvci1pcG1pLCBibWN3ZWIsIGVjdCkg
YXMgd2VsbCBhcyB0aGUgcmVjaXBlcywgYW5kIG1ha2Ugc3VyZSBjb21tYW5kIGhhbmRsZXJzIGFy
ZSBvcmdhbml6ZWQgaW4gc3VjaCBhIHdheSB0aGF0IHRoZXkncmUgZW5hYmxlZCBvciBkaXNhYmxl
ZCBieSBmZWF0dXJlLCBhbmQgd2UgY2FuIHN1Y2Nlc3NmdWxseSBlbmFibGUgb25lIGZlYXR1cmUg
YXQgYSB0aW1lLiAgVGhpcyB3aWxsIGxpa2VseSBleHBvc2Ugc29tZSBpbnRlcmVzdGluZyBkZXBl
bmRlbmNpZXMgKGxpa2UgaG93IElQTUkgY29tbWFuZHMgaGF2ZSB0byBiZSBlbmFibGVkL2Rpc2Fi
bGVkIGJ5IGxpYnJhcnkpIHRoYXQgd2UnbGwgbGlrZWx5IG5lZWQgdG8gdGFja2xlLg0KDQpJZiB0
aGUgYWJvdmUgdGFza3MganVzdCBmYWxsIG9udG8gdGhlIHN1YnN5c3RlbSBtYWludGFpbmVycywg
d2hvIG5vdyBoYXZlIHRvIGZpZWxkIHRoZSAiSSBlbmFibGVkIFggb24gbXkgbWluaW1hbCBidWls
ZCBhbmQgaXQgZG9lc24ndCB3b3JrIiB0eXBlIGJ1Z3MsIHRoYXQgc2VlbXMgbGlrZSBhIG5vbi1z
dGFydGVyLCBhbmQgbGlrZWx5IHRvIGNhdXNlIG1vcmUgY29uZnVzaW9uIHRoYW4gdGhlIGN1cnJl
bnQgc3RhdHVzIHF1by4gIElmIHNvbWVvbmUgb3IgZ3JvdXAgb2Ygc29tZW9uZXMgaXMgd2lsbGlu
ZyB0byBnbyBkbyB0aGUgd29yaywgSSB0aGluayBpdCdkIGJlIGEgZ3JlYXQgYmVuZWZpdCB0byB0
aGUgcHJvamVjdCwgYW5kIHNvbWV0aGluZyB0aGF0IHdvdWxkIGhlbHAgYSBsb3Qgb2YgcGVvcGxl
LiAgSSdtIGhhcHB5IHRvIHBpdGNoIGluIGFzIHdlbGwgd2hlcmUgSSdtIGFibGUuDQoNCltTaGFy
YWRdIA0KQWxsIHRoZSBpc3N1ZXMgKGFuZCBjb25zaWRlcmF0aW9ucyB0byByZXNvbHZlKSwgeW91
IGJyaW5nIHVwIGFyZSBncmVhdC4gSXQgd2lsbCBuZWVkIHBvbGljaWVzLCBkZWZpbml0aW9ucywg
YW5kIGNhdGVnb3JpemF0aW9ucyBhcyB5b3UgcG9pbnQgb3V0LiBJIHRoaW5rIGl0IHdpbGwgdGFr
ZSBxdWl0ZSBzb21lIHRpbWUgdG8gZ2V0IHRoZXJlIGFuZCBpdHMgdW5saWtlbHkgdGhhdCB3ZSB3
aWxsIGFjaGlldmUgcGVyZmVjdGlvbi4gU28gd2UgbWF5IGhhdmUgdG8gc3RhcnQgd2l0aCBiYXNp
YywgYWRkIGEgYnVuY2ggb2YgdGhpbmdzIHRvIG1ha2UgaXQgYSBtaW5pbXVtIEJNQyAoSSB0aGlu
ayB0aGUgZmlyc3Qgc3RlcCB3aWxsIGJlIGFncmVlIHdoYXQgdGhvc2UgbWluaW11bSBmZWF0dXJl
IHNldCBpcyksIGFuZCB0aGVuIGJlIGFibGUgdG8gYWRkIGZyb20gdGhlcmUuIEl0IG1heSBub3Qg
YmUgdmVyeSBncmFudWxhciAoYXMgdGhlcmUgd2lsbCBiZSBpbnRlcmRlcGVuZGVuY2llcyksIGJ1
dCBldmVuIGlmIHdlIGhhdmUgYSBmZXcgc3VjaCBjb25maWd1cmF0aW9ucy9jb21iaW5hdGlvbiBv
ZiBmZWF0dXJlIGl0IHdpbGwgYmUgdXNlZnVsIGZvciBzb21lb25lIHRvIHN0YXJ0IHdpdGguIEkg
cmVhbGl6ZSB0aGlzIGRvZXNu4oCZdCBzb2x2ZSB0aGUgcHJvYmxlbSBmdWxseSwgYnV0IEkgdGhp
bmsgaXQncyBtdWNoIGxlc3MgZWZmb3J0IGFuZCBoZW5jZSBlYXNpZXIgdG8gc3RhcnQgd2l0aC4N
Cg0KDQo=
