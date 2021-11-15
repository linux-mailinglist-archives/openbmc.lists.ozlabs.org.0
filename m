Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63588450079
	for <lists+openbmc@lfdr.de>; Mon, 15 Nov 2021 09:56:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ht32s1ZCFz2yHl
	for <lists+openbmc@lfdr.de>; Mon, 15 Nov 2021 19:56:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=lFBYb7H0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.15.241; helo=m15241.mail.126.com;
 envelope-from=cld795@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=lFBYb7H0; dkim-atps=neutral
Received: from m15241.mail.126.com (m15241.mail.126.com [220.181.15.241])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Ht32S5TKdz2x9R
 for <openbmc@lists.ozlabs.org>; Mon, 15 Nov 2021 19:56:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=xIf3I
 gDUdbqvy+8jhzv8gSg2he0cIH63XGct9Ls5SD8=; b=lFBYb7H0MQy/8JWGyNvFs
 63ILbm9E0M63cMCNjyU6pzDe1fDWBPBTGu8BK9nkV2uE/IutKpjiNak7eJt9lorV
 UUbWtb/WnnWplWRJukDWhZ3y04ur0YLtRLdmDnhrrEG+1LFYE0Vhr0cJqOru+Qqb
 iD0oVMys/75cKqLBmtbILI=
Received: from cld795$163.com ( [183.6.112.102] ) by ajax-webmail-wmsvr209
 (Coremail) ; Mon, 15 Nov 2021 16:56:12 +0800 (GMT+08:00)
X-Originating-IP: [183.6.112.102]
Date: Mon, 15 Nov 2021 16:56:12 +0800 (GMT+08:00)
From: Landon <cld795@163.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: openbmc ina220 i2c
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 MailMasterPC/4.15.8.1002_(Windows_10_20H2) Copyright (c) 2002-2021
 www.mailtech.cn 163com
In-Reply-To: <6285eabb.ddae.17d134c709c.Coremail.cld795@163.com>
References: <6285eabb.ddae.17d134c709c.Coremail.cld795@163.com>
Content-Type: multipart/alternative; 
 boundary="----=_Part_96675_405421198.1636966572842"
MIME-Version: 1.0
Message-ID: <6cb9e385.800c.17d22cfa32a.Coremail.cld795@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: kMeowADX37OsIJJhGOk+AQ--.47526W
X-CM-SenderInfo: 5foglmqv6rljoofrz/xtbBEgtMgF6ieCy8twABs3
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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

