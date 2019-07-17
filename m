Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0F86C059
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 19:27:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pkj40t8jzDqNJ
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 03:27:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=chittarip@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
X-Greylist: delayed 296 seconds by postgrey-1.36 at bilbo;
 Thu, 18 Jul 2019 03:26:25 AEST
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pkhK4MD5zDqRK
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2019 03:26:24 +1000 (AEST)
X-AuditID: ac10606f-d27ff70000003324-24-5d2f5a3deb17
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 F7.75.13092.D3A5F2D5; Wed, 17 Jul 2019 13:26:21 -0400 (EDT)
Received: from ATLMS2.us.megatrends.com ([fe80::29dc:a91e:ea0c:cdeb]) by
 atlms1.us.megatrends.com ([fe80::8c55:daf0:ef05:5605%12]) with mapi id
 14.03.0415.000; Wed, 17 Jul 2019 13:26:21 -0400
From: Chittari Pabba <ChittariP@ami.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: RE: BMC threat model docs
Thread-Topic: BMC threat model docs
Thread-Index: AQHVPLx/1NANaiahn0+A0GIZ/WE1UKbPDlTggAABEmA=
Date: Wed, 17 Jul 2019 17:26:20 +0000
Message-ID: <00DE8410EF1E8148ABEDA156FA727A3C03ED1D95EC@atlms2.us.megatrends.com>
References: <685b6066-fdd1-9fc7-82be-372f6ad9ff22@linux.ibm.com>
 <00DE8410EF1E8148ABEDA156FA727A3C03ED1D95CB@atlms2.us.megatrends.com>
In-Reply-To: <00DE8410EF1E8148ABEDA156FA727A3C03ED1D95CB@atlms2.us.megatrends.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.100.135]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrLIsWRmVeSWpSXmKPExsWyRiBhgq5tlH6swcz9ehYn1mxjsTjV8oLF
 gcljwqIDjB7nZyxkDGCKamC0SczLyy9JLElVSEktTrZVCijKLEtMrlRSyEyxVTJUUijISUxO
 zU3NK7FVSiwoSM1LUbLjUsAANkBlmXkKqXnJ+SmZeem2Sp7B/roWFqaWuoZKdiEZqQqZeWn5
 RbmJJZn5eQrJ+XklQNWpKUBRhYQuzoytvzpZCnokKj7PbmJsYNwj3sXIySEhYCLRMG8Paxcj
 F4eQwC4midPb9zFBOIcZJR5df80CUsUmoCHR8OQJO4gtIuAjMbv3FROILSygJHHr8U62LkYO
 oLiyxLy5cRAlVhLTH9xlBrFZBFQlTv+FaOUVCJRYcuICI8T8DkaJg7fPsIIkOAWCJCbObAZr
 YBQQk/h+ag3YfGYBcYlbT+YzQVwqILFkz3lmCFtU4uXjf6wQtpJE3891YDcwC2hKrN+lD9Gq
 KDGl+yHUXkGJkzOfsExgFJmFZOoshI5ZSDpmIelYwMiyilEosSQnNzEzJ73cSC8xN1MvOT93
 EyMk7vN3MH78aH6IkYmD8RCjBAezkgiv7VftWCHelMTKqtSi/Pii0pzU4kOMTsBwmMgsxQ2K
 E2AkxxsbGEiJwjiGJmYm5kbmhpYm5sbGSuK8q9Z8ixESSAcmluzU1ILUIpghTBycUg2MJxb+
 qJmVXc7dHdP17nKI45Trrjoff/PkbrzTsPTalO0zeY9Ne9bzcVurf3inf1CC6Ks72vt+XhTa
 ElJR2/n14jV787/b+HJFl5TVv2eYIbHcdlLbFvZ993Z392e7s5j/2/XcsPjjnE3VD9K6Pv8V
 DlAT5qxoXPpXJ/HBuX07pjQIv1ZXjftRr8RSnJFoqMVcVJwIAJwC11EQAwAA
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

