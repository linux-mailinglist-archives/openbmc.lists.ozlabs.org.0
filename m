Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E5F275E74
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 19:18:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxPyh5LPqzDqSx
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 03:18:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=gdAF1A6U; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=hfON39kd; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxPxp52jczDqSC
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 03:17:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1600881444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cmjmtivM1QTjF0JH0NiT9GrfPm6e3c2526XIAAmtt3A=;
 b=gdAF1A6Us4+xK8zOiwvJcaesBYnR3Mv51d8r40l350i7uvQnyrP9Iqi2rJm6SFepatqXWf
 qSuTJLRLwx6zx2qWbOxM0Edq28OyHWRWmpqoHLVrpruUwzJco0uKSaj9UuKa27AZPcOR88
 fHL0a9yj5v9x27kRUsMACECE39sd0ps=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1600881445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cmjmtivM1QTjF0JH0NiT9GrfPm6e3c2526XIAAmtt3A=;
 b=hfON39kdno0lMy9v1eJ4Mn7zLLVEkZJ+li2g8D4sOxkiBOKp8DfqvMVj5kDoamNrUnN4lc
 zzwDZoMnHG1mPSku2qe5sE70iA5d19aVYqaUC3sVyNIFrkRszAIzD1KxJp6yvjkhSnspD/
 ObFtKC0Xyc3jVIpA3WT45yqNJEBy3aU=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-ebieA7R-NUmD6VQvUtQxlQ-1; Wed, 23 Sep 2020 13:17:22 -0400
X-MC-Unique: ebieA7R-NUmD6VQvUtQxlQ-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 23 Sep 2020 10:17:20 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 23 Sep 2020 10:17:20 -0700
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: Ed Tanous <ed@tanous.net>, Derick Montague <Derick.Montague@ibm.com>
Subject: RE: Proposal to make webui-vue the standard
Thread-Topic: Proposal to make webui-vue the standard
Thread-Index: AQHWjdmkhjKAYuDXdE6V4+frg4Zx1KlyeuoAgAFYHICAAAKxgIACqCJw
Date: Wed, 23 Sep 2020 17:17:19 +0000
Message-ID: <caa4dda789104f03ae2b70e21da31a2b@SCL-EXCHMB-13.phoenix.com>
References: <CACWQX83ayt4eBcfH9wi87hz4-YMGqTC1=c=WdOzLcv_0wQ6mDg@mail.gmail.com>
 <OF91B43372.8E81A7D9-ON002585EA.0056113C-002585EA.0060099C@notes.na.collabserv.com>
 <CACWQX83Qcxh_QVeWQyxB1_FW45D5U9zZS1hNYOAyxPrj0EJTpw@mail.gmail.com>
In-Reply-To: <CACWQX83Qcxh_QVeWQyxB1_FW45D5U9zZS1hNYOAyxPrj0EJTpw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [98.246.252.115]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=bruce_mitchell@phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Content-Language: en-US
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
 Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

