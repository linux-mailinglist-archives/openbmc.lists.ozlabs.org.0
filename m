Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 299588C6A57
	for <lists+openbmc@lfdr.de>; Wed, 15 May 2024 18:14:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-04 header.b=vPetoIQP;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-03 header.b=hgpj+S0n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfdbW4tmFz3cgk
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2024 02:14:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-04 header.b=vPetoIQP;
	dkim=pass (2048-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-03 header.b=hgpj+S0n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yadro.com (client-ip=89.207.88.248; helo=mta-04.yadro.com; envelope-from=d.sharikhin@yadro.com; receiver=lists.ozlabs.org)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfdZv66SLz3cfx
	for <openbmc@lists.ozlabs.org>; Thu, 16 May 2024 02:14:15 +1000 (AEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 3F9FDC0002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1715789128; bh=q9lZMvgZumL4rpSosxs8bPdTU1lYtcB98lqTGF6L/sk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=vPetoIQPwz2MFja7hVIJMT0uSHLEKV2JIq5w5bWHR8Sr44aoFlSyGKII8Hnheb6t/
	 IX58eBqtUd9j+S9RQoxI7fnw81BIU/emcnzw1hZQMjzotFK0VhOal6NQbC4FbwRUH7
	 JsxCplIWHPW9kx4fbFCSo3AmWHkmspt19UmqCJ6abxlh/gML/HR9dXR0YKOBeHnKwV
	 /vTvXvgPEJLP3FEyLkopa0eGa3N+zUGfjJgP8Y250WZLXmP4ycCD1E1PUYoF+d6DEm
	 ut3Hm3/cylVV9eVfyX0OPl0X/ypQO8E2p7hyThc79cwmoXa2uQIJxd+TD8G9OgC0C7
	 BOkXAr4MgruRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1715789128; bh=q9lZMvgZumL4rpSosxs8bPdTU1lYtcB98lqTGF6L/sk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=hgpj+S0n1NGFbUbiBPHEdOrZFwqt0UxYaqlWjxyKhouFsYlk0QQLD2P6tKJ1SJhjW
	 O87/rVY4kdwecCZZeUwfIJyc5VAbDOVY1cp7azlx+cYNglpsdVm9wobyeL8GSQcNaQ
	 aKwtySONjwf6glmKi2Rtmx7kDAZn0PKjbgq6UGqRf2B6PVmbdzEB5cekjoQMnRNtK3
	 jo2L4pcS4HOfVNluq3dKNKhaa9zHgH9f2gHfhjy50MEpArXxVh67qA8yMTEgHTt3Vi
	 5j5O0jtghyCQuvfiU48SnImKsnooWhek2PuRxIsuL5vhlVUhz4shbG9PeQhqzaympQ
	 4iVjo2Lyt5G+w==
From: Dmitriy Sharikhin <d.sharikhin@yadro.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [PATCH u-boot, v2019.04-aspeed-openbmc v1 1/3] pinctrl: aspeed:
 append SGPM nodes
Thread-Topic: [PATCH u-boot, v2019.04-aspeed-openbmc v1 1/3] pinctrl: aspeed:
 append SGPM nodes
Thread-Index: AQHapuGzBU1ZQyW01U+fX0xQk0hpHw==
Date: Wed, 15 May 2024 16:05:27 +0000
Message-ID: <8ab964639d8516ebeef7035b657bb4df7ed08bdd.camel@yadro.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BE4AC5432BEA24B90270AB931F77BB3@yadro.com>
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
Cc: Alexander Amelkin <a.amelkin@yadro.com>, Igor Kononenko <i.kononenko@yadro.com>, "Alexander A. Filippov" <a.filippov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Rm9yIGNvcnJlY3QgU0dQSU8gb3BlcmF0aW9uIHdlIG5lZWQgU0dQTSBwaW5jdHJsIGZ1bmN0aW9u
Lg0KRGVjbGFyZSBpdCBhY2NvcmRpbmcgdG8gZGF0YXNoZWV0IGZvciBBU1QyNDAwL0FTVDI1MDAv
QVNUMjYwMA0KDQpTaWduZWQtb2ZmLWJ5OiBEbWl0cmlpIFNoYXJpa2hpbiA8ZC5zaGFyaWtoaW5A
eWFkcm8uY29tPg0KLS0tDQogZHJpdmVycy9waW5jdHJsL2FzcGVlZC9waW5jdHJsX2FzdDI0MDAu
YyB8ICA1ICsrKysrDQogZHJpdmVycy9waW5jdHJsL2FzcGVlZC9waW5jdHJsX2FzdDI1MDAuYyB8
ICA1ICsrKysrDQogZHJpdmVycy9waW5jdHJsL2FzcGVlZC9waW5jdHJsX2FzdDI2MDAuYyB8IDEz
ICsrKysrKysrKysrKysNCiAzIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykNCg0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9hc3BlZWQvcGluY3RybF9hc3QyNDAwLmMgYi9kcml2
ZXJzL3BpbmN0cmwvYXNwZWVkL3BpbmN0cmxfYXN0MjQwMC5jDQppbmRleCA1MzFlMTE2Yzc5Li4x
OTNmYmJjMjRlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9waW5jdHJsL2FzcGVlZC9waW5jdHJsX2Fz
dDI0MDAuYw0KKysrIGIvZHJpdmVycy9waW5jdHJsL2FzcGVlZC9waW5jdHJsX2FzdDI0MDAuYw0K
QEAgLTExNyw2ICsxMTcsMTAgQEAgc3RhdGljIHN0cnVjdCBhc3BlZWRfc2lnX2Rlc2Mgc2RpbzJf
bGlua1tdID0gew0KIAl7IDB4OTAsIEJJVCgxKSwgMAl9LA0KIH07DQogDQorc3RhdGljIHN0cnVj
dCBhc3BlZWRfc2lnX2Rlc2Mgc2dwbV9saW5rW10gPSB7DQorCXsgMHg4NCwgR0VOTUFTSygxMSwg
OCksIDB9LA0KK307DQorDQogc3RhdGljIHN0cnVjdCBhc3BlZWRfc2lnX2Rlc2Mgc3BpMWNzMV9s
aW5rW10gPSB7DQogCXsgMHg4MCwgQklUKDE1KSwgMH0sDQogfTsNCkBAIC0xNjAsNiArMTY0LDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhc3BlZWRfZ3JvdXBfY29uZmlnIGFzdDI0MDBfZ3JvdXBz
W10gPSB7DQogCXsgIkkyQzE0IiwgMSwgaTJjMTRfbGluayB9LA0KIAl7ICJTRDIiLCAxLCBzZGlv
Ml9saW5rIH0sDQogCXsgIlNEMSIsIDEsIHNkaW8xX2xpbmsgfSwNCisJeyAiU0dQTSIsIDEsIHNn
cG1fbGlua30sDQogCXsgIlNQSTEiLCAxLCBzcGkxX2xpbmt9LA0KIAl7ICJTUEkxQ1MxIiwgMSwg
c3BpMWNzMV9saW5rfSwNCiAJeyAiVFhEMyIsIDEsIHR4ZDNfbGluayB9LA0KZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcGluY3RybC9hc3BlZWQvcGluY3RybF9hc3QyNTAwLmMgYi9kcml2ZXJzL3BpbmN0
cmwvYXNwZWVkL3BpbmN0cmxfYXN0MjUwMC5jDQppbmRleCAzOTVhYTIwODBmLi4zYzBhZTdiNDU0
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9waW5jdHJsL2FzcGVlZC9waW5jdHJsX2FzdDI1MDAuYw0K
KysrIGIvZHJpdmVycy9waW5jdHJsL2FzcGVlZC9waW5jdHJsX2FzdDI1MDAuYw0KQEAgLTEyMSw2
ICsxMjEsMTAgQEAgc3RhdGljIHN0cnVjdCBhc3BlZWRfc2lnX2Rlc2Mgc2RpbzJfbGlua1tdID0g
ew0KIAl7IDB4OTAsIEJJVCgxKSwgMAl9LA0KIH07DQogDQorc3RhdGljIHN0cnVjdCBhc3BlZWRf
c2lnX2Rlc2Mgc2dwbV9saW5rW10gPSB7DQorCXsgMHg4NCwgR0VOTUFTSygxMSwgOCksIDB9LA0K
K307DQorDQogc3RhdGljIHN0cnVjdCBhc3BlZWRfc2lnX2Rlc2Mgc3BpMWNzMV9saW5rW10gPSB7
DQogCXsgMHg4MCwgQklUKDE1KSwgMH0sDQogfTsNCkBAIC0xNTcsNiArMTYxLDcgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBhc3BlZWRfZ3JvdXBfY29uZmlnIGFzdDI1MDBfZ3JvdXBzW10gPSB7DQog
CXsgIkkyQzE0IiwgMSwgaTJjMTRfbGluayB9LA0KIAl7ICJTRDIiLCAxLCBzZGlvMl9saW5rIH0s
DQogCXsgIlNEMSIsIDEsIHNkaW8xX2xpbmsgfSwNCisJeyAiU0dQTSIsIDEsIHNncG1fbGluayB9
LA0KIAl7ICJTUEkxIiwgMSwgc3BpMV9saW5rfSwNCiAJeyAiU1BJMUNTMSIsIDEsIHNwaTFjczFf
bGlua30sDQogCXsgIlVTQjJBSCIsIDEsIHVzYjJhaF9saW5rIH0sDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9waW5jdHJsL2FzcGVlZC9waW5jdHJsX2FzdDI2MDAuYyBiL2RyaXZlcnMvcGluY3RybC9h
c3BlZWQvcGluY3RybF9hc3QyNjAwLmMNCmluZGV4IGMxMGIzYzA4YWMuLjE0ODEwOTQ4MmMgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL3BpbmN0cmwvYXNwZWVkL3BpbmN0cmxfYXN0MjYwMC5jDQorKysg
Yi9kcml2ZXJzL3BpbmN0cmwvYXNwZWVkL3BpbmN0cmxfYXN0MjYwMC5jDQpAQCAtMzAwLDYgKzMw
MCwxNyBAQCBzdGF0aWMgc3RydWN0IGFzcGVlZF9zaWdfZGVzYyBmbWNxdWFkX2xpbmtbXSA9IHsN
CiAJeyAweDQzOCwgR0VOTUFTSyg1LCA0KSwgMCB9LA0KIH07DQogDQorc3RhdGljIHN0cnVjdCBh
c3BlZWRfc2lnX2Rlc2Mgc2dwbTFfbGlua1tdID0gew0KKwl7IDB4NDE0LCBHRU5NQVNLKDI3LCAy
NCksIDAgfSwNCit9Ow0KKw0KK3N0YXRpYyBzdHJ1Y3QgYXNwZWVkX3NpZ19kZXNjIHNncG0yX2xp
bmtbXSA9IHsNCisJeyAweDQxMCwgR0VOTUFTSyg3LCA0KSwgMSB9LA0KKwl7IDB4NGIwLCBHRU5N
QVNLKDcsIDQpLCAxIH0sDQorCXsgMHg2OTAsIEdFTk1BU0soNywgNCksIDEgfSwNCisJeyAweDZk
MCwgR0VOTUFTSyg3LCA0KSwgMCB9LA0KK307DQorDQogc3RhdGljIHN0cnVjdCBhc3BlZWRfc2ln
X2Rlc2Mgc3BpMV9saW5rW10gPSB7DQogCXsgMHg0MzgsIEdFTk1BU0soMTMsIDExKSwgMCB9LA0K
IH07DQpAQCAtNDI4LDYgKzQzOSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXNwZWVkX2dyb3Vw
X2NvbmZpZyBhc3QyNjAwX2dyb3Vwc1tdID0gew0KIAl7ICJFTU1DIiwgQVJSQVlfU0laRShlbW1j
X2xpbmspLCBlbW1jX2xpbmsgfSwNCiAJeyAiRU1NQ0c4IiwgQVJSQVlfU0laRShlbW1jZzhfbGlu
ayksIGVtbWNnOF9saW5rIH0sDQogCXsgIkZNQ1FVQUQiLCBBUlJBWV9TSVpFKGZtY3F1YWRfbGlu
ayksIGZtY3F1YWRfbGluayB9LA0KKwl7ICJTR1BNMSIsIEFSUkFZX1NJWkUoc2dwbTFfbGluayks
IHNncG0xX2xpbmsgfSwNCisJeyAiU0dQTTIiLCBBUlJBWV9TSVpFKHNncG0yX2xpbmspLCBzZ3Bt
Ml9saW5rIH0sDQogCXsgIlNQSTEiLCBBUlJBWV9TSVpFKHNwaTFfbGluayksIHNwaTFfbGluayB9
LA0KIAl7ICJTUEkxQUJSIiwgQVJSQVlfU0laRShzcGkxYWJyX2xpbmspLCBzcGkxYWJyX2xpbmsg
fSwNCiAJeyAiU1BJMUNTMSIsIEFSUkFZX1NJWkUoc3BpMWNzMV9saW5rKSwgc3BpMWNzMV9saW5r
IH0sDQotLSANCjIuMzkuMg0KDQo=
