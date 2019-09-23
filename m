Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB65BBAD84
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 07:43:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cCsX5WnGzDqM3
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 15:43:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=162af5dca=will.liang@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 70 seconds by postgrey-1.36 at bilbo;
 Mon, 23 Sep 2019 15:42:34 AEST
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 46cCrp2F6BzDqFF
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 15:42:32 +1000 (AEST)
Received: from unknown (HELO mailbx12.quanta.corp) ([10.243.91.109])
 by mx02.quantatw.com with ESMTP; 23 Sep 2019 13:41:18 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx12.quanta.corp
 (10.243.91.109) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 23 Sep
 2019 13:41:16 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Mon, 23 Sep 2019 13:41:15 +0800
From: =?big5?B?V2lsbCBMaWFuZyAoseelw7liKQ==?= <Will.Liang@quantatw.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Questions of openbmc-test-automation
Thread-Topic: Questions of openbmc-test-automation
Thread-Index: AdVx0P1eBqQZB68LR7SxY3B/v1ijag==
Date: Mon, 23 Sep 2019 05:41:15 +0000
Message-ID: <a1b7c13a259b4e259796bbcf07834ae7@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-24928.000
x-tm-as-result: No-10--4.692600-5.000000
x-tmase-matchedrid: GBgFBUqwD4Gb5g0gI2gnR5zEHTUOuMX33dCmvEa6IiEwneWeZqRldCEP
 i3T0m113CxmBUpvLT/j0MrpnqoHQfET9KnQ8PcbHR4PPMO+JjQ6sU/iX0A2wjzLylsg8ZKqliMD
 6wB/IizLcywuObjo1nJEOYQ7YFMsPTweK12oEGfsNWST4IbzspxfbPFE2GHrVvGAx/1ATZ5t/HZ
 ivtns2jD1Lbqp/vHdw703hU3XN9hy35J/JantqGgPZZctd3P4BReO1woEOVTeXBXaJoB9JZ4MbH
 85DUZXy3QfwsVk0Ubt2gyyw2xTBhZx/gxjdJPCdUQwf3wYrZIXgVildYWheOP78OJA8oFEt0LK8
 sRJ+ftfiQG4tWCftl/qCCqMDdU6iRuK0Zqqt8HTzPQ4scHsdE7ZyCaqBVvUQlCuyVnTLq5sVeXF
 y3Qdw7wCsa7rqKSmJmFdpTdj6xmo=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--4.692600-5.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-24928.000
x-tm-snts-smtp: E060C1EF3195816F6E49C0E3A1086F1D776358118A125DAB91B556C5C88248CE2000:B
Content-Type: text/plain; charset="big5"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksDQoNCkkgdXNlIHRoZSAib3BlbmJtYy10ZXN0LWF1dG9tYXRpb24iIHBhY2thZ2UgdG8gdGVz
dCBvdXIgcHJvamVjdC4NCkFuZCBJIGp1c3Qgd2FudCB0byBpbXBsZW1lbnQgdGhlIElQTUkgdGVz
dCBjYXNlIGJlY2F1c2Ugb3VyIHBsYXRmb3JtIGRvZXMgbm90IHN1cHBvcnQgUkVERklTSCAoSVBN
SSBvbmx5KS4NCkJ1dCBJIGZvdW5kIHRoYXQgaW4gdGhlIElQTUkgdGVzdCBjYXNlLCBpdCB1c2Ug
dGhlIFJFRklTSCBjb21tYW5kIGFzIHdlbGwgKGVnIFJlZGZpc2ggcG93ZXIgb25bMF0pLg0KDQpb
MF0gaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvb3BlbmJtYy10ZXN0LWF1dG9tYXRpb24vYmxv
Yi8yYTUyMGVlMzdjNzJlYTg0N2NhMmQ2Yzc3MzQ5M2E2ZGQ3NTJjODI3L2lwbWkvdGVzdF9pcG1p
X3Nkci5yb2JvdCNMNTkNCg0KTXkgcXVlc3Rpb25zIGFyZSBmb2xsb3dpbmc6DQoxLiBBcmUgdGhl
cmUgb3RoZXIgd2F5cyB0byBhdm9pZCB1c2luZyB0aGUgUmVkZmlzaCBjb21tYW5kcz8NCjIuIElz
IGl0IHBvc3NpYmxlIHRvIGFkZCBwYXJhbWV0ZXIoZXg6UFJPVE9DT0wpIG9uIHRoZSBjb21tYW5k
IGxpbmUgdG8gc2VsZWN0IHRoZSBwcm90b2NvbCB0byB1c2U/DQpGb3IgZXhhbXBsZToNCi0gYWRk
IHRoZSBuZXcga2V5d29yZCBtYXliZSBsaWtlICJQb3dlciBPbiIuDQotIGFuZCB0aGUgbmV3IGtl
eXdvcmQgInBvd2VyIG9uIiBjYW4gdXNlIHRoZSBuZXcgcGFyYW1ldGVyIHRvIGNob29zZSB3aGF0
IHByb3RvY29sIGJlIHVzZWQoZGVmYXVsdCBwcm90b2NvbCBpcyBSRURGSVNIIGlmIG5vdCBzZXQp
Lg0KLSB0aGUgbmV3IGtleXdvcmQgbGlrZSBiZWxvdzoNClBvd2VyIE9uDQogICAgW0RvY3VtZW50
YXRpb25dICBzZWxlY3QgdGhlIGV4ZWN1dGUgcHJvdG9jb2wuDQogICAgW0FyZ3VtZW50c10gICR7
c3RhY2tfbW9kZX09JHtzdGFja19tb2RlfSAgJHtxdWlldH09JHtxdWlldH0NCg0KICAgIFJ1biBL
ZXl3b3JkIElmICAnJHtQUk9UT0NPTH0nID09ICdSZWRmaXNoJw0KICAgIC4uLiAgIFJlZGZpc2gg
UG93ZXIgT24gICAgc3RhY2tfbW9kZT1za2lwICAgIHF1aWV0PTANCiAgICAuLi4gICBFTFNFICAg
IElQTUkgUG93ZXIgT24gICAgc3RhY2tfbW9kZT1za2lwICAgIHF1aWV0PTANCg0KQlJzDQpXaWxs
DQo=
