Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BD7325291
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 16:42:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmcVb4r6Lz3cb5
	for <lists+openbmc@lfdr.de>; Fri, 26 Feb 2021 02:42:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bisyst.ru header.i=@bisyst.ru header.a=rsa-sha256 header.s=mail header.b=hfFOUe9T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bisyst.ru (client-ip=5.45.198.251;
 helo=forward501j.mail.yandex.net; envelope-from=pavlov@bisyst.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bisyst.ru header.i=@bisyst.ru header.a=rsa-sha256
 header.s=mail header.b=hfFOUe9T; dkim-atps=neutral
X-Greylist: delayed 400 seconds by postgrey-1.36 at boromir;
 Fri, 26 Feb 2021 02:42:19 AEDT
Received: from forward501j.mail.yandex.net (forward501j.mail.yandex.net
 [5.45.198.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmcVM05hrz3cMQ
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2021 02:42:17 +1100 (AEDT)
Received: from iva5-13ec62da2ad0.qloud-c.yandex.net
 (iva5-13ec62da2ad0.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:9304:0:640:13ec:62da])
 by forward501j.mail.yandex.net (Yandex) with ESMTP id BB5AF33803AD;
 Thu, 25 Feb 2021 18:35:27 +0300 (MSK)
Received: from mail.yandex.ru (mail.yandex.ru [46.148.198.118])
 by iva5-13ec62da2ad0.qloud-c.yandex.net (mxback/Yandex) with HTTP id
 OZmZBR0IiOs1-ZQIqS5Ag; Thu, 25 Feb 2021 18:35:26 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bisyst.ru; s=mail;
 t=1614267326; bh=k2v3OfvCPS4w9/0bSGa8VBJ2gibft8E8tmc/Y43m4JM=;
 h=References:Date:Message-Id:Subject:In-Reply-To:To:From;
 b=hfFOUe9T4+Pd8uqPzvr17st9dn44W0OJFpJbcui0s4TqA9dvx86P4Ma9x3jMcaK3N
 fKxu/Gbk5YAvhGvyIz2Yw2A8dzvq39zyboPmVP4avWl2ObnZZE1ozCtKN9hIi6LUg5
 WNX6JfKSiRwdW13AF7ksHM9qlhlIpcQ6cqeXuhlw=
Authentication-Results: iva5-13ec62da2ad0.qloud-c.yandex.net;
 dkim=pass header.i=@bisyst.ru
Received: by iva6-22e79380f52c.qloud-c.yandex.net with HTTP;
 Thu, 25 Feb 2021 18:35:26 +0300
From: =?utf-8?B?0J3QuNC60LjRgtCwINCf0LDQstC70L7Qsg==?= <pavlov@bisyst.ru>
To: Parishrut Bhatia <parishrutb@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
In-Reply-To: <CA+FKyEV8xSPOOZCknSq93Y0EkbTGATi5w_SHHyaJrHOsQ7VqeA@mail.gmail.com>
References: <CA+FKyEWtGpmB9P4YUryOprn7GG604f27MV27KAG6bs72zNo_ew@mail.gmail.com>
 <CA+FKyEV8xSPOOZCknSq93Y0EkbTGATi5w_SHHyaJrHOsQ7VqeA@mail.gmail.com>
Subject: Re: Requesting feedback on in-progress GUI designs (Hardware status
 and inventory)
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 25 Feb 2021 18:35:26 +0300
Message-Id: <188251614267283@mail.yandex.ru>
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

PGRpdj48ZGl2Pm5pa2l0YUB1YnVudHU6fi9ibWN3ZWIkIG5pbmphIC1DIGJ1aWxkZGlyPC9kaXY+
PGRpdj5uaW5qYTogRW50ZXJpbmcgZGlyZWN0b3J5IGBidWlsZGRpcic8L2Rpdj48ZGl2PlsxLzI0
XSBDb21waWxpbmcgQysrIG9iamVjdCAnc3VicHJvamVjdHMvdGlueXhtbDItNy4wLjEvY2U5NzI2
NUBAeG1sdGVzdEBleGUveG1sdGVzdC5jcHAubycuPC9kaXY+PGRpdj5GQUlMRUQ6IHN1YnByb2pl
Y3RzL3Rpbnl4bWwyLTcuMC4xL2NlOTcyNjVAQHhtbHRlc3RAZXhlL3htbHRlc3QuY3BwLm/CoDwv
ZGl2PjxkaXY+YysrIC1Jc3VicHJvamVjdHMvdGlueXhtbDItNy4wLjEvY2U5NzI2NUBAeG1sdGVz
dEBleGUgLUlzdWJwcm9qZWN0cy90aW55eG1sMi03LjAuMSAtSS4uL3N1YnByb2plY3RzL3Rpbnl4
bWwyLTcuMC4xIC1mbHRvIC1mZGlhZ25vc3RpY3MtY29sb3I9YWx3YXlzIC1waXBlIC1EX0ZJTEVf
T0ZGU0VUX0JJVFM9NjQgLVdhbGwgLVdpbnZhbGlkLXBjaCAtV25vbi12aXJ0dWFsLWR0b3IgLVdl
eHRyYSAtV3BlZGFudGljIC1XZXJyb3IgLXN0ZD1jKysxNyAtZm5vLXJ0dGkgLU8yIC1nIC1NRCAt
TVEgJ3N1YnByb2plY3RzL3Rpbnl4bWwyLTcuMC4xL2NlOTcyNjVAQHhtbHRlc3RAZXhlL3htbHRl
c3QuY3BwLm8nIC1NRiAnc3VicHJvamVjdHMvdGlueXhtbDItNy4wLjEvY2U5NzI2NUBAeG1sdGVz
dEBleGUveG1sdGVzdC5jcHAuby5kJyAtbyAnc3VicHJvamVjdHMvdGlueXhtbDItNy4wLjEvY2U5
NzI2NUBAeG1sdGVzdEBleGUveG1sdGVzdC5jcHAubycgLWMgLi4vc3VicHJvamVjdHMvdGlueXht
bDItNy4wLjEveG1sdGVzdC5jcHA8L2Rpdj48ZGl2Pi4uL3N1YnByb2plY3RzL3Rpbnl4bWwyLTcu
MC4xL3htbHRlc3QuY3BwOiBJbiBmdW5jdGlvbiDigJhpbnQgbWFpbihpbnQsIGNvbnN0IGNoYXIq
KinigJk6PC9kaXY+PGRpdj4uLi9zdWJwcm9qZWN0cy90aW55eG1sMi03LjAuMS94bWx0ZXN0LmNw
cDo3MDc6MTA6IGVycm9yOiBpZ25vcmluZyByZXR1cm4gdmFsdWUgb2Yg4oCYY2hhciogZmdldHMo
Y2hhciosIGludCwgRklMRSop4oCZLCBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSB3YXJuX3VudXNl
ZF9yZXN1bHQgWy1XZXJyb3I9dW51c2VkLXJlc3VsdF08L2Rpdj48ZGl2PsKgIDcwNyB8IMKgIMKg
IGZnZXRzKCBzYXZlZEJ1ZiwgMjU2LCBzYXZlZCApOzwvZGl2PjxkaXY+wqAgwqAgwqAgfCDCoCDC
oCB+fn5+fl5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fjwvZGl2PjxkaXY+Li4vc3VicHJvamVjdHMv
dGlueXhtbDItNy4wLjEveG1sdGVzdC5jcHA6MTA2Nzo5OiBlcnJvcjogaWdub3JpbmcgcmV0dXJu
IHZhbHVlIG9mIOKAmGNoYXIqIGZnZXRzKGNoYXIqLCBpbnQsIEZJTEUqKeKAmSwgZGVjbGFyZWQg
d2l0aCBhdHRyaWJ1dGUgd2Fybl91bnVzZWRfcmVzdWx0IFstV2Vycm9yPXVudXNlZC1yZXN1bHRd
PC9kaXY+PGRpdj7CoDEwNjcgfCDCoCDCoGZnZXRzKCBidWYsIDEwMjQsIHRleHRmaWxlICk7PC9k
aXY+PGRpdj7CoCDCoCDCoCB8IMKgIMKgfn5+fn5efn5+fn5+fn5+fn5+fn5+fn5+fn5+fjwvZGl2
PjxkaXY+Y2MxcGx1czogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzPC9kaXY+
PGRpdj5bMi8yNF0gQ29tcGlsaW5nIEMrKyBvYmplY3QgJ3N1YnByb2plY3RzL3Rpbnl4bWwyLTcu
MC4xL2NlOTcyNjVAQHRpbnl4bWwyQHNoYS90aW55eG1sMi5jcHAubycuXkM8L2Rpdj48ZGl2Pm5p
bmphOiBidWlsZCBzdG9wcGVkOiBpbnRlcnJ1cHRlZCBieSB1c2VyLjwvZGl2PjxkaXY+wqA8L2Rp
dj48ZGl2PsKgPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkkgaGF2ZSB0aGlz
IHByb2JsZW0gdGhlbSBpIHByaW50IGNvbW1hbmQgOiBuaW5qYSAtQyBidWlsZGRpcjwvZGl2Pjxk
aXY+SG93IHRvIGZpeCB0aGlzID88L2Rpdj48ZGl2PsKgPC9kaXY+PC9kaXY+PGRpdj48YnIgLz48
L2Rpdj48ZGl2PjxiciAvPjwvZGl2PjxkaXY+MjUuMDIuMjAyMSwgMTg6MjAsICJQYXJpc2hydXQg
QmhhdGlhIiAmbHQ7cGFyaXNocnV0YkBnbWFpbC5jb20mZ3Q7OjwvZGl2PjxibG9ja3F1b3RlPjxk
aXYgZGlyPSJsdHIiPjxkaXYgZGlyPSJsdHIiPjxkaXY+SGVsbG8sPC9kaXY+PGRpdj48YnIgLz48
L2Rpdj48ZGl2PlJlcXVlc3RpbmcgZmVlZGJhY2sgb24gdGhlIGN1cnJlbnQgaXRlcmF0aW9uIG9m
IG5ldyBIYXJkd2FyZSBzdGF0dXMgYW5kIGludmVudG9yeSBzY3JlZW5zIGluIHRoZSBXZWJVSTo8
YnIgLz48L2Rpdj48ZGl2PjxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3dlYnVp
LXZ1ZS9pc3N1ZXMvNTQiPmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL3dlYnVpLXZ1ZS9pc3N1
ZXMvNTQ8L2E+PC9kaXY+PGRpdj48YSBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy93
ZWJ1aS12dWUvaXNzdWVzLzQ0IiB0YXJnZXQ9Il9ibGFuayI+PC9hPjwvZGl2PjxkaXY+VGhhbmtz
IGluIGFkdmFuY2U8Zm9udCBjb2xvcj0iIzg4ODg4OCI+LDxiciAvPjwvZm9udD48L2Rpdj48ZGl2
PjxkaXYgY2xhc3M9ImIzMzdiNjkyMjdjM2U4MWM2NzBiOWZlZTQwYTQ2ZGNnbWFpbF9zaWduYXR1
cmUiIGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj48ZGl2PjxkaXYgZGlyPSJsdHIiPjxkaXY+PGRp
diBkaXI9Imx0ciI+PGRpdj48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj48ZGl2IHN0eWxl
PSJmb250LXNpemU6MTIuNzJweCI+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6cmdiKCAy
NTUgLCAyNTUgLCAyNTUgKSI+PGZvbnQgZmFjZT0idGFob21hLCBzYW5zLXNlcmlmIiBzdHlsZT0i
Zm9udC1zaXplOjEyLjcycHgiPjxiPlBhcmlzaHJ1dCBCaGF0aWE8L2I+PC9mb250Pjwvc3Bhbj48
ZGl2IHN0eWxlPSJmb250LXNpemU6MTIuNzJweCI+PHNwYW4gc3R5bGU9ImNvbG9yOnJnYiggMTAy
ICwgMTAyICwgMTAyICkiPjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOnJnYiggMjU1ICwg
MjU1ICwgMjU1ICkiPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTondGFob21hJyAsIHNhbnMtc2Vy
aWY7Zm9udC1zaXplOnNtYWxsIj5Vc2VyIEV4cGVyaWVuY2UgRGVzaWduZXIgfCBJQk0gaVgsIEJh
bmdhbG9yZTwvc3Bhbj48L3NwYW4+PC9zcGFuPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtc2l6ZTox
Mi43MnB4Ij48c3BhbiBzdHlsZT0iY29sb3I6cmdiKCAxMDIgLCAxMDIgLCAxMDIgKSI+PHNwYW4g
c3R5bGU9ImJhY2tncm91bmQtY29sb3I6cmdiKCAyNTUgLCAyNTUgLCAyNTUgKSI+PHNwYW4gc3R5
bGU9ImZvbnQtZmFtaWx5Oid0YWhvbWEnICwgc2Fucy1zZXJpZjtmb250LXNpemU6MTIuNzJweCI+
PHNwYW4gY2xhc3M9IjFmMWVhMTkzZjY3MzVjZjB3bWktY2FsbHRvIj4rOTEgOTgxMSA5MzAgMDY5
PC9zcGFuPjwvc3Bhbj48L3NwYW4+PC9zcGFuPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtc2l6ZTox
Mi43MnB4Ij48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjpyZ2IoIDI1NSAsIDI1NSAsIDI1
NSApIj48YnIgLz48L3NwYW4+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1zaXplOjEyLjcycHgiPjxp
PjxzcGFuIHN0eWxlPSJjb2xvcjpyZ2IoIDEwMiAsIDEwMiAsIDEwMiApIj48c3BhbiBzdHlsZT0i
YmFja2dyb3VuZC1jb2xvcjpyZ2IoIDI1NSAsIDI1NSAsIDI1NSApIj4iRXZlcnlvbmUgd2FudHMg
dG8gZ28gdG8gaGVhdmVuLCBidXQgbm8gb25lIHdhbnRzIHRvIGRpZS4iPC9zcGFuPjwvc3Bhbj48
L2k+PGJyIC8+PC9kaXY+PGJyIC8+PGJyIC8+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+
PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iZjEz
Y2E0ODcxOWM4YTYwMDMzOTA1YjIzYjM5Njc1YWdtYWlsX3F1b3RlIj48YmxvY2txdW90ZSBjbGFz
cz0iZjEzY2E0ODcxOWM4YTYwMDMzOTA1YjIzYjM5Njc1YWdtYWlsX3F1b3RlIiBzdHlsZT0iYm9y
ZGVyLWxlZnQtY29sb3I6cmdiKCAyMDQgLCAyMDQgLCAyMDQgKTtib3JkZXItbGVmdC1zdHlsZTpz
b2xpZDtib3JkZXItbGVmdC13aWR0aDoxcHg7bWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O3BhZGRp
bmctbGVmdDoxZXgiPgo8L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+CjwvYmxvY2txdW90ZT4=
