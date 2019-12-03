Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5F311063E
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2019 22:02:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47SDvz3zv9zDqDT
	for <lists+openbmc@lfdr.de>; Wed,  4 Dec 2019 08:02:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=kathryn.elainex.pine@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47SDs96hLCzDqHw
 for <openbmc@lists.ozlabs.org>; Wed,  4 Dec 2019 08:00:28 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 13:00:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,274,1571727600"; d="scan'208";a="213546553"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
 by orsmga006.jf.intel.com with ESMTP; 03 Dec 2019 13:00:24 -0800
Received: from orsmsx123.amr.corp.intel.com (10.22.240.116) by
 ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 3 Dec 2019 13:00:24 -0800
Received: from orsmsx113.amr.corp.intel.com ([169.254.9.200]) by
 ORSMSX123.amr.corp.intel.com ([169.254.1.236]) with mapi id 14.03.0439.000;
 Tue, 3 Dec 2019 13:00:23 -0800
From: "Pine, Kathryn ElaineX" <kathryn.elainex.pine@intel.com>
To: Derick Montague <Derick.Montague@ibm.com>
Subject: RE: GUI Component Library
Thread-Topic: GUI Component Library
Thread-Index: AQHVn+wtkNH9VJJADUGr57A1KY1RoaeXUJtwgAWdKQCAAOeqEIAB81AAgAeB7+CAAi2ugP//frBQ
Date: Tue, 3 Dec 2019 21:00:23 +0000
Message-ID: <FD0BD680739BFC41807C96BD23118BB131A94A@ORSMSX113.amr.corp.intel.com>
References: <FD0BD680739BFC41807C96BD23118BB131A69B@ORSMSX113.amr.corp.intel.com>
 <OF39184269.99B81F04-ON002584C5.0011B6CF-002584C5.0071031B@notes.na.collabserv.com>
