Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4116C07B
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 19:37:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pkwj1jjPzDqHj
	for <lists+openbmc@lfdr.de>; Thu, 18 Jul 2019 03:37:09 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pkw36ZfDzDqRK
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jul 2019 03:36:35 +1000 (AEST)
X-AuditID: ac1060b2-413ff70000003a7d-5a-5d2f59222bc5
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw1.ami.com (Symantec Messaging Gateway) with SMTP id
 84.B5.14973.2295F2D5; Wed, 17 Jul 2019 13:21:38 -0400 (EDT)
Received: from ATLMS2.us.megatrends.com ([fe80::29dc:a91e:ea0c:cdeb]) by
 atlms1.us.megatrends.com ([fe80::8c55:daf0:ef05:5605%12]) with mapi id
 14.03.0415.000; Wed, 17 Jul 2019 13:21:24 -0400
From: Chittari Pabba <ChittariP@ami.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: RE: BMC threat model docs
Thread-Topic: BMC threat model docs
Thread-Index: AQHVPLx/1NANaiahn0+A0GIZ/WE1UKbPDlTg
Date: Wed, 17 Jul 2019 17:21:24 +0000
Message-ID: <00DE8410EF1E8148ABEDA156FA727A3C03ED1D95CB@atlms2.us.megatrends.com>
References: <685b6066-fdd1-9fc7-82be-372f6ad9ff22@linux.ibm.com>
In-Reply-To: <685b6066-fdd1-9fc7-82be-372f6ad9ff22@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.100.135]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNIsWRmVeSWpSXmKPExsWyRiBhgq5SpH6sweuj4hYn1mxjsTjV8oLF
 gcljwqIDjB7nZyxkDGCKamC0SczLyy9JLElVSEktTrZVCijKLEtMrlRSyEyxVTJUUijISUxO
 zU3NK7FVSiwoSM1LUbLjUsAANkBlmXkKqXnJ+SmZeem2Sp7B/roWFqaWuoZKdiEZqQqZeWn5
 RbmJJZn5eQrJ+XklQNWpKUBRhYQuzoypez+zFHQIV7xq2cLUwHhCqIuRk0NCwETi26ulTF2M
 XBxCAruYJDZun8MO4RxmlDi/v5MdpIpNQEOi4ckTMFtEwEdidu8rJhBbWEBJ4tbjnWxdjBxA
 cWWJeXPjIEqMJDqvbmcDsVkEVCVe//vMCmLzCgRKvFjQzARSLiTgIPFmrxdImFPAUeL7qa8s
 IDajgBiQvQZsOrOAuMStJ/OZIO4UkFiy5zwzhC0q8fLxP1YIW0mi7+c6sAuYBTQl1u/Sh2hV
 lJjS/ZAdYqugxMmZT1gmMIrMQjJ1FkLHLCQds5B0LGBkWcUolFiSk5uYmZNebqiXmJupl5yf
 u4kREvObdjC2XDQ/xMjEwXiIUYKDWUmE1/ardqwQb0piZVVqUX58UWlOavEhRidgKExkluIG
 xQgwiuONDQykRGEcQxMzE3Mjc0NLE3NjYyVx3pVrvsUICaQDk0p2ampBahHMECYOTqkGxoxL
 d4M5ChdLO28+cfYEu+Yj9nfVJa9MxFYGtli/PlJxq3rGtVAh11U75917fNn43Kkm8x9sz490
 Lj8t//5yylIdl69pQkHZze8zVi4rcJvKvr91N4N+6BHXry3/1+TfUpj5OnnBgqvyvu4Kn1Zk
 Vb3umpTnHKw6s3L+xouyoTuP7nAqdjD201FiKc5INNRiLipOBAAB6y8tDgMAAA==
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

