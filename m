Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BC426AF06
	for <lists+openbmc@lfdr.de>; Tue, 15 Sep 2020 22:59:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrbF71F2hzDqTR
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 06:59:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=sharad.khetan@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=n+3RXT3m; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrbDB2XVfzDqSw
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 06:58:09 +1000 (AEST)
IronPort-SDR: bamkWXXUwPlgO6shTTf6Y4KBaznVoCQEKI82F4qslbXG9CjZ28YDvNsy2M1H4H3F44ZM5qtHRU
 uzU6tmjuhoOg==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="147037952"
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="147037952"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 13:58:06 -0700
IronPort-SDR: VjLdcn+wS+/SJeC9W3+cbo9GaPs6Sr7fZd9lhmmVo6j5/WmUB40toBM3ufDGUjfMtjebLbm0VC
 3cB/lSMiRwpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,430,1592895600"; d="scan'208";a="331400025"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 15 Sep 2020 13:58:05 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 15 Sep 2020 13:58:05 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 15 Sep 2020 13:58:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 15 Sep 2020 13:58:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRGKtD0azCV1JKQvKABMOMR457iuhsPDbIgjw8EsLebUQcB/TdUhBO10RBfnxJ33rxXhzOKwFLqu5nHbrNeVCqJA+fuNv0IifumPa31qzieJi+5Plz3FmOuRGJhi06vXz0G6LmoNIQv4vwqj7GsHVvnMH9Ca0lUs9eFpaYGpkcloJYgCQ+tFRGeh13W5lf48uII2fT+rgzVwOYr4wMoBUO/oIpSaX6aBxbT/JASCFcE5NdlwNw8tRnIADegy5NMEn2qiS52HjougH3t4nfCCnNVLw6p1UyLfbAvLWNq3relu/PpADAvMgD9H6AucSd8GvShUgmeQ366q6kO4dOOPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4g9U9v1FRGBRdBq3axXii40dBQ6iSdvAv/UzzxMJAc=;
 b=MzNRZu3xM+03rpsahbImhC32HU3Z/GYtrSz4UTJfwBocagE05EQTc3rDdOHtuq1OQlqUyskeqcgbkbJtmCRetWrfsoBv3kFVyACCfmORE7UCy/VNCfSuTWEgFeuPvK1FuSKfWLZdF4Nfg8hKAmD177Evitr+WiLMkuVLxcGSopABQ1NrQGKpHXHK6GmgxigC9KReTv9WYn5CS56DOacGtdwjNSpKJT71/WIz273m7BzxARLIuzMWtCV5mSObEvMyap8LtZqpa8X2Fk4Xt5+YeqCv4/RHxb706lCX7JurTkVtlEoo2qdfpVOfAM359sq4xTNFtai0/5V6T7Hd+WJg3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4g9U9v1FRGBRdBq3axXii40dBQ6iSdvAv/UzzxMJAc=;
 b=n+3RXT3mw+C/vHOMNr+Bag1IMdB/CL3S/CvSR2zatpQPReu06kcidyOW/RDgI5I/esJeF+xdxES6n0jP4ZTIJYWyIStJRVoXXZqChEc3iBHBSpMYCxGCdnu2DoP5jcRzusjKwIvhBk8zSqfFT1BxT7t9jJl2O6nErHYYS8GNLgU=
