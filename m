Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D291FEC77
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 09:31:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nYXK0QHbzDr8s
	for <lists+openbmc@lfdr.de>; Thu, 18 Jun 2020 17:31:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 helo=forwardcorp1p.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=yandex-team.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=JzuRlUn6; 
 dkim-atps=neutral
X-Greylist: delayed 82 seconds by postgrey-1.36 at bilbo;
 Thu, 18 Jun 2020 17:30:26 AEST
Received: from forwardcorp1p.mail.yandex.net (forwardcorp1p.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b6:217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nYW62ssDzDr7m
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 17:30:26 +1000 (AEST)
Received: from mxbackcorp1o.mail.yandex.net (mxbackcorp1o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::301])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 15BD22E1621;
 Thu, 18 Jun 2020 10:28:42 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp1o.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 7VNSisyyZs-SfaWjarX; Thu, 18 Jun 2020 10:28:42 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1592465322; bh=u1Tv+cKBTm+FZGrt3y0DBUz8yDqbLoBfn5nptnQsZug=;
 h=Subject:In-Reply-To:Cc:Date:References:To:From:Message-Id;
 b=JzuRlUn63OHMW0a7fJF66HwYQTq/Klanpda7HS5SZp70slIgo9HC6oYsHWrPuStsU
 yZFzIbS7LPG68hE3TQPUE6FiIJ1bgx2345+WGLcrn0hOcHEluurfT5npFiDmIQBIW+
 /bQEB9NyGZDOmMmGmMuuwIYooj85BGRCHusFm86E=
Authentication-Results: mxbackcorp1o.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from mxbackcorp1j.mail.yandex.net (localhost [::1])
 by mxbackcorp1j.mail.yandex.net with LMTP id ak7lxjGaGG-lMnfhegE
 for <kitsok@yandex-team.ru>; Thu, 18 Jun 2020 10:28:31 +0300
Received: by sas1-1199a7868807.qloud-c.yandex.net with HTTP;
 Thu, 18 Jun 2020 10:28:31 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: =?utf-8?B?5ZGoIOi/nOa4hQ==?= <zhouyuanqing8@outlook.com>,
 =?utf-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>
In-Reply-To: <HK2PR04MB382611A4F5E268A3DDD02E10FE9B0@HK2PR04MB3826.apcprd04.prod.outlook.com>
References: <HK2PR04MB3826A23CDAA3FC0CE9660D1BFE9B0@HK2PR04MB3826.apcprd04.prod.outlook.com>,
 <CAGm54UEHECbM+UjOsGvWDv3XvZr0NZq+-coDPe-MFvGyyDAOsQ@mail.gmail.com>
 <HK2PR04MB382611A4F5E268A3DDD02E10FE9B0@HK2PR04MB3826.apcprd04.prod.outlook.com>
Subject: =?utf-8?B?UmU6IOWbnuWkjTogVGhlcmUgaXMgbm8ga2NzIGRldmljZSBpbiB0aGUgL2RldiBkaXJlY3Rvcnk=?=
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 18 Jun 2020 10:28:41 +0300
Message-Id: <27531592465266@mail.yandex-team.ru>
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
Cc: "uperic@163.com" <uperic@163.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

