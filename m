Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EAE15C142
	for <lists+openbmc@lfdr.de>; Thu, 13 Feb 2020 16:20:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JKvP4fHWzDqVv
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2020 02:20:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=113.96.223.80; helo=qq.com; envelope-from=1181052146@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=AzPCZ+iW; dkim-atps=neutral
X-Greylist: delayed 72 seconds by postgrey-1.36 at bilbo;
 Fri, 14 Feb 2020 02:19:28 AEDT
Received: from qq.com (smtpbg414.qq.com [113.96.223.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JKtS4SNCzDqC6
 for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2020 02:19:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1581607054; bh=etpUs4e6Uev/+HLZaainqqzDWeFem8k+sWN2XBhsVig=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=AzPCZ+iWy+LvjSc+ZlBwKpq/CzBmiWQP3riS7YGgAuYYuyxwfDSRKz6ZsKh2YW9uD
 NbEn6LTZ1x9tPlz6hZUHAz3H/HL5CEqM/YPQXu6WmNTj+02Vr3Am6TxL88oieX3498
 UJdTPxVY1m6OoGOK8X3zyLAT1URKPfOoRsPUNcRA=
X-QQ-SSF: 00000000000000F000000000000000S
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 36.98.17.17
X-QQ-STYLE: 
X-QQ-mid: webenglish2t1581607052t44917
From: "=?gb18030?B?xM/SsKXgpeult6WopemltA==?=" <1181052146@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: how softpoweroff works for openbmc
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5E45688C_0CC44220_304FD933"
Content-Transfer-Encoding: 8Bit
Date: Thu, 13 Feb 2020 23:17:32 +0800
X-Priority: 3
Message-ID: <tencent_00C3206803D76A7D3DA93D84@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Thu, 13 Feb 2020 23:17:33 +0800 (CST)
Feedback-ID: webenglish:qq.com:bgforeign:bgforeign12
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

------=_NextPart_5E45688C_0CC44220_304FD933
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

R3JlZXRpbmdzOg0KSSBhbSBsZWFybmluZyBob3cgcG93ZXIgY29udHJvbCB3b3JrcyBpbiBv
cGVuYm1jIHN5c3RlbS4gSXQgY29tZXMgdG8gcG93ZXJvZmYgc2VxdWVuY2UuIEkgZm91bmQg
dGhhdCBmb3IgcG93ZXJvZmYgdGhlcmUgYXJlICJwb3dlcm9mZiIgYW5kICJzb2Z0cG93ZXJv
ZmYiLg0KMS4gZm9yICJwb3dlcm9mZiIsIEkgZm91bmQgdGhlIGNhbGwgcGF0aDoNCmlwbWlD
aGFzc2lzQ29udHJvbCgpICAgICAgICAgICAgIC8vcGhvc3Bob3ItaG9zdC1pcG1pZA0KaW5p
dGlhdGVfc3RhdGVfdHJhbnNpdGlvbigpDQouLi4NCmQtYnVzDQouLi4NCnJlcXVlc3RlZEhv
c3RUcmFuc2l0aW9uKCkgICAvL3Bob3NwaG9yLXN0YXRlLW1hbmFnZXINCi4uLg0KZGJ1cw0K
Li4uDQpvbl9zZXRfcG93ZXJfc3RhdGUoKSAgICAgICAgICAgIC8vc2tlbGV0b24NCmFuZCBm
aW5hbGx5IHdyaXRlIHNvbWUgZ3BpbyBwaW4gdG8gcG93ZXIgZG93bi4NCjIuIGZvciAic29m
dHBvd2Vyb2ZmIiwgSSBmb3VuZCB0aGUgY2FsbCBwYXRoOg0KaXBtaUNoYXNzaXNDb250cm9s
KCkgICAgICAgICAgICAgLy9waG9zcGhvci1ob3N0LWlwbWlkDQpzdG9wX3NvZnRfb2ZmX3Rp
bWVyKCkNCnNlbmRIb3N0U2h1dERvd25DbWQoKQ0KaXBtaWRfc2VuZF9jbWRfdG9faG9zdCgp
DQpjaGVja1F1ZXVlQW5kQWxlcnRIb3N0KCkNCi4uLg0KZC1idXMoc2V0QXR0ZW50aW9uKQ0K
Li4uDQptZXRob2Rfc2VuZF9zbXNfYXRuKCkgICAgICAvL2J0YnJpZGdlDQphbmQgZmluYWxs
eSBzZW5kIHNvbWUgbWVzc2FnZSB0byBob3N0IHZpYSBCVCwgb3IgaW4gY2FzZSBvZiBLQ1Mg
dmlhIEtDUy4NCk15IHF1ZXN0aW9uIGlzOiANCjEuIEluIGNhc2Ugb2Ygc29mdHBvd2Vyb2Zm
IEkgZm91bmQgaW4gY29kZSB0aGF0IHRoZSBvcGVuYm1jIHN5c3RlbSBqdXN0IHNlbmQgc2V0
QXR0ZW50aW9uIHRvIGhvc3QgYW5kIHJldHVybj8gRG9lcyB0aGF0IG1lYW4gbGV0dGluZyB0
aGUgaG9zdCBzeXN0ZW0gdG8gcG93ZXJkb3duIGFuZCBvcGVuYm1jIHN5c3RlbSBkb2VzIG5v
dCB3cml0ZSBhbnkgcG93ZXIgcmVsYXRlZCBncGlvIGFueW1vcmU/DQoyLiBJZiBob3N0IHN5
c3RlbSBjYW4gaGFuZGxlIHRoZSBzb2Z0cG93ZXJvZmYgcmVxdWVzdCBzZW50IGJ5IG9wZW5i
bWMsIEhvdyBjYW4gaG9zdCBzeXN0ZW0gaGFuZGxlIGl0PyBJIGtub3cgdGhlcmUgaXMgYSBt
b2R1bGUgY2FsbGVkIGlwbWlfc2kua28gd2hpY2ggbWF5IGNvbW11bmljYXRlIHdpdGggb3Bl
bmJtYy4gQnV0IEkgZG8gbm90IGZpbmQgYW5kIGNvZGUgaW4gaXBtaV9zaSByZWxhdGVkIHdp
dGggc29mdHBvd2Vyb2ZmLCBvciBhbnkgb3RoZXIgbW9kdWxlIGluIGhvc3Qgc3lzdGVtIHRv
IGNvbnRyb2wgc29mdHBvd2Vyb2ZmPw0KMy4gSSBhbSBhIGxlYXJuZXIgb2Ygb3BlbmJtYywg
SSBrbm93IHRoZXJlIG11c3QgYmUgZXJyb3JzIGluIG15IG1haWwuDQpDYW4gYW55b25lIGhl
bHAgdGVsbCBtZT8NCg0KQmVzdCBSZWdhcmRzIQ0KTGl1IEhvbmd3ZWk=

------=_NextPart_5E45688C_0CC44220_304FD933
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

R3JlZXRpbmdzOjxicj5JIGFtIGxlYXJuaW5nIGhvdyBwb3dlciBjb250cm9sIHdvcmtzIGlu
IG9wZW5ibWMgc3lzdGVtLiBJdCBjb21lcyB0byBwb3dlcm9mZiBzZXF1ZW5jZS4gSSBmb3Vu
ZCB0aGF0IGZvciBwb3dlcm9mZiB0aGVyZSBhcmUgInBvd2Vyb2ZmIiBhbmQgInNvZnRwb3dl
cm9mZiIuPGJyPjEuIGZvciAicG93ZXJvZmYiLCBJIGZvdW5kIHRoZSBjYWxsIHBhdGg6PGJy
PmlwbWlDaGFzc2lzQ29udHJvbCgpJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IC8vcGhvc3Bob3ItaG9z
dC1pcG1pZDxicj5pbml0aWF0ZV9zdGF0ZV90cmFuc2l0aW9uKCk8YnI+Li4uPGJyPmQtYnVz
PGJyPi4uLjxicj5yZXF1ZXN0ZWRIb3N0VHJhbnNpdGlvbigpJm5ic3A7Jm5ic3A7IC8vcGhv
c3Bob3Itc3RhdGUtbWFuYWdlcjxicj4uLi48YnI+ZGJ1czxicj4uLi48YnI+b25fc2V0X3Bv
d2VyX3N0YXRlKCkmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgLy9za2VsZXRvbjxicj5hbmQgZmluYWxseSB3cml0
ZSBzb21lIGdwaW8gcGluIHRvIHBvd2VyIGRvd24uPGJyPjIuIGZvciAic29mdHBvd2Vyb2Zm
IiwgSSBmb3VuZCB0aGUgY2FsbCBwYXRoOjxicj5pcG1pQ2hhc3Npc0NvbnRyb2woKSZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyAvL3Bob3NwaG9yLWhvc3QtaXBtaWQ8YnI+c3RvcF9zb2Z0X29mZl90
aW1lcigpPGJyPnNlbmRIb3N0U2h1dERvd25DbWQoKTxicj5pcG1pZF9zZW5kX2NtZF90b19o
b3N0KCk8YnI+Y2hlY2tRdWV1ZUFuZEFsZXJ0SG9zdCgpPGJyPi4uLjxicj5kLWJ1cyhzZXRB
dHRlbnRpb24pPGJyPi4uLjxicj5tZXRob2Rfc2VuZF9zbXNfYXRuKCkmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsgLy9idGJyaWRnZTxicj5hbmQgZmluYWxseSBzZW5kIHNvbWUg
bWVzc2FnZSB0byBob3N0IHZpYSBCVCwgb3IgaW4gY2FzZSBvZiBLQ1MgdmlhIEtDUy48YnI+
TXkgcXVlc3Rpb24gaXM6IDxicj4xLiBJbiBjYXNlIG9mIHNvZnRwb3dlcm9mZiBJIGZvdW5k
IGluIGNvZGUgdGhhdCB0aGUgb3BlbmJtYyBzeXN0ZW0ganVzdCBzZW5kIHNldEF0dGVudGlv
biB0byBob3N0IGFuZCByZXR1cm4/IERvZXMgdGhhdCBtZWFuIGxldHRpbmcgdGhlIGhvc3Qg
c3lzdGVtIHRvIHBvd2VyZG93biBhbmQgb3BlbmJtYyBzeXN0ZW0gZG9lcyBub3Qgd3JpdGUg
YW55IHBvd2VyIHJlbGF0ZWQgZ3BpbyBhbnltb3JlPzxicj4yLiBJZiBob3N0IHN5c3RlbSBj
YW4gaGFuZGxlIHRoZSBzb2Z0cG93ZXJvZmYgcmVxdWVzdCBzZW50IGJ5IG9wZW5ibWMsIEhv
dyBjYW4gaG9zdCBzeXN0ZW0gaGFuZGxlIGl0PyBJIGtub3cgdGhlcmUgaXMgYSBtb2R1bGUg
Y2FsbGVkIGlwbWlfc2kua28gd2hpY2ggbWF5IGNvbW11bmljYXRlIHdpdGggb3BlbmJtYy4g
QnV0IEkgZG8gbm90IGZpbmQgYW5kIGNvZGUgaW4gaXBtaV9zaSByZWxhdGVkIHdpdGggc29m
dHBvd2Vyb2ZmLCBvciBhbnkgb3RoZXIgbW9kdWxlIGluIGhvc3Qgc3lzdGVtIHRvIGNvbnRy
b2wgc29mdHBvd2Vyb2ZmPzxicj4zLiBJIGFtIGEgbGVhcm5lciBvZiBvcGVuYm1jLCBJIGtu
b3cgdGhlcmUgbXVzdCBiZSBlcnJvcnMgaW4gbXkgbWFpbC48YnI+Q2FuIGFueW9uZSBoZWxw
IHRlbGwgbWU/PGJyPjxicj5CZXN0IFJlZ2FyZHMhPGJyPkxpdSBIb25nd2VpPGJyPg==

------=_NextPart_5E45688C_0CC44220_304FD933--



