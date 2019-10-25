Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A4CE5188
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 18:46:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47094b2sjMzDqtG
	for <lists+openbmc@lfdr.de>; Sat, 26 Oct 2019 03:46:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47093q0PYgzDqdg
 for <openbmc@lists.ozlabs.org>; Sat, 26 Oct 2019 03:46:13 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 09:46:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,229,1569308400"; d="scan'208";a="398813090"
Received: from irsmsx110.ger.corp.intel.com ([163.33.3.25])
 by fmsmga005.fm.intel.com with ESMTP; 25 Oct 2019 09:46:06 -0700
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.76]) by
 irsmsx110.ger.corp.intel.com ([169.254.15.37]) with mapi id 14.03.0439.000;
 Fri, 25 Oct 2019 17:46:05 +0100
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: multiple telemetry designs
Thread-Topic: multiple telemetry designs
Thread-Index: AQHVicBpLOT3TrTciEijW5fZBUhB6KdobVAAgAACRgCAAC2GAIAA2c2ggABxGICAAU1egIAAMBwg
Date: Fri, 25 Oct 2019 16:46:04 +0000
Message-ID: <DBA24EEE99A3B3489FF472F5E94DE6D7A30F9DFD@IRSMSX101.ger.corp.intel.com>
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
 <dd81fb28-4d01-8726-9b16-81a677eb3e16@linux.intel.com>
 <8998b51b-4e67-738e-becd-63c26ea626be@linux.intel.com>
 <d69d24c7-d07f-35d4-1395-859a0df2a05a@linux.vnet.ibm.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30F946F@IRSMSX101.ger.corp.intel.com>
 <c3dd56aa-b9e2-1efd-1da6-70b0e056446f@linux.intel.com>
 <053009AE-890C-4650-9096-D4E8ABF707AA@fuzziesquirrel.com>
In-Reply-To: <053009AE-890C-4650-9096-D4E8ABF707AA@fuzziesquirrel.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDFkNWM4ODctMzljNS00YTNkLTliYjYtNGViYzEyN2U5MWQxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiVUQzODhESEp4RkVSNzlEMWZVTVZRbGZZY3ErQXlBd0QzY0M3ZWd2YVZaM1FLNEtKbDgycGhsQXBLSVA4eEo0dSJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: request-justification,no-action
x-originating-ip: [163.33.239.180]
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
Cc: Justin Thaler <thalerj@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "neladk@microsoft.com" <neladk@microsoft.com>,
 James Feist <james.feist@linux.intel.com>, "Mihm,
 James" <james.mihm@intel.com>,
 "apparao.puli@linux.intel.com" <apparao.puli@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksDQoNClVuZm9ydHVuYXRlbHksIHRoaXMgaXMgb25seSBhIFBvQyBxdWFsaXR5LCB0aHVzIHRo
ZXJlIGlzIG5vIG9wZW4gcmVwb3NpdG9yeSB3aXRoIHRoZSBjb2RlLg0KV2UgcGxhbiB0byBkbyB0
aGUgT3BlbkJNQyBpbXBsZW1lbnRhdGlvbiBpbiB0aGUgb3BlbiByZXBvc2l0b3J5LiBXaWxsIGl0
IHdvcmsgZm9yIHlvdT8NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJyYWQg
QmlzaG9wIFttYWlsdG86YnJhZGxleWJAZnV6emllc3F1aXJyZWwuY29tXQ0KU2VudDogRnJpZGF5
LCBPY3RvYmVyIDI1LCAyMDE5IDI6MDggUE0NClRvOiBNYXR1c3pjemFrLCBQaW90ciA8cGlvdHIu
bWF0dXN6Y3pha0BpbnRlbC5jb20+DQpDYzogSnVzdGluIFRoYWxlciA8dGhhbGVyakBsaW51eC52
bmV0LmlibS5jb20+OyBrdW55aUBnb29nbGUuY29tOyBhcHBhcmFvLnB1bGlAbGludXguaW50ZWwu
Y29tOyBuZWxhZGtAbWljcm9zb2Z0LmNvbTsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBNaWht
LCBKYW1lcyA8amFtZXMubWlobUBpbnRlbC5jb20+OyBKYW1lcyBGZWlzdCA8amFtZXMuZmVpc3RA
bGludXguaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IG11bHRpcGxlIHRlbGVtZXRyeSBkZXNpZ25z
DQoNCj4gT24gT2N0IDI0LCAyMDE5LCBhdCAxMjoxNCBQTSwgSmFtZXMgRmVpc3QgPGphbWVzLmZl
aXN0QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+DQo+IE9uIDEwLzI0LzE5IDE6NDggQU0sIE1h
dHVzemN6YWssIFBpb3RyIHdyb3RlOg0KPj4NCj4+IEFzIGZvciB0aGUgaW1wbGVtZW50YXRpb24s
IHdlIGhhdmUgbW9uaXRvcmluZyBzZXJ2aWNlIGFuZCBSZWRmaXNoIHRlbGVtZXRyeSBzZXJ2aWNl
IGltcGxlbWVudGVkIChjdXJyZW50bHkgd2l0aG91dCB0cmlnZ2VycyBzdXBwb3J0KSwgaG93ZXZl
ciBpdCByZXF1aXJlIHNvbWUgcmVmYWN0b3JpbmcgdG8gYmUgcHJvZHVjdGlvbiBjb2RlIHF1YWxp
dHkuDQo+DQo+IElzIHRoZXJlIGEgV0lQIHJldmlldyBzb21ld2hlcmU/DQoNCkkgaGF2ZSB0aGlz
IHNhbWUgcXVlc3Rpb24uICBJIHdvdWxkbuKAmXQgbWluZCBiZWluZyBhYmxlIHRvIGhhdmUgYSBs
b29rLiAgSXMgdGhlcmUgYW55dGhpbmcgeW91IG5lZWQgZnJvbSB0aGUgY29tbXVuaXR5IHRvIGJl
IGFibGUgdG8gZG8geW91ciB3b3JrIGluIHRoZSBvcGVuPw0K
