Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1623515BAA6
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 09:17:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48J8Wc4CWmzDqTF
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 19:17:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=james.mihm@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48J8Vp4vPmzDqT8
 for <openbmc@lists.ozlabs.org>; Thu, 13 Feb 2020 19:16:50 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2020 00:15:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,436,1574150400"; d="scan'208";a="234049001"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
 by orsmga003.jf.intel.com with ESMTP; 13 Feb 2020 00:15:30 -0800
Received: from orsmsx115.amr.corp.intel.com ([169.254.4.100]) by
 ORSMSX110.amr.corp.intel.com ([169.254.10.107]) with mapi id 14.03.0439.000;
 Thu, 13 Feb 2020 00:15:29 -0800
From: "Mihm, James" <james.mihm@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, James Feist
 <james.feist@linux.intel.com>
Subject: RE: Functionality vs Security
Thread-Topic: Functionality vs Security
Thread-Index: AQHV4em12mIZ/evTg0287Es0HymP7agYxO6AgAABpwCAADCPAP//t6xA
Date: Thu, 13 Feb 2020 08:15:29 +0000
Message-ID: <C599FC839619124CAC44E062ABB7DFE2D7BAF2D5@ORSMSX115.amr.corp.intel.com>
References: <62005ec9-e004-1041-7c5b-9272f8c2d854@linux.intel.com>
 <6F13EC73-E3F0-43D5-8E3F-1A8585918C2A@fuzziesquirrel.com>
 <99262b0e-fca2-71c9-ff1f-3526ed26efd0@linux.intel.com>
 <F59054FF-546F-4728-B569-CF94AB88CC96@fuzziesquirrel.com>
In-Reply-To: <F59054FF-546F-4728-B569-CF94AB88CC96@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: request-justification,no-action
x-originating-ip: [10.22.254.139]
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

