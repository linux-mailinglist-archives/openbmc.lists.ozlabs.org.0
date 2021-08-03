Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B443DF009
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 16:18:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfH6249nLz3bVw
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 00:18:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=Qx9xbH6e;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=95.108.205.193;
 helo=forwardcorp1o.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=Qx9xbH6e; 
 dkim-atps=neutral
Received: from forwardcorp1o.mail.yandex.net (forwardcorp1o.mail.yandex.net
 [95.108.205.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfH5j0wJnz2yND
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 00:17:58 +1000 (AEST)
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 3E80D2E1976;
 Tue,  3 Aug 2021 17:17:52 +0300 (MSK)
Received: from mail.yandex-team.ru (mail.yandex-team.ru
 [2a02:6b8:0:506:4a65:eeff:fe1b:f0b1])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 mHKex10xjmI1-Hqx8V0oU; Tue, 03 Aug 2021 17:17:52 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1628000272; bh=mYz4Hl+gF9jO7yigkJQ64746JtZ6F6kC7be0fOPN/D4=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=Qx9xbH6eswVPZCKwDHxd86jdF2KeT6Cev2cXckirBqHTQY1K9O8QrBIoP6Ip2eB9v
 COh183JiHc2RUeyD5WQA77lNrrk91mLzYAehJxBRII06MsMtghiCyATlf8hOZMtGdC
 wKFE1bELB79J3LnCeKwp5boTAufFSnB/SiOoG7uk=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from iva4-92c901fae84c.qloud-c.yandex.net
 (iva4-92c901fae84c.qloud-c.yandex.net [2a02:6b8:c0c:150a:0:640:92c9:1fa])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 fHK8H200Z8c1-H2bsdQqD
 for <kitsok@yandex-team.ru>; Tue, 03 Aug 2021 17:17:42 +0300
Received: by iva4-92c901fae84c.qloud-c.yandex.net with HTTP;
 Tue, 03 Aug 2021 17:17:42 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: Paul Fertser <fercerpav@gmail.com>
In-Reply-To: <20210803133707.GO875@home.paul.comp>
References: <60926e52-9d00-2b20-e8ac-7fd515ddac78@yadro.com>
 <CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com>
 <3c0b0dc3-a31d-dcfb-608b-53436074397b@linux.intel.com>
 <34751627996896@mail.yandex-team.ru> <20210803133707.GO875@home.paul.comp>
Subject: Re: Installing Windows Server 2019 from a remotely mounted ISO
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 03 Aug 2021 17:17:52 +0300
Message-Id: <1341627999924@mail.yandex-team.ru>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Alexander Amelkin <a.amelkin@yadro.com>,
 Maciej Lawniczak <maciej.lawniczak@linux.intel.com>,
 Thaj <tajudheenk@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PGRpdj5IZWxsbyBQYXVsLDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjAzLjA4LjIwMjEsIDE2OjM3
LCAiUGF1bCBGZXJ0c2VyIiAmbHQ7ZmVyY2VycGF2QGdtYWlsLmNvbSZndDs6PC9kaXY+PGJsb2Nr
cXVvdGU+PHA+SGkgS29uc3RhbnRpbiw8YnIgLz48YnIgLz5PbiBUdWUsIEF1ZyAwMywgMjAyMSBh
dCAwNDoyNjo1MlBNICswMzAwLCBLb25zdGFudGluIEtsdWJuaWNoa2luIHdyb3RlOjwvcD48Ymxv
Y2txdW90ZT7CoEl0J3MgYWJvdXQgT3B0aW9uIDIgKHByZXBhcmluZyBpbWFnZSBvbiBMaW51eCku
PGJyIC8+wqBUaGUgc2VxdWVuY2UgaW4gdGhlIGluc3RydWN0aW9uIGlzOjxiciAvPsKgMS4gQ3Jl
YXRlIGVtcHR5IGltYWdlIHVzaW5nIGRkOzxiciAvPsKgMi4gQ3JlYXRlIHBhcnRpdGlvbiB0YWJs
ZSBvbiBpdCB3aXRoIEZBVDMyIHBhcnRpdGlvbjs8YnIgLz7CoDMuIEZvcm1hdCBpbWFnZSB0byBG
QVQzMiBmaWxlc3lzdGVtOzxiciAvPsKgNC4gUHJlcGFyZSBmaWxlcyBmcm9tIFdpbmRvd3MgRFZE
OzxiciAvPsKgNS4gTW91bnQgaW1hZ2UgdG8gc29tZSBkaXJlY3Rvcnk7PGJyIC8+wqA2LiBDb3B5
IGZpbGVzIHRvIHRoYXQgZGlyZWN0b3J5OzxiciAvPsKgNy4gVW5tb3VudCBpbWFnZS48YnIgLz7C
oMKgPGJyIC8+wqBJIGNhbid0IGdldCB3aHkgdG8gY3JlYXRlIHBhcnRpdGlvbiB0YWJsZSBvbiB0
aGUgaW1hZ2Uoc3RlcCAyKSBpZiB0aGUgbmV4dCBzdGVwPGJyIC8+wqAoZm9ybWF0dGluZyBpbWFn
ZSB3aXRoIG1rZnMudmZhdCwgc3RlcCAzKSBkZXN0cm95cyBpdD88L2Jsb2NrcXVvdGU+PHA+PGJy
IC8+TG9va3MgbGlrZSBhIHR5cG8sIHMvaW1hZ2UvcGFydGl0aW9uLy48L3A+PC9ibG9ja3F1b3Rl
PjxkaXY+PGJyIC8+SSBkb24ndCB0aGluayBzbyBhcyBmb3JtYXR0aW5nIHBhcnRpdGlvbiB3b3Vs
ZCByZXF1aXJlIHBsYXkgd2l0aCBsb3NldHVwIGFuZCBwcm9iYWJseSBzb21lIGJvb3QgbG9hZGVy
IGluc3RhbGxhdGlvbiBvbnRvIHRoZSBpbWFnZS48L2Rpdj48YmxvY2txdW90ZT48cD48YnIgLz5U
aGF0IHNhaWQsIGJvb3Rpbmcgd2luZG93cyBpbnN0YWxsZXIgc2hvdWxkbid0IGJlIGFueXRoaW5n
IHNwZWNpYWw8YnIgLz53aXRoIFVFRkksIGJhc2ljYWxseSB5b3UgY3JlYXRlIEdQVCwgRUZJIFN5
c3RlbSBwYXJ0aXRpb24gb24gaXQsIHB1dDxiciAvPnRoZSB3aW5kb3dzIEVGSSBsb2FkZXIgdGhl
cmUgd2l0aCB0aGUgcmlnaHQgbmFtZSBwbHVzIHNvbWUgZmlsZXMgaXQ8YnIgLz5uZWVkcywgYW5k
IHRoZW4gY29weSBldmVyeXRoaW5nIGVsc2UgdG8gTlRGUyBwYXJ0aXRpb24uPGJyIC8+PGJyIC8+
VGhpcyBzaG91bGQgZXhwbGFpbiBpdCB3aXRoIGVub3VnaCBkZXRhaWxzOjxiciAvPjxiciAvPjxh
IGhyZWY9Imh0dHBzOi8vdGVjaGJpdC5jYS8yMDE5LzAyL2NyZWF0aW5nLWEtYm9vdGFibGUtd2lu
ZG93cy0xMC11ZWZpLXVzYi1kcml2ZS11c2luZy1saW51eC8iIHJlbD0ibm9vcGVuZXIgbm9yZWZl
cnJlciI+aHR0cHM6Ly90ZWNoYml0LmNhLzIwMTkvMDIvY3JlYXRpbmctYS1ib290YWJsZS13aW5k
b3dzLTEwLXVlZmktdXNiLWRyaXZlLXVzaW5nLWxpbnV4LzwvYT48L3A+PC9ibG9ja3F1b3RlPjxk
aXY+PGJyIC8+R29vZCBhcnRpY2xlLCB0aGFuayB5b3UhPC9kaXY+PGJsb2NrcXVvdGU+PHA+PGJy
IC8+SFRIPC9wPi0tPGJyIC8+QmUgZnJlZSwgdXNlIGZyZWUgKDxhIGhyZWY9Imh0dHA6Ly93d3cu
Z251Lm9yZy9waGlsb3NvcGh5L2ZyZWUtc3cuaHRtbCIgcmVsPSJub29wZW5lciBub3JlZmVycmVy
Ij5odHRwOi8vd3d3LmdudS5vcmcvcGhpbG9zb3BoeS9mcmVlLXN3Lmh0bWw8L2E+KSBzb2Z0d2Fy
ZSE8YnIgLz48YSBocmVmPSJtYWlsdG86ZmVyY2VycGF2QGdtYWlsLmNvbSIgcmVsPSJub29wZW5l
ciBub3JlZmVycmVyIj5tYWlsdG86ZmVyY2VycGF2QGdtYWlsLmNvbTwvYT48L2Jsb2NrcXVvdGU+
PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2Pi0twqA8L2Rpdj48ZGl2PkJlc3QgcmVnYXJk
cyw8L2Rpdj48ZGl2PktvbnN0YW50aW4gS2x1Ym5pY2hraW4sPC9kaXY+PGRpdj5sZWFkIGZpcm13
YXJlIGVuZ2luZWVyLDwvZGl2PjxkaXY+c2VydmVyIGhhcmR3YXJlIFImYW1wO0QgZ3JvdXAsPC9k
aXY+PGRpdj5ZYW5kZXggTW9zY293IG9mZmljZS48L2Rpdj48ZGl2PnRlbDogKzctOTAzLTUxMC0z
My0zMzwvZGl2PjxkaXY+wqA8L2Rpdj4=
