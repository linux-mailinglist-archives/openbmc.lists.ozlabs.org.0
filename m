Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17793307343
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 10:58:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRGBg1m15zDrfX
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 20:58:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=77.88.29.217;
 helo=forwardcorp1p.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=DnJOlLBb; 
 dkim-atps=neutral
X-Greylist: delayed 79 seconds by postgrey-1.36 at bilbo;
 Thu, 28 Jan 2021 20:57:49 AEDT
Received: from forwardcorp1p.mail.yandex.net (forwardcorp1p.mail.yandex.net
 [77.88.29.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRG9n0NJFzDrVX
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 20:57:48 +1100 (AEDT)
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id C6D822E17E4;
 Thu, 28 Jan 2021 12:56:07 +0300 (MSK)
Received: from localhost (localhost [::1])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 64tUveYDqg-u7w04HDZ; Thu, 28 Jan 2021 12:56:07 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1611827767; bh=WCmrX9Pijun3h247ths1l7AkaSxAhPGRFCR6NLfdP4w=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=DnJOlLBbZTNb8o2dNN1/aUDcPtuf/O2JUIwpx/V+5PmtPCjsFXDI2CDKZPzKpzGKQ
 1xb3+7KWdYZq+c5H/6ztwCxUgLqVcO7GS9ZhB51wDZjrBSDu+YICbdQAzJoxRqi2FB
 2BnPRYujFL+5e4shsKzYBm+W4+AgAal8R+ueESsM=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from iva8-d077482f1536.qloud-c.yandex.net
 (iva8-d077482f1536.qloud-c.yandex.net [2a02:6b8:c0c:2f26:0:640:d077:482f])
 by iva8-00026c0e2ab1.qloud-c.yandex.net with LMTP id UTU6EZBOjV-moYcUXtx
 for <kitsok@yandex-team.ru>; Thu, 28 Jan 2021 12:55:57 +0300
Received: by iva4-6d0ca09d92db.qloud-c.yandex.net with HTTP;
 Thu, 28 Jan 2021 12:55:56 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: Ed Tanous <edtanous@google.com>,
 =?utf-8?B?U2Nyb24gQ2hhbmcgKOW8teS7suW7tik=?= <scron.chang@quantatw.com>
In-Reply-To: <CAH2-KxA20CfM9upvUkB=jhapVNF4AdVROA4wafFxxYftmvwO=w@mail.gmail.com>
References: <TYZPR04MB441643EFC954C795DD1290A886BB0@TYZPR04MB4416.apcprd04.prod.outlook.com>
 <CAH2-KxA20CfM9upvUkB=jhapVNF4AdVROA4wafFxxYftmvwO=w@mail.gmail.com>
Subject: Re: [entity-manager] Issue about entity-manager getting stuck
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 28 Jan 2021 12:56:07 +0300
Message-Id: <31441611827264@mail.yandex-team.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
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

PGRpdj5IZWxsbywgRWQhPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+SSdtIG5vdCBzdXJlIGlmIG15
IGlzc3VlIGlzIHJlbGV2YW50IHRvIHdoYXQgU2Nyb24gZGlzY292ZXJlZCwgYnV0IGl0IG1heSBi
ZS48L2Rpdj48ZGl2PlNvbWV0aW1lcyAobm90IGV2ZXJ5IEJNQyByZWJvb3QpIGRidXMgZ2V0IHN0
dWNrIGR1cmluZyBzdGFydHVwLjwvZGl2PjxkaXY+c3lzdGVtY3RsIG9yIGRidXMgZG9uJ3Qgd29y
ayAoZmFpbCBieSB0aW1lb3V0KSwgc2VydmljZXMgc3R1Y2sgdHJ5aW5nIHRvIHN0YXJ0LCBkYnVz
LWJyb2tlciBjb25zdW1lcyBhIGxvdCBvZiBDUFUgYW5kIGRidXMgbW9uaXRvciBzaG93cyBzdG9y
bSBvZiAiUHJvcGVydHkgQ2hhbmdlZCIgZXZlbnRzIGZyb20gYW5vbnltb3VzIGFwcGxpY2F0aW9u
LjwvZGl2PjxkaXY+VGhlIHdvcmsgYXJvdW5kIEkndmUgZm91bmQgaXMgdG8ga2lsbCBkYnVzLWJy
b2tlciBhbmQgZGJ1cy1icm9rZXItbGF1bmNoLCB0aGVuIEkgY2FuIGF0IGxlYXN0IGlzc3VlICJy
ZWJvb3QiIHdpdGhvdXQgIi1mIiwgdXN1YWxseSAoOCB0aW1lcyBvdXQgb2YgMTApIEJNQyBzdGFy
dHMgbm9ybWFsbHkgbmV4dCB0aW1lLjwvZGl2PjxkaXY+VW5mb3J0dW5hdGVseSBJIGRvbid0IGtu
b3cgaG93IHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUgZm9yIHN1cmUuIEl0IGhhcHBlbnMgbW9yZSBv
ZnRlbiDCoHdoZW4gQk1DIGhhcyBubyBuZXR3b3JrIGFuZCBkb2Vzbid0IGhhdmUgdGltZSBzb3Vy
Y2UgbGlrZSBOVFAgb3IgZGF0ZS90aW1lIHNhdmVkIGluIFJUQy48L2Rpdj48ZGl2PlNvIEkgc3Vz
cGVjdCBjYWxsaW5nIGJ1c2N0bCBpbiBhIGN5Y2xlIGlzIG5vdCB0aGUgb25seSB3YXkgdG8gZ2V0
IHN5c3RlbSBzdHVjay48L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5UaGFuayB5b3UhPC9kaXY+PGRp
dj7CoDwvZGl2PjxkaXY+MjcuMDEuMjAyMSwgMjA6MDgsICJFZCBUYW5vdXMiICZsdDtlZHRhbm91
c0Bnb29nbGUuY29tJmd0Ozo8L2Rpdj48YmxvY2txdW90ZT48cD5PbiBUdWUsIEphbiAyNiwgMjAy
MSBhdCAxMDozNCBQTSBTY3JvbiBDaGFuZyAo5by15Luy5bu2KTxiciAvPiZsdDs8YSBocmVmPSJt
YWlsdG86U2Nyb24uQ2hhbmdAcXVhbnRhdHcuY29tIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIi
PlNjcm9uLkNoYW5nQHF1YW50YXR3LmNvbTwvYT4mZ3Q7IHdyb3RlOjwvcD48YmxvY2txdW90ZT48
YnIgLz7CoEhpIGFsbCw8YnIgLz48YnIgLz7CoEkgYW0gdXNpbmcgb3BlbmJtYy9lbnRpdHktbWFu
YWdlciBpbiB0aGlzIHZlcnNpb246ICJmMDk0MTI1Y2QzYmRiYzg3MzdkYzgwMzVhNmU5YWMyNTJm
NmU4ODQwIiBhbmQgSSBmb3VuZCBjYWxsaW5nIERidXMgbWFrZXMgZW50aXR5LW1hbmFnZXIgZ2V0
IHN0dWNrLjxiciAvPjxiciAvPsKgUmVwcm9kdWNlIHRoaXMgYnkgZm9sbG93aW5nIHN0ZXBzOjxi
ciAvPsKgMS4gc3lzdGVtY3RsIHN0b3AgeHl6Lm9wZW5ibWNfcHJvamVjdC5FbnRpdHlNYW5hZ2Vy
PGJyIC8+wqAyLiBvcGVuIGFub3RoZXIgdGVybWluYWwgYW5kIGRvIHRoaXMgd2hpbGUtbG9vcDog
IndoaWxlIHRydWU7IGRvIGJ1c2N0bCA7IHNsZWVwIDE7IGRvbmUiPGJyIC8+wqAzLiBzeXN0ZW1j
dGwgc3RhcnQgeHl6Lm9wZW5ibWNfcHJvamVjdC5FbnRpdHlNYW5hZ2VyPGJyIC8+wqBJIHRoaW5r
IHRoZSByb290IGNhdXNlIGlzIHRoaXMgZnVuY3Rpb246ICJuYW1lT3duZXJDaGFuZ2VkTWF0Y2gu
IiAoUGxlYXNlIHJlZmVyIHRvIHRoaXMgbGluZTogPGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29t
L29wZW5ibWMvZW50aXR5LW1hbmFnZXIvYmxvYi9mMDk0MTI1Y2QzYmRiYzg3MzdkYzgwMzVhNmU5
YWMyNTJmNmU4ODQwL3NyYy9FbnRpdHlNYW5hZ2VyLmNwcCNMMTg1OSIgcmVsPSJub29wZW5lciBu
b3JlZmVycmVyIj5odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9lbnRpdHktbWFuYWdlci9ibG9i
L2YwOTQxMjVjZDNiZGJjODczN2RjODAzNWE2ZTlhYzI1MmY2ZTg4NDAvc3JjL0VudGl0eU1hbmFn
ZXIuY3BwI0wxODU5PC9hPi4pPC9ibG9ja3F1b3RlPjxwPjxiciAvPk15IGZpcnN0IHRob3VnaHQg
aXM6IERvbid0IHJ1biBhbiBlbXB0eSBidXNjdGwgaW4gYSBsb29wIHRoZW4sIGJ1dCBJJ208YnIg
Lz5ndWVzc2luZyB0aGF0J3Mgbm90IHdoYXQgeW91J3JlIHJlYWxseSB0cnlpbmcgdG8gZG8uIElm
IHdlIGhhZCBtb3JlPGJyIC8+aWRlYXMgYWJvdXQgd2hhdCB5b3Ugd2VyZSByZWFsbHkgaG9waW5n
IHRvIGFjY29tcGxpc2gsIHdlIG1pZ2h0IGhhdmU8YnIgLz5zb21lIGJldHRlciBhZHZpY2UgZm9y
IGhvdyB0byBwcm9jZWVkLjxiciAvPjxiciAvPlRoZSBpbnRlbnQgb2YgdGhhdCBjb2RlIGlzIHRv
IHJlY29uZmlndXJlIGVudGl0eS1tYW5hZ2VyIHdoZW48YnIgLz5pbnRlcmZhY2VzIGFyZSBjaGFu
Z2VkLCBzbyBpZiB5b3UncmUgY29uc3RhbnRseSBhdHRhY2hpbmcgYW5kPGJyIC8+ZGV0YWNoaW5n
IHRvIGRidXMsIGVudGl0eS1tYW5hZ2VyIChhbmQgb2JqZWN0IG1hbmFnZXIpIG5ldmVyIHNlZXMg
dGhlPGJyIC8+c3lzdGVtIGFzICJ1cCIgYW5kIGtlZXBzIHdhaXRpbmcgZm9yIHRoZSBzeXN0ZW0g
dG8gZmluaXNoIHN0YWJpbGl6aW5nPGJyIC8+YmVmb3JlIGl0IHJ1bnMgdGhlIGNvbmZpZyBsb2dp
Yy48YnIgLz48YnIgLz5JbiB5b3VyIHNwZWNpZmljIGNhc2UgYWJvdmUsIHRoZSBjb2RlIGNvdWxk
IGJlIGEgbGl0dGxlIHNtYXJ0ZXIsIGFuZDxiciAvPmlnbm9yZSB1bmlxdWUgbmFtZXMgaW4gdGhh
dCBjaGVjaywgb25seSBjYXJpbmcgYWJvdXQgbmV3bHktZGVmaW5lZDxiciAvPndlbGwga25vd24g
bmFtZXMsIGJ1dCB3aXRob3V0IGtub3dpbmcgeW91ciByZWFsIHVzZSBjYXNlLCBpdCdzIGhhcmQg
dG88YnIgLz5rbm93IGlmIHRoYXQgd291bGQgaGVscC48YnIgLz7CoDwvcD48YmxvY2txdW90ZT48
YnIgLz7CoE1hbnVhbGx5IGNhbGxpbmcgRGJ1cyBvciBjYWxsaW5nIERidXMgaW4gYSBzY3JpcHQg
bWFrZXMgTmFtZU93bmVyQ2hhbmdlZCBzaWduYWwgYW5kIHRodXMgdHJpZ2dlcnMgdGhlIGZ1bmN0
aW9uOiAicHJvcGVydGllc0NoYW5nZWRDYWxsYmFjayIgcmVwZWF0ZWRseS4gTWVhbndoaWxlLCB0
aGUgYXN5bmNfd2FpdCBpbiBwcm9wZXJ0aWVzQ2hhbmdlZENhbGxiYWNrIGdldHMgcmV0dXJuZWQg
YmVjYXVzZSBvZiB0aGUgb3BlcmF0aW9uX2Fib3J0ZWQuPC9ibG9ja3F1b3RlPjxwPjxiciAvPlBl
cnNvbmFsIG9waW5pb246IERvbid0IGNhbGwgYnVzY3RsIGNvbnRpbnVvdXNseSBpbiBhIHNjcmlw
dC4gSXQnczxiciAvPmluZWZmaWNpZW50LCBhbmQgY2F1c2VzIHByb2JsZW1zIGxpa2UgdGhpcy48
YnIgLz7CoDwvcD48YmxvY2txdW90ZT7CoFNvIGhlcmUgaXMgdGhlIGNvbmNsdXNpb246PGJyIC8+
wqBNYW51YWxseSBjYWxsaW5nIERidXMgaW4gYSBwZXJpb2QgdGhhdCBpcyBsZXNzIHRoYW4gNSBz
ZWNvbmRzIGxlYWRzIGVudGl0eS1tYW5hZ2VyIGtlZXBpbmcgdG8gdHJpZ2dlciBuZXcgYXN5bmNf
d2FpdCBhbmQgYWJvcnQgdGhlIG9sZCBvbmUuIEhvd2V2ZXIsIHRoZSBhc3luY193YWl0IG5ldmVy
IGdldHMgZG9uZS48YnIgLz48YnIgLz7CoElzIHRoaXMgYSBidWcgb2YgZW50aXR5LW1hbmFnZXIs
IG9yIEkgZ2V0IHNvbWV0aGluZyB3cm9uZy4gUGxlYXNlIGhlbHAgbWUgd2l0aCB0aGlzLjwvYmxv
Y2txdW90ZT48cD48YnIgLz5JTU8sIGVudGl0eS1tYW5hZ2VyIGlzIHdvcmtpbmcgYXMgaW50ZW5k
ZWQsIGJ1dCBsZXRzIHRyeSB0byBmaWd1cmUgb3V0PGJyIC8+d2hhdCB5b3UncmUgcmVhbGx5IHRy
eWluZyB0byBkbywgYW5kIHNlZSBpZiB3ZSBjYW4gZmluZCB5b3UgYTxiciAvPnNvbHV0aW9uLjxi
ciAvPsKgPC9wPjxibG9ja3F1b3RlPjxiciAvPsKgU2Nyb24gQ2hhbmc8YnIgLz7CoEUtTWFpbCA8
YSBocmVmPSJtYWlsdG86U2Nyb24uQ2hhbmdAcXVhbnRhdHcuY29tIiByZWw9Im5vb3BlbmVyIG5v
cmVmZXJyZXIiPlNjcm9uLkNoYW5nQHF1YW50YXR3LmNvbTwvYT48YnIgLz7CoDwvYmxvY2txdW90
ZT48L2Jsb2NrcXVvdGU+PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2Pi0twqA8L2Rpdj48
ZGl2PkJlc3QgcmVnYXJkcyw8L2Rpdj48ZGl2PktvbnN0YW50aW4gS2x1Ym5pY2hraW4sPC9kaXY+
PGRpdj5sZWFkIGZpcm13YXJlIGVuZ2luZWVyLDwvZGl2PjxkaXY+c2VydmVyIGhhcmR3YXJlIFIm
YW1wO0QgZ3JvdXAsPC9kaXY+PGRpdj5ZYW5kZXggTW9zY293IG9mZmljZS48L2Rpdj48ZGl2PnRl
bDogKzctOTAzLTUxMC0zMy0zMzwvZGl2PjxkaXY+wqA8L2Rpdj4=
