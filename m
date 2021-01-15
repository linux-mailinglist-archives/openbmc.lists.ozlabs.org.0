Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A062F7748
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 12:13:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHJTV1zz4zDsfs
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 22:13:50 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=default header.b=lrRTZPIK; 
 dkim-atps=neutral
X-Greylist: delayed 95 seconds by postgrey-1.36 at bilbo;
 Fri, 15 Jan 2021 22:10:28 AEDT
Received: from forwardcorp1o.mail.yandex.net (forwardcorp1o.mail.yandex.net
 [95.108.205.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHJPg2LkPzDscS
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2021 22:10:27 +1100 (AEDT)
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 85A1C2E14A6;
 Fri, 15 Jan 2021 14:08:35 +0300 (MSK)
Received: from localhost (localhost [::1])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 memcj4htCN-8ZxSwnN9; Fri, 15 Jan 2021 14:08:35 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1610708915; bh=uigaEEU4n2xulIQYNr9YDu54pJY8cS3n4Jxwdz6Qwew=;
 h=Subject:In-Reply-To:Date:References:To:From:Message-Id;
 b=lrRTZPIK/+Q1WQ6LKD7naf67bycaAhEL25J6mqfDm7qYAWurionBeYW1jF1g/zAsu
 MwHXle7Zfnld+TdVJvpa+EEHkTGtrscESnSGWPlpBbb4t6B7Na0i1lrGuxvg7v2MJu
 5FbGUpxCS3qR2DzyHqJFOk/YGi6m8HBkeuGIKh1g=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from sas1-ec30c78b6c5b.qloud-c.yandex.net
 (sas1-ec30c78b6c5b.qloud-c.yandex.net [2a02:6b8:c14:2704:0:640:ec30:c78b])
 by sas1-c3eab8bf7b15.qloud-c.yandex.net with LMTP id Wj4GDDeLvC-MzgIgcr0
 for <kitsok@yandex-team.ru>; Fri, 15 Jan 2021 14:08:25 +0300
Received: by sas1-1199a7868807.qloud-c.yandex.net with HTTP;
 Fri, 15 Jan 2021 14:08:24 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: Shakeeb B K <shakeebbk@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
In-Reply-To: <CABYu0WhdNyNpJ7n1_LAW2eDv5J9uSmSKDQbMHhjLb6N_moB=ig@mail.gmail.com>
References: <CABYu0WhdNyNpJ7n1_LAW2eDv5J9uSmSKDQbMHhjLb6N_moB=ig@mail.gmail.com>
Subject: Re: Hot plug support for aspeed-smc driver
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Fri, 15 Jan 2021 14:08:34 +0300
Message-Id: <4851610708480@mail.yandex-team.ru>
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

PGRpdj5IZWxsbyE8L2Rpdj48ZGl2Plllcy48L2Rpdj48ZGl2PkkndmUgcGF0Y2hlZCBTTUMgZHJp
dmVyIHRvIG5vdCBkZS1pbnN0YW50aWF0ZSB3aGF0IGl0IGNyZWF0ZWQgaWYgZmF1bHR5IGZsYXNo
IGlzIGRldGVjdGVkLjwvZGl2PjxkaXY+V2l0aCB0aGlzIHBhdGNoIHRoZSBkcml2ZXIgbG9hZHMg
d2l0aCBlcnJvciBhbmQgdGhlbiwgd2hlbiBJIG5lZWQgdG8gYWNjZXNzIFNQSSBmbGFzaCwgSSBq
dXN0IGRlLWluc3RhbnRpYXRlL2luc3RhbnRpYXRlIGZsYXNoIGRldmljZSB2aWEgc3lzZnMgbGlr
ZSB0aGlzOjwvZGl2PjxkaXY+PGRpdj48ZGl2PsKgPC9kaXY+PGRpdj5TUElfREVWPSIxZTYzMDAw
MC5zcGkiPC9kaXY+PGRpdj5TUElfUEFUSD0iL3N5cy9idXMvcGxhdGZvcm0vZHJpdmVycy9hc3Bl
ZWQtc21jIjwvZGl2PjwvZGl2PjxkaXY+ZWNobyAkU1BJX0RFViAmZ3Q7ICRTUElfUEFUSC91bmJp
bmQgIyBVbmJpbmQgZGV2aWNlPC9kaXY+PGRpdj48ZGl2PmVjaG8gJFNQSV9ERVYgJmd0OyAkU1BJ
X1BBVEgvYmluZCAjIEJpbmQgZGV2aWNlPC9kaXY+PC9kaXY+PC9kaXY+PGRpdj7CoDwvZGl2Pjxk
aXY+SGVyZSBpcyB0aGUgcGF0Y2g8L2Rpdj48ZGl2Pj09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PC9kaXY+PGRpdj48ZGl2PmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvbnRy
b2xsZXJzL2FzcGVlZC1zbWMuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvYXNw
ZWVkLXNtYy5jPC9kaXY+PGRpdj5pbmRleCAwODA1ZGNhLi40MGE5YzVjIDEwMDY0NDwvZGl2Pjxk
aXY+LS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb250cm9sbGVycy9hc3BlZWQtc21jLmM8L2Rp
dj48ZGl2PisrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29udHJvbGxlcnMvYXNwZWVkLXNtYy5j
PC9kaXY+PGRpdj5AQCAtMTMyMSw4ICsxMzIxLDExIEBAIHN0YXRpYyBpbnQgYXNwZWVkX3NtY19z
ZXR1cF9mbGFzaChzdHJ1Y3QgYXNwZWVkX3NtY19jb250cm9sbGVyICpjb250cm9sbGVyLDwvZGl2
PjxkaXY+fTwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PmlmIChyZXQpIHs8IS0tIC0tPjwvZGl2Pjxk
aXY+LSBvZl9ub2RlX3B1dChjaGlsZCk7PC9kaXY+PGRpdj4tIGFzcGVlZF9zbWNfdW5yZWdpc3Rl
cihjb250cm9sbGVyKTs8L2Rpdj48ZGl2PisgLyogQXMgaXQncyB0aGUgY29udHJvbGxlciB3ZSdy
ZSBmbHlpbmcgb24sIGl0IGRvZXNuJ3QgbWFrZSBzZW5zZSB0byB1bnJlZ2lzdGVyIGluIGNhc2Ug
b2YgZXJyb3JzOjwvZGl2PjxkaXY+KyBJZiB3ZSBkb24ndCBoYXZlIGZsYXNoIHdpdGggcm9vdGZz
IC0gd2UnbGwgZGllIGluIGtlcm5lbCBwYW5pYyBkdWUgdG8gbWlzc2luZyByb290ZnMuPC9kaXY+
PGRpdj4rIElmIEJNQyBjaGlwIGlzIE9LIGFuZCBvdGhlcnMgYXJlIG1pc3NpbmcgLSBpdCdzIGZp
bmUsIHdlIGNhbiBjb250aW51ZS48L2Rpdj48ZGl2PisgKi88L2Rpdj48ZGl2PisgcmV0dXJuIDA7
PC9kaXY+PGRpdj59PC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+cmV0dXJuIHJldDs8L2Rpdj48ZGl2
Pi0tPC9kaXY+PGRpdj4yLjcuNDwvZGl2PjxkaXY+PGRpdj49PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PTwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PsKgPC9kaXY+PC9kaXY+PGRpdj7CoDwvZGl2
PjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjE1LjAxLjIwMjEsIDEzOjQzLCAiU2hha2VlYiBCIEsi
ICZsdDtzaGFrZWViYmtAZ21haWwuY29tJmd0Ozo8L2Rpdj48YmxvY2txdW90ZT48ZGl2PkhpIEFs
bCw8ZGl2PsKgPC9kaXY+PGRpdj5XZSBoYXZlIGEgdXNlIGNhc2UgZm9yIGR5bmFtaWMgZW5hYmxp
bmcvZGlzYWJsaW5nIGFjY2VzcyB0byBzcGkgbm9yIGZsYXNoIHVzaW5nIGFuIGV4dGVybmFsIG11
eC48L2Rpdj48ZGl2PlRoaXMgaXMgbWFpbmx5IGZvciBkYXRhIGZsYXNoIGFjY2Vzc8Kgb3ZlciBz
cGkgY29udHJvbGxlci7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PlNpbmNlIHdlIHVzZSBhc3Bl
ZWQtc21jIGRyaXZlciBmb3IgYm90aCBmbWMgYW5kIHNtYywgd2UgY2Fubm90IG1ha2UgaXQgbG9h
ZGFibGUgYXMgb2Ygbm93LjwvZGl2PjxkaXY+SXMgdGhlcmUgYW55IHdheSB0byBoYW5kbGUgdGhp
cyBvdGhlciB0aGFuIHdyaXRpbmcgYSBuZXcgaW1wbGVtZW50YXRpb24gZm9yIHNwaSBjb250cm9s
bGVyPzwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PlRoYW5rcyw8L2Rpdj48ZGl2PlNoYWtlZWI8L2Rp
dj48L2Rpdj48L2Jsb2NrcXVvdGU+PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2Pi0twqA8
L2Rpdj48ZGl2PkJlc3QgcmVnYXJkcyw8L2Rpdj48ZGl2PktvbnN0YW50aW4gS2x1Ym5pY2hraW4s
PC9kaXY+PGRpdj5sZWFkIGZpcm13YXJlIGVuZ2luZWVyLDwvZGl2PjxkaXY+c2VydmVyIGhhcmR3
YXJlIFImYW1wO0QgZ3JvdXAsPC9kaXY+PGRpdj5ZYW5kZXggTW9zY293IG9mZmljZS48L2Rpdj48
ZGl2PnRlbDogKzctOTAzLTUxMC0zMy0zMzwvZGl2PjxkaXY+wqA8L2Rpdj4=
