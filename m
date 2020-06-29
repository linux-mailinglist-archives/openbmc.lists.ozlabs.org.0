Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E638120D27A
	for <lists+openbmc@lfdr.de>; Mon, 29 Jun 2020 20:51:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wc5t2v7xzDqYK
	for <lists+openbmc@lfdr.de>; Tue, 30 Jun 2020 04:51:30 +1000 (AEST)
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
 header.b=tc+kj7Zr; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wc4H35xTzDqVB
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jun 2020 04:49:59 +1000 (AEST)
IronPort-SDR: ZQNmxp9ud9x/n7mi4E4ecCIbXj9YR1H+sz6SlKXyFrL3AK2bV8L5i8EMDd3BRst/BHiYLNGmxU
 fOGgUTx8pF2Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="134346012"
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; d="scan'208";a="134346012"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 11:49:55 -0700
IronPort-SDR: VRM+dyg01nHKz/GggRITUQ4Tdrn2aBYbqgdUek2a55D2AJbnqLVN1IMbjEPR82qILeX4s4OdvJ
 xDib7/2Poo5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,295,1589266800"; d="scan'208";a="355540177"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
 by orsmga001.jf.intel.com with ESMTP; 29 Jun 2020 11:49:55 -0700
Received: from ORSEDG002.ED.cps.intel.com (10.7.248.5) by
 ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 29 Jun 2020 11:49:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.101) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 29 Jun 2020 11:49:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=br8VFkGMo3aLZxNJhXyjd9cGt9Anx1h1CAUfY/lX+fjTiaf/DO3YvAcycD+1ezuT1u9n6ojAcx4hK6A+ZwARbgUTaMChdHGcg2lWmrdujSD19OVjrOfRK0HLvRPzfCAQS1GXhszNwhnOuKTY7oCiYkl/dMhsNe/CTjojxkF3NWFtfZIitvAC+RsSz5v6bm48OgovoAyqk0o6ac3Q7wT0KIYyuCo9PSroqxuIHoOlf/w/xjJkUgaRki4SKLgfFwMt7N+QFDVI2xfGRWnlhrGl9rqp2g/hKnSB5tYnWwN5cEs73sI4j2Ctv7VS85HzwZP/T7zZfWrcOI7U18zA2eqfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkCatdIKLknBEWtj/pL1CjeswHuhnehHdiWfBdbJsKs=;
 b=mkO6YR/+pf0Rmb8RwuYvZRFfLhOTAPiv4NMMZcDjPKISNebnQzAs6X3RuIbt1vyWf8ELs1x4cZxseQnmODO87ZxR74Ps5i9iMxPet3fr/UVr+H+MozkUhLlwSDjkaakqcSI8wGrPrAoRPFWs2N5C/sEBBcpbjiyJfhSEIGol3EjXbfLd0/a0rcFN+74I0ncHSXvRQ0Hb2piIzDGcjnkNCjnq4s9AaW0zje9rbV08KvmkXW6yC5eDBiLeQvZNV2i1WI2OosTylf5wCGKGO7JsVUZZlm+467EIpb2Agz1odwp1LWjszcXi7XzogH9KhTEi7MCisjvAo1cNxk0uT/D35A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkCatdIKLknBEWtj/pL1CjeswHuhnehHdiWfBdbJsKs=;
 b=tc+kj7ZrBy/P6AWIQ3THyLa2Sl0BVBYcwA+d/0yE1o0vncHkfYCqFujXIQBvAFtjD73OmYXOLSg2VOCmuB2BDdxjSkallIuZzMHcnvtwqctoBErUtYP7FCOoHEpjU9WpitukceAk0u8V76Cx9V0URoqIWjoIHENbce1DbM7pGok=
