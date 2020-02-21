Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A55168890
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 22:03:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PP883d8BzDqpC
	for <lists+openbmc@lfdr.de>; Sat, 22 Feb 2020 08:03:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=95.108.205.193;
 helo=forwardcorp1o.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=yandex-team.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=TwfAxRps; 
 dkim-atps=neutral
Received: from forwardcorp1o.mail.yandex.net (forwardcorp1o.mail.yandex.net
 [95.108.205.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PP7V36NlzDqf2
 for <openbmc@lists.ozlabs.org>; Sat, 22 Feb 2020 08:03:14 +1100 (AEDT)
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::162])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 637462E157C;
 Sat, 22 Feb 2020 00:03:08 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp1j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 rJTEHKt9Z0-38DOgfSM; Sat, 22 Feb 2020 00:03:08 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1582318988; bh=zKrM8ejiBF1OqSTVjTmRvZVbTYYt3vEPCr3ttugR3NI=;
 h=Cc:Subject:Date:References:To:From:Message-Id;
 b=TwfAxRpsAiw3BLBtudV4FNevdp0RbeCcpYYrJfK/njInMslhqvN2vMsyRIlgmWJcl
 c/d1Va0SdmccxCHieBFrsYpaZmpDoL7ZzLqw2cyQVcHXtyVUk05s/2/O5dd48YlcOv
 JEpGJd5zaYHdSox89UDElTZle+L6Krkezyi/RWEI=
Authentication-Results: mxbackcorp1j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from mxbackcorp1o.mail.yandex.net (localhost [::1])
 by mxbackcorp1o.mail.yandex.net with LMTP id O0PJrF63FB-dKCky03l
 for <kitsok@yandex-team.ru>; Sat, 22 Feb 2020 00:02:58 +0300
Received: by myt4-457577cc370d.qloud-c.yandex.net with HTTP;
 Sat, 22 Feb 2020 00:02:58 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: Patrick Williams <patrick@stwcx.xyz>
References: <1699551582274510@sas1-1199a7868807.qloud-c.yandex.net>
 <20200221202112.GB67957@patrickw3-mbp.dhcp.thefacebook.com>
Subject: Re: AST2500 I2C problem
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Sat, 22 Feb 2020 00:03:08 +0300
Message-Id: <3402461582318978@myt4-457577cc370d.qloud-c.yandex.net>
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

