Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9954BE4FD7
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 17:09:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4706vd1HQ9zDqsH
	for <lists+openbmc@lfdr.de>; Sat, 26 Oct 2019 02:09:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4706tm3QGYzDqnZ
 for <openbmc@lists.ozlabs.org>; Sat, 26 Oct 2019 02:08:09 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 08:08:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,229,1569308400"; d="scan'208";a="192564400"
Received: from irsmsx151.ger.corp.intel.com ([163.33.192.59])
 by orsmga008.jf.intel.com with ESMTP; 25 Oct 2019 08:08:04 -0700
Received: from irsmsx155.ger.corp.intel.com (163.33.192.3) by
 IRSMSX151.ger.corp.intel.com (163.33.192.59) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 25 Oct 2019 16:08:03 +0100
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.76]) by
 irsmsx155.ger.corp.intel.com ([169.254.14.193]) with mapi id 14.03.0439.000;
 Fri, 25 Oct 2019 16:08:02 +0100
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: multiple telemetry designs
Thread-Topic: multiple telemetry designs
Thread-Index: AQHVicBpLOT3TrTciEijW5fZBUhB6Kdp+H+AgAFLSoCAACcoYA==
Date: Fri, 25 Oct 2019 15:08:02 +0000
Message-ID: <DBA24EEE99A3B3489FF472F5E94DE6D7A30F9D72@IRSMSX101.ger.corp.intel.com>
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
 <493fa207-61eb-d393-0ea9-a8296a14d256@linux.vnet.ibm.com>
 <2C816F5E-C0F9-4C2F-899C-34B7CA984826@fuzziesquirrel.com>
In-Reply-To: <2C816F5E-C0F9-4C2F-899C-34B7CA984826@fuzziesquirrel.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNzcxOTNjM2EtMDVmOC00Zjg5LWFjNTktZjY1Yzg0OGRhNzBmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiR05SNXZWYXBSS0sweUFMbVduQ0liTzdiUzBNS1JsXC9QY1ZRSHdpTW1FenFkVWRRY25cL0FtWHhIalwvXC91TThlcVMifQ==
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
Cc: "Mihm, James" <james.mihm@intel.com>,
 Justin Thaler <thalerj@linux.vnet.ibm.com>,
 Shawn McCarney <shawnmm@linux.vnet.ibm.com>,
 Neeraj Ladkani <neladk@microsoft.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksIA0KDQpPdXIgZGVzaWduIGlzIHRhaWxvcmVkIHRvIHN1cHBvcnQgdGhlIFJlZGZpc2ggVGVs
