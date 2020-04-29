Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 578741BD5CF
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 09:22:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BqhR1BFGzDr7h
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 17:21:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=183.3.226.235; helo=qq.com; envelope-from=704645140@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=axZd+a4Q; dkim-atps=neutral
Received: from qq.com (smtpbg418.qq.com [183.3.226.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BqQ94g28zDqFm
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 17:09:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1588144131; bh=c1024xmvCrLDHyyyhKxs0odWZyyNoFITqn61wn6jEBg=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=axZd+a4Qcefu2Lk94wxj5F1sqGQBdOQNjalqK+J59hBg+/omriftQc/VS9nRIPBKL
 zpSq+HlDu48grTfhjGyOXYP6eiwIpB6xzkctrikU5Oof5z96zlyAvL09ZH6z0VYteL
 qfgvLihbFuyPwSl70BZlQYLwSQOTIAZY67mw5Hsc=
X-QQ-FEAT: c+dLv9yHU5wGtKfUqkMK0APxL0MFKlWN1c9JjJR+TEiU7ZQGuAtfGf9uDE/gW
 BpcTBT5NxA7eUY3PoWMS368SQFVlOkNg5fioIqV7HZvpESN2wLprbbGGDlCCxY0zyBI2TVN
 ozNNDMk0mSoKYPd4Vq33YC87msXusASSzB5qm/OgYOK/eNlnaWqm7y4IHI0LmfSQIz4gXMY
 Q86XA6K/E9RG2DVP/kYqi8vj4uSSzraFmXU4PJW6l7QjrOoowXWRfrRNKsVY+bWU61FknWQ
 OJxTsDBB4aVPNdr9h/jU7Bfag=
X-QQ-SSF: 00000000000000F000000000000000Z
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 117.136.160.60
X-QQ-STYLE: 
X-QQ-mid: webmail303t1588144129t3918667
From: "=?gb18030?B?zfXOxMqi?=" <704645140@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: w83795 sensor info over ast2400(Palmetto && ARM)
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5EA92801_10F35160_3BAEC8DA"
Content-Transfer-Encoding: 8Bit
Date: Wed, 29 Apr 2020 15:08:49 +0800
X-Priority: 3
Message-ID: <tencent_7EBBB4E0FBDB1CA419771E415EEC20A8FD0A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Wed, 29 Apr 2020 15:08:51 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign12
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

------=_NextPart_5EA92801_10F35160_3BAEC8DA
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGVsbG8sIHdlIGhhdmUgYSBwcm9ibGVtLg0KV2UgdXNlIHc4Mzc5NWFkZy4gTWFueSBzZW5z
b3JzIGhhdmUgYmVlbiBhZGRlZCB0byB0aGlzIGNoaXAsIGJ1dCBpdCBoYXMgbm90IHByb2R1
Y2VkIHRoZSByZXN1bHRzIHdlIHdhbnQgdG8gYWNoaWV2ZS4gSG93IGNhbiB3ZSBhZGQgc3Bl
Y2lmaWMgc2Vuc29yIGRlc2NyaXB0aW9ucyB0byBtYWtlIGl0IGVmZmVjdGl2ZS4=

------=_NextPart_5EA92801_10F35160_3BAEC8DA
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGJsb2NrcXVvdGUgc3R5bGU9Im1hcmdpbjogMCAwIDAgNDBweDsg
Ym9yZGVyOiBub25lOyBwYWRkaW5nOiAwcHg7Ij48ZGl2PkhlbGxvLCB3ZSBoYXZlIGEgcHJv
YmxlbS48L2Rpdj48L2Jsb2NrcXVvdGU+PGJsb2NrcXVvdGUgc3R5bGU9Im1hcmdpbjogMCAw
IDAgNDBweDsgYm9yZGVyOiBub25lOyBwYWRkaW5nOiAwcHg7Ij48ZGl2PldlIHVzZSB3ODM3
OTVhZGcuIE1hbnkgc2Vuc29ycyBoYXZlIGJlZW4gYWRkZWQgdG8gdGhpcyBjaGlwLCBidXQg
aXQgaGFzIG5vdCBwcm9kdWNlZCB0aGUgcmVzdWx0cyB3ZSB3YW50IHRvIGFjaGlldmUuIEhv
dyBjYW4gd2UgYWRkIHNwZWNpZmljIHNlbnNvciBkZXNjcmlwdGlvbnMgdG8gbWFrZSBpdCBl
ZmZlY3RpdmUuPC9kaXY+PC9ibG9ja3F1b3RlPg==

------=_NextPart_5EA92801_10F35160_3BAEC8DA--



