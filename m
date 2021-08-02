Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB823DDC0F
	for <lists+openbmc@lfdr.de>; Mon,  2 Aug 2021 17:13:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdhMy14TXz3bXH
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 01:13:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=wBKF+mvv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=2a02:6b8:0:1619::183;
 helo=forwardcorp1j.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=wBKF+mvv; 
 dkim-atps=neutral
Received: from forwardcorp1j.mail.yandex.net (forwardcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdhMb2c0Cz3060
 for <openbmc@lists.ozlabs.org>; Tue,  3 Aug 2021 01:12:55 +1000 (AEST)
Received: from iva8-c5ee4261001e.qloud-c.yandex.net
 (iva8-c5ee4261001e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a8a6:0:640:c5ee:4261])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 3C1122E0E47;
 Mon,  2 Aug 2021 18:12:46 +0300 (MSK)
Received: from mail.yandex-team.ru (mail.yandex-team.ru
 [2a02:6b8:0:506:4a65:eeff:fe1b:f0b1])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 fCKpho0xCqM1-Ckx0KDlb; Mon, 02 Aug 2021 18:12:46 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1627917166; bh=/HJ1AJy7kpxlvK8X/xw/ktpWkNY23FJXbst/ksrhMok=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=wBKF+mvvy1X7DEy2BUeodaGRkW9odaRu58pfeliwNapP1MEvBAxtsWEMEt5TiUhZR
 sGpvVYkTQxi9ZeF5PyOW3V14AvgDy53bdTLDUzXkGWda+kjhfsWivhH7yLhYqeTfJw
 IBsFDiC1HoeHpgiakbJnnIsI5Xh2mslMIplb8c64=
Authentication-Results: iva8-c5ee4261001e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from sas1-b43cfc766761.qloud-c.yandex.net
 (sas1-b43cfc766761.qloud-c.yandex.net [2a02:6b8:c14:2801:0:640:b43c:fc76])
 by sas1-6b1512233ef6.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 UCKukY0x8mI1-4BvzieOg
 for <kitsok@yandex-team.ru>; Mon, 02 Aug 2021 18:12:36 +0300
Received: by sas1-b43cfc766761.qloud-c.yandex.net with HTTP;
 Mon, 02 Aug 2021 18:12:36 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: Paul Fertser <fercerpav@gmail.com>
In-Reply-To: <20210727093015.GQ875@home.paul.comp>
References: <CAE33tLEsCJtr9VPYj57ZcOe5iWD6282WmrMTr-Hp96Y3rkBzAA@mail.gmail.com>
 <000001d5bc87$f6fe3780$e4faa680$@linux.intel.com>
 <CAE33tLHvjuwFwCsSdohvYPHgs-f-8sDWMsNdAhzgQbs3=o7_tQ@mail.gmail.com>
 <429111627309901@mail.yandex-team.ru>
 <20210726145246.GL875@home.paul.comp>
 <435311627317580@mail.yandex-team.ru>
 <20210726165144.GN875@home.paul.comp>
 <477521627375667@mail.yandex-team.ru> <20210727093015.GQ875@home.paul.comp>
Subject: Re: Serial Over Lan (SOL) no login prompt on Linux IRQ mode [SOLVED]
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 02 Aug 2021 18:12:46 +0300
Message-Id: <45151627916979@mail.yandex-team.ru>
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

