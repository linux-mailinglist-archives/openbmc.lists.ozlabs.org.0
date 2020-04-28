Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9C31BC07C
	for <lists+openbmc@lfdr.de>; Tue, 28 Apr 2020 16:03:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BNdZ2J7hzDqw8
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 00:02:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=183.3.226.243; helo=qq.com; envelope-from=1181052146@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=PG6aP41Z; dkim-atps=neutral
X-Greylist: delayed 71 seconds by postgrey-1.36 at bilbo;
 Tue, 28 Apr 2020 23:59:24 AEST
Received: from qq.com (smtpbg419.qq.com [183.3.226.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BNYS552DzDqY2
 for <openbmc@lists.ozlabs.org>; Tue, 28 Apr 2020 23:59:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1588082254; bh=1pDkz3ZSTRiIC90z6veICNvJ3S5lCehHaSKgpN9lzTo=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=PG6aP41ZxcD96F1O8jOilxYi+f1gMzeO67VEpsomd5hcebea9y0cxWXHDtLRvqsLp
 ElmYx9vygstUkUxpyT5v9R4JYqG45+hliqMsSds5v1ebeRRi+N/vbuiGpCZbYZl+E+
 FAA3FyLo5nxKrGomM+cCjNvm0mgNTUKOTfpx5nEM=
X-QQ-SSF: 00000000000000F000000000000000S
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 117.14.152.15
X-QQ-STYLE: 
X-QQ-mid: webenglish2t1588082253t386954
From: "=?gb18030?B?xM/SsKXgpeult6WopemltA==?=" <1181052146@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: meta-palmetto fail to login via web broswer
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5EA8364D_0B7DE790_4377D6B7"
Content-Transfer-Encoding: 8Bit
Date: Tue, 28 Apr 2020 21:57:33 +0800
X-Priority: 3
Message-ID: <tencent_5AA0A65123464A4C78256C2D@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Tue, 28 Apr 2020 21:57:33 +0800 (CST)
Feedback-ID: webenglish:qq.com:bgforeign:bgforeign11
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

------=_NextPart_5EA8364D_0B7DE790_4377D6B7
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGksIEdyZWV0aW5ncw0KDQpJIGFtIHVzaW5nIG1ldGEtcGFsbWV0dG8gaW1hZ2UgaW4gcWVt
dS4gQWZ0ZXIgYm9vdCB1cCwgSSB0cnkgdG8gbG9naW4gb3BlbmJtYyB2aWEgd2ViIGJyb3N3
ZXIuIEJ1dCBJIGZhaWwgdG8gbG9naW4gYW5kIGdvdCBhIGVycm9yIGNvZGUgIkVSUl9UT09f
TUFOWV9SRURJUkVDVFMiLiBJIHRyeSBmaXJlZm94IGFuZCBjaHJvbWUsIGJvdGggZ2V0IHRo
ZSBzYW1lIGVycm9yIGNvZGUuDQpXaGVuIHVzaW5nIGlwbWl0b29sIG9yIGN1cmwgdG8gYWNj
ZXNzIG9wZW5ibWMsIGl0IHdvcmtzIHdlbGwuIEFuZCBmb3IgbWV0YS1yb211bHVzIGltYWdl
IEkgY2FuIGxvZ2luIG9wZW5ibWMgdmlhIG15IHdlYiBicm9zd2VyLg0KV2hhdCBjYW4gSSBk
bz8NCg0KQmVzdCBSZWdhcmRzIQ0KTGl1IEhvbmd3ZWk=

------=_NextPart_5EA8364D_0B7DE790_4377D6B7
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGksIEdyZWV0aW5nczxicj48YnI+SSBhbSB1c2luZyBtZXRhLXBhbG1ldHRvIGltYWdlIGlu
IHFlbXUuIEFmdGVyIGJvb3QgdXAsIEkgdHJ5IHRvIGxvZ2luIG9wZW5ibWMgdmlhIHdlYiBi
cm9zd2VyLiBCdXQgSSBmYWlsIHRvIGxvZ2luIGFuZCBnb3QgYSBlcnJvciBjb2RlICJFUlJf
VE9PX01BTllfUkVESVJFQ1RTIi4gSSB0cnkgZmlyZWZveCBhbmQgY2hyb21lLCBib3RoIGdl
dCB0aGUgc2FtZSBlcnJvciBjb2RlLjxicj5XaGVuIHVzaW5nIGlwbWl0b29sIG9yIGN1cmwg
dG8gYWNjZXNzIG9wZW5ibWMsIGl0IHdvcmtzIHdlbGwuIEFuZCBmb3IgbWV0YS1yb211bHVz
IGltYWdlIEkgY2FuIGxvZ2luIG9wZW5ibWMgdmlhIG15IHdlYiBicm9zd2VyLjxicj5XaGF0
IGNhbiBJIGRvPzxicj48YnI+QmVzdCBSZWdhcmRzITxicj5MaXUgSG9uZ3dlaTxicj4=

------=_NextPart_5EA8364D_0B7DE790_4377D6B7--



