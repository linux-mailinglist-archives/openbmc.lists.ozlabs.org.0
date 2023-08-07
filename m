Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E55BC771D40
	for <lists+openbmc@lfdr.de>; Mon,  7 Aug 2023 11:38:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=Ux/R6Gzn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKB8R5VX9z30QQ
	for <lists+openbmc@lfdr.de>; Mon,  7 Aug 2023 19:38:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru header.a=rsa-sha256 header.s=default header.b=Ux/R6Gzn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=yandex-team.ru (client-ip=178.154.239.72; helo=forwardcorp1a.mail.yandex.net; envelope-from=kitsok@yandex-team.ru; receiver=lists.ozlabs.org)
X-Greylist: delayed 85 seconds by postgrey-1.37 at boromir; Mon, 07 Aug 2023 19:37:55 AEST
Received: from forwardcorp1a.mail.yandex.net (forwardcorp1a.mail.yandex.net [178.154.239.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKB7l5tJqz2ygX
	for <openbmc@lists.ozlabs.org>; Mon,  7 Aug 2023 19:37:55 +1000 (AEST)
Received: from mail-nwsmtp-mxback-corp-main-91.vla.yp-c.yandex.net (mail-nwsmtp-mxback-corp-main-91.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:2a84:0:640:934d:0])
	by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 800585F330;
	Mon,  7 Aug 2023 12:36:19 +0300 (MSK)
Received: from mail.yandex-team.ru (2a02:6b8:c0d:11d:0:640:2a63:0 [2a02:6b8:c0d:11d:0:640:2a63:0])
	by mail-nwsmtp-mxback-corp-main-91.vla.yp-c.yandex.net (mxbackcorp/Yandex) with HTTP id AaTRqF0OvKo0-OfPUjbW7;
	Mon, 07 Aug 2023 12:36:19 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru; s=default;
	t=1691400979; bh=l+dE3tdFD9BoRS6T6dZmmdL9J99yI2i7MEk2G8MXckw=;
	h=References:Date:Message-Id:Subject:In-Reply-To:To:From;
	b=Ux/R6GznW4EQBP4SHeh+NFBf2QrBqRCIMpKKqpdvF49wXTNKMoYPsULSAT5S8Axxm
	 T0gcHppZ8BA89NSNv+ilT0aGhLdnLPGeNK2XRBEo2K9SwP6EZ8frDfnYd5wq0wbj6z
	 fc6VxH98bFMQjDRFhttlmMDD3aWnw77HoThzX3GM=
Authentication-Results: mail-nwsmtp-mxback-corp-main-91.vla.yp-c.yandex.net; dkim=pass header.i=@yandex-team.ru
Received: from ij3urkvf4buhbqq7.myt.yp-c.yandex.net (ij3urkvf4buhbqq7.myt.yp-c.yandex.net [2a02:6b8:c12:5c13:0:640:9e3f:0])
	by mail-nwsmtp-mxback-corp-main-58.myt.yp-c.yandex.net (mxbackcorp/Yandex) with HTTP id YZT3eK0OtmI0-8ZhTKso2
	for <kitsok@yandex-team.ru>; Mon, 07 Aug 2023 12:36:09 +0300
Received: by ij3urkvf4buhbqq7.myt.yp-c.yandex.net with HTTP;
	Mon, 07 Aug 2023 12:36:09 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: Zheng Bao <fishbaoz@hotmail.com>,
	OpenBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <DM4PR11MB6502BB76DEA9A44FEA5EBC3DCD09A@DM4PR11MB6502.namprd11.prod.outlook.com>
References: <DM4PR11MB6502BB76DEA9A44FEA5EBC3DCD09A@DM4PR11MB6502.namprd11.prod.outlook.com>
Subject: Re: How can the fru.yaml is converted to a binary which goes into EEPROM?
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 07 Aug 2023 11:36:19 +0200
Message-Id: <11621691400422@mail.yandex-team.ru>
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

PGRpdj5IZWxsbyBaaGVuZyw8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5JbiBvdXIgc2VydmVycyB3
ZSBwcm9ncmFtIEZSVSBFRVBST00gYXQgdGhlIGZhY3RvcnkuIFRoZSBiaW5hcnkgaW1hZ2UgaXMg
Z2VuZXJhdGVkIHVzaW5nICJmcnVnZW4iIHRvb2w6IDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNv
bS9pcG1pdG9vbC9mcnVnZW4iIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxh
bmsiPmh0dHBzOi8vZ2l0aHViLmNvbS9pcG1pdG9vbC9mcnVnZW48L2E+PC9kaXY+PGRpdj5Bbm90
aGVyIGFwcHJvYWNoIHdlIHVzZSBpcyB0byB3cml0ZSBlbXB0eSAoYnV0IHN0cnVjdHVyYWxseSBj
b3JyZWN0KSBiaW5hcnkgaW1hZ2UgdXBvbiB0aGUgZmlyc3QgQk1DIHBvd2VyIHVwLCB0aGVuIHRo
ZSBCTUMgY2FuIGJlIHJlYWNoZWQgdXNpbmcgSVB2NiBsaW5rLWxvY2FsIGFkZHJlc3MgYW5kIHRo
ZW4gImlwbWl0b29sIGZydSB3cml0ZSIgY29tbWFuZCBjYW4gYmUgdXNlZCB0byBwcm9ncmFtIHRo
ZSByZWFsIEZSVSBpbWFnZSB3aXRob3V0IGFjY2Vzc2luZyBCTUMgY29uc29sZS48L2Rpdj48ZGl2
PsKgPGRpdj5JIGRvbid0IGtub3cgwqB3aGF0J3MgZ29pbmcgb24gd2l0aCBZQU1MIGZpbGVzIGZy
b20gZXRoYW5vbHgtaXBtaS1mcnUgdGhvdWdoLjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkhvcGUg
dGhpcyBjYW4gaGVscC48L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj4wNC4wOC4yMDIzLCAwNzowNiwg
IlpoZW5nIEJhbyIgJmx0O2Zpc2hiYW96QGhvdG1haWwuY29tJmd0Ozo8L2Rpdj48YmxvY2txdW90
ZT48ZGl2PjxkaXYgc3R5bGU9ImNvbG9yOnJnYiggMCAsIDAgLCAwICk7Zm9udC1mYW1pbHk6J2Nh
bGlicmknICwgJ2hlbHZldGljYScgLCBzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxMnB0Ij48YSBocmVm
PSJodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL2Jsb2IvbWFzdGVyL21ldGEtYW1k
L21ldGEtZXRoYW5vbHgvcmVjaXBlcy1waG9zcGhvci9jb25maWd1cmF0aW9uL2V0aGFub2x4LXlh
bWwtY29uZmlnL2V0aGFub2x4LWlwbWktZnJ1LnlhbWwiIHJlbD0ibm9vcGVuZXIgbm9yZWZlcnJl
ciI+b3BlbmJtYy9tZXRhLWFtZC9tZXRhLWV0aGFub2x4L3JlY2lwZXMtcGhvc3Bob3IvY29uZmln
dXJhdGlvbi9ldGhhbm9seC15YW1sLWNvbmZpZy9ldGhhbm9seC1pcG1pLWZydS55YW1sIGF0IG1h
c3RlciDCtyBvcGVuYm1jL29wZW5ibWMgKGdpdGh1Yi5jb20pPC9hPjwvZGl2PjxkaXYgc3R5bGU9
ImNvbG9yOnJnYiggMCAsIDAgLCAwICk7Zm9udC1mYW1pbHk6J2NhbGlicmknICwgJ2hlbHZldGlj
YScgLCBzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxMnB0Ij7CoDwvZGl2PjxkaXYgc3R5bGU9ImNvbG9y
OnJnYiggMCAsIDAgLCAwICk7Zm9udC1mYW1pbHk6J2NhbGlicmknICwgJ2hlbHZldGljYScgLCBz
YW5zLXNlcmlmO2ZvbnQtc2l6ZToxMnB0Ij5UbyBtYWtlIHRoZSBpbnZlbnRvcnkgZGVmaW5lZCBp
biB0aGUgeWFtbCBnbyB0byBEYnVzLCB3ZSBuZWVkIHRvIGJ1cm4gYSBmcnUuYmluIGludG8gdGhl
IGVlcHJvbSwgcmlnaHQ/PC9kaXY+PGRpdiBzdHlsZT0iY29sb3I6cmdiKCAwICwgMCAsIDAgKTtm
b250LWZhbWlseTonY2FsaWJyaScgLCAnaGVsdmV0aWNhJyAsIHNhbnMtc2VyaWY7Zm9udC1zaXpl
OjEycHQiPsKgPC9kaXY+PGRpdiBzdHlsZT0iY29sb3I6cmdiKCAwICwgMCAsIDAgKTtmb250LWZh
bWlseTonY2FsaWJyaScgLCAnaGVsdmV0aWNhJyAsIHNhbnMtc2VyaWY7Zm9udC1zaXplOjEycHQi
PklmIHllcywgaG93IHRoZSBiaW5hcnkgZnJ1LmJpbiBpcyBnZW5lcmF0ZWQ/PC9kaXY+PGRpdiBz
dHlsZT0iY29sb3I6cmdiKCAwICwgMCAsIDAgKTtmb250LWZhbWlseTonY2FsaWJyaScgLCAnaGVs
dmV0aWNhJyAsIHNhbnMtc2VyaWY7Zm9udC1zaXplOjEycHQiPsKgPC9kaXY+PGRpdiBzdHlsZT0i
Y29sb3I6cmdiKCAwICwgMCAsIDAgKTtmb250LWZhbWlseTonY2FsaWJyaScgLCAnaGVsdmV0aWNh
JyAsIHNhbnMtc2VyaWY7Zm9udC1zaXplOjEycHQiPlRoYW5rcy48L2Rpdj48ZGl2IHN0eWxlPSJj
b2xvcjpyZ2IoIDAgLCAwICwgMCApO2ZvbnQtZmFtaWx5OidjYWxpYnJpJyAsICdoZWx2ZXRpY2En
ICwgc2Fucy1zZXJpZjtmb250LXNpemU6MTJwdCI+wqA8L2Rpdj48ZGl2IHN0eWxlPSJjb2xvcjpy
Z2IoIDAgLCAwICwgMCApO2ZvbnQtZmFtaWx5OidjYWxpYnJpJyAsICdoZWx2ZXRpY2EnICwgc2Fu
cy1zZXJpZjtmb250LXNpemU6MTJwdCI+Wmhlbmc8L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PGRp
dj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48L2Rpdj48ZGl2Pi0twqA8L2Rpdj48ZGl2PkJlc3QgcmVn
YXJkcyw8L2Rpdj48ZGl2PktvbnN0YW50aW4gS2x1Ym5pY2hraW4sPC9kaXY+PGRpdj5sZWFkIGZp
cm13YXJlIGVuZ2luZWVyLDwvZGl2PjxkaXY+c2VydmVyIGhhcmR3YXJlIFImYW1wO0QgZ3JvdXAs
PC9kaXY+PGRpdj5OZWJpdXM8L2Rpdj48ZGl2PnRlbDogKzMxLTY4NC01MTUtNzQwPC9kaXY+
