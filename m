Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 115A62D7979
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 16:35:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Csvwz2TY7zDqJs
	for <lists+openbmc@lfdr.de>; Sat, 12 Dec 2020 02:34:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=2a02:6b8:0:1619::183;
 helo=forwardcorp1j.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=yandex-team.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=VzkAow1D; 
 dkim-atps=neutral
Received: from forwardcorp1j.mail.yandex.net (forwardcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::183])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Csvvl5t1LzDqfb
 for <openbmc@lists.ozlabs.org>; Sat, 12 Dec 2020 02:33:55 +1100 (AEDT)
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 0F03B2E14F9;
 Fri, 11 Dec 2020 18:29:44 +0300 (MSK)
Received: from localhost (localhost [::1])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 GFCCD7Oz2A-Thw4FkAg; Fri, 11 Dec 2020 18:29:43 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1607700583; bh=Bk/Ts0/YmkJytLnvDjiRvyhd3AtKZMLdYGsdbq/tJmE=;
 h=Subject:In-Reply-To:Date:References:To:From:Message-Id;
 b=VzkAow1DZoT6g2F1h7zwmMDb57JlqadBz4PZmMNwNb4UiHkPly5n6Ka1tJ2QXSRJy
 FDgDxWTrfPSfB+izZuKOtgCQ9F01hz45rdRhi+d2EdVjKR1uxMnRYH1qKwrXI2dOB2
 BiINobfnyVBNoEP/mOxPPeY0413B/Lb4IOxk5XLc=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net [2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by sas2-3467662b745a.qloud-c.yandex.net with LMTP id foClEViXHL-3uIqYcza
 for <kitsok@yandex-team.ru>; Fri, 11 Dec 2020 18:29:33 +0300
Received: by vla5-c30c59847b9e.qloud-c.yandex.net with HTTP;
 Fri, 11 Dec 2020 18:29:33 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: Patrick Voelker <patrick_voelker@phoenix.com>,
 Andrei Kartashev <a.kartashev@yadro.com>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
In-Reply-To: <d75be44a237e4de6ac94f6d84fc3935e@SCL-EXCHMB-13.phoenix.com>
References: <f659f8a48f24404fbc5dda747000865d@SCL-EXCHMB-13.phoenix.com>
 <6cc50da92b76ff7fbda5f43651bb32f6ff7b0c9e.camel@yadro.com>
 <eaec79dfa2bc4d65acd2fdb8c93b02f9@SCL-EXCHMB-13.phoenix.com>
 <e9389df6-f4f5-4594-a803-b3b7598fb21e@www.fastmail.com>
 <d75be44a237e4de6ac94f6d84fc3935e@SCL-EXCHMB-13.phoenix.com>
Subject: Re: Unresponsive BMC after booting into Ubuntu
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 11 Dec 2020 18:29:43 +0300
Message-Id: <127841607700054@mail.yandex-team.ru>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PGRpdj5QYXRyaWNrLDwvZGl2PjxkaXY+SSBhbHNvIGZhY2VkIEJNQyBoYW5nIGJ1dCBpbiBteSBj
YXNlIGl0IHdhc24ndCByZWxhdGVkIHRvIE9TIG9uIGhvc3QuPC9kaXY+PGRpdj5JJ3ZlIGFscmVh
ZHkgZm91bmQ6PC9kaXY+PGRpdj4xLiBEZWFkIGN5Y2xlIGluIHBob3NwaG9yLW5ldHdvcmtkICg8
YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1uZXR3b3JrZC9pc3N1
ZXMvMzYpIj5odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1uZXR3b3JrZC9pc3N1
ZXMvMzYpPC9hPjwvZGl2PjxkaXY+Mi4gTFBDIElSUSBzdG9ybSBjYXVzZWQgYnkgYnVnIGluIEJJ
T1MgKGRpc2NvdmVyZWQgYnkgwqB3YXRjaCAtbiAxICJjYXQgL3Byb2MvaW50ZXJydXB0cyIgd2l0
aCBmb2xsb3dpbmcgaG9zdCBwb3dlciB1cCkuIFRoaXMgY2FzZSBpcyBzaW1pbGFyIHRvIHlvdXJz
IGFzIHdob2xlIEJNQyBiZWNvbWVzIHVucmVzcG9uc2l2ZTwvZGl2PjxkaXY+My4gVGhlIG9uZSBJ
IHN0aWxsIGZpZ2h0aW5nIHdpdGg6IGRidXMtYnJva2VyIGlzIHN0YXJ0aW5nIHRvIGNvbnN1bWUg
Q1BVIGFuZCB0aGUgbm9ybWFsIHNlcXVlbmNlIG9mIHN5c3RlbWQgdW5pdHMgc3RhcnQganVzdCBz
dG9wcywgc3lzdGVtY3RsIC1hIGRvZXNuJ3Qgd29yaywgZXRjLiBUaGUgY3VyZSBpcyB0byBraWxs
IGRidXMtYnJva2VyLCBhZnRlciB0aGF0IGFsbCBzZXJ2aWNlcyBhcmUgcmVzdGFydGVkIGFuZCBC
TUMgd29ya3MgcHJvcGVybHkuPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+SW4gdGhlb3J5IGhvc3Qg
Y2FuIHdyaXRlIHRvIEFTVDI1MDAgcmVnaXN0ZXJzIHZpYSBQMkEsIHRyeSBkaXNhYmxpbmcgaXQu
PC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+MTEuMTIuMjAyMCwgMDQ6MTUsICJQYXRyaWNrIFZvZWxr
ZXIiICZsdDtwYXRyaWNrX3ZvZWxrZXJAcGhvZW5peC5jb20mZ3Q7OjwvZGl2PjxibG9ja3F1b3Rl
PjxwPkkgZ2F2ZSBkaXNhYmxpbmcgdGhlIGNwdXNlbnNvciBzZXJ2aWNlIGEgdHJ5IGFuZCBpdCBk
aWRuJ3QgbWFrZSBhIGRpZmZlcmVuY2UuIFRoZSBCTUMgc3RpbGwgZ29lcyBvdXQgdG8gbHVuY2gu
IFRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uPGJyIC8+PGJyIC8+SSB0cmllZCBkaXNhYmxpbmcg
YWxsIHRoZSBJUE1JIGhhbmRsZXJzIGJ1dCB0aGF0IGRpZG4ndCBzZWVtIHRvIGhlbHAgZWl0aGVy
OjxiciAvPnN5c3RlbWN0bCBzdG9wIDxhIGhyZWY9Im1haWx0bzpwaG9zcGhvci1pcG1pLWtjc0Bp
cG1pX2tjczMiIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciI+cGhvc3Bob3ItaXBtaS1rY3NAaXBt
aV9rY3MzPC9hPjxiciAvPnN5c3RlbWN0bCBzdG9wIDxhIGhyZWY9Im1haWx0bzpwaG9zcGhvci1p
cG1pLWtjc0BpcG1pX2tjczQiIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciI+cGhvc3Bob3ItaXBt
aS1rY3NAaXBtaV9rY3M0PC9hPjxiciAvPnN5c3RlbWN0bCBzdG9wIDxhIGhyZWY9Im1haWx0bzpw
aG9zcGhvci1pcG1pLW5ldEBldGgwLnNvY2tldCIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj5w
aG9zcGhvci1pcG1pLW5ldEBldGgwLnNvY2tldDwvYT48YnIgLz5zeXN0ZW1jdGwgc3RvcCA8YSBo
cmVmPSJtYWlsdG86cGhvc3Bob3ItaXBtaS1uZXRAZXRoMS5zb2NrZXQiIHJlbD0ibm9vcGVuZXIg
bm9yZWZlcnJlciI+cGhvc3Bob3ItaXBtaS1uZXRAZXRoMS5zb2NrZXQ8L2E+PGJyIC8+c3lzdGVt
Y3RsIHN0b3AgcGhvc3Bob3ItaXBtaS1ob3N0PGJyIC8+PGJyIC8+SSB0aGluayBteSBuZXh0IHN0
ZXAgd2lsbCBiZSB0byB0cnkgZGlzYWJsaW5nIGtlcm5lbCBjb25maWcgb3B0aW9ucyB0aGF0IGFy
ZSByZWxhdGVkIHRvIHRoaW5ncyB0aGF0IGNhbiBiZSBpbmZsdWVuY2VkIGJ5IHRoZSBob3N0Ljxi
ciAvPsKgPC9wPjxibG9ja3F1b3RlPsKgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnIgLz7C
oEZyb206IG9wZW5ibWMgWzxhIGhyZWY9Im1haWx0bzpvcGVuYm1jIiByZWw9Im5vb3BlbmVyIG5v
cmVmZXJyZXIiPm1haWx0bzpvcGVuYm1jPC9hPi08YnIgLz7CoDxhIGhyZWY9Im1haWx0bzpib3Vu
Y2VzK3BhdHJpY2tfdm9lbGtlcj1waG9lbml4LmNvbUBsaXN0cy5vemxhYnMub3JnIiByZWw9Im5v
b3BlbmVyIG5vcmVmZXJyZXIiPmJvdW5jZXMrcGF0cmlja192b2Vsa2VyPXBob2VuaXguY29tQGxp
c3RzLm96bGFicy5vcmc8L2E+XSBPbiBCZWhhbGYgT2Y8YnIgLz7CoEFuZHJldyBKZWZmZXJ5PGJy
IC8+wqBTZW50OiBNb25kYXksIE5vdmVtYmVyIDMwLCAyMDIwIDQ6NDcgUE08YnIgLz7CoFRvOiA8
YSBocmVmPSJtYWlsdG86b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnIiByZWw9Im5vb3BlbmVyIG5v
cmVmZXJyZXIiPm9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzwvYT48YnIgLz7CoFN1YmplY3Q6IFJl
OiBVbnJlc3BvbnNpdmUgQk1DIGFmdGVyIGJvb3RpbmcgaW50byBVYnVudHU8YnIgLz7CoDxiciAv
PsKgPGJyIC8+wqA8YnIgLz7CoE9uIFR1ZSwgMjQgTm92IDIwMjAsIGF0IDE4OjA1LCBQYXRyaWNr
IFZvZWxrZXIgd3JvdGU6PGJyIC8+wqAmZ3Q7IEhtLiBTb3VuZHMgbGlrZSBhIGRpZmZlcmVudCBp
c3N1ZS4gSSBkb24ndCB0aGluayB0aGlzIHNvbHV0aW9uIHdpbGw8YnIgLz7CoCZndDsgaGVscCBt
ZSBzaW5jZSBJIGNhbid0IGFjY2VzcyB0aGUgc2VyaWFsIGNvbnNvbGUuPGJyIC8+wqA8YnIgLz7C
oEknbSBub3QgQW5kcmVpLCBidXQgbXkgdW5kZXJzdGFuZGluZyB3YXMgdGhhdCBoZSB3YXNuJ3Qg
c3VnZ2VzdGluZyB5b3UgdHJ5PGJyIC8+wqB0bzxiciAvPsKgYXBwbHkgdGhlIGNoYW5nZSBhZnRl
ciB0aGUgbG9ja3VwIG9jY3VycmVkLCBidXQgcmF0aGVyIGJlZm9yZS4gQW5kIHRoZW4gaWY8YnIg
Lz7CoHlvdTxiciAvPsKgZG9uJ3Qgc2VlIGxvY2t1cHMgd2l0aCB0aGUgY2hhbmdlIGFwcGxpZWQs
IHRoZW4gaXQgbWlnaHQgYmUgdGhlIHNhbWU8YnIgLz7CoHByb2JsZW0uPGJyIC8+wqBJdCB3YXNu
J3QgYWJvdXQgcmVjb3ZlcmluZyB0aGUgQk1DIGZyb20gdGhlIGxvY2t1cCBjb250ZXh0LjxiciAv
PsKgPGJyIC8+wqBCdXQgeWVhaCwgaG9wZWZ1bGx5IEknbSBub3QgYWRkaW5nIHRvIHRoZSBjb25m
dXNpb24gaGVyZSE8YnIgLz7CoDxiciAvPsKgQW5kcmV3PC9ibG9ja3F1b3RlPjwvYmxvY2txdW90
ZT48ZGl2PsKgPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+LS3CoDwvZGl2PjxkaXY+QmVzdCByZWdh
cmRzLDwvZGl2PjxkaXY+S29uc3RhbnRpbiBLbHVibmljaGtpbiw8L2Rpdj48ZGl2PmxlYWQgZmly
bXdhcmUgZW5naW5lZXIsPC9kaXY+PGRpdj5zZXJ2ZXIgaGFyZHdhcmUgUiZhbXA7RCBncm91cCw8
L2Rpdj48ZGl2PllhbmRleCBNb3Njb3cgb2ZmaWNlLjwvZGl2PjxkaXY+dGVsOiArNy05MDMtNTEw
LTMzLTMzPC9kaXY+PGRpdj7CoDwvZGl2Pg==
