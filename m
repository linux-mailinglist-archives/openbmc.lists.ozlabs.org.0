Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7918F3DEF07
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 15:27:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfFzK3MCWz3bYX
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 23:27:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=b97M5Jvh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 helo=forwardcorp1p.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=b97M5Jvh; 
 dkim-atps=neutral
Received: from forwardcorp1p.mail.yandex.net (forwardcorp1p.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b6:217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfFyz5Fphz304V
 for <openbmc@lists.ozlabs.org>; Tue,  3 Aug 2021 23:27:06 +1000 (AEST)
Received: from iva8-c5ee4261001e.qloud-c.yandex.net
 (iva8-c5ee4261001e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a8a6:0:640:c5ee:4261])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 6BF922E156B;
 Tue,  3 Aug 2021 16:26:52 +0300 (MSK)
Received: from mail.yandex-team.ru (mail.yandex-team.ru
 [2a02:6b8:0:506:4a65:eeff:fe1b:f0b1])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 lQJeg000bW21-Qq0Cm4Am; Tue, 03 Aug 2021 16:26:52 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1627997212; bh=Pdi0t6pHit2Bo5EmDKHIgcD4lgczmHJTRm6ReEifFTg=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=b97M5Jvh/41j/cKosgLAcSkL//2gnkArSDt7PfNjge0puaZH/nsYwCxeoGoWyYncz
 TRFfQrOpbeGbxwrKk3ats2e26Crolf6S8oIiXeIx4aTWoj1miZ9E24KwAdlNmof1o5
 jfS+iFEglBmaHn5QBwQn0MzPcavPo63d2/4YhC1U=
Authentication-Results: iva8-c5ee4261001e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from sas1-b43cfc766761.qloud-c.yandex.net
 (sas1-b43cfc766761.qloud-c.yandex.net [2a02:6b8:c14:2801:0:640:b43c:fc76])
 by sas1-6b1512233ef6.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 bQJNO100bW21-myKHRKuK
 for <kitsok@yandex-team.ru>; Tue, 03 Aug 2021 16:26:42 +0300
Received: by sas1-b43cfc766761.qloud-c.yandex.net with HTTP;
 Tue, 03 Aug 2021 16:26:42 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: Maciej Lawniczak <maciej.lawniczak@linux.intel.com>,
 Thaj <tajudheenk@gmail.com>, Alexander Amelkin <a.amelkin@yadro.com>
In-Reply-To: <3c0b0dc3-a31d-dcfb-608b-53436074397b@linux.intel.com>
References: <60926e52-9d00-2b20-e8ac-7fd515ddac78@yadro.com>
 <CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com>
 <3c0b0dc3-a31d-dcfb-608b-53436074397b@linux.intel.com>
Subject: Re: Installing Windows Server 2019 from a remotely mounted ISO
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 03 Aug 2021 16:26:52 +0300
Message-Id: <34751627996896@mail.yandex-team.ru>
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

