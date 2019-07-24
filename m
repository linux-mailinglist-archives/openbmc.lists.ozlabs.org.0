Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B59F7328E
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 17:16:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tzTZ0X4qzDqQN
	for <lists+openbmc@lfdr.de>; Thu, 25 Jul 2019 01:16:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.40; helo=atlmailgw1.ami.com;
 envelope-from=chittarip@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw1.ami.com (atlmailgw1.ami.com [63.147.10.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tzSx2g5nzDqNK
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jul 2019 01:16:14 +1000 (AEST)
X-AuditID: ac1060b2-3fdff70000003a7d-55-5d387639b57e
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 C7.AA.14973.936783D5; Wed, 24 Jul 2019 11:16:09 -0400 (EDT)
Received: from ATLMS2.us.megatrends.com ([fe80::29dc:a91e:ea0c:cdeb]) by
 atlms1.us.megatrends.com ([fe80::8c55:daf0:ef05:5605%12]) with mapi id
 14.03.0415.000; Wed, 24 Jul 2019 11:16:08 -0400
From: Chittari Pabba <ChittariP@ami.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: RE: Security Working Group - Wednesday July 24
Thread-Topic: Security Working Group - Wednesday July 24
Thread-Index: AQHVQdhMOTDNmSqrV0q9/1PR1hIJ36bZ4WoQ
Date: Wed, 24 Jul 2019 15:16:08 +0000
Message-ID: <00DE8410EF1E8148ABEDA156FA727A3C03ED1DA70A@atlms2.us.megatrends.com>
References: <ee35ab16-f95b-f51b-956f-fb07b2234aaf@linux.ibm.com>
In-Reply-To: <ee35ab16-f95b-f51b-956f-fb07b2234aaf@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.100.135]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrDIsWRmVeSWpSXmKPExsWyRiBhgq5lmUWsQe9+BYsTa7axWJxqecHi
 wOQxYdEBRo/zMxYyBjBFNTDaJObl5ZcklqQqpKQWJ9sqBRRlliUmVyopZKbYKhkqKRTkJCan
 5qbmldgqJRYUpOalKNlxKWAAG6CyzDyF1Lzk/JTMvHRbJc9gf10LC1NLXUMlu5CMVIXMvLT8
 otzEksz8PIXk/LwSoOrUFKCoQkIXZ8b7a+3MBXcEKm5Nf8bewLhEoIuRg0NCwERi4hHuLkYu
 DiGBXUwS/56fYoRwDjNKHL/cxd7FyMnBJqAh0fDkCZgtIuAjMbv3FROILSxgLrHvzFNmiLiF
 REfHJFYI20ji/tJfYHEWAVWJBbuXgdm8AoESLet6wGwhAQeJZUcWg9VzCjhKrDy/BWw+o4CY
 xPdTa8DmMwuIS9x6Mh/MlhAQkFiy5zwzhC0q8fLxP1YIW0mi7+c6NpBnmAU0Jdbv0odoVZSY
 0v2QHWKtoMTJmU9YJjCKzEIydRZCxywkHbOQdCxgZFnFKJRYkpObmJmTXm6ol5ibqZecn7uJ
 ERL1m3Ywtlw0P8TIxMF4iFGCg1lJhDewwSxWiDclsbIqtSg/vqg0J7X4EKMTMBgmMktxg6IE
 GMfxxgYGUqIwjqGJmYm5kbmhpYm5sbGSOO/KNd9ihATSgWklOzW1ILUIZggTB6dUA+MhL7Fj
 +3hMb53S0drvUBaVuO3g/ecPyi+v+CquOOd6UfGjW/qTHLYILsutuNa2ocdAc9MGfumoszan
 PidujBSoUzBnYytbsF5n53u1uGbuJzwfima/kSyufc8UZndYrWvCbomgQ3+VvFgXb1YukJsn
 8u+Gyh7GGy6nFJRnTDjQqe/D53v6hq4SS3FGoqEWc1FxIgB7ZZPjDwMAAA==
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

SSBsaWtlIHRvIGFkZCBmb2xsb3dpbmcgaXRlbSB0byB0b2RheSBhZ2VuZGEgaXRlbXMiIFRy
YWNraW5nIFlvY3RvIExpbnV4IHNlY3VyaXR5IGZpeGVzIHRyYWNraW5nIg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmJtYyA8b3BlbmJtYy1ib3VuY2VzK2No
aXR0YXJpcD1hbWkuY29tQGxpc3RzLm96bGFicy5vcmc+IE9uIEJlaGFsZiBPZiBKb3NlcGgg
UmV5bm9sZHMNClNlbnQ6IFR1ZXNkYXksIEp1bHkgMjMsIDIwMTkgMzozOSBQTQ0KVG86IG9w
ZW5ibWMgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IFNlY3VyaXR5IFdv
cmtpbmcgR3JvdXAgLSBXZWRuZXNkYXkgSnVseSAyNA0KDQpUaGlzIGlzIGEgcmVtaW5kZXIg
b2YgdGhlIE9wZW5CTUMgU2VjdXJpdHkgV29ya2luZyBHcm91cCBtZWV0aW5nIHNjaGVkdWxl
ZCBmb3IgdGhpcyBXZWRuZXNkYXkgSnVseSAyNCBhdCAxMDowMGFtIFBEVC4NCg0KKiAqICog
VGhlIGNhbGwtaW4gYWNjZXNzIGNoYW5nZWQgb24gSnVseSAxMCAodGhlIHByZXZpb3VzIG1l
ZXRpbmcpIC0gZGV0YWlscyBiZWxvdyAqICogKg0KDQpDdXJyZW50IHRvcGljczoNCi0gRGV2
ZWxvcG1lbnQgd29yayAoaW5jbHVkaW5nIGFwcHJvdmVkIG5ldHdvcmsgc2VjdXJpdHkgY29u
c2lkZXJhdGlvbnMpDQotIFNQRE0NCi0gRGVmYXVsdCB1c2VyIGNvbmZpZzogcm9vdCwgaXBt
aSBncm91cCwgcGFzc3dvcmQgbGltaXRlZCB0byBjaGFyWzIwXQ0KDQoNCkFjY2VzcywgYWdl
bmRhLCBhbmQgbm90ZXMgYXJlIGluIHRoZSB3aWtpOg0KaHR0cHM6Ly9naXRodWIuY29tL29w
ZW5ibWMvb3BlbmJtYy93aWtpL1NlY3VyaXR5LXdvcmtpbmctZ3JvdXANCg0KLSBKb3NlcGgN
Cg0KVGhlIFNlY3VyaXR5IFdvcmtpbmcgR3JvdXAgbWVldGluZyBhY2Nlc3MgY2hhbmdlZCBv
biBKdWx5IDEwLsKgIFRoZSBvbGQgYWNjZXNzIHdpbGwgbm90IGJlIHVzZWQuwqAgVGhlIG5l
dyBhY2Nlc3MgaXMgZ2l2ZW4gaW4gdGhlIHdpa2kgYW5kIGluIHRoaXMgZW1haWwuwqAgVGhp
cyBpcyBlZmZlY3RpdmUgbm93LCBzbyBwbGVhc2UgdXBkYXRlIHlvdXIgY2FsZW5kYXJzLg0K
SGVyZSBpcyB0aGUgaW5mb3JtYXRpb24gZm9yIHRoZSB3ZWIgdmlkZW8gY29uZmVyZW5jZSBh
bmQgdGVsZXBob25lIGFjY2VzczoNCi0gSm9pbiB2aWEgV2ViOmh0dHBzOi8vaWJtLndlYmV4
LmNvbS9tZWV0L2pvc2VwaC5yZXlub2xkczENCi0gSm9pbiB2aWEgUGhvbmU6IFVzZSBhY2Nl
c3MgY29kZTogOTI3IDAzNCA0ODYgLS0gVW5pdGVkIFN0YXRlcyBUb2xsDQpGcmVlOiAxLTg0
NC01MzEtMDk1OC4gQ2xpY2sgaGVyZSBmb3Igb3RoZXIgcGhvbmUgbnVtYmVycyA8aHR0cHM6
Ly9pYm0ud2ViZXguY29tL2NtcDMzMDAvd2ViY29tcG9uZW50cy93aWRnZXQvZ2xvYmFsY2Fs
bGluL2dsb2JhbGNhbGxpbi5kbz9zaXRldXJsPWlibSZzZXJ2aWNlVHlwZT1NQyZFRD03NTY5
ODI2MzcmdG9sbEZyZWU9MT4gDQoNCi0gVmlzaXQgdGhlIFdlYmV4IHdlYiBzaXRlIGZvciBt
b3JlIHdheXMgdG8gam9pbiBvciBmb3IgYW4gdXBkYXRlZCBhY2Nlc3MgY29kZS4NCg0KDQpQ
bGVhc2UgY29uc2lkZXIgdGhlIGVudmlyb25tZW50IGJlZm9yZSBwcmludGluZyB0aGlzIGVt
YWlsLg0KDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgbWVzc2FnZSBtYXkg
YmUgY29uZmlkZW50aWFsIGFuZCBwcm9wcmlldGFyeSB0byBBbWVyaWNhbiBNZWdhdHJlbmRz
LCBJbmMuICBUaGlzIGNvbW11bmljYXRpb24gaXMgaW50ZW5kZWQgdG8gYmUgcmVhZCBvbmx5
IGJ5IHRoZSBpbmRpdmlkdWFsIG9yIGVudGl0eSB0byB3aG9tIGl0IGlzIGFkZHJlc3NlZCBv
ciBieSB0aGVpciBkZXNpZ25lZS4gSWYgdGhlIHJlYWRlciBvZiB0aGlzIG1lc3NhZ2UgaXMg
bm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHlvdSBhcmUgb24gbm90aWNlIHRoYXQgYW55
IGRpc3RyaWJ1dGlvbiBvZiB0aGlzIG1lc3NhZ2UsIGluIGFueSBmb3JtLCBpcyBzdHJpY3Rs
eSBwcm9oaWJpdGVkLiAgUGxlYXNlIHByb21wdGx5IG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHJl
cGx5IGUtbWFpbCBvciBieSB0ZWxlcGhvbmUgYXQgNzcwLTI0Ni04NjAwLCBhbmQgdGhlbiBk
ZWxldGUgb3IgZGVzdHJveSBhbGwgY29waWVzIG9mIHRoZSB0cmFuc21pc3Npb24uDQo=
