Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F49CF2187
	for <lists+openbmc@lfdr.de>; Wed,  6 Nov 2019 23:19:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477gv95p1KzF5qX
	for <lists+openbmc@lfdr.de>; Thu,  7 Nov 2019 09:19:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=bruce_mitchell@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.b="phr/vO7M"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477gtW055NzF5lY
 for <openbmc@lists.ozlabs.org>; Thu,  7 Nov 2019 09:19:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1573078748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+opOkXNXbtAOs3a56CWa0V199V5QYbJ+wg9tEFzh1Mw=;
 b=phr/vO7MEWdfH06kLBprLXHi1Yrq433KX4IH4I4I9bEDJaU8US4Xinx8CCQTWmufy28fiJ
 pI7bi6MseR98ue2olh9nGfJHSVjf4jSduV0TQaRsB7z2ww4c0sW/i3zDqngPxMr+c1Lr0D
 tbGsTMWhFFGmuR7wjL13hTfLXamFuPM=
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-JgxE3TvHOQW8TuLJhRuWFg-1; Wed, 06 Nov 2019 17:19:06 -0500
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Wed, 6 Nov 2019 14:18:53 -0800
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Wed, 6 Nov 2019 14:18:53 -0800
From: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
To: James Feist <james.feist@linux.intel.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: OpenBMC and https Vulnerable issue.
Thread-Topic: OpenBMC and https Vulnerable issue.
Thread-Index: AdWU2NcOn6r8XDKvQaCrtSIOdXMZIAAVrMKAABAGWwA=
Date: Wed, 6 Nov 2019 22:18:52 +0000
Message-ID: <8e3e3633bd1946adbac73657816e049a@SCL-EXCHMB-13.phoenix.com>
References: <44ddb5d76e734cb8bcc7354e1c0e0081@SCL-EXCHMB-13.phoenix.com>
 <cd9008e5-2501-29d4-57e8-7831eb558160@linux.intel.com>
