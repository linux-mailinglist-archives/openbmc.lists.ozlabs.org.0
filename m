Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D32187805
	for <lists+openbmc@lfdr.de>; Tue, 17 Mar 2020 04:15:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hJFz1X2FzDqWg
	for <lists+openbmc@lfdr.de>; Tue, 17 Mar 2020 14:15:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=183.3.226.222; helo=qq.com; envelope-from=1450335857@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=YyZYRlQ8; dkim-atps=neutral
X-Greylist: delayed 72 seconds by postgrey-1.36 at bilbo;
 Tue, 17 Mar 2020 14:13:47 AEDT
Received: from qq.com (smtpbg417.qq.com [183.3.226.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hJCw1lWdzDqP2
 for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2020 14:13:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1584414716; bh=W4iR9h990PXO0W5jBYvXTxQY58WQ7NC8uF+IL3T7x5Q=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=YyZYRlQ8ljG3T/+0uSBRovprgq+PWao4idVNxe/uxxzLC/Cib0Qq11mVxcGlfpToL
 eGlEqeojvQ7XlEtR9A5zUVxlqkGl91sypdTkXPDtMlsVGMY5NWWjbjqxD/1z7G864D
 qOr/hHElxVhIz2++6y6XF3MrimsWqHdmJtfKwmwg=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1584414715t996544
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?amFlLmh5dW4ueW9v?=" <jae.hyun.yoo@linux.intel.com>,
 "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>,
 "=?ISO-8859-1?B?ZWFqYW1lcw==?=" <eajames@linux.ibm.com>
Subject: How change the  ikvm  port to 5901
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5E703FFB_0DD0A520_6CE437AC"
Content-Transfer-Encoding: 8Bit
Date: Tue, 17 Mar 2020 11:11:55 +0800
X-Priority: 3
Message-ID: <tencent_51B1839602A2624376D6376B@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Tue, 17 Mar 2020 11:11:56 +0800 (CST)
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

------=_NextPart_5E703FFB_0DD0A520_6CE437AC
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgSmFlLEVkZGllLCANCiAgICBJIHdhbnQgdG8gY2hhbmdlIHRoZSBpa3ZtIHNlcnZlciBw
b3J0IGZyb20gNTkwMCB0byA1OTAxIC4NCkkgdHJ5IHRvIG1vZGlmeSB0aGUgZm9sbG93aW5n
IHNvdXJjZToNCjEuIG9ibWMtaWt2bQ0KLS0tIGEvaWt2bV9zZXJ2ZXIuY3BwICAgIDIwMTkt
MDktMDMgMDU6NDc6NDIuMDYwMTEwMTQ1ICswODAwDQorKysgYi9pa3ZtLXNlcnZlci5jcHAg
ICAgMjAyMC0wMy0xNiAxNTo0NTo1OS4zODk1NzE3MzcgKzA4MDANCkBAIC00Myw3ICs0Myw3
IEBADQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGNoYXIqKWN1cnNv
ck1hc2spOw0KICAgICBzZXJ2ZXItPmN1cnNvci0+eGhvdCA9IDE7DQogICAgIHNlcnZlci0+
Y3Vyc29yLT55aG90ID0gMTsNCi0NCisgICAgc2VydmVyIC0+IHBvcnQgPSA1OTAxIDsNCiAg
ICAgcmZiU3RyaW5nVG9BZGRyKCZpcFswXSwgJnNlcnZlci0+bGlzdGVuSW50ZXJmYWNlKTsN
CiANCiAgICAgcmZiSW5pdFNlcnZlcihzZXJ2ZXIpOw0KMi4gYm1jd2ViDQotLS0gYS9pbmNs
dWRlL2t2bV93ZWJzb2NrZXQuaHBwICAgIDIwMTktMTItMTkgMTg6MTE6MzguODM4NTMyMDM3
ICswODAwDQorKysgYi9pbmNsdWRlL2t2bV93ZWJzb2NrZXQuaHBwICAgIDIwMjAtMDMtMTcg
MTE6MDc6MDkuODE0ODM2MDA1ICswODAwDQpAQCAtMjAsNyArMjAsNyBAQA0KICAgICAgICAg
Y29ubihjb25uKSwgZG9pbmdXcml0ZShmYWxzZSksIGhvc3RTb2NrZXQoY29ubi5nZXRfaW9f
Y29udGV4dCgpKQ0KICAgICB7DQogICAgICAgICBib29zdDo6YXNpbzo6aXA6OnRjcDo6ZW5k
cG9pbnQgZW5kcG9pbnQoDQotICAgICAgICAgICAgYm9vc3Q6OmFzaW86OmlwOjptYWtlX2Fk
ZHJlc3MoIjo6MSIpLCA1OTAwKTsNCisgICAgICAgICAgICBib29zdDo6YXNpbzo6aXA6Om1h
a2VfYWRkcmVzcygiOjoxIiksIDU5MDEpOw0KICAgICAgICAgaG9zdFNvY2tldC5hc3luY19j
b25uZWN0KA0KICAgICAgICAgICAgIGVuZHBvaW50LCBbdGhpcywgJmNvbm5dKGNvbnN0IGJv
b3N0OjpzeXN0ZW06OmVycm9yX2NvZGUmIGVjKSB7DQogICAgICAgICAgICAgICAgIGlmIChl
YykNCg0KSSBjYW4gY29ubmVjdCB0byBpa3ZtIGJ5IHRpZ2h0dm5jIG9uIHBvcnQgNTkwMSAu
IA0KDQpCdXQgdGhlIHdlYnVpIGt2bSBwYWdlIGRvbid0IHdvcmssIHRoZSBrdm0gcGFnZSBj
YW5ub3QgY29ubmVjdCB0byB0aGUgaWt2bSBzZXJ2ZXIgc3VjY2Vzcy4NCkhvdyB0byAgbW9k
aWZ5IHRoZSB3ZWJ1aSA/DQoNCiAgQmVzdCwNClhpdXpoaQ==

------=_NextPart_5E703FFB_0DD0A520_6CE437AC
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj5IaSBKYWUsRWRkaWUsIDwvZGl2PjxkaXY+Jm5ic3A7ICZuYnNwOyBJIHdhbnQgdG8g
Y2hhbmdlIHRoZSBpa3ZtIHNlcnZlciBwb3J0IGZyb20gNTkwMCB0byA1OTAxIC48L2Rpdj48
ZGl2PkkgdHJ5IHRvIG1vZGlmeSB0aGUgZm9sbG93aW5nIHNvdXJjZTo8L2Rpdj48ZGl2PjEu
IG9ibWMtaWt2bTwvZGl2PjxkaXY+LS0tIGEvaWt2bV9zZXJ2ZXIuY3BwJm5ic3A7Jm5ic3A7
Jm5ic3A7IDIwMTktMDktMDMgMDU6NDc6NDIuMDYwMTEwMTQ1ICswODAwPGJyPisrKyBiL2lr
dm0tc2VydmVyLmNwcCZuYnNwOyZuYnNwOyZuYnNwOyAyMDIwLTAzLTE2IDE1OjQ1OjU5LjM4
OTU3MTczNyArMDgwMDxicj5AQCAtNDMsNyArNDMsNyBAQDxicj4mbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgKGNoYXIqKWN1cnNvck1h
c2spOzxicj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgc2VydmVyLSZndDtjdXJzb3ItJmd0
O3hob3QgPSAxOzxicj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgc2VydmVyLSZndDtjdXJz
b3ItJmd0O3lob3QgPSAxOzxicj4tPGJyPismbmJzcDsmbmJzcDsmbmJzcDsgc2VydmVyIC0m
Z3Q7IHBvcnQgPSA1OTAxIDs8YnI+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHJmYlN0cmlu
Z1RvQWRkcigmYW1wO2lwWzBdLCAmYW1wO3NlcnZlci0mZ3Q7bGlzdGVuSW50ZXJmYWNlKTs8
YnI+Jm5ic3A7PGJyPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyByZmJJbml0U2VydmVyKHNl
cnZlcik7PGJyPjIuIGJtY3dlYjwvZGl2PjxkaXY+LS0tIGEvaW5jbHVkZS9rdm1fd2Vic29j
a2V0LmhwcCZuYnNwOyZuYnNwOyZuYnNwOyAyMDE5LTEyLTE5IDE4OjExOjM4LjgzODUzMjAz
NyArMDgwMDxicj4rKysgYi9pbmNsdWRlL2t2bV93ZWJzb2NrZXQuaHBwJm5ic3A7Jm5ic3A7
Jm5ic3A7IDIwMjAtMDMtMTcgMTE6MDc6MDkuODE0ODM2MDA1ICswODAwPGJyPkBAIC0yMCw3
ICsyMCw3IEBAPGJyPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyBjb25uKGNvbm4pLCBkb2luZ1dyaXRlKGZhbHNlKSwgaG9zdFNvY2tldChjb25u
LmdldF9pb19jb250ZXh0KCkpPGJyPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyB7PGJyPiZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBib29zdDo6
YXNpbzo6aXA6OnRjcDo6ZW5kcG9pbnQgZW5kcG9pbnQoPGJyPi0mbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgYm9v
c3Q6OmFzaW86OmlwOjptYWtlX2FkZHJlc3MoIjo6MSIpLCA1OTAwKTs8YnI+KyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZu
YnNwOyBib29zdDo6YXNpbzo6aXA6Om1ha2VfYWRkcmVzcygiOjoxIiksIDU5MDEpOzxicj4m
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgaG9zdFNv
Y2tldC5hc3luY19jb25uZWN0KDxicj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgZW5kcG9pbnQsIFt0
aGlzLCAmYW1wO2Nvbm5dKGNvbnN0IGJvb3N0OjpzeXN0ZW06OmVycm9yX2NvZGUmYW1wOyBl
Yykgezxicj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgaWYg
KGVjKTxicj48L2Rpdj48ZGl2PkkgY2FuIGNvbm5lY3QgdG8gaWt2bSBieSB0aWdodHZuYyBv
biBwb3J0IDU5MDEgLiA8YnI+PC9kaXY+PGRpdj5CdXQgdGhlIHdlYnVpIGt2bSBwYWdlIGRv
bid0IHdvcmssIHRoZSBrdm0gcGFnZSBjYW5ub3QgY29ubmVjdCB0byB0aGUgaWt2bSBzZXJ2
ZXIgc3VjY2Vzcy48L2Rpdj48ZGl2PkhvdyB0byZuYnNwOyBtb2RpZnkgdGhlIHdlYnVpID88
YnI+PC9kaXY+PGRpdj4mbmJzcDsgQmVzdCw8L2Rpdj48ZGl2PlhpdXpoaTwvZGl2Pg==

------=_NextPart_5E703FFB_0DD0A520_6CE437AC--



