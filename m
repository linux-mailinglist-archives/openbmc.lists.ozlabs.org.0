Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD22CB36CE
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 11:04:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46X0gD3Jg7zF4Rv
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 19:04:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=kuiying.wang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46X0fb1g8kzDsbt
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 19:03:58 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Sep 2019 02:03:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,512,1559545200"; d="scan'208";a="187091400"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga007.fm.intel.com with ESMTP; 16 Sep 2019 02:03:55 -0700
Received: from fmsmsx101.amr.corp.intel.com (10.18.124.199) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 16 Sep 2019 02:03:55 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 fmsmsx101.amr.corp.intel.com (10.18.124.199) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 16 Sep 2019 02:03:54 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.113]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.53]) with mapi id 14.03.0439.000;
 Mon, 16 Sep 2019 17:03:52 +0800
From: "Wang, Kuiying" <kuiying.wang@intel.com>
To: Kun Yi <kunyi@google.com>, CS20 CHLi30 <CHLI30@nuvoton.com>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>
Subject: RE: Port 80H Snoop
Thread-Topic: Port 80H Snoop
Thread-Index: AQHVaY5Vdok8Nstag0e+rCmCGjpfN6cuB26Q
Date: Mon, 16 Sep 2019 09:03:51 +0000
Message-ID: <959CAFA1E282D14FB901BE9A7BF4E7724E527E36@shsmsx102.ccr.corp.intel.com>
References: <A9898780-E998-4D00-98D6-70DD8BD4C69E@fb.com>
 <HK0PR03MB466066F3FD37BB68F833E638CFB00@HK0PR03MB4660.apcprd03.prod.outlook.com>
 <F87104B2-56AC-479E-BEF0-8B764355D6AF@fb.com>
 <HK0PR03MB46604880F50B30AF3789BE8CCFB00@HK0PR03MB4660.apcprd03.prod.outlook.com>
 <CAGMNF6VdQzBZCRZcAV=j8W3vg-sgUjS1QjSUiAJLEmKHqowX7A@mail.gmail.com>
In-Reply-To: <CAGMNF6VdQzBZCRZcAV=j8W3vg-sgUjS1QjSUiAJLEmKHqowX7A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDViODNhZDUtNGUyMS00YWFlLTgyZGUtZTBkMzc0OThmYWVhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZ1VEZVNxUm9HalB6WVJhQWNoSlQ2eGxBNVwvSUora21VQXFSYnBMYmhPSkcxbTFpNGtGXC9rRGZ1WHk5ek15S0JjIn0=
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: request-justification,no-action
x-originating-ip: [10.239.127.40]
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Wilfred Smith <wilfredsmith@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

