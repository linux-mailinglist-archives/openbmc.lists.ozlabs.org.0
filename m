Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E4BE2C79
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 10:49:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zLWt60B8zDqRv
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 19:49:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=piotr.matuszczak@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zLVv4FrrzDqQH
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 19:48:17 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Oct 2019 01:48:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,224,1569308400"; d="scan'208";a="197671145"
Received: from irsmsx106.ger.corp.intel.com ([163.33.3.31])
 by fmsmga007.fm.intel.com with ESMTP; 24 Oct 2019 01:48:12 -0700
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.76]) by
 IRSMSX106.ger.corp.intel.com ([169.254.8.185]) with mapi id 14.03.0439.000;
 Thu, 24 Oct 2019 09:48:11 +0100
From: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
To: Justin Thaler <thalerj@linux.vnet.ibm.com>, James Feist
 <james.feist@linux.intel.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "kunyi@google.com" <kunyi@google.com>, "apparao.puli@linux.intel.com"
 <apparao.puli@linux.intel.com>
Subject: RE: multiple telemetry designs
Thread-Topic: multiple telemetry designs
Thread-Index: AQHVicBpLOT3TrTciEijW5fZBUhB6KdobVAAgAACRgCAAC2GAIAA2c2g
Date: Thu, 24 Oct 2019 08:48:11 +0000
Message-ID: <DBA24EEE99A3B3489FF472F5E94DE6D7A30F946F@IRSMSX101.ger.corp.intel.com>
References: <D1177195-CDC9-4BB0-B9DE-6FC99B7ADE31@fuzziesquirrel.com>
 <dd81fb28-4d01-8726-9b16-81a677eb3e16@linux.intel.com>
 <8998b51b-4e67-738e-becd-63c26ea626be@linux.intel.com>
 <d69d24c7-d07f-35d4-1395-859a0df2a05a@linux.vnet.ibm.com>
In-Reply-To: <d69d24c7-d07f-35d4-1395-859a0df2a05a@linux.vnet.ibm.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNmY0MjEwMDAtZWM1Ny00NmJlLTliYmQtNDA5Njk0MGY1NzVkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMXFKWWp2T1VUSDdvb0dEeTl4Ylg0eFFWeHB4RThXN2YwWXgrbEdIanMrMFVFRTM4N3p6Qk9BK095UVZlV0pvciJ9
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
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "neladk@microsoft.com" <neladk@microsoft.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

