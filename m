Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA3CBA1BE
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 12:14:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46bjwj4BHnzDqQh
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 20:14:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=183.3.255.84; helo=qq.com; envelope-from=1181052146@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="LrVBFykP"; 
 dkim-atps=neutral
X-Greylist: delayed 71 seconds by postgrey-1.36 at bilbo;
 Sun, 22 Sep 2019 20:13:38 AEST
Received: from qq.com (smtpbg449.qq.com [183.3.255.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46bjw20mkhzDqPF
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 20:13:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1569147119; bh=rsAvXfsHTZ7qGc2viuAJHLvqQYMk4gjE/cOdUeEdBJY=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=LrVBFykPMQSXp8jvj0UITpctFehQqvlv1PCAkKEKkOltaALvo6GyN0+S2ZlxdPhsV
 ZskEYxqL/3/IeGewXs/D+zAgJmnegRocRpIDgUG3UhfI5qXRyjw2pEXDdAnjrt1zH8
 bR3wsmCbK9TTfZ6PWOaHWwLcGm26ionlKezf4VYc=
X-QQ-FEAT: u/EYRCx6PxgYAP5u0OBqINOcgmp8v+yRseFwBH0tUnLDdsIxsYrNt8blvVb1n
 t9ADlp7sX57kzt+XyxFoNWyqRT21aU2NQZi4JApR9gavX3KRBZ2T1HtSF/qkkGdbtXxOPsF
 LjcpYmCNoPJ4lKfcdOIOhBvP93ZOnPCHzGrPO8qbPKnGDRqOrQ/05lptn+P5REagjp0xoPX
 Ci3Ra01dgXEkb2+7sZCwDgn4RFx0KCCYDfK7myy7q2kt4lAe/pXlw3TS9I2VAstlOkva991
 ibBAivpuhn6fEJYcRuB4mjKeU4DV2QTIm3AA==
X-QQ-SSF: 00000000000000F000000000000000S
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 106.121.169.154
X-QQ-STYLE: 
X-QQ-mid: webmail166t1569147118t5946349
From: "=?gb18030?B?xM/SsKXgpeult6WopemltA==?=" <1181052146@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: about openbmc IRC
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5D8748EE_0A572E98_58CB7812"
Content-Transfer-Encoding: 8Bit
Date: Sun, 22 Sep 2019 18:11:58 +0800
X-Priority: 3
Message-ID: <tencent_EE059DB8386C7CA8A9276439F847CB8B4D0A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Sun, 22 Sep 2019 18:11:59 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign2
X-QQ-Bgrelay: 1
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

This is a multi-part message in MIME format.

------=_NextPart_5D8748EE_0A572E98_58CB7812
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

RGVhcjoNCg0KDQppIGhhdmUgcmVnaXN0ZSBvbiBSaW90OiAjb3BlbmJtYzptYXRyaXgub3Jn
DQphbmQgaSB3YW50IHRvIGpvaW4gb3BlbmJtYywgYnV0IGV2ZW55IGkgam9pbiwgaSB3YXMg
a2ljayBvZmYgYnkgQGFwcHNlcnZpY2UtaXJjOm1hdHJpeC5vcmcNCndpdGggdGhlIGVycm9y
Og0KDQpZb3Ugd2VyZSBraWNrZWQgZnJvbSBvcGVuYm1jIGJ5IEBhcHBzZXJ2aWNlLWlyYzpt
YXRyaXgub3JnDQoNClJlYXNvbjogSVJDIGVycm9yIG9uICNvcGVuYm1jOiBlcnJfbmVlZHJl
Z2dlZG5pY2sNCg0KDQoNCmkgaGF2ZSByZWdpc3RlciBpbiBSaW90OiAjb3BlbmJtYzptYXRy
aXgub3JnIGFzIG5pY2sgbmFtZSB6aHVhbnllc2hpdGkuDQpob3cgY2FuIGkgam9pbiBvcGVu
Ym1jPw0KDQoNCkJlc3QgUmVnYXJkcyE=

------=_NextPart_5D8748EE_0A572E98_58CB7812
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PGRpdj5EZWFyOjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+aSBoYXZlIHJlZ2lzdGUgb24m
bmJzcDs8c3BhbiBzdHlsZT0iY29sb3I6IHJnYigzNiwgNDEsIDQ2KTsgZm9udC1mYW1pbHk6
IC1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7U2Vnb2UgVUkmcXVv
dDssIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVt
b2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBFbW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkg
U3ltYm9sJnF1b3Q7OyBmb250LXNpemU6IDE2cHg7Ij5SaW90Ojwvc3Bhbj48c3BhbiBzdHls
ZT0iY29sb3I6IHJnYigzNiwgNDEsIDQ2KTsgZm9udC1mYW1pbHk6IC1hcHBsZS1zeXN0ZW0s
IEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7U2Vnb2UgVUkmcXVvdDssIEhlbHZldGljYSwg
QXJpYWwsIHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVv
dDtTZWdvZSBVSSBFbW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkgU3ltYm9sJnF1b3Q7OyBm
b250LXNpemU6IDE2cHg7Ij4mbmJzcDs8L3NwYW4+PGEgaHJlZj0iaHR0cHM6Ly9yaW90Lmlt
L2FwcC8jL3Jvb20vI29wZW5ibWM6bWF0cml4Lm9yZyIgcmVsPSJub2ZvbGxvdyIgc3R5bGU9
ImZvbnQtZmFtaWx5OiAtYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90
O1NlZ29lIFVJJnF1b3Q7LCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNlcmlmLCAmcXVvdDtB
cHBsZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7U2Vnb2UgVUkgRW1vamkmcXVvdDssICZx
dW90O1NlZ29lIFVJIFN5bWJvbCZxdW90OzsgZm9udC1zaXplOiAxNnB4OyBiYWNrZ3JvdW5k
LWNvbG9yOiBpbml0aWFsOyBib3gtc2l6aW5nOiBib3JkZXItYm94OyBjb2xvcjogcmdiKDMs
IDEwMiwgMjE0KTsgdGV4dC1kZWNvcmF0aW9uLWxpbmU6IG5vbmU7Ij4jb3BlbmJtYzptYXRy
aXgub3JnPC9hPjwvZGl2PjxkaXY+YW5kIGkgd2FudCB0byBqb2luIG9wZW5ibWMsIGJ1dCBl
dmVueSBpIGpvaW4sIGkgd2FzIGtpY2sgb2ZmIGJ5Jm5ic3A7PHNwYW4gc3R5bGU9ImJhY2tn
cm91bmQtY29sb3I6IHJnYigyNDIsIDI0NSwgMjQ4KTsgY29sb3I6IHJnYig0NiwgNDcsIDUw
KTsgZm9udC1mYW1pbHk6IE51bml0bywgVHdlbW9qaSwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1v
amkmcXVvdDssICZxdW90O1NlZ29lIFVJIEVtb2ppJnF1b3Q7LCAmcXVvdDtOb3RvIENvbG9y
IEVtb2ppJnF1b3Q7LCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6
IDE4cHg7Ij5AYXBwc2VydmljZS1pcmM6bWF0cml4Lm9yZzwvc3Bhbj48L2Rpdj48ZGl2Pndp
dGggdGhlIGVycm9yOjwvZGl2PjxkaXY+PGgzIHN0eWxlPSJmb250LXNpemU6IDE4cHg7IG1h
cmdpbjogNHB4OyBjb2xvcjogcmdiKDQ2LCA0NywgNTApOyBmb250LWZhbWlseTogTnVuaXRv
LCBUd2Vtb2ppLCAmcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7U2Vnb2Ug
VUkgRW1vamkmcXVvdDssICZxdW90O05vdG8gQ29sb3IgRW1vamkmcXVvdDssIEFyaWFsLCBI
ZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNDIsIDI0NSwg
MjQ4KTsiPllvdSB3ZXJlIGtpY2tlZCBmcm9tIG9wZW5ibWMgYnkgQGFwcHNlcnZpY2UtaXJj
Om1hdHJpeC5vcmc8L2gzPjxwIHN0eWxlPSJvdmVyZmxvdy13cmFwOiBicmVhay13b3JkOyBt
YXJnaW46IDRweDsgY29sb3I6IHJnYig0NiwgNDcsIDUwKTsgZm9udC1mYW1pbHk6IE51bml0
bywgVHdlbW9qaSwgJnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkmcXVvdDssICZxdW90O1NlZ29l
IFVJIEVtb2ppJnF1b3Q7LCAmcXVvdDtOb3RvIENvbG9yIEVtb2ppJnF1b3Q7LCBBcmlhbCwg
SGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE1cHg7IGJhY2tncm91bmQtY29s
b3I6IHJnYigyNDIsIDI0NSwgMjQ4KTsiPlJlYXNvbjogSVJDIGVycm9yIG9uICNvcGVuYm1j
OiBlcnJfbmVlZHJlZ2dlZG5pY2s8L3A+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5pIGhh
dmUgcmVnaXN0ZXIgaW4mbmJzcDs8c3BhbiBzdHlsZT0iY29sb3I6IHJnYigzNiwgNDEsIDQ2
KTsgZm9udC1mYW1pbHk6IC1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1
b3Q7U2Vnb2UgVUkmcXVvdDssIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICZxdW90
O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBFbW9qaSZxdW90Oywg
JnF1b3Q7U2Vnb2UgVUkgU3ltYm9sJnF1b3Q7OyBmb250LXNpemU6IDE2cHg7Ij5SaW90OiZu
YnNwOzwvc3Bhbj48YSBocmVmPSJodHRwczovL3Jpb3QuaW0vYXBwLyMvcm9vbS8jb3BlbmJt
YzptYXRyaXgub3JnIiByZWw9Im5vZm9sbG93IiBzdHlsZT0iYm94LXNpemluZzogYm9yZGVy
LWJveDsgY29sb3I6IHJnYigzLCAxMDIsIDIxNCk7IHRleHQtZGVjb3JhdGlvbi1saW5lOiBu
b25lOyBmb250LWZhbWlseTogLWFwcGxlLXN5c3RlbSwgQmxpbmtNYWNTeXN0ZW1Gb250LCAm
cXVvdDtTZWdvZSBVSSZxdW90OywgSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZiwgJnF1
b3Q7QXBwbGUgQ29sb3IgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJIEVtb2ppJnF1b3Q7
LCAmcXVvdDtTZWdvZSBVSSBTeW1ib2wmcXVvdDs7IGZvbnQtc2l6ZTogMTZweDsiPiNvcGVu
Ym1jOm1hdHJpeC5vcmc8L2E+Jm5ic3A7YXMgbmljayBuYW1lIHpodWFueWVzaGl0aS48L2Rp
dj48ZGl2PmhvdyBjYW4gaSBqb2luIG9wZW5ibWM/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5CZXN0IFJlZ2FyZHMhPC9kaXY+PGRpdj48YnI+PC9kaXY+

------=_NextPart_5D8748EE_0A572E98_58CB7812--



