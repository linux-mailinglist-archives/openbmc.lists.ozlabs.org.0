Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C91FCE6C81
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 07:43:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471lXQ2pxszDqdc
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 17:43:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quantatw.com (client-ip=220.128.79.91; helo=mx02.quantatw.com;
 envelope-from=prvs=197a09fd4=tony.lee@quantatw.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=quantatw.com
X-Greylist: delayed 68 seconds by postgrey-1.36 at bilbo;
 Mon, 28 Oct 2019 17:42:19 AEDT
Received: from mx02.quantatw.com (mx02.quantatw.com [220.128.79.91])
 by lists.ozlabs.org (Postfix) with ESMTP id 471lWb6SKrzDqNx
 for <openbmc@lists.ozlabs.org>; Mon, 28 Oct 2019 17:42:18 +1100 (AEDT)
IronPort-SDR: TrPllIz90lcf54QFHNFLztB6fM8xI+nb1qMFf9OEx3o2h4EVYdFpT0de5ildBeS0i5vv7dpZYY
 4UX6dv3Nr77w==
Received: from unknown (HELO mailbx09.quanta.corp) ([10.243.91.106])
 by mx02.quantatw.com with ESMTP; 28 Oct 2019 14:41:05 +0800
Received: from mailbx12.quanta.corp (10.243.91.109) by mailbx09.quanta.corp
 (10.243.91.106) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 28 Oct
 2019 14:41:01 +0800
Received: from mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05]) by
 mailbx12.quanta.corp ([fe80::3581:3a50:e90e:3a05%4]) with mapi id
 15.01.1713.009; Mon, 28 Oct 2019 14:41:01 +0800
From: =?big5?B?VG9ueSBMZWUgKKf1pOW0SSk=?= <Tony.Lee@quantatw.com>
To: "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>
Subject: Showing signed sensor value when the command "ipmitool sel elist" is
 executed
Thread-Topic: Showing signed sensor value when the command "ipmitool sel
 elist" is executed
Thread-Index: AdWNWFHRoJAe9/HYQ5KNxGajnOPsiQ==
Date: Mon, 28 Oct 2019 06:41:01 +0000
Message-ID: <b3c1129773c64c97b9655701cb506578@quantatw.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.243.91.252]
x-tm-as-product-ver: SMEX-14.0.0.1158-8.5.1020-25006.004
x-tm-as-result: No-10--1.518400-5.000000
x-tmase-matchedrid: dwNgap4H9hib5g0gI2gnR5zEHTUOuMX33dCmvEa6IiGoLZarzrrPmaSL
 KJxuiASSoHkXNuFv4rlC5fLOCj/VGAHmMMvi0m/ThQwmwdAU7bJm4iSocjSduwdY+faaPuhEp/g
 7QDIlgt1/XFK38Ckcc20kdSe698Bxdm10NLkSjkHiHyvyXeXh5uW+NFJT5LKZaOWLD7G8i10e7c
 YFPRDDk/jjYZEN3hSFmyiLZetSf8mZMPCnTMzfOiq2rl3dzGQ19+9ZqEp9FTgDtxvTf1wl6offV
 /Jl6swjltRZpKr9wW8aYHl8K4Ev8iI9xDyqrVT0FK3CXoJT3zZXm8KADGawI/0rmalwGIv4rdHI
 mFVc+HCpwXEL6auHLVbBLfKusMEl3q5/wFAM7/sldSrg7jJgh56oP1a0mRIj
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--1.518400-5.000000
x-tmase-version: SMEX-14.0.0.1158-8.5.1020-25006.004
x-tm-snts-smtp: A699E13516D2E2551A817977A2095F34B0A261702F288CF25DCF6C70796D30A02000:B
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?big5?B?QnVkZHkgSHVhbmcgKLbApNHCRSk=?= <Buddy.Huang@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgSmFzb24sDQoNCldlIGtub3cgdGhhdCB3aGVuIHdlIGV4ZWN1dGUgdGhlIGNvbW1hbmQgImlw
bWl0b29sIHNlbCBlbGlzdCIsIGl0IHdpbGwgcmV0dXJuIHNvbWV0aGluZyBsaWtlIHRoZSBmb2xs
b3dpbmcsDQoiMTggfCAxMC8xNi8xOSB8IDE4OjI4OjQxIFVUQyB8IFRlbXBlcmF0dXJlIG52bWUw
IHwgVXBwZXIgTm9uLWNyaXRpY2FsIGdvaW5nIGhpZ2ggfCBBc3NlcnRlZCB8IFJlYWRpbmcgNzIg
PiBUaHJlc2hvbGQgNzAgZGVncmVlcyBDIi4NCg0KSSBtZXQgYSBwcm9ibGVtIHRoYXQgd2hlbiB0
aGUgc2Vuc29yIHZhbHVlIGluIHRoZSBkLWJ1cyBpcyBuZWdhdGl2ZSwgdGhlIGN1cnJlbnQgcmVh
ZGluZyBpbiAiaXBtaXRvb2wgc2VsIGVsaXN0IiB3aWxsIGJlIDAuDQpJdCBzZWVtcyB0aGF0IGJl
Y2F1c2UgdGhlIHR5cGUgb2Ygc2NhbGVkVmFsdWUgaXMgZGVmaW5lZCAidWludDMyX3QiLCB0aGVy
ZSBpcyBhbHdheXMgYSBub25lIG5lZ2F0aXZlIHZhbHVlIGV2ZW4gY3VycmVudCB2YWx1ZSBpcyBh
IG5lZ2F0aXZlIHZhbHVlIG9idGFpbmVkIGZyb20gdGhlIGQtYnVzLiBJbg0KaHR0cHM6Ly9naXRo
dWIuY29tL29wZW5ibWMvcGhvc3Bob3Itc2VsLWxvZ2dlci9ibG9iL21hc3Rlci9pbmNsdWRlL3Nl
bnNvcnV0aWxzLmhwcCNMMTU5DQoNCklzIHRoaXMgaXMgYW4gaXNzdWUgb3IgSSBuZWVkIHRvIHNl
dCBpdCB1cCBzb21ld2hlcmU/DQoNClRoYW5rcw0KQmVzdCBSZWdhcmRzLA0KVG9ueQ0K