In-Reply-To: <OF39184269.99B81F04-ON002584C5.0011B6CF-002584C5.0071031B@notes.na.collabserv.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzIwYzc4MzItN2Y2OC00NjYzLWI5NmYtODI4OWRlY2IyNWM1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiR3dGK2R4bXVVQk9VbjZNMkpOdTZlZWJxTEE0Tnk3TGkrNms2OTZOdk45MWxiUlJzdTM4bmJSekl6cXA2ZVdWUCJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: request-justification,no-action
x-originating-ip: [10.22.254.140]
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SSdtIHN1cmUgd2UgY2FuIGZpZ3VyZSBvdXQgaG93IHRvIGFwcHJvYWNoIHRoaXMgZGVzaWduIGNo
YWxsZW5nZS4gSSBhcHByZWNpYXRlIHlvdSBiZWluZyB3aWxsaW5nIHRvIHdvcmsgd2l0aCBCb290
c3RyYXAgYW5kIGFtIG9wZW4gdG8gZGlzY3Vzc2luZyB0aGUgYXBwcm9hY2ggeW91IHN1Z2dlc3Qu
IEZyb20gbXkgcG9pbnQgb2YgdmlldywgSSBkbyBzZWUgYSB3YXkgZm9yd2FyZCB0byB1bmlmeSBv
dXIgZGVzaWduIHN0eWxlcyBhbmQgcmVhbGx5IGZlZWwgbGlrZSBwdXR0aW5nIHRvZ2V0aGVyIGEg
bW9ja3VwIGlzIGEgcHJvY2VzcyB0aGF0IHdpbGwgaGVscCBtZSBzZWUgYW5kIHNoYXJlIHRoYXQg
dmlzaW9uLCBzbyBwZXJoYXBzIEknbGwganVzdCB3b3JrIG9uIHRoYXQgYW5kIHNoYXJlIGl0IHdo
ZW4gaXQncyByZWFkeS4uLiBhbmQgbWVhbndoaWxlIHdlIGNhbiBkaXNjdXNzIHlvdXIgcHJvcG9z
ZWQgYXBwcm9hY2ggaW4gdGhlIEdVSSBEZXNpZ24gd29ya2dyb3VwIG1lZXRpbmcgdG9tb3Jyb3cu
DQoNClRoYW5rcywNCkthdGh5IA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTog
RGVyaWNrIE1vbnRhZ3VlIDxEZXJpY2suTW9udGFndWVAaWJtLmNvbT4gDQoNCj4gTXkgcHJvcG9z
YWwgaXMgdGhhdCB3ZSB3b3JrIHRvd2FyZHMgYSB2aXNpb24gd2l0aCBjb25jZXB0cyBmb3IgdGhl
IG92ZXJhbGwgc2l0ZSBwcmlvciB0byBnZXR0aW5nIGludG8gdGhlIGRldGFpbHMsIGFzIGEgbWV0
aG9kIGZvciBjb25zZW5zdXMgYnVpbGRpbmcuIA0KDQpEZXNpZ25pbmcgYSBzaXRlIHdpdGhvdXQg
dW5kZXJzdGFuZGluZyB0aGUgYmFzZS1sZXZlbCBidWlsZGluZyBibG9ja3Mgd2lsbCBub3Qgd29y
ay4gV2UgbmVlZCB0byBhZ3JlZSBvbiB0aGUgZm91bmRhdGlvbiBiZWZvcmUgd2Ugc3RhcnQgdHJ5
aW5nIHRvIGJ1aWxkIGNvbmNlcHRzLiBCdWlsZGluZyBjb25jZXB0cyB3aXRob3V0IGFuIGFncmVl
bWVudCBvbiB0aGUgZm91bmRhdGlvbiB3aWxsIG5vdCBiZSBlZmZpY2llbnQuDQoNCg0KPiBJIHRo
aW5rIHdlIGhhdmUgdGhlIG9wcG9ydHVuaXR5IOKAkyBsZWFuaW5nIG9uIHRoZSBjb2xsYWJvcmF0
aXZlIHN0cmVuZ3RocyB0aGF0IHdlIGNhbiBhbGwgYnJpbmcg4oCTIHRvIGNvbWJpbmUgd2hhdCB3
ZSBoYXZlIGVhY2ggYmVlbiB3b3JraW5nIG9uIHRvIG1ha2Ugc29tZXRoaW5nIGV2ZW4gYmV0dGVy
LiBCdXQgaXQgd2lsbCBtZWFuIGJlaW5nIHdpbGxpbmcgdG8gY29tcHJvbWlzZSBzb21lIG9mIG91
ciBzdHlsZSBwcmVmZXJlbmNlcyB0byBhZ3JlZSBvbiBhIHNoYXJlZCB2aXNpb24uIElzIHRoZXJl
IGludGVyZXN0IG9uIHdvcmtpbmcgdG93YXJkcyB0aGlzIHZpc2lvbiB0b2dldGhlcj8NCg0KVGhh
dCBpcyB0aGUgb2JqZWN0aXZlIG9mIHRoaXMgdGhyZWFkLiBTaW5jZSB5b3UgYXJlIG9wcG9zZWQg
dG8gdXNpbmcgQ2FyYm9uLCB3ZSBhZ3JlZWQgdG8gdXNlIEJvb3RzdHJhcC4gV2UgYXJlIHdvcmtp
bmcgdG93YXJkcyB0aGlzIHZpc2lvbiB0b2dldGhlci4NCiANCg0KPiBJZiB3ZSBjYW4gYWdyZWUg
b24gdGhlIGJpZyBwaWN0dXJlLCBjcmVhdGluZyBhIHN0eWxlIGd1aWRlIG9yIGNob29zaW5nIGEg
ZGVzaWduIGxpYnJhcnkgd2lsbCBiZSBtdWNoIGVhc2llciBhcyB3ZeKAmWxsIGhhdmUgY29uc2Vu
c3VzIHJlZmxlY3RpbmcgdGhhdCBzaGFyZWQgdmlzaW9uLg0KDQpJIHRob3VnaHQgd2UgYWxyZWFk
eSBkZWNpZGVkIHRvIHVzZSBCb290c3RyYXAtVnVlIGFzIHRoZSBjb21wb25lbnQgbGlicmFyeS4g
RGlkIHNvbWV0aGluZyBjaGFuZ2U/IA0KDQoNCj4gSG93IGFib3V0IHdlIGRpc2N1c3MgaW4gdGhp
cyB3ZWVrJ3MgR1VJIERlc2lnbiB3b3JrZ3JvdXAgbWVldGluZz8NCg0KVGhlIHRvcGljcyB5b3Ug
c3VnZ2VzdGVkIHdvcmsuIFdlIHdpbGwgbmVlZCB0byBkaXNjdXNzIHRoZSBmcmFtZXdvcmsgbWln
cmF0aW9uIHdpdGggYSBmb2N1cyBvbiBob3cgdG8gYWxpZ24gb24gdGhlbWUgY3VzdG9taXphdGlv
bi4NCg0K
