Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 493921D27EB
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 08:34:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49N1x14R9hzDqZ1
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 16:34:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=219.87.191.90; helo=mx01.quantatw.com;
 envelope-from=prvs=396a76c55=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx01.quantatw.com (mx01.quantatw.com [219.87.191.90])
 by lists.ozlabs.org (Postfix) with ESMTP id 49N1w60WWYzDqD5
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 16:33:56 +1000 (AEST)
IronPort-SDR: zQV/YIf3NMnk5mfpa5CVWoung5gz6NwGKr9sj00r6RdR3D4tFYNYOWlPDP0lB3aCApvxk7fbTf
 ZommlS0WOFww==
Received: from unknown (HELO mailbx08.quanta.corp) ([10.243.91.103])
 by mx01.quantatw.com with ESMTP; 14 May 2020 14:33:53 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx08.quanta.corp
 (10.243.91.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 14 May
 2020 14:33:51 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Thu, 14 May 2020 14:33:51 +0800
From: =?utf-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
To: Prashanth Katti1 <prkatti1@in.ibm.com>
Subject: RE: Test suite 'test_bmc_network_conf' in openbmc-test-automation
Thread-Topic: Test suite 'test_bmc_network_conf' in openbmc-test-automation
Thread-Index: AdYeEGdCkY6HbbSwSXGhsJ5X59kV2wAlK4OAAsS1SnD//3xcgP//eXdQ
Date: Thu, 14 May 2020 06:33:51 +0000
Message-ID: <3e4fad250657417dbd5e637ae1d1ef74@quantatw.com>
References: <77fbcecc2f4b4ceab3dca7319b2a9f66@quantatw.com>
 <CAAMkS13sM+zjAmSGp9Vx1O-ocWbLDcwgft18iruM96BS7wMx8A@mail.gmail.com>
 <b77b57256b8e40e683f7f9ce6054626e@quantatw.com>
 <OFC9095D4F.198D5617-ON00258568.002386A2-65258568.0023B678@notes.na.collabserv.com>
In-Reply-To: <OFC9095D4F.198D5617-ON00258568.002386A2-65258568.0023B678@notes.na.collabserv.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 27819CA4EC47C935E03BCCF3EB846BFC973892A9151996064036A2F6F0ACF6A82000:8
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SSBzZWUuIFRoYW5rIHlvdSBmb3IgdGhlIGluZm9ybWF0aW9uLg0KDQpUb255DQoNCkZyb206IFBy
YXNoYW50aCBLYXR0aTEgPHBya2F0dGkxQGluLmlibS5jb20+IA0KU2VudDogVGh1cnNkYXksIE1h
eSAxNCwgMjAyMCAyOjMwIFBNDQpUbzogVG9ueSBMZWUgKOadjuaWh+WvjCkgPFRvbnkuTGVlQHF1
YW50YXR3LmNvbT4NCkNjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJFOiBU
ZXN0IHN1aXRlICd0ZXN0X2JtY19uZXR3b3JrX2NvbmYnIGluIG9wZW5ibWMtdGVzdC1hdXRvbWF0
aW9uDQoNCkhpIFRvbnksDQpUaGVzZSB0ZXN0cyBmYWlsIGZvciB1cyBhbHNvLiBCdXQgd2Ugc2tp
cCB0aGVzZSB0ZXN0cyB3aGlsZSBydW5uaW5nIG5ldHdvcmsgc3VpdGUuDQoNClByYXNoYW50aCBL
YXR0aQ0KDQoNCg0KRnJvbTogwqAgwqAgwqAgwqAiVG9ueSBMZWUgKOadjuaWh+WvjCkiIDxtYWls
dG86VG9ueS5MZWVAcXVhbnRhdHcuY29tPg0KVG86IMKgIMKgIMKgIMKgIm1haWx0bzpwcmthdHRp
MUBpbi5pYm0uY29tIiA8bWFpbHRvOnBya2F0dGkxQGluLmlibS5jb20+DQpDYzogwqAgwqAgwqAg
wqAibWFpbHRvOm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyIgPG1haWx0bzpvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmc+DQpEYXRlOiDCoCDCoCDCoCDCoDE0LTA1LTIwMjAgMTE6NTYNClN1YmplY3Q6
IMKgIMKgIMKgIMKgW0VYVEVSTkFMXSBSRTogVGVzdCBzdWl0ZSAndGVzdF9ibWNfbmV0d29ya19j
b25mJyBpbiBvcGVuYm1jLXRlc3QtYXV0b21hdGlvbg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXw0KDQoNCg0KSGkgUHJhc2hhbnRoLA0KDQpEbyB5b3UgaGF2ZSBhbnkg
c3VnZ2VzdGlvbnMgZm9yIHRoaXMgaXNzdWU/IFdpbGwgdGhlc2UgY2FzZXMgYWxzbyBmYWlsIGlu
IHlvdXIgZW52aXJvbm1lbnQ/DQoNClRoYW5rcw0KQmVzdCBSZWdhcmRzLA0KVG9ueQ0KDQpGcm9t
OiBSYWh1bCBNYWhlc2h3YXJpIDxtYWlsdG86cmFodWxtYWhlc2h3YXJpMDFAZ21haWwuY29tPiAN
ClNlbnQ6IFRodXJzZGF5LCBBcHJpbCAzMCwgMjAyMCA4OjA5IFBNDQpUbzogVG9ueSBMZWUgKOad
juaWh+WvjCkgPG1haWx0bzpUb255LkxlZUBxdWFudGF0dy5jb20+DQpDYzogbWFpbHRvOm9wZW5i
bWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6IFRlc3Qgc3VpdGUgJ3Rlc3RfYm1jX25l
dHdvcmtfY29uZicgaW4gb3BlbmJtYy10ZXN0LWF1dG9tYXRpb24NCg0KbWFpbHRvOnBya2F0dGkx
QGluLmlibS5jb20NCg0KUHJhc2hhbnQNCkNhbiB5b3UgbG9vayBhdCB0aGlzIHF1ZXJ5Pw0KDQpU
aGFua3MsDQpSYWh1bA0KDQpPbiBXZWQsIEFwciAyOSwgMjAyMCBhdCAzOjU2IFBNIFRvbnkgTGVl
ICjmnY7mloflr4wpIDxtYWlsdG86VG9ueS5MZWVAcXVhbnRhdHcuY29tPiB3cm90ZToNCkhpIFJh
aHVsLCANCg0KQ2FzZXMgbGlrZSAnQ29uZmlndXJlIEJyb2FkY2FzdCBJUCcsICdDb25maWd1cmUg
TXVsdGljYXN0IElQJyBhbmQgJ0NvbmZpZ3VyZSBMb29wYmFjayBJUCcgaW4gcmVkZmlzaCB0ZXN0
X2JtY19uZXR3b3JrX2NvbmYucm9ib3QuDQpJbiB0aGVzZSBjYXNlcywgd2hlbiB1c2luZyByZWRm
aXNoIHRvIHNldCBhbiBpbnZhbGlkIHR5cGUgaXAgKHN1Y2ggYXMgYnJvYWRjYXN0IGlwKSwgYW4g
SFRUUF9CQURfUkVRVUVTVCByZXNwb25zZSBpcyBleHBlY3RlZC4NCg0KSG93ZXZlciwgdGhlIGlu
dmFsaWQgdHlwZSBpcCBpbiBvcGVuYm1jIHJlcG8gJ2JtY3dlYicgaGFzIG5vIHJlc3RyaWN0aW9u
cy4NClRoZXJlZm9yZSwgdGhvc2UgdGVzdCBjYXNlcyByZWxhdGVkIHRvIHNldHRpbmcgaW52YWxp
ZCB0eXBlIGlwIG9yIGdhdGV3YXkgd2lsbCBmYWlsLg0KDQpEbyB5b3UgaGF2ZSBhbnkgc3VnZ2Vz
dGlvbnMgZm9yIHRoaXMgaXNzdWU/IFdpbGwgdGhlc2UgY2FzZXMgYWxzbyBmYWlsIGluIHlvdXIg
ZW52aXJvbm1lbnQ/DQoNClRoYW5rcw0KQmVzdCBSZWdhcmRzLA0KVG9ueQ0KDQoNCg0K
