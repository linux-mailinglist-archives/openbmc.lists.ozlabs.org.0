Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE27E7688
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 17:36:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4720j23dvBzDrbK
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 03:36:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4720gw5p7zzDqvl
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 03:35:22 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 09:35:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; d="scan'208";a="198115764"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
 by fmsmga008.fm.intel.com with ESMTP; 28 Oct 2019 09:35:17 -0700
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.76]) by
 IRSMSX104.ger.corp.intel.com ([169.254.5.252]) with mapi id 14.03.0439.000;
 Mon, 28 Oct 2019 16:35:17 +0000
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: multiple telemetry designs
Thread-Topic: multiple telemetry designs
Thread-Index: AQHVicBpLOT3TrTciEijW5fZBUhB6KdobVAAgAACRgCAAC2GAIAA2c2ggABxGICAAU1egIAAMBwggAAhUgCABLrokA==
Date: Mon, 28 Oct 2019 16:35:16 +0000
Message-ID: <DBA24EEE99A3B3489FF472F5E94DE6D7A30FA694@IRSMSX101.ger.corp.intel.com>
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
 <dd81fb28-4d01-8726-9b16-81a677eb3e16@linux.intel.com>
 <8998b51b-4e67-738e-becd-63c26ea626be@linux.intel.com>
 <d69d24c7-d07f-35d4-1395-859a0df2a05a@linux.vnet.ibm.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30F946F@IRSMSX101.ger.corp.intel.com>
 <c3dd56aa-b9e2-1efd-1da6-70b0e056446f@linux.intel.com>
 <053009AE-890C-4650-9096-D4E8ABF707AA@fuzziesquirrel.com>
 <DBA24EEE99A3B3489FF472F5E94DE6D7A30F9DFD@IRSMSX101.ger.corp.intel.com>
 <9ECD367E-6573-4DA8-815E-E117AD8DF56C@fuzziesquirrel.com>
In-Reply-To: <9ECD367E-6573-4DA8-815E-E117AD8DF56C@fuzziesquirrel.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDJkZTJmMGYtNGViOC00NWQ1LThkODctMWQ5MTBjOTcyNTJkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUm0zZmpzMCtiWnRwOEw2TkNsd2ZkNU5waDNIR1lzZExhbzlnXC9KcTJXSE1zZDVqSUtOaFZ6NVZOYlFFYURQVG8ifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: request-justification,no-action
x-originating-ip: [163.33.239.181]
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
Cc: "Mihm, James" <james.mihm@intel.com>,
 Justin Thaler <thalerj@linux.vnet.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "neladk@microsoft.com" <neladk@microsoft.com>,
 James Feist <james.feist@linux.intel.com>,
 "apparao.puli@linux.intel.com" <apparao.puli@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

VGhlIFBvQyB3YXMgZG9uZSBpbnRlcm5hbGx5LCB0aHVzIGl0IHdhc24ndCBvcGVuZWQuIFdlIHBs
YW4gdG8gdXNlIGl0cyBjb2RlIGFzIHNvbWUgcmVmZXJlbmNlIGltcGxlbWVudGluZyBNb25pdG9y
aW5nIFNlcnZpY2UgYW5kIFJlZGZpc2ggdGVsZW1ldHJ5IHNlcnZpY2UuIA0KV2UgZG9uJ3Qgd2Fu
dCB0byBkbyBhbGwgdGhlIGRldmVsb3BtZW50IGludGVybmFsbHkgYW5kIHRoZW4gc2hvdyBpdCBh
cywgaW4gZmFjdCwgSW50ZWwncyBpbXBsZW1lbnRhdGlvbi4gSSB3b3VsZCBsaWtlIHRvIG1ha2Ug
dGhlIGNvZGUgb3BlbmVkIGZyb20gdGhlIHZlcnkgYmVnaW5uaW5nLiANCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IEJyYWQgQmlzaG9wIFttYWlsdG86YnJhZGxleWJAZnV6emll
c3F1aXJyZWwuY29tXSANClNlbnQ6IEZyaWRheSwgT2N0b2JlciAyNSwgMjAxOSA2OjU5IFBNDQpU
bzogTWF0dXN6Y3phaywgUGlvdHIgPHBpb3RyLm1hdHVzemN6YWtAaW50ZWwuY29tPg0KQ2M6IEp1
c3RpbiBUaGFsZXIgPHRoYWxlcmpAbGludXgudm5ldC5pYm0uY29tPjsgb3BlbmJtY0BsaXN0cy5v
emxhYnMub3JnOyBuZWxhZGtAbWljcm9zb2Z0LmNvbTsgSmFtZXMgRmVpc3QgPGphbWVzLmZlaXN0
QGxpbnV4LmludGVsLmNvbT47IE1paG0sIEphbWVzIDxqYW1lcy5taWhtQGludGVsLmNvbT47IGFw
cGFyYW8ucHVsaUBsaW51eC5pbnRlbC5jb20NClN1YmplY3Q6IFJlOiBtdWx0aXBsZSB0ZWxlbWV0
cnkgZGVzaWducw0KDQoNCg0KPiBPbiBPY3QgMjUsIDIwMTksIGF0IDEyOjQ2IFBNLCBNYXR1c3pj
emFrLCBQaW90ciA8cGlvdHIubWF0dXN6Y3pha0BpbnRlbC5jb20+IHdyb3RlOg0KPiANCj4gSGks
DQo+IA0KPiBVbmZvcnR1bmF0ZWx5LCB0aGlzIGlzIG9ubHkgYSBQb0MgcXVhbGl0eSwgdGh1cyB0
aGVyZSBpcyBubyBvcGVuIHJlcG9zaXRvcnkgd2l0aCB0aGUgY29kZS4NCg0KV2hlcmUgZGlkIHlv
dSBnZXQgdGhlIGlkZWEgdGhhdCBQb0MgY29kZSBjYW7igJl0IGJlIHNoYXJlZCB3aXRoIHRoZSBj
b21tdW5pdHk/DQoNCj4gV2UgcGxhbiB0byBkbyB0aGUgT3BlbkJNQyBpbXBsZW1lbnRhdGlvbiBp
biB0aGUgb3BlbiByZXBvc2l0b3J5LiBXaWxsIGl0IHdvcmsgZm9yIHlvdT8NCg0KTm90IHJlYWxs
eS4gIEkgY2Fu4oCZdCBtYWtlIHlvdSBkbyBhbnl0aGluZyBidXQgdGhpcyBpcyBub3QgaG93IG9w
ZW4gc291cmNlIHNvZnR3YXJlIGRldmVsb3BtZW50IHdvcmtzLiAgSWYgSW50ZWwgZGV2ZWxvcHMg
dGhlIGNvZGUgYW5kIHRoZW4gc2hhcmVzIGl0LCB0aGF0IGlzIG5vdCB0aGUgT3BlbkJNQyBpbXBs
ZW1lbnRhdGlvbiB0aGF0IGlzIHRoZSBJbnRlbCBpbXBsZW1lbnRhdGlvbi4NCg0KdGh4IC1icmFk
DQo=