Received: from MWHPR11MB1389.namprd11.prod.outlook.com (2603:10b6:300:26::12)
 by MWHPR11MB1967.namprd11.prod.outlook.com (2603:10b6:300:111::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Mon, 29 Jun
 2020 18:49:53 +0000
Received: from MWHPR11MB1389.namprd11.prod.outlook.com
 ([fe80::fdc4:4d6e:c4f7:b3d7]) by MWHPR11MB1389.namprd11.prod.outlook.com
 ([fe80::fdc4:4d6e:c4f7:b3d7%11]) with mapi id 15.20.3131.027; Mon, 29 Jun
 2020 18:49:53 +0000
From: "Khetan, Sharad" <sharad.khetan@intel.com>
To: krtaylor <kurt.r.taylor@gmail.com>, "Matuszczak, Piotr"
 <piotr.matuszczak@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: OpenBMC health statistics
Thread-Topic: OpenBMC health statistics
Thread-Index: AdZOLPWDDv1xqlasSdaTVfH5fJhasAAEUDIAAAHHnRA=
Date: Mon, 29 Jun 2020 18:49:53 +0000
Message-ID: <MWHPR11MB13899C8D065A07EE2A2F31BCF16E0@MWHPR11MB1389.namprd11.prod.outlook.com>
References: <f4e49a09aca2431e921866d1b6cbbe6c@intel.com>
 <0a8a5506-0305-12aa-91c5-6c61d359a808@gmail.com>
In-Reply-To: <0a8a5506-0305-12aa-91c5-6c61d359a808@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [104.153.203.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e1b7998-d3eb-45b3-cb7c-08d81c5d35d4
x-ms-traffictypediagnostic: MWHPR11MB1967:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB19670128D8921B81CC40C30CF16E0@MWHPR11MB1967.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 044968D9E1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wufrcvJwg+P29BTKwzhVFbDGYbZpB1nXuVnl+gLEySC9eTQpeCY6vx5DzbvaXmFF0l+1B0VahAg6irYT+stidesm5TDEVu+oszdNL5QPQpLUmlNUbEIIKQNRgSLkMaVmLhEg5qDlvyoUT8fTh8pMgEHXu1W3wYv1KTmzhtJukR0aoMrHWGKrv/eFHQWoRP/ivkS4Jzi5dtIyn1lzFD7SL4sPEe58EXRfn0YjP6OwRWvLpCKUQPFFsAM3UxWdxNdDkXRVbpljJfE1DeHezHlNI65JzUcQJCBZgaGer88g8s33Mpu805aiWf7spKj2EGLWRA3t2Xb3PVRKMXfUctbpFw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(33656002)(316002)(478600001)(66446008)(66556008)(76116006)(66946007)(2906002)(66476007)(7696005)(64756008)(9686003)(55016002)(3480700007)(26005)(5660300002)(6506007)(8936002)(8676002)(110136005)(52536014)(186003)(83380400001)(86362001)(7116003)(53546011)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 5b8U6lzuhRz7WsL/lR9+l/kovujsqWRveXCDCiuxpuPLYqQNo+LJjxZDYGtRLxG+0N9nnRkCZUm7FBlI0gCf+bv3QxQPpfNFpsyoDDBhh9NEYLvSeRi2IV2tl/bYfIc04a+QRYMsr6NHwHUjNgBX65ayFFyvVit5c3OzJs6vKckIPSxO/UeCVJ9CTUTlgCrtBukVQHBJgILefiCOjl1GeIuqUlEhZMZ+80bIZgev5QmJUe/wp60Jgyz1iAA5AKn7FkcGwUNFJQ/3/1aI56w1fMx9c3nG0IsHDgXY27b7gsOUXhm14hZS3cp7g3/IlwZYO1uCF6lqNOXPYwwmSfC0TjJghmwJs/FvyNvTta5oSyl6Qt7QARZQIxxh0R9hKHcLlm5qT5QBe77grWdNknFdgEUNVcpm84EqOrw1PUoNhvEwAm877ofvu23pNX2+P9TqJS69f01NGREzrQpnFWC5jZmRjwZFmotzTPeZamyEz+vuS297cf2WFXo1cRpOgG2D
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1b7998-d3eb-45b3-cb7c-08d81c5d35d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2020 18:49:53.1870 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7pj2Py8Uq8hgdnZ7GMkBd/xIoxgt46Oc6AplVnKyvZC1Af0HO4p5jw/QkldcDUpLdJeeFqPf+aX2AScdnPhOWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1967
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

SSBhZ3JlZS4gQmFzZWQgb24gZGVzY3JpcHRpb24gaXQgYXBwZWFycyB0aGUgYmVzdCBmaXQgaXMg
ZG9jcy9kZXZlbG9wbWVudCwgYXMgZGV2ZWxvcGVycyB3aWxsIG5lZWQgdG8gcHJvdmlkZSByaWdo
dCBob29rcy4NCg0KSWYgaXRzIHJlYWxseSBlbmQtdXNlciBmb2N1c2VkLCB0aGVuIGl0IGNhbiBw
ZXJoYXBzIGdvIGluIHVzZXJndWlkZSAtIHdoaWNoIG5lZWRzIGEgbG90IG1vcmUgZG9jdW1lbnRh
dGlvbiDwn5iKIGZvciB1c2Vycy4NCg0KVGhhbmtzLA0KLVNoYXJhZA0KDQotLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK3NoYXJhZC5raGV0
YW49aW50ZWwuY29tQGxpc3RzLm96bGFicy5vcmc+IE9uIEJlaGFsZiBPZiBrcnRheWxvcg0KU2Vu
dDogTW9uZGF5LCBKdW5lIDI5LCAyMDIwIDEwOjU0IEFNDQpUbzogTWF0dXN6Y3phaywgUGlvdHIg
PHBpb3RyLm1hdHVzemN6YWtAaW50ZWwuY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpT
dWJqZWN0OiBSZTogT3BlbkJNQyBoZWFsdGggc3RhdGlzdGljcw0KDQpPbiA2LzI5LzIwIDEwOjU0
IEFNLCBNYXR1c3pjemFrLCBQaW90ciB3cm90ZToNCj4gSGVsbG8sDQo+IA0KPiBJIHdvdWxkIGxp
a2UgdG8gdXBsb2FkIHRoZSBPcGVuQk1DIGhlYWx0aCBzdGF0aXN0aWNzIGRlc2lnbiBndWlkZSBm
b3IgcGVvcGxlIHRoYXQgd291bGQgbGlrZSB0byBpbnRlZ3JhdGUgdGhlIE9wZW5CTUMgdG8gdGhl
aXIgcGxhdGZvcm1zLiBJIHdvdWxkIG5vdCBsaWtlIHRvIHB1dCBpdCBpbnRvIC9kb2NzL2Rlc2ln
bnMsIHNpbmNlIHRoaXMgaXMgbm90IGV4YWN0bHkgZGVzaWduIGhvdyBpdCB3aWxsIGJlIGltcGxl
bWVudGVkLiBUaGlzIGRvY3VtZW50IHdhcyBtZWFudCB0byBndWlkZSB0aGUgT3BlbkJNQyB1c2Vy
cyBob3cgdGhleSBjYW4gaW1wbGVtZW50IEJNQyBoZWFsdGggc3RhdGlzdGljcyB0aGVtc2VsdmVz
Lg0KDQpJIGRvbid0IHNlZSBhIHByb2JsZW0gd2l0aCBhIGd1aWRlbGluZXMvYmVzdCBwcmFjdGlj
ZXMgdHlwZSBndWlkZSBsaXZpbmcgaW4gZG9jcywgYnV0IHByb2Igbm90IGluIGRlc2lnbnMuIE1h
eWJlIGluIGFyY2hpdGVjdHVyZSBvciB1c2VyZ3VpZGUgb3IgZGV2ZWxvcG1lbnQ/IEtpbmQgb2Yg
aGFyZCB0byBzYXkgd2l0aG91dCBzZWVpbmcgaXQuIFlvdSBjb3VsZCBhbHNvIGFsd2F5cyBhZGQg
aXQgdG8gdGhlIHdpa2kuDQoNCkt1cnQgVGF5bG9yIChrcnRheWxvcikNCg0KPiANCj4gVGhlIHF1
ZXN0aW9uIGlzLCB3aGVyZSB3b3VsZCBiZSB0aGUgYmVzdCBwbGFjZSB0byB1cGxvYWQgc3VjaCBk
b2N1bWVudD8NCj4gDQo+IFBpb3RyIE1hdHVzemN6YWsNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IEludGVs
IFRlY2hub2xvZ3kgUG9sYW5kIHNwLiB6IG8uby4NCj4gdWwuIFNsb3dhY2tpZWdvIDE3MywgODAt
Mjk4IEdkYW5zaw0KPiBLUlMgMTAxODgyDQo+IE5JUCA5NTctMDctNTItMzE2DQo+IA0KDQo=
