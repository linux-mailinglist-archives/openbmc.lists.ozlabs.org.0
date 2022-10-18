Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E3160299B
	for <lists+openbmc@lfdr.de>; Tue, 18 Oct 2022 12:47:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ms9Y041v0z3c5p
	for <lists+openbmc@lfdr.de>; Tue, 18 Oct 2022 21:47:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=cPbrzIYN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yandex-team.ru (client-ip=178.154.239.72; helo=forwardcorp1a.mail.yandex.net; envelope-from=kitsok@yandex-team.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=cPbrzIYN;
	dkim-atps=neutral
X-Greylist: delayed 103 seconds by postgrey-1.36 at boromir; Tue, 18 Oct 2022 21:46:45 AEDT
Received: from forwardcorp1a.mail.yandex.net (forwardcorp1a.mail.yandex.net [178.154.239.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ms9XQ01Z3z3bjw
	for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2022 21:46:45 +1100 (AEDT)
Received: from vla3-850de775f4df.qloud-c.yandex.net (vla3-850de775f4df.qloud-c.yandex.net [IPv6:2a02:6b8:c15:341d:0:640:850d:e775])
	by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 163705FE63;
	Tue, 18 Oct 2022 13:44:49 +0300 (MSK)
Received: from mail.yandex-team.ru (mail.yandex-team.ru [2a02:6b8:b081:a510::1:37])
	by vla3-850de775f4df.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id kiduX102wW21-in2On7ai;
	Tue, 18 Oct 2022 13:44:49 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru; s=default;
	t=1666089889; bh=iUl6aCjDKN80xZb0gd4Tz+0RxayWOPV0M7W19Lv6xB0=;
	h=References:Date:Message-Id:Subject:In-Reply-To:To:From;
	b=cPbrzIYNVHPMBHhY+oqblCCEcwGqR2QWaR3ceyqzW7YazvzecoAWcpcISz51G1hRT
	 pn+M299GRejX0CgWP6+/N+Slk41AmsnjjxAXK42SJNVthN00fP3WSzf44YURRQTiQQ
	 W7vbkCiRN/w1CScN8BtvkAOrvOQyp/a5M80Mo0Mw=
Authentication-Results: vla3-850de775f4df.qloud-c.yandex.net; dkim=pass header.i=@yandex-team.ru
Received: from qitgvz6tzqgj5t6m.vla.yp-c.yandex.net (qitgvz6tzqgj5t6m.vla.yp-c.yandex.net [2a02:6b8:c1f:6255:0:640:95c3:0])
	by vla3-850de775f4df.qloud-c.yandex.net (mxbackcorp/Yandex) with HTTP id TidoX102vSw1-TWCxOIF6
	for <kitsok@yandex-team.ru>; Tue, 18 Oct 2022 13:44:39 +0300
Received: by qitgvz6tzqgj5t6m.vla.yp-c.yandex.net with HTTP;
	Tue, 18 Oct 2022 13:44:39 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: i.kononenko <i.kononenko@yadro.com>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
In-Reply-To: <df77021c-a86b-1a03-9960-acdf6c324600@yadro.com>
References: <60926e52-9d00-2b20-e8ac-7fd515ddac78@yadro.com>
	 <CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com>
	 <3c0b0dc3-a31d-dcfb-608b-53436074397b@linux.intel.com>
	 <34751627996896@mail.yandex-team.ru> <df77021c-a86b-1a03-9960-acdf6c324600@yadro.com>
Subject: Re: Installing Windows Server 2019 from a remotely mounted ISO
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 18 Oct 2022 12:44:49 +0200
Message-Id: <9921666089829@mail.yandex-team.ru>
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

PGRpdj5IZWxsbywgSWdvciE8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5EaWQgeW91IHN1Y2NlZWQg
dG8gaW5jbHVkZSB0aGlzIHBhY2hzZXQgaW50byB1cHN0cmVhbT88L2Rpdj48ZGl2PlRoYW5rIHlv
dSE8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj4wMy4wOC4yMDIxLCAxNTo1MywgImkua29ub25lbmtv
IiAmbHQ7aS5rb25vbmVua29AeWFkcm8uY29tJmd0Ozo8L2Rpdj48YmxvY2txdW90ZT48cD5IZWxs
byBLb25zdGFudGluLDxiciAvPjxiciAvPkkgaGF2ZSBzZXZlcmFsIHBhdGNoZXMgWzFdIHRvIHNv
bHZlcyBtb3VudGluZyBEVkQtYmFzZWQgSVNPcyB0aHJvdWdoIFZpcnR1YWwgTWVkaWEuPGJyIC8+
VGhlIHB1Ymxpc2hlZCBjaGFuZ2VzIGlzIFdJUCB1bnRpbCBoYWQgYXBwcm92ZWQgYnkgdGhlIExp
bnV4IEZvdW5kYXRpb24gY29tbXVuaXR5LDxiciAvPmJ1dCBpbiB0aGUgWUFEUk8sIHdlIHVzZSB0
aGVzZSBjaGFuZ2VzIHRvIHN1cHBvcnQgaW5zdGFsbGluZyB0aGUgT1MgV2luZG93cyB2aWE8YnIg
Lz5WaXJ0dWFsIE1lZGlhLjxiciAvPjxiciAvPjxiciAvPkkgaG9wZSB5b3VyIHdpbGwgZm91bmQg
aXQgaGVscGZ1bCB0aGF0IGluZm9ybWF0aW9uIHRvIHN1cHBvcnQgaW5zdGFsbGluZyBXaW5kb3dz
LWJhc2VkIE9TLjxiciAvPjxiciAvPkxpbmtzOjxiciAvPlsxXSAtIDxhIGhyZWY9Imh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC11c2IvbGlzdC8/c2VyaWVzPTUwNzU4
MyIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj5odHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L3Byb2plY3QvbGludXgtdXNiL2xpc3QvP3Nlcmllcz01MDc1ODM8L2E+PGJyIC8+wqA8L3A+PHA+
wqA8L3A+LS08YnIgLz5CZXN0IHJlZ2FyZHMsPGJyIC8+PGJyIC8+SWdvciBLb25vbmVua288L2Js
b2NrcXVvdGU+PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2Pi0twqA8L2Rpdj48ZGl2PkJl
c3QgcmVnYXJkcyw8L2Rpdj48ZGl2PktvbnN0YW50aW4gS2x1Ym5pY2hraW4sPC9kaXY+PGRpdj5s
ZWFkIGZpcm13YXJlIGVuZ2luZWVyLDwvZGl2PjxkaXY+c2VydmVyIGhhcmR3YXJlIFImYW1wO0Qg
Z3JvdXAsPC9kaXY+PGRpdj5ZYW5kZXggTW9zY293IG9mZmljZS48L2Rpdj48ZGl2PnRlbDogKzct
OTAzLTUxMC0zMy0zMzwvZGl2PjxkaXY+wqA8L2Rpdj4=
