Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCCA2559F6
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 14:22:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BdJdT5glSzDqsp
	for <lists+openbmc@lfdr.de>; Fri, 28 Aug 2020 22:22:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=183.3.255.121; helo=qq.com; envelope-from=1181052146@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=iS60x9oN; dkim-atps=neutral
X-Greylist: delayed 68 seconds by postgrey-1.36 at bilbo;
 Fri, 28 Aug 2020 22:21:36 AEST
Received: from qq.com (unknown [183.3.255.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BdJcJ3zMMzDqpJ
 for <openbmc@lists.ozlabs.org>; Fri, 28 Aug 2020 22:21:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1598617196; bh=9XfcEsvJnasW+6cAtC3Z2dbY74NTouDye1aMa8mHOOM=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=iS60x9oN/CUIsFFElSRNgNjz97U3NlgUtlmjQlOpbEDkjnS7Z1TNSIl72Tmn0I2LE
 zpT6hAZgHvV4iln7lZ0wqzbINMdb7WD8ewLebE/VCIh9tqC8VY11puYZ+nwr9Nq7wf
 p4k+6I0uuOkHjl8ELFNP2YcbhS0GRLb5Mai73JwA=
X-QQ-FEAT: dWhNifKHUN2CrqogfWm/XQ3kxuNolknvhyBrB5ldGJDgGj6MkSCK9OAr205zG
 rzNXS3tZPyPm1FACxXXVRbERtm2jaR1OHp54KyFgw4zHVug4SGPE9AwhHGpbeHKpt0K46wo
 seyhxN/HEcPS9U/joSJjVZiL9Ku0qnAE9NWKZLrdTCMq8hO+PHYKronePsJvJbVUCFivMy9
 x5greaao/XHQwpEPDHyrQNlv3o53wQBQgZXX2iHTjjsf449Ke8Cr1Y636gmfS3vaWZ6KEcY
 B+0jYsAQoFuSY1Rao8aqGsyRhtVItoYwmfFFdoD7eFPI6T
X-QQ-SSF: 00000000000000F000000000000000S
X-QQ-XMAILINFO: MfIYxfOdYVjpiI9mCTBE/jo6XO4k9RM/GXtRdlowTbKPVI8C0XhJD+kF1N/d87
 2pyckdqRGFyPulRH1g10dM2CT24H/ponYgUCtoYdlxoY6EjqrrZx59G3Xd/oHLk02ZLcjQOHTqKeO
 5Tzs9wc4t4A3gsEjwuFSA/GYbkwvc+0kTTt1JAfxMLlAanlI/mkqvRr2hDjeAqZecDKfiKxTEd5WG
 RGB6EVjGYLPhV3OMT/0x8cq6qPACjK8BNAYg6uRvfdpcKbwkm00wt8hcZ3llKYrbWTega5wQMbrXH
 6Ax+HkKi97CPusoqE2UmdlvR4sBsRv18HPtzNG0fidQ1I4R/YfHu5z1iEWeySIIpxr4Fkm21D3GwQ
 64Pf+gNKEDCuSxmHzGL3lpPegQYnt3LDAaPtXMmO4S7Iu2L+eGPTnizBa2+DWSGFwcQLmMJQuSfms
 HAqN9m6i+bUx5P4RQLJCML/MHv6nX7KhslA8/cQJHz0HS0RqnZWlD2wgWtnQK4sc9vibG+/jrRMtN
 WMNVceaW63Xo8+O6D933wTqWWZC1uBsoZ+azQZm06w4CSZPDa1+roitdpxBdHl8MKn+osGXDJPzxu
 aCwye3YpDJDjVgz3BK+QMweE3+X8pTCfcQ/RyYbhgnyPYhLtnG4YK6hDbfYpe2Yx7/9wwkC2FCgZT
 +SjLv6hMk08Q8TPZEP/8iRhEBs2QEiT1EY2Pm3VkAP44TwOCc=
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 211.75.18.137
In-Reply-To: <23a6e0dde0144751b936877af5f049ef@TWMBX02.aspeed.com>
References: <tencent_6FC98F43C847A4FA599681BF8ABCC554C006@qq.com>
 <23a6e0dde0144751b936877af5f049ef@TWMBX02.aspeed.com>
X-QQ-STYLE: 
X-QQ-mid: webmail700t1598617195t2371139
From: "=?gb18030?B?xM/SsKXgpeult6WopemltA==?=" <1181052146@qq.com>
To: "=?gb18030?B?UnlhbiBDaGVu?=" <ryan_chen@aspeedtech.com>,
 "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: Re:RE: XDMA engine for AST2400
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5F48F66B_0E9545F0_02C219FD"
Content-Transfer-Encoding: 8Bit
Date: Fri, 28 Aug 2020 20:19:55 +0800
X-Priority: 3
Message-ID: <tencent_A039FC7D80A83F64ADF977C8AB4F859DC40A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 1912961882
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 28 Aug 2020 20:19:56 +0800 (CST)
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

------=_NextPart_5F48F66B_0E9545F0_02C219FD
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGksIFJ5YW4NCg0KDQpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB5b3VyIGhlbHAuIEkgYW0g
YSBiZWdpbm5lciBmb3IgWERNQSBlbmdpbmUsIHlldCBJIGRvIG5vdCBrbm93IGhvdyB0byB1
c2UgaXQoJmd0Oy48KSAuLi4mbmJzcDsNCkkgbGVhcm4gWERNQSBmcm9tIHRoZSBkcml2ZXIo
L2RyaXZlcnMvc29jL2FzcGVlZC9hc3BlZWQteGRtYS5jKSBhbmQgQVNUMjQwMCBkYXRhc2hl
ZXQuDQpBcmUgdGhlcmUgYW55IG90aGVyIGV4YW1wbGVzIG9yIGd1aWRhbmNlcyBmb3IgbW9k
aWZ5aW5nIHRoZSBkcml2ZXIgZm9yIEFTVDI0MDAgWERNQSBlbmdpbmU/DQoNCg0KQmVzdCBS
ZWdhcmRzIQ0KTGl1IEhvbmd3ZWkNCg0KDQoNCg0KLS0tLS0tLS0tLS0tLS0tLS0tJm5ic3A7
T3JpZ2luYWwmbmJzcDstLS0tLS0tLS0tLS0tLS0tLS0NCkZyb206ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIlJ5
YW4gQ2hlbiIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8cnlhbl9jaGVuQGFzcGVl
ZHRlY2guY29tJmd0OzsNCkRhdGU6Jm5ic3A7RnJpLCBBdWcgMjgsIDIwMjAgMTA6NTIgQU0N
ClRvOiZuYnNwOyLEz9KwpeCl66W3pail6aW0IjwxMTgxMDUyMTQ2QHFxLmNvbSZndDs7Im9w
ZW5ibWMiPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZndDs7DQoNClN1YmplY3Q6Jm5ic3A7
UkU6IFhETUEgZW5naW5lIGZvciBBU1QyNDAwDQoNCg0KDQpIZWxsbywgDQoJQVNUMjQwMCBz
dXBwb3J0IHhETUEsIHRoZSBkaWZmZXJlbnQgd2lsbCBiZSBjb21tYW5kIGZvcm1hdC4gSXQg
bmVlZCB0byBtb2RpZnkgZm9yIEFTVDI0MDAuDQoNCkZyb206IG9wZW5ibWMgPG9wZW5ibWMt
Ym91bmNlcytyeWFuX2NoZW49YXNwZWVkdGVjaC5jb21AbGlzdHMub3psYWJzLm9yZyZndDsg
T24gQmVoYWxmIE9mIMTP0rA/Pz8/Pz8NClNlbnQ6IEZyaWRheSwgQXVndXN0IDI4LCAyMDIw
IDEwOjEzIEFNDQpUbzogb3BlbmJtYyA8b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnJmd0Ow0K
U3ViamVjdDogWERNQSBlbmdpbmUgZm9yIEFTVDI0MDANCg0KR3JlZXRpbmdzLA0KDQpJIGFt
IGxlYXJuaW5nIE9wZW5ibWMgd2l0aCBhIEFTVDI0MDAgQk1DLiBJIGFtIGxlYXJuaW5nIFhE
TUEgZW5naW5lLiBJIHNhdyB0aGVyZSBpcyBhIGRyaXZlciBpbiB0aGUgbGludXgga2VybmVs
KC9kcml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLXhkbWEuYykgZm9yIFhETUEgZW5naW5lLiBC
dXQgdGhpcyBkcml2ZXIncyAib2ZfbWF0Y2hfdGFibGUiIG9ubHkgc3VwcG9ydCBBU1QyNTAw
IGFuZCBBU1QyNjAwLg0KRG9lcyBBU1QyNDAwIG5vdCBzdXBwb3J0IFhETUEgZW5naW5lPyBC
dXQgaW4gdGhlIGRhdGFzaGVldCwgdGhlIEFTVDI0MDAgaGFzIGEgWERNQSBlbmdpbmUgYXMg
d2l0aCBBU1QyNTAwLg0KQ2FuIHNvbWUgb25lIGhlbHAgbWU/IFRoYW5rcyENCg0KQmVzdCBS
ZWdhcmRzIQ0KTGl1IEhvbmd3ZWk=

------=_NextPart_5F48F66B_0E9545F0_02C219FD
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj5IaSwgUnlhbjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
VGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgeW91ciBoZWxwLiBJIGFtIGEgYmVnaW5uZXIgZm9y
IFhETUEgZW5naW5lLCB5ZXQgSSBkbyBub3Qga25vdyBob3cgdG8gdXNlIGl0KCZndDsuJmx0
OykgLi4uJm5ic3A7PC9kaXY+PGRpdj5JIGxlYXJuIFhETUEgZnJvbSB0aGUgZHJpdmVyKC9k
cml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLXhkbWEuYykgYW5kIEFTVDI0MDAgZGF0YXNoZWV0
LjwvZGl2PjxkaXY+QXJlIHRoZXJlIGFueSBvdGhlciBleGFtcGxlcyBvciBndWlkYW5jZXMg
Zm9yIG1vZGlmeWluZyB0aGUgZHJpdmVyIGZvciBBU1QyNDAwIFhETUEgZW5naW5lPzwvZGl2
PjxkaXY+PGJyPjwvZGl2PjxkaXY+QmVzdCBSZWdhcmRzITwvZGl2PjxkaXY+TGl1IEhvbmd3
ZWk8L2Rpdj48ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXYgc3R5bGU9
ImZvbnQtc2l6ZTogMTJweDtmb250LWZhbWlseTogQXJpYWwgTmFycm93O3BhZGRpbmc6MnB4
IDAgMnB4IDA7Ij4tLS0tLS0tLS0tLS0tLS0tLS0mbmJzcDtPcmlnaW5hbCZuYnNwOy0tLS0t
LS0tLS0tLS0tLS0tLTwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtc2l6ZTogMTJweDtiYWNrZ3Jv
dW5kOiNlZmVmZWY7cGFkZGluZzo4cHg7Ij48ZGl2PjxiPkZyb206PC9iPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJSeWFuIENoZW4iICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmx0O3J5YW5fY2hl
bkBhc3BlZWR0ZWNoLmNvbSZndDs7PC9kaXY+PGRpdj48Yj5EYXRlOjwvYj4mbmJzcDtGcmks
IEF1ZyAyOCwgMjAyMCAxMDo1MiBBTTwvZGl2PjxkaXY+PGI+VG86PC9iPiZuYnNwOyLEz9Kw
peCl66W3pail6aW0IiZsdDsxMTgxMDUyMTQ2QHFxLmNvbSZndDs7Im9wZW5ibWMiJmx0O29w
ZW5ibWNAbGlzdHMub3psYWJzLm9yZyZndDs7PHdicj48L2Rpdj48ZGl2PjwvZGl2PjxkaXY+
PGI+U3ViamVjdDo8L2I+Jm5ic3A7UkU6IFhETUEgZW5naW5lIGZvciBBU1QyNDAwPC9kaXY+
PC9kaXY+PGRpdj48YnI+PC9kaXY+SGVsbG8sIDxicj4JQVNUMjQwMCBzdXBwb3J0IHhETUEs
IHRoZSBkaWZmZXJlbnQgd2lsbCBiZSBjb21tYW5kIGZvcm1hdC4gSXQgbmVlZCB0byBtb2Rp
ZnkgZm9yIEFTVDI0MDAuPGJyPjxicj5Gcm9tOiBvcGVuYm1jICZsdDtvcGVuYm1jLWJvdW5j
ZXMrcnlhbl9jaGVuPWFzcGVlZHRlY2guY29tQGxpc3RzLm96bGFicy5vcmcmZ3Q7IE9uIEJl
aGFsZiBPZiDEz9KwPz8/Pz8/PGJyPlNlbnQ6IEZyaWRheSwgQXVndXN0IDI4LCAyMDIwIDEw
OjEzIEFNPGJyPlRvOiBvcGVuYm1jICZsdDtvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcmZ3Q7
PGJyPlN1YmplY3Q6IFhETUEgZW5naW5lIGZvciBBU1QyNDAwPGJyPjxicj5HcmVldGluZ3Ms
PGJyPjxicj5JIGFtIGxlYXJuaW5nIE9wZW5ibWMgd2l0aCBhIEFTVDI0MDAgQk1DLiBJIGFt
IGxlYXJuaW5nIFhETUEgZW5naW5lLiBJIHNhdyB0aGVyZSBpcyBhIGRyaXZlciBpbiB0aGUg
bGludXgga2VybmVsKC9kcml2ZXJzL3NvYy9hc3BlZWQvYXNwZWVkLXhkbWEuYykgZm9yIFhE
TUEgZW5naW5lLiBCdXQgdGhpcyBkcml2ZXIncyAib2ZfbWF0Y2hfdGFibGUiIG9ubHkgc3Vw
cG9ydCBBU1QyNTAwIGFuZCBBU1QyNjAwLjxicj5Eb2VzIEFTVDI0MDAgbm90IHN1cHBvcnQg
WERNQSBlbmdpbmU/IEJ1dCBpbiB0aGUgZGF0YXNoZWV0LCB0aGUgQVNUMjQwMCBoYXMgYSBY
RE1BIGVuZ2luZSBhcyB3aXRoIEFTVDI1MDAuPGJyPkNhbiBzb21lIG9uZSBoZWxwIG1lPyBU
aGFua3MhPGJyPjxicj5CZXN0IFJlZ2FyZHMhPGJyPkxpdSBIb25nd2VpPGJyPjxicj48L2Rp
dj4=

------=_NextPart_5F48F66B_0E9545F0_02C219FD--



