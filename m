Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7093D71A3
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 10:56:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYrHW2ZY7z3bNv
	for <lists+openbmc@lfdr.de>; Tue, 27 Jul 2021 18:56:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=IrYIvDm6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=2a02:6b8:0:1619::183;
 helo=forwardcorp1j.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=IrYIvDm6; 
 dkim-atps=neutral
X-Greylist: delayed 98 seconds by postgrey-1.36 at boromir;
 Tue, 27 Jul 2021 18:55:48 AEST
Received: from forwardcorp1j.mail.yandex.net (forwardcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYrH854GRz303t
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jul 2021 18:55:48 +1000 (AEST)
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 4607E2E1698;
 Tue, 27 Jul 2021 11:53:58 +0300 (MSK)
Received: from mail.yandex-team.ru (mail.yandex-team.ru
 [2a02:6b8:0:51e:4cbd:d4b5:e19e:2d62])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 vragrE0xi0U1-rwxuwAT6; Tue, 27 Jul 2021 11:53:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1627376038; bh=7AD3u5hgrXHl8w/FRCAQNaCL4/mQs1oITJvO5TYNihY=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=IrYIvDm6JRngYuSYJdskGDpxtLtEfB0MbARQPVB64v4dW1rBfMsFsmMgpRBYLa0FF
 ZueEuRCFy83G9gUvhmOKnkcxf1ZcrOEEEuqjuI4k3wpujjOMlB3GEPLcYtGipIGPjN
 ZP129rGUCwDOBmN1ARF1OpLo+fWa70nOR/efFfos=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from iva4-92c901fae84c.qloud-c.yandex.net
 (iva4-92c901fae84c.qloud-c.yandex.net [2a02:6b8:c0c:150a:0:640:92c9:1fa])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 kraN6F00eSw1-PfN4VHjG
 for <kitsok@yandex-team.ru>; Tue, 27 Jul 2021 11:53:48 +0300
Received: by iva4-92c901fae84c.qloud-c.yandex.net with HTTP;
 Tue, 27 Jul 2021 11:53:47 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: Paul Fertser <fercerpav@gmail.com>
In-Reply-To: <20210726165144.GN875@home.paul.comp>
References: <CAE33tLEsCJtr9VPYj57ZcOe5iWD6282WmrMTr-Hp96Y3rkBzAA@mail.gmail.com>
 <000001d5bc87$f6fe3780$e4faa680$@linux.intel.com>
 <CAE33tLHvjuwFwCsSdohvYPHgs-f-8sDWMsNdAhzgQbs3=o7_tQ@mail.gmail.com>
 <429111627309901@mail.yandex-team.ru>
 <20210726145246.GL875@home.paul.comp>
 <435311627317580@mail.yandex-team.ru> <20210726165144.GN875@home.paul.comp>
Subject: Re: Serial Over Lan (SOL) no login prompt on Linux IRQ mode
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 27 Jul 2021 11:53:57 +0300
Message-Id: <477521627375667@mail.yandex-team.ru>
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

PGRpdj5IZWxsbyBQYXVsLDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjI2LjA3LjIwMjEsIDE5OjUx
LCAiUGF1bCBGZXJ0c2VyIiAmbHQ7ZmVyY2VycGF2QGdtYWlsLmNvbSZndDs6PC9kaXY+PGJsb2Nr
cXVvdGU+PHA+T24gTW9uLCBKdWwgMjYsIDIwMjEgYXQgMDc6NDI6MjJQTSArMDMwMCwgS29uc3Rh
bnRpbiBLbHVibmljaGtpbiB3cm90ZTo8L3A+PGJsb2NrcXVvdGU+wqBUaGFuayB5b3UgZm9yIHRo
aXMgcGF0Y2gsIEkndmUgdHJpZWQgdGhpcyAoVUFSVDEgJmx0Oy0mZ3Q7VUFSVDMgcm91dGluZyks
IGJ1dCB0aGlzPGJyIC8+wqBqdXN0IGRvZXNuJ3Qgd29yayBvbiBteSBoYXJkd2FyZSwgZXZlbiBQ
T1NUIGlzIG5vdCBhdmFpbGFibGUuPGJyIC8+wqBQcm9iYWJseSBvbmx5IHdheSBpcyB0byBhc2sg
QXNwZWVkdGVjaCBzdXBwb3J0IHRvIGNsYXJpZnkgdGhpcy48L2Jsb2NrcXVvdGU+PHA+PGJyIC8+
V2hhdCdzIHlvdXIgaGFyZHdhcmU/IE9uIG91ciBib2FyZCB3ZSBoYXZlIExQQyBjb25uZWN0aW9u
IGJldHdlZW48YnIgLz5BU1QyNTAwIGFuZCBMZXdpc2J1cmcgUENILjwvcD48L2Jsb2NrcXVvdGU+
PGRpdj5JdCdzIGN1c3RvbSBzZXJ2ZXIgZGV2ZWxvcGVkIGZvciB1cywgYnV0IHdlIGFsc28gaGF2
ZSBMUEMgYmV0d2VlbiBBU1QyNTAwIGFuZCBQQ0gsIHNvIHRoZXJlIGlzIG5vIGRpZmZlcmVuY2U8
L2Rpdj48ZGl2PsKgPC9kaXY+PGJsb2NrcXVvdGU+PHA+SWYgeW91ciBVRUZJIGlzIGNvbmZpZ3Vy
aW5nIFNJUlEgaW5Db250aW51b3VzIG1vZGUgKHNob3VsZCBiZSBkZWZhdWx0IEkgZ3Vlc3MpIHRo
ZW4geW91IG1pZ2h0IGFsc28gd2FudDxiciAvPnRoaXMgKGV2ZW4gdGhvdWdoIFZVQVJUIHdvdWxk
bid0IGJlIHVzZWQgd2l0aCB0aGUgY29uZmlndXJhdGlvbiB1c2VkPC9wPjwvYmxvY2txdW90ZT48
ZGl2PjxiciAvPlNJUlEgcG9sYXJpdHkgaXMgc29tZXRoaW5nIEkgZGlkbid0IHRyeSwgd2lsbCBk
byBpdC4gQW5kIHllcywgU0lSUSBiaXQgaXMgemVybywgYnV0IGFsbCBvdGhlciBiaXRzIGFyZSBh
bHNvIHplcm8gaW4gdGhhdCByZWdpc3RlciwgdGhhdCBjb25mdXNlcyBtZS48L2Rpdj48YmxvY2tx
dW90ZT48cD5ieSB0aGUgcGF0Y2ggSSd2ZSBzZW50IGVhcmxpZXIpOjxiciAvPjxiciAvPitkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1mYWNlYm9vay10aW9nYXBhc3Mu
ZHRzIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1mYWNlYm9vay10aW9nYXBhc3MuZHRz
PGJyIC8+K2luZGV4IGZmZmRiMmI2N2MwOC4uNzcyMzNkMzYwMTQyIDEwMDY0NDxiciAvPistLS0g
YS9hcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWZhY2Vib29rLXRpb2dhcGFzcy5kdHM8YnIg
Lz4rKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1mYWNlYm9vay10aW9nYXBhc3Mu
ZHRzPGJyIC8+K0BAIC0xNTcsNiArMTU3LDcgQEA8YnIgLz4rPGJyIC8+KyAmYW1wO3Z1YXJ0IHs8
IS0tIC0tPjxiciAvPisgLy8gVlVBUlQgSG9zdCBDb25zb2xlPGJyIC8+KysgYXNwZWVkLHNpcnEt
cG9sYXJpdHktc2Vuc2UgPSAmbHQ7JmFtcDtzeXNjb24gMHg3MCAyNSZndDs7PGJyIC8+KyBzdGF0
dXMgPSAib2theSI7PGJyIC8+KyB9OzxiciAvPis8YnIgLz48YnIgLz5JIHN1Z2dlc3QgeW91IHRy
eSB0aGVzZSB0d28gcGF0Y2hlcyB2ZXJiYXRpbSwgdGhpcyB3aG9sZSByZW1hcHBpbmc8YnIgLz5i
dXNpbmVzcyBpcyB0cmlja3kgc28gcHJvYmFibHkgeW91J3ZlIG1pc3NlZCBzb21ldGhpbmcgaW4g
eW91ciBlYXJsaWVyPGJyIC8+dGVzdHMuPC9wPjwvYmxvY2txdW90ZT48ZGl2PjxiciAvPkl0IGlz
IHByb2JhYmxlIGJlY2F1c2UgSSBkb24ndCBwYXRjaCBVLUJvb3QuPC9kaXY+PGRpdj5JbnN0ZWFk
IEkgY29uZmlndXJlIFVBUlQgcm91dGluZyBieSBkaXJlY3Qgd3JpdGluZyB0byByZWdpc3RlcnMg
dmlhIC9kZXYvbWVtICh5ZXMsIEkga25vdyB0aGF0IGl0J3MgYSBiYWQgcHJhY3RpdmUsIGJ1dCBp
dCdzIGRldmVsb3BtZW50KS48L2Rpdj48ZGl2PldpdGggdGhlIHJvdXRpbmcgSSBoYXZlIGFic29s
dXRlbHkgbm8gZGF0YSBpbiBCTUMgVUFSVHMgbmVpdGhlciBkdXJpbmcgUE9TVCBub3IgaXMgT1Mu
PC9kaXY+PGRpdj5XaGF0IEknbSBtaXNzaW5nIGlzIGhvdyB0aGF0IHJvdXRpbmcgd29ya3MuIElz
IGl0IG9uLWNyeXN0YWwgb3IgVUFSVCBuZWVkIHRvIGJlIHJvdXRlZCB0byBTb0MgcGlucyB0aHVz
IFRYL1JYIGFyZSBjb25uZWN0ZWQgdmlhIHBpbnM/PC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+Tm93
IEknbSB0cnlpbmcgdG8gY29tcGFyZSBMUEMgcmVnaXN0ZXJzIGZyb20gb3RoZXIgdmVuZG9yIEJN
QyBvbiB0aGUgc2FtZSBwbGF0Zm9ybSB3aXRoIHdoYXQgd2UgaGF2ZSBpbiBPcGVuQk1DLCBtYXkg
YmUgdGhpcyB3aWxsIHNob3cgc29tZSBkaWZmZXJlbmNlcy48L2Rpdj48ZGl2PsKgPC9kaXY+PGJs
b2NrcXVvdGU+LS08YnIgLz5CZSBmcmVlLCB1c2UgZnJlZSAoPGEgaHJlZj0iaHR0cDovL3d3dy5n
bnUub3JnL3BoaWxvc29waHkvZnJlZS1zdy5odG1sIiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIi
Pmh0dHA6Ly93d3cuZ251Lm9yZy9waGlsb3NvcGh5L2ZyZWUtc3cuaHRtbDwvYT4pIHNvZnR3YXJl
ITxiciAvPjxhIGhyZWY9Im1haWx0bzpmZXJjZXJwYXZAZ21haWwuY29tIiByZWw9Im5vb3BlbmVy
IG5vcmVmZXJyZXIiPm1haWx0bzpmZXJjZXJwYXZAZ21haWwuY29tPC9hPjwvYmxvY2txdW90ZT48
ZGl2PsKgPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+LS3CoDwvZGl2PjxkaXY+QmVzdCByZWdhcmRz
LDwvZGl2PjxkaXY+S29uc3RhbnRpbiBLbHVibmljaGtpbiw8L2Rpdj48ZGl2PmxlYWQgZmlybXdh
cmUgZW5naW5lZXIsPC9kaXY+PGRpdj5zZXJ2ZXIgaGFyZHdhcmUgUiZhbXA7RCBncm91cCw8L2Rp
dj48ZGl2PllhbmRleCBNb3Njb3cgb2ZmaWNlLjwvZGl2PjxkaXY+dGVsOiArNy05MDMtNTEwLTMz
LTMzPC9kaXY+PGRpdj7CoDwvZGl2Pg==