PGRpdj5IZWxsbyBNYWNpZWosPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+SSd2ZSBnb3QgYSBxdWVz
dGlvbiByZWdhcmRpbmcgdGhlIGluc3RydWN0aW9uLjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2Pkl0
J3MgYWJvdXQgT3B0aW9uIDIgKHByZXBhcmluZyBpbWFnZSBvbiBMaW51eCkuPC9kaXY+PGRpdj5U
aGUgc2VxdWVuY2UgaW4gdGhlIGluc3RydWN0aW9uIGlzOjwvZGl2PjxkaXY+MS4gQ3JlYXRlIGVt
cHR5IGltYWdlIHVzaW5nIGRkOzwvZGl2PjxkaXY+Mi4gQ3JlYXRlIHBhcnRpdGlvbiB0YWJsZSBv
biBpdCB3aXRoIEZBVDMyIHBhcnRpdGlvbjs8L2Rpdj48ZGl2PjMuIEZvcm1hdCBpbWFnZSB0byBG
QVQzMiBmaWxlc3lzdGVtOzwvZGl2PjxkaXY+NC4gUHJlcGFyZSBmaWxlcyBmcm9tIFdpbmRvd3Mg
RFZEOzwvZGl2PjxkaXY+NS4gTW91bnQgaW1hZ2UgdG8gc29tZSBkaXJlY3Rvcnk7PC9kaXY+PGRp
dj42LiBDb3B5IGZpbGVzIHRvIHRoYXQgZGlyZWN0b3J5OzwvZGl2PjxkaXY+Ny4gVW5tb3VudCBp
bWFnZS48L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5JIGNhbid0IGdldCB3aHkgdG8gY3JlYXRlIHBh
cnRpdGlvbiB0YWJsZSBvbiB0aGUgaW1hZ2Uoc3RlcCAyKSBpZiB0aGUgbmV4dCBzdGVwIChmb3Jt
YXR0aW5nIGltYWdlIHdpdGggbWtmcy52ZmF0LCBzdGVwIDMpIGRlc3Ryb3lzIGl0PzwvZGl2Pjxk
aXY+wqA8L2Rpdj48ZGl2PkNvdWxkIHlvdSBwbGVhc2UgY2xhcmlmeSB0aGlzIHBvaW50PzwvZGl2
PjxkaXY+wqA8L2Rpdj48ZGl2PlRoYW5rIHlvdSE8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj4yMi4x
MC4yMDIwLCAxNDozOSwgIk1hY2llaiBMYXduaWN6YWsiICZsdDttYWNpZWoubGF3bmljemFrQGxp
bnV4LmludGVsLmNvbSZndDs6PC9kaXY+PGJsb2NrcXVvdGU+PHA+TW91bnRpbmcgRFZELWJhc2Vk
IElTT3MgaW4gSW50ZWwtQk1DIFZpcnR1YWwgTWVkaWEgaXMgbm90IHN1cHBvcnRlZCBieSB1bmRl
cmx5aW5nIFVTQiBNYXNzIFN0b3JhZ2UgZ2FkZ2V0LiBUbyBtb3VudCBzdWNoIGlzbyBmaWxlcyB0
aGV5IG5lZWQgdG8gYmUgY29udmVydGVkIHRvIE1CUi9GQVQzMiBpbWFnZS4gQXR0YWNoZWQgaW5z
dHJ1Y3Rpb24gc2hvd3MgdHdvIHdheXMgb2YgcHJlcGFyaW5nIHN1Y2ggaW1hZ2UuPC9wPjxkaXY+
T24gMTAvMjEvMjAyMCA5OjMyIEFNLCBUaGFqIHdyb3RlOjwvZGl2PjxibG9ja3F1b3RlPjxkaXY+
SGkgQWxleGFuZGVyLCBJIGFtIGFsc28gZmFjaW5nIHRoZSBzYW1lIGlzc3VlLiBEaWQgeW91IGZp
bmQgYW55IHdvcmthcm91bmTCoGZvciB0aGlzID88L2Rpdj7CoDxkaXY+PGRpdj5PbiBNb24sIE1h
eSAyNSwgMjAyMCBhdCA0OjA0IFBNIEFsZXhhbmRlciBBbWVsa2luICZsdDs8YSBocmVmPSJtYWls
dG86YS5hbWVsa2luQHlhZHJvLmNvbSIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj5hLmFtZWxr
aW5AeWFkcm8uY29tPC9hPiZndDsgd3JvdGU6PC9kaXY+PGJsb2NrcXVvdGUgc3R5bGU9ImJvcmRl
ci1sZWZ0LWNvbG9yOnJnYiggMjA0ICwgMjA0ICwgMjA0ICk7Ym9yZGVyLWxlZnQtc3R5bGU6c29s
aWQ7Ym9yZGVyLWxlZnQtd2lkdGg6MXB4O21hcmdpbjowcHggMHB4IDBweCAwLjhleDtwYWRkaW5n
LWxlZnQ6MWV4Ij5IaSBhbGwhPGJyIC8+PGJyIC8+V2UncmUgdHJ5aW5nIHRvIGluc3RhbGwgV2lu
ZG93cyBTZXJ2ZXIgMjAxOSBmcm9tIGFuIElTTyBpbWFnZSBtb3VudGVkIGFzPGJyIC8+cmVtb3Rl
IG1lZGlhIHZpYSBPcGVuQk1DIFdlYlVJLjxiciAvPjxiciAvPlRoZSBXaW5kb3dzIGluc3RhbGxl
ciBib290cywgYnV0IHRoZW4gc2F5cyB0aGF0IGEgbWVkaWEgZHJpdmVyIGlzIG1pc3NpbmcuPGJy
IC8+PGJyIC8+QXJlIHRoZXJlIGFueSBoaW50cyBvbiBob3cgdG8gYWNjb21wbGlzaCB0aGUgdGFz
az88YnIgLz48YnIgLz5BdHRhY2hlZCBpcyB0aGUgc2NyZWVuc2hvdCBvZiB0aGUgbWVzc2FnZSB3
ZSBnZXQgd2l0aCBXaW5kb3dzIFNlcnZlciAyMDE5LjxiciAvPjxiciAvPldpdGggYmVzdCByZWdh
cmRzLDxiciAvPkFsZXhhbmRlci48YnIgLz48YnIgLz5QLlMuIFdlJ3JlIHVzaW5nIEludGVsLUJN
QyB2ZXJzaW9uIG9mIE9wZW5CTUMgZm9yIHRoZSB0YXNrLCBidXQgaXQgbG9va3M8YnIgLz5saWtl
IHRoZSByZW1vdGUgbWVkaWEgcGFydCBpcyBtb3JlIG9yIGxlc3MgdGhlIHNhbWUuPGJyIC8+wqA8
L2Jsb2NrcXVvdGU+PC9kaXY+PC9ibG9ja3F1b3RlPjwvYmxvY2txdW90ZT48ZGl2PsKgPC9kaXY+
PGRpdj7CoDwvZGl2PjxkaXY+LS3CoDwvZGl2PjxkaXY+QmVzdCByZWdhcmRzLDwvZGl2PjxkaXY+
S29uc3RhbnRpbiBLbHVibmljaGtpbiw8L2Rpdj48ZGl2PmxlYWQgZmlybXdhcmUgZW5naW5lZXIs
PC9kaXY+PGRpdj5zZXJ2ZXIgaGFyZHdhcmUgUiZhbXA7RCBncm91cCw8L2Rpdj48ZGl2PllhbmRl
eCBNb3Njb3cgb2ZmaWNlLjwvZGl2PjxkaXY+dGVsOiArNy05MDMtNTEwLTMzLTMzPC9kaXY+PGRp
dj7CoDwvZGl2Pg==
