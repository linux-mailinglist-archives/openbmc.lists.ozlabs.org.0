Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 785B743215
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2019 03:20:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PQsD0D9vzDqnT
	for <lists+openbmc@lfdr.de>; Thu, 13 Jun 2019 11:20:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=quantatw.com
 (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=060a2559f=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 45PQrg39v5zDqnn
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jun 2019 11:19:42 +1000 (AEST)
Received: from unknown (HELO mailbx07.quanta.corp) ([10.243.91.102])
 by mx02.quantatw.com with ESMTP; 13 Jun 2019 09:19:38 +0800
Received: from mailbx08.quanta.corp (10.243.91.103) by mailbx07.quanta.corp
 (10.243.91.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 13 Jun
 2019 09:18:36 +0800
Received: from mailbx08.quanta.corp ([192.168.1.8]) by mailbx08.quanta.corp
 ([192.168.1.8]) with mapi id 15.01.1713.004; Thu, 13 Jun 2019 09:18:36 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: RE: Repository for phosphor-nvme
Thread-Topic: Repository for phosphor-nvme
Thread-Index: AdUK8TnZQgSCiHBZSDKonbEkKk/RYQGUIFyAACNhQxAD0VJVgAAcTrmA
Date: Thu, 13 Jun 2019 01:18:36 +0000
Message-ID: <da5f8cede8f24ad3a49d421a381760c0@quantatw.com>
References: <59731b596a7048fab67aa03456c2058c@quantatw.com>
 <20190523163009.unv7lnvn6x7duieu@thinkpad>
 <cc95beae385043d2a491c84f363699d5@quantatw.com>
 <20190612194657.adqisdizqho5tyes@thinkpad.dyn.fuzziesquirrel.com>
In-Reply-To: <20190612194657.adqisdizqho5tyes@thinkpad.dyn.fuzziesquirrel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-12.0.0.1727-8.200.1013-24670.001
x-tm-as-result: No--11.519900-0.000000-31
x-tm-as-matchedid: 140026-150567-700225-703140-701090-703503-110462-703945-1
 39010-701443-704384-700488-703729-703956-704949-703655-701590-700139-704015
 -704714-700385-703937-704706-148004-148133-42000-42003-63
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

DQo+ID4gPkhpIEJyYWQsDQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4gPkNvdWxkIHlvdSBoZWxw
IGNyZWF0ZSByZXBvc2l0b3J5IGZvciAicGhvc3Bob3ItbnZtZSI/DQo+ID4NCj4gPiBEb25lLiAg
U29ycnkgYWJvdXQgdGhlIGRlbGF5Lg0KPiA+DQo+ID4gQXMgd2l0aCB0aGUgbGFzdCBjb3VwbGUg
bmV3IHJlcG9zIHRoYXQgaGF2ZSBiZWVuIGNyZWF0ZWQgeW91J2xsIGhhdmUNCj4gPiB0byB1c2Ug
Z2l0aHViIHB1bGwgcmVxdWVzdHMgdW50aWwgdGhlIGdlcnJpdC9naXRodWIgc3luY3Jvbml6YXRp
b24NCj4gPiBwcm9ibGVtIGNhbiBiZSBzb2x2ZWQuDQo+IA0KPiBIaSBUb255DQo+IA0KPiBJIGJl
bGlldmUgSSBoYXZlIGVuYWJsZWQgcmVwbGljYXRpb24gb24gcGhvc3Bob3ItbnZtZSwgc28geW91
IGNhbiBnbyBhaGVhZA0KPiBhbmQgdXNlIEdlcnJpdCBmb3IgY29kZSByZXZpZXdzIG9uIHBob3Nw
aG9yLW52bWUsIGFuZCBjaGFuZ2VzIHlvdSBtZXJnZQ0KPiB0aGVyZSB3aWxsIGF1dG9tYXRpY2Fs
bHkgYmUgcmVwbGljYXRlZCB0byBHaXRIdWIuDQo+IA0KPiB0aHggLSBicmFkDQoNCkhpIEJyYWQs
DQoNClRoYW5rcyBmb3IgdGhlIGhlbHAuDQoNClRoYW5rcw0KQmVzdCBSZWdhcmRzLA0KVG9ueQ0K
DQo=
