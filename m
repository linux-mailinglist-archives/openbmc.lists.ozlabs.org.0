Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E87101D27C4
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 08:28:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49N1n70PgnzDqYd
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 16:27:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=396a76c55=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 68 seconds by postgrey-1.36 at bilbo;
 Thu, 14 May 2020 16:27:15 AEST
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 49N1mM6kWvzDqS4
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 16:27:14 +1000 (AEST)
IronPort-SDR: 79xKSU1nv1pqKdbYP/SnJGYe8GxbhCiCKspneZOdvFHZduNnr4qfHcrC/ekM20kC34ihdoCPdm
 MyzxWWCI6/Cw==
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx02.quantatw.com with ESMTP; 14 May 2020 14:26:02 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 14 May
 2020 14:26:00 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Thu, 14 May 2020 14:26:00 +0800
From: =?utf-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
To: "prkatti1@in.ibm.com" <prkatti1@in.ibm.com>
Subject: RE: Test suite 'test_bmc_network_conf' in openbmc-test-automation
Thread-Topic: Test suite 'test_bmc_network_conf' in openbmc-test-automation
Thread-Index: AdYeEGdCkY6HbbSwSXGhsJ5X59kV2wAlK4OAAsS1SnA=
Date: Thu, 14 May 2020 06:26:00 +0000
Message-ID: <b77b57256b8e40e683f7f9ce6054626e@quantatw.com>
References: <77fbcecc2f4b4ceab3dca7319b2a9f66@quantatw.com>
 <CAAMkS13sM+zjAmSGp9Vx1O-ocWbLDcwgft18iruM96BS7wMx8A@mail.gmail.com>
In-Reply-To: <CAAMkS13sM+zjAmSGp9Vx1O-ocWbLDcwgft18iruM96BS7wMx8A@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-snts-smtp: 846634428FEDEC592B7F3D1E3F1F91B05AE846BECF6702E0F616CEA91875EB052000:8
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

SGkgUHJhc2hhbnRoLA0KDQpEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgZm9yIHRoaXMgaXNz
dWU/IFdpbGwgdGhlc2UgY2FzZXMgYWxzbyBmYWlsIGluIHlvdXIgZW52aXJvbm1lbnQ/DQoNClRo
YW5rcw0KQmVzdCBSZWdhcmRzLA0KVG9ueQ0KDQpGcm9tOiBSYWh1bCBNYWhlc2h3YXJpIDxyYWh1
bG1haGVzaHdhcmkwMUBnbWFpbC5jb20+IA0KU2VudDogVGh1cnNkYXksIEFwcmlsIDMwLCAyMDIw
IDg6MDkgUE0NClRvOiBUb255IExlZSAo5p2O5paH5a+MKSA8VG9ueS5MZWVAcXVhbnRhdHcuY29t
Pg0KQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KU3ViamVjdDogUmU6IFRlc3Qgc3VpdGUg
J3Rlc3RfYm1jX25ldHdvcmtfY29uZicgaW4gb3BlbmJtYy10ZXN0LWF1dG9tYXRpb24NCg0KbWFp
bHRvOnBya2F0dGkxQGluLmlibS5jb20NCg0KUHJhc2hhbnQNCkNhbiB5b3UgbG9vayBhdCB0aGlz
IHF1ZXJ5Pw0KDQpUaGFua3MsDQpSYWh1bA0KDQpPbiBXZWQsIEFwciAyOSwgMjAyMCBhdCAzOjU2
IFBNIFRvbnkgTGVlICjmnY7mloflr4wpIDxtYWlsdG86VG9ueS5MZWVAcXVhbnRhdHcuY29tPiB3
cm90ZToNCkhpIFJhaHVsLCANCg0KQ2FzZXMgbGlrZSAnQ29uZmlndXJlIEJyb2FkY2FzdCBJUCcs
ICdDb25maWd1cmUgTXVsdGljYXN0IElQJyBhbmQgJ0NvbmZpZ3VyZSBMb29wYmFjayBJUCcgaW4g
cmVkZmlzaCB0ZXN0X2JtY19uZXR3b3JrX2NvbmYucm9ib3QuDQpJbiB0aGVzZSBjYXNlcywgd2hl
biB1c2luZyByZWRmaXNoIHRvIHNldCBhbiBpbnZhbGlkIHR5cGUgaXAgKHN1Y2ggYXMgYnJvYWRj
YXN0IGlwKSwgYW4gSFRUUF9CQURfUkVRVUVTVCByZXNwb25zZSBpcyBleHBlY3RlZC4NCg0KSG93
ZXZlciwgdGhlIGludmFsaWQgdHlwZSBpcCBpbiBvcGVuYm1jIHJlcG8gJ2JtY3dlYicgaGFzIG5v
IHJlc3RyaWN0aW9ucy4NClRoZXJlZm9yZSwgdGhvc2UgdGVzdCBjYXNlcyByZWxhdGVkIHRvIHNl
dHRpbmcgaW52YWxpZCB0eXBlIGlwIG9yIGdhdGV3YXkgd2lsbCBmYWlsLg0KDQpEbyB5b3UgaGF2
ZSBhbnkgc3VnZ2VzdGlvbnMgZm9yIHRoaXMgaXNzdWU/IFdpbGwgdGhlc2UgY2FzZXMgYWxzbyBm
YWlsIGluIHlvdXIgZW52aXJvbm1lbnQ/DQoNClRoYW5rcw0KQmVzdCBSZWdhcmRzLA0KVG9ueQ0K
DQo=