VGhhbmsgeW91LCBKb3NlcGgsIGZvciBxdWljayByZXNwb25zZSAhISEgSSB3aWxsIHJldmll
dyB0aGUgT3BlbiBCTUMgdGhyZWF0IG1vZGVsIGRvY3VtZW50IGFuZCB3aWxsIHByb3ZpZGUg
bXkgZmVlZGJhY2suIA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3Bl
bmJtYyA8b3BlbmJtYy1ib3VuY2VzK2NoaXR0YXJpcD1hbWkuY29tQGxpc3RzLm96bGFicy5v
cmc+IE9uIEJlaGFsZiBPZiBKb3NlcGggUmV5bm9sZHMNClNlbnQ6IFdlZG5lc2RheSwgSnVs
eSAxNywgMjAxOSAxMjoyNyBQTQ0KVG86IG9wZW5ibWMgPG9wZW5ibWNAbGlzdHMub3psYWJz
Lm9yZz4NClN1YmplY3Q6IEJNQyB0aHJlYXQgbW9kZWwgZG9jcw0KDQpJIGdvdCBhIHByaXZh
dGUgZW1haWwgYXNraW5nDQogPiBbd2hlcmUgYXJlIHRoZV0gQk1DIHByb2plY3QgdGhyZWF0
IG1vZGVsIGRvY3VtZW50cz8NCg0KVGhlIGFwcHJvdmVkIG5ldHdvcmsgdGhyZWF0IG1vZGVs
IGlzIGhlcmU6DQpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL2Jsb2IvbWFzdGVy
L3NlY3VyaXR5L25ldHdvcmstc2VjdXJpdHktY29uc2lkZXJhdGlvbnMubWQNCg0KVGhlIHRo
cmVhdCBtb2RlbCBpcyB2ZXJ5IGJhc2ljIGFuZCBkb2VzIGxpdHRsZSBtb3JlIHRoYW4gaWRl
bnRpZnkgT3BlbkJNQydzIG5ldHdvcmsgc2VydmljZXMuwqAgVGhlIGxldmVsIG9mIGRldGFp
bCB3YXMgaW5pdGlhbGx5IHN1cGVyZmljaWFsIHRvIGdldCBhcHByb3ZhbCBmb3IgdGhlIGRv
Y3VtZW50LsKgIEkgaG9wZSB0byBhZGQgbW9yZSBkZXRhaWxzIGFuZCBhZGQgbmV3IHNlY3Rp
b25zIGZvciBCTUMgbmV0d29yayBjb25uZWN0aW9ucyBpbmNsdWRpbmcgTERBUCwgcmVtb3Rl
IGxvZ2dpbmcsIHJlbW90ZSBtZWRpYSwgaXAta3ZtLCBldmVudCBzdWJzY3JpcHRpb25zLCBl
dGMuwqAgVGhlbiBhZGQgYSBzZWN0aW9uIGZvciBSZWRmaXNoIHNlY3VyaXR5IGNvbnNpZGVy
YXRpb25zLg0KDQpUaGUgbmV0d29yayB0aHJlYXQgbW9kZWwgaXMgb25seSBhIHN1YnNldCBv
ZiB0aGUgb3ZlcmFsbCBCTUMgdGhyZWF0IG1vZGVsLsKgIChGb3IgZXhhbXBsZSwgdGhlIEJN
QyBmYWNlcyB0aHJlYXRzIGZyb20gaXRzIGVudmlyb25tZW50IGFuZCBpdHMgaG9zdCBzeXN0
ZW0uKcKgIFRoZSBPcGVuQk1DIHByb2plY3QgaGFzIG5vIG92ZXJhbGwgQk1DIHRocmVhdCBt
b2RlbCwgYW5kIG1pbmUgaXMgaW4gcmV2aWV3IGhlcmU6DQpodHRwczovL2dlcnJpdC5vcGVu
Ym1jLXByb2plY3QueHl6L2Mvb3BlbmJtYy9kb2NzLysvMjI0MDQNCihZb3UgY2FuIGZpbmQg
b3RoZXIgdGhyZWF0IG1vZGVsIHJldmlld3MgYnkgc2VhcmNoaW5nIGdlcnJpdCBmb3IgInRo
cmVhdCIgb3IgInNlY3VyaXR5IikuDQoNCkkgYW0gdXNpbmcgbXkgcmV2aWV3IHRvIGNvbGxl
Y3QgaW5mb3JtYXRpb24gYWJvdXQgQk1DIHRocmVhdHMsIHdoaWNoIGluIHR1cm4gZGVwZW5k
cyBvbiBob3cgdGhlIEJNQyBpcyB1c2VkLCBzbyBJIGFtIGNvbGxlY3RpbmcgaW5mb3JtYXRp
b24gYWJvdXQgQk1DIHVzZSBjYXNlcyB0b28uwqAgQW55IGFuZCBhbGwgY29udHJpYnV0aW9u
cyBhcmUgd2VsY29tZSwgYW5kIGNhbiBiZSBhZGRlZCBhcyByZXZpZXcgY29tbWVudHMsIGVt
YWlsIHRvIHRoZSBjb21tdW5pdHksIG9yIGRpcmVjdGx5IHRvIG1lLiBJIGFtIHN0cnVnZ2xp
bmcgd2l0aCB0aGUgdGhyZWF0IG1vZGVsIHNjb3BlLCBhbmQgaG93IHRvIG9yZ2FuaXplIHRo
ZSBkb2N1bWVudC7CoCBBbnkgZmVlZGJhY2sgaXMgd2VsY29tZS4NCg0KLSBKb3NlcGgNCg0K
DQpQbGVhc2UgY29uc2lkZXIgdGhlIGVudmlyb25tZW50IGJlZm9yZSBwcmludGluZyB0aGlz
IGVtYWlsLg0KDQpUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgbWVzc2FnZSBt
YXkgYmUgY29uZmlkZW50aWFsIGFuZCBwcm9wcmlldGFyeSB0byBBbWVyaWNhbiBNZWdhdHJl
bmRzLCBJbmMuICBUaGlzIGNvbW11bmljYXRpb24gaXMgaW50ZW5kZWQgdG8gYmUgcmVhZCBv
bmx5IGJ5IHRoZSBpbmRpdmlkdWFsIG9yIGVudGl0eSB0byB3aG9tIGl0IGlzIGFkZHJlc3Nl
ZCBvciBieSB0aGVpciBkZXNpZ25lZS4gSWYgdGhlIHJlYWRlciBvZiB0aGlzIG1lc3NhZ2Ug
aXMgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHlvdSBhcmUgb24gbm90aWNlIHRoYXQg
YW55IGRpc3RyaWJ1dGlvbiBvZiB0aGlzIG1lc3NhZ2UsIGluIGFueSBmb3JtLCBpcyBzdHJp
Y3RseSBwcm9oaWJpdGVkLiAgUGxlYXNlIHByb21wdGx5IG5vdGlmeSB0aGUgc2VuZGVyIGJ5
IHJlcGx5IGUtbWFpbCBvciBieSB0ZWxlcGhvbmUgYXQgNzcwLTI0Ni04NjAwLCBhbmQgdGhl
biBkZWxldGUgb3IgZGVzdHJveSBhbGwgY29waWVzIG9mIHRoZSB0cmFuc21pc3Npb24uDQo=