------=_Part_96675_405421198.1636966572842
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGkKCgpvcGVuYm1jIHdlYiBIb3cgdG8gYmluZCBpbmEyMjAgKEN1cnJlbnQgc2Vuc29yKSAgb2Yg
aTJjID8KYmVjYXVzZSB0aGUgZGVmYXVsdCBpcyBpaW8taHdtb24oVm9sdGFnZSBzZW5zb3IpIG9m
IEFEQy4KCgpUaGFua3Mu
------=_Part_96675_405421198.1636966572842
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGh0bWw+CjxoZWFkPgogICAgPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50
PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPgo8L2hlYWQ+Cjxib2R5Pgo8c3R5bGU+CiAgICBm
b250ewogICAgICAgIGxpbmUtaGVpZ2h0OiAxLjY7CiAgICB9CiAgICB1bCxvbHsKICAgICAgICBw
YWRkaW5nLWxlZnQ6IDIwcHg7CiAgICAgICAgbGlzdC1zdHlsZS1wb3NpdGlvbjogaW5zaWRlOwog
ICAgfQo8L3N0eWxlPgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTrlvq7ova/pm4Xpu5EsVmVyZGFu
YSwmcXVvdDtNaWNyb3NvZnQgWWFoZWkmcXVvdDssU2ltU3VuLHNhbnMtc2VyaWY7Zm9udC1zaXpl
OjE0cHg7IGxpbmUtaGVpZ2h0OjEuNjsiPgogICAgPGRpdj4KICAgIDxkaXY+PGRpdiBzdHlsZT0i
Y29sb3I6IHJnYig0OSwgNTMsIDU5KTsgZm9udC1mYW1pbHk6IOW+rui9r+mbhem7kSwgVmVyZGFu
YSwgJ01pY3Jvc29mdCBZYWhlaScsIFNpbVN1biwgc2Fucy1zZXJpZjsgbGluZS1oZWlnaHQ6IDIy
LjRweDsiPkhpPC9kaXY+PGRpdiBzdHlsZT0iY29sb3I6IHJnYig0OSwgNTMsIDU5KTsgZm9udC1m
YW1pbHk6IOW+rui9r+mbhem7kSwgVmVyZGFuYSwgJ01pY3Jvc29mdCBZYWhlaScsIFNpbVN1biwg
c2Fucy1zZXJpZjsgbGluZS1oZWlnaHQ6IDIyLjRweDsiPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJj
b2xvcjogcmdiKDQ5LCA1MywgNTkpOyBmb250LWZhbWlseTog5b6u6L2v6ZuF6buRLCBWZXJkYW5h
LCAnTWljcm9zb2Z0IFlhaGVpJywgU2ltU3VuLCBzYW5zLXNlcmlmOyBsaW5lLWhlaWdodDogMjIu
NHB4OyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMzYsIDM2LCAzNik7Ij5vcGVuYm1jIHdlYiZu
YnNwOzxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogQXJpYWwsICdNaWNyb3NvZnQgWWFIZWknLCAn
XFw1RkFF6L2v6ZuF6buRJywgJ1xcNUI4QuS9kycsICdNYWxndW4gR290aGljJywgTWVpcnlvLCBz
YW5zLXNlcmlmOyBsaW5lLWhlaWdodDogMjZweDsgdGV4dC1hbGlnbjoganVzdGlmeTsgd2lkb3dz
OiBhdXRvOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjQ3LCAyNDgsIDI1MCk7Ij5Ib3cgdG8gYmlu
ZCBpbmEyMjAgKDwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCAnTWljcm9z
b2Z0IFlhSGVpJywgJ1xcNUZBRei9r+mbhem7kScsICdcXDVCOELkvZMnLCAnTWFsZ3VuIEdvdGhp
YycsIE1laXJ5bywgc2Fucy1zZXJpZjsgbGluZS1oZWlnaHQ6IDI2cHg7IHRleHQtYWxpZ246IGp1
c3RpZnk7IHdpZG93czogYXV0bzsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI0NywgMjQ4LCAyNTAp
OyI+Q3VycmVudCBzZW5zb3I8L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5OiBBcmlhbCwg
J01pY3Jvc29mdCBZYUhlaScsICdcXDVGQUXova/pm4Xpu5EnLCAnXFw1QjhC5L2TJywgJ01hbGd1
biBHb3RoaWMnLCBNZWlyeW8sIHNhbnMtc2VyaWY7IGxpbmUtaGVpZ2h0OiAyNnB4OyB0ZXh0LWFs
aWduOiBqdXN0aWZ5OyB3aWRvd3M6IGF1dG87IGJhY2tncm91bmQtY29sb3I6IHJnYigyNDcsIDI0
OCwgMjUwKTsiPik8L3NwYW4+PHNwYW4gc3R5bGU9ImxpbmUtaGVpZ2h0OiAyMi40cHg7Ij4mbmJz
cDsgb2YgPHN0cm9uZz5pMmM8L3N0cm9uZz4gPzwvc3Bhbj48L3NwYW4+PC9kaXY+PGRpdiBzdHls
ZT0iY29sb3I6IHJnYig0OSwgNTMsIDU5KTsgZm9udC1mYW1pbHk6IOW+rui9r+mbhem7kSwgVmVy
ZGFuYSwgJ01pY3Jvc29mdCBZYWhlaScsIFNpbVN1biwgc2Fucy1zZXJpZjsgbGluZS1oZWlnaHQ6
IDIyLjRweDsiPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDM2LCAzNiwgMzYpOyI+PHNwYW4gc3R5
bGU9ImZvbnQtZmFtaWx5OiBBcmlhbCwgJ01pY3Jvc29mdCBZYUhlaScsICdcXDVGQUXova/pm4Xp
u5EnLCAnXFw1QjhC5L2TJywgJ01hbGd1biBHb3RoaWMnLCBNZWlyeW8sIHNhbnMtc2VyaWY7IGxp
bmUtaGVpZ2h0OiAyNnB4OyB0ZXh0LWFsaWduOiBqdXN0aWZ5OyB3aWRvd3M6IGF1dG87IGJhY2tn
cm91bmQtY29sb3I6IHJnYigyNDcsIDI0OCwgMjUwKTsiPmJlY2F1c2UgdDwvc3Bhbj48c3BhbiBz
dHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCAnTWljcm9zb2Z0IFlhSGVpJywgJ1xcNUZBRei9r+mb
hem7kScsICdcXDVCOELkvZMnLCAnTWFsZ3VuIEdvdGhpYycsIE1laXJ5bywgc2Fucy1zZXJpZjsg
bGluZS1oZWlnaHQ6IDI2cHg7IHRleHQtYWxpZ246IGp1c3RpZnk7IHdpZG93czogYXV0bzsgYmFj
a2dyb3VuZC1jb2xvcjogcmdiKDI0NywgMjQ4LCAyNTApOyI+aGUgZGVmYXVsdCBpcyBpaW8taHdt
b24oPC9zcGFuPjwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYig1MSwgNTEsIDUxKTsgZm9u
dC1mYW1pbHk6IEFyaWFsLCAnTWljcm9zb2Z0IFlhSGVpJywgJ1xcNUZBRei9r+mbhem7kScsICdc
XDVCOELkvZMnLCAnTWFsZ3VuIEdvdGhpYycsIE1laXJ5bywgc2Fucy1zZXJpZjsgbGluZS1oZWln
aHQ6IDI2cHg7IHRleHQtYWxpZ246IGp1c3RpZnk7IHdpZG93czogYXV0bzsgYmFja2dyb3VuZC1j
b2xvcjogcmdiKDI0NywgMjQ4LCAyNTApOyI+Vm9sdGFnZSBzZW5zb3I8L3NwYW4+PHNwYW4gc3R5
bGU9ImZvbnQtZmFtaWx5OiBBcmlhbCwgJ01pY3Jvc29mdCBZYUhlaScsICdcXDVGQUXova/pm4Xp
u5EnLCAnXFw1QjhC5L2TJywgJ01hbGd1biBHb3RoaWMnLCBNZWlyeW8sIHNhbnMtc2VyaWY7IGxp
bmUtaGVpZ2h0OiAyNnB4OyB0ZXh0LWFsaWduOiBqdXN0aWZ5OyB3aWRvd3M6IGF1dG87IGNvbG9y
OiByZ2IoMzYsIDM2LCAzNik7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNDcsIDI0OCwgMjUwKTsi
Pikgb2YgQURDLjwvc3Bhbj48L2Rpdj48ZGl2IHN0eWxlPSJjb2xvcjogcmdiKDQ5LCA1MywgNTkp
OyBmb250LWZhbWlseTog5b6u6L2v6ZuF6buRLCBWZXJkYW5hLCAnTWljcm9zb2Z0IFlhaGVpJywg
U2ltU3VuLCBzYW5zLXNlcmlmOyBsaW5lLWhlaWdodDogMjIuNHB4OyI+PGJyPjwvZGl2PjxkaXYg
c3R5bGU9ImNvbG9yOiByZ2IoNDksIDUzLCA1OSk7IGZvbnQtZmFtaWx5OiDlvq7ova/pm4Xpu5Es
IFZlcmRhbmEsICdNaWNyb3NvZnQgWWFoZWknLCBTaW1TdW4sIHNhbnMtc2VyaWY7IGxpbmUtaGVp
Z2h0OiAyMi40cHg7Ij5UaGFua3MuPC9kaXY+PC9kaXY+PC9kaXY+PGJsb2NrcXVvdGUgaWQ9Im50
ZXMtcGNtYWlsLXF1b3RlIiBzdHlsZT0ibWFyZ2luOiAwOyBwYWRkaW5nOiAwOyBmb250LXNpemU6
IDE0cHg7IGZvbnQtZmFtaWx5OiAn5b6u6L2v6ZuF6buRJzsiPjxkaXYgc3R5bGU9ImZvbnQtZmFt
aWx5OuW+rui9r+mbhem7kSxWZXJkYW5hLCZxdW90O01pY3Jvc29mdCBZYWhlaSZxdW90OyxTaW1T
dW4sc2Fucy1zZXJpZjtmb250LXNpemU6MTRweDsgbGluZS1oZWlnaHQ6MS42OyI+PGRpdj48ZGl2
PgogICAgPC9kaXY+CiAgICA8ZGl2IHN0eWxlPSJmb250LWZhbWlseTon5b6u6L2v6ZuF6buRJyI+
CiAgICAgICAgCiAgICAgICAgPGRpdiBzdHlsZT0iZm9udC1zaXplOjE0cHg7IHBhZGRpbmc6IDA7
ICBtYXJnaW46MDsiPgoKICAgICAgICA8L2Rpdj4KICAgIDwvZGl2Pgo8L2Rpdj4KPC9kaXY+PC9i
bG9ja3F1b3RlPjxzdHlsZT4KICAgIGZvbnR7CiAgICAgICAgbGluZS1oZWlnaHQ6IDEuNjsKICAg
IH0KICAgIHVsLG9sewogICAgICAgIHBhZGRpbmctbGVmdDogMjBweDsKICAgICAgICBsaXN0LXN0
eWxlLXBvc2l0aW9uOiBpbnNpZGU7CiAgICB9Cjwvc3R5bGU+PCEtLfCfmIAtLT4KPC9kaXY+Cjwv
Ym9keT4KPC9odG1sPg==
------=_Part_96675_405421198.1636966572842--

