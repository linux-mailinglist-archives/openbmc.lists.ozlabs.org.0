Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DFE4958E6
	for <lists+openbmc@lfdr.de>; Fri, 21 Jan 2022 05:25:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jg5rl0lhBz30hX
	for <lists+openbmc@lfdr.de>; Fri, 21 Jan 2022 15:25:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ExuhHDRL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.15.241; helo=m15241.mail.126.com;
 envelope-from=cld795@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=ExuhHDRL; dkim-atps=neutral
Received: from m15241.mail.126.com (m15241.mail.126.com [220.181.15.241])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Jg5rK1rNcz2xXd
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jan 2022 15:24:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=HPYTh
 TwnwzlyriF3ximl8SBjNA3RetV3WXVhNTLTvTc=; b=ExuhHDRLAi5Rq7nH0+CNI
 yeC3zcCS4H2v4NDarMWu0ZuDBWyZsvXly+QMkstBxMWksuhWmTf53khsYpGg5Eqm
 VIBx9xPW0b3e9kMjaNeOu0FRhdyTB9sO21JY7kPClEnOTcNDdXB2L1W87X7mvOKX
 tStN1Q3odo9u9yohZN5kSI=
Received: from cld795$163.com ( [183.6.112.102] ) by ajax-webmail-wmsvr209
 (Coremail) ; Fri, 21 Jan 2022 12:24:33 +0800 (GMT+08:00)
X-Originating-IP: [183.6.112.102]
Date: Fri, 21 Jan 2022 12:24:33 +0800 (GMT+08:00)
From: Landon <cld795@163.com>
To: "patrick@stwcx.xyz" <patrick@stwcx.xyz>, 
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC Switching function of web
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 MailMasterPC/4.15.8.1002_(Windows_10_20H2) Copyright (c) 2002-2022
 www.mailtech.cn 163com
In-Reply-To: <YbyMUeXNLwjlcHyD@heinlein>
References: <78340dc9.749f.17d5ab53990.Coremail.cld795@163.com>
 <687802ca.772b.17d5ad02872.Coremail.cld795@163.com>
 <20211126215734.GH22508@home.paul.comp>
 <459566ca.670c.17d6b13a847.Coremail.cld795@163.com>
 <18a75e7d223e2c054e93e9a83a6c0ba474125518.camel@yadro.com>
 <6fc4e62.472c.17d7a6a0885.Coremail.cld795@163.com>
 <2f6c7248.c41.17d9291a38e.Coremail.cld795@163.com>
 <8e645b4.344b.17d93d37f8d.Coremail.cld795@163.com>
 <fabdbd3d04e3db2cef14346bc5b7e3fe71101c40.camel@yadro.com>
 <c5bba33.2c37.17dc20f1cb1.Coremail.cld795@163.com>
 <YbyMUeXNLwjlcHyD@heinlein>
Content-Type: multipart/alternative; 
 boundary="----=_Part_82542_1046045516.1642739073897"
MIME-Version: 1.0
Message-ID: <37eb8bc0.6d6a.17e7ae10369.Coremail.cld795@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: kMeowABnEryCNephQakNAA--.35460W
X-CM-SenderInfo: 5foglmqv6rljoofrz/1tbiEA6PgF8YJIaXwgABsg
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

------=_Part_82542_1046045516.1642739073897
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

