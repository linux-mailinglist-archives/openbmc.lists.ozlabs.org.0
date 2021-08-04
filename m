Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD96D3DFBF9
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 09:21:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gfjp94YGvz3cKs
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 17:21:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=ecFA3dO7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=77.88.29.217;
 helo=forwardcorp1p.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=ecFA3dO7; 
 dkim-atps=neutral
X-Greylist: delayed 64424 seconds by postgrey-1.36 at boromir;
 Wed, 04 Aug 2021 17:20:46 AEST
Received: from forwardcorp1p.mail.yandex.net (forwardcorp1p.mail.yandex.net
 [77.88.29.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gfjnq01h1z30Dd
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 17:20:44 +1000 (AEST)
Received: from iva8-c5ee4261001e.qloud-c.yandex.net
 (iva8-c5ee4261001e.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:a8a6:0:640:c5ee:4261])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 68B2B2E16A4;
 Wed,  4 Aug 2021 10:20:38 +0300 (MSK)
Received: from mail.yandex-team.ru (mail.yandex-team.ru
 [2a02:6b8:0:51e:1c46:718f:3aa1:db8b])
 by iva8-c5ee4261001e.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 ZKES3B00Za61-Kc00dirH; Wed, 04 Aug 2021 10:20:38 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1628061638; bh=kotVpqWVn++nLdf/+58Y2RHr+DmsmtFVTqg5XJiBdt8=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=ecFA3dO70+010FHwcQFvdiudD+fHXGipCW5R8pfa3HB6eYaG7j4WsF/o21G7o1R9k
 d7ZQCGwqa9HDs0RjJbIXzA0KTa7pvxeDZeDvgGCSdZgJE86r/sfm0VTdnnrpdO401D
 jLEwJp53DkgX3dIlcmJvOG3R1OWEI/SsqdlUee+A=
Authentication-Results: iva8-c5ee4261001e.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from vla1-36b7415cbc1b.qloud-c.yandex.net
 (vla1-36b7415cbc1b.qloud-c.yandex.net [2a02:6b8:c0d:3192:0:640:36b7:415c])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id
 GKE07B0xjKo1-sj1jbVmC
 for <kitsok@yandex-team.ru>; Wed, 04 Aug 2021 10:20:27 +0300
Received: by vla1-36b7415cbc1b.qloud-c.yandex.net with HTTP;
 Wed, 04 Aug 2021 10:20:27 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: Troy Lee <troy_lee@aspeedtech.com>,
	i.kononenko <i.kononenko@yadro.com>
In-Reply-To: <HK0PR06MB214515C746802AB15880B80F8AF19@HK0PR06MB2145.apcprd06.prod.outlook.com>
References: <60926e52-9d00-2b20-e8ac-7fd515ddac78@yadro.com>
 <CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com>
 <3c0b0dc3-a31d-dcfb-608b-53436074397b@linux.intel.com>
 <34751627996896@mail.yandex-team.ru>
 <df77021c-a86b-1a03-9960-acdf6c324600@yadro.com>
 <6631628004052@mail.yandex-team.ru>
 <4354431a-0db6-fb9f-bc21-5ef34eba8852@yadro.com>
 <HK0PR06MB214515C746802AB15880B80F8AF19@HK0PR06MB2145.apcprd06.prod.outlook.com>
Subject: Re: Installing Windows Server 2019 from a remotely mounted ISO
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 04 Aug 2021 10:20:37 +0300
Message-Id: <8411628061515@mail.yandex-team.ru>
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

PGRpdj5IZWxsbywgSWdvciwgVHJveSw8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5JIGZvcmdvdCB0
byBtZW50aW9uIHRoYXQgSSBoYXZlIHBhdGNoZWQgYWxsIG1hbmlwdWxhdGlvbiB3aXRoIHdpdGgg
dXNiX2dhZGdldCBtYXNzIHN0b3JhZ2UgdG8gZW11bGF0ZSBDRC1ST00sIG5vdCBVU0IgdGh1bWIg
KGVjaG8gMSAmZ3Q7IGNkcm9tKSB0aW1lIGFnby48L2Rpdj48ZGl2Pkl0J3MgbW9kaWZpY2F0aW9u
IHBsdXMgSWdvcnMnIHBhdGNoIGlzIGVub3VnaCBmb3IgYm9vdGluZyBmcm9tIGJvdGggTGludXgg
YW5kIFdpbmRvd3MgQ0RzL0RWRHMgaW1hZ2VzLjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PlRoYW5r
IHlvdSE8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj4wNC4wOC4yMDIxLCAwNDo1MCwgIlRyb3kgTGVl
IiAmbHQ7dHJveV9sZWVAYXNwZWVkdGVjaC5jb20mZ3Q7OjwvZGl2PjxibG9ja3F1b3RlPjxwPkhp
IElnb3IsPGJyIC8+PGJyIC8+Q3VycmVudGx5LCB0aGUgcmVtb3RlIHZpcnR1YWwgbWVkaWEgZW11
bGF0ZSB0aGUgZ2FkZ2V0IGRyaXZlciBhcyB1c2IgdGh1bWIgZHJpdmUgaW5zdGVhZCBvZiBjZC1y
b20uPGJyIC8+UGxlYXNlIGhhdmUgYSBsb29rIG9uIG15IHBhdGNoOjxiciAvPjxhIGhyZWY9Imh0
dHBzOi8vZ2Vycml0Lm9wZW5ibWMtcHJvamVjdC54eXovYy9vcGVuYm1jL29wZW5ibWMvKy80Mjk4
NiIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj5odHRwczovL2dlcnJpdC5vcGVuYm1jLXByb2pl
Y3QueHl6L2Mvb3BlbmJtYy9vcGVuYm1jLysvNDI5ODY8L2E+PGJyIC8+PGJyIC8+VGhhbmtzLDxi
ciAvPlRyb3kgTGVlPGJyIC8+PGJyIC8+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS08YnIgLz5G
cm9tOiBvcGVuYm1jICZsdDs8YSBocmVmPSJtYWlsdG86b3BlbmJtYy1ib3VuY2VzK3Ryb3lfbGVl
PWFzcGVlZHRlY2guY29tQGxpc3RzLm96bGFicy5vcmciIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJl
ciI+b3BlbmJtYy1ib3VuY2VzK3Ryb3lfbGVlPWFzcGVlZHRlY2guY29tQGxpc3RzLm96bGFicy5v
cmc8L2E+Jmd0OyBPbiBCZWhhbGYgT2YgaS5rb25vbmVua288YnIgLz5TZW50OiBUdWVzZGF5LCBB
dWd1c3QgMywgMjAyMSAxMTo0MCBQTTxiciAvPlRvOiBLb25zdGFudGluIEtsdWJuaWNoa2luICZs
dDs8YSBocmVmPSJtYWlsdG86a2l0c29rQHlhbmRleC10ZWFtLnJ1IiByZWw9Im5vb3BlbmVyIG5v
cmVmZXJyZXIiPmtpdHNva0B5YW5kZXgtdGVhbS5ydTwvYT4mZ3Q7PGJyIC8+Q2M6IDxhIGhyZWY9
Im1haWx0bzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmciIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJl
ciI+b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPC9hPjxiciAvPlN1YmplY3Q6IFJlOiBJbnN0YWxs
aW5nIFdpbmRvd3MgU2VydmVyIDIwMTkgZnJvbSBhIHJlbW90ZWx5IG1vdW50ZWQgSVNPPGJyIC8+
PGJyIC8+T24gMDMuMDguMjAyMSAxODoyMSwgS29uc3RhbnRpbiBLbHVibmljaGtpbiB3cm90ZTo8
L3A+PGJsb2NrcXVvdGU+wqBXb3JrcyBsaWtlIGEgY2hhcm0gd2l0aCBhbGwgSVNPIEkgaGFkIG9u
IGhhbmRzLCB0aGFuayB5b3UhPC9ibG9ja3F1b3RlPjxwPjxiciAvPktvbnN0YW50aW4sPGJyIC8+
PGJyIC8+UGxlYXNlIG5vdGUsIEkgZ290IGZlZWRiYWNrIGZyb20gc29tZSBpc3N1ZXMgYWJvdXQg
dXNpbmcgQ0RGUyBpbWFnZXMuPGJyIC8+SSB3b3JrIHRvIHNvbHZlIHRoZSBpc3N1ZSBvZiB1c2lu
ZyBzdWNoIElTTyBmb3JtYXRzLjxiciAvPsKgPC9wPi0tPGJyIC8+QmVzdCByZWdhcmRzLDxiciAv
PjxiciAvPklnb3IgS29ub25lbmtvPC9ibG9ja3F1b3RlPjxkaXY+wqA8L2Rpdj48ZGl2PsKgPC9k
aXY+PGRpdj4tLcKgPC9kaXY+PGRpdj5CZXN0IHJlZ2FyZHMsPC9kaXY+PGRpdj5Lb25zdGFudGlu
IEtsdWJuaWNoa2luLDwvZGl2PjxkaXY+bGVhZCBmaXJtd2FyZSBlbmdpbmVlciw8L2Rpdj48ZGl2
PnNlcnZlciBoYXJkd2FyZSBSJmFtcDtEIGdyb3VwLDwvZGl2PjxkaXY+WWFuZGV4IE1vc2NvdyBv
ZmZpY2UuPC9kaXY+PGRpdj50ZWw6ICs3LTkwMy01MTAtMzMtMzM8L2Rpdj48ZGl2PsKgPC9kaXY+