In-Reply-To: <cd9008e5-2501-29d4-57e8-7831eb558160@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.174]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-MC-Unique: JgxE3TvHOQW8TuLJhRuWFg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmJtYyBbbWFpbHRv
Om9wZW5ibWMtDQo+IGJvdW5jZXMrYnJ1Y2VfbWl0Y2hlbGw9cGhvZW5peC5jb21AbGlzdHMub3ps
YWJzLm9yZ10gT24gQmVoYWxmIE9mDQo+IEphbWVzIEZlaXN0DQo+IFNlbnQ6IFdlZG5lc2RheSwg
Tm92ZW1iZXIgNiwgMjAxOSAxMzo1Mg0KPiBUbzogQnJ1Y2UgTWl0Y2hlbGw7IE9wZW5CTUMgTWFp
bGxpc3QNCj4gU3ViamVjdDogUmU6IE9wZW5CTUMgYW5kIGh0dHBzIFZ1bG5lcmFibGUgaXNzdWUu
DQo+IA0KPiBPbiAxMS82LzE5IDExOjMxIEFNLCBCcnVjZSBNaXRjaGVsbCB3cm90ZToNCj4gPiAg
RnJvbSBteSBpbnZlc3RpZ2F0aW9ucyBvbiBUTFMgdGhlcmUgc2VlbXMgdG8gYmUgMiBpc3N1ZXMg
dGhhdCBjb3VsZCBiZQ0KPiBjb3JyZWN0ZWQgd2l0aCBPcGVuQk1DJ3MgaHR0cHM6DQo+ID4gICAg
MSAgU2VjdXJlIENsaWVudC1Jbml0aWF0ZWQgUmVuZWdvdGlhdGlvbiAgICAgVlVMTkVSQUJMRSAo
Tk9UIG9rKSwgRG9TDQo+IHRocmVhdA0KPiANCj4gVGhpcyBDVkUgaXMgZGlzcHV0ZWQgaHR0cHM6
Ly93d3cuY3ZlZGV0YWlscy5jb20vY3ZlL0NWRS0yMDExLTE0NzMvIGR1ZQ0KPiB0byBDUFUgY29u
c3VtcHRpb24gaXNzdWVzIHRoYXQgbWlnaHQgbWFrZSBpdCBlYXNpZXIgdG8gY2F1c2UgYSBET1MN
Cj4gKHdoaWNoIGlzIGFyZ3VhYmx5IGFscmVhZHkgbm90IHRoYXQgZGlmZmljdWx0IG9uIGEgQk1D
KS4gVGhhdCBiZWluZyBzYWlkDQo+IHRoZSBmaXggaXMgYSAxIGxpbmVyLCBzbyBJIGltcGxlbWVu
dGVkIGl0IGFuZCBpdCBzZWVtcyB0byB3b3JrLCBidXQgSQ0KPiBuZWVkIHRvIHNlZSBpZiB0aGVy
ZSBhcmUgYW55IGNvbnNlcXVlbmNlcy4NCj4gDQo+IGh0dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJv
amVjdC54eXovYy9vcGVuYm1jL2JtY3dlYi8rLzI2OTkyDQo+IA0KPiANCj4gDQo+ID4gICAgMiAg
TFVDS1kxMyAoQ1ZFLTIwMTMtMDE2OSksIGV4cGVyaW1lbnRhbCAgICAgcG90ZW50aWFsbHkgVlVM
TkVSQUJMRSwNCj4gdXNlcyBjaXBoZXIgYmxvY2sgY2hhaW5pbmcgKENCQykgY2lwaGVycyB3aXRo
IFRMUw0KPiA+ICAgICAgIGFuZCB4YzAyMyAgIEVDREhFLUVDRFNBLUFFUzEyOC1TSEEyNTYgICAg
ICAgICBFQ0RIIDUyMSAgIEFFUyAgICAgICAgIDEyOA0KPiBUTFNfRUNESEVfRUNEU0FfV0lUSF9B
RVNfMTI4X0NCQ19TSEEyNTYNCj4gDQo+IEJhc2VkIG9uIHRoaXMgaHR0cHM6Ly93aWtpLmNyYXNo
dGVzdC1zZWN1cml0eS5jb20vcHJldmVudC1zc2wtbHVja3kxMywNCj4gd2UgYXJlIHVzaW5nIHRo
ZSByZWNvbW1lbmRlZCBjaXBoZXJzLA0KPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9ibWN3
ZWIvYmxvYi8xZjhjN2I1ZDZhNjc5YTM4YjgyMjYxMDYwMzENCj4gMGI4NzYwNzlkMGY4Yi9pbmNs
dWRlL3NzbF9rZXlfaGFuZGxlci5ocHAjTDMzMC4NCj4gQW5kIGJhc2VkIG9uIHRoaXMgY29tbWVu
dCBmcm9tIHRoZSBtYWludGFpbmVyIG9mIHRlc3Qgc3NsLCBubyB0b29sIGNhbg0KPiBkZXRlcm1p
bmUgdGhpcyBleHRlcm5hbGx5LCBhbmQgaXQncyBqdXN0IGEgd2FybmluZzoNCj4gaHR0cHM6Ly9n
aXRodWIuY29tL2Ryd2V0dGVyL3Rlc3Rzc2wuc2gvaXNzdWVzLzEwMTEjaXNzdWVjb21tZW50LQ0K
PiAzNzI5NTM2NTQuDQo+IERvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9ucyBvbiBpZiB0aGVyZSBp
cyBhbnl0aGluZyB0byBjaGFuZ2UgZm9yIHRoaXMgb25lPw0KPiANCj4gVGhhbmtzDQo+IA0KPiAt
SmFtZXMNCj4gDQoNClRoYW5rcyBKYW1lcywgSSBhY2NlcHQgeW91ciBhc3Nlc3NtZW50Lg0KDQot
QnJ1Y2UNCg0KPiANCj4gPg0KPiA+IFByZXNlbnQgc3RhbmRhcmQgb2YgcHJhY3RpY2Ugc2VlbXMg
dG8gYmUgdG8gbm90IGFsbG93IFNlY3VyZSBDbGllbnQtDQo+IEluaXRpYXRlZCBSZW5lZ290aWF0
aW9uIGFuZCB0byBub3QgYWxsb3cgQ0JDIGNpcGhlcnMuDQo+ID4NCj4gPiBJcyB0aGlzIHlvdXIg
dW5kZXJzdGFuZGluZyBhcyB3ZWxsPw0KPiA+DQo+ID4gVGhhbmsgeW91IQ0KPiA+DQoNCg==

