Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3811AEF47
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 18:10:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SVPX0sDVzF1LP
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 02:10:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SVNl2S6xzF12S
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 02:09:52 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2019 09:09:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,490,1559545200"; d="scan'208";a="178723592"
Received: from irsmsx152.ger.corp.intel.com ([163.33.192.66])
 by orsmga008.jf.intel.com with ESMTP; 10 Sep 2019 09:09:48 -0700
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.129]) by
 IRSMSX152.ger.corp.intel.com ([169.254.6.150]) with mapi id 14.03.0439.000;
 Tue, 10 Sep 2019 17:09:48 +0100
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: Kun Yi <kunyi@google.com>
Subject: Collectd and librrd based telemetry collection
Thread-Topic: Collectd and librrd based telemetry collection
Thread-Index: AdVn8hI6VTom6OxFT9auOJ1Mva+TIA==
Date: Tue, 10 Sep 2019 16:09:47 +0000
Message-ID: <DBA24EEE99A3B3489FF472F5E94DE6D789F95D45@IRSMSX101.ger.corp.intel.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjE2MWNkYzQtYWNiNC00YzI3LTgwOWEtY2Y4ZmI2NTg4ZGNjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiaFlBQzhWVmJnNDBidmZzcG5QamIzVEZ1Y08weDJjXC8wbjdIcEM5dG1pb0VGczdzcXpCQlpEeFpkUWtGN1VqXC9BIn0=
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Q2hhbmdlZCB0aGUgc3ViamVjdCwgc28gdGhlIGUtbWFpbCB3b24ndCBiZSBmaWx0ZXJlZCBvdXQu
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBNYXR1c3pjemFrLCBQaW90cg0K
U2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDEwLCAyMDE5IDE6MTMgUE0NClRvOiAnS3VuIFlpJyA8
a3VueWlAZ29vZ2xlLmNvbT4NCkNjOiBPcGVuQk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96
bGFicy5vcmc+DQpTdWJqZWN0OiBSRTogW0VOQ1JZUFRFRCBBVFRBQ0hNRU5UXSBDb2xsZWN0ZCBh
bmQgbGlicnJkIGJhc2VkIHRlbGVtZXRyeSBjb2xsZWN0aW9uDQoNClN1cmUsDQoNClNvcnJ5IGZv
ciBpbmNvbnZlbmllbmNlLCBidXQgSSBoYWQgdHJvdWJsZSB3aXRoIG15IGNvcnBvcmF0ZSBlLW1h
aWwuDQpIZXJlIGlzIHRoZSBwcmV2aW91cyBtZXNzYWdlOg0KDQpIaSwNCg0KSeKAmXZlIHJldmll
d2VkIHlvdXIgZGVzaWduIGZvciBPcGVuQk1DIHRlbGVtZXRyeSBmcmFtZXdvcmsgKGh0dHBzOi8v
Z2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVuYm1jL2RvY3MvKy8yMjI1NykuIEkgaGF2
ZSBmZXcgcXVlc3Rpb25zIGFib3V0IHVzZSBjYXNlczoNCjEuIFdoYXQgaXMgdGhlIHVzZSBjYXNl
IGZvciBzdG9yaW5nIG1ldHJpY3Mgb24gQk1D4oCZcyBub24tdm9sYXRpbGUgc3RvcmFnZT8gSXMg
dGhpcyBvbmx5IHRvIGVuc3VyZSB0aGF0IG5vIHRlbGVtZXRyeSBpcyBsb3N0IGR1cmluZyByZXNl
dHM/DQoyLiBZb3Ugd3JvdGUgdGhhdCBjb2xsZWN0ZCBzdXBwb3J0cyBzZW5kaW5nIHRlbGVtZXRy
eSBvdmVyIHRoZSBuZXR3b3JrIHRvIGFub3RoZXIgaW5zdGFuY2Ugb2YgY29sbGVjdGQsIGhvd2V2
ZXIsIHRoaXMgaXMgc2ltaWxhciBmdW5jdGlvbmFsaXR5IHRoYXQgUmVkZmlzaCBUZWxlbWV0cnkg
U2VydmljZSBhbHJlYWR5IHN1cHBvcnRzIChtZXRyaWMgcmVwb3J0IHN0cmVhbWluZyBieSBzZXR0
aW5nIHByb3BlciBSZXBvcnRBY3Rpb25zIGluIG1ldHJpYyByZXBvcnQgZGVmaW5pdGlvbikuIElz
IHRoZXJlIGFsdGVybmF0aXZlIHVzZXMtY2FzZSBmb3IgdGhlIGNvbGxlY3RkPw0KDQoNCg0KRnJv
bTogS3VuIFlpIFttYWlsdG86a3VueWlAZ29vZ2xlLmNvbV0NClNlbnQ6IE1vbmRheSwgU2VwdGVt
YmVyIDksIDIwMTkgODoxNiBQTQ0KVG86IE1hdHVzemN6YWssIFBpb3RyIDxwaW90ci5tYXR1c3pj
emFrQGludGVsLmNvbT4NCkNjOiBPcGVuQk1DIE1haWxsaXN0IDxvcGVuYm1jQGxpc3RzLm96bGFi
cy5vcmc+DQpTdWJqZWN0OiBSZTogW0VOQ1JZUFRFRCBBVFRBQ0hNRU5UXSBDb2xsZWN0ZCBhbmQg
bGlicnJkIGJhc2VkIHRlbGVtZXRyeSBjb2xsZWN0aW9uDQoNCmhpIFBpb3RyLA0KDQpTb3JyeSB0
aGlzIGdvdCBwcmV2aW91cyBzZW50IHRvIHNwYW0gaW4gbXkgaW5ib3gsIGFuZCB0aGUgbWVzc2Fn
ZSBnb3QgdHVybmVkIGludG8gYW4gYXR0YWNobWVudCB0aGF0IGdvdCByZW1vdmVkLiBDb3VsZCB5
b3UgcmVzZW5kIHRoZSBtZXNzYWdlPw0KDQpPbiBNb24sIFNlcCAyLCAyMDE5IGF0IDI6NDYgQU0g
PHBpb3RyLm1hdHVzemN6YWtAaW50ZWwuY29tPiB3cm90ZToNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KSW50ZWwg
VGVjaG5vbG9neSBQb2xhbmQgc3AuIHogby5vLg0KdWwuIFNsb3dhY2tpZWdvIDE3MyB8IDgwLTI5
OCBHZGFuc2sgfCBTYWQgUmVqb25vd3kgR2RhbnNrIFBvbG5vYyB8IFZJSSBXeWR6aWFsIEdvc3Bv
ZGFyY3p5IEtyYWpvd2VnbyBSZWplc3RydSBTYWRvd2VnbyAtIEtSUyAxMDE4ODIgfCBOSVAgOTU3
LTA3LTUyLTMxNiB8IEthcGl0YWwgemFrbGFkb3d5IDIwMC4wMDAgUExOLg0KDQpUYSB3aWFkb21v
c2Mgd3JheiB6IHphbGFjem5pa2FtaSBqZXN0IHByemV6bmFjem9uYSBkbGEgb2tyZXNsb25lZ28g
YWRyZXNhdGEgaSBtb3plIHphd2llcmFjIGluZm9ybWFjamUgcG91Zm5lLiBXIHJhemllIHByenlw
YWRrb3dlZ28gb3RyenltYW5pYSB0ZWogd2lhZG9tb3NjaSwgcHJvc2lteSBvIHBvd2lhZG9taWVu
aWUgbmFkYXdjeSBvcmF6IHRyd2FsZSBqZWogdXN1bmllY2llOyBqYWtpZWtvbHdpZWsgcHJ6ZWds
YWRhbmllIGx1YiByb3pwb3dzemVjaG5pYW5pZSBqZXN0IHphYnJvbmlvbmUuDQpUaGlzIGUtbWFp
bCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBtYXRlcmlhbCBm
b3IgdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykuIElmIHlvdSBhcmUg
bm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRoZSBzZW5kZXIgYW5k
IGRlbGV0ZSBhbGwgY29waWVzOyBhbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlvbiBieSBvdGhlcnMg
aXMgc3RyaWN0bHkgcHJvaGliaXRlZC4NCg0KDQoNCi0tDQpSZWdhcmRzLA0KS3VuDQo=
