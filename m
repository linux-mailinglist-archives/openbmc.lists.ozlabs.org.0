Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CD62A7783
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 07:44:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRYsr30jzzDqmj
	for <lists+openbmc@lfdr.de>; Thu,  5 Nov 2020 17:44:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=5.45.199.163;
 helo=forwardcorp1j.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=yandex-team.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=uq4v+b3o; 
 dkim-atps=neutral
X-Greylist: delayed 109 seconds by postgrey-1.36 at bilbo;
 Thu, 05 Nov 2020 17:44:03 AEDT
Received: from forwardcorp1j.mail.yandex.net (forwardcorp1j.mail.yandex.net
 [5.45.199.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRYrz3NbbzDqJS
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2020 17:44:03 +1100 (AEDT)
Received: from sas1-ec30c78b6c5b.qloud-c.yandex.net
 (sas1-ec30c78b6c5b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2704:0:640:ec30:c78b])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 479BF2E14B2
 for <openbmc@lists.ozlabs.org>; Thu,  5 Nov 2020 09:41:53 +0300 (MSK)
Received: from localhost (localhost [::1])
 by sas1-ec30c78b6c5b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 HYOzEt4cn5-fr08G3mC; Thu, 05 Nov 2020 09:41:53 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1604558513; bh=x5T8mxtgOIjxMnty5O0rntBbWxwCiMFRSTMHRgBfMrA=;
 h=Subject:In-Reply-To:Date:References:To:From:Message-Id;
 b=uq4v+b3oSN56r/PFIpBxI4/xoxqB9DgQo5jwxn5wB222FRODDPAPSXJzTAJmNbhDp
 Ew7S/cO/ldWIfQ5JEfuzk7ck6TWY14LfGpdud/IU9zl8IG/0shMtPFunmBIoKp7lKa
 PTtbEj0WxeBDzC6f6uHrk7UqQ06ee3kGH35B/dhM=
Authentication-Results: sas1-ec30c78b6c5b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from sas1-ec30c78b6c5b.qloud-c.yandex.net
 (sas1-ec30c78b6c5b.qloud-c.yandex.net [2a02:6b8:c14:2704:0:640:ec30:c78b])
 by sas2-3467662b745a.qloud-c.yandex.net with LMTP id KPQ8ZUxLyC-FXaZuSr4
 for <kitsok@yandex-team.ru>; Thu, 05 Nov 2020 09:41:43 +0300
Received: by sas1-1199a7868807.qloud-c.yandex.net with HTTP;
 Thu, 05 Nov 2020 09:41:43 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
In-Reply-To: <CAD+gp9B6Y8-hCP+hzT3Bh8xkg-mcFj_EnQ-FDz6Ax_tqAtJnnw@mail.gmail.com>
References: <CAD+gp9B6Y8-hCP+hzT3Bh8xkg-mcFj_EnQ-FDz6Ax_tqAtJnnw@mail.gmail.com>
Subject: Re: Error:"Failed to find the pwm0_gpio40 line"
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 05 Nov 2020 09:41:53 +0300
Message-Id: <405411604558303@mail.yandex-team.ru>
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

PGRpdj4tINCy0YHQtTwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkhlbGxvITwvZGl2PjxkaXY+wqA8
L2Rpdj48ZGl2PlRoaXMgZXJyb3IgbWVhbnMgR1BJTyBsaWJyYXJ5IHVuYWJsZSB0byBmaW5kIGxp
bmUgd2l0aCB0aGlzIG5hbWUuPC9kaXY+PGRpdj5UbyBjaGVjayB5b3UgY2FuPC9kaXY+PGRpdj5j
YXQgL3N5cy9rZXJuZWwvZGVidWcvZ3BpbyB8IGdyZXAgcHdtMF9ncGlvNDA8L2Rpdj48ZGl2Pm9y
PC9kaXY+PGRpdj5ncGlvaW5mbyB8IGdyZXAgcHdtMF9ncGlvNDA8L2Rpdj48ZGl2PsKgPC9kaXY+
PGRpdj5UaGUgbW9zdCBwcm9iYWJseSBjYXVzZSBpcyBtaXNzaW5nIGxpbmUgbmFtZSBpbiBEVFMu
PC9kaXY+PGRpdj5UaGVyZSBtdXN0IGJlIHNvbWV0aGluZyBsaWtlIHRoaXM6PC9kaXY+PGRpdj48
ZGl2PiZhbXA7Z3BpbyB7PCEtLSAtLT48L2Rpdj48ZGl2PnN0YXR1cyA9ICJva2F5Ijs8L2Rpdj48
ZGl2PnBpbmN0cmwtbmFtZXMgPSAicGFzcy10aHJvdWdoIjs8L2Rpdj48ZGl2PnBpbmN0cmwtMCA9
ICZsdDsmYW1wO3BpbmN0cmxfZ3BpZDBfZGVmYXVsdDwvZGl2PjxkaXY+JmFtcDtwaW5jdHJsX2dw
aWQyX2RlZmF1bHQmZ3Q7OzwvZGl2PjxkaXY+Z3Bpby1saW5lLW5hbWVzID08L2Rpdj48ZGl2Pi8q
IEEwLUE3ICovICJBMCIsICJBMSIsICJBMiIsICJBMyIsICJBNCIsICJBNSIsICJBNiIsICJBNyIs
PC9kaXY+PGRpdj4vKiBCMC1CNyAqLyAiQjAiLCAiQjEiLCAiQjIiLCAiUE9TVF9DT01QTEVURSIs
ICJCNCIsICJCNSIsICJQU19QV1JPSyIsICJCNyIsPC9kaXY+PGRpdj4uLi4uLi4uLi4uLi4uLi4u
PC9kaXY+PGRpdj59OzwvZGl2PjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkkgZG9uJ3QgaGF2ZSBQ
SSBvbiBoYW5kcyBzbyBteSBleGFtcGxlIGlzIGZvciBBU1QyNTAwIFNvQywgYnV0IGFzIGZhciBh
cyBJIHJlbWVtYmVyIHRoZXJlIGFyZSBtYW55IGd1aWRlcyBob3cgdG8gcGF0Y2ggRFRTIGZvciBS
YXNwYmVycnkuPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+MDUuMTEuMjAyMCwgMDk6MDMsICJraGFk
ZXIgYmFzaGEgc2hhaWsiICZsdDtzaGFpa2toYWRlcmJhc2hhNjAxQGdtYWlsLmNvbSZndDs6PC9k
aXY+PGJsb2NrcXVvdGU+PGRpdj5IacKgVGVhbSw8ZGl2PsKgPC9kaXY+PGRpdj48ZGl2IHN0eWxl
PSJib3gtc2l6aW5nOmJvcmRlci1ib3g7Zm9udC1mYW1pbHk6J3NlZ29lIHVpJyAsICdzeXN0ZW0t
dWknICwgJ2FwcGxlIGNvbG9yIGVtb2ppJyAsICdzZWdvZSB1aSBlbW9qaScgLCBzYW5zLXNlcmlm
O2ZvbnQtc2l6ZToxNHB4Ij53ZSBhcmUgdHJ5aW5nIHRvIGNvbnRyb2wgb3VyIGJvYXJkIHdpdGgg
UlBJIGJtYy53ZSBhcmUgdHJ5aW5nIHRvIGNvbnRyb2wgcG93ZXIgb24sIG9mZiBhbmQgcmVzZXTC
oDwvZGl2PjwvZGl2PjxkaXYgc3R5bGU9ImJveC1zaXppbmc6Ym9yZGVyLWJveDtmb250LWZhbWls
eTonc2Vnb2UgdWknICwgJ3N5c3RlbS11aScgLCAnYXBwbGUgY29sb3IgZW1vamknICwgJ3NlZ29l
IHVpIGVtb2ppJyAsIHNhbnMtc2VyaWY7Zm9udC1zaXplOjE0cHgiPsKgPC9kaXY+PGRpdiBzdHls
ZT0iYm94LXNpemluZzpib3JkZXItYm94O2ZvbnQtZmFtaWx5OidzZWdvZSB1aScgLCAnc3lzdGVt
LXVpJyAsICdhcHBsZSBjb2xvciBlbW9qaScgLCAnc2Vnb2UgdWkgZW1vamknICwgc2Fucy1zZXJp
Zjtmb250LXNpemU6MTRweCI+PGRpdiBzdHlsZT0iYm94LXNpemluZzpib3JkZXItYm94Ij53ZSBj
b21waWxlZCB4ODYtcG93ZXItY29udHJvbCB3aXRoIG9wZW5ibWMgYW5kIGNyZWF0ZSBhIHBhdGNo
IGZvciB0aGUgc2FuZSB3aXRoIHRoZSBHUElPIG5hbWUgInB3bTBfZ3BpbzQwIi4gYW5kIHdoZW4g
d2UgYXJlIHRyeSB0byB1c2UgdGhpcy48L2Rpdj48ZGl2IHN0eWxlPSJib3gtc2l6aW5nOmJvcmRl
ci1ib3giPndlIGFyZSBmYWNpbmcgdGhlIGJlbG93IGVycm9yLjwvZGl2PjxkaXYgc3R5bGU9ImJv
eC1zaXppbmc6Ym9yZGVyLWJveCI+wqA8L2Rpdj48ZGl2IHN0eWxlPSJib3gtc2l6aW5nOmJvcmRl
ci1ib3giPjxkaXYgc3R5bGU9ImJveC1zaXppbmc6Ym9yZGVyLWJveCI+PGRpdj48YSBocmVmPSJt
YWlsdG86cm9vdEBha2t5IiByZWw9Im5vb3BlbmVyIG5vcmVmZXJyZXIiPnJvb3RAYWtreTwvYT46
fiMgc3lzdGVtY3RsIHN0YXR1cyB4eXoub3BlbmJtY19wcm9qZWN0LkNoYXNzaXMuQ29udHJvbC5Q
b3dlci5zZXJ2aWNlPGJyIC8+4pePIHh5ei5vcGVuYm1jX3Byb2plY3QuQ2hhc3Npcy5Db250cm9s
LlBvd2VyLnNlcnZpY2UgLSBQb3dlciBDb250cm9sPGJyIC8+TG9hZGVkOiBsb2FkZWQgKC9saWIv
c3lzdGVtZC9zeXN0ZW0veHl6Lm9wZW5ibWNfcHJvamVjdC5DaGFzc2lzLkNvbnRyb2wuUG93ZXIu
c2VydmljZTsgZW5hYmxlZDsgdmVuZG9yIHByZXNldDogZW5hYmxlZCk8YnIgLz5BY3RpdmU6IGZh
aWxlZCAoUmVzdWx0OiBleGl0LWNvZGUpIHNpbmNlIFRodSAxOTcwLTAxLTAxIDAwOjAwOjEzIFVU
QzsgMzNzIGFnbzxiciAvPlByb2Nlc3M6IDMxMCBFeGVjU3RhcnQ9L3Vzci9iaW4vcG93ZXItY29u
dHJvbCAoY29kZT1leGl0ZWQsIHN0YXR1cz0yNTUvRVhDRVBUSU9OKTxiciAvPk1haW4gUElEOiAz
MTAgKGNvZGU9ZXhpdGVkLCBzdGF0dXM9MjU1L0VYQ0VQVElPTik8L2Rpdj48ZGl2PjxkaXY+wqA8
L2Rpdj48ZGl2PjxkaXY+SmFuIDAxIDAwOjAwOjEzIGFra3kgc3lzdGVtZFsxXTogeHl6Lm9wZW5i
bWNfcHJvamVjdC5DaGFzc2lzLkNvbnRyb2wuUG93ZXIuc2VydmljZTogU2NoZWR1bGVkIHJlc3Rh
cnQgam9iLCByZXN0YXJ0IGNvdW50ZXIgaXMgYXQgMi48YnIgLz5KYW4gMDEgMDA6MDA6MTMgYWtr
eSBzeXN0ZW1kWzFdOiBTdG9wcGVkIFBvd2VyIENvbnRyb2wuPGJyIC8+SmFuIDAxIDAwOjAwOjEz
IGFra3kgc3lzdGVtZFsxXTogeHl6Lm9wZW5ibWNfcHJvamVjdC5DaGFzc2lzLkNvbnRyb2wuUG93
ZXIuc2VydmljZTogU3RhcnQgcmVxdWVzdCByZXBlYXRlZCB0b28gcXVpY2tseS48YnIgLz5KYW4g
MDEgMDA6MDA6MTMgYWtreSBzeXN0ZW1kWzFdOiB4eXoub3BlbmJtY19wcm9qZWN0LkNoYXNzaXMu
Q29udHJvbC5Qb3dlci5zZXJ2aWNlOiBGYWlsZWQgd2l0aCByZXN1bHQgJ2V4aXQtY29kZScuPGJy
IC8+SmFuIDAxIDAwOjAwOjEzIGFra3kgc3lzdGVtZFsxXTogRmFpbGVkIHRvIHN0YXJ0IFBvd2Vy
IENvbnRyb2wuPGJyIC8+PGEgaHJlZj0ibWFpbHRvOnJvb3RAYWtreSIgcmVsPSJub29wZW5lciBu
b3JlZmVycmVyIj5yb290QGFra3k8L2E+On4jIC91c3IvYmluL3Bvd2VyLWNvbnRyb2wgLWg8YnIg
Lz5TdGFydCBDaGFzc2lzIHBvd2VyIGNvbnRyb2wgc2VydmljZS4uLjxiciAvPkZhaWxlZCB0byBm
aW5kIHRoZSBwd20wX2dwaW80MCBsaW5lPC9kaXY+PC9kaXY+PC9kaXY+PGRpdj7CoDwvZGl2Pjxk
aXY+Q291bGQgc29tZW9uZSBoZWxwIG1lIGhvdyB0byBmaXggdGhpcyBvciBzb21lIHBvaW50ZXJz
IHJlZ2FyZGluZyB0aGlzIGVycm9yLjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkFsc28gaXMgcGh5
c2NpYWzCoGNvbm5lY3Rpb24gYmV0d2VlbiB0aGUgYm1jIGFuZCB0aGUgc2VydmVyIGlzIG5lZWRl
ZCBvciB3ZSBjYW4gdGVzdCB0aGlzIHRocm91Z2ggc29tZW90aGVywqB3YXkuPC9kaXY+PGRpdj7C
oDwvZGl2PjxkaXY+VGhhbmtzICZhbXA7IFJlZ2FyZHMsPC9kaXY+PGRpdj5LaGFkZXIgQiBTaGFp
azwvZGl2PjxkaXY+wqA8L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+
PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2Pi0twqA8L2Rpdj48ZGl2PkJlc3QgcmVnYXJk
cyw8L2Rpdj48ZGl2PktvbnN0YW50aW4gS2x1Ym5pY2hraW4sPC9kaXY+PGRpdj5sZWFkIGZpcm13
YXJlIGVuZ2luZWVyLDwvZGl2PjxkaXY+c2VydmVyIGhhcmR3YXJlIFImYW1wO0QgZ3JvdXAsPC9k
aXY+PGRpdj5ZYW5kZXggTW9zY293IG9mZmljZS48L2Rpdj48ZGl2PnRlbDogKzctOTAzLTUxMC0z
My0zMzwvZGl2PjxkaXY+wqA8L2Rpdj4=
