Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A1539A0F4
	for <lists+openbmc@lfdr.de>; Thu,  3 Jun 2021 14:31:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fwlcn5McBz2ymS
	for <lists+openbmc@lfdr.de>; Thu,  3 Jun 2021 22:31:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=DVK1a9Sw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=95.108.205.193;
 helo=forwardcorp1o.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=DVK1a9Sw; 
 dkim-atps=neutral
X-Greylist: delayed 82 seconds by postgrey-1.36 at boromir;
 Thu, 03 Jun 2021 22:31:03 AEST
Received: from forwardcorp1o.mail.yandex.net (forwardcorp1o.mail.yandex.net
 [95.108.205.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwlcR2jTnz2yYG
 for <openbmc@lists.ozlabs.org>; Thu,  3 Jun 2021 22:31:03 +1000 (AEST)
Received: from sas1-ec30c78b6c5b.qloud-c.yandex.net
 (sas1-ec30c78b6c5b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2704:0:640:ec30:c78b])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 82ED62E1D4F;
 Thu,  3 Jun 2021 15:29:30 +0300 (MSK)
Received: from mail.yandex-team.ru (mail.yandex-team.ru
 [2a02:6b8:0:506:4d7:55e9:8081:b993])
 by sas1-ec30c78b6c5b.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 PTFo3801FeA1-TU14P9lJ; Thu, 03 Jun 2021 15:29:30 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1622723370; bh=Zfnc00xlYVkAQRnLggYkvZ32HsI9Q0NJELyTbo1LxNg=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=DVK1a9SwFHcUbazoBPMEYj+2I4y2DnHzQF71tQdCMiIvUvRRqyxfZKrSq3y1d2jp4
 NOJ5g7PQSA+T2C5xFptoiGJ73HUFzoEiITx0/y9mvwiuDJMpkbeggTpreF0uFZTaM9
 o/ndv1K4xXpCIGcE50tDgU3RI4Bf3Ii1UCSigW70=
Authentication-Results: sas1-ec30c78b6c5b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from sas1-b43cfc766761.qloud-c.yandex.net
 (sas1-b43cfc766761.qloud-c.yandex.net [2a02:6b8:c14:2801:0:640:b43c:fc76])
 by sas1-6b1512233ef6.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 CTFZs601siE1-CZlSzQgm
 for <kitsok@yandex-team.ru>; Thu, 03 Jun 2021 15:29:20 +0300
Received: by sas1-b43cfc766761.qloud-c.yandex.net with HTTP;
 Thu, 03 Jun 2021 15:29:20 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: Joseph Reynolds <jrey@linux.ibm.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Milton Miller II <miltonm@us.ibm.com>
In-Reply-To: <4f9a94a5-bafb-aec8-f229-95a2fdf480c2@linux.ibm.com>
References: <1330863731.17653022.1619203617920.JavaMail.zimbra@raptorengineeringinc.com>
 <OF190C6605.611B68EF-ON002586C0.006D8E05-002586C3.00773A1B@notes.na.collabserv.com>
 <405234093.18656550.1619641318362.JavaMail.zimbra@raptorengineeringinc.com>
 <4f9a94a5-bafb-aec8-f229-95a2fdf480c2@linux.ibm.com>
Subject: Re: OpenBMC on RCS platforms - remote media
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 03 Jun 2021 15:29:30 +0300
Message-Id: <184631622722606@mail.yandex-team.ru>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PGRpdj5IZWxsbyBhbGwhPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+PGRpdj4yOS4wNC4yMDIxLCAw
MDoyNSwgIkpvc2VwaCBSZXlub2xkcyIgJmx0O2pyZXlAbGludXguaWJtLmNvbSZndDs6PC9kaXY+
PGJsb2NrcXVvdGU+PHA+SXMgdGhlcmUgYW4gaW1wbGVtZW50YXRpb24/wqAgSSBkaWRuJ3QgZmlu
ZCBvbmUgbGlzdGVkIGhlcmU6PGJyIC8+PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL29wZW5i
bWMvZG9jcy9ibG9iL21hc3Rlci9mZWF0dXJlcy5tZCIgcmVsPSJub29wZW5lciBub3JlZmVycmVy
Ij5odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL2Jsb2IvbWFzdGVyL2ZlYXR1cmVzLm1k
PC9hPjxiciAvPjxiciAvPi0gSm9zZXBoPC9wPjwvYmxvY2txdW90ZT48L2Rpdj48ZGl2PsKgPC9k
aXY+PGRpdj5BY3R1YWxseSB0aGVyZSBpcyBhbiBpbXBsZW1lbnRhdGlvbiBidXQgaXQncyBub3Qg
dXBzdHJlYW1lZC4gSXQncyBsb2NhdGVkIGhlcmU6PC9kaXY+PGRpdj48ZGl2PjxhIGhyZWY9Imh0
dHBzOi8vZ2l0aHViLmNvbS9JbnRlbC1CTUMvcHJvdmluZ2dyb3VuZC90cmVlL21hc3Rlci92aXJ0
dWFsLW1lZGlhIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRw
czovL2dpdGh1Yi5jb20vSW50ZWwtQk1DL3Byb3Zpbmdncm91bmQvdHJlZS9tYXN0ZXIvdmlydHVh
bC1tZWRpYTwvYT48L2Rpdj48ZGl2PldlIHVzZSBpdC48L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5J
biBGZWJydWFyeSBSZWRGaXNoIEFQSSBoYW5kbGUgd2FzIGRpc2FibGVkIGluIGJtY3dlYiBieSB0
aGlzIGNvbW1pdDo8L2Rpdj48ZGl2PjxkaXY+PGRpdj48ZGl2PmNvbW1pdCBlZmI4MDYyYzMwNjQ3
NDk0MmJjOTRmMTVkNzQ4YjJlYjBiNThmYmI2PC9kaXY+PGRpdj5BdXRob3I6IEVkIFRhbm91cyAm
bHQ7ZWRAdGFub3VzLm5ldCZndDs8L2Rpdj48ZGl2PkRhdGU6IMKgIFNhdCBGZWIgMjAgMTE6MDQ6
MDEgMjAyMSAtMDgwMDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PsKgIMKgIERpc2FibGUgbmJkIHBy
b3h5IGZyb20gdGhlIGJ1aWxkPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+QXMgZmFyIGFzIEkgdW5k
ZXJzdGFuZCwgYWZ0ZXIgdGhhdCBBc3luY1Jlc3AgY29tbWl0IGRpZG4ndCB0YWtlIGludG8gYWNj
b3VudCBuYmQtcHJveHkgY29kZSAoYXMgaXQgd2FzIGRpc2FibGVkIGluIG1lc29uLmJ1aWxkIGFu
ZCBkaWRuJ3QgZ2VuZXJhdGUgZXJyb3IgZHVyaW5nIGNvbXBpbGF0aW9uIHRlc3RzKTo8L2Rpdj48
ZGl2PjxkaXY+PGRpdj48ZGl2PkF1dGhvcjogemhhbmdoY2gwNSAmbHQ7emhhbmdoY2gwNUBpbnNw
dXIuY29tJmd0OzwvZGl2PjxkaXY+RGF0ZTogwqAgVGh1IEFwciAxIDExOjE4OjI0IDIwMjEgKzA4
MDA8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj7CoCDCoCBVc2luZyBBc3luY1Jlc3AgZXZlcnl3aGVy
ZTwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PlNvIG5vdyBuYmQtcHJveHkgY29kZSBpbiBibWN3ZWIg
aXMgKDEpZGlzYWJsZWQsICgyKWRvZXNuJ3QgY29tcGlsZSBkdWUgdG8gc21hbGwgZXJyb3I6PC9k
aXY+PGRpdj48ZGl2Pi0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBhc3luY1Jlc3AtJmd0O3JlcywgaW1hZ2VVcmwsIGluc2VydGVkLDwvZGl2Pjxk
aXY+KyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGFzeW5jUmVzcCwgaW1hZ2VVcmwsIGluc2VydGVkLDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2Pkkg
Y2FuIHBvc3QgdGhpcyBjaGFuZ2UgdG8gR2Vycml0LCBidXQgSSBkb24ndCB1bmRlcnN0YW5kLCB3
aGF0J3MgbmV4dDogSW50ZWwgc2hvdWxkIHVwc3RyZWFtIHZpcnR1YWwtbWVkaWEgdG8gT3BlbkJN
QyBhbmQgSSBkb24ndCBrbm93IGlmIGl0J3MgaW4gdGhlaXIgcGxhbnMuPC9kaXY+PGRpdj5PbiB0
aGUgb3RoZXIgaGFuZCwgYXQgc29tZSBwb2ludCBvZiB0aW1lIG5iZC1wcm94eSBjb2RlIHByb2Jh
Ymx5IHdpbGwgYmUgY29tcGxldGVseSByZW1vdmVkIGZyb20gYm1jd2ViIGFuZCB3ZSB3aWxsIGhh
dmUgdG8gc3VwcG9ydCBpdCBpbiBvdXIgbG9jYWwgcmVwb3NpdG9yeSBhcyB3ZSB1c2UgdGhpcyBm
dW5jdGlvbi48L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5QbGVhc2UgYWR2aXNlIHdoYXQgdG8gZG8u
PC9kaXY+PGRpdj5UaGFuayB5b3UhPC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+
PC9kaXY+PC9kaXY+PC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+LS3CoDwvZGl2PjxkaXY+QmVzdCBy
ZWdhcmRzLDwvZGl2PjxkaXY+S29uc3RhbnRpbiBLbHVibmljaGtpbiw8L2Rpdj48ZGl2PmxlYWQg
ZmlybXdhcmUgZW5naW5lZXIsPC9kaXY+PGRpdj5zZXJ2ZXIgaGFyZHdhcmUgUiZhbXA7RCBncm91
cCw8L2Rpdj48ZGl2PllhbmRleCBNb3Njb3cgb2ZmaWNlLjwvZGl2PjxkaXY+dGVsOiArNy05MDMt
NTEwLTMzLTMzPC9kaXY+PGRpdj7CoDwvZGl2Pg==