RXhwb3NpbmcgdGhlIFJFU1QgRC1CdXMgQVBJcyB2aWEgYSBuZXR3b3JrIGludGVyZmFjZSBpcyBi
YWQgcHJhY3RpY2UgYW5kIHNob3VsZCBiZSBkaXNhYmxlZCBieSBkZWZhdWx0LiBKdXN0IGJlY2F1
c2UgaXQgd2FzIGRvbmUgdGhhdCB3YXkgaW4gdGhlIGJlZ2lubmluZyBkb2VzbuKAmXQgbWVhbiB0
aGF0IGl0IHNob3VsZCByZW1haW4gdGhhdCB3YXkuDQpBcHBsaWNhdGlvbnMgc2hvdWxkIGJlIGNv
bmZpZ3VyZWQgdG8gYmUgc2VjdXJlIGJ5IGRlZmF1bHQuIENvbnN1bWVycyBvZiB0aGUgY29kZSBz
aG91bGQgaGF2ZSB0byBpbnRlbnRpb25hbGx5IHNlbGVjdCBhbiBpbnNlY3VyZSBjb25maWd1cmF0
aW9uIC0gaXQgc2hvdWxkbid0IGJlIHByb3ZpZGVkIGJ5IGRlZmF1bHQuIA0KDQpXaXRoIHBob3Nw
aG9yLXdlYnVpIGJlaW5nIHJlcGxhY2VkIGJ5IHdlYnVpLXZ1ZSwgdGhlcmUncyBub3QgbXVjaCB2
YWx1ZSBmb3IgdXMgdG8gdXBzdHJlYW0gb3VyIGNoYW5nZXMgdG8gcGhvc3Bob3Itd2VidWkuIFJl
Z2FyZGluZyB0aGUgcmVzb3VyY2UgaXNzdWVzLCB3ZSdyZSBoYXZpbmcgdG8gcmVzcG9uZCB0byBk
ZWNpc2lvbnMgdGhhdCB3ZXJlIG91dCBvZiBvdXIgY29udHJvbC4gDQoNCkphbWVzLg0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQnJhZCBCaXNob3AgPGJyYWRsZXliQGZ1enpp
ZXNxdWlycmVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDEyLCAyMDIwIDc6MDUg
UE0NClRvOiBKYW1lcyBGZWlzdCA8amFtZXMuZmVpc3RAbGludXguaW50ZWwuY29tPg0KQ2M6IE9w
ZW5CTUMgTWFpbGxpc3QgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz47IEd1bm5hciBNaWxscyA8
Z21pbGxzQGxpbnV4LnZuZXQuaWJtLmNvbT47IE1paG0sIEphbWVzIDxqYW1lcy5taWhtQGludGVs
LmNvbT47IEpvc2VwaCBSZXlub2xkcyA8anJleUBsaW51eC5pYm0uY29tPg0KU3ViamVjdDogUmU6
IEZ1bmN0aW9uYWxpdHkgdnMgU2VjdXJpdHkNCg0KDQoNCj4gT24gRmViIDEyLCAyMDIwLCBhdCA3
OjExIFBNLCBKYW1lcyBGZWlzdCA8amFtZXMuZmVpc3RAbGludXguaW50ZWwuY29tPiB3cm90ZToN
Cj4gDQo+IE9uIDIvMTIvMjAgNDowNSBQTSwgQnJhZCBCaXNob3Agd3JvdGU6DQo+Pj4gT24gRmVi
IDEyLCAyMDIwLCBhdCA0OjE2IFBNLCBKYW1lcyBGZWlzdCA8amFtZXMuZmVpc3RAbGludXguaW50
ZWwuY29tPiB3cm90ZToNCj4+PiANCj4+PiBJbiBJUkMgeWVzdGVyZGF5IEkgcHJvcG9zZWQgdGhl
IHF1ZXN0aW9uIG9mIHdoZXRoZXIgdG8gY2hhbmdlIHRoZSBkZWZhdWx0IG9mIGJtY3dlYiB0byBk
aXNhYmxlIFJFU1QgRC1CdXMsIG9yIHRvIGNoYW5nZSBpdCBpbiBvdXIgbWV0YS1sYXllcnMgb25s
eS4gSSBjcmVhdGVkIHRoZSBwYXRjaCBoZXJlOiBodHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2pl
Y3QueHl6L2Mvb3BlbmJtYy9ibWN3ZWIvKy8yOTM0NCBhbmQgSSBhbSBsb29raW5nIGZvciBmZWVk
YmFjay4gV2hpbGUgUkVTVCBELUJ1cyBkb2VzIGV4cG9zZSBtYW55IHVzZWZ1bCBBUElzLCBhbmQg
cGhvc3Bob3Itd2VidWkgZGVwZW5kcyBoZWF2aWx5IG9uIGl0LCBpdCBkb2VzIGxlYWsgaW5mb3Jt
YXRpb24gdG8gYW55IGxvZ2dlZCBpbiB1c2VyLiBUaGlzIGNvbWVzIHRvIHRoZSBxdWVzdGlvbiwg
c2hvdWxkIHdlIHByZWZlciBmdW5jdGlvbmFsaXR5IGJ5IGRlZmF1bHQgb3Igc2VjdXJpdHkgYnkg
ZGVmYXVsdD8gSXQgaXMgYSBjb21waWxlIHN3aXRjaCBlaXRoZXIgd2F5LCBzbyBlYWNoIHVzZXIg
Y2FuIHN0aWxsIGRlY2lkZSB3aGljaCB0aGV5IHByZWZlci4gSSBoYXZlIHRoZSBvcGluaW9uIHRo
YXQgdGhlIGRlZmF1bHQgc2hvdWxkIGJlIHRoZSBzYWZlc3QgY29uZmlndXJhdGlvbiwgYW5kIGlm
IHNvbWVvbmUgd2FudHMgdG8gY2hhbmdlIHRoYXQsIHRoZW4gdGhleSBjYW4gYWNjZXB0IHRoZSBy
aXNrIGFuZCBjaGFuZ2UgdGhlIGJ1aWxkIGZsYWcuDQo+Pj4gDQo+Pj4gVGhvdWdodHM/DQo+Pj4g
DQo+Pj4gVGhhbmtzLA0KPj4+IA0KPj4+IEphbWVzDQo+PiBPbmUgaWRlYSBJIGhhdmUgaXMgYWRk
aW5nIGEgbmV3IGRpc3RybyBjb25maWd1cmF0aW9uLiAgVG9kYXkgd2UgaGF2ZSBvcGVuYm1jLXBo
b3NwaG9yIC0gd2UgY291bGQgYWRkIGEgRElTVFJPPW9wZW5ibWMtc2VjdXJlLWF0LWFsbC1jb3N0
cyB0byBtZXRhLXBob3NwaG9yLCBhbmQgdGhlIGxlZ2FjeSBBUEkgY291bGQgYmUgZGlzYWJsZWQg
YnkgZGVmYXVsdCB0aGVyZSwgYW5kIHJlbWFpbiBlbmFibGVkIGJ5IGRlZmF1bHQgaW4gb3BlbmJt
Yy1waG9zcGhvci4NCj4gDQo+IEkgd291bGQgcmF0aGVyIHNlZSBPcGVuQk1DIGJ5IGRlZmF1bHQg
c2VjdXJlLiBJIGRvbid0IHdhbnQgdG8gc2VlIENWRXMgY2F1c2VkIGJ5IGFuIGluc2VjdXJlIGRl
ZmF1bHQgY29uZmlndXJhdGlvbiBpbiBhbnlib2R5J3MgcGxhdGZvcm0uDQoNCkNhbiB5b3UgdGFs
ayBtb3JlIGFib3V0IGhvdyB0aGlzIGRvZXNu4oCZdCBtZWV0IHRoZSBnb2Fscz8gIFRoZSB1c2Vy
IGFsd2F5cyBoYXMgdG8gcGljayBhIGRpc3Rybywgc28gdGhlcmUgaXMgYSBjb25zY2lvdXMgY2hv
aWNlIGJldHdlZW4gdGhlIHR3by4gIFRoZXJlIHdvdWxkbuKAmXQgYmUgYW55IGRlZmF1bHQgd2l0
aCBhIHNldHVwIGxpa2UgdGhpcy4NCg0KSSBndWVzcyBpdCBpcyBwb3NzaWJsZSB0byBoYXZlIG5v
ZGlzdHJvLCB3aGljaCB3b3VsZCBiZSB0aGUgdHJ1ZSBkZWZhdWx0LiAgSSB3b3VsZG7igJl0IGhh
dmUgYW4gaXNzdWUgd2l0aCB0aGVzZSBzZXR1cHM6DQoNCkRJU1RSTz0gI25vZGlzdHJvIC0+IGZ1
bGwgcGFyYW5vaWEgYnkgZGVmYXVsdA0KRElTVFJPPW9wZW5ibWMtcGhvc3Bob3IgLT4gZnVsbCBm
dW5jdGlvbiBieSBkZWZhdWx0DQpESVNUUk89b3BlbmJtYy1sb2NrZG93biAtPiBmdWxsIHBhcmFu
b2lhIGJ5IGRlZmF1bHQNCg0Kb3IganVzdDoNCkRJU1RSTz0gI25vZGlzdHJvIC0+IGZ1bGwgcGFy
YW5vaWEgYnkgZGVmYXVsdA0KRElTVFJPPW9wZW5ibWMtcGhvc3Bob3IgLT4gZnVsbCBmdW5jdGlv
biBieSBkZWZhdWx0DQoNCndvdWxkIGVpdGhlciBvZiB0aGVzZSBtZWV0IHRoZSBnb2Fscz8NCg==