PGRpdj5IZWxsbyE8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj5JdCBzaG91bGQgYmUgbGlrZSB0aGlz
OjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjxkaXY+JmFtcDtrY3MzIHs8IS0tIC0tPjwvZGl2Pjxk
aXY+a2NzX2FkZHIgPSAmbHQ7MHhDQTImZ3Q7OzwvZGl2PjxkaXY+c3RhdHVzID0gIm9rYXkiOzwv
ZGl2PjxkaXY+fTs8L2Rpdj48ZGl2PsKgPC9kaXY+PGRpdj4mYW1wO2tjczQgezwhLS0gLS0+PC9k
aXY+PGRpdj5rY3NfYWRkciA9ICZsdDsweENBNCZndDs7PC9kaXY+PGRpdj5zdGF0dXMgPSAib2th
eSI7PC9kaXY+PGRpdj59OzwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PjxiciAvPlBsZWFzZSBjaGVj
ayB0aGUgYWRkcmVzc2VzLCB5b3VyJ3MgbWF5IGJlIGRpZmZlcmVudC48L2Rpdj48ZGl2PsKgPC9k
aXY+PGRpdj5UaGFuayB5b3UhPC9kaXY+PC9kaXY+PGRpdj4xOC4wNi4yMDIwLCAxMDowMywgIuWR
qCDov5zmuIUiICZsdDt6aG91eXVhbnFpbmc4QG91dGxvb2suY29tJmd0Ozo8L2Rpdj48YmxvY2tx
dW90ZT48ZGl2PjxkaXYgc3R5bGU9ImNvbG9yOnJnYiggMCAsIDAgLCAwICk7Zm9udC1mYW1pbHk6
J2NhbGlicmknICwgJ2FyaWFsJyAsICdoZWx2ZXRpY2EnICwgc2Fucy1zZXJpZjtmb250LXNpemU6
MTJwdCI+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6J2hlbHZldGljYSc7Zm9udC1zaXplOjEycHg7
Zm9udC1zdHlsZTpub3JtYWw7Zm9udC13ZWlnaHQ6bm9ybWFsO2xpbmUtaGVpZ2h0Om5vcm1hbDtt
YXJnaW46MHB4Ij5FcnJvciByZXBvcnRlZCBkdXJpbmcga2VybmVsIHN0YXJ0dXAmI3hmZjBjO0Nh
biB5b3UgaGVscCB0byBjaGVjayB3aGVyZSB0aGUgY29uZmlndXJhdGlvbiBpcyB3cm9uZyYjeGZm
MWY7PC9kaXY+PHAgc3R5bGU9ImZvbnQ6MTJweCAnaGVsdmV0aWNhJzttYXJnaW46MHB4Ij5bwqAg
wqAgMS4wNzU5MDFdIGlwbWktYnQtaG9zdCAxZTc4OTE0MC5pYnQ6IFVzaW5nIElSUSAzMzwvcD48
cCBzdHlsZT0iZm9udDoxMnB4ICdoZWx2ZXRpY2EnO21hcmdpbjowcHgiPlvCoCDCoCAxLjA3NjU0
N10gYXN0LWtjcy1ibWMgPGEgaHJlZj0ibWFpbHRvOjFlNzg5MDAwLmxwYy1ibWM6a2NzMSI+MWU3
ODkwMDAubHBjLWJtYzprY3MxPC9hPkAwOiBubyB2YWxpZCAna2NzX2FkZHInIGNvbmZpZ3VyZWQ8
L3A+PHAgc3R5bGU9ImZvbnQ6MTJweCAnaGVsdmV0aWNhJzttYXJnaW46MHB4Ij5bwqAgwqAgMS4w
NzY3NDNdIGFzdC1rY3MtYm1jIDxhIGhyZWY9Im1haWx0bzoxZTc4OTAwMC5scGMtYm1jOmtjczIi
PjFlNzg5MDAwLmxwYy1ibWM6a2NzMjwvYT5AMDogbm8gdmFsaWQgJ2tjc19hZGRyJyBjb25maWd1
cmVkPC9wPjxwIHN0eWxlPSJmb250OjEycHggJ2hlbHZldGljYSc7bWFyZ2luOjBweCI+W8KgIMKg
IDEuMDc2OTIyXSBhc3Qta2NzLWJtYyA8YSBocmVmPSJtYWlsdG86MWU3ODkwMDAubHBjLWJtYzpr
Y3MzIj4xZTc4OTAwMC5scGMtYm1jOmtjczM8L2E+QDA6IG5vIHZhbGlkICdrY3NfYWRkcicgY29u
ZmlndXJlZDwvcD48cCBzdHlsZT0iZm9udDoxMnB4ICdoZWx2ZXRpY2EnO21hcmdpbjowcHgiPlvC
oCDCoCAxLjA3NzEwMl0gYXN0LWtjcy1ibWMgPGEgaHJlZj0ibWFpbHRvOjFlNzg5MDgwLmxwYy1o
b3N0OmtjczQiPjFlNzg5MDgwLmxwYy1ob3N0OmtjczQ8L2E+QDA6IG5vIHZhbGlkICdrY3NfYWRk
cicgY29uZmlndXJlZDwvcD48cCBzdHlsZT0iZm9udDoxMnB4ICdoZWx2ZXRpY2EnO21hcmdpbjow
cHgiPlvCoCDCoCAxLjA4MzAyMF0gU2VyaWFsOiA4MjUwLzE2NTUwIGRyaXZlciwgNiBwb3J0cywg
SVJRIHNoYXJpbmcgZW5hYmxlZDwvcD48ZGl2IHN0eWxlPSJjb2xvcjpyZ2IoIDAgLCAwICwgMCAp
O2ZvbnQtZmFtaWx5OidjYWxpYnJpJyAsICdhcmlhbCcgLCAnaGVsdmV0aWNhJyAsIHNhbnMtc2Vy
aWY7Zm9udC1zaXplOjEycHQiPsKgPC9kaXY+VGhlIGNvbmZpZ3VyZSBpbiBhc3BlZWRfZ3QuZHRz
OjxiciAvPsKgbHBjX2JtYzogPGEgaHJlZj0ibWFpbHRvOmxwYy1ibWMiPmxwYy1ibWM8L2E+QDAg
ezwhLS0gLS0+PGRpdj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBjb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNTAwLWxwYy1ibWMiLCAi
c2ltcGxlLW1mZCIsICJzeXNjb24iOzwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVnID0gJmx0OzB4MCAweDgwJmd0
Ozs8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIHJlZy1pby13aWR0aCA9ICZsdDs0Jmd0Ozs8L2Rpdj48ZGl2PsKgPC9k
aXY+PGRpdj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAjYWRkcmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8L2Rpdj48ZGl2PsKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICNzaXpl
LWNlbGxzID0gJmx0OzEmZ3Q7OzwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmFuZ2VzID0gJmx0OzB4MCAweDAgMHg4
MCZndDs7PC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAga2NzMTogPGEgaHJlZj0ibWFpbHRvOmtj
czEiPmtjczE8L2E+QDAgezwhLS0gLS0+PC9kaXY+PGRpdj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBjb21wYXRp
YmxlID0gImFzcGVlZCxhc3QyNTAwLWtjcy1ibWMiOzwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
aW50ZXJydXB0cyA9ICZsdDs4Jmd0Ozs8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGtjc19jaGFu
ID0gJmx0OzEmZ3Q7OzwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgc3RhdHVzID0gImRpc2FibGVk
Ijs8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIH07PC9kaXY+PGRpdj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBrY3MyOiA8YSBocmVmPSJtYWlsdG86a2Nz
MiI+a2NzMjwvYT5AMCB7PCEtLSAtLT48L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGNvbXBhdGli
bGUgPSAiYXNwZWVkLGFzdDI1MDAta2NzLWJtYyI7PC9kaXY+PGRpdj7CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBp
bnRlcnJ1cHRzID0gJmx0OzgmZ3Q7OzwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAga2NzX2NoYW4g
PSAmbHQ7MiZndDs7PC9kaXY+PGRpdj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzdGF0dXMgPSAiZGlzYWJsZWQi
OzwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgfTs8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGtjczM6IDxhIGhyZWY9Im1haWx0bzprY3Mz
Ij5rY3MzPC9hPkAwIHs8IS0tIC0tPjwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY29tcGF0aWJs
ZSA9ICJhc3BlZWQsYXN0MjUwMC1rY3MtYm1jIjs8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlu
dGVycnVwdHMgPSAmbHQ7OCZndDs7PC9kaXY+PGRpdj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBrY3NfY2hhbiA9
ICZsdDszJmd0Ozs8L2Rpdj48ZGl2PsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN0YXR1cyA9ICJkaXNhYmxlZCI7
PC9kaXY+PGRpdj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB9OzwvZGl2PjxkaXY+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgfTs8L2Rpdj48L2Rpdj48ZGl2IHN0eWxlPSJjb2xvcjpyZ2IoIDAg
LCAwICwgMCApO2ZvbnQtZmFtaWx5OidjYWxpYnJpJyAsICdhcmlhbCcgLCAnaGVsdmV0aWNhJyAs
IHNhbnMtc2VyaWY7Zm9udC1zaXplOjEycHQiPsKgPC9kaXY+PGRpdj48ZGl2PsKgPC9kaXY+PGRp
diBzdHlsZT0iY29sb3I6cmdiKCAwICwgMCAsIDAgKTtmb250LWZhbWlseTonY2FsaWJyaScgLCAn
YXJpYWwnICwgJ2hlbHZldGljYScgLCBzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxMnB0Ij48c3BhbiBz
dHlsZT0iYmFja2dyb3VuZC1jb2xvcjojZmZmZmZmO2ZvbnQtZmFtaWx5OidjYWxpYnJpJyAsICdh
cmlhbCcgLCAnaGVsdmV0aWNhJyAsIHNhbnMtc2VyaWYiPlRoZSBjb25maWd1cmUgaW4gYXNwZWVk
LWJtYy1vcHAtc3Rhci5kdHM6PC9zcGFuPjwvZGl2PjxkaXYgc3R5bGU9ImNvbG9yOnJnYiggMCAs
IDAgLCAwICk7Zm9udC1mYW1pbHk6J2NhbGlicmknICwgJ2FyaWFsJyAsICdoZWx2ZXRpY2EnICwg
c2Fucy1zZXJpZjtmb250LXNpemU6MTJwdCI+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6
I2ZmZmZmZjtmb250LWZhbWlseTonY2FsaWJyaScgLCAnYXJpYWwnICwgJ2hlbHZldGljYScgLCBz
YW5zLXNlcmlmIj4mYW1wO2tjczEgezwhLS0gLS0+PC9zcGFuPjxkaXY+PHNwYW4gc3R5bGU9ImJh
Y2tncm91bmQtY29sb3I6I2ZmZmZmZjtmb250LWZhbWlseTonY2FsaWJyaScgLCAnYXJpYWwnICwg
J2hlbHZldGljYScgLCBzYW5zLXNlcmlmIj7CoCDCoCDCoCDCoCBzdGF0dXMgPSAib2theSI7PC9z
cGFuPjwvZGl2PjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiNmZmZmZmY7Zm9udC1mYW1p
bHk6J2NhbGlicmknICwgJ2FyaWFsJyAsICdoZWx2ZXRpY2EnICwgc2Fucy1zZXJpZiI+IDwvc3Bh
bj48ZGl2PjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiNmZmZmZmY7Zm9udC1mYW1pbHk6
J2NhbGlicmknICwgJ2FyaWFsJyAsICdoZWx2ZXRpY2EnICwgc2Fucy1zZXJpZiI+fTs8L3NwYW4+
PC9kaXY+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6I2ZmZmZmZjtmb250LWZhbWlseTon
Y2FsaWJyaScgLCAnYXJpYWwnICwgJ2hlbHZldGljYScgLCBzYW5zLXNlcmlmIj4gPC9zcGFuPjxk
aXY+wqA8L2Rpdj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjojZmZmZmZmO2ZvbnQtZmFt
aWx5OidjYWxpYnJpJyAsICdhcmlhbCcgLCAnaGVsdmV0aWNhJyAsIHNhbnMtc2VyaWYiPiA8L3Nw
YW4+PGRpdj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjojZmZmZmZmO2ZvbnQtZmFtaWx5
OidjYWxpYnJpJyAsICdhcmlhbCcgLCAnaGVsdmV0aWNhJyAsIHNhbnMtc2VyaWYiPiZhbXA7a2Nz
MiB7PCEtLSAtLT48L3NwYW4+PC9kaXY+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6I2Zm
ZmZmZjtmb250LWZhbWlseTonY2FsaWJyaScgLCAnYXJpYWwnICwgJ2hlbHZldGljYScgLCBzYW5z
LXNlcmlmIj4gPC9zcGFuPjxkaXY+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6I2ZmZmZm
Zjtmb250LWZhbWlseTonY2FsaWJyaScgLCAnYXJpYWwnICwgJ2hlbHZldGljYScgLCBzYW5zLXNl
cmlmIj7CoCDCoCDCoCDCoCBzdGF0dXMgPSAib2theSI7PC9zcGFuPjwvZGl2PjxzcGFuIHN0eWxl
PSJiYWNrZ3JvdW5kLWNvbG9yOiNmZmZmZmY7Zm9udC1mYW1pbHk6J2NhbGlicmknICwgJ2FyaWFs
JyAsICdoZWx2ZXRpY2EnICwgc2Fucy1zZXJpZiI+IDwvc3Bhbj48ZGl2PjxzcGFuIHN0eWxlPSJi
YWNrZ3JvdW5kLWNvbG9yOiNmZmZmZmY7Zm9udC1mYW1pbHk6J2NhbGlicmknICwgJ2FyaWFsJyAs
ICdoZWx2ZXRpY2EnICwgc2Fucy1zZXJpZiI+fTs8L3NwYW4+PC9kaXY+PHNwYW4gc3R5bGU9ImJh
Y2tncm91bmQtY29sb3I6I2ZmZmZmZjtmb250LWZhbWlseTonY2FsaWJyaScgLCAnYXJpYWwnICwg
J2hlbHZldGljYScgLCBzYW5zLXNlcmlmIj4gPC9zcGFuPjxkaXY+wqA8L2Rpdj48c3BhbiBzdHls
ZT0iYmFja2dyb3VuZC1jb2xvcjojZmZmZmZmO2ZvbnQtZmFtaWx5OidjYWxpYnJpJyAsICdhcmlh
bCcgLCAnaGVsdmV0aWNhJyAsIHNhbnMtc2VyaWYiPiA8L3NwYW4+PGRpdj48c3BhbiBzdHlsZT0i
YmFja2dyb3VuZC1jb2xvcjojZmZmZmZmO2ZvbnQtZmFtaWx5OidjYWxpYnJpJyAsICdhcmlhbCcg
LCAnaGVsdmV0aWNhJyAsIHNhbnMtc2VyaWYiPiZhbXA7a2NzMyB7PCEtLSAtLT48L3NwYW4+PC9k
aXY+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6I2ZmZmZmZjtmb250LWZhbWlseTonY2Fs
aWJyaScgLCAnYXJpYWwnICwgJ2hlbHZldGljYScgLCBzYW5zLXNlcmlmIj4gPC9zcGFuPjxkaXY+
PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6I2ZmZmZmZjtmb250LWZhbWlseTonY2FsaWJy
aScgLCAnYXJpYWwnICwgJ2hlbHZldGljYScgLCBzYW5zLXNlcmlmIj7CoCDCoCDCoCDCoCBzdGF0
dXMgPSAib2theSI7PC9zcGFuPjwvZGl2PjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiNm
ZmZmZmY7Zm9udC1mYW1pbHk6J2NhbGlicmknICwgJ2FyaWFsJyAsICdoZWx2ZXRpY2EnICwgc2Fu
cy1zZXJpZiI+IDwvc3Bhbj48ZGl2PjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiNmZmZm
ZmY7Zm9udC1mYW1pbHk6J2NhbGlicmknICwgJ2FyaWFsJyAsICdoZWx2ZXRpY2EnICwgc2Fucy1z
ZXJpZiI+fTs8L3NwYW4+PC9kaXY+PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6I2ZmZmZm
Zjtmb250LWZhbWlseTonY2FsaWJyaScgLCAnYXJpYWwnICwgJ2hlbHZldGljYScgLCBzYW5zLXNl
cmlmIj4gPC9zcGFuPjxkaXY+wqA8L2Rpdj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjoj
ZmZmZmZmO2ZvbnQtZmFtaWx5OidjYWxpYnJpJyAsICdhcmlhbCcgLCAnaGVsdmV0aWNhJyAsIHNh
bnMtc2VyaWYiPiA8L3NwYW4+PGRpdj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjojZmZm
ZmZmO2ZvbnQtZmFtaWx5OidjYWxpYnJpJyAsICdhcmlhbCcgLCAnaGVsdmV0aWNhJyAsIHNhbnMt
c2VyaWYiPiZhbXA7a2NzNCB7PCEtLSAtLT48L3NwYW4+PC9kaXY+PHNwYW4gc3R5bGU9ImJhY2tn
cm91bmQtY29sb3I6I2ZmZmZmZjtmb250LWZhbWlseTonY2FsaWJyaScgLCAnYXJpYWwnICwgJ2hl
bHZldGljYScgLCBzYW5zLXNlcmlmIj4gPC9zcGFuPjxkaXY+PHNwYW4gc3R5bGU9ImJhY2tncm91
bmQtY29sb3I6I2ZmZmZmZjtmb250LWZhbWlseTonY2FsaWJyaScgLCAnYXJpYWwnICwgJ2hlbHZl
dGljYScgLCBzYW5zLXNlcmlmIj7CoCDCoCDCoCDCoCBzdGF0dXMgPSAib2theSI7PC9zcGFuPjwv
ZGl2PjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiNmZmZmZmY7Zm9udC1mYW1pbHk6J2Nh
bGlicmknICwgJ2FyaWFsJyAsICdoZWx2ZXRpY2EnICwgc2Fucy1zZXJpZiI+IDwvc3Bhbj48ZGl2
PjxzcGFuIHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiNmZmZmZmY7Zm9udC1mYW1pbHk6J2NhbGli
cmknICwgJ2FyaWFsJyAsICdoZWx2ZXRpY2EnICwgc2Fucy1zZXJpZiI+fTs8L3NwYW4+PC9kaXY+
PHNwYW4gc3R5bGU9ImJhY2tncm91bmQtY29sb3I6I2ZmZmZmZjtmb250LWZhbWlseTonY2FsaWJy
aScgLCAnYXJpYWwnICwgJ2hlbHZldGljYScgLCBzYW5zLXNlcmlmIj4gPC9zcGFuPjxkaXY+wqA8
L2Rpdj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjojZmZmZmZmO2ZvbnQtZmFtaWx5Oidj
YWxpYnJpJyAsICdhcmlhbCcgLCAnaGVsdmV0aWNhJyAsIHNhbnMtc2VyaWYiPiA8L3NwYW4+PGRp
dj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjojZmZmZmZmO2ZvbnQtZmFtaWx5OidjYWxp
YnJpJyAsICdhcmlhbCcgLCAnaGVsdmV0aWNhJyAsIHNhbnMtc2VyaWYiPiZhbXA7aWJ0IHs8IS0t
IC0tPjwvc3Bhbj48L2Rpdj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjojZmZmZmZmO2Zv
bnQtZmFtaWx5OidjYWxpYnJpJyAsICdhcmlhbCcgLCAnaGVsdmV0aWNhJyAsIHNhbnMtc2VyaWYi
PiA8L3NwYW4+PGRpdj48c3BhbiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjojZmZmZmZmO2ZvbnQt
ZmFtaWx5OidjYWxpYnJpJyAsICdhcmlhbCcgLCAnaGVsdmV0aWNhJyAsIHNhbnMtc2VyaWYiPsKg
IMKgIMKgIMKgIHN0YXR1cyA9ICJva2F5Ijs8L3NwYW4+PC9kaXY+PHNwYW4gc3R5bGU9ImJhY2tn
cm91bmQtY29sb3I6I2ZmZmZmZjtmb250LWZhbWlseTonY2FsaWJyaScgLCAnYXJpYWwnICwgJ2hl
bHZldGljYScgLCBzYW5zLXNlcmlmIj4gPC9zcGFuPjxkaXY+PHNwYW4gc3R5bGU9ImJhY2tncm91
bmQtY29sb3I6I2ZmZmZmZjtmb250LWZhbWlseTonY2FsaWJyaScgLCAnYXJpYWwnICwgJ2hlbHZl
dGljYScgLCBzYW5zLXNlcmlmIj59Ozwvc3Bhbj48L2Rpdj48c3BhbiBzdHlsZT0iYmFja2dyb3Vu
ZC1jb2xvcjojZmZmZmZmO2ZvbnQtZmFtaWx5OidjYWxpYnJpJyAsICdhcmlhbCcgLCAnaGVsdmV0
aWNhJyAsIHNhbnMtc2VyaWYiPiA8L3NwYW4+PC9kaXY+PGRpdiBzdHlsZT0iY29sb3I6cmdiKCAw
ICwgMCAsIDAgKTtmb250LWZhbWlseTonY2FsaWJyaScgLCAnYXJpYWwnICwgJ2hlbHZldGljYScg
LCBzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxMnB0Ij7CoDwvZGl2PjxociBzdHlsZT0id2lkdGg6OTgl
IiAvPjxkaXY+PGZvbnQgY29sb3I9IiMwMDAwMDAiIGZhY2U9IkNhbGlicmksIHNhbnMtc2VyaWYi
IHN0eWxlPSJmb250LXNpemU6MTFwdCI+PHN0cm9uZz7lj5Hku7bkuro6PC9zdHJvbmc+IOmDgemb
tyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnl1bGVpLnNoQGJ5dGVkYW5jZS5jb20iPnl1bGVpLnNoQGJ5
dGVkYW5jZS5jb208L2E+Jmd0OzxiciAvPjxzdHJvbmc+5Y+R6YCB5pe26Ze0Ojwvc3Ryb25nPiAy
MDIw5bm0NuaciDE45pelIDEzOjI1PGJyIC8+PHN0cm9uZz7mlLbku7bkuro6PC9zdHJvbmc+IOWR
qCDov5zmuIUgJmx0OzxhIGhyZWY9Im1haWx0bzp6aG91eXVhbnFpbmc4QG91dGxvb2suY29tIj56
aG91eXVhbnFpbmc4QG91dGxvb2suY29tPC9hPiZndDs8YnIgLz48c3Ryb25nPuaKhOmAgTo8L3N0
cm9uZz4gb3BlbmJtYyAmbHQ7PGEgaHJlZj0ibWFpbHRvOm9wZW5ibWNAbGlzdHMub3psYWJzLm9y
ZyI+b3BlbmJtY0BsaXN0cy5vemxhYnMub3JnPC9hPiZndDs7IDxhIGhyZWY9Im1haWx0bzp1cGVy
aWNAMTYzLmNvbSI+dXBlcmljQDE2My5jb208L2E+ICZsdDs8YSBocmVmPSJtYWlsdG86dXBlcmlj
QDE2My5jb20iPnVwZXJpY0AxNjMuY29tPC9hPiZndDs8YnIgLz48c3Ryb25nPuS4u+mimDo8L3N0
cm9uZz4gUmU6IFRoZXJlIGlzIG5vIGtjcyBkZXZpY2UgaW4gdGhlIC9kZXYgZGlyZWN0b3J5PC9m
b250PjxkaXY+wqA8L2Rpdj48L2Rpdj48ZGl2PjxkaXY+PGZvbnQgc2l6ZT0iMiI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZToxMXB0Ij5PbiBUaHUsIEp1biAxOCwgMjAyMCBhdCAxMjo1MSBQTSDlkagg
6L+c5riFICZsdDs8YSBocmVmPSJtYWlsdG86emhvdXl1YW5xaW5nOEBvdXRsb29rLmNvbSI+emhv
dXl1YW5xaW5nOEBvdXRsb29rLmNvbTwvYT4mZ3Q7IHdyb3RlOjxiciAvPiZndDs8YnIgLz4mZ3Q7
IEhpIGV2ZXJ5b25lLDxiciAvPiZndDs8YnIgLz4mZ3Q7wqDCoMKgwqAgVGhlcmUgaXMgbm8ga2Nz
IGRldmljZSBpbiB0aGUgL2RldiBkaXJlY3RvcnkmI3hmZjBjO0kgdXNlZCB0aGUgZm9sbG93aW5n
IGNvbW1hbmQgdG8gZmluZCBpdCBpbiB0aGUgcm9vdCBkaXJlY3RvcnksIGFuZCBJIGRpZCBub3Qg
ZmluZCBpcG1pLWtjcyBkZXZpY2UsIHBsZWFzZSBoZWxwIGd1aWRlLCB0aGFuayB5b3UuPGJyIC8+
PGJyIC8+UHJvYmFibHkgeW91IGNvdWxkIGNoZWNrIHRoZSBkZXZpY2UgdHJlZSB0byBzZWUgaWYg
dGhlIGtjcyBpcyBlbmFibGVkIG9yIG5vdC48YnIgLz48YnIgLz4mZ3Q7PGJyIC8+Jmd0OyAxLmZp
bmQgLyAtbmFtZSAqa2NzKjxiciAvPiZndDs8YnIgLz4mZ3Q7IDIuQmVsb3cgaXMgbXkga2VybmVs
IGNvbmZpZ3VyYXRpb248YnIgLz4mZ3Q7IENPTkZJR19TRVJJQUxfTUNUUkxfR1BJTz15PGJyIC8+
Jmd0OyAjIENPTkZJR19TRVJJQUxfREVWX0JVUyBpcyBub3Qgc2V0PGJyIC8+Jmd0OyAjIENPTkZJ
R19UVFlfUFJJTlRLIGlzIG5vdCBzZXQ8YnIgLz4mZ3Q7ICMgQ09ORklHX0hWQ19EQ0MgaXMgbm90
IHNldDxiciAvPiZndDsgQ09ORklHX0lQTUlfSEFORExFUj15PGJyIC8+Jmd0OyAjIENPTkZJR19J
UE1JX1BBTklDX0VWRU5UIGlzIG5vdCBzZXQ8YnIgLz4mZ3Q7ICMgQ09ORklHX0lQTUlfREVWSUNF
X0lOVEVSRkFDRSBpcyBub3Qgc2V0PGJyIC8+Jmd0OyAjIENPTkZJR19JUE1JX1NJIGlzIG5vdCBz
ZXQ8YnIgLz4mZ3Q7ICMgQ09ORklHX0lQTUlfU1NJRiBpcyBub3Qgc2V0PGJyIC8+Jmd0OyAjIENP
TkZJR19JUE1JX1dBVENIRE9HIGlzIG5vdCBzZXQ8YnIgLz4mZ3Q7ICMgQ09ORklHX0lQTUlfUE9X
RVJPRkYgaXMgbm90IHNldDxiciAvPiZndDsgQ09ORklHX0lQTUlfS0NTX0JNQz15PGJyIC8+Jmd0
OyBDT05GSUdfQVNQRUVEX0tDU19JUE1JX0JNQz15PGJyIC8+Jmd0OyBDT05GSUdfQVNQRUVEX0JU
X0lQTUlfQk1DPXk8YnIgLz4mZ3Q7IENPTkZJR19IV19SQU5ET009eTxiciAvPiZndDsgQ09ORklH
X0hXX1JBTkRPTV9USU1FUklPTUVNPXk8YnIgLz4mZ3Q7ICMgQ09ORklHX1JBV19EUklWRVIgaXMg
bm90IHNldDxiciAvPiZndDsgIyBDT05GSUdfVENHX1RQTSBpcyBub3Qgc2V0PGJyIC8+Jmd0OyAj
IENPTkZJR19YSUxMWUJVUyBpcyBub3Qgc2V0PGJyIC8+Jmd0OyAjIGVuZCBvZiBDaGFyYWN0ZXIg
ZGV2aWNlczxiciAvPiZndDs8YnIgLz4mZ3Q7IFRoYW5rczxiciAvPiZndDsgSGFybGV5PC9zcGFu
PjwvZm9udD48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Jsb2NrcXVvdGU+PGRpdj7CoDwvZGl2
PjxkaXY+wqA8L2Rpdj48ZGl2Pi0twqA8L2Rpdj48ZGl2PkJlc3QgcmVnYXJkcyw8L2Rpdj48ZGl2
PktvbnN0YW50aW4gS2x1Ym5pY2hraW4sPC9kaXY+PGRpdj5sZWFkIGZpcm13YXJlIGVuZ2luZWVy
LDwvZGl2PjxkaXY+c2VydmVyIGhhcmR3YXJlIFImYW1wO0QgZ3JvdXAsPC9kaXY+PGRpdj5ZYW5k
ZXggTW9zY293IG9mZmljZS48L2Rpdj48ZGl2PnRlbDogKzctOTAzLTUxMC0zMy0zMzwvZGl2Pjxk
aXY+wqA8L2Rpdj4=
