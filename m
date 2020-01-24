Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3C11478FA
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 08:28:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483rNX4hR1zDqVk
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 18:28:44 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=default header.b=zAzvy/Vz; 
 dkim-atps=neutral
Received: from forwardcorp1j.mail.yandex.net (forwardcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483rMx3mRSzDq9y
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jan 2020 18:28:11 +1100 (AEDT)
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id CA3E52E0DE6;
 Fri, 24 Jan 2020 10:27:48 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp2j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 2JVf4YAW49-RmiaEe7d; Fri, 24 Jan 2020 10:27:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1579850868; bh=54K0gvBrA9wQy3qa0UG64aot0Z/9J87X++KeZmvNTY4=;
 h=References:Date:Message-Id:Subject:In-Reply-To:To:From;
 b=zAzvy/VzSTpUTXi2qtv3K8777q/rjW8NZVMs9REGGpshi+erdIyWQZYJN4G95LvYy
 aabxGYBuozUUlH03EXUjrv4B1D2j0zRgN9Czm3Yvxz+DtvuTSR7/IoZP89blaGMVS1
 2/4Ls654tWiHrpJxI7V2BvU3uPg1kEQzrvF9g3pQ=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
Received: by vla1-bfecef18a7a0.qloud-c.yandex.net with HTTP;
 Fri, 24 Jan 2020 10:27:48 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
In-Reply-To: <81118db3-4259-254f-9e91-0f26e6d84c0d@linux.intel.com>
References: <236301579791580@vla5-c30c59847b9e.qloud-c.yandex.net>
 <81118db3-4259-254f-9e91-0f26e6d84c0d@linux.intel.com>
Subject: Re: ikvm on AST2500
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 24 Jan 2020 10:27:48 +0300
Message-Id: <278601579850868@vla1-bfecef18a7a0.qloud-c.yandex.net>
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

PGRpdj5IZWxsbywgSmFlITwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2Pk5vIGx1Y2sgd2l0aCBUaWdo
dFZOQy48L2Rpdj48ZGl2PkkndmUgc3RhcnRlZCB0Y3BkdW1wIC1pIGxvIHBvcnQgNTkwMCBvbiBt
eSBQQyBhbmQgZm91bmQgdGhhdCB0aGVyZSBhcmUgc29tZSBwYWNrZXRzIGR1cmluZyBmaXJzdCBW
TkMgd2luZG93IGRyYXcsIGJ1dCB0aGVuIHRoZXJlIGlzIG5vIHRyYWZmaWMgZXZlbiB3aGVuIHRo
ZSBpbWFnZSBpcyBjaGFuZ2luZyBvbiB0aGUgaG9zdHMnIHNjcmVlbi48L2Rpdj48ZGl2PsKgPC9k
aXY+PGRpdj5ibWN3ZWIgc2hvd3Mgbm90aGluZyBhdCBhbGwgb24gS1ZNIHBhZ2UsIHdpbGwgdHJ5
IHRvIHVuZGVyc3RhbmQgd2h5LjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PlRoYW5rIHlvdSE8L2Rp
dj48ZGl2PsKgPC9kaXY+PGRpdj4yMy4wMS4yMDIwLCAyMDoyMiwgIkphZSBIeXVuIFlvbyIgJmx0
O2phZS5oeXVuLnlvb0BsaW51eC5pbnRlbC5jb20mZ3Q7OjwvZGl2PjxibG9ja3F1b3RlPjxwPkhl
bGxvIEtvbnN0YW50aW4sPC9wPjxwPlBsZWFzZSBnaXZlIGl0IGEgdHJ5IGFnYWluIHVzaW5nIFRp
Z2h0Vk5DIHZpZXdlci4gaWt2bSB1c2VzIHRoZSBUaWdodDxiciAvPmVuY29kaW5nIHNvIHZpZXdl
ciBzaG91bGQgc3VwcG9ydCB0aGUgZm9ybWF0LiBPciwgeW91IGNhbiB1c2UgYm1jd2ViPGJyIC8+
aW5zdGVhZC48YnIgLz48YnIgLz5DaGVlcnMsPGJyIC8+PGJyIC8+SmFlPGJyIC8+PGJyIC8+wqA8
L3A+PGJsb2NrcXVvdGU+wqBUaGFuayB5b3UhPGJyIC8+wqAtLTxiciAvPsKgQmVzdCByZWdhcmRz
LDxiciAvPsKgS29uc3RhbnRpbiBLbHVibmljaGtpbiw8YnIgLz7CoGxlYWQgZmlybXdhcmUgZW5n
aW5lZXIsPGJyIC8+wqBzZXJ2ZXIgaGFyZHdhcmUgUiZhbXA7RCBncm91cCw8YnIgLz7CoFlhbmRl
eCBNb3Njb3cgb2ZmaWNlLjxiciAvPsKgdGVsOiArNy05MDMtNTEwLTMzLTMzPC9ibG9ja3F1b3Rl
PjwvYmxvY2txdW90ZT48ZGl2PsKgPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+LS3CoDwvZGl2Pjxk
aXY+QmVzdCByZWdhcmRzLDwvZGl2PjxkaXY+S29uc3RhbnRpbiBLbHVibmljaGtpbiw8L2Rpdj48
ZGl2PmxlYWQgZmlybXdhcmUgZW5naW5lZXIsPC9kaXY+PGRpdj5zZXJ2ZXIgaGFyZHdhcmUgUiZh
bXA7RCBncm91cCw8L2Rpdj48ZGl2PllhbmRleCBNb3Njb3cgb2ZmaWNlLjwvZGl2PjxkaXY+dGVs
OiArNy05MDMtNTEwLTMzLTMzPC9kaXY+PGRpdj7CoDwvZGl2Pg==
