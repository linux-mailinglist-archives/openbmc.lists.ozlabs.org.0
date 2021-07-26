Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4DD3D5BBB
	for <lists+openbmc@lfdr.de>; Mon, 26 Jul 2021 16:33:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYMpz0d9wz30BX
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 00:33:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=tudmwGmz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=95.108.205.193;
 helo=forwardcorp1o.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=tudmwGmz; 
 dkim-atps=neutral
X-Greylist: delayed 166 seconds by postgrey-1.36 at boromir;
 Tue, 27 Jul 2021 00:32:57 AEST
Received: from forwardcorp1o.mail.yandex.net (forwardcorp1o.mail.yandex.net
 [95.108.205.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYMpd6tr1z2yYt
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 00:32:57 +1000 (AEST)
Received: from iva8-c5ee4261001e.qloud-c.yandex.net
 (iva8-c5ee4261001e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a8a6:0:640:c5ee:4261])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 583AE2E1811;
 Mon, 26 Jul 2021 17:30:01 +0300 (MSK)
Received: from mail.yandex-team.ru (mail.yandex-team.ru
 [2a02:6b8:0:51e:4cbd:d4b5:e19e:2d62])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 uTfTL400fKo1-U10qibhl; Mon, 26 Jul 2021 17:30:01 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1627309801; bh=t9MEGhkzEOmiaF7/wMgNlBr3N2wuKQWDTO8FmSoqgWg=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=tudmwGmzpi8XgW6W7LOPs6VvNn8fcWEz8pPyumLOSSaB9nsguaPGnSD7b0/fYpbQ9
 dq4UeHfWM+VJXafVKOiGq7AyAnnXZ7IFwtJ3ogpQ31bLyuS/8L41jxNEHNY6FRzK4M
 bD+YW7kU4RWZsR/e73Ycri8JEpvOf7so8jDLgPKc=
Authentication-Results: iva8-c5ee4261001e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from iva8-dc7983bf477b.qloud-c.yandex.net
 (iva8-dc7983bf477b.qloud-c.yandex.net [2a02:6b8:c0c:1086:0:640:dc79:83bf])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 lTfEL400huQ1-gyS678Xd
 for <kitsok@yandex-team.ru>; Mon, 26 Jul 2021 17:29:51 +0300
Received: by iva8-dc7983bf477b.qloud-c.yandex.net with HTTP;
 Mon, 26 Jul 2021 17:29:50 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: =?utf-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <george.hung@quantatw.com>,
 "cheng.c.yang@linux.intel.com" <cheng.c.yang@linux.intel.com>
In-Reply-To: <HK0PR04MB23393580CABB710F96FA97118F159@HK0PR04MB2339.apcprd04.prod.outlook.com>
References: <HK0PR04MB23393580CABB710F96FA97118F159@HK0PR04MB2339.apcprd04.prod.outlook.com>
Subject: Re: Serial over LAN by phosphor-net-ipmid issue
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 26 Jul 2021 17:30:01 +0300
Message-Id: <500141627309651@mail.yandex-team.ru>
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

PGRpdj5IZWxsbyBHZW9yZ2UhPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+Q2FuIHlvdSBwbGVhc2Ug
Y2hlY2sgaWYgdGhlcmUgaXMgL3h5ei9vcGVuYm1jX3Byb2plY3QvaXBtaSBicmFuY2ggaW4gZGJ1
cz88L2Rpdj48ZGl2PjxkaXY+cm9vdDovdG1wIyBidXNjdGwgdHJlZSB4eXoub3BlbmJtY19wcm9q
ZWN0LlNldHRpbmdzIHwgZ3JlcCBzb2w8L2Rpdj48ZGl2PsKgIMKgIOKUgiDilJTilIAveHl6L29w
ZW5ibWNfcHJvamVjdC9pcG1pL3NvbDwvZGl2PjxkaXY+wqAgwqAg4pSCIMKgIOKUlOKUgC94eXov
b3BlbmJtY19wcm9qZWN0L2lwbWkvc29sL2V0aDA8L2Rpdj48ZGl2PnJvb3Q6L3RtcCPCoDwvZGl2
PjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PklmIGl0J3Mgbm90IHRoZXJlLCB5b3UgbmVlZCB0byBh
ZGQgaXQgdmlhIHBob3NwaG9yLXNldHRpbmdzLW1hbmFnZXIuPC9kaXY+PGRpdj7CoDwvZGl2Pjxk
aXY+MTIuMDcuMjAyMSwgMDk6NDEsICJHZW9yZ2UgSHVuZyAo5rSq5b+g5pWsKSIgJmx0O2dlb3Jn
ZS5odW5nQHF1YW50YXR3LmNvbSZndDs6PC9kaXY+PGJsb2NrcXVvdGU+PHA+SGkgQ2hlbmcsPGJy
IC8+PGJyIC8+SSB0cmllZCB0byB1c2UgU09MIGZvciB0aGUgbGF0ZXN0IHBob3NwaG9yLW5ldC1p
cG1pZCwgYnV0IGl0IGNhbid0IHdvcmsuPGJyIC8+PGJyIC8+SSBmb3VuZCB0aGUgY29tbWl0IGZv
ciBTT0wgY29tbWFuZHM6PGJyIC8+PGEgaHJlZj0iaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9q
ZWN0Lnh5ei9jL29wZW5ibWMvcGhvc3Bob3ItbmV0LWlwbWlkLysvMjk3MDMiIHJlbD0ibm9vcGVu
ZXIgbm9yZWZlcnJlciI+aHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5i
bWMvcGhvc3Bob3ItbmV0LWlwbWlkLysvMjk3MDM8L2E+PGJyIC8+PGJyIC8+SXQgcmVtb3ZlZCAi
c2V0Q29uZlBhcmFtcyIgZnVuY3Rpb24gYW5kIGFsc28gZGlzYWJsZWQgdG8gcmVnaXN0ZXIgc2V0
dGluZyBTT0wgY29uZmlndXJhdGlvbiBwYXJhbWV0ZXJzIGNvbW1hbmQuIChpLmUuLCBpcG1pdG9v
bCAtSSBsYW5wbHVzIC1IIHggLVUgeCAtUCB4IHJhdyAweDBjIDB4MjEgY2FuJ3QgYmUgdXNlZCk8
YnIgLz48YnIgLz5JbnN0ZWFkIG9mIHRoYXQsIGl0IGNoYW5nZWQgdG8gdXNlIHRoZSBkYnVzIGlu
dGVyZmFjZSB0byB1cGRhdGUgU09MIHBhcmFtZXRlcnMsIGJ1dCBJIGRvbid0IGtub3cgd2hpY2gg
cHJvY2Vzcy9zZXJ2aWNlIHRvIGdlbmVyYXRlIHRoZSByZWxhdGVkIGRidXMgcGF0aC9wcm9wZXJ0
aWVzIGZvciBTT0wgcGFyYW1ldGVycy48YnIgLz48YnIgLz5EbyBJIG1pc3Mgc29tZXRoaW5nIHRv
IGVuYWJsZSBvciBjb25maWcgPzxiciAvPjxiciAvPjxiciAvPlRoYW5rcy48YnIgLz48YnIgLz5C
ZXN0IFJlZ2FyZHM8YnIgLz5HZW9yZ2UgSHVuZzxiciAvPsKgPC9wPjwvYmxvY2txdW90ZT48ZGl2
PsKgPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+LS3CoDwvZGl2PjxkaXY+QmVzdCByZWdhcmRzLDwv
ZGl2PjxkaXY+S29uc3RhbnRpbiBLbHVibmljaGtpbiw8L2Rpdj48ZGl2PmxlYWQgZmlybXdhcmUg
ZW5naW5lZXIsPC9kaXY+PGRpdj5zZXJ2ZXIgaGFyZHdhcmUgUiZhbXA7RCBncm91cCw8L2Rpdj48
ZGl2PllhbmRleCBNb3Njb3cgb2ZmaWNlLjwvZGl2PjxkaXY+dGVsOiArNy05MDMtNTEwLTMzLTMz
PC9kaXY+PGRpdj7CoDwvZGl2Pg==
