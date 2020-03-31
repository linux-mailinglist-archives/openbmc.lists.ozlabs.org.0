Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D8A198E01
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 10:10:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s27m2nTRzDr7d
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 19:10:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=eltan.com (client-ip=213.75.39.15;
 helo=cpsmtpb-ews10.kpnxchange.com; envelope-from=wvervoorn@eltan.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=eltan.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=kpnmail.nl header.i=@kpnmail.nl header.a=rsa-sha256
 header.s=kpnmail01 header.b=Rk44U7Uj; 
 dkim-atps=neutral
X-Greylist: delayed 69 seconds by postgrey-1.36 at bilbo;
 Tue, 31 Mar 2020 18:52:04 AEDT
Received: from cpsmtpb-ews10.kpnxchange.com (cpsmtpb-ews10.kpnxchange.com
 [213.75.39.15])
 by lists.ozlabs.org (Postfix) with ESMTP id 48s1kX2WBlzDqsG
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 18:52:03 +1100 (AEDT)
Received: from cpsps-ews28.kpnxchange.com ([10.94.84.194]) by
 cpsmtpb-ews10.kpnxchange.com with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 31 Mar 2020 09:50:46 +0200
X-Brand: 4ZrJ
X-KPN-SpamVerdict: e1=0;e2=0;e3=0;e4=(e1=10;e3=10;e2=11;e4=10);EVW:Whi
 te;BM:NotScanned;FinalVerdict:Clean
X-CMAE-Analysis: v=2.3 cv=WNfkokkR c=1 sm=1 tr=0 cx=a_idp_e
 a=ShNidqeCEQB33TAKUUzslw==:117 a=+94oq0dzjs5YbdIDA+8OCg==:17
 a=uoIxLzx0AAAA:20 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=xqWC_Br6kY4A:10
 a=y9pAQzHkNQkA:10 a=HsDtDo0tafEA:10 a=IkcTkHD0fZMA:10
 a=SS2py6AdgQ4A:10 a=X5F7dNyOAAAA:8 a=voM4FWlXAAAA:8 a=peDeANYtAAAA:20
 a=Uf1ZA7nTt6RLly3dwAIA:9 a=3MccFAHqgLkUUhUR:21 a=NMhp6j3rPC-Spz1q:21
 a=QEXdDO2ut3YA:10 a=pS7LufLo7ZPxIL5li5Lt:22 a=IC2XNlieTeVoXbcui8wp:22
X-CM-AcctID: kpn@feedback.cloudmark.com
Received: from smtp.kpnmail.nl ([195.121.84.11]) by cpsps-ews28.kpnxchange.com
 over TLS secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 31 Mar 2020 09:50:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kpnmail.nl; s=kpnmail01;
 h=mime-version:content-type:message-id:date:subject:to:from;
 bh=7UhIYlzaUnsS+qu+iKmRnNvbEZRCan/ZpDVEIA5wbGo=;
 b=Rk44U7UjjvKOKQkurnj41ITqwLI5ptqQdQOEu5542F8sE7+Shw/Lq8STqIwguNdrdrGRpwaMGLwYT
 KyE2S9763wRMilqxYj7ws280ktTK3nRi4nX7J6JN46aNgvdhAAnj1wpSuPiYUerFFCwuIUScay2ElM
 +YICtfOU/tb8YWdA=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|M3zskjhMfeOhAnyJFOFqEApf6L2lLZc9MVTIL9vNs95WpMZ+riNNzS62qphoRhj
 KcMvvC8Agy0oUGwnYFLe/vxoIVwQ6xQvfR41DDUqAnz4=
X-Originating-IP: 84.85.114.86
Received: from Eltsrv03.Eltan.local (ip54557256.adsl-surfen.hetnet.nl
 [84.85.114.86]) by smtp.kpnmail.nl (Halon) with ESMTPSA
 id 54813824-7324-11ea-8c67-00505699b758;
 Tue, 31 Mar 2020 09:50:46 +0200 (CEST)
Received: from Eltsrv03.Eltan.local (192.168.100.3) by Eltsrv03.Eltan.local
 (192.168.100.3) with Microsoft SMTP Server (TLS) id 15.0.847.32; Tue, 31 Mar
 2020 09:50:45 +0200
Received: from Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8]) by
 Eltsrv03.Eltan.local ([fe80::24e7:1cc6:a76a:a3a8%12]) with mapi id
 15.00.0847.040; Tue, 31 Mar 2020 09:50:45 +0200
From: Wim Vervoorn <wvervoorn@eltan.com>
To: "Alexander A. Filippov" <a.filippov@yadro.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Any idea of when qemu-system-arm will be supported for
 https://github.com/Intel-BMC/openbmc ?
Thread-Topic: Any idea of when qemu-system-arm will be supported for
 https://github.com/Intel-BMC/openbmc ?
Thread-Index: AdYEW5g0PNyrWOIxTpaE+uMcwMbtmwCBUasAAAu4poAAA480AAAkqmzg
Date: Tue, 31 Mar 2020 07:50:45 +0000
Message-ID: <c2da4dff71364ead835ed5c2cc53a86f@Eltsrv03.Eltan.local>
References: <1d854d104f3a48dd8f2c3929fc93a68b@SCL-EXCHMB-13.phoenix.com>
 <20200330161750.GA10520@bbwork.lan>
In-Reply-To: <20200330161750.GA10520@bbwork.lan>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginalArrivalTime: 31 Mar 2020 07:50:46.0244 (UTC)
 FILETIME=[16454A40:01D60731]
X-RcptDomain: lists.ozlabs.org
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