PGRpdj5IZWxsbyBQYXVsLDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PklmIFVBUlQgaXMgZGlzYWJs
ZWQgaW4gRFRTLCBpdHMnIGNsb2NrIGlzIGRpc2FibGVkIGluIFNDVTBDIChDbG9jayBzdG9wIGNv
bnRyb2wgcmVnaXN0ZXIpLjwvZGl2PjxkaXY+QWZ0ZXIgZW5hYmxpbmcgY2xvY2tzLCBldmVyeXRo
aW5nIHdvcmtzIGZpbmUgd2l0aCBVQVJUIHJvdXRpbmcuPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+
VGhhbmsgeW91ITwvZGl2PjxkaXY+UC5TLiBTbyByb290IGNhdXNlIG9mIG15IHBhaW5zIHdpdGgg
U09MIGlzIGdsb2JhbCB3b3JtaW5nIGFzIHByb2JhYmx5IHRoZSByZWFzb24gdG8gZGlzYWJsZSBV
QVJUIGNsb2NrIGlzIHRvIHNhdmUgcG93ZXIuPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+MjcuMDcu
MjAyMSwgMTI6MzAsICJQYXVsIEZlcnRzZXIiICZsdDtmZXJjZXJwYXZAZ21haWwuY29tJmd0Ozo8
L2Rpdj48YmxvY2txdW90ZT48cD5PbiBUdWUsIEp1bCAyNywgMjAyMSBhdCAxMTo1Mzo1N0FNICsw
MzAwLCBLb25zdGFudGluIEtsdWJuaWNoa2luIHdyb3RlOjwvcD48YmxvY2txdW90ZT7CoFNJUlEg
cG9sYXJpdHkgaXMgc29tZXRoaW5nIEkgZGlkbid0IHRyeSwgd2lsbCBkbyBpdC4gQW5kIHllcywg
U0lSUSBiaXQgaXMgemVybyw8YnIgLz7CoGJ1dCBhbGwgb3RoZXIgYml0cyBhcmUgYWxzbyB6ZXJv
IGluIHRoYXQgcmVnaXN0ZXIsIHRoYXQgY29uZnVzZXMgbWUuPC9ibG9ja3F1b3RlPjxwPjxiciAv
Pkkgd2FzIGFsc28gYWJsZSB0byBtYW51YWxseSBleHBvcnQgdGhlIFNJUlEgcGluIHZpYSBzeXNm
cyBhbmQgd2hlbjxiciAvPm1hbnVhbGx5IHRvZ2dsaW5nIGl0IHRoZSBob3N0IHdhcyBzZWVpbmcg
VUFSVCBpbnRlcnJ1cHRzIGFuZCBnZXR0aW5nPGJyIC8+ZGF0YSB0byBhbmQgZnJvbSBWVUFSVC4g
VGhhdCBsZWFkIG5vd2hlcmUgdGhvdWdoLCBzbyB3ZSByZXNvcnRlZCB0bzxiciAvPmhhcmR3YXJl
IHJvdXRpbmcgaW4gYXN0MjUwMCBiZXR3ZWVuICJyZWFsIFVBUlRzIi48YnIgLz7CoDwvcD48Ymxv
Y2txdW90ZT7CoEluc3RlYWQgSSBjb25maWd1cmUgVUFSVCByb3V0aW5nIGJ5IGRpcmVjdCB3cml0
aW5nIHRvIHJlZ2lzdGVycyB2aWEgL2Rldi9tZW08YnIgLz7CoCh5ZXMsIEkga25vdyB0aGF0IGl0
J3MgYSBiYWQgcHJhY3RpdmUsIGJ1dCBpdCdzIGRldmVsb3BtZW50KS48L2Jsb2NrcXVvdGU+PHA+
PGJyIC8+U2hvdWxkIHdvcmsgdGhlIHNhbWUuPGJyIC8+wqA8L3A+PGJsb2NrcXVvdGU+wqBXaXRo
IHRoZSByb3V0aW5nIEkgaGF2ZSBhYnNvbHV0ZWx5IG5vIGRhdGEgaW4gQk1DIFVBUlRzIG5laXRo
ZXIgZHVyaW5nIFBPU1Qgbm9yPGJyIC8+wqBpcyBPUy48YnIgLz7CoFdoYXQgSSdtIG1pc3Npbmcg
aXMgaG93IHRoYXQgcm91dGluZyB3b3Jrcy4gSXMgaXQgb24tY3J5c3RhbCBvciBVQVJUIG5lZWQg
dG8gYmU8YnIgLz7CoHJvdXRlZCB0byBTb0MgcGlucyB0aHVzIFRYL1JYIGFyZSBjb25uZWN0ZWQg
dmlhIHBpbnM/PC9ibG9ja3F1b3RlPjxwPjxiciAvPldpdGggdGhlIGNvbmZpZ3VyYXRpb24gYXMg
c2hvd24gdGhlIGhvc3QgaXMgc2VuZGluZyBkYXRhIHRvIGFuZCBmcm9tPGJyIC8+IkNPTTEiICgw
eDNmOCw0KSBhbmQgYW55IHByb2dyYW0gb24gQk1DIGlzIGFibGUgdG8gaW50ZXJhY3Qgd2l0aCBp
dDxiciAvPnZpYSAvZGV2L3R0eVMyLCB3aXRob3V0IGFueSBhZGRpdGlvbmFsIGhhcmR3YXJlIGNv
bm5lY3Rpb25zLCBhbGw8YnIgLz5wdXJlbHkgaW4gc29mdHdhcmUsIHRoZSByb3V0aW5nIGhhcHBl
bnMgaW5zaWRlIGFzcGVlZC4gRG8gbm90IGZvcmdldDxiciAvPnRvIGVuYWJsZSB0dHlTMiBpbiB5
b3VyIGJvYXJkJ3MgRFRTLiBWVUFSVCBpcyBub3QgaW52b2x2ZWQgYXQgYWxsLjxiciAvPsKgPC9w
Pi0tPGJyIC8+QmUgZnJlZSwgdXNlIGZyZWUgKDxhIGhyZWY9Imh0dHA6Ly93d3cuZ251Lm9yZy9w
aGlsb3NvcGh5L2ZyZWUtc3cuaHRtbCIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj5odHRwOi8v
d3d3LmdudS5vcmcvcGhpbG9zb3BoeS9mcmVlLXN3Lmh0bWw8L2E+KSBzb2Z0d2FyZSE8YnIgLz48
YSBocmVmPSJtYWlsdG86ZmVyY2VycGF2QGdtYWlsLmNvbSIgcmVsPSJub29wZW5lciBub3JlZmVy
cmVyIj5tYWlsdG86ZmVyY2VycGF2QGdtYWlsLmNvbTwvYT48L2Jsb2NrcXVvdGU+PGRpdj7CoDwv
ZGl2PjxkaXY+wqA8L2Rpdj48ZGl2Pi0twqA8L2Rpdj48ZGl2PkJlc3QgcmVnYXJkcyw8L2Rpdj48
ZGl2PktvbnN0YW50aW4gS2x1Ym5pY2hraW4sPC9kaXY+PGRpdj5sZWFkIGZpcm13YXJlIGVuZ2lu
ZWVyLDwvZGl2PjxkaXY+c2VydmVyIGhhcmR3YXJlIFImYW1wO0QgZ3JvdXAsPC9kaXY+PGRpdj5Z
YW5kZXggTW9zY293IG9mZmljZS48L2Rpdj48ZGl2PnRlbDogKzctOTAzLTUxMC0zMy0zMzwvZGl2
PjxkaXY+wqA8L2Rpdj4=