UGhvZW5peCBUZWNobm9sb2dpZXMgTHRkLiBpcyBtb3ZpbmcgZm9yd2FyZCB3aXRoIHdlYnVpLXZ1
ZSBhbmQgZGVwcmVjYXRpbmcgdXNlIG9mIHBob3NwaG9yLXdlYnVpLg0KV2UgYXJlIHZlcnkgbXVj
aCBsb29raW5nIGZvcndhcmQgdG8gd2VidWktdnVlIGJlIHRoZSBzdGFuZGFyZCEgIFRoZSBzb29u
ZXIgdGhlIGJldHRlci4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBv
cGVuYm1jIFttYWlsdG86b3BlbmJtYy0NCj4gYm91bmNlcyticnVjZV9taXRjaGVsbD1waG9lbml4
LmNvbUBsaXN0cy5vemxhYnMub3JnXSBPbiBCZWhhbGYgT2YgRWQNCj4gVGFub3VzDQo+IFNlbnQ6
IE1vbmRheSwgU2VwdGVtYmVyIDIxLCAyMDIwIDEwOjM5DQo+IFRvOiBEZXJpY2sgTW9udGFndWUN
Cj4gQ2M6IE9wZW5CTUMgTWFpbGxpc3Q7IEd1bm5hciBNaWxscw0KPiBTdWJqZWN0OiBSZTogUHJv
cG9zYWwgdG8gbWFrZSB3ZWJ1aS12dWUgdGhlIHN0YW5kYXJkDQo+IA0KPiBPbiBNb24sIFNlcCAy
MSwgMjAyMCBhdCAxMDoyOSBBTSBEZXJpY2sgTW9udGFndWUNCj4gPERlcmljay5Nb250YWd1ZUBp
Ym0uY29tPiB3cm90ZToNCj4gPg0KPiA+ID4+IHJlc3VsdGluZyBpbiBhIGRlY3JlYXNlIG9mIGRl
dmVsb3BtZW50IGFjdGl2aXR5IG9uIHBob3NwaG9yLXdlYnVpDQo+IG92ZXIgdGhlIHBhc3Qgc2l4
IG1vbnRocy4NCj4gPg0KPiA+ICA+IElyb25pY2FsbHksIHlvdSBzZW50IHRoaXMgb3V0IG9uIHRo
ZSBzYW1lIGRheSBWdWUgMy4wIHdhcyBhbm5vdW5jZWQ7DQo+ID4gID4gSXQgbG9va3MgbGlrZSB0
aGUgbmV4dCAyLlggVnVlIHJlbGVhc2UgZ29lcyB0byAxOCBtb250aCBzdXBwb3J0Lg0KPiA+ICA+
IEhvcGVmdWxseSBWdWUgMi4wLT4zLjAgcG9ydGluZyBpc24ndCB0aGUgc2FtZSB0aGluZyBhcyBB
bmd1bGFyIDEuWCAtPg0KPiA+ICA+IDIuWC4NCj4gPg0KPiA+IEl0IHdpbGwgbm90IHJlcXVpcmUg
YSBjb21wbGV0ZSByZXdyaXRlLiBHb29nbGUgYWJhbmRvbmVkIEFuZ3VsYXJKUw0KPiBhbmQgQW5n
bHVhciB3YXMgYSBjb21wbGV0ZSByZXdyaXRlLA0KPiA+IHdoaWNoIGlzIG9uZSByZWFzb24gdGhl
eSByZW5hbWVkIHRoZSBmcmFtZXdvcmsgZnJvbSBBbmd1bGFyIHRvDQo+IEFuZ3VsYXJKUy4gV2Ug
Y2FuIHN0YXJ0IHBsYW5uaW5nIGZvciBpdA0KPiA+IG5vdywgYnV0IG1hbnkgb2YgdGhlIHN1cHBv
cnRpbmcgbGlicmFyaWVzIGFyZSBzdGlsbCBpbiBiZXRhIHdpdGggYSBwbGFuIG9mDQo+IGJlaW5n
IHJlbGVhc2VkIGJ5IHRoZSBlbmQgb2YNCj4gPiAyMDIwLg0KPiANCj4gVGhhdCdzIGdvb2QgdG8g
aGVhciB0aGF0J3MgdGhlIGNhc2UuICBJJ20gaW4gbm8gd2F5IHNheWluZyB3ZSBzaG91bGQNCj4g
Z28gdG8gVnVlIDMuMCB0b2RheSwganVzdCBjaHVja2xpbmcgYXQgdGhlIHN0YXRlIG9mIHRoZSBK
YXZhc2NyaXB0DQo+IGZyYW1ld29ya3MgYXMgYSB3aG9sZS4NCj4gDQo+ID4NCj4gPiA+PiBMb2Fk
aW5nIHdlYnVpLXZ1ZSBmcm9tIHRoZSBCTUMgY2F1c2VzIGNvbnRlbnQtc2VjdXJpdHktcG9saWN5
DQo+IGVycm9ycyAoIzMyKQ0KPiA+DQo+ID4gID4gVGhpcyBpcyBpbXBvcnRhbnQsIGFuZCBoYXZp
bmcgdGhlIFVJIGxvYWQgd2l0aG91dCBlcnJvcnMgb3Igd2FybmluZ3MNCj4gPiAgPiBzcGVha3Mg
dG8gdGhlIHF1YWxpdHkgb2YgdGhlIFVJIGFzIGEgd2hvbGUsIGFuZCBhbHNvIGFsbG93cyBmaW5k
aW5nDQo+ID4gID4gcmVncmVzc2lvbnMgbXVjaCBlYXNpZXIuICBMb29raW5nIGZvcndhcmQgdG8g
d2hlbiB0aGlzIGxhbmRzLg0KPiA+DQo+ID4gQWdyZWVkLiBJIGFtIHJlc2VhcmNoaW5nIHRoaXMg
bm93Lg0KPiANCj4gU3dlZXQuDQo+IA0KPiA+DQo+ID4gPj4gVGhlIGxhc3QgMiBpZGVudGlmaWVk
IGlzc3Vlcywgd2UgYXJlIGxvb2tpbmcgZm9yIGNvbW11bml0eSBoZWxwIGJ1dA0KPiBtaWdodCB0
YWtlIHRoZXNlIHVwIG91cnNlbHZlcyBvbmUgZGF5Og0KPiA+ID4+DQo+ID4gPj4gTXV0dWFsIFRM
UyAoIzMwKQ0KPiA+DQo+ID4gID4gVGhpcyBpcyB1c2VkLCBhbmQgSSB0aGluayBpbXBvcnRhbnQg
b3ZlcmFsbCBmb3IgdGhlIHNlY3VyaXR5IHBvc3R1cmUNCj4gPiAgPiBvZiBPcGVuQk1DLiAgSSB3
b3VsZCBsaWtlIHRvIGF2b2lkIHJlZ3Jlc3NpbmcgdGhlIGRlZmF1bHQgc2VjdXJpdHkgb2YNCj4g
PiAgPiBPcGVuQk1DIGluIHRoaXMgcmVnYXJkLg0KPiA+DQo+ID4gQWdyZWVkLCB3ZSB3aWxsIGJl
IGFkZGluZyB0aGUgSXNBdXRoZW50aWNhdGVkIGNvb2tpZSBjaGVjay4NCj4gPg0KPiA+ID4+IENT
UkYgYWxsb3cgbGlzdCAoIzI5KQ0KPiA+DQo+ID4gID4gRG8geW91IHRoaW5rIHRoZSBwZXJzb24g
dGhhdCBjaGVja2VkIGluIHRoZSBjb2RlIGFyb3VuZCB0aGUgc2VjdXJpdHkNCj4gPiAgPiBidWcg
Y291bGQgdGFrZSBhIGxvb2sgYXQgaXQ/ICBJdCBsb29rcyBsaWtlIERlcmljayB3cm90ZSB0aGUg
Y29tbWl0DQo+ID4gID4gdGhhdCBuZWVkcyBmaXhlZC4NCj4gPiAgPiBodHRwczovL2dpdGh1Yi5j
b20vb3BlbmJtYy93ZWJ1aS0NCj4gdnVlL2NvbW1pdC9lMDgwYTFhNzU5M2U4M2E0OWQ2MjNmZmRk
NDUyZmQwZTFjNjE3ODg5I2RpZmYtDQo+IGQzM2JiZTY0NmFmN2Q4ZDQ1Y2FhZWIyN2IyMGI0ODEz
DQo+ID4NCj4gPiBZZXMsIHdlIGFyZSBsb29raW5nIGludG8gdGhpcy4gSSBhbSBzdGlsbCBub3Qg
cXVpdGUgY2xlYXIgd2hhdCB0aGUgQ1NSRg0KPiAiYWxsb3dsaXN0Ig0KPiA+IGlzIGNhbiB5b3Ug
cG9pbnQgbWUgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbiBpbiBwaG9zcGhvci13ZWJ1aT8NCj4gPg0K
PiA+DQo+ID4NCj4gPg0KPiANCj4gcGhvc3Bob3Itd2VidWkganVzdCB1c2VkIHRoZSBzdG9jayBh
bmd1bGFyanMgWFNSRiBoYW5kbGluZy4gIEknbQ0KPiByZWFsbHkgc3VycHJpc2VkIHRoZXJlIGlz
bid0IGEgc2ltaWxhciBtb2R1bGUgZm9yIFZ1ZS4NCj4gDQo+IFRoZSBzaG9ydCB2ZXJzaW9uIGlz
LCB5b3UgY2FuJ3QgZXhwb3NlIHRoZSBDU1JGIGtleSB0byBhbnkgc2VydmVyIHRoYXQNCj4gaXNu
J3QgdGhlIEJNQy4gIFRoYXQgd291bGQgYmUgYSBsZWFrIG9mIHByaXZhdGUgaW5mb3JtYXRpb24s
IGFuZCB3aGlsZQ0KPiBub3QgZmF0YWwgKGFzIHlvdSdyZSBzdGlsbCBwcm90ZWN0ZWQgYnkgdGhl
IHNlc3Npb24ga2V5KSBjb3VsZCBiZQ0KPiBjaGFpbmVkIHRvIGltcGxlbWVudCBhIENTUkYgYXR0
YWNrLg0KPiANCj4gVGhlIGltcG9ydGFudCBsaW5lcyBvZiBjb2RlIHRoYXQgeW91IG5lZWQgdG8g
aW1wbGVtZW50IGFyZToNCj4gaHR0cHM6Ly9naXRodWIuY29tL2FuZ3VsYXIvYW5ndWxhci5qcy9i
bG9iLzY3MDYzNTNhNzFlM2MxMWM1NmMwYjE5Yg0KPiBlMDM2MDBkYWM1N2FhZmUxL3NyYy9uZy9o
dHRwLmpzI0w0MjkNCj4gYW5kDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9hbmd1bGFyL2FuZ3VsYXIu
anMvYmxvYi82NzA2MzUzYTcxZTNjMTFjNTZjMGIxOWINCj4gZTAzNjAwZGFjNTdhYWZlMS9zcmMv
bmcvaHR0cC5qcyNMMTQxMA0KPiBhbmQNCj4gaHR0cHM6Ly9naXRodWIuY29tL2FuZ3VsYXIvYW5n
dWxhci5qcy9ibG9iL2I0ZTQwOWJmNmNkODEzMDdmNTdlNTFmMmYNCj4gMTI4MWIwNWNlYjZjYmYy
L3NyYy9uZy91cmxVdGlscy5qcyNMMTM2DQo+IA0KPiBJdCBzaG91bGQgYmUgbm90ZWQsIGJlY2F1
c2Ugd2UgZG9uJ3QgZXhwZWN0IHRoZSBibWMgdG8gYmUgZG9pbmcgYW55DQo+IGNyb3NzIHNpdGUg
c2NyaXB0aW5nLCB5b3UgY2FuIHNpbXBseSBpbXBsZW1lbnQgdGhlIGNoZWNrIGFnYWluc3QgdGhl
DQo+IGN1cnJlbnQgb3JpZ2luLCBhbmQgZG9uJ3QgbmVlZCB0byBtYWludGFpbiBhIGxpc3QgYW55
d2hlcmUgbGlrZQ0KPiBBbmd1bGFyIGRvZXMuDQoNCg==