Sm9zZXBoLA0KDQpJIGFtIG5ldyB0byB0aGlzIGdyb3VwOyBoZW5jZSBJIGRvbid0IGtub3cg
Y29tbXVuaWNhdGlvbiBwcm90b2NvbCwgbXkgYXBvbG9neSBmb3IgdGhhdC4gTmV4dCB0aW1l
IG9ud2FyZHMgSSB3aWxsIHVzZSBvcGVuIEJNQyBlbWFpbCBsaXN0IHRvIHNlbmQgZm9yIGFu
eSBvZiBvdXIgcXVlc3Rpb25zIG9yIG91ciBmZWVkYmFjayBvciBzdWdnZXN0aW9ucyBvbiBP
cGVuIEJNQyBzZWN1cml0eS4gIA0KDQpUaGFua3MsDQpDaGl0dGFyaQ0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQ2hpdHRhcmkgUGFiYmEgDQpTZW50OiBXZWRuZXNk
YXksIEp1bHkgMTcsIDIwMTkgMToyMSBQTQ0KVG86ICdKb3NlcGggUmV5bm9sZHMnIDxqcmV5
QGxpbnV4LmlibS5jb20+OyBvcGVuYm1jIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQpT
dWJqZWN0OiBSRTogQk1DIHRocmVhdCBtb2RlbCBkb2NzDQoNClRoYW5rIHlvdSwgSm9zZXBo
LCBmb3IgcXVpY2sgcmVzcG9uc2UgISEhIEkgd2lsbCByZXZpZXcgdGhlIE9wZW4gQk1DIHRo
cmVhdCBtb2RlbCBkb2N1bWVudCBhbmQgd2lsbCBwcm92aWRlIG15IGZlZWRiYWNrLiANCg0K
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IG9wZW5ibWMgPG9wZW5ibWMtYm91
bmNlcytjaGl0dGFyaXA9YW1pLmNvbUBsaXN0cy5vemxhYnMub3JnPiBPbiBCZWhhbGYgT2Yg
Sm9zZXBoIFJleW5vbGRzDQpTZW50OiBXZWRuZXNkYXksIEp1bHkgMTcsIDIwMTkgMTI6Mjcg
UE0NClRvOiBvcGVuYm1jIDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQpTdWJqZWN0OiBC
TUMgdGhyZWF0IG1vZGVsIGRvY3MNCg0KSSBnb3QgYSBwcml2YXRlIGVtYWlsIGFza2luZw0K
ID4gW3doZXJlIGFyZSB0aGVdIEJNQyBwcm9qZWN0IHRocmVhdCBtb2RlbCBkb2N1bWVudHM/
DQoNClRoZSBhcHByb3ZlZCBuZXR3b3JrIHRocmVhdCBtb2RlbCBpcyBoZXJlOg0KaHR0cHM6
Ly9naXRodWIuY29tL29wZW5ibWMvZG9jcy9ibG9iL21hc3Rlci9zZWN1cml0eS9uZXR3b3Jr
LXNlY3VyaXR5LWNvbnNpZGVyYXRpb25zLm1kDQoNClRoZSB0aHJlYXQgbW9kZWwgaXMgdmVy
eSBiYXNpYyBhbmQgZG9lcyBsaXR0bGUgbW9yZSB0aGFuIGlkZW50aWZ5IE9wZW5CTUMncyBu
ZXR3b3JrIHNlcnZpY2VzLsKgIFRoZSBsZXZlbCBvZiBkZXRhaWwgd2FzIGluaXRpYWxseSBz
dXBlcmZpY2lhbCB0byBnZXQgYXBwcm92YWwgZm9yIHRoZSBkb2N1bWVudC7CoCBJIGhvcGUg
dG8gYWRkIG1vcmUgZGV0YWlscyBhbmQgYWRkIG5ldyBzZWN0aW9ucyBmb3IgQk1DIG5ldHdv
cmsgY29ubmVjdGlvbnMgaW5jbHVkaW5nIExEQVAsIHJlbW90ZSBsb2dnaW5nLCByZW1vdGUg
bWVkaWEsIGlwLWt2bSwgZXZlbnQgc3Vic2NyaXB0aW9ucywgZXRjLsKgIFRoZW4gYWRkIGEg
c2VjdGlvbiBmb3IgUmVkZmlzaCBzZWN1cml0eSBjb25zaWRlcmF0aW9ucy4NCg0KVGhlIG5l
dHdvcmsgdGhyZWF0IG1vZGVsIGlzIG9ubHkgYSBzdWJzZXQgb2YgdGhlIG92ZXJhbGwgQk1D
IHRocmVhdCBtb2RlbC7CoCAoRm9yIGV4YW1wbGUsIHRoZSBCTUMgZmFjZXMgdGhyZWF0cyBm
cm9tIGl0cyBlbnZpcm9ubWVudCBhbmQgaXRzIGhvc3Qgc3lzdGVtLinCoCBUaGUgT3BlbkJN
QyBwcm9qZWN0IGhhcyBubyBvdmVyYWxsIEJNQyB0aHJlYXQgbW9kZWwsIGFuZCBtaW5lIGlz
IGluIHJldmlldyBoZXJlOg0KaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9j
L29wZW5ibWMvZG9jcy8rLzIyNDA0DQooWW91IGNhbiBmaW5kIG90aGVyIHRocmVhdCBtb2Rl
bCByZXZpZXdzIGJ5IHNlYXJjaGluZyBnZXJyaXQgZm9yICJ0aHJlYXQiIG9yICJzZWN1cml0
eSIpLg0KDQpJIGFtIHVzaW5nIG15IHJldmlldyB0byBjb2xsZWN0IGluZm9ybWF0aW9uIGFi
b3V0IEJNQyB0aHJlYXRzLCB3aGljaCBpbiB0dXJuIGRlcGVuZHMgb24gaG93IHRoZSBCTUMg
aXMgdXNlZCwgc28gSSBhbSBjb2xsZWN0aW5nIGluZm9ybWF0aW9uIGFib3V0IEJNQyB1c2Ug
Y2FzZXMgdG9vLsKgIEFueSBhbmQgYWxsIGNvbnRyaWJ1dGlvbnMgYXJlIHdlbGNvbWUsIGFu
ZCBjYW4gYmUgYWRkZWQgYXMgcmV2aWV3IGNvbW1lbnRzLCBlbWFpbCB0byB0aGUgY29tbXVu
aXR5LCBvciBkaXJlY3RseSB0byBtZS4gSSBhbSBzdHJ1Z2dsaW5nIHdpdGggdGhlIHRocmVh
dCBtb2RlbCBzY29wZSwgYW5kIGhvdyB0byBvcmdhbml6ZSB0aGUgZG9jdW1lbnQuwqAgQW55
IGZlZWRiYWNrIGlzIHdlbGNvbWUuDQoNCi0gSm9zZXBoDQoNCg0KUGxlYXNlIGNvbnNpZGVy
IHRoZSBlbnZpcm9ubWVudCBiZWZvcmUgcHJpbnRpbmcgdGhpcyBlbWFpbC4NCg0KVGhlIGlu
Zm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1lc3NhZ2UgbWF5IGJlIGNvbmZpZGVudGlh
bCBhbmQgcHJvcHJpZXRhcnkgdG8gQW1lcmljYW4gTWVnYXRyZW5kcywgSW5jLiAgVGhpcyBj
b21tdW5pY2F0aW9uIGlzIGludGVuZGVkIHRvIGJlIHJlYWQgb25seSBieSB0aGUgaW5kaXZp
ZHVhbCBvciBlbnRpdHkgdG8gd2hvbSBpdCBpcyBhZGRyZXNzZWQgb3IgYnkgdGhlaXIgZGVz
aWduZWUuIElmIHRoZSByZWFkZXIgb2YgdGhpcyBtZXNzYWdlIGlzIG5vdCB0aGUgaW50ZW5k
ZWQgcmVjaXBpZW50LCB5b3UgYXJlIG9uIG5vdGljZSB0aGF0IGFueSBkaXN0cmlidXRpb24g
b2YgdGhpcyBtZXNzYWdlLCBpbiBhbnkgZm9ybSwgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4g
IFBsZWFzZSBwcm9tcHRseSBub3RpZnkgdGhlIHNlbmRlciBieSByZXBseSBlLW1haWwgb3Ig
YnkgdGVsZXBob25lIGF0IDc3MC0yNDYtODYwMCwgYW5kIHRoZW4gZGVsZXRlIG9yIGRlc3Ry
b3kgYWxsIGNvcGllcyBvZiB0aGUgdHJhbnNtaXNzaW9uLg0K