QXMgZm9yIHRoZSB0d28gdGVsZW1ldHJ5IGRlc2lnbiBwcm9wb3NhbHM6DQpodHRwczovL2dlcnJp
dC5vcGVuYm1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9kb2NzLysvMjIyNTcNCmh0dHBzOi8vZ2Vy
cml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVuYm1jL2RvY3MvKy8yNDM1Nw0KSSB0YWxrZWQg
d2l0aCBLdW4gYW5kIHdlIGFncmVlZCB0aGF0IGEgY29tbW9uIGJtY3dlYiBpbnRlcmZhY2Ugd291
bGQgYmUgZ3JlYXQgaW4gb3JkZXIgdG8gYmUgYWJsZSB0byBzdXBwb3J0IGVpdGhlciB0aGUgbW9u
aXRvcmluZyBzZXJ2aWNlIG9yIHRoZSBjb2xsZWN0ZC4gSW4gb3JkZXIgdG8gdG8gZG8gdGhhdCBj
b2xsZWN0ZCB3aWxsIGhhdmUgdG8gYmUgbW9kaWZpZWQgdG8gZXhwb3NlIEQtQnVzIGludGVyZmFj
ZSBvciBibWN3ZWIgd2lsbCBoYXZlIHRvIHN1cHBvcnQgbGlicmFyaWVzIHRvIGhhbmRsZSBjb2xs
ZWN0ZCBkaXJlY3RseS4gV2UgYXQgSW50ZWwgcHJlZmVyIEQtQnVzIGZvciB0aGUgT3BlbkJNQyBh
cmNoaXRlY3R1cmUgY29uc2lzdGVuY3kuIA0KQXMgZm9yIHRoZSBpbXBsZW1lbnRhdGlvbiwgd2Ug
aGF2ZSBtb25pdG9yaW5nIHNlcnZpY2UgYW5kIFJlZGZpc2ggdGVsZW1ldHJ5IHNlcnZpY2UgaW1w
bGVtZW50ZWQgKGN1cnJlbnRseSB3aXRob3V0IHRyaWdnZXJzIHN1cHBvcnQpLCBob3dldmVyIGl0
IHJlcXVpcmUgc29tZSByZWZhY3RvcmluZyB0byBiZSBwcm9kdWN0aW9uIGNvZGUgcXVhbGl0eS4g
DQoNClRoZSBSZWRmaXNoIEV2ZW50IFNlcnZpY2UgKGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJv
amVjdC54eXovYy9vcGVuYm1jL2RvY3MvKy8yNDc0OSkgaXMgc29tZXRoaW5nIGRpZmZlcmVudCB0
aGFuIHRlbGVtZXRyeSBzZXJ2aWNlLCBzbyBJIHdvdWxkbid0IGNvbnNpZGVyIGl0IGFzIHRoaXJk
IHRlbGVtZXRyeSBkZXNpZ24uIEl0IGlzIHJhdGhlciBwcmVwYXJlZCB0byBjb29wZXJhdGUgd2l0
aCB0aGUgUmVkZmlzaCBUZWxlbWV0cnkgU2VydmljZSBhbmQgdGhlcmUgaXMgcmVmZXJlbmNlIHRv
IHRlbGVtZXRyeSBkZXNpZ24gaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29w
ZW5ibWMvZG9jcy8rLzI0MzU3IC4gDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBKdXN0aW4gVGhhbGVyIFttYWlsdG86dGhhbGVyakBsaW51eC52bmV0LmlibS5jb21dIA0KU2Vu
dDogV2VkbmVzZGF5LCBPY3RvYmVyIDIzLCAyMDE5IDEwOjMwIFBNDQpUbzogSmFtZXMgRmVpc3Qg
PGphbWVzLmZlaXN0QGxpbnV4LmludGVsLmNvbT47IEJyYWQgQmlzaG9wIDxicmFkbGV5YkBmdXp6
aWVzcXVpcnJlbC5jb20+OyBNYXR1c3pjemFrLCBQaW90ciA8cGlvdHIubWF0dXN6Y3pha0BpbnRl
bC5jb20+OyBrdW55aUBnb29nbGUuY29tOyBhcHBhcmFvLnB1bGlAbGludXguaW50ZWwuY29tDQpD
YzogbmVsYWRrQG1pY3Jvc29mdC5jb207IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgTWlobSwg
SmFtZXMgPGphbWVzLm1paG1AaW50ZWwuY29tPg0KU3ViamVjdDogUmU6IG11bHRpcGxlIHRlbGVt
ZXRyeSBkZXNpZ25zDQoNCg0KDQpPbiAxMC8yMy8xOSAxMjo0NyBQTSwgSmFtZXMgRmVpc3Qgd3Jv
dGU6DQo+IE9uIDEwLzIzLzE5IDEwOjM5IEFNLCBKYW1lcyBGZWlzdCB3cm90ZToNCj4+IE9uIDEw
LzIzLzE5IDk6MzggQU0sIEJyYWQgQmlzaG9wIHdyb3RlOg0KPj4+IFRoZXJlIGFyZSB0d28gdGVs
ZW1ldHJ5IC8gbWV0cmljIGRlc2lnbnMgdW5kZXIgcmV2aWV3IHJpZ2h0IG5vdzoNCg0KVGhlcmUn
cyBhIGZvdXJ0aCBvcHRpb24gdGhhdCBjYW4gYWxzbyBiZSB1c2VkLCBidXQgbW9yZSB0aGFuIGp1
c3Qgc2Vuc29yIHJlYWRpbmdzLiBUaGlzIGlzbid0IHJlZGZpc2ggY29tcGxpYW50IGFuZCByZWxp
ZXMgb24gc2VjdXJlIHdlYnNvY2tldHMgaG93ZXZlci4NCg0KaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9yZXN0LWFwaS5tZCNldmVudC1zdWJzY3JpcHRpb24tcHJv
dG9jb2wNCg0KPiANCj4gSSd2ZSBiZWVuIGluZm9ybWVkIHRoZXJlIGFyZSBhY3R1YWxseSAzOg0K
PiANCj4gaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMvZG9jcy8r
LzI0NzQ5DQo+IA0KPiBBZGRlZCBBcHB1IHRvIHRoaXMgY29udmVyc2F0aW9uIGFzIHdlbGwuDQo+
IA0KPiANCj4+Pg0KPj4+IGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVu
Ym1jL2RvY3MvKy8yMjI1Nw0KPj4+IGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXov
Yy9vcGVuYm1jL2RvY3MvKy8yNDM1Nw0KPj4+DQo+Pj4gSSB3b3VsZCBsaWtlIHRvIHNlZSBvbmUg
b3IgYm90aCBvZiB0aGVtIG1lcmdlZC7CoCBOZWl0aGVyIHNlZW0gdG8gDQo+Pj4gaGF2ZSBhbnkg
c3VwcG9ydOKApi50aGVyZSBpcyBhIHNpbmdsZSArMSBvbiB0aGUgbGF0dGVyIHJldmlldyBmcm9t
IA0KPj4+IFNoYXduIE1jQ2FybmV5LsKgIElmIHlvdSBzdXBwb3J0IG9uZSBvZiB0aGVzZSBkZXNp
Z25zLCBwbGVhc2UgZ28gDQo+Pj4gcmV2aWV3IGl0IGFuZCBpbmRpY2F0ZSB5b3VyIHN1cHBvcnQu
DQo+Pg0KPj4gSXQgbG9va3MgbGlrZSBLdW4gaGFzICsxZWQgUGlvdHIncyBkZXNpZ24gYXMgd2Vs
bCwgbm90IHN1cmUgaWYgdGhhdCANCj4+IG1lYW5zIHdlIGNhbiBnbyB3aXRoIG9uZSBkZXNpZ24/
DQo+Pg0KPj4+DQo+Pj4gSSBhbHNvIGNhbuKAmXQgZmlndXJlIG91dCB3aGF0IHRoZSBwYXRoIGZv
cndhcmQgZm9yIE9wZW5CTUMgaXMuwqAgTWF5YmUgDQo+Pj4gdG8gc3RhcnQgd2l0aCwgd2UgY291
bGQgYWxsIGxldmVsIHNldCBvbiB3aGVyZSB3ZSBhcmUgYXQgd2l0aCBvdXINCj4+PiB0aGlua2lu
ZzoNCj4+Pg0KPj4+IEt1bjogSG93IGZhciBhbG9uZyBhcmUgeW91IGluIHRoZSBpbXBsZW1lbnRh
dGlvbiBvZiB5b3VyIHByb3Bvc2FsPw0KPj4+IFBpb3RyOiBIb3cgZmFyIGFsb25nIGFyZSB5b3Ug
aW4gdGhlIGltcGxlbWVudGF0aW9uIG9mIHlvdXIgcHJvcG9zYWw/DQo+Pj4gSmFtZXM6IE9wZW5C
TUMgY2FuIHN1cHBvcnQgb25lIG9yIGJvdGggcHJvcG9zYWxzLsKgIElmIHdlIHN1cHBvcnQgDQo+
Pj4gYm90aCwgdGhpcyBtZWFucyBtdWx0aXBsZSBpbXBsZW1lbnRhdGlvbnMgZm9yIHRoZSBzYW1l
IHRoaW5nIGluIA0KPj4+IGJtY3dlYi7CoCBPbmUgdGhhdCBnZXRzIGRhdGEgZnJvbSBkYnVzIG9i
amVjdHMsIGFuZCBhbm90aGVyIHRoYXQgZ2V0cyANCj4+PiBpdCBmcm9tIGxpYnJyZC7CoCBBcyB0
aGUgbWFpbnRhaW5lciBvZiBibWN3ZWIgYXJlIHlvdSBvcGVuIHRvIA0KPj4+IGFjY2VwdGluZyBv
bmUgb3IgYm90aCBvZiB0aGVzZSBvcHRpb25zPw0KPj4NCj4+IFdpdGggMCBwcmV2aW91cyBrbm93
bGVkZ2UsIEkgd291bGQgc3VnZ2VzdCB1c2luZyBhIHdheSB0aGF0IHdvcmtzIA0KPj4gd2l0aCBw
cmV2aW91cyBPQk1DIHByYWN0aWNlcywgYW5kIHRoYXQgaXMgdXNpbmcgZGJ1cy4gSWYgdGhlcmUg
aGFzIHRvIA0KPj4gYmUgMiBzZXBhcmF0ZSBkZXNpZ25zLCB0aGVuIGlmIGJvdGggcHJvZHVjZSB0
aGUgc2FtZSBkLWJ1cyANCj4+IGludGVyZmFjZXMsIGl0IHNob3VsZG4ndCBtYXR0ZXIgdG8gYm1j
d2ViIHdoaWNoIG9uZSBpcyBiZWluZyB1c2VkLiANCj4+IFRoYXQgYmVpbmcgc2FpZCwgaWYgdGhp
cyBkb2Vzbid0IHdvcmsgZm9yIHNvbWUgcmVhc29uLCB3ZSd2ZSB1c2VkIA0KPj4gY29tcGlsZSBz
d2l0Y2hlcyBpbiB0aGUgcGFzdCwgYWx0aG91Z2ggdGhpcyB3b3VsZCBiZSB0aGUgbGVhc3QgcHJl
ZmVyYWJsZSBvcHRpb24uDQo+PiBUcnV0aGZ1bGx5IEkgaGF2ZW4ndCBsb29rZWQgYXQgdGhlc2Ug
ZGVzaWducyB5ZXQgYXMgSSd2ZSBvbmx5IA0KPj4gcmVjZW50bHkgdGFrZW4gYSBsYXJnZXIgcm9s
ZSBpbiBibWN3ZWIgcmV2aWV3cywgc28gSSdsbCB0cnkgdG8gbG9vayBhdCB0aGVtIHNvb24uDQo+
Pg0KPj4NCj4+Pg0KPj4+IFdpdGhvdXQgYW55IGRpc2N1c3Npb24gYW5kIHJlc29sdXRpb24sIEni
gJltIGFmcmFpZCBib3RoIG9mIHRoZXNlIA0KPj4+IHByb3Bvc2FscyBhcmUganVzdCBnb2luZyB0
byBzaXQgaGVyZSwgdW5tZXJnZWQsIGluZGVmaW5pdGVseS4NCj4+Pg0KPj4+IHRoeCAtIGJyYWQN
Cj4+Pg0K
