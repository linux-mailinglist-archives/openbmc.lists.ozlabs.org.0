Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26778298DAE
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 14:21:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKb880KS1zDqKb
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 00:21:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=H0y67U5C; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKb6L5sl1zDqHR
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 00:19:45 +1100 (AEDT)
IronPort-SDR: NxqUROFk1M6MURS5sLg31f3K7p/hyB0BkD3+V3Lq7d4qkRloEtlsVFfizczgLMA3Mdl4umBdqW
 GA+FCDHrmt4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9785"; a="168017837"
X-IronPort-AV: E=Sophos;i="5.77,419,1596524400"; d="scan'208";a="168017837"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 06:19:39 -0700
IronPort-SDR: SKmhO2N0MFyXDkuj8OmayVDBAgv/+4jJQBKZJn+yxvINr4l9stlxTvFStjZQUd4NhF8VkzEIEd
 GdZx2mwTur2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,419,1596524400"; d="scan'208";a="524278354"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 26 Oct 2020 06:19:38 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 06:19:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Oct 2020 06:19:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Oct 2020 06:19:38 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 26 Oct 2020 06:19:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6GcTq1ONp1UQGA4bYvQ3GA3sQOMQHtIv5oWn6MuzNC3ECbL1klLWL8IY8DCUx/8ZqPJUbtLLH0wAgsjLZ2g97gTw05gGQleL16uzKi3lcm3E6KkUXA6sy6P+rFyGgy4y8eEONaMMKpXuBIsNgRKBLbbXWi5EG3VmsrVP++Toh7lBEQLHBTDODAGxAW6KaeY4Z0jadNHO+b2e+GnlFunYOol61mFrzNs1KExPpNtzmyicpw4/uQGNySwG7pHwR0BAQduLJW/FSvFc1TKdgVEDhiB2VTvz3QlMEmJFz216HyHFRxJ06bMHro/wj8Ohaj8flDY8Bb/W96xCQx52Aen6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmRYknWLRF5ulKzLfjIENmOxPPjLzxH/2j5T+gJw0kY=;
 b=n/CJEy9M0lhL9miES7RPdK/ttNgUjvZcIL2W9ZPfxQ/taSqc7FKvC/qBifFvM/DSkmeQ0EQNDXL2PSmxVkmzRns1MedwY/I/FoJ2XBbEJXYdcP+7UtzRI3iM1C0R115PzdTTBeifdS+PcRjyWpxmclpHUcpQjWrctd45pXQCgmmHyJW2OJW4rlnc5MjltQqhzI63Q1QgIEulP5RjjzqhC8Eu3/KlD676h6Gu1xtHFm/rRpiez5b05Gn6g30s5u2xtV3N7tFNf5Sl5IVYkCeklGvJENFnbRhi/qKq5dJi6vs5xh1SllTGbWOO7oPYkNPB6XoKuJi/eaaqxC0ngU5Efg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmRYknWLRF5ulKzLfjIENmOxPPjLzxH/2j5T+gJw0kY=;
 b=H0y67U5CVULF1aTcuwyIThkSOlJGtPO1R/p+Ts5J30JrpuYDAfCSJyYhVKzZkQ7khc8xHDnxfspx/FRPN2FajApGMUBAiQSC97LyKZYe0MqRexNobyMShm6CN/04d7q5GhYiDxO+2khYoRVFYuNR/Pfunv2rfsTSa67bAAPhwLo=
