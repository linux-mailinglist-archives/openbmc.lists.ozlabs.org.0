Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1E711F14D
	for <lists+openbmc@lfdr.de>; Sat, 14 Dec 2019 11:03:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZjmC4bPXzDr31
	for <lists+openbmc@lfdr.de>; Sat, 14 Dec 2019 21:03:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=203.205.250.109; helo=smtpbg515.qq.com;
 envelope-from=1181052146@qq.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="iKYLwxuW"; 
 dkim-atps=neutral
X-Greylist: delayed 188 seconds by postgrey-1.36 at bilbo;
 Sat, 14 Dec 2019 21:03:02 AEDT
Received: from smtpbg515.qq.com (smtpbg511.qq.com [203.205.250.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZjlV2Q2czDqxW
 for <openbmc@lists.ozlabs.org>; Sat, 14 Dec 2019 21:03:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1576317775; bh=JmwdcwIiFwdPRt4v8bzjb3+KdKxosMLWQSXXuGy8vjY=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=iKYLwxuW0FU4lKtMHnzdNyxBEIh0XkG0fKxXSGG8v1H+IclkyvFDlWsP4vndbfTRy
 nbX5yXHuhwkLvJqU4YvyRFOiBVypLmPWu4GBpLc69nFyQ9KppASZzVGAkE0Z+h3mTp
 z0vOSlAl7YMuZQngb/HD/nrkBs22NCttjnQriZPs=
X-QQ-FEAT: Jeh5vWjRdzLx6MfiOO/dNaUEVoEIVAhthmU4Ncp9zPHTZ2xbE48IDyYKEfWOc
 HfGD6d1NuKUkknrwnKPwniQBB91KL4QqEc9NQpWqqJHiXhjEp9Rp3uQ1danD5B3mqM+6NAb
 UqMXDrPGe5pGUDv/QLdxlx+RfQBVcSyAWqvuCxsP39W44G31Ho6XaE1Zcdu/jSzHPwIpyuA
 TSd2e+RoFn5tKIuJsWGEQCRrdbVkPohRooptWDPczz6loE7imghi0ynrxXlCsau+cyYmTxf
 xTGGufNnNkyMfjYVxSz8SGeAA=
X-QQ-SSF: 00000000000000F000000000000000S
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 211.75.14.191
X-QQ-STYLE: 
X-QQ-mid: webmail700t1576317453t8993498
From: "=?gb18030?B?xM/SsKXgpeult6WopemltA==?=" <1181052146@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: How can I add a user for openbmc and remove the default root user?
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5DF4B20D_0F9E84C0_0CF6E6A5"
Content-Transfer-Encoding: 8Bit
Date: Sat, 14 Dec 2019 17:57:33 +0800
X-Priority: 3
Message-ID: <tencent_BBCBA6D64E821CDC3E0AD497B3C0FD77E509@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Sat, 14 Dec 2019 17:57:34 +0800 (CST)
Feedback-ID: webmail:qq.com:bgweb:bgweb2
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

------=_NextPart_5DF4B20D_0F9E84C0_0CF6E6A5
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

R3JlZXRpbmdzIQ0KJm5ic3A7ICZuYnNwOyBJIGFtIHVzaW5nIG9wZW5ibWMsIGFuZCBJIHdh
bnQgdG8gcmVtb3ZlIHRoZSBkZWZhdWx0IHJvb3QgdXNlciBhbmQgYWRkIGEgbmV3IHVzZXIu
DQombmJzcDsgJm5ic3A7IEkgdXNlIHVzZXJhZGQgYWRkIGEgdXNlciwgSSBjYW4gdXNlIGN1
cmwgd2l0aCB0aGlzIHVzZXJuYW1lIGFuZCBwYXNzd2QgdG8gY29ubmVjdCB0byBvcGVuYm1j
LCBCdXQgd2hlbiBJIHVzZSBpcG1pdG9vbCwgaXQgZmFpbHMNCiZuYnNwOyAmbmJzcDsgQ2Fu
IGFueSBvbmUgdGVsbCBtZSB3aGF0IGNhbiBJJm5ic3A7IGRvPw0KDQoNCkJlc3QgUmVnYXJk
cyENCkxpdSBIb25nd2Vp

------=_NextPart_5DF4B20D_0F9E84C0_0CF6E6A5
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PGRpdj5HcmVldGluZ3MhPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7IEkgYW0gdXNpbmcgb3Bl
bmJtYywgYW5kIEkgd2FudCB0byByZW1vdmUgdGhlIGRlZmF1bHQgcm9vdCB1c2VyIGFuZCBh
ZGQgYSBuZXcgdXNlci48L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgSSB1c2UgdXNlcmFkZCBh
ZGQgYSB1c2VyLCBJIGNhbiB1c2UgY3VybCB3aXRoIHRoaXMgdXNlcm5hbWUgYW5kIHBhc3N3
ZCB0byBjb25uZWN0IHRvIG9wZW5ibWMsIEJ1dCB3aGVuIEkgdXNlIGlwbWl0b29sLCBpdCBm
YWlsczwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwOyBDYW4gYW55IG9uZSB0ZWxsIG1lIHdoYXQg
Y2FuIEkmbmJzcDsgZG8/PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5CZXN0IFJlZ2FyZHMh
PC9kaXY+PGRpdj5MaXUgSG9uZ3dlaTwvZGl2Pg==

------=_NextPart_5DF4B20D_0F9E84C0_0CF6E6A5--

