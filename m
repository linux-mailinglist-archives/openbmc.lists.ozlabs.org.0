Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 965C31CC2D2
	for <lists+openbmc@lfdr.de>; Sat,  9 May 2020 18:39:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49KCb36nPfzDr3p
	for <lists+openbmc@lfdr.de>; Sun, 10 May 2020 02:39:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=59.36.132.97; helo=qq.com; envelope-from=1181052146@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=xdHcSruM; dkim-atps=neutral
X-Greylist: delayed 68 seconds by postgrey-1.36 at bilbo;
 Sun, 10 May 2020 02:38:44 AEST
Received: from qq.com (smtpbg480.qq.com [59.36.132.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49KCZD07CSzDr0L
 for <openbmc@lists.ozlabs.org>; Sun, 10 May 2020 02:38:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1589042208; bh=x9bmm1X3EoaChtvkZd7GgWICh2ZNUuhKw9xZbLJmTIQ=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=xdHcSruMYY1zSmSt/Q+uYuTVUWAtt88nZn4oYSuyHaZQa8nANwSDWEgc/q7bPAHWh
 zPNphBG1wpuJVfwKdj8e2XtodKxs/NQ3PrIu0rksYsMLal+e2Gxv5nbdAuXqcvPxK0
 rFML1pTjDivV6Pa1IysgUflQAuC41+0dAUDpvveE=
X-QQ-FEAT: TllwYEYhfwkSgj/mSmBOSfe9LCqyKoNiBxaOyrqQoOWe+jP98Cnpxw117Mqto
 YBIeavESlLq8ssaBojREz9fy8O1brcHjzQiLtt6ZbXFNYEE6iGiVP0XxBPtUbUy5kflNi+w
 ZWESeOdffw08NzjtLtm31F/fLz/3ICAlx3vQaNjrosX+8Ywx0XFpTgymgOF7RhTQrS1tZZF
 6QqPJ8e3MQup/8NyNaCvDr7xdXNrdH2YvHq/pHQEv9XIKy0Hr/p30ko5hazUep36Yl5NNFj
 oEZFYM/Fu5ADaOqorMYhd/5VuRpSM8ziVzYw==
X-QQ-SSF: 00000000000000F000000000000000S
X-QQ-XMAILINFO: M8xNCZVKMBkPkge9dbkC0wvooGrR2PiUnY37IHDd7zkGoePp/Dbdp4F+W24ESr
 MMRq2NIIA37iMsQjjBzl1jV7E/XFMo7R2HKTYsxcjtfP49p6YK/NhvB6ddm4ozZGX55llOBTgylFd
 PRU2fTz/cV2VAH6op9kofuiaCYDINyZdeRFFd6KMX3p17LFN1RWvw1sujAWHFMS6kmgPOfczk7rkt
 eoDXhleqp87tIuXfIxFPu88PetxNe4JEI7D+gKCxI2MugkZFFOVjSyIuJm5EXpW7PV7NIQApMiui1
 ncZ822Ch889+qNpkqg5aBBboxRG+vVU5OOZKdDKqh6i/Iy7ypjfxqWu1lKBQXEGDHR9doadGrsqRN
 5JAYbVvAVnxP+2qDMpFJrE7l4o6U5tOqzzUxnaCuOFuXKlGJrMC6lShV2NSNmiaFHEXaSzx+vbykO
 QZzLAoCSzUiOXU2zC+kyykVA6rLpp2FSPncYtgH5XjdnT17k1+dhliPUT/WuHEsYQcbd1ooLDplS5
 PYdOgsox+/CCOV3HKrvA0qvna4dvb7AWGGEOV/cqBqZ061+MhCtVrGs2m59fWmqGhh2uDrtHjYMmA
 k99z83PIzGNJ2LCZcCsAJVgZoPoU11/Thb6frxv2AVrAAHlUOEhIcdLrA8oBET9ug9QV6DJ9SGO5J
 FVHFHoya0fpCLNjlwAVFcP6uzg3iUK8wSvAFmj
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 36.98.191.163
In-Reply-To: <4813264f-fe81-4563-838d-f5356acb768a@www.fastmail.com>
References: <tencent_2D6AE7A4D981E94342BD340BC7DF4EBE7F05@qq.com>
 <4813264f-fe81-4563-838d-f5356acb768a@www.fastmail.com>
X-QQ-STYLE: 
X-QQ-mid: webmail700t1589042206t5343315
From: "=?gb18030?B?xM/SsKXgpeult6WopemltA==?=" <1181052146@qq.com>
To: "=?gb18030?B?QW5kcmV3IEplZmZlcnk=?=" <andrew@aj.id.au>,
 "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: =?gb18030?B?UmWjuiBIb3cgY2FuIHRoZSBob3N0IGFjY2VzcyBC?=
 =?gb18030?B?TUMncyBTUEkgRmxhc2ggdmlhIExQQyBhbmQgSG93?=
 =?gb18030?B?IGRvIEJNQydzIENQVSByZWFkIHVib290IGZyb20g?=
 =?gb18030?B?U1BJIEZsYXNoIHdoZW4gcG93ZXIgdXA/?=
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5EB6DC1E_105E4030_4DD085BD"
Content-Transfer-Encoding: 8Bit
Date: Sun, 10 May 2020 00:36:46 +0800
X-Priority: 3
Message-ID: <tencent_720F45F5C22C1BFF2BF99029CA933807E907@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 407658624
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Sun, 10 May 2020 00:36:47 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign12
X-QQ-Bgrelay: 1
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

This is a multi-part message in MIME format.

------=_NextPart_5EB6DC1E_105E4030_4DD085BD
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGkgTXIuIEFuZHJldyBKZWZmZXJ5DQoNCg0KVGhhbmsgeW91IGZvciB5b3VyIGhlbHAuIFNv
cnJ5IGZvciBsYXRlIHJlc3BvbnNlLiBBZnRlciBnZXR0aW5nIHlvdXIgcmVwbGF5LCBJIHJl
YWQgQVNUMjUwMCBzcGVjIGFuZCBPcGVuQk1DIGxpbnV4IGtlcm5lbCBhZ2Fpbi4NCkkgZm91
bmQgYSAiU3VwZXJJTyBjb250cm9sbGVyIiBpbiBBU1QyNTAwIHNwZWMgYW5kICJhc3BlZWQt
bHBjLWN0cmwuYyIgaW4gbGludXgga2VybmVsLg0KDQoNCjEuIEkgZm91bmQgdGhlcmUgaXMg
YSBsb2dpY2FsIGRldmljZSAiaUxQQzJBSEIiIGluIFN1cGVySU8gY29udHJvbGxlciwgYW5k
IGl0IGlzIHNhaWQgdGhlIHJlZ2lzdGVyIGNhbiBiZSBhY2Nlc3NlZCBieSBIb3N0IENQVSB0
aHJvdWdoIExQQyBidXMoSSBhbSBub3Qgc3VyZSBidXQgSSB0aGluayB0aGUgU3VwZXJJTyBj
b250cm9sbGVyIHdpbGwgYmUgdXNlZCBmb3IgSG9zdCBDUFUsIGFuZCBubyBCTUMgZHJpdmVy
IHdpbGwgdXNlIGl0KS4gSSBhbHNvIGZvdW5kICJTSU8gaUxQQzJBSEIgYWRkcmVzcyIgcmVn
aXN0ZXIgaW4gU3VwZXJJTyBjb250cm9sbGVyLiBHaXZlbiB0aGF0IHRoaXMgcmVnaXN0ZXIg
Y2FuIGJlIGFjY2Vzc2VkIGJ5IEhvc3QgQ1BVLCBjYW4gSSB0aGluayB0aGF0IHRoZSBIb3N0
IENQVSBmaXJzdGx5IGNvbmZpZ3VyZSB0aGUgIlNJTyBpTFBDMkFIQiBhZGRyZXNzIiByZWdp
c3RlciwgdGhlbiBpZiB0aGUgTFBDIHNsYXZlIGNvbnRyb2xsZXIgaXMgY29uZmlndXJlZCBy
aWdodGx5LCBIb3N0IENQVSBjYW4gYWNjZXNzIHRoZSBCTUMncyBtZW1vcnkgc3BhY2UgYnkg
dXNpbmcgbWVtb3J5IHJlYWRpbmcgb3Igd3JpdGluZyB0byB0aGUgYWRkcmVzcyB3cml0dGVu
IHRvICJTSU8gaUxQQzJBSEIgYWRkcmVzcyIgcmVnaXN0ZXI/DQpJZiBJIGFtIHJpZ2h0LCB3
aGF0IGRvZXMgU3VwZXJJTyBjb250cm9sbGVyIGRvLCBpcyBpdCBiZXR3ZWVuIEhvc3QncyBM
UEMgYnVzIGFuZCBCTUMncyBMUEMgc2xhdmUgY29udHJvbGxlciBsaWtlOg0KSG9zdC0tJmd0
O0xQQyBidXMtLSZndDtTdXBlcklPIGNvbnRyb2xsZXItLSZndDtMUEMgc2xhdmUgY29udHJv
bGxlci0tJmd0O0xQQzJBSEIgYnJpZGdlLS0mZ3Q7U1BJIEZsYXNoIG1hcHBpbmcNCm9yIFN1
cGVySU8gY29udHJvbGxlciBpcyBpbmRlcGVuZGVudCBvZiBMUEMgc2xhdmUgY29udHJvbGxl
ciBsaWtlOg0KSG9zdC0tJmd0O0xQQyBidXMtLSZndDtTdXBlcklPIGNvbnRyb2xsZXINCkhv
c3QtLSZndDtMUEMgYnVzLS0mZ3Q7TFBDIHNsYXZlIGNvbnRybGxlci0tJmd0O0xQQzJBSEIg
YnJpZGdlLS0mZ3Q7U1BJIEZsYXNoIG1hcHBpbmcNCg0KDQoyLiBJIGZvdW5kICJhc3BlZWQt
bHBjLWN0cmwuYyIgaW4gbGludXgga2VybmVsIHNvdXJjZSBjb2RlLiBBbHRob3VnaCBJIGFt
IG5vdCB2ZXJ5IGZhbWlsYXIgd2l0aCB0aGlzIGRyaXZlciwgSSBmb3VuZCB0aGF0IGJ5IGNv
bmZpZ3VyaW5nIHRoZSBMUEMgc2xhdmUgY29udHJvbGxlcidzIGhvc3QgaW50ZXJmYWNlIGNv
bnRyb2wgcmVnaXN0ZXIsIHRoaXMgZHJpdmVyIGNhbiBkZWNpZGUgd2hpY2ggQk1DJ3MgbWVt
b3J5IHNwYWNlIGNhbiBiZSBtYXBwZXIgdG8gSG9zdCBDUFUuDQpBbmQgSW4gdGhlIHBpY3R1
cmUgeW91IGRyYXcgZm9yIG1lDQpIb3N0IENQVQ0KJm5ic3A7ICZuYnNwOyAtJmd0OyBMUEMg
RlcNCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAtJmd0OyBMUEMyQUhCIEJyaWRnZQ0K
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgLSZndDsgU1BJIGZs
YXNoIG1hcHBpbmcNCiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgLSZndDsgU1BJIEZsYXNoDQpEb2VzIHRoZSAiTFBDIEZXIiBtZWFu
cyBhc3BlZWQtbHBjLWN0cmwgZHJpdmVyPw0KDQoNCkJlc3QgUmVnYXJkcyENCkxpdSBIb25n
d2VpDQoNCg0KJmd0O0hpIExpdSBIb25nd2VpLA0KDQomZ3Q7T24gRnJpLCAyNCBBcHIgMjAy
MCwgYXQgMjM6NTgsIMTP0rCl4KXrpbelqKXppbQgd3JvdGU6DQomZ3Q7Jmd0OyBIaSwgR3Jl
ZXRpbmdzDQomZ3Q7Jmd0OyZuYnNwOyBBIEJNQyB1c3VhbGx5IHVzZXMgYXNwZWVkJ3MgY2hp
cC4gVG8gbGVhcm4gQk1DIEkgcmVhZCB0aGUgc3BlYyBvZiANCiZndDsmZ3Q7IGFzcGVlZCdz
IEFTVDI1MDAuIEkgaGF2ZSBsb25nIGJlZW4gY29uZnVzZWQgYnkgdHdvIHF1ZXN0aW9ucyB3
aGVuIEkgYW0gDQomZ3Q7Jmd0OyBsZWFybmluZyBCTUMuDQoNCiZndDsmZ3Q7Jm5ic3A7IDEu
IE9uZSBpcyB0aGF0OiBIb3cgY2FuIHRoZSBob3N0IGFjY2VzcyBCTUMncyBTUEkgRmxhc2gg
dmlhIExQQz8gSSANCiZndDsmZ3Q7IHJlYWQgZnJvbSBBU1QyNTAwJ3Mgc3BlYyB0aGF0IHRo
ZSBob3N0IGNhbiB1cGRhdGUgdGhlIEJJT1Mgc3RvcmVkIGluIA0KJmd0OyZndDsgdGhlIFNQ
SSBmbGFzaCB2aWEgTFBDLg0KDQomZ3Q7T2theSBmaXJzdCB0aGluZyB0byBhZGRyZXNzIGlz
IHNlcGFyYXRpb24gb2YgY29uY2VybnM6IFRoZXJlIGFyZSBzZXBhcmF0ZQ0KJmd0O1NQSSBj
b250cm9sbGVycyBmb3IgdGhlIEJNQyBhbmQgaG9zdCBmaXJtd2FyZS4NCg0KJmd0OyZndDsg
SSBhbHNvIHNlZW4gZnJvbSBBU1QyNTAwJ3Mgc3BlYyB0aGF0IHRoZSBTUEkgDQomZ3Q7Jmd0
OyBjb250cm9sbGVyIGluIEFTVDI1MDAgY2FuIGJlIGFjY2VzcyBieSBob3N0IHRocm91Z2gg
TFBDLiBJdCBzZWVtcyBsaWtlIA0KJmd0OyZndDsgdGhlIGFyY2hpdGVjdHVyZSBpcyBhcyBi
ZWxvdy4NCiZndDsmZ3Q7Jm5ic3A7IEhvc3QgQ1BVLS0tLSZndDtMUEMtLS0tJmd0O1NQSSBj
b250cm9sbGVyLS0tLSZndDtTUEkgRmxhc2hbQklPU10NCg0KJmd0O1JvdWdobHksIHllcy4g
VGhlcmUgYXJlIGEgY291cGxlIG9mIG90aGVyIGNyaXRpY2FsIHBpZWNlcyBvZiB0aGUgcHV6
emxlOg0KDQomZ3Q7MS4gVGhlIFNQSS1hdHRhY2hlZCBzdG9yYWdlIGlzIG1hcHBlZCBpbnRv
IHRoZSBCTUMncyBwaHlzaWNhbCBhZGRyZXNzDQomZ3Q7c3BhY2UNCiZndDsyLiBUaGUgQk1D
J3MgTFBDIHNsYXZlIGNvbnRyb2xsZXIgY29udGFpbnMgYSBicmlkZ2UgdGhhdCBhbGxvd3Mg
aG9zdA0KJmd0O2FjY2Vzc2VzIHRvIHRoZSBMUEMgRlcgc3BhY2UgdG8gYmUgY29udmVydGVk
IHRvIGFjY2Vzc2VzIHRvIHRoZSANCiZndDtCTUMncyBwaHlzaWNhbCBhZGRyZXNzIHNwYWNl
Lg0KDQomZ3Q7U28gdGhlIHBpY3R1cmUgbG9va3MgbGlrZToNCg0KJmd0O0hvc3QgQ1BVDQom
Z3Q7Jm5ic3A7Jm5ic3A7Jm5ic3A7IC0mZ3Q7IExQQyBGVw0KJmd0OyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAtJmd0OyBMUEMyQUhCIEJyaWRnZQ0KJmd0
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyAtJmd0OyBTUEkgZmxhc2ggbWFwcGluZw0KJmd0OyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyAtJmd0OyBTUEkgRmxhc2gNCg0KJmd0OyZndDsm
bmJzcDsgSSBkbyBub3Qga25vdyBob3cgaXQgd29ya3MsIGRvZXMgdGhpcyBuZWVkIHRvIGlu
c3RhbGwgYSBMUEMgZHJpdmVyIGluIA0KJmd0OyZndDsgaG9zdCBPUyBhbmQgb3BlbmJtYyBP
Uz8gQW5kIGRvZXMgdGhpcyBuZWVkIHNvZnR3YXJlIGludGVydmVudGlvbj8NCg0KJmd0O1Ro
ZSBob3N0IE9TIG9yIGZpcm13YXJlIGxpa2VseSBhbHJlYWR5IGtub3dzIGhvdyB0byBkcml2
ZSB0aGUgTFBDIGJ1cy4gVGhlDQomZ3Q7TFBDIGJ1cyBpcyB0eXBpY2FsbHkgcGFydCBvZiB0
aGUgaG9zdCdzIGJvb3QgcGF0aCwgcGFydGljdWxhcmx5IGlmIHRoZSBCSU9TIGlzDQomZ3Q7
c3RvcmVkIG9uIFNQSSBmbGFzaCBhdHRhY2hlZCB0byB0aGUgQk1DICh0aG91Z2ggb24gSW50
ZWwgc3lzdGVtcyBlU1BJDQomZ3Q7c3VwZXJzZWRlcyBMUEMsIGJ1dCB0aGUgY29uY2VwdHMg
YXJlIHJvdWdobHkgdGhlIHNhbWUpLg0KDQomZ3Q7Jmd0OyZuYnNwOyAyLiBUaGUgb3RoZXIg
aXMgdGhhdDogSG93IGRvZXMgQk1DJ3MgQ1BVIHJlYWQgdWJvb3QgY29kZSBmcm9tIFNQSSAN
CiZndDsmZ3Q7IGZsYXNoIHdoZW4gcG93ZXIgdXA/IEkga25vdyB0aGF0IHRoZSB1Ym9vdChh
Y3QgYXMgYm9vdGxvYWRlcikgaXMgc3RvcmVkIA0KJmd0OyZndDsgaW4gYSBTUEkgZmxhc2gs
IGFuZCB1Ym9vdCBpcyB0aGUgZmlyc3QgY29kZSB0aGF0IGlzIGV4ZWN1dGVkIGJ5IEJNQydz
IA0KJmd0OyZndDsgQ1BVLiBJIGRvIG5vdCBrbm93IHdoZXRoZXIgaXQgaXMgcmlnaHQgb3Ig
d3JvbmcgYnV0IEkgdGhpbmsgQk1DJ3MgQ1BVIA0KJmd0OyZndDsgY2FuIG9ubHkgZXhlY3V0
ZSB0aGUgY29kZSBzdG9yZWQgaW4gRFJBTS4NCg0KJmd0O1RoaXMgaXMgd2hlcmUgeW91J3Jl
IGZhbGxpbmcgZG93bi4gSW4gdGhlb3J5IHRoZSBCTUMgY2FuIGV4ZWN1dGUNCiZndDtpbnN0
cnVjdGlvbnMgZnJvbSBhbnl3aGVyZSBpbiBpdHMgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZS4g
RFJBTSBpcw0KJmd0O2xvY2F0ZWQgc29tZXdoZXJlIGluIHRoYXQgcGh5c2ljYWwgYWRkcmVz
cyBzcGFjZSAob24gdGhlIEFTVDI1MDAsDQomZ3Q7aXQgaXMgbG9jYXRlZCBhdCAweDgwMDAw
MDAwKSwgaG93ZXZlciB0aGVyZSBhcmUgb3RoZXIgYXJlYXMgb2YgaW50ZXJlc3QNCiZndDtp
biB0aGUgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSwgbmFtZWx5IHRoZSBtYXBwaW5nIG9mIHRo
ZSBCTUMgZmxhc2gNCiZndDt0byAweDAuIFRoaXMgaXMgdGhlIHJlc2V0IHZlY3RvciBmb3Ig
dGhlIEFSTSBjb3JlLCBzbyB3aGVuIGl0IGlzIHJlbGVhc2VkDQomZ3Q7ZnJvbSByZXNldCBp
dCBzdGFydHMgZXhlY3V0aW5nIHdoYXRldmVyIGluc3RydWN0aW9ucyBhcmUgcHJlc2VudCBh
dCAweDAuDQomZ3Q7VGhlIFNvQyBoYXJkd2FyZSBkZXNpZ24gaGFuZGxlcyB0aGUgZmFjdCB0
aGF0IHRoZSBpbnN0cnVjdGlvbnMgYXQgMHgwDQomZ3Q7YXJlIGZldGNoZWQgZnJvbSB0aGUg
Qk1DJ3MgU1BJIGZsYXNoIHNvIG5vIGRyaXZlciBpcyBuZWVkZWQuDQoNCiZndDtBbmRyZXc=

------=_NextPart_5EB6DC1E_105E4030_4DD085BD
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj5IaSBNci4gQW5kcmV3IEplZmZlcnk8L2Rpdj48ZGl2Pjxk
aXY+PGJyPjwvZGl2PjxkaXY+VGhhbmsgeW91IGZvciB5b3VyIGhlbHAuIFNvcnJ5IGZvciBs
YXRlIHJlc3BvbnNlLiBBZnRlciBnZXR0aW5nIHlvdXIgcmVwbGF5LCBJIHJlYWQgQVNUMjUw
MCBzcGVjIGFuZCBPcGVuQk1DIGxpbnV4IGtlcm5lbCBhZ2Fpbi48L2Rpdj48ZGl2PkkgZm91
bmQgYSAiU3VwZXJJTyBjb250cm9sbGVyIiBpbiBBU1QyNTAwIHNwZWMgYW5kICJhc3BlZWQt
bHBjLWN0cmwuYyIgaW4gbGludXgga2VybmVsLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
MS4gSSBmb3VuZCB0aGVyZSBpcyBhIGxvZ2ljYWwgZGV2aWNlICJpTFBDMkFIQiIgaW4gU3Vw
ZXJJTyBjb250cm9sbGVyLCBhbmQgaXQgaXMgc2FpZCB0aGUgcmVnaXN0ZXIgY2FuIGJlIGFj
Y2Vzc2VkIGJ5IEhvc3QgQ1BVIHRocm91Z2ggTFBDIGJ1cyhJIGFtIG5vdCBzdXJlIGJ1dCBJ
IHRoaW5rIHRoZSBTdXBlcklPIGNvbnRyb2xsZXIgd2lsbCBiZSB1c2VkIGZvciBIb3N0IENQ
VSwgYW5kIG5vIEJNQyBkcml2ZXIgd2lsbCB1c2UgaXQpLiBJIGFsc28gZm91bmQgIlNJTyBp
TFBDMkFIQiBhZGRyZXNzIiByZWdpc3RlciBpbiBTdXBlcklPIGNvbnRyb2xsZXIuIEdpdmVu
IHRoYXQgdGhpcyByZWdpc3RlciBjYW4gYmUgYWNjZXNzZWQgYnkgSG9zdCBDUFUsIGNhbiBJ
IHRoaW5rIHRoYXQgdGhlIEhvc3QgQ1BVIGZpcnN0bHkgY29uZmlndXJlIHRoZSAiU0lPIGlM
UEMyQUhCIGFkZHJlc3MiIHJlZ2lzdGVyLCB0aGVuIGlmIHRoZSBMUEMgc2xhdmUgY29udHJv
bGxlciBpcyBjb25maWd1cmVkIHJpZ2h0bHksIEhvc3QgQ1BVIGNhbiBhY2Nlc3MgdGhlIEJN
QydzIG1lbW9yeSBzcGFjZSBieSB1c2luZyBtZW1vcnkgcmVhZGluZyBvciB3cml0aW5nIHRv
IHRoZSBhZGRyZXNzIHdyaXR0ZW4gdG8gIlNJTyBpTFBDMkFIQiBhZGRyZXNzIiByZWdpc3Rl
cj88L2Rpdj48ZGl2PklmIEkgYW0gcmlnaHQsIHdoYXQgZG9lcyBTdXBlcklPIGNvbnRyb2xs
ZXIgZG8sIGlzIGl0IGJldHdlZW4gSG9zdCdzIExQQyBidXMgYW5kIEJNQydzIExQQyBzbGF2
ZSBjb250cm9sbGVyIGxpa2U6PC9kaXY+PGRpdj5Ib3N0LS0mZ3Q7TFBDIGJ1cy0tJmd0O1N1
cGVySU8gY29udHJvbGxlci0tJmd0O0xQQyBzbGF2ZSBjb250cm9sbGVyLS0mZ3Q7TFBDMkFI
QiBicmlkZ2UtLSZndDtTUEkgRmxhc2ggbWFwcGluZzwvZGl2PjxkaXY+b3IgU3VwZXJJTyBj
b250cm9sbGVyIGlzIGluZGVwZW5kZW50IG9mIExQQyBzbGF2ZSBjb250cm9sbGVyIGxpa2U6
PC9kaXY+PGRpdj5Ib3N0LS0mZ3Q7TFBDIGJ1cy0tJmd0O1N1cGVySU8gY29udHJvbGxlcjwv
ZGl2PjxkaXY+SG9zdC0tJmd0O0xQQyBidXMtLSZndDtMUEMgc2xhdmUgY29udHJsbGVyLS0m
Z3Q7TFBDMkFIQiBicmlkZ2UtLSZndDtTUEkgRmxhc2ggbWFwcGluZzwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+Mi4gSSBmb3VuZCAiYXNwZWVkLWxwYy1jdHJsLmMiIGluIGxpbnV4IGtl
cm5lbCBzb3VyY2UgY29kZS4gQWx0aG91Z2ggSSBhbSBub3QgdmVyeSBmYW1pbGFyIHdpdGgg
dGhpcyBkcml2ZXIsIEkgZm91bmQgdGhhdCBieSBjb25maWd1cmluZyB0aGUgTFBDIHNsYXZl
IGNvbnRyb2xsZXIncyBob3N0IGludGVyZmFjZSBjb250cm9sIHJlZ2lzdGVyLCB0aGlzIGRy
aXZlciBjYW4gZGVjaWRlIHdoaWNoIEJNQydzIG1lbW9yeSBzcGFjZSBjYW4gYmUgbWFwcGVy
IHRvIEhvc3QgQ1BVLjwvZGl2PjxkaXY+QW5kIEluIHRoZSBwaWN0dXJlIHlvdSBkcmF3IGZv
ciBtZTwvZGl2PjxkaXY+SG9zdCBDUFU8YnI+Jm5ic3A7ICZuYnNwOyAtJmd0OyBMUEMgRlc8
YnI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IC0mZ3Q7IExQQzJBSEIgQnJpZGdlPGJy
PiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7IC0mZ3Q7IFNQSSBm
bGFzaCBtYXBwaW5nPGJyPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgLSZndDsgU1BJIEZsYXNoPC9kaXY+PGRpdj5Eb2VzIHRoZSAi
TFBDIEZXIiBtZWFucyBhc3BlZWQtbHBjLWN0cmwgZHJpdmVyPzwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+QmVzdCBSZWdhcmRzITwvZGl2PjxkaXY+TGl1IEhvbmd3ZWk8L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LXNpemU6IDEycHg7Zm9udC1mYW1pbHk6IEFy
aWFsIE5hcnJvdztwYWRkaW5nOjJweCAwIDJweCAwOyI+PHNwYW4gc3R5bGU9ImZvbnQtZmFt
aWx5OiBWZXJkYW5hOyBmb250LXNpemU6IDE0cHg7Ij4mZ3Q7SGkgTGl1IEhvbmd3ZWksPC9z
cGFuPjwvZGl2Pjxicj4mZ3Q7T24gRnJpLCAyNCBBcHIgMjAyMCwgYXQgMjM6NTgsIMTP0rCl
4KXrpbelqKXppbQgd3JvdGU6PGJyPiZndDsmZ3Q7IEhpLCBHcmVldGluZ3M8YnI+Jmd0OyZn
dDsmbmJzcDsgQSBCTUMgdXN1YWxseSB1c2VzIGFzcGVlZCdzIGNoaXAuIFRvIGxlYXJuIEJN
QyBJIHJlYWQgdGhlIHNwZWMgb2YgPGJyPiZndDsmZ3Q7IGFzcGVlZCdzIEFTVDI1MDAuIEkg
aGF2ZSBsb25nIGJlZW4gY29uZnVzZWQgYnkgdHdvIHF1ZXN0aW9ucyB3aGVuIEkgYW0gPGJy
PiZndDsmZ3Q7IGxlYXJuaW5nIEJNQy48YnI+PGJyPiZndDsmZ3Q7Jm5ic3A7IDEuIE9uZSBp
cyB0aGF0OiBIb3cgY2FuIHRoZSBob3N0IGFjY2VzcyBCTUMncyBTUEkgRmxhc2ggdmlhIExQ
Qz8gSSA8YnI+Jmd0OyZndDsgcmVhZCBmcm9tIEFTVDI1MDAncyBzcGVjIHRoYXQgdGhlIGhv
c3QgY2FuIHVwZGF0ZSB0aGUgQklPUyBzdG9yZWQgaW4gPGJyPiZndDsmZ3Q7IHRoZSBTUEkg
Zmxhc2ggdmlhIExQQy48YnI+PGJyPiZndDtPa2F5IGZpcnN0IHRoaW5nIHRvIGFkZHJlc3Mg
aXMgc2VwYXJhdGlvbiBvZiBjb25jZXJuczogVGhlcmUgYXJlIHNlcGFyYXRlPGJyPiZndDtT
UEkgY29udHJvbGxlcnMgZm9yIHRoZSBCTUMgYW5kIGhvc3QgZmlybXdhcmUuPGJyPjxicj4m
Z3Q7Jmd0OyBJIGFsc28gc2VlbiBmcm9tIEFTVDI1MDAncyBzcGVjIHRoYXQgdGhlIFNQSSA8
YnI+Jmd0OyZndDsgY29udHJvbGxlciBpbiBBU1QyNTAwIGNhbiBiZSBhY2Nlc3MgYnkgaG9z
dCB0aHJvdWdoIExQQy4gSXQgc2VlbXMgbGlrZSA8YnI+Jmd0OyZndDsgdGhlIGFyY2hpdGVj
dHVyZSBpcyBhcyBiZWxvdy48YnI+Jmd0OyZndDsmbmJzcDsgSG9zdCBDUFUtLS0tJmd0O0xQ
Qy0tLS0mZ3Q7U1BJIGNvbnRyb2xsZXItLS0tJmd0O1NQSSBGbGFzaFtCSU9TXTxicj48YnI+
Jmd0O1JvdWdobHksIHllcy4gVGhlcmUgYXJlIGEgY291cGxlIG9mIG90aGVyIGNyaXRpY2Fs
IHBpZWNlcyBvZiB0aGUgcHV6emxlOjxicj48YnI+Jmd0OzEuIFRoZSBTUEktYXR0YWNoZWQg
c3RvcmFnZSBpcyBtYXBwZWQgaW50byB0aGUgQk1DJ3MgcGh5c2ljYWwgYWRkcmVzczxicj4m
Z3Q7c3BhY2U8YnI+Jmd0OzIuIFRoZSBCTUMncyBMUEMgc2xhdmUgY29udHJvbGxlciBjb250
YWlucyBhIGJyaWRnZSB0aGF0IGFsbG93cyBob3N0PGJyPiZndDthY2Nlc3NlcyB0byB0aGUg
TFBDIEZXIHNwYWNlIHRvIGJlIGNvbnZlcnRlZCB0byBhY2Nlc3NlcyB0byB0aGUgPGJyPiZn
dDtCTUMncyBwaHlzaWNhbCBhZGRyZXNzIHNwYWNlLjxicj48YnI+Jmd0O1NvIHRoZSBwaWN0
dXJlIGxvb2tzIGxpa2U6PGJyPjxicj4mZ3Q7SG9zdCBDUFU8YnI+Jmd0OyZuYnNwOyZuYnNw
OyZuYnNwOyAtJmd0OyBMUEMgRlc8YnI+Jmd0OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyAtJmd0OyBMUEMyQUhCIEJyaWRnZTxicj4mZ3Q7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7IC0mZ3Q7IFNQSSBmbGFzaCBtYXBwaW5nPGJyPiZndDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsgLSZndDsgU1BJIEZsYXNoPGJyPjxicj4mZ3Q7Jmd0OyZuYnNw
OyBJIGRvIG5vdCBrbm93IGhvdyBpdCB3b3JrcywgZG9lcyB0aGlzIG5lZWQgdG8gaW5zdGFs
bCBhIExQQyBkcml2ZXIgaW4gPGJyPiZndDsmZ3Q7IGhvc3QgT1MgYW5kIG9wZW5ibWMgT1M/
IEFuZCBkb2VzIHRoaXMgbmVlZCBzb2Z0d2FyZSBpbnRlcnZlbnRpb24/PGJyPjxicj4mZ3Q7
VGhlIGhvc3QgT1Mgb3IgZmlybXdhcmUgbGlrZWx5IGFscmVhZHkga25vd3MgaG93IHRvIGRy
aXZlIHRoZSBMUEMgYnVzLiBUaGU8YnI+Jmd0O0xQQyBidXMgaXMgdHlwaWNhbGx5IHBhcnQg
b2YgdGhlIGhvc3QncyBib290IHBhdGgsIHBhcnRpY3VsYXJseSBpZiB0aGUgQklPUyBpczxi
cj4mZ3Q7c3RvcmVkIG9uIFNQSSBmbGFzaCBhdHRhY2hlZCB0byB0aGUgQk1DICh0aG91Z2gg
b24gSW50ZWwgc3lzdGVtcyBlU1BJPGJyPiZndDtzdXBlcnNlZGVzIExQQywgYnV0IHRoZSBj
b25jZXB0cyBhcmUgcm91Z2hseSB0aGUgc2FtZSkuPGJyPjxicj4mZ3Q7Jmd0OyZuYnNwOyAy
LiBUaGUgb3RoZXIgaXMgdGhhdDogSG93IGRvZXMgQk1DJ3MgQ1BVIHJlYWQgdWJvb3QgY29k
ZSBmcm9tIFNQSSA8YnI+Jmd0OyZndDsgZmxhc2ggd2hlbiBwb3dlciB1cD8gSSBrbm93IHRo
YXQgdGhlIHVib290KGFjdCBhcyBib290bG9hZGVyKSBpcyBzdG9yZWQgPGJyPiZndDsmZ3Q7
IGluIGEgU1BJIGZsYXNoLCBhbmQgdWJvb3QgaXMgdGhlIGZpcnN0IGNvZGUgdGhhdCBpcyBl
eGVjdXRlZCBieSBCTUMncyA8YnI+Jmd0OyZndDsgQ1BVLiBJIGRvIG5vdCBrbm93IHdoZXRo
ZXIgaXQgaXMgcmlnaHQgb3Igd3JvbmcgYnV0IEkgdGhpbmsgQk1DJ3MgQ1BVIDxicj4mZ3Q7
Jmd0OyBjYW4gb25seSBleGVjdXRlIHRoZSBjb2RlIHN0b3JlZCBpbiBEUkFNLjxicj48YnI+
Jmd0O1RoaXMgaXMgd2hlcmUgeW91J3JlIGZhbGxpbmcgZG93bi4gSW4gdGhlb3J5IHRoZSBC
TUMgY2FuIGV4ZWN1dGU8YnI+Jmd0O2luc3RydWN0aW9ucyBmcm9tIGFueXdoZXJlIGluIGl0
cyBwaHlzaWNhbCBhZGRyZXNzIHNwYWNlLiBEUkFNIGlzPGJyPiZndDtsb2NhdGVkIHNvbWV3
aGVyZSBpbiB0aGF0IHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UgKG9uIHRoZSBBU1QyNTAwLDxi
cj4mZ3Q7aXQgaXMgbG9jYXRlZCBhdCAweDgwMDAwMDAwKSwgaG93ZXZlciB0aGVyZSBhcmUg
b3RoZXIgYXJlYXMgb2YgaW50ZXJlc3Q8YnI+Jmd0O2luIHRoZSBwaHlzaWNhbCBhZGRyZXNz
IHNwYWNlLCBuYW1lbHkgdGhlIG1hcHBpbmcgb2YgdGhlIEJNQyBmbGFzaDxicj4mZ3Q7dG8g
MHgwLiBUaGlzIGlzIHRoZSByZXNldCB2ZWN0b3IgZm9yIHRoZSBBUk0gY29yZSwgc28gd2hl
biBpdCBpcyByZWxlYXNlZDxicj4mZ3Q7ZnJvbSByZXNldCBpdCBzdGFydHMgZXhlY3V0aW5n
IHdoYXRldmVyIGluc3RydWN0aW9ucyBhcmUgcHJlc2VudCBhdCAweDAuPGJyPiZndDtUaGUg
U29DIGhhcmR3YXJlIGRlc2lnbiBoYW5kbGVzIHRoZSBmYWN0IHRoYXQgdGhlIGluc3RydWN0
aW9ucyBhdCAweDA8YnI+Jmd0O2FyZSBmZXRjaGVkIGZyb20gdGhlIEJNQydzIFNQSSBmbGFz
aCBzbyBubyBkcml2ZXIgaXMgbmVlZGVkLjxicj48YnI+Jmd0O0FuZHJldzxicj48L2Rpdj4=

------=_NextPart_5EB6DC1E_105E4030_4DD085BD--