ZW1ldHJ5IFNlcnZpY2UsIGJ1dCBpdCBpcyBub3QgbGltaXRlZCB0byBpdCBhbmQgZWl0aGVyLCB0
aGUgdGVsZW1ldHJ5IGNvbmZpZ3VyYXRpb24gYW5kIHByZXNlbnRhdGlvbiBpcyBkb25lIHZpYSB0
aGUgUmVkZmlzaC4gQWxzbywgdGhlIG1vbml0b3Jpbmcgc2VydmljZSBpcyBkZXNpZ25lZCB0byBz
dXBwb3J0IFJlZGZpc2ggdHJpZ2dlcnMgbGV2ZXJhZ2luZyB0aGUgUmVkZmlzaCBFdmVudCBTZXJ2
aWNlIGZvciBzZW5kaW5nIGV2ZW50cy4gDQoNCklmIHRoZSBjb2xsZWN0ZCBpcyB0byBleGlzdCBp
bmRlcGVuZGVudGx5IG9mIFJlZGZpc2ggYW5kIEQtQnVzIGl0IGlzIHBvc3NpYmxlIHRvIHVzZSBi
b3RoIHNvbHV0aW9ucy4gSSBoYXZlIHNvbWUgcXVlc3Rpb25zLCB0aG91Z2g6DQoxLiBIb3cgdGhl
IHRlbGVtZXRyeSBnYXRoZXJpbmcgd2lsbCBiZSBjb25maWd1cmVkIGJ5IHRoZSB1c2VyLCB3aGVu
IGNvbGxlY3RkIGlzIHVzZWQ/DQoyLiBXaGF0IGlzIHRoZSB1c2UgY2FzZSBmb3Igc3RvcmluZyBo
aXN0b3JpY2FsIHJlYWRpbmdzIGluIHRoZSBCTUMsIHVzaW5nIG5vbi12b2xhdGlsZSBzdG9yYWdl
IChvciBkaWQgSSBtaXN1bmRlcnN0b29kIHRoZSBycmQgZmlsZXMpPyANCg0KQXMgZm9yIG1lcmdp
bmcgdGhlIHR3byBwcm9wb3NhbHMsIHRoZSBjb21tb24gRC1CdXMgQVBJIGZvciB0aGUgdGVsZW1l
dHJ5IGJhY2stZW5kIChlaXRoZXIgY29sbGVjdGQgb3IgbW9uaXRvcmluZyBzZXJ2aWNlKSB3YXMg
d2hhdCBJIHRob3VnaHQgYWJvdXQgYXQgZmlyc3QuIE9mIGNvdXJzZSwgdGhlIGJhY2stZW5kIHdp
bGwgaGF2ZSB0byBzdXBwb3J0IG1ldHJpYyByZXBvcnQgYW5kIHRyaWdnZXJzIG1hbmFnZW1lbnQs
IGJlY2F1c2UgdGhlIGJtY3dlYiBpcyBvbmx5IHRoZSBwcmVzZW50YXRpb24gbGF5ZXIgKFJlZGZp
c2ggVGVsZW1ldHJ5IFNlcnZpY2UpIGZvciB0aGUgdGVsZW1ldHJ5IGRhdGEuIA0KDQpSZWdhcmRz
DQpQaW90cg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQnJhZCBCaXNob3Ag
W21haWx0bzpicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb21dIA0KU2VudDogRnJpZGF5LCBPY3Rv
YmVyIDI1LCAyMDE5IDI6NTkgUE0NClRvOiBPcGVuQk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmc+DQpDYzogSmFtZXMgRmVpc3QgPGphbWVzLmZlaXN0QGxpbnV4LmludGVsLmNv
bT47IE1hdHVzemN6YWssIFBpb3RyIDxwaW90ci5tYXR1c3pjemFrQGludGVsLmNvbT47IEt1biBZ
aSA8a3VueWlAZ29vZ2xlLmNvbT47IEp1c3RpbiBUaGFsZXIgPHRoYWxlcmpAbGludXgudm5ldC5p
Ym0uY29tPjsgTWlobSwgSmFtZXMgPGphbWVzLm1paG1AaW50ZWwuY29tPjsgTmVlcmFqIExhZGth
bmkgPG5lbGFka0BtaWNyb3NvZnQuY29tPjsgU2hhd24gTWNDYXJuZXkgPHNoYXdubW1AbGludXgu
dm5ldC5pYm0uY29tPg0KU3ViamVjdDogUmU6IG11bHRpcGxlIHRlbGVtZXRyeSBkZXNpZ25zDQoN
Cg0KPiBPbiBPY3QgMjQsIDIwMTksIGF0IDE6MTMgUE0sIFNoYXduIE1jQ2FybmV5IDxzaGF3bm1t
QGxpbnV4LnZuZXQuaWJtLmNvbT4gd3JvdGU6DQo+IA0KPiAqIENvdWxkIHRoZSB0d28gcHJvcG9z
YWxzIGJlIG1lcmdlZCwgd2l0aCBELUJ1cyBwcm92aWRpbmcgdGhlIHB1YmxpYyBBUEkgdG8gdGhl
IGRhdGE/ICBNYXliZSBzb21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nPyAgMSkgQ29udGludWUg
dG8gc3RvcmUgY3VycmVudCBzZW5zb3IgdmFsdWVzIG9uIEQtQnVzIHVzaW5nIHRoZSBleGlzdGlu
ZyBhcmNoaXRlY3R1cmUuICBTZW5zb3IgdmFsdWVzIGNvbWUgZnJvbSBhIHZhcmlldHkgb2Ygc291
cmNlcy4gIDIpIEFuIGFwcGxpY2F0aW9uIG9idGFpbnMgY3VycmVudCBzZW5zb3IgdmFsdWVzIGZy
b20gRC1CdXMgYW5kIHN0b3JlcyB0aGVtIHdpdGggdGltZXN0YW1wcyBpbiBSUkQgdG8gcHJvdmlk
ZSBlZmZpY2llbnQgaGlzdG9yeS90ZWxlbWV0cnkuICAzKSBBIG5ldyBELUJ1cyBpbnRlcmZhY2Uv
bWV0aG9kIGlzIGNyZWF0ZWQgdG8gb2J0YWluIHRoZSBoaXN0b3J5L3RlbGVtZXRyeSBkYXRhLiAg
NCkgYm1jd2ViIHVzZXMgdGhlIGN1cnJlbnQgRC1CdXMgaW50ZXJmYWNlcyBmb3IgdGhlIFNlbnNv
ciBVUklzIChhcyBpdCBkb2VzIHRvZGF5KSBhbmQgdXNlcyB0aGUgbmV3IEQtQnVzIGludGVyZmFj
ZS9tZXRob2QgZm9yIFRlbGVtZXRyeSBVUklzPw0KDQpJIHRoaW5rIHRoZXJlIGlzIHJvb20gZm9y
IGEgbWVyZ2VkL3NwbGl0IGRlc2lnbi4gIFRoZXJlIGFyZSB0d28gdXNlIGNhc2VzIHRvIGNvbnNp
ZGVyIHRob3VnaCB3aGlsZSB3ZSBmb3JtdWxhdGUgdGhhdC4NCg0KMSAtIEkgd2FudCB0byBleHBv
c2Ugc2Vuc29yIGRhdGEgd2l0aCBjb2xsZWN0ZCAoY29sbGVjdGQtYmluYXJ5KS4NCjIgLSBJIHdh
bnQgdG8gZXhwb3NlIHNlbnNvciBkYXRhIHdpdGggYm1jd2ViIChSZWRmaXNoKS4NCg0KSSB3b3Vs
ZCBzdWdnZXN0IHRoYXQgZm9yICMxLCBkYnVzIGJlIGF2b2lkZWQgYW5kIGdvIHJpZ2h0IHRvIHRo
ZSBzb3VyY2Ugb2YgdGhlIGRhdGEsIHdoYXRldmVyIHRoYXQgbWF5IGJlLiAgVGhhdCB3b3VsZCBi
ZSBtb3JlIHBlcmZvcm1hbnQgYW5kIGl0IGF2b2lkcyBkZXBlbmRlbmNpZXMgb24gT3BlbkJNQyBz
b2Z0d2FyZSB3aGljaCBtZWFucyBjb2xsZWN0ZCBwbHVnaW5zIHRoYXQgYXJlIHdyaXR0ZW4gd291
bGQgaGF2ZSBhIGNoYW5jZSBhdCBiZWluZyBhY2NlcHRlZCBpbiB1cHN0cmVhbSBjb2xsZWN0ZC4g
IFRoaXMgd291bGQgYmUgaXJyZXNwZWN0aXZlIG9mIGhvdyAjMiBpcyBkZXNpZ25lZCBhbmQgaW1w
bGVtZW50ZWQuDQoNCkkgZG9u4oCZdCB0aGluayBJIG5lZWQgIzEgdGhvdWdoLiAgRG9lcyBhbnlv
bmUgcGxhbiBvbiBkb2luZyAjMSBvbiB0aGVpciBCTUM/ICBXaGVuIEkgb3JpZ2luYWxseSBzdWdn
ZXN0ZWQgY29sbGVjdGQsIGl0IHdhcyBiZWNhdXNlIEkgdGhvdWdodDoNCg0KMSAtIGNvbGxlY3Rk
IGlzIGEgcHJlZXhpc3RpbmcgaW1wbGVtZW50YXRpb24gb2YgdGhlIHByb3Bvc2VkIGN1c3RvbSBt
b25pdG9yaW5nIHNlcnZpY2UuLi4NCg0KdGhlcmVmb3JlDQoNCjIgLSBpdCB3b3VsZCBzYXZlIGVm
Zm9ydCBhbmQgYmUgYSBzbWFsbGVyIG1haW50ZW5hbmNlIGJ1cmRlbiB0byB1c2UgcHJlLWV4aXN0
aW5nIHNvZnR3YXJlIHJhdGhlciB0aGFuIHdyaXRpbmcgaXQgZnJvbSBzY3JhdGNoLg0KDQpJdCBp
cyBjZXJ0YWlubHkgcG9zc2libGUgdGhvdWdoIHRoYXQgY29sbGVjdGQgY2Fu4oCZdCBiZSBtYWRl
IHRvIGZpdCB0aGUgYmlsbCBvciBJIGFtIGltYWdpbmluZyBtb3JlIG9mIGFuIG92ZXJsYXAgYmV0
d2VlbiB0aGUgY3VzdG9tIG1vbml0b3Jpbmcgc2VydmljZSBhbmQgYSBjb2xsZWN0ZCBiYXNlZCBv
bmUgdGhhbiB0aGVyZSByZWFsbHkgaXMuDQoNCnRoeCAtIGJyYWQNCg==
