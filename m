Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 471DE17ACF
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 15:38:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zcy84GsKzDqGt
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 23:38:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.26.145; helo=unicom145.biz-email.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zcwS5wC1zDqGq
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 23:37:27 +1000 (AEST)
Received: from ([218.57.135.44])
 by unicom145.biz-email.net (Antispam) with ASMTP (SSL) id ZST65120;
 Wed, 08 May 2019 21:37:20 +0800
Received: from Jtjnmail201617.home.langchao.com (10.100.2.17) by
 jtjncas04.home.langchao.com (172.30.26.23) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 8 May 2019 21:37:50 +0800
Received: from Jtjnmail201617.home.langchao.com (10.100.2.17) by
 Jtjnmail201617.home.langchao.com (10.100.2.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 8 May 2019 21:37:49 +0800
Received: from Jtjnmail201617.home.langchao.com ([fe80::9d00:ecba:c3a3:a9c1])
 by Jtjnmail201617.home.langchao.com ([fe80::9d00:ecba:c3a3:a9c1%5])
 with mapi id 15.01.1713.004; Wed, 8 May 2019 21:37:49 +0800
From: =?gb2312?B?Sm9obiB3YW5nKM311r7Hvyk=?= <wangzqbj@inspur.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: How to configure dram memory size
Thread-Topic: How to configure dram memory size
Thread-Index: AQHVBaM6YFYlKnLEAkKCdM5Es6oHsg==
Date: Wed, 8 May 2019 13:37:49 +0000
Message-ID: <xliob3qoncilrmx1o0xj6k90.1557322336549@email.jadenine.com>
References: <dae3186974f2f09b3a90e4f3f634e21c@sslemail.net>,
 <CACPK8XfkXmi2PmnmWv_Vev=JoG9LgYfNgA-V78mRKNrmSRC3dA@mail.gmail.com>
In-Reply-To: <CACPK8XfkXmi2PmnmWv_Vev=JoG9LgYfNgA-V78mRKNrmSRC3dA@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="gb2312"
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

c29ycnmjrEkgZm9yZ290IHRvIGNvcHkgdGhlIG9wZW5ibWMgbWFpbCBsaXN0DQoNClRoYW5rcw0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLo7pKb2VsIFN0YW5sZXkg
PGpvZWxAam1zLmlkLmF1Pg0KyrG85KO6MjAxOcTqMDXUwjA4yNUgz8LO5yA3OjU2DQrK1bz+yMuj
uiJKb2huIHdhbmcozfXWvse/KSIgPHdhbmd6cWJqQGluc3B1ci5jb20+DQrW98zio7pbZ21haWwu
Y29ttPq3ol1SZTogSG93IHRvIGNvbmZpZ3VyZSBkcmFtIG1lbW9yeSBzaXplDQoNCk9uIFdlZCwg
OCBNYXkgMjAxOSBhdCAxMTowNiwgSm9obiBXYW5nIDx3YW5nenFiakBpbnNwdXIuY29tPiB3cm90
ZToNCj4NCj4gT24gV2VkLCBNYXkgOCwgMjAxOSBhdCA0OjMyIFBNIEpvZWwgU3RhbmxleSA8am9l
bEBqbXMuaWQuYXU+IHdyb3RlOg0KPiA+DQo+ID4gT24gV2VkLCA4IE1heSAyMDE5IGF0IDAyOjQ1
LCBKb2huIFdhbmcgPHdhbmd6cWJqQGluc3B1ci5jb20+IHdyb3RlOg0KPiA+ID4gTXkgbWFjaGlu
ZSBtZW1vcnkgaXMgMjU2TSwgYnV0IHdoeSBpcyB1Ym9vdCByZWNvZ25pemVkIGFzIDUxMk0sIHdo
ZXJlIHNob3VsZCBJIHNldCBpdD8NCg0KPiBEUkFNOiAgNDk2IE1pQg0KPiBEUkFNIDogSDVBTjRH
Nk5BRlItVUhDKERSQU0gQ2hpcCBERFI0IFNEUkFNIDRHLUJpdCAyNTZNeDE2KQ0KDQpJdCBsb29r
cyBsaWtlIHlvdSBoYXZlIGEgNTEyTUIgcGFydCBpbnN0YWxsZWQ/DQoNCjQgKiAxMDI0IC8gOCA9
IDUxMg0K
