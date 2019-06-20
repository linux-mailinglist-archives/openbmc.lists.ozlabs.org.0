Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8624C857
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 09:24:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ttbf5DgmzDr1C
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 17:23:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.70.114; helo=nam04-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="EbJVdto1"; dkim-atps=neutral
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700114.outbound.protection.outlook.com [40.107.70.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TsFf5ymBzDqBW
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 16:23:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=N2qBRKG9Lr2NaIZshFSpf2oDsPqTqRU9Je3U5E77S0vjd4oTCS1j5GIFIkHjHyX9Yq6LWQPWPBAyjpysEilYqj3NSGXbhOxvlutkBQS/gD4tA3233Ax9SV+qg7I0Orx1QmHk5XsnH4Pfg5SbL0StV9cQhFrv3fTd5dFlhcXiYZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ef60O3SxYEMxddK9dQz+PdJYCPTMQ0HEnJxuT5QFf5c=;
 b=XE6ojTrVm1ArXhKLTnpW44WvnfZ11bD3MkTD1za022YqV7te9CbWKCp7BshkbIvtTqNf/Z1NUCRuLzNDStk5QFyMyXIogJtdcoT4xJu2hdYXku22rQGQJG6ntRBZJ/I9MwcSKBjvJtdm545t1ie/xJF+9CIUVoVfmtUeIAFUh7w=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ef60O3SxYEMxddK9dQz+PdJYCPTMQ0HEnJxuT5QFf5c=;
 b=EbJVdto1aoalaHiCHG2bxpk4Gf0ks25YPJs1KHnakNvD2CC5RwC3HWrUqNVVyo3huH7lixXzK7tI1nGuhmbF/pxuv4VqTLeTKiNudNqTpz0AyT0Q2yYZxklWI/h8ClYVrGpOQXVFzERwxKqnFtyc3vok0JWaxvjyVVitnCHcZg0=
Received: from SN6PR2101MB0943.namprd21.prod.outlook.com (52.132.114.20) by
 SN6PR2101MB1055.namprd21.prod.outlook.com (52.132.115.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.4; Thu, 20 Jun 2019 06:23:09 +0000
Received: from SN6PR2101MB0943.namprd21.prod.outlook.com
 ([fe80::f515:8559:732f:930e]) by SN6PR2101MB0943.namprd21.prod.outlook.com
 ([fe80::f515:8559:732f:930e%8]) with mapi id 15.20.2032.005; Thu, 20 Jun 2019
 06:23:09 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Patrick Venture <venture@google.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: RE: phosphor-ipmi-flash making progress!
Thread-Topic: phosphor-ipmi-flash making progress!
Thread-Index: AQHVIYQAUgxH9LDCREqvqwOwXfgzG6akHSIQ
Date: Thu, 20 Jun 2019 06:23:09 +0000
Message-ID: <SN6PR2101MB0943F194BD7DF1868ADED4DDC8E40@SN6PR2101MB0943.namprd21.prod.outlook.com>
References: <CAO=notz0NB0+A6LivrKs7+i4nkWE_dWjBP8qV-q41FesZRsUeg@mail.gmail.com>
In-Reply-To: <CAO=notz0NB0+A6LivrKs7+i4nkWE_dWjBP8qV-q41FesZRsUeg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-06-20T06:23:07.6799279Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=7a533b3f-c13d-4db1-8797-9558665ff4fd;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.47.128.230]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef48435c-d104-403b-208f-08d6f547c3c8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR2101MB1055; 
x-ms-traffictypediagnostic: SN6PR2101MB1055:
x-microsoft-antispam-prvs: <SN6PR2101MB105590BB13B2D2DEC729F124C8E40@SN6PR2101MB1055.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(346002)(39860400002)(376002)(136003)(189003)(13464003)(199004)(6246003)(73956011)(305945005)(81156014)(7696005)(6436002)(486006)(53936002)(7736002)(76176011)(66066001)(74316002)(8676002)(66946007)(66556008)(81166006)(229853002)(446003)(3846002)(186003)(64756008)(6116002)(11346002)(52536014)(66446008)(76116006)(8936002)(33656002)(68736007)(476003)(86362001)(102836004)(55016002)(5660300002)(14454004)(25786009)(8990500004)(9686003)(53546011)(10090500001)(478600001)(66476007)(6506007)(26005)(22452003)(14444005)(256004)(316002)(110136005)(10290500003)(3480700005)(71190400001)(71200400001)(99286004)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR2101MB1055;
 H:SN6PR2101MB0943.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: cdor2O1DrAxm4nZKJMajyRusI7YSFD3Pfu+6AeA6R9KGTveUUoQO5MSV7QZxSnt/mARbqtFziqdrErfkZR4hszbiQpKdWxzOBCkMf3UfkRDAGrp8kL80vk/9iZZcVD6lKTdh1muso/Qwb4wRtAKdH8qxaGAE/1wV1YTHJlGUkeZl6SVjiiTYF2t3Oi4TbOXJ+Rm1wWKS65HZd80X2r7cPzT4VyXNfggfnVPcdLlOeA7uaz2di5f3LnV6w2nkoo8LNMOMtW+M3ZZSoAfGH7RpPBhlFsb4GPvRSNRRJZ1B4MalGHjNj3QVVt0M1cFlZJA/fHpdWdCZ8HPQe/W6br1BPwoOqnG2j8DHnscAIXGsWtuZ89vqSRoG3WyjyPstlLxUDXGdy2kPtgq0g58vGAr7CBEW0oMCQQ+BHfLj2trcEik=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef48435c-d104-403b-208f-08d6f547c3c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 06:23:09.4480 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neladk@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR2101MB1055
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

V2hhdCBhcmUgaW4tYmFuZCB1cGRhdGUgbWV0aG9kcyBmb3IgT3BlbkJNQz8gSSBzZWUgdGhpcyhw
aG9zcGhvci1pcG1pLWZsYXNoKSBjYW4gdGFrZSB0YWtlcyB+MyBob3VycyBvdmVyIElQTUkuIFdo
YXQgaXMgdGhlIHNvbHV0aW9uIGZvciBpbi1iYW5kIHVwZGF0ZT8gIHdoYXQgdG9vbHMgY2FuIGJl
IHVzZWQ/DQoNCk5lZXJhag0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3Bl
bmJtYyA8b3BlbmJtYy1ib3VuY2VzK25lbGFkaz1taWNyb3NvZnQuY29tQGxpc3RzLm96bGFicy5v
cmc+IE9uIEJlaGFsZiBPZiBQYXRyaWNrIFZlbnR1cmUNClNlbnQ6IFdlZG5lc2RheSwgSnVuZSAx
MiwgMjAxOSA2OjA0IFBNDQpUbzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0BsaXN0cy5vemxh
YnMub3JnPg0KU3ViamVjdDogcGhvc3Bob3ItaXBtaS1mbGFzaCBtYWtpbmcgcHJvZ3Jlc3MhDQoN
CkZvciB0aG9zZSBpbnRlcmVzdGVkIHBhcnRpZXMsIHBob3NwaG9yLWlwbWktZmxhc2ggd2hpY2gg
cHJvdmlkZXMgYSB2YXJpZXR5IG9mIG91dC1vZi1iYW5kIG1lY2hhbmlzbXMgZm9yIHVwZGF0aW5n
IHRoZSBCTUMgaW4gYSBmdWxseS1jb25maWd1cmFibGUgbWFubmVyIGlzIG5lYXJseSByZWFkeSBm
b3Igd2lkZSBkaXN0cmlidXRpb24uDQoNCkN1cnJlbnRseSBzdXBwb3J0ZWQ6IGFzcGVlZC1wMmEt
Y3RybCAoaXBtaXBjaSksIGFuZCBpbmJhbmQgKGlwbWlidCkqIFNob3J0bHkgc3VwcG9ydGVkOiBh
c3BlZWQtbHBjLWN0cmwgKGlwbWlscGMpDQoNCipUaGVyZSBpcyBhIGJ1ZyBpbiB0aGUgdHJhbnNt
aXQgYnVmZmVyIHNpemUgZGVwZW5kaW5nIG9uIHdoZXRoZXIgaXQncyBvdmVyIEtDUyB2ZXJzdXMg
YWN0dWFsbHkgQlQgc2luY2UgQlQgaGFzIGEgc21hbGxlciBidWZmZXIgcmVxdWlyZW1lbnQuDQoN
ClVCSSBUYXJiYWxsIHVwZGF0ZXMgYXJlbid0IHlldCBzdXBwb3J0ZWQsIGJ1dCB0aGF0J3Mgb25s
eSBhIG1hdHRlciBvZiBzb21lb25lIHdyaXRpbmcgYW4gdXBkYXRlIGhhbmRsZXIuICBUaGUgZmly
bXdhcmUgaGFuZGxlciBvbiB0aGUgQk1DIGNhbiBiZSBleHRlbmRlZCBlYXNpbHkgdG8gc3VwcG9y
dCBhIHZhcmlldHkgb2YgdmVyaWZpY2F0aW9uIGFuZCB1cGRhdGUgbWVjaGFuaXNtcy4gIFRoZSBk
ZWZhdWx0IGJlaGF2aW9yIGlzIHRvIGxldmVyYWdlIGEgc2VydmljZSBmb3IgZWFjaCBvZiB0aGVz
ZSB0aGluZ3MuICBPbmUgY2FuIGltcGxlbWVudCB3aGF0ZXZlciB0aGV5IHJlYWxseSB3YW50IGZv
ciBlYWNoIHNlcnZpY2UuDQoNClRoZSBmaWxlIHNlbnQgdG8gdGhlIEJNQyBpc24ndCByZXF1aXJl
ZCB0byBoYXZlIGEgc2lnbmF0dXJlIGZpbGUuICBPbmUgY291bGQgc2ltcGx5IHNraXAgc2VuZGlu
ZyB0aGUgaGFzaCBmaWxlIGFuZCBoYXZlIGEgdmVyaWZpY2F0aW9uIHN0ZXAgdGhhdCBkb2Vzbid0
IGRvIGFueXRoaW5nIHNwZWNpYWwuICBTbywgaXQncyB2ZXJ5IGZsZXhpYmxlLg0KDQpIZXJlJ3Mg
c29tZSBvdXRwdXQ6DQoNCiQgLi9waG9zcGhvcl9pcG1pX2ZsYXNoX3Rvb2wgLS1jb21tYW5kIHVw
ZGF0ZSAtLWludGVyZmFjZSBpcG1pcGNpIC0taW1hZ2UgaW1hZ2UtYm1jIC0tc2lnIGltYWdlLWJt
Yy5zaWcNCg0KU2VuZGluZyBvdmVyIHRoZSBmaXJtd2FyZSBpbWFnZS4NClsweDFhMDMgMHgyMDAw
XQ0KVGhlIGJyaWRnZSBpcyBlbmFibGVkIQ0KUmVjZWl2ZWQgYWRkcmVzczogMHg0N2ZmMDAwMA0K
U2VuZGluZyBvdmVyIHRoZSBoYXNoIGZpbGUuDQpbMHgxYTAzIDB4MjAwMF0NClRoZSBicmlkZ2Ug
aXMgZW5hYmxlZCENClJlY2VpdmVkIGFkZHJlc3M6IDB4NDdmZjAwMDANCg0KT3BlbmluZyB0aGUg
dmVyaWZpY2F0aW9uIGZpbGUNCkNvbW1pdHRpbmcgdG8gL2ZsYXNoL3ZlcmlmeSBmaWxlIHRvIHRy
aWdnZXIgc2VydmljZSBDYWxsaW5nIHN0YXQgb24gL2ZsYXNoL3ZlcmlmeSBzZXNzaW9uIHRvIGNo
ZWNrIHN0YXR1cyBvdGhlciBydW5uaW5nIHJ1bm5pbmcgc3VjY2VzcyBSZXR1cm5lZCBzdWNjZXNz
IHN1Y2NlZWRlZA0KDQpPcGVuaW5nIHRoZSB1cGRhdGUgZmlsZQ0KQ29tbWl0dGluZyB0byAvZmxh
c2gvdXBkYXRlIGZpbGUgdG8gdHJpZ2dlciBzZXJ2aWNlIENhbGxpbmcgc3RhdCBvbiAvZmxhc2gv
dXBkYXRlIHNlc3Npb24gdG8gY2hlY2sgc3RhdHVzIHJ1bm5pbmcgRXhjZXB0aW9uIHJlY2VpdmVk
OiBibG9iIGV4Y2VwdGlvbiByZWNlaXZlZDogUmVjZWl2ZWQgSVBNSV9DQzogYnVzeQ0KDQpPbiB0
aGUgQk1DOg0Kc2h1dGRvd246IHJlYm9vdCAtLXRpbWVvdXQgOTAwMDAwMDB1cyAtLWxvZy1sZXZl
bCA2IC0tbG9nLXRhcmdldCBrbXNnIC0tbG9nLWNvbG9yDQorIGF3ayAnL29sZHJvb3R8bW50LyB7
IHByaW50ICQyIH0nDQorIHNvcnQgLXINCisgdW1vdW50IC9vbGRyb290L3N5cy9rZXJuZWwvZGVi
dWcNCisgdW1vdW50IC9vbGRyb290L3N5cy9mcy9jZ3JvdXAvdW5pZmllZA0KKyB1bW91bnQgL29s
ZHJvb3Qvc3lzL2ZzL2Nncm91cC9zeXN0ZW1kDQorIHVtb3VudCAvb2xkcm9vdC9zeXMvZnMvY2dy
b3VwDQorIHVtb3VudCAvb2xkcm9vdC9zeXMvZnMvYnBmDQorIHVtb3VudCAvb2xkcm9vdC9zeXMN
CisgdW1vdW50IC9vbGRyb290L3Byb2MNCisgdW1vdW50IC9vbGRyb290L2Rldi9zaG0NCisgdW1v
dW50IC9vbGRyb290L2Rldi9wdHMNCisgdW1vdW50IC9vbGRyb290L2Rldg0KKyB1bW91bnQgL29s
ZHJvb3QNCisgdW1vdW50IC9tbnQvaW5pdHJhbWZzL3J3DQorIHVtb3VudCAvbW50L2luaXRyYW1m
cy9ybw0KKyB1bW91bnQgL21udA0KKyBzZXQgK3gNClBpbmdpbmcgd2F0Y2hkb2cgd2l0aCBhcmdz
IC10IDEgLVQgNQ0KdXBkYXRlOiAtLWNsZWFuLXNhdmVkLWZpbGVzDQpbIDgyNDAuODE3ODAxXSBq
ZmZzMjogbm90aWNlOiAoMTE3MSkgamZmczJfYnVpbGRfeGF0dHJfc3Vic3lzdGVtOg0KY29tcGxl
dGUgYnVpbGRpbmcgeGF0dHIgc3Vic3lzdGVtLCAxNyBvZiB4ZGF0dW0gKDE1IHVuY2hlY2tlZCwg
MQ0Kb3JwaGFuKSBhbmQgMzAgb2YgeHJlZiAoMSBkZWFkLCAwIG9ycGhhbikgZm91bmQuDQpVcGRh
dGluZyBibWMuLi4NCkVyYXNpbmcgYmxvY2s6IDY5LzUxMiAoMTMlKQ0KDQpHaXZlbiBhIEJNQyBj
b25maWd1cmF0aW9uOg0KRVhUUkFfT0VDT05GX2FwcGVuZF9xdWFudGEtcTcxbCA9ICIgLS1lbmFi
bGUtc3RhdGljLWxheW91dCINCkVYVFJBX09FQ09ORl9hcHBlbmRfcXVhbnRhLXE3MWwgPSAiIC0t
ZW5hYmxlLXBjaS1icmlkZ2UiDQpFWFRSQV9PRUNPTkZfYXBwZW5kX3F1YW50YS1xNzFsID0gIiAt
LWVuYWJsZS1hc3BlZWQtcDJhIg0KRVhUUkFfT0VDT05GX2FwcGVuZF9xdWFudGEtcTcxbCA9ICIg
LS1lbmFibGUtcmVib290LXVwZGF0ZSINCkVYVFJBX09FQ09ORl9hcHBlbmRfcXVhbnRhLXE3MWwg
PSAiIE1BUFBFRF9BRERSRVNTPTB4NDdGRjAwMDAiDQoNCg0KUGF0cmljaw0K