CgpoZWxsb34KCgpJIHdvdWxkIGxpa2UgdG8gYXNrIG9wZW5CTUMgaG93IHRvIHJlYWxpemUgdGhl
IHN3aXRjaCBvbiBhbmQgb2ZmIGZ1bmN0aW9uIG9mIFdlYiwgYW5kIHdoYXQgaXMgdGhlIGd1aWRh
bmNlIO+8nwpUaGlzIGlzICJSZWJvb3QiICBhbmQgInNodXQgZG93biIgZm9yIG15IHdlYiBpbnRl
cmZhY2UsIGFuZCBJIHdhbnQgdG8gInBvd2VyIG9uIiBhbmQgInNodXQgZG93biIuCkkgdHJhbnNw
bGFudCB0aGUg4oCcXG1ldGEtcXVhbnRhXG1ldGEtcTcxbFxyZWNpcGVzLXBob3NwaG9yXHF1YW50
YS1wb3dlcmN0cmzigJ3vvIxnZW5lcmF0ZSAicG93ZXJvbi5zaCIgYW5kICJwb3dlcm9mZi5zaCIg
aW4g4oCcL3Vzci9iaW7igJ0sIApidXQgQ2xpY2sgb24gdGhlIHdlYiAic2h1dCBkb3duIiwgaXQg
aXMgbm8gcmVzcG9uc2UuCnNvLCBob3cgZG8gSSByZWFsaXplIHRoZSBzd2l0Y2ggZnVuY3Rpb24g
b2Ygd2ViLgoKClRoYW5rIHlvdSB2ZXJ5IG11Y2ggIQoKCgoKCgoK
------=_Part_82542_1046045516.1642739073897
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+CjxoZWFkPgogICAgPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50
PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPgo8L2hlYWQ+Cjxib2R5Pgo8c3R5bGU+CiAgICBm
b250ewogICAgICAgIGxpbmUtaGVpZ2h0OiAxLjY7CiAgICB9CiAgICB1bCxvbHsKICAgICAgICBw
YWRkaW5nLWxlZnQ6IDIwcHg7CiAgICAgICAgbGlzdC1zdHlsZS1wb3NpdGlvbjogaW5zaWRlOwog
ICAgfQo8L3N0eWxlPgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTrlvq7ova/pm4Xpu5EsVmVyZGFu
YSwmcXVvdDtNaWNyb3NvZnQgWWFoZWkmcXVvdDssU2ltU3VuLHNhbnMtc2VyaWY7Zm9udC1zaXpl
OjE0cHg7IGxpbmUtaGVpZ2h0OjEuNjsiPgogICAgPGRpdj48L2Rpdj4KPHN0eWxlPgogICAgZm9u
dHsKICAgICAgICBsaW5lLWhlaWdodDogMS42OwogICAgfQogICAgdWwsb2x7CiAgICAgICAgcGFk
ZGluZy1sZWZ0OiAyMHB4OwogICAgICAgIGxpc3Qtc3R5bGUtcG9zaXRpb246IGluc2lkZTsKICAg
IH0KPC9zdHlsZT4KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk65b6u6L2v6ZuF6buRLFZlcmRhbmEs
JnF1b3Q7TWljcm9zb2Z0IFlhaGVpJnF1b3Q7LFNpbVN1bixzYW5zLXNlcmlmO2ZvbnQtc2l6ZTox
NHB4OyBsaW5lLWhlaWdodDoxLjY7Ij4KICAgIDxkaXY+PC9kaXY+CjxzdHlsZT4KICAgIGZvbnR7
CiAgICAgICAgbGluZS1oZWlnaHQ6IDEuNjsKICAgIH0KICAgIHVsLG9sewogICAgICAgIHBhZGRp
bmctbGVmdDogMjBweDsKICAgICAgICBsaXN0LXN0eWxlLXBvc2l0aW9uOiBpbnNpZGU7CiAgICB9
Cjwvc3R5bGU+CjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OuW+rui9r+mbhem7kSxWZXJkYW5hLCZx
dW90O01pY3Jvc29mdCBZYWhlaSZxdW90OyxTaW1TdW4sc2Fucy1zZXJpZjtmb250LXNpemU6MTRw
eDsgbGluZS1oZWlnaHQ6MS42OyI+CiAgICA8ZGl2PjxkaXY+CiAgICA8ZGl2PgogICAgICAgIDxz
cGFuPgogICAgICAgICAgICA8YnI+CiAgICAgICAgPC9zcGFuPgogICAgPC9kaXY+CiAgICA8ZGl2
PmhlbGxvfjwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9y
OiByZ2IoNTEsIDUxLCA1MSk7IGZvbnQtZmFtaWx5OiB0YWhvbWEsICdNaWNyb3NvZnQgWWFIZWkn
LCDlvq7ova/pm4Xpu5EsIOWui+S9kywgJ01hbGd1biBHb3RoaWMnLCBzYW5zLXNlcmlmOyBsaW5l
LWhlaWdodDogMjZweDsgdGV4dC1hbGlnbjoganVzdGlmeTsgd2lkb3dzOiBhdXRvOyBiYWNrZ3Jv
dW5kLWNvbG9yOiByZ2IoMjQ3LCAyNDgsIDI1MCk7Ij5JIHdvdWxkIGxpa2UgdG8gYXNrIG9wZW5C
TUMgaG93IHRvIHJlYWxpemUgdGhlIHN3aXRjaCBvbiBhbmQgb2ZmIGZ1bmN0aW9uIG9mIFdlYiwg
YW5kIHdoYXQgaXMgdGhlIGd1aWRhbmNlIO+8nzwvc3Bhbj48L2Rpdj48ZGl2PlRoaXMgaXMgIlJl
Ym9vdCIgJm5ic3A7YW5kICJzaHV0IGRvd24iIGZvciBteSB3ZWImbmJzcDs8c3BhbiBzdHlsZT0i
Zm9udC1mYW1pbHk6IHRhaG9tYSwgJ01pY3Jvc29mdCBZYUhlaScsIOW+rui9r+mbhem7kSwg5a6L
5L2TLCAnTWFsZ3VuIEdvdGhpYycsIHNhbnMtc2VyaWY7IGxpbmUtaGVpZ2h0OiAyNnB4OyB0ZXh0
LWFsaWduOiBqdXN0aWZ5OyB3aWRvd3M6IGF1dG87IGNvbG9yOiByZ2IoMCwgMzAsIDg4KTsgYmFj
a2dyb3VuZC1jb2xvcjogcmdiKDI0NywgMjQ4LCAyNTApOyI+aW50ZXJmYWNlLCBhbmQgSSB3YW50
IHRvICJwb3dlciBvbiIgYW5kICJzaHV0IGRvd24iLjwvc3Bhbj48L2Rpdj48ZGl2PkkmbmJzcDs8
c3BhbiBzdHlsZT0iY29sb3I6IHJnYig3NCwgMTQ0LCAyMjYpOyBmb250LWZhbWlseTogdGFob21h
LCAnTWljcm9zb2Z0IFlhSGVpJywg5b6u6L2v6ZuF6buRLCDlrovkvZMsICdNYWxndW4gR290aGlj
Jywgc2Fucy1zZXJpZjsgbGluZS1oZWlnaHQ6IDI2cHg7IHRleHQtYWxpZ246IGp1c3RpZnk7IHdp
ZG93czogYXV0bzsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI0NywgMjQ4LCAyNTApOyI+dHJhbnNw
bGFudCB0aGUg4oCcXG1ldGEtcXVhbnRhXG1ldGEtcTcxbFxyZWNpcGVzLXBob3NwaG9yXHF1YW50
YS1wb3dlcmN0cmzigJ3vvIw8L3NwYW4+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoNzQsIDE0NCwg
MjI2KTsgZm9udC1mYW1pbHk6IHRhaG9tYSwgJ01pY3Jvc29mdCBZYUhlaScsIOW+rui9r+mbhem7
kSwg5a6L5L2TLCAnTWFsZ3VuIEdvdGhpYycsIHNhbnMtc2VyaWY7IGxpbmUtaGVpZ2h0OiAyNnB4
OyB0ZXh0LWFsaWduOiBqdXN0aWZ5OyB3aWRvd3M6IGF1dG87IGJhY2tncm91bmQtY29sb3I6IHJn
YigyNDcsIDI0OCwgMjUwKTsiPmdlbmVyYXRlICJwb3dlcm9uLnNoIiBhbmQgInBvd2Vyb2ZmLnNo
IiZuYnNwOzwvc3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYig3NCwgMTQ0LCAyMjYpOyBmb250
LWZhbWlseTogdGFob21hLCAnTWljcm9zb2Z0IFlhSGVpJywg5b6u6L2v6ZuF6buRLCDlrovkvZMs
ICdNYWxndW4gR290aGljJywgc2Fucy1zZXJpZjsgbGluZS1oZWlnaHQ6IDI2cHg7IHRleHQtYWxp
Z246IGp1c3RpZnk7IHdpZG93czogYXV0bzsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI0NywgMjQ4
LCAyNTApOyI+aW4g4oCcL3Vzci9iaW7igJ0sJm5ic3A7PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4g
c3R5bGU9ImNvbG9yOiByZ2IoNzQsIDE0NCwgMjI2KTsgZm9udC1mYW1pbHk6IHRhaG9tYSwgJ01p
Y3Jvc29mdCBZYUhlaScsIOW+rui9r+mbhem7kSwg5a6L5L2TLCAnTWFsZ3VuIEdvdGhpYycsIHNh
bnMtc2VyaWY7IGxpbmUtaGVpZ2h0OiAyNnB4OyB0ZXh0LWFsaWduOiBqdXN0aWZ5OyB3aWRvd3M6
IGF1dG87IGJhY2tncm91bmQtY29sb3I6IHJnYigyNDcsIDI0OCwgMjUwKTsiPmJ1dCZuYnNwOzwv
c3Bhbj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYig1MSwgNTEsIDUxKTsgZm9udC1mYW1pbHk6IHRh
aG9tYSwgJ01pY3Jvc29mdCBZYUhlaScsIOW+rui9r+mbhem7kSwg5a6L5L2TLCAnTWFsZ3VuIEdv
dGhpYycsIHNhbnMtc2VyaWY7IGxpbmUtaGVpZ2h0OiAyNnB4OyB0ZXh0LWFsaWduOiBqdXN0aWZ5
OyB3aWRvd3M6IGF1dG87IGJhY2tncm91bmQtY29sb3I6IHJnYigyNDcsIDI0OCwgMjUwKTsiPkNs
aWNrIG9uIHRoZSB3ZWIgInNodXQgZG93biIsJm5ic3A7PC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xv
cjogcmdiKDUxLCA1MSwgNTEpOyBmb250LWZhbWlseTogdGFob21hLCAnTWljcm9zb2Z0IFlhSGVp
Jywg5b6u6L2v6ZuF6buRLCDlrovkvZMsICdNYWxndW4gR290aGljJywgc2Fucy1zZXJpZjsgbGlu
ZS1oZWlnaHQ6IDI2cHg7IHRleHQtYWxpZ246IGp1c3RpZnk7IHdpZG93czogYXV0bzsgYmFja2dy
b3VuZC1jb2xvcjogcmdiKDI0NywgMjQ4LCAyNTApOyI+aXQgaXMgbm8gcmVzcG9uc2UuPC9zcGFu
PjwvZGl2PjxkaXY+c28sIGg8c3BhbiBzdHlsZT0iY29sb3I6IHJnYig1MSwgNTEsIDUxKTsgZm9u
dC1mYW1pbHk6IHRhaG9tYSwgJ01pY3Jvc29mdCBZYUhlaScsIOW+rui9r+mbhem7kSwg5a6L5L2T
LCAnTWFsZ3VuIEdvdGhpYycsIHNhbnMtc2VyaWY7IGxpbmUtaGVpZ2h0OiAyNnB4OyB0ZXh0LWFs
aWduOiBqdXN0aWZ5OyB3aWRvd3M6IGF1dG87IGJhY2tncm91bmQtY29sb3I6IHJnYigyNDcsIDI0
OCwgMjUwKTsiPm93IGRvIEkgcmVhbGl6ZSB0aGUgc3dpdGNoIGZ1bmN0aW9uIG9mIHdlYi48L3Nw
YW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYig1MSwgNTEsIDUxKTsgZm9udC1m
YW1pbHk6IHRhaG9tYSwgJ01pY3Jvc29mdCBZYUhlaScsIOW+rui9r+mbhem7kSwg5a6L5L2TLCAn
TWFsZ3VuIEdvdGhpYycsIHNhbnMtc2VyaWY7IGxpbmUtaGVpZ2h0OiAyNnB4OyB0ZXh0LWFsaWdu
OiBqdXN0aWZ5OyB3aWRvd3M6IGF1dG87IGJhY2tncm91bmQtY29sb3I6IHJnYigyNDcsIDI0OCwg
MjUwKTsiPjxicj48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iY29sb3I6IHJnYig1MSwg
NTEsIDUxKTsgZm9udC1mYW1pbHk6IHRhaG9tYSwgJ01pY3Jvc29mdCBZYUhlaScsIOW+rui9r+mb
hem7kSwg5a6L5L2TLCAnTWFsZ3VuIEdvdGhpYycsIHNhbnMtc2VyaWY7IGxpbmUtaGVpZ2h0OiAy
NnB4OyB0ZXh0LWFsaWduOiBqdXN0aWZ5OyB3aWRvd3M6IGF1dG87IGJhY2tncm91bmQtY29sb3I6
IHJnYigyNDcsIDI0OCwgMjUwKTsiPlRoYW5rIHlvdSB2ZXJ5IG11Y2ggITwvc3Bhbj48L2Rpdj48
ZGl2PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogdGFob21hLCAnTWljcm9zb2Z0IFlhSGVpJywg
5b6u6L2v6ZuF6buRLCDlrovkvZMsICdNYWxndW4gR290aGljJywgc2Fucy1zZXJpZjsgbGluZS1o
ZWlnaHQ6IDI2cHg7IHRleHQtYWxpZ246IGp1c3RpZnk7IHdpZG93czogYXV0bzsgY29sb3I6IHJn
YigwLCAzMCwgODgpOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjQ3LCAyNDgsIDI1MCk7Ij48YnI+
PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoNTEsIDUxLCA1MSk7IGZv
bnQtZmFtaWx5OiB0YWhvbWEsICdNaWNyb3NvZnQgWWFIZWknLCDlvq7ova/pm4Xpu5EsIOWui+S9
kywgJ01hbGd1biBHb3RoaWMnLCBzYW5zLXNlcmlmOyBsaW5lLWhlaWdodDogMjZweDsgdGV4dC1h
bGlnbjoganVzdGlmeTsgd2lkb3dzOiBhdXRvOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjQ3LCAy
NDgsIDI1MCk7Ij48YnI+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2Io
NTEsIDUxLCA1MSk7IGZvbnQtZmFtaWx5OiB0YWhvbWEsICdNaWNyb3NvZnQgWWFIZWknLCDlvq7o
va/pm4Xpu5EsIOWui+S9kywgJ01hbGd1biBHb3RoaWMnLCBzYW5zLXNlcmlmOyBsaW5lLWhlaWdo
dDogMjZweDsgdGV4dC1hbGlnbjoganVzdGlmeTsgd2lkb3dzOiBhdXRvOyBiYWNrZ3JvdW5kLWNv
bG9yOiByZ2IoMjQ3LCAyNDgsIDI1MCk7Ij48YnI+PC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2
PjwvZGl2Pgo8L2Rpdj4KPC9kaXY+PCEtLfCfmIAtLT4KPC9kaXY+CjwvYm9keT4KPC9odG1sPg==
------=_Part_82542_1046045516.1642739073897--