PGRpdj5IZWxsbywgUGF0cmljayE8ZGl2PsKgPC9kaXY+PGRpdj5UaGFuayB5b3UgZm9yIHRoZSBy
ZXBseS48L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5JMkMtMTEgaXMgbmF0aXZlIEFTVDI1MDAgYnVz
LjwvZGl2PjxkaXY+T25lIHRoaW5nIHRoYXQgbWF5IGJlIHVudXN1YWwgaXMgdGhhdCBidXNlcyA5
IGFuZCAxMCBhcmUgZGlzYWJsZWQ6IHRoZXkgYXJlIHVudXNlZCwgYW5kIHRoZSBwaW5zIGFyZSB1
c2VkIGZvciBhbHRlcm5hdGl2ZSBmdW5jdGlvbi48L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5JJ3Zl
IGVuYWJsZWQgZGVidWcgb2YgZHJpdmVyIGluc3RhbnRpYXRpb24sIGJ1dCB3aWxsIGJlIGFibGUg
dG8gZ2l2ZSBsb2dzIG9ubHkgb24gTW9uZGF5LjwvZGl2PjxkaXY+QWxzbyBJJ3ZlIHJldmlld2Vk
IEkyQyBkcml2ZXIgc291cmNlcywgYW5kIGNhbid0IGZpbmQgYW55dGhpbmcgdGhhdCBjb3VsZCBw
b3N0cG9uZSBidXMgcmVhZGluZXNzLCBidXQgSSdtIG5vdCBMaW51eCBndXJ1LjwvZGl2PjxkaXY+
wqA8L2Rpdj48ZGl2PkkgaGFkIHRoZSBzYW1lIGVycm9yIHdpdGggSU5BMjE5IHNpdHRpbmcgb24g
dGhlIG90aGVyIGJ1cywgSSd2ZSBoYWNrZWQgdGhlIGRyaXZlciBieSByZW1vdmluZyBmYWlsdXJl
IHJldHVybiwgYW5kIGl0IHdvcmtzIGxpa2UgYSBjaGFybSwgdGhlIGRyaXZlciBkZXRlY3RzIHRo
YXQgdGhlIGNoaXAgaXMgdW5pbml0aWFsaXplZCBhbmQgcmUtaW5pdHMgaXQgYWdhaW4gb24gdGhl
IGZpcnN0IHJlYWQgZnJvbSBzeXNmcywgYnV0IGl0J3Mgbm90IGEgc29sdXRpb24gZm9yIHN1cmUg
Oik8L2Rpdj48ZGl2PklmIHlvdSBoYXZlIGFuIGlkZWEgd2hlcmUgdG8gbG9vayBkZWVwZXIsIHBs
ZWFzZSBnaXZlIG1lIGEgaGludCBhcyBJJ20gc3R1Y2suLi48L2Rpdj48ZGl2PlRoYW5rIHlvdSE8
YnIgLz7CoDwvZGl2PjIzOjIxLCAyMSDRhNC10LLRgNCw0LvRjyAyMDIwINCzLiwgUGF0cmljayBX
aWxsaWFtcyAmbHQ7cGF0cmlja0BzdHdjeC54eXomZ3Q7OjxibG9ja3F1b3RlPjxwPk9uIEZyaSwg
RmViIDIxLCAyMDIwIGF0IDExOjQyOjAwQU0gKzAzMDAsIEtvbnN0YW50aW4gS2x1Ym5pY2hraW4g
d3JvdGU6PC9wPjxibG9ja3F1b3RlPsKgSGVsbG8sIGNvbGxlZ3VlcyE8YnIgLz7CoMKgPGJyIC8+
wqBJJ3ZlIGZhY2VkIGEgcHJvYmxlbSB0aGF0IGRvbid0IGtub3cgaG93IHRvIHNvbHZlIHdpdGhv
dXQgdHJpY2tzIGxpa2Ugb3ZlcmxheTxiciAvPsKgRFRTLjxiciAvPsKgwqA8YnIgLz7CoEkgaGF2
ZSBQQ0E5NTU1IGRldmljZSBvbiBJMkMtMTEgYnVzLCBpdCdzIGRlc2NyaWJlZCBpbiBEVFMgYXMg
Zm9sbG93czo8YnIgLz7CoD09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PGJyIC8+wqBbIDMuMTI4Njc5XSBwY2E5NTN4IDExLTAw
MjA6IGZhaWxlZCB3cml0aW5nIHJlZ2lzdGVyPGJyIC8+wqBbIDMuMTMzODYwXSBwY2E5NTN4OiBw
cm9iZSBvZiAxMS0wMDIwIGZhaWxlZCB3aXRoIGVycm9yIC0xMTA8YnIgLz7CoFsgMy4xMzk4MDFd
IGFzcGVlZC1pMmMtYnVzIDFlNzhhNDAwLmkyYy1idXM6IGkyYyBidXMgMTEgcmVnaXN0ZXJlZCAo
ZG1hIG1vZGUpLDxiciAvPsKgaXJxIDQ0PC9ibG9ja3F1b3RlPjxwPjxiciAvPkVycm5vIDExMCBp
czo8YnIgLz7CoMKgwqDCoCNkZWZpbmUgRVRJTUVET1VUIDExMCAvKiBDb25uZWN0aW9uIHRpbWVk
IG91dCAqLzxiciAvPjxiciAvPkkgdGhpbmsgb24gaTJjIGRldmljZXMgdGhpcyBoYXBwZW5zIHdo
ZW4gdGhlcmUgaXMgYSBOQUNLIGNvbmRpdGlvbiB0bzxiciAvPnRoZSBzbGF2ZSBhZGRyZXNzIG9u
IHRoZSBidXMuIFRoZSBvZGQgdGhpbmcgaGVyZSBpcyB0aGF0IHVzdWFsbHkgdGhlPGJyIC8+cHJv
YmluZyBpbmZyYXN0cnVjdHVyZSBoYW5kbGVzIHRoZSBwYXJlbnQgZGV2aWNlIChpMmMgYnVzIGlu
IHRoaXMgY2FzZSk8YnIgLz5ub3QgYmVpbmcgcmVhZHkgYnkgcmV0dXJuaW5nIEVQUk9CRV9ERUZF
UiBpbiB0aGUgZGV2aWNlIHByb2JlIGZ1bmN0aW9uLjxiciAvPjxiciAvPklzICdidXMgMTEnIGEg
dmlydHVhbCBidXMgYmVoaW5kIGFuIGkyYyBtdXggLyBzd2l0Y2g/IEl0IGlzIHBvc3NpYmxlPGJy
IC8+dGhhdCBlaXRoZXIgdGhlIGRyaXZlciBmb3IgdGhhdCBzd2l0Y2ggb3IgdGhlIHBjYTk1M3gg
ZHJpdmVyIGlzbid0PGJyIC8+cHJvcGVybHkgaGFuZGxpbmcgdGhpcyBjb25kaXRpb24gYW5kIG5v
dCBzZW5kaW5nIGJhY2sgRVBST0JFX0RFRkVSLjxiciAvPsKgPC9wPi0tPGJyIC8+UGF0cmljayBX
aWxsaWFtczwvYmxvY2txdW90ZT48YnIgLz48YnIgLz4tLTxiciAvPtCe0YLQv9GA0LDQstC70LXQ
vdC+INC40Lcg0LzQvtCx0LjQu9GM0L3QvtCz0L4g0L/RgNC40LvQvtC20LXQvdC40Y8g0K/QvdC0
0LXQutGBLtCf0L7Rh9GC0Ys8L2Rpdj4=