WWVzLCBJIGhhdmUgYSByZXBvIGFuZCBwYXRjaGVzIGZvciBwb3N0LWNvZGUtbWFuYWdlciBiYXNl
ZCBvbiBwaG9zcGhvci1ob3N0LXBvc3RkDQoNCmh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVj
dC54eXovIy9jL29wZW5ibWMvcGhvc3Bob3ItcG9zdC1jb2RlLW1hbmFnZXIvKy8xODUwMy8NCmh0
dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovIy9jL29wZW5ibWMvcGhvc3Bob3ItZGJ1
cy1pbnRlcmZhY2VzLysvMjA0NzQvIA0KDQpUaGFua3MsDQpLdWl5aW5nLg0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS3VuIFlpIFttYWlsdG86a3VueWlAZ29vZ2xlLmNvbV0g
DQpTZW50OiBGcmlkYXksIFNlcHRlbWJlciAxMywgMjAxOSAxOjIwIEFNDQpUbzogQ1MyMCBDSExp
MzAgPENITEkzMEBudXZvdG9uLmNvbT47IFdhbmcsIEt1aXlpbmcgPGt1aXlpbmcud2FuZ0BpbnRl
bC5jb20+OyBqYXNvbi5tLmJpbGxzQGxpbnV4LmludGVsLmNvbQ0KQ2M6IFdpbGZyZWQgU21pdGgg
PHdpbGZyZWRzbWl0aEBmYi5jb20+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6
IFJlOiBQb3J0IDgwSCBTbm9vcA0KDQpIaSBXaWxmcmVkL1RpbSwNCg0KT24gV2VkLCBTZXAgMTEs
IDIwMTkgYXQgODo0NyBQTSBDUzIwIENITGkzMCA8Q0hMSTMwQG51dm90b24uY29tPiB3cm90ZToN
Cj4NCj4gSGkgV2lsZnJlZCwNCj4NCj4gWWVzLCBJIGFsc28gbW9kaWZpZWQgZXhhbXBsZSBjb2Rl
IHRvIHRyYWNrIHRoZSBoaXN0b3J5IG9mIHRoZSBwb3J0IDgwaCBzbm9vcCB2YWx1ZXMuDQo+IFRo
ZSBoaXN0b3J5IHdpbGwgYmUgc2F2ZWQgdG8gZmlsZSB3aXRoIHRpbWVzdGFtcCBuYW1lIGZvciBI
b3N0IE9OLCBPRkYsIGFuZCBlbnRlciBCSU9TIGNvbmRpdGlvbnMuDQo+IFQNCj4gaGlzIHBhdGNo
IGlzIGp1c3QgYW4gZXhwZXJpbWVudCBoYXJkIGNvZGVkIHNvbWUgc3BlY2lmaWMgUG9ydDgwSCBj
b2RlcyBmb3IgbW9uaXRvcmluZyBCSU9TIHdlIHVzZWQuDQo+IFRoZXNlIGNvZGUgc2hvdWxkIGJl
IGNvbmZpZ3VyYWJsZSBpbiBhIG1hdHVyZSBpbXBsZW1lbnRhdGlvbiwgc3VjaCBhcyBHVUkvUkVT
VCBBUEkgZW50cmllcyBmb3IgZG93bmxvYWRpbmcvdmlld2luZyB0aGVzZSBsb2dzLCBidXQgbm90
IGRvbmUgZHVlIHRvIHByaW9yaXR5IGNoYW5nZS4NCj4NCj4gVGhlIGxpbmsgb2YgcGF0Y2ggZm9y
IHlvdSByZWZlciBpdC4gVGhhbmtzLg0KPiBodHRwczovL2dpdGh1Yi5jb20vTnV2b3Rvbi1Jc3Jh
ZWwvb3BlbmJtYy9ibG9iL21hc3Rlci9tZXRhLWV2Yi9tZXRhLWV2DQo+IGItbnV2b3Rvbi9tZXRh
LWV2Yi1ucGNtNzUwL3JlY2lwZXMtcGhvc3Bob3IvaG9zdC9waG9zcGhvci1ob3N0LXBvc3RkLzAN
Cj4gMDAxLXN1cHBvcnQtbnBjbTd4eC1scGMtYnBjMC1hbmQtc25vb3Blci5wYXRjaA0KDQpUaGF0
J3MgbmljZSwgSSBkaWQndCBrbm93IGl0IGV4aXN0ZWQuDQoNCj4NCj4gQmVzdCByZWdhcmRzLA0K
PiBUaW0NCj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2lsZnJlZCBT
bWl0aCBbbWFpbHRvOndpbGZyZWRzbWl0aEBmYi5jb21dDQo+IFNlbnQ6IFRodXJzZGF5LCBTZXB0
ZW1iZXIgMTIsIDIwMTkgOTo1NiBBTQ0KPiBUbzogQ1MyMCBDSExpMzAgPENITEkzMEBudXZvdG9u
LmNvbT4NCj4gQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KPiBTdWJqZWN0OiBSZTogUG9y
dCA4MEggU25vb3ANCj4NCj4gVGltLCBNYW55IHRoYW5rcy4gQXJlIHlvdSBhbHNvIHByb3ZpZGlu
ZyB0aGUgYWJpbGl0eSB0byB0cmFjayB0aGUgaGlzdG9yeSBvZiB0aGUgcG9ydCA4MGggc25vb3Ag
dmFsdWVzPyBJZiBub3QsIGFyZSB5b3UgYXdhcmUgb2Ygc29tZW9uZSBlbHNlIGhhdmluZyBkb25l
IHNvPw0KDQpUaGUgYWJpbGl0eSB0byBzdG9yZSBQT1NUIGNvZGVzIGhhcyBiZWVuIG9uIG15IGJh
Y2tsb2cgZm9yIHF1aXRlIGEgd2hpbGUuIEknZCBiZSBoYXBweSB0byByZXZpZXcgcGF0Y2hlcy9w
cm9wb3NhbHMgdG8gaW50ZWdyYXRlIHRoZSBmdW5jdGlvbmFsaXR5IGludG8gT3BlbkJNQy4NCg0K
SSB0aGluayBLdWl5aW5nIGhhZCBzb21lIHBhdGNoZXMgdG8gZW5hYmxlIHRoaXM6DQpodHRwczov
L2dlcnJpdC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9waG9zcGhvci1wb3N0LWNvZGUt
bWFuYWdlci8rLzE4NTAzLA0KYnV0IGl0J3Mgbm90IG1lcmdlZCB5ZXQuICtLdWl5aW5nIGFuZCBK
YXNvbiBtaWdodCBoYXZlIG1vcmUgaW5mb3JtYXRpb24uDQoNCj4NCj4gV2lsZnJlZA0KPg0KPiA+
IE9uIFNlcCAxMSwgMjAxOSwgYXQgNjo1MiBQTSwgQ1MyMCBDSExpMzAgPENITEkzMEBudXZvdG9u
LmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIZWxsbyBXaWxmcmVkIFNtaXRoLA0KPiA+DQo+ID4gWW91
IGNhbiByZWZlciB0aGUgbW9kdWxlIHBob3NwaG9yLWhvc3QtcG9zdGQgYW5kIGFkZCBmaWxlIHJl
Y2lwZXMtcGhvc3Bob3IvaG9zdC9waG9zcGhvci1ob3N0LXBvc3RkXyUuYmJhcHBlbmQgZm9yIGNo
YW5naW5nIHlvdXIgc25vb3AgZGV2aWNlLg0KPiA+IChleDogU05PT1BfREVWSUNFID0gIm5wY203
eHgtbHBjLWJwYzAiKQ0KPiA+DQo+ID4gVGhlbiwgeW91IGNhbiBleGVjdXRlICJzbm9vcGVyIiBw
cm9ncmFtIGluIHNoZWxsIHByb21wdCBhbmQgeW91IHdpbGwgc2VlIHRoZSBQT1NUIGNvZGUgYmUg
cHJpbnRlZCBvbiBjb25zb2xlLg0KPiA+IFlvdSBjYW4gcmVmZXIgdGhlIGF0dGFjaCBmaWxlIGFi
b3V0IHNjcmVlbnNob3QgZm9yIHRoZSByZXN1bHQgb2Ygc25vb3Blci4gVGhhbmtzLg0KPiA+DQo+
ID4gQmVzdCByZWdhcmRzLA0KPiA+IFRpbQ0KPg0KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiAgVGhlIHByaXZp
bGVnZWQgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIGVtYWlsIGlz
IGludGVuZGVkIGZvciB1c2Ugb25seSBieSB0aGUgYWRkcmVzc2VlcyBhcyBpbmRpY2F0ZWQgYnkg
dGhlIG9yaWdpbmFsIHNlbmRlciBvZiB0aGlzIGVtYWlsLiBJZiB5b3UgYXJlIG5vdCB0aGUgYWRk
cmVzc2VlIGluZGljYXRlZCBpbiB0aGlzIGVtYWlsIG9yIGFyZSBub3QgcmVzcG9uc2libGUgZm9y
IGRlbGl2ZXJ5IG9mIHRoZSBlbWFpbCB0byBzdWNoIGEgcGVyc29uLCBwbGVhc2Uga2luZGx5IHJl
cGx5IHRvIHRoZSBzZW5kZXIgaW5kaWNhdGluZyB0aGlzIGZhY3QgYW5kIGRlbGV0ZSBhbGwgY29w
aWVzIG9mIGl0IGZyb20geW91ciBjb21wdXRlciBhbmQgbmV0d29yayBzZXJ2ZXIgaW1tZWRpYXRl
bHkuIFlvdXIgY29vcGVyYXRpb24gaXMgaGlnaGx5IGFwcHJlY2lhdGVkLiBJdCBpcyBhZHZpc2Vk
IHRoYXQgYW55IHVuYXV0aG9yaXplZCB1c2Ugb2YgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIG9m
IE51dm90b24gaXMgc3RyaWN0bHkgcHJvaGliaXRlZDsgYW5kIGFueSBpbmZvcm1hdGlvbiBpbiB0
aGlzIGVtYWlsIGlycmVsZXZhbnQgdG8gdGhlIG9mZmljaWFsIGJ1c2luZXNzIG9mIE51dm90b24g
c2hhbGwgYmUgZGVlbWVkIGFzIG5laXRoZXIgZ2l2ZW4gbm9yIGVuZG9yc2VkIGJ5IE51dm90b24u
DQoNCg0KDQotLQ0KUmVnYXJkcywNCkt1bg0K
