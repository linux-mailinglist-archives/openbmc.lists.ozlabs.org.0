Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74170E7736
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 18:03:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4721JW45VNzDrfd
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 04:03:39 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4721GH56gnzDrRW
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 04:01:39 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 10:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; d="scan'208";a="350733598"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga004.jf.intel.com with ESMTP; 28 Oct 2019 10:01:20 -0700
Received: from fmsmsx118.amr.corp.intel.com ([169.254.1.114]) by
 fmsmsx107.amr.corp.intel.com ([169.254.6.52]) with mapi id 14.03.0439.000;
 Mon, 28 Oct 2019 10:01:19 -0700
From: "Khetan, Sharad" <sharad.khetan@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, "Muggeridge, Matt"
 <matt.muggeridge2@hpe.com>
Subject: RE: Curiosity: Why is the OpenBMC layer named "phosphor"
Thread-Topic: Curiosity: Why is the OpenBMC layer named "phosphor"
Thread-Index: AdWKAHHvH4cEuoZBQpKgd9B6kReChAD0/b6AAAkMUTA=
Date: Mon, 28 Oct 2019 17:01:19 +0000
Message-ID: <865C376D1B77624AAA570EFEF73CE52F9E04512A@fmsmsx118.amr.corp.intel.com>
References: <DF4PR8401MB10841D9A4AB2C85B587D477FD86A0@DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM>
 <D5DFCF5B-2691-4308-BB27-4E3A185EF674@fuzziesquirrel.com>
In-Reply-To: <D5DFCF5B-2691-4308-BB27-4E3A185EF674@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTNmNTgyNTktYzYyNC00YWY3LWFkYjctNDZlYjdhMDUzZjVjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiaUtnSExabWM1VVwvSHVaXC9WYUxlZXZaYVRiNG5oT3lZMkN6enljdVg0bDI3ZHBYTXAxVWd2QXQ2SUE2SGN4ekF2In0=
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: request-justification,no-action
x-originating-ip: [10.1.200.108]
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VmVyeSBpbnRlcmVzdGluZy4gSSBoYXZlIHdvbmRlcmVkIGFib3V0IG5vbWVuY2xhdHVyZSBidXQg
ZGlkbuKAmXQga25vdyB0aGUgcm9vdHMgd2VyZSBmaXNoeSDwn5iKLg0KLVNoYXJhZA0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK3No
YXJhZC5raGV0YW49aW50ZWwuY29tQGxpc3RzLm96bGFicy5vcmc+IE9uIEJlaGFsZiBPZiBCcmFk
IEJpc2hvcA0KU2VudDogTW9uZGF5LCBPY3RvYmVyIDI4LCAyMDE5IDc6MTMgQU0NClRvOiBNdWdn
ZXJpZGdlLCBNYXR0IDxtYXR0Lm11Z2dlcmlkZ2UyQGhwZS5jb20+DQpDYzogT3BlbkJNQyBNYWls
bGlzdCA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPg0KU3ViamVjdDogUmU6IEN1cmlvc2l0eTog
V2h5IGlzIHRoZSBPcGVuQk1DIGxheWVyIG5hbWVkICJwaG9zcGhvciINCg0KDQoNCj4gT24gT2N0
IDIzLCAyMDE5LCBhdCA4OjIxIFBNLCBNdWdnZXJpZGdlLCBNYXR0IDxtYXR0Lm11Z2dlcmlkZ2Uy
QGhwZS5jb20+IHdyb3RlOg0KPiANCj4gSSBzZWUg4oCccGhvc3Bob3LigJ0gc2hvd3MgdXAgYWxs
IG92ZXIgdGhlIHBsYWNlIGluIG9wZW5ibWMuICBFLmcuIG1ldGEtcGhvc3Bob3IgaXMgdGhlIE9w
ZW5CTUMgbGF5ZXIuDQo+ICANCj4gSXMgcGhvc3Bob3IgYSBwcm9qZWN0IG5hbWUgdGhhdCB3aWxs
IGV2b2x2ZSB3aXRoIE9wZW5CTUMgZ2VuZXJhdGlvbnMgb3IgaXMgaXQgZm9yZXZlciBzdGF0aWM/
DQoNCkF0IHRoZSBtb21lbnQgaXQgaXMgc3RhdGljIGJ1dCB0aGF0IGlzbuKAmXQgYW55IGtpbmQg
b2YgaGFyZCBhbmQgZmFzdCBydWxlLiAgSXQgaXMgdHlwaWNhbGx5IHVzZWQgdG8gZGlzdGluZ3Vp
c2ggYSBkZWZhdWx0IG9yIHJlZmVyZW5jZSBpbXBsZW1lbnRhdGlvbiBidXQgdGhhdCBkZWZpbml0
aW9uIGFuZCBpdHMgdXNhZ2UgaXMgY2VydGFpbmx5IGZ1enp5Lg0KDQpUaGUgZmlyc3QgcGxhdGZv
cm0gc3VwcG9ydGVkIGJ5IHRoaXMgcHJvamVjdCBiYWNrIGluIDIwMTUgd2FzIHRoZSBiYXJyZWxl
eWUgc3lzdGVtLiAgQmFycmVsZXllIGlzIGEga2luZCBvZiBmaXNoIC0gaXQgaGFzIGEgcGhvc3Bo
b3Jlc2NlbnQgZ2xvdzsgbWV0YS1waG9zcGhvciBpcyBhIG5vZCB0byB0aG9zZSByb290cyBvZiB0
aGUgcHJvamVjdC4NCg0KdGh4IC0gYnJhZA0K