SGVsbG8sDQoNCllvdSBjYW4gdXNlIHRoZSBhc3QyNTAwLWV2YiBhcyBhIGJhc2UgdG8gYWRkIGEg
bW9kZWwgdGhhdCBtYXRjaGVzIHRoZSBXb2xmUGFzcyBjb25maWd1cmF0aW9uIGFzIGNsb3NlbHkg
YXMgcG9zc2libGUuDQoNClVzdWFsbHksIGl0IHdvcmtzIHF1aXRlIHdlbGwgdG8gbW9kZWwgdGhh
dCBwYXJ0IG9mIHRoZSBCTUMgdGhhdCB5b3UgYXJlIGRldmVsb3Bpbmcgc29mdHdhcmUgZm9yLiBG
dWxsIGltcGxlbWVudGF0aW9uIGlzIHBvc3NpYmxlIG9mIGNvdXJzZSBidXQgbW9zdCBsaWtlbHkg
YSBsb3Qgb2Ygd29yay4NCg0KQmVzdCBSZWdhcmRzLA0KV2ltIFZlcnZvb3JuDQoNCkVsdGFuIEIu
Vi4NCkFtYmFjaHRzdHJhYXQgMjMNCjU0ODEgU00gU2NoaWpuZGVsDQpUaGUgTmV0aGVybGFuZHMN
Cg0KVCA6ICszMS0oMCk3My01OTQgNDYgNjQNCkUgOiB3dmVydm9vcm5AZWx0YW4uY29tDQpXIDog
aHR0cDovL3d3dy5lbHRhbi5jb20NCg0KDQoiVEhJUyBNRVNTQUdFIENPTlRBSU5TIENPTkZJREVO
VElBTCBJTkZPUk1BVElPTi4gVU5MRVNTIFlPVSBBUkUgVEhFIElOVEVOREVEIFJFQ0lQSUVOVCBP
RiBUSElTIE1FU1NBR0UsIEFOWSBVU0UgT0YgVEhJUyBNRVNTQUdFIElTIFNUUklDVExZIFBST0hJ
QklURUQuIElGIFlPVSBIQVZFIFJFQ0VJVkVEIFRISVMgTUVTU0FHRSBJTiBFUlJPUiwgUExFQVNF
IElNTUVESUFURUxZIE5PVElGWSBUSEUgU0VOREVSIEJZIFRFTEVQSE9ORSArMzEtKDApNzMtNTk0
NDY2NCBPUiBSRVBMWSBFTUFJTCwgQU5EIElNTUVESUFURUxZIERFTEVURSBUSElTIE1FU1NBR0Ug
QU5EIEFMTCBDT1BJRVMuIsKgDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBv
cGVuYm1jIFttYWlsdG86b3BlbmJtYy1ib3VuY2VzK3d2ZXJ2b29ybj1lbHRhbi5jb21AbGlzdHMu
b3psYWJzLm9yZ10gT24gQmVoYWxmIE9mIEFsZXhhbmRlciBBLiBGaWxpcHBvdg0KU2VudDogTW9u
ZGF5LCBNYXJjaCAzMCwgMjAyMCA2OjE4IFBNDQpUbzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn
DQpTdWJqZWN0OiBSZTogQW55IGlkZWEgb2Ygd2hlbiBxZW11LXN5c3RlbS1hcm0gd2lsbCBiZSBz
dXBwb3J0ZWQgZm9yIGh0dHBzOi8vZ2l0aHViLmNvbS9JbnRlbC1CTUMvb3BlbmJtYyA/DQoNCk9u
IE1vbiwgTWFyIDMwLCAyMDIwIGF0IDAyOjM1OjU1UE0gKzAwMDAsIEJydWNlIE1pdGNoZWxsIHdy
b3RlOg0KPiBJIHdhcyBsb29raW5nIGZvciBzb21ldGhpbmcgbGlrZSBhIC1NIHdvbGZwYXNzLWJt
YyBjb21tYW5kIGxpbmUgb3B0aW9uIA0KPiBsaWtlIFJvbXVsdXMgaGFzIC1NIHJvbXVsdXMtYm1j
IChzZWUgaGVyZTogDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2RvY3MvYmxvYi9tYXN0
ZXIvZGV2ZWxvcG1lbnQvZGV2LWVudmlyb25tZW4NCj4gdC5tZCApDQo+IA0KPiBZZXQgSSBmaW5k
IG5vIHdvbGZwYXNzLCBTMjYwMFdGLCBub3IgSW50ZWwgaW4gdGhlIC1tYWNoaW5lIGhlbHAgbGlz
dC4gDQo+IChzZWUgYmVsb3cpDQo+IA0KDQpZZXMsIHRoZXJlIGlzIG5vIGZ1bGwgaW1wbGVtZW50
ZWQgcGxhdGZvcm0uDQoNCkFzIEkga25vdywgdGhlIHdvbGZwYXNzIGJtYyBiYXNlZCBvbiBhc3Bl
ZWQgYXN0MjUwMCBTb0MuIA0KSSBjYW4ndCByZW1lbWJlciB3aHkgSSBjaG9vc2UgZXhhY3RseSBh
c3QyNTAwLWV2YiBmb3IgdGhlIHRlc3RzIG9mIHdvbGZwYXNzLg0KUHJvYmFibHkgaXQgd2FzIHJl
cG9ydGVkIHNvbWV3aGVyZSBpbiB0aGUgaW50ZXJuYWwgZG9jdW1lbnRzLg0KDQpJZiBzb21lb25l
IGhhcyBvdGhlciBleHBlcmllbmNlIG9yIG1vcmUga25vd2xlZGdlIHBsZWFzZSBzaGFyZSBpdC4N
Cg0KQWxleGFuZGVyLg0KDQoNCg0KDQo=
