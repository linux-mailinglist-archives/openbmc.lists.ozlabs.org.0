Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E1813A0C9
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 06:55:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xfnq20yczDqN5
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2020 16:55:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=sharad.khetan@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xfmv2y92zDqJt
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jan 2020 16:54:53 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 21:54:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,431,1571727600"; d="scan'208";a="217634515"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga008.jf.intel.com with ESMTP; 13 Jan 2020 21:54:50 -0800
Received: from fmsmsx116.amr.corp.intel.com (10.18.116.20) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 13 Jan 2020 21:54:50 -0800
Received: from fmsmsx118.amr.corp.intel.com ([169.254.1.58]) by
 fmsmsx116.amr.corp.intel.com ([169.254.2.67]) with mapi id 14.03.0439.000;
 Mon, 13 Jan 2020 21:54:50 -0800
From: "Khetan, Sharad" <sharad.khetan@intel.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, Andrew Jeffery
 <andrew@aj.id.au>, Vijay Khemka <vijaykhemka@fb.com>, rgrs
 <rgrs@protonmail.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: MCTP over PCI on AST2500
Thread-Topic: MCTP over PCI on AST2500
Thread-Index: AQHVn2VSe/daZ1HR/0SJwnpAq7UT7qeUJeQA//96gqCAA0FRAIAtBQZQgB6Aw4CAAXo0gIAFPlBAgACtGYCAADAAwA==
Date: Tue, 14 Jan 2020 05:54:49 +0000
Message-ID: <865C376D1B77624AAA570EFEF73CE52F9E10E9A5@fmsmsx118.amr.corp.intel.com>
References: <gqnvvFdbRiXJzS3sVr0pSSo8kD6KjPbFMgg8CV1tsi0cKt0zT5mrnSTfBB1cpiOt-MVrXNzlg95DqgWZ3AxD8zOyEbFYRykqjP-DxEW4Mww=@protonmail.com>
 <037D4669-D49C-4DF8-B49B-4F3BD97451AE@fb.com>
 <865C376D1B77624AAA570EFEF73CE52F9E08757B@fmsmsx118.amr.corp.intel.com>
 <3502e928-40c5-41d9-9ff1-5aa199e0e31b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E0E4E3E@fmsmsx118.amr.corp.intel.com>
 <8a1fc80f-9d25-4c38-bdcd-df05c4194fe7@www.fastmail.com>
 <62036de3-ce3d-4ccb-ac5b-15e9ba39d22b@www.fastmail.com>
 <865C376D1B77624AAA570EFEF73CE52F9E10C8FD@fmsmsx118.amr.corp.intel.com>
 <92f857cc-303a-0d50-e0e4-2de2a8d19e41@linux.vnet.ibm.com>
In-Reply-To: <92f857cc-303a-0d50-e0e4-2de2a8d19e41@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.107]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: "Bhat, Sumanth" <sumanth.bhat@intel.com>, "Winiarska,
 Iwona" <iwona.winiarska@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgRGVlcGFrLA0KDQpPbiAxMy8wMS8yMCAxMDoyMyBQTSwgS2hldGFuLCBTaGFyYWQgd3JvdGU6