Received: from CY4PR1101MB2311.namprd11.prod.outlook.com
 (2603:10b6:910:23::12) by CY4PR11MB1783.namprd11.prod.outlook.com
 (2603:10b6:903:11d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.25; Mon, 26 Oct
 2020 13:19:15 +0000
Received: from CY4PR1101MB2311.namprd11.prod.outlook.com
 ([fe80::b80c:51c9:a630:f326]) by CY4PR1101MB2311.namprd11.prod.outlook.com
 ([fe80::b80c:51c9:a630:f326%3]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 13:19:15 +0000
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: Andrew Geissler <geissonator@gmail.com>, Patrick Williams
 <patrick@stwcx.xyz>
Subject: RE: Critical BMC process failure recovery
Thread-Topic: Critical BMC process failure recovery
Thread-Index: AQHWplHuOQyjsXC0KEWSUKeN7niBrKmgjf8AgAM+OACABhuXwA==
Date: Mon, 26 Oct 2020 13:19:14 +0000
Message-ID: <CY4PR1101MB2311ABDFBA0EA222BB602B7686190@CY4PR1101MB2311.namprd11.prod.outlook.com>
References: <C270F145-2236-4CA1-8D57-A63AB622A47C@gmail.com>
 <20201020142846.GB5030@patrickw3-mbp.lan.stwcx.xyz>
 <A7171080-B143-42AD-B235-951A06B247A4@gmail.com>
In-Reply-To: <A7171080-B143-42AD-B235-951A06B247A4@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: request-justification,no-action
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [91.232.46.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1cfbdf9-b0a0-4d21-2be8-08d879b1bc6d
x-ms-traffictypediagnostic: CY4PR11MB1783:
x-microsoft-antispam-prvs: <CY4PR11MB1783B6069C5EEE1D4E303C7286190@CY4PR11MB1783.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n5GHDTSfnzzFNQs70w8DA1gllpjDoINWo7luOicWrWCSuqfhdgyH4UubstSFREcUicmKISk2yu2AAxeNAThpYOHveypB9KRuMe04ngSx+qr0gbOd/6nqSp5Wg3CxF+5vgO/iiQD40bRQ5A26+VAdwQskSJ9Af08GQeOaONIcgsbkupZd9VYNNp09mC9Mls/U+Po1D1NGsKTP7c04fowGHamThcqLARDBylQqYSWIKbIWzBuY4/9FQOBB6e8gYgV3gNTfGXnh170zEK3KPl/yANOTfCwLB2RzKya8xtCY7brLYlDC4YHCP8eyTkTzRtE+RcDHFeZMOnvJc8xdCjqODw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1101MB2311.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(53546011)(316002)(6506007)(110136005)(2906002)(8676002)(55016002)(4326008)(26005)(7696005)(71200400001)(33656002)(66556008)(5660300002)(64756008)(83380400001)(52536014)(478600001)(86362001)(186003)(9686003)(8936002)(66476007)(76116006)(66946007)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 9UAbDyixrLbuIOn2ehCv6XFz26RYEIdF707RB4E99/KXYLXj4YaDjZ4fUQegyGgM9cKZxuGNMxhUHSOCGm8SuUczxcmhkzjEjwqcA8JDDr5NrX8UCPO11GoOhJoYIzyAqGxRSvFPhNVfmNMqpBYWjyBtZrg7qxfvkOCq7srD/WelR7mIrywVDtNyHpzPEAxneZOQyTZjyG34egJGo1xr+dbIZVvNqfhvXI9wvzp5mLwvBY0oMWRk7/6uUogI5thy30/GwK6wtwY9uLVS9grJBHJVMfQ1rABQDS5WBEZ0HDM/rEmf989T7GTSJcMS/peJ/dD5g8eK6HBBbly/ZuVAdFYiGXeN6GlYOqUnCjqiV2d+DXjciyWcFmEHX1E/k5OYlpD4R6Rc5YKCHD4zP6nngPbdRgBlTXj+xfmUHxYmOh89dyWhD/aE8NWzgrU2RvikpSLo16eDui2vuayFDZcmhv1z7CZ0SO7zTKQlyOE5su4b2w4h8OtTbncMwH7HkxhgtAqvoafyuqHjiNy5YAe6MR6rLRUFMJeCGo33EUPWJZCmvjaF+bVEmlQplU++ZmgpLWopxiCqnsiCLhV0PbWUEtzMz8YBSz12wxBC/2xvj/bPDeA0T3bxAj1WyWWVAdpst5ZVk0bxGTJmNit9hvj36A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2311.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1cfbdf9-b0a0-4d21-2be8-08d879b1bc6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 13:19:14.9319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rlAAtVAc4T615C+WwN9kEbQ5no5MmnLKBymKd2pj0z4Y/E0WWQiBy38sl6nkUaukSZtbmhUZiiiyfPCPiErWsH9U8PWvkuRik3dYKHr2CSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1783
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

SGksIEl0J3MgcXVpdGUgaW50ZXJlc3RpbmcgZGlzY3Vzc2lvbi4gSGF2ZSB5b3UgY29uc2lkZXJl
ZCBzb21lIGtpbmQgb2YgbWluaW1hbCBzZXQgb2YgZmVhdHVyZXMgcmVjb3ZlcnkgaW1hZ2UsIHRv
IHdoaWNoIEJNQyBjYW4gc3dpdGNoIGFmdGVyIE4gcmVzZXRzIGR1cmluZyBkZWZpbmVkIGFtb3Vu
dCBvZiB0aW1lPyBTdWNoIGltYWdlIGNvdWxkIGhvbGQgZXJyb3IgbG9nIGFuZCBzZW5kIHBlcmlv
ZGljIGV2ZW50IGFib3V0IEJNQyBmYWlsdXJlLiANCg0KUGlvdHIgTWF0dXN6Y3phaw0KLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQpJbnRlbCBUZWNobm9sb2d5IFBvbGFuZCBzcC4geiBvLm8uIA0KdWwuIFNsb3dhY2tp
ZWdvIDE3MywgODAtMjk4IEdkYW5zaw0KS1JTIDEwMTg4Mg0KTklQIDk1Ny0wNy01Mi0zMTYNCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNl
cytwaW90ci5tYXR1c3pjemFrPWludGVsLmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYg
T2YgQW5kcmV3IEdlaXNzbGVyDQpTZW50OiBUaHVyc2RheSwgT2N0b2JlciAyMiwgMjAyMCA2OjAw
IFBNDQpUbzogUGF0cmljayBXaWxsaWFtcyA8cGF0cmlja0BzdHdjeC54eXo+DQpDYzogT3BlbkJN
QyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogUmU6IENyaXRp
Y2FsIEJNQyBwcm9jZXNzIGZhaWx1cmUgcmVjb3ZlcnkNCg0KDQoNCj4gT24gT2N0IDIwLCAyMDIw
LCBhdCA5OjI4IEFNLCBQYXRyaWNrIFdpbGxpYW1zIDxwYXRyaWNrQHN0d2N4Lnh5ej4gd3JvdGU6
DQo+IA0KPiBIaSBBbmRyZXcsDQo+IA0KPiBJIGxpa2UgdGhlIHByb3Bvc2FsIHRvIHJldXNlIHdo
YXQgc3lzdGVtZCBhbHJlYWR5IHByb3ZpZGVzLiAgSXQgZG9lcyANCj4gbG9vayBsaWtlIExlaSBw
b2ludGVkIHRvIHNvbWUgZXhpc3RpbmcgYmJjbGFzcyB0aGF0IGNvdWxkIGJlIGVuaGFuY2VkIA0K
PiBmb3IgdGhpcyBwdXJwb3NlIHNvIHRoYXQgYW55IHJlY2lwZSBjYW4gc2ltcGx5ICdpbmhlcml0
IC4uLicgYW5kIG1heWJlIA0KPiBzZXQgYSB2YXJpYWJsZSB0byBpbmRpY2F0ZSB0aGF0IGl0IGlz
IHByb3ZpZGluZyAiY3JpdGljYWwgc2VydmljZXPigJ0uDQoNClllYWgsIGxvb2tzIGxpa2UgY3Vy
cmVudGx5IGl0IG9wdHMgaW4gZXZlcnkgc2VydmljZSAoZXhjZXB0IGZvciBhIGZldyBzcGVjaWFs
IGNhc2VzKS4gSSBsaWtlIHRoZSBpZGVhIG9mIHB1dHRpbmcgaXQgb24gdGhlIGluZGl2aWR1YWwg
c2VydmljZSB0byBvcHQgaXRzZWxmIGluLiBJ4oCZdmUgZGVmIHNlZW4gd2hhdCBKYW1lcyBtZW50
aW9ucyBpbiBoaXMgcmVzcG9uc2Ugd2hlcmUgeW91IGdldCBpbiBzaXR1YXRpb25zIHdoZXJlIHRo
ZSBCTUMgaXMgcmVib290aW5nIGl0c2VsZiB0b28gbXVjaCBkdWUgdG8gbm9uLWNyaXRpY2FsIHNl
cnZpY2VzIGZhaWxpbmcuDQoNCj4gDQo+IE9uIE1vbiwgT2N0IDE5LCAyMDIwIGF0IDAyOjUzOjEx
UE0gLTA1MDAsIEFuZHJldyBHZWlzc2xlciB3cm90ZToNCj4+IEdyZWV0aW5ncywNCj4+IA0KPj4g
SSd2ZSBzdGFydGVkIGluaXRpYWwgaW52ZXN0aWdhdGlvbiBpbnRvIHR3byBJQk0gcmVxdWlyZW1l
bnRzOg0KPj4gDQo+PiAtIFJlYm9vdCB0aGUgQk1DIGlmIGEgImNyaXRpY2FsIiBwcm9jZXNzIGZh
aWxzIGFuZCBjYW4gbm90IHJlY292ZXINCj4+IC0gTGltaXQgdGhlIGFtb3VudCBvZiB0aW1lcyB0
aGUgQk1DIHJlYm9vdHMgZm9yIHJlY292ZXJ5DQo+PiAgLSBMaW1pdCBzaG91bGQgYmUgY29uZmln
dXJhYmxlLCBpLmUuIDMgcmVzZXRzIHdpdGhpbiA1IG1pbnV0ZXMNCj4gDQo+IEkgbGlrZSB0aGF0
IGl0IGhhcyBhIHRpbWUgYm91bmQgb24gaXQgaGVyZS4gIElmIHRoZSByZXNldCBkaWRuJ3QgaGF2
ZSANCj4gYSB0aW1lIGJvdW5kIHRoYXQgd291bGQgYmUgYSBwcm9ibGVtIHRvIG1lIGJlY2F1c2Ug
aXQgbWVhbnMgdGhhdCBhIA0KPiBzbG93IG1lbW9yeSBsZWFrIGNvdWxkIGV2ZW50dWFsbHkgZ2V0
IHRoZSBCTUNzIGludG8gdGhpcyBzdGF0ZS4NCj4gDQo+IERvIHlvdSBuZWVkIHRvIGRvIGFueXRo
aW5nIGluIHJlbGF0aW9uc2hpcCB3aXRoIHRoZSBXRFQgYW5kIGZhaWxvdmVyIA0KPiBzZXR0aW5n
cyB0aGVyZT8gIEknbSB0aGlua2luZyB5b3UnbGwgbmVlZCB0byBkbyBzb21ldGhpbmcgdG8gZW5z
dXJlIA0KPiB0aGF0IHlvdSBkb24ndCBzd2FwIGZsYXNoIGJhbmtzIGJldHdlZW4gdGhlc2UgcmVz
ZXRzLiAgRG8geW91IG5lZWQgdG8gDQo+IGRvIE4gcmVzZXRzIG9uIG9uZSBmbGFzaCBiYW5rIGFu
ZCB0aGVuIE0gb24gdGhlIG90aGVyPw0KDQpJ4oCZbSBob3BpbmcgdG8ga2VlcCB0aGUgZmxhc2gg
YmFuayBzd2l0Y2ggYSBzZXBhcmF0ZSBkaXNjdXNzaW9uLiBUaGUga2V5IGhlcmUgaXMgdG8gbm90
IGltcGFjdCB3aGF0ZXZlciBkZXNpZ24gZGVjaXNpb24gaXMgbWFkZSB0aGVyZS4NCg0KV2XigJly
ZSBzdGlsbCBnb2luZyBiYWNrIGFuZCBmb3J0aCBhIGJpdCBvbiB3aGV0aGVyIHdlIHdhbnQgdG8g
Y29udGludWUgd2l0aCB0aGF0IGF1dG9tYXRpYyBmbGFzaCBiYW5rIHN3aXRjaCBkZXNpZ24gcG9p
bnQuIEl0IHNvbWV0aW1lcyBjYXVzZXMgbW9yZSBjb25mdXNpb24gdGhhbiBpdOKAmXMgd29ydGgu
DQoNCkkga25vdyB3ZSBkaWQgbWFrZSB0aGlzIHdvcmsgd2l0aCBvdXIgV2l0aGVyc3Bvb24gc3lz
dGVtIGZyb20gYSB3YXRjaGRvZyBwZXJzcGVjdGl2ZS4gV2Ugd291bGQgcmVib290IGEgY2VydGFp
biBhbW91bnQgb2YgdGltZXMgYW5kIHN3YXAgZmxhc2ggYmFua3MgYWZ0ZXIgYSBjZXJ0YWluIGxp
bWl0IHdhcyByZWFjaGVkLiBJ4oCZbSBub3Qgc3VyZSBob3cgd2UgZGlkIGl0IHRob3VnaCA6KQ0K
DQo+IA0KPiBJdCBzZWVtcyB0aGF0IHRoZSBtb3N0IGxpa2VseSBjYXVzZSBvZiBOIHJlc2V0cyBp
biBhIHNob3J0IHRpbWUgaXMgDQo+IHNvbWUgc29ydCBvZiBmbGFzaCBjb3JydXB0aW9uLCBCTUMg
Y2hpcCBlcnJvciwgb3IgYSBidWcgYWdncmF2YXRlZCANCj4gc29tZSBSV0ZTIHNldHRpbmcuICBO
b25lIG9mIHRoZXNlIGFyZSBwYXJ0aWN1bGFybHkgcmVjb3ZlcmVkIGJ5IHRoZSANCj4gcmVzZXQg
YnV0IGF0IGxlYXN0IHlvdSBrbm93IHlvdXIgaW4gYSBiYWQgc2l0dWF0aW9uIGF0IHRoYXQgcG9p
bnQuDQoNClllYWgsIEkgd291bGQgcmVhbGx5IGxpa2Ugc29tZSBkYXRhIG9uIGhvdyBvZnRlbiBh
IHJlYm9vdCBvZiB0aGUgQk1DIHJlYWxseSBkb2VzIGZpeCBhbiBpc3N1ZS4gVGhlIGZvY3VzIGZv
ciB1cyBzaG91bGQgZGVmIGJlIG9uIGF2b2lkaW5nIHRoZSByZWJvb3QgaW4gdGhlIGZpcnN0IHBs
YWNlLiBCdXQgdGhlIHJlYm9vdCBpcyBvdXIgbGFzdCBkaXRjaCBlZmZvcnQuDQoNCj4gDQo+PiAg
LSBJZiBsaW1pdCByZWFjaGVkLCBkaXNwbGF5IGVycm9yIHRvIHBhbmVsIChpZiBvbmUgYXZhaWxh
YmxlKSBhbmQgaGFsdA0KPj4gICAgdGhlIEJNQy4NCj4gDQo+IEFuZCB0aGVuIHdoYXQ/ICBXaGF0
IGlzIHRoZSByZW1lZGlhdGlvbiBmb3IgdGhpcyBjb25kaXRpb24/ICBBcmUgdGhlcmUgDQo+IGFu
eSBzZXJ2aWNlcywgc3VjaCBhcyBTU0gsIHRoYXQgd2lsbCBjb250aW51ZSB0byBydW4gaW4gdGhp
cyBzdGF0ZT8gIEkgDQo+IGhvcGUgdGhlIG9ubHkgYW5zd2VyIGZvciByZW1lZGlhdGlvbiBpcyBw
aHlzaWNhbCBhY2Nlc3MgLyBwb3dlciBjeWNsZS4NCg0KSSBiZWxpZXZlIHRoZSBiZXN0IG9wdGlv
biAoYW5kIHdoYXQgd2XigJl2ZSBkb25lIGhpc3RvcmljYWxseSkgaXMgdG8gdHJ5IGFuZCBwdXQg
YW4gZXJyb3IgY29kZSBvbiB0aGUgcGFuZWwgYW5kIGhhbHQgaW4gdS1ib290LCByZXF1aXJpbmcg
cGh5c2ljYWwgYWNjZXNzIC8gcG93ZXIgY3ljbGUgdG8gcmVjb3Zlci4NCg0KPiANCj4gLS0NCj4g
UGF0cmljayBXaWxsaWFtcw0KDQo=
