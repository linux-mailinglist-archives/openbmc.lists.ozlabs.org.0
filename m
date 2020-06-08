Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2851F1BD5
	for <lists+openbmc@lfdr.de>; Mon,  8 Jun 2020 17:17:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gcL26Yc1zDqNK
	for <lists+openbmc@lfdr.de>; Tue,  9 Jun 2020 01:16:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=59.36.132.74; helo=qq.com; envelope-from=1181052146@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=wgjd4k9N; dkim-atps=neutral
Received: from qq.com (smtpbg474.qq.com [59.36.132.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gcJR3GXMzDqBZ
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jun 2020 01:15:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1591629299; bh=cILWj2+DNTB+MJNeiM43KiGhhuKV9TnhXD1gyxSkfo0=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=wgjd4k9NAzItAI6c5uJfqjVGicYXKWxAuz0z7x4QaWU1qxsromHVTz68vcROayVvW
 HKGn8dGHTM0yOewtzs+WRzib1WahgRGw0GIkz282ErCdhF513YSN2IMxAnV3EWDMWW
 0Uhr4wBm1uSmJDYJoIZz4hG5dJsKm3IPZK2osLgQ=
X-QQ-FEAT: AiLI7YoLuXN+BEt5rYm+yKqemdUTADLeB9FcYjG+PxfTN9WhOyekLLKchJp67
 DqCBdupTPibSYf5RkMTL0sXkWt/RYsrnmcf5ZB9gHD9PdS0+WjopqxNirvVpVyWwgn6/89a
 FTxvDPR/HlHIdkuBWsA8kEZa4fUNBBYGIoRUaAurXcT8aBlkSd1kdfbM4+cRbrlVVT3i9ph
 UvNGypPIz4TXnF86ptb5Q5I+5mjlr56HPrb9t9vTqtZd6HPqUBdSJ624CaKwJATUVKrtuf/
 lfs4hRo2mfVFG5jehb873kCNQuSgac6NtAog==
X-QQ-SSF: 00000000000000F000000000000000S
X-QQ-XMAILINFO: NmeXSpW9lEG5D1pkr8NKK6Iyf+fdu8svfoAGLLRpAiguvoOJqJBBf/dqG+QRfo
 VNoo7CzQD/g/mjEXHcJIqto0+xVsK/SgA+/58B9M+Htg+eKzmUahu5VTmMMxV8C1bquItt1IceU7T
 Cr5CbCqKUSqAh8qPs8jiZSxjQZY9VfDH5BmBSnoPyWiA9gPGchBorBi0EoTjfeKdSt4pvmmLpr8ZX
 LNuNG0jKQV9rHQS871PWcLyUAjmJoxFkXQVPT9oVuaj1LpLBZW9ToXVj8RwZplxz3sr7DmYeMk0Si
 Yl9vx1W0imR4pWKxHukjmUTcmA+Chpblqm1C0gWZHB6LZ5TexdbwUeeXTmI+35pVv5X5pX9iXTBPJ
 L9vXVuyOFAWe1A4qACPR4KicBVyJesryLAJSxAWv6tPuso/UyG5UGp/xB4NDjI9VLYXMW/0DsR/NX
 zoay/CRo2toExEz/dIzzIvGUFIp81UTWrNMG2kLYOx8vqBTlwi5rjsDyNOXEDmK34o2kt7KkLE4+1
 fi3VOAFPQUlUD5Ay3zy3rs7da3UFMIh62ZylgPwzpjO7sPLdy3FqWWZU9srT4s4Oqrd+1s7jy+YoM
 N/tP92Sm/MYU2AQmtpzkoVTbMnwQ9Mpwps7ZffVhWZ1YU6fMao6fuD6UE+kud5204CNJmw5dTcPah
 J7NmNzeXrPT7LGJo+5ujLh5dmVtL661TTjJtdGZXKTZ/XvM+A3UHe7i/JYxzhBsApMPPEUPVDt2ki
 9au6hyuTpRvi8cQ==
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 125.37.230.34
In-Reply-To: <ee8302a6-4303-457b-add1-8fa9d532c4a9@www.fastmail.com>
References: <tencent_2D6AE7A4D981E94342BD340BC7DF4EBE7F05@qq.com>
 <4813264f-fe81-4563-838d-f5356acb768a@www.fastmail.com>
 <tencent_720F45F5C22C1BFF2BF99029CA933807E907@qq.com>
 <b59bce6b-52d6-427b-84fa-defae872af10@www.fastmail.com>
 <tencent_1D864FA41CFA3E42D4A9B236FC75E41BA609@qq.com>
 <ee8302a6-4303-457b-add1-8fa9d532c4a9@www.fastmail.com>
X-QQ-STYLE: 
X-QQ-mid: webmail700t1591629296t8373727
From: "=?gb18030?B?xM/SsKXgpeult6WopemltA==?=" <1181052146@qq.com>
To: "=?gb18030?B?QW5kcmV3IEplZmZlcnk=?=" <andrew@aj.id.au>,
 "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: =?gb18030?B?UmWjuiBSZaO6IFJlo7ogSG93IGNhbiB0aGUgaG9z?=
 =?gb18030?B?dCBhY2Nlc3MgQk1DJ3MgU1BJIEZsYXNoIHZpYSBM?=
 =?gb18030?B?UEMgYW5kIEhvdyBkbyBCTUMncyBDUFUgcmVhZCB1?=
 =?gb18030?B?Ym9vdCBmcm9tIFNQSSBGbGFzaCB3aGVuIHBvd2Vy?=
 =?gb18030?B?IHVwPw==?=
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5EDE55F0_10C4CC78_2070DF52"
Content-Transfer-Encoding: 8Bit
Date: Mon, 8 Jun 2020 23:14:56 +0800
X-Priority: 3
Message-ID: <tencent_78FEB7F292530D274F0E381FC4EA4F595308@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 1653484767
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Mon, 08 Jun 2020 23:14:58 +0800 (CST)
Feedback-ID: webmail:qq.com:bgweb:bgweb10
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

------=_NextPart_5EDE55F0_10C4CC78_2070DF52
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGkgTXIuIEFuZHJldyBKZWZmZXJ5DQoNCg0KVGhhbmsgeW91IGZvciB5b3VyIGhlbHAuIE5v
dyBJIGtub3cgaG93IExQQzJBSEIgYnJpZGdlIHdvcmsuIFRoYW5rIHlvdSB2ZXJ5IG11Y2gh
DQoNCg0KQmVzdCBSZWdhcmRzIQ0KTGl1IEhvbmd3ZWkNCg0KDQoNCg0KT24gV2VkLCAyNyBN
YXkgMjAyMCwgYXQgMjI6MzAsIMTP0rCl4KXrpbelqKXppbQgd3JvdGU6DQomZ3Q7IEhpIE1y
LiBBbmRyZXcgSmVmZmVyeQ0KJmd0OyANCiZndDsgVGhhbmsgeW91IHZlcnkgbXVjaCBmb3Ig
eW91ciBoZWxwLiBJIHJlYWxseSB0aGFua3MgZm9yIHlvdXIgDQomZ3Q7IGV4cGxhbmF0aW9u
cywgdmVyeSBkZXRhaWwgYW5kIHZlcnkgY2xlYXIuDQomZ3Q7IE5vdyBJIGFtIGNsZWFyIGFi
b3V0IHRoZSBpTFBDMkFIQiBicmlkZ2UuIEkgZm91bmQgdGhlIGlMUEMyQUhCIGJyaWRnZSAN
CiZndDsgZGV2aWNlIGluIEFTVDI1MDAsIGJ1dCBJIGRvIG5vdCBmaW5kIHRoZSBMUEMyQUhC
IGJyaWRnZS4gSSB0aGluayBtYXliZSANCiZndDsgaXQgaXMgaW50ZWdyYXRlZCBpbiBMUEMg
Y29udHJvbGxlciwgYW5kIGFib3V0IGhvdyBMUEMyQUhCIHdvcmssIHBlcmhhcHMgDQomZ3Q7
IEkgc3RpbGwgbmVlZCBzb21lIHRpbWUgdG8gc3R1ZHkgdGhpcy4NCg0KUmlnaHQsIHllcywg
aXQgaXMgImhpZGRlbiIgaW4gdGhlIExQQyBjb250cm9sbGVyLiBZb3Ugd2FudCB0byBsb29r
IGF0IHJlZ2lzdGVycyANCkhJQ1I3IGFuZCBISUNSOC4gTm93LCB0aGUgZGVzY3JpcHRpb25z
IGZvciB0aGVzZSB0d28gcmVnaXN0ZXJzIGluIHRoZSBkYXRhc2hlZXQgDQphcmUgcXVpdGUg
Y3J5cHRpYy4gWW91IG1lbnRpb25lZCB5b3UgaGFkIGZvdW5kIHRoZSBhc3BlZWQtbHBjLWN0
cmwgZHJpdmVyIGluIA0KdGhlIGtlcm5lbCBlYXJsaWVyLiBUaGlzIGlzIHRoZSBjb2RlIHRo
YXQgZHJpdmVzIHRoZSBMUEMyQUhCIGJyaWRnZSwgYW5kIGl0IGhhcyANCnRoZSBmb2xsb3dp
bmcgaGVscGZ1bCBjb21tZW50Og0KDQoJCS8qDQoJCSAqIFRoZSB0b3AgaGFsZiBvZiBISUNS
NyBpcyB0aGUgTVNCIG9mIHRoZSBCTUMgYWRkcmVzcyBvZiB0aGUNCgkJICogbWFwcGluZy4N
CgkJICogVGhlIGJvdHRvbSBoYWxmIG9mIEhJQ1I3IGlzIHRoZSBNU0Igb2YgdGhlIEhPU1Qg
TFBDDQoJCSAqIGZpcm13YXJlIHNwYWNlIGFkZHJlc3Mgb2YgdGhlIG1hcHBpbmcuDQoJCSAq
DQoJCSAqIFRoZSAxIGJpdHMgaW4gdGhlIHRvcCBvZiBoYWxmIG9mIEhJQ1I4IHJlcHJlc2Vu
dCB0aGUgYml0cw0KCQkgKiAoaW4gdGhlIHJlcXVlc3RlZCBhZGRyZXNzKSB0aGF0IHNob3Vs
ZCBiZSBpZ25vcmVkIGFuZA0KCQkgKiByZXBsYWNlZCB3aXRoIHRob3NlIGZyb20gdGhlIHRv
cCBoYWxmIG9mIEhJQ1I3Lg0KCQkgKiBUaGUgMSBiaXRzIGluIHRoZSBib3R0b20gaGFsZiBv
ZiBISUNSOCByZXByZXNlbnQgdGhlIGJpdHMNCgkJICogKGluIHRoZSByZXF1ZXN0ZWQgYWRk
cmVzcykgdGhhdCBzaG91bGQgYmUga2VwdCBhbmQgcGFzcw0KCQkgKiBpbnRvIHRoZSBCTUMg
YWRkcmVzcyBzcGFjZS4NCgkJICovDQoNCgkJLyoNCgkJICogSXQgZG9lc24ndCBtYWtlIHNl
bnNlIHRvIHRhbGsgYWJvdXQgYSBzaXplIG9yIG9mZnNldCB3aXRoDQoJCSAqIGxvdyAxNiBi
aXRzIHNldC4gQm90aCBISUNSNyBhbmQgSElDUjggdGFsayBhYm91dCB0aGUgdG9wIDE2DQoJ
CSAqIGJpdHMgb2YgYWRkcmVzc2VzIGFuZCBzaXplcy4NCgkJICovDQoNCmh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4Lmdp
dC90cmVlL2RyaXZlcnMvc29jL2FzcGVlZC9hc3BlZWQtbHBjLWN0cmwuYz9oPXY1LjcjbjEw
MQ0KDQpIb3BlIHRoYXQgY2xhcmlmaWVzIGhvdyB0aGUgTFBDMkFIQiB3b3JrcyENCg0KQW5k
cmV3

------=_NextPart_5EDE55F0_10C4CC78_2070DF52
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj5IaSBNci4gQW5kcmV3IEplZmZlcnk8L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PlRoYW5rIHlvdSBmb3IgeW91ciBoZWxwLiBOb3cgSSBrbm93IGhvdyBM
UEMyQUhCIGJyaWRnZSB3b3JrLiBUaGFuayB5b3UgdmVyeSBtdWNoITwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+QmVzdCBSZWdhcmRzITwvZGl2PjxkaXY+TGl1IEhvbmd3ZWk8L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXYgc3R5bGU9ImZvbnQtc2l6ZTogMTJweDtmb250LWZh
bWlseTogQXJpYWwgTmFycm93O3BhZGRpbmc6MnB4IDAgMnB4IDA7Ij48YnI+PC9kaXY+T24g
V2VkLCAyNyBNYXkgMjAyMCwgYXQgMjI6MzAsIMTP0rCl4KXrpbelqKXppbQgd3JvdGU6PGJy
PiZndDsgSGkgTXIuIEFuZHJldyBKZWZmZXJ5PGJyPiZndDsgPGJyPiZndDsgVGhhbmsgeW91
IHZlcnkgbXVjaCBmb3IgeW91ciBoZWxwLiBJIHJlYWxseSB0aGFua3MgZm9yIHlvdXIgPGJy
PiZndDsgZXhwbGFuYXRpb25zLCB2ZXJ5IGRldGFpbCBhbmQgdmVyeSBjbGVhci48YnI+Jmd0
OyBOb3cgSSBhbSBjbGVhciBhYm91dCB0aGUgaUxQQzJBSEIgYnJpZGdlLiBJIGZvdW5kIHRo
ZSBpTFBDMkFIQiBicmlkZ2UgPGJyPiZndDsgZGV2aWNlIGluIEFTVDI1MDAsIGJ1dCBJIGRv
IG5vdCBmaW5kIHRoZSBMUEMyQUhCIGJyaWRnZS4gSSB0aGluayBtYXliZSA8YnI+Jmd0OyBp
dCBpcyBpbnRlZ3JhdGVkIGluIExQQyBjb250cm9sbGVyLCBhbmQgYWJvdXQgaG93IExQQzJB
SEIgd29yaywgcGVyaGFwcyA8YnI+Jmd0OyBJIHN0aWxsIG5lZWQgc29tZSB0aW1lIHRvIHN0
dWR5IHRoaXMuPGJyPjxicj5SaWdodCwgeWVzLCBpdCBpcyAiaGlkZGVuIiBpbiB0aGUgTFBD
IGNvbnRyb2xsZXIuIFlvdSB3YW50IHRvIGxvb2sgYXQgcmVnaXN0ZXJzIDxicj5ISUNSNyBh
bmQgSElDUjguIE5vdywgdGhlIGRlc2NyaXB0aW9ucyBmb3IgdGhlc2UgdHdvIHJlZ2lzdGVy
cyBpbiB0aGUgZGF0YXNoZWV0IDxicj5hcmUgcXVpdGUgY3J5cHRpYy4gWW91IG1lbnRpb25l
ZCB5b3UgaGFkIGZvdW5kIHRoZSBhc3BlZWQtbHBjLWN0cmwgZHJpdmVyIGluIDxicj50aGUg
a2VybmVsIGVhcmxpZXIuIFRoaXMgaXMgdGhlIGNvZGUgdGhhdCBkcml2ZXMgdGhlIExQQzJB
SEIgYnJpZGdlLCBhbmQgaXQgaGFzIDxicj50aGUgZm9sbG93aW5nIGhlbHBmdWwgY29tbWVu
dDo8YnI+PGJyPgkJLyo8YnI+CQkgKiBUaGUgdG9wIGhhbGYgb2YgSElDUjcgaXMgdGhlIE1T
QiBvZiB0aGUgQk1DIGFkZHJlc3Mgb2YgdGhlPGJyPgkJICogbWFwcGluZy48YnI+CQkgKiBU
aGUgYm90dG9tIGhhbGYgb2YgSElDUjcgaXMgdGhlIE1TQiBvZiB0aGUgSE9TVCBMUEM8YnI+
CQkgKiBmaXJtd2FyZSBzcGFjZSBhZGRyZXNzIG9mIHRoZSBtYXBwaW5nLjxicj4JCSAqPGJy
PgkJICogVGhlIDEgYml0cyBpbiB0aGUgdG9wIG9mIGhhbGYgb2YgSElDUjggcmVwcmVzZW50
IHRoZSBiaXRzPGJyPgkJICogKGluIHRoZSByZXF1ZXN0ZWQgYWRkcmVzcykgdGhhdCBzaG91
bGQgYmUgaWdub3JlZCBhbmQ8YnI+CQkgKiByZXBsYWNlZCB3aXRoIHRob3NlIGZyb20gdGhl
IHRvcCBoYWxmIG9mIEhJQ1I3Ljxicj4JCSAqIFRoZSAxIGJpdHMgaW4gdGhlIGJvdHRvbSBo
YWxmIG9mIEhJQ1I4IHJlcHJlc2VudCB0aGUgYml0czxicj4JCSAqIChpbiB0aGUgcmVxdWVz
dGVkIGFkZHJlc3MpIHRoYXQgc2hvdWxkIGJlIGtlcHQgYW5kIHBhc3M8YnI+CQkgKiBpbnRv
IHRoZSBCTUMgYWRkcmVzcyBzcGFjZS48YnI+CQkgKi88YnI+PGJyPgkJLyo8YnI+CQkgKiBJ
dCBkb2Vzbid0IG1ha2Ugc2Vuc2UgdG8gdGFsayBhYm91dCBhIHNpemUgb3Igb2Zmc2V0IHdp
dGg8YnI+CQkgKiBsb3cgMTYgYml0cyBzZXQuIEJvdGggSElDUjcgYW5kIEhJQ1I4IHRhbGsg
YWJvdXQgdGhlIHRvcCAxNjxicj4JCSAqIGJpdHMgb2YgYWRkcmVzc2VzIGFuZCBzaXplcy48
YnI+CQkgKi88YnI+PGJyPmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvc29jL2FzcGVlZC9h
c3BlZWQtbHBjLWN0cmwuYz9oPXY1LjcjbjEwMTxicj48YnI+SG9wZSB0aGF0IGNsYXJpZmll
cyBob3cgdGhlIExQQzJBSEIgd29ya3MhPGJyPjxicj5BbmRyZXc8YnI+PC9kaXY+

------=_NextPart_5EDE55F0_10C4CC78_2070DF52--