DQo+IEhpIEFuZHJldywNCj4gDQo+IE9uIFRodSwgOSBKYW4gMjAyMCwgYXQgMTI6MjcsIEFuZHJl
dyBKZWZmZXJ5IHdyb3RlOg0KPj4NCj4+DQo+PiBPbiBTYXQsIDIxIERlYyAyMDE5LCBhdCAxMDo0
NSwgS2hldGFuLCBTaGFyYWQgd3JvdGU6DQo+Pj4gSGkgQW5kcmV3LA0KPj4+IFNvcnJ5IGZvciBs
YXRlIHJlc3BvbnNlLg0KPj4+IFRoZSBwbGFuIGlzIHRvIGhhdmUgTUNUUCBpbiB1c2VyIHNwYWNl
Lg0KPj4+DQo+Pg0KPj4gSG93IGFyZSB5b3UgaGFuZGxpbmcgdGhpcyB0aGVuPyBtbWFwKCknaW5n
IHRoZSBCQVIgZnJvbSBzeXNmcz8NCj4gDQo+PiBTb3JyeSwgbGV0IG1lIHB1dCBteSBicmFpbiBi
YWNrIGluLCBJIHdhcyB0aGlua2luZyBvZiB0aGUgd3Jvbmcgc2lkZSBvZiB0aGUgIEJNQy9Ib3N0
IE1DVFAgY2hhbm5lbC4gSG93IG11Y2ggd2VyZSB5b3UgcGxhbm5pbmcgdG8gZG8gaW4gdXNlcnNw
YWNlIG9uIHRoZSBCTUM/IEFzIGluLCBhcmUgeW91IHBsYW5uaW5nIHRvIGRyaXZlIHRoZSBCTUMn
cyBQQ0llIE1DVFAgY29udHJvbGxlciBmcm9tIHVzZXJzcGFjZSAocHJlc3VtYWJseSB2aWEgL2Rl
di9tZW0pPw0KPiANCj4gICANCj4gRm9yIGltcGxlbWVudGF0aW9uIG9uIHRoZSBCTUMsIHdlIGFn
cmVlIHRoYXQgaXQncyBiZXR0ZXIgdG8gZG8gaXQgaW4ga2VybmVsIChhbmQgYXMgeW91IG1lbnRp
b25lZCAgLSB1c2UgY29uc2lzdGVudCBpbnRlcmZhY2UgdG8gdXBwZXIgbGF5ZXJzLCBwcm92aWRl
IGFub3RoZXIgdHJhbnNwb3J0KS4gSG93ZXZlciwgZ2l2ZW4gdGhlIHRpbWUgbmVlZGVkIHRvIGlt
cGxlbWVudCB0aGluZ3MgaW4ga2VybmVsIChhbmQgdGhlIHJldmlldyBhZnRlciksIHdlIGFyZSBz
dGFydGluZyB3aXRoIGEgc2hvcnQgdGVybSBzb2x1dGlvbi4gV2Ugd2lsbCBiZSBpbXBsZW1lbnRp
bmcgTUNUUCAocHJvdG9jb2wgZWxlbWVudHMpIGluIHVzZXIgc3BhY2UsIGFsb25nIHdpdGggYSBs
b3cgbGV2ZWwgTUNUUCBQQ0llIGRyaXZlciBqdXN0IHRvIHB1c2ggYml0cyBvbiBQQ0llLiBJd29u
YSBpcyB3b3JraW5nIG9uIHRoaXMgYW5kIHNob3VsZCBiZSBhYmxlIHRvIGRlc2NyaWJlIHRoZSBl
eGFjdCBwcmltaXRpdmUuDQoNCkRvIHlvdSBwbGFuIHRvIGRvIHRoZSB1c2VyLXNwYWNlIHdvcmsg
YXMgYW4gZXh0ZW5zaW9uIHRvL3JldXNpbmcgY29tcG9uZW50cyBmcm9tIG9wZW5ibWMvbGlibWN0
cD8NCg0KVGhhbmtzLA0KRGVlcGFrDQoNClllcyB3ZSBwbGFuIHRvIHJldXNlIGFuZCBleHRlbmQg
dGhlIGxpYm1jdHAsIHN1cHBvcnQgUENJZSBhcyB3ZWxsIGFzIFNNQnVzIGJpbmRpbmdzLiBXZSBw
bGFuIHRvIHVzZSBkLWJ1cyBleHRlbnNpb25zIHRvIGV4aXN0aW5nIGxpYm1jdHAuIFRoYXQgc2Fp
ZCwgd2Ugd2lsbCBrbm93IHRoZSBleGFjdCBleHRlbnQgb2YgcmV1c2UvbW9kaWZpY2F0aW9ucyB3
aGVuIHdlIHJlYWxseSBzdGFydCBpbXBsZW1lbnRpbmcuDQoNCldlIGFyZSBpbXBsZW1lbnRpbmcg
dGhpcyBmb3IgQVNUIDI2MDAgKHdpbGwgbm90IHN1cHBvcnQgYW55IHdvcmthcm91bmRzIGZvciBB
U1QgMjUwMCBidWcpLiANCg0KQEFuZHJldywgVGhhbmtzIGZvciB5b3VyIHJlc3BvbnNlLg0KDQpU
aGFua3MsDQpTaGFyYWQNCiANCg==
