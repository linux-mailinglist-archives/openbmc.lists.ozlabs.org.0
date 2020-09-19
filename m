Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 429AD271896
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 01:26:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvkHB2hqszDqkG
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 09:26:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=183.3.226.222; helo=qq.com; envelope-from=1061115310@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=IiNZQr1X; dkim-atps=neutral
X-Greylist: delayed 72 seconds by postgrey-1.36 at bilbo;
 Sat, 19 Sep 2020 22:30:46 AEST
Received: from qq.com (smtpbg417.qq.com [183.3.226.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Btqmk0hvCzDqcG
 for <openbmc@lists.ozlabs.org>; Sat, 19 Sep 2020 22:30:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1600518510; bh=LAmrUx7+VrVOv55GP0h8NowA9ub1SWz0q731AhPSfQc=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=IiNZQr1XXS8MFksjQcNzMVNlZPfpURiBl67kP4FJ779Exo67I3AnBTbA4ukcmnjsG
 Q9FypAAF1vXlgwjuVJO8O4dcfv1qHyQJJbah1V97eYQ94aBDRunG2c/lpax9ohFn9n
 9Sam1XrbvfbkG3HXQBo0CoR318FwuB9JhrWK9RF4=
X-QQ-FEAT: 7/03I9sl9Ps0aDeNQgOCu/y0Kiv+J5T1aczvrO4muONpl4hoFY8qXjsteBoYH
 iF8B0CIch2mFoW5aZnfllf52cTh2Rv9iW1GOKBwklDVzeR4nft5iB654UWlLVo0WcnBWNip
 1UOD+2uMnuGrkxto9nBEJY7o4GJy+fU4pk4/J1PPRHFIAyzNj7ecPCWSApRAoWYvUseZgBE
 f73diyN5BQGFaMFE8BdDK1YQ10ZTygLvyWMVwUkI3RDCI15rbfH3ryuE9FaLVtsMkeUb/GQ
 zIuOzyt0WxHvAJ
X-QQ-SSF: 000000000000008000000000000000I
X-QQ-XMAILINFO: Mjk/QaGgHt1nnwujDHL3+8um3PYGdS9nl0GLt0NWzAyCybphC2bsyo5hmAr7R5
 CspSlQSOX7hekT+dU8bqnXbf9pitwAfFONlMo3K5DGAJ8rJ0DsZIrmmM0kNgrkmqQicdvh/zyQ1Qc
 5YFTVoVo6R6F97RwWuv598wgALDV3NTUz46M45vU4olYKsgdjgk5DzuQ3w/XxXO4unWmjQPDNqD9y
 rgGrWFcSAIo+5M/qHx77tdSAeUel0JZG+6CnV/E+N9KRsEuAtP59Ug6ibAKBkOmiyMX4MS3xO0WA4
 2oNKKm0mfbvN8TXvfKtkWsdd+DnZ5h7wS2VEIAndX6GmIop5y5yOrmjRZQHNaH1OW3+/e62Foszs4
 oEFFGa54+e1DISE0M75MnEz5tg135gWVnB1o2JrEOmDeTGk9mt4bHQLl19SXOe9uxMpkVbdT4Ua47
 z29KL+LCpM3hauwkgHEE8HfylTh7vMYn1b+hCHPBeYteEj61n1/swla/h+QsIEiwJMgJNN9Wny/Dv
 KcpdzRjYeIEb+scgVzU5puvi0xnTLBdptRVNfEXI8q19Zwt/yKWU1rW4/pRMsvetWeSB/U587YRQi
 8gsVclfj+In0n4v2q5fqChNIkRWDhaT1Gn8fc00buCjJzN2cFpzP8rIrtP76zIsr65xgqr5/V52iJ
 Nln5GvvPeb0Rp+5rOGkc3ZGKRnlxCL6+XRHG2ag8jz0Wiwm1P7hKbtxwVLNw==
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 114.87.180.190
X-QQ-STYLE: 
X-QQ-mid: webmail518t1600518508t262998
From: "=?gb18030?B?wOa7qNTC?=" <1061115310@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: How to change the default output serial
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5F65F96C_0F66D9A8_32061253"
Content-Transfer-Encoding: 8Bit
Date: Sat, 19 Sep 2020 20:28:28 +0800
X-Priority: 3
Message-ID: <tencent_6F261EA87E463E36A2F80C7933DC7A3A2109@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Sat, 19 Sep 2020 20:28:29 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign11
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Mon, 21 Sep 2020 09:26:09 +1000
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

------=_NextPart_5F65F96C_0F66D9A8_32061253
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGVsbG8gdGhlcmUNCkkgYW0gdHJ5aW5nIHRvIHVzZSBvcGVuYm1jIHJlY2VudGx5LiBUaGUg
Ym9hcmQgdXNlcyB1YXJ0MiBhcyB0aGUgb3V0cHV0IG9mIEJNQy4gSG93IGNhbiBJIGNoYW5n
ZSB0aGUgZGVmYXVsdCB1YXJ0IGZyb20gdWFydDUgdG8gdWFydDI/DQpUaGUgaW1hZ2UgSSBj
b21waWxlZCBvbiB0aGUgYmFzaXMgb2Ygcm9tdWx1cywgZmlyc3QgSSBtb2RpZmllZCBhc3Bl
ZWQtYm1jLW9wcC1yb211bHVzLmR0cywgSSBvcGVuZWQgdGhlIHVhcnQyIHNlcmlhbCBwb3J0
IGluIGR0cywgYW5kIG1vZGlmaWVkIHN0ZG91dC1wYXRoPSZhbXA7dWFydDIsYm9vdGFyZ3Mg
PSAiY29uc29sZSA9IHR0eVMxIiBpbiBjaG9zZW4uDQpUaGVuLCBJIG1vZGlmaWVkIHRoZSBp
bmNsdWRlL2NvbmZpZy9hc3QtY29tbW9uLmggZmlsZSBpbiB1Ym9vdCAsICNkZWZpbmUgQ09O
RklHX1NZU19OUzE2NTUwX0NPTTEgQVNUX1VBUlQyX0JBU0Uod2hpY2UgaXMgQVNUX1VBUlQw
X0JBU0UpLg0KQW0gSSBkb2luZyBzb21ldGhpbmcgd3Jvbmc/IERvIHlvdSBoYXZlIGFueSBz
dWdnZXN0aW9uPw0KDQpUaGFua3MhIQ0Kc2djLg==

------=_NextPart_5F65F96C_0F66D9A8_32061253
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj48ZGl2PkhlbGxvIHRoZXJlPC9kaXY+PGRpdj5JIGFtIHRy
eWluZyB0byB1c2Ugb3BlbmJtYyByZWNlbnRseS4gVGhlIGJvYXJkIHVzZXMgdWFydDIgYXMg
dGhlIG91dHB1dCBvZiBCTUMuIEhvdyBjYW4gSSBjaGFuZ2UgdGhlIGRlZmF1bHQgdWFydCBm
cm9tIHVhcnQ1IHRvIHVhcnQyPzwvZGl2PjxkaXY+VGhlIGltYWdlIEkgY29tcGlsZWQgb24g
dGhlIGJhc2lzIG9mIHJvbXVsdXMsIGZpcnN0IEkgbW9kaWZpZWQgYXNwZWVkLWJtYy1vcHAt
cm9tdWx1cy5kdHMsIEkgb3BlbmVkIHRoZSB1YXJ0MiBzZXJpYWwgcG9ydCBpbiBkdHMsIGFu
ZCBtb2RpZmllZCBzdGRvdXQtcGF0aD0mYW1wO3VhcnQyLGJvb3RhcmdzID0gImNvbnNvbGUg
PSB0dHlTMSIgaW4gY2hvc2VuLjwvZGl2PjxkaXY+VGhlbiwgSSBtb2RpZmllZCB0aGUgaW5j
bHVkZS9jb25maWcvYXN0LWNvbW1vbi5oIGZpbGUgaW4gdWJvb3QgLCAjZGVmaW5lIENPTkZJ
R19TWVNfTlMxNjU1MF9DT00xIEFTVF9VQVJUMl9CQVNFKHdoaWNlIGlzIEFTVF9VQVJUMF9C
QVNFKS48L2Rpdj48ZGl2PkFtIEkgZG9pbmcgc29tZXRoaW5nIHdyb25nPyBEbyB5b3UgaGF2
ZSBhbnkgc3VnZ2VzdGlvbj88c3BhbiBzdHlsZT0iY29sb3I6IHJnYigzNiwgNDEsIDQ2KTsg
Zm9udC1mYW1pbHk6IC1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7
U2Vnb2UgVUkmcXVvdDssIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICZxdW90O0Fw
cGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBFbW9qaSZxdW90OzsiPjwv
c3Bhbj48L2Rpdj48L2Rpdj48ZGl2PlRoYW5rcyEhPC9kaXY+PGRpdj5zZ2MuPC9kaXY+

------=_NextPart_5F65F96C_0F66D9A8_32061253--