Received: from MWHPR11MB0046.namprd11.prod.outlook.com (2603:10b6:301:67::30)
 by MWHPR11MB1629.namprd11.prod.outlook.com (2603:10b6:301:d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 15 Sep
 2020 20:58:00 +0000
Received: from MWHPR11MB0046.namprd11.prod.outlook.com
 ([fe80::6d7b:11d7:359a:dbfb]) by MWHPR11MB0046.namprd11.prod.outlook.com
 ([fe80::6d7b:11d7:359a:dbfb%7]) with mapi id 15.20.3370.017; Tue, 15 Sep 2020
 20:58:00 +0000
From: "Khetan, Sharad" <sharad.khetan@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: interest in a minimal image recipe
Thread-Topic: interest in a minimal image recipe
Thread-Index: AQHWi589ZL1TIJ3aQEmLrkPkZZNN0alqLD0A
Date: Tue, 15 Sep 2020 20:58:00 +0000
Message-ID: <MWHPR11MB00461129AA7BB38E7D2C80E1F1200@MWHPR11MB0046.namprd11.prod.outlook.com>
References: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
In-Reply-To: <20200915202832.rq3os62pdj7mzaco@thinkpad.fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none; lists.ozlabs.org; dmarc=none action=none header.from=intel.com; 
x-originating-ip: [104.153.203.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6a36fdb-faa1-4a4e-4bf3-08d859ba07f9
x-ms-traffictypediagnostic: MWHPR11MB1629:
x-microsoft-antispam-prvs: <MWHPR11MB16297C40F8684D21AF7FAFECF1200@MWHPR11MB1629.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a6s2HttG1eFud1uDs/svFZPtIWqUtiAqbiZl2iQ3nGgHPEqm/IP7JrE/UBHYqEzW8OlHqKqD1kPzu1cRMKu741gxUKu6Tq09rtT9XjWPmUi7vqYrh51FOFfAvX9tcsH3f3nMkSnalT8tCPHFegva66FK0AxmTw7zSuk26FdcHtw5HWL+UN4l2H+/z0hZL0I4RUnu51BBReFcUC5W8T3Mp5AnuJXDhBu6XWWnHGWaHju3i7g14bRp7IpKKlTtAwQrTcnw3FVahKnX9Qsf9CY+6vGPi6GLA9kSQJEJMxuJdLv1AwDJ54DHrhtqBHHnmAApQGsDDQaoIOClOo/ciX5U1RYwEWcjZDkvwZavfLlP47hL9/32wtLMVmm09SPnWVMeeNJKe8fmohvkkFMpNUqTqjefZomFg2JMclUvWHDDU11I0VTdwUyYAAnQz0YV/uIJgc7TvQZ8OpyRj7UumiLNaA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(186003)(66446008)(66946007)(66476007)(66556008)(86362001)(7696005)(64756008)(9686003)(76116006)(5660300002)(71200400001)(33656002)(6506007)(52536014)(55016002)(2906002)(8676002)(53546011)(478600001)(26005)(83380400001)(6916009)(316002)(8936002)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: xZTH7wWPaAKqxSlylb3GuGmuMzkxcF86XYEo06nfFgte1gogQMXahnWlH1YvjYCwmsEQzhPINMZGy4S99FDGcJndzEZYTmKGrGTpdGamnQKYOXKVplVLRzO9UP/aqJCKGEI7IbCM54D5Tys7/kz8wpyuu1U7OJ3WBeiZleGMgcHLD0cykcaTG0WVGjstnfytXXe2KNI6f/TWD/kjLHjRlyx1VaP4PKrAZMQloDG6TycEPRGCsSINfvJyeIgswk1g2j7r/z/Y37r3pPGvCU0p6P1O1D1r3pqGan4vAv3WqFosxw4O6cKGjQNhG/TR6JCeW3KrWO8EOLZtVvzmlHk04tGrIKdbfUZeT3P8BzjITb0KHNYS1uGH/mJHEgB5g6D8jeW7QkE7or2wsj0860lQwQTpyCk3z2K6wN0fjcfYq4pHc/EwvLAej/4g9QxDVQ6daieYV3qzDr3SpNkiZojX8zWtXilivgBOCJpjGALYTBH8PzzDA9J7qvJtFmbnjT4wzvE132ragxi8Yj1LVOsD8pi0X5279PETHClM7hexd4LnikbOKxjy9iuRw/VL/gbxeL7UntVLWJWaBgTfy6S1+X+6cHfEwJMIaQJHXgXTIyJyqb69NNAQHOiuEZj0kFeOQtg2nTnDStyfliad6+45NA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a36fdb-faa1-4a4e-4bf3-08d859ba07f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 20:58:00.3234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SOlT1NdiV5HIV/VzYzPo1h7Uh9cpAeWW4+6kBERNo5ShMWkHAHvAVgEJt9GTJbmQIYBr9XvzAUU471vfl224IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1629
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

SGkgQnJhZCwNCg0KKzENCg0KSSBsaWtlIHRoZSBpZGVhLiBXZSBoYXZlIGEgaW5jcmVhc2luZyBu
dW1iZXIgb2YgcmVwb3MgYW5kIGl0IHdpbGwgYmUgZ29vZCB0byBoYXZlIGEgbW9kZWwgd2hlcmUg
dXNlcnMgY2FuIHBpY2sgdGhlIGZlYXR1cmVzL3JlcG9zIHRoZXkgd2FudC4gSSBndWVzcyBpdCB3
aWxsIG1ha2UgT3BlbkJNQyBvZmZlciBhIG1pY3Jvc2VydmljZXMgbW9kZWwg8J+Yii4gVGhlIGNo
YWxsZW5nZSB3aWxsIG9mIGNvdXJzZSBiZSBmaW5kaW5nIHRoYXQgcmlnaHQgYmFzZSAvIG1pbmlt
dW0gY29uZmlndXJhdGlvbi4gVGhhdCBtYXkgY2hhbmdlIGRlcGVuZGluZyBvbiBkZXZpY2UsIHVz
YWdlLCBhcmNoaXRlY3R1cmUuDQpJdOKAmXMgYSBnb29kIGlkZWEgdG8gc3RhcnQgd2l0aCB0aGUg
ZW1wdHkgbGlzdCBhbmQgYWRkIGZyb20gdGhlcmUuDQoNClRoYW5rcywNCi1TaGFyYWQNCg0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2Vz
K3NoYXJhZC5raGV0YW49aW50ZWwuY29tQGxpc3RzLm96bGFicy5vcmc+IE9uIEJlaGFsZiBPZiBC
cmFkIEJpc2hvcA0KU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDE1LCAyMDIwIDE6MjkgUE0NClRv
OiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IGludGVyZXN0IGluIGEgbWluaW1h
bCBpbWFnZSByZWNpcGUNCg0KSSd2ZSBoZWFyZCBhIGhhbmRmdWwgb2YgdGltZXMgdGhhdCBtZXRh
LXBob3NwaG9yIHVzZXJzIG9mdGVuIGhhdmUgdG8gcmVtb3ZlIHRoZSBsYXRlc3QgZmVhdHVyZSBh
ZGRlZCBieSBkZWZhdWx0IHRvIG9ibWMtcGhvc3Bob3ItaW1hZ2UuDQoNCkkgaGF2ZSBhbiBSRkMg
Zm9yIGFuIGVtcHR5IGltYWdlIHRoYXQgdGhlc2UgdXNlcnMgY291bGQgYmJhcHBlbmQgYW5kIG9w
dC1pbiB0byBzcGVjaWZpYyBpbWFnZSBmZWF0dXJlcyBpbnN0ZWFkIG9mIGhhdmluZyB0byByZXBl
YXRlZGx5IG9wdC1vdXQuDQoNCklmIHlvdSBsaWtlIHRoZSBvcHQtaW4gYXBwcm9hY2gsIHBsZWFz
ZSBkcm9wIGEgKzEgYW5kL29yIHJldmlldyBteSBwYXRjaDoNCg0KaHR0cHM6Ly9nZXJyaXQub3Bl
bmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMvbWV0YS1waG9zcGhvci8rLzM2NTE2DQoNCkkgYnJp
bmcgdGhpcyB1cCBub3cgYmVjYXVzZSBJLCBhbmQgb3RoZXJzIGhhdmUgYmVlbiBhZGRpbmcgbmV3
IGltYWdlIGZlYXR1cmVzIHRvIG9ibWMtcGhvc3Bob3ItaW1hZ2UgKGUuZy4gdHVybmVkIG9uIGJ5
IGRlZmF1bHQpLCBhbmQgSSB3b3VsZCBsaWtlIHRvIHN0YXJ0IGEgZGlzY3Vzc2lvbiBhYm91dCB3
aGF0IGl0IG1lYW5zIGZvciBhbiBhcHBsaWNhdGlvbiB0byBiZSBpbiB0aGUgT3BlbkJNQyBnaXRo
dWIgb3JnYW5pemF0aW9uLiAgSSB3b3VsZCBwcm9wb3NlIHRoYXQgaXQgbWVhbnMgaXQgaXMgZW5h
YmxlZCBhbmQgdHVybmVkIG9uIGJ5IGRlZmF1bHQgaW4gb2JtYy1waG9zcGhvci1pbWFnZS4NCg0K
TG9va2luZyBmb3J3YXJkIHRvIHlvdXIgdGhvdWdodHMuDQoNCi1icmFkDQo=
