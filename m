Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED29421109D
	for <lists+openbmc@lfdr.de>; Wed,  1 Jul 2020 18:30:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xmsq5Y0HzDr4Y
	for <lists+openbmc@lfdr.de>; Thu,  2 Jul 2020 02:30:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=59.36.132.77; helo=qq.com; envelope-from=1181052146@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=kKNiCaqO; dkim-atps=neutral
Received: from qq.com (smtpbg475.qq.com [59.36.132.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xmlt6kmdzDqst
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jul 2020 02:24:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1593620634; bh=rhPfdqpXQuskST9dZTOabf3kRy9FZ5bnfFTaYNZDA9o=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=kKNiCaqO4lmyykOHRNfj7JSsRXUTVPaRKBuEbzUI9kt4txFXYGVDKdp3U6nUOGOZt
 NubGRZo7kYdWqZBr4TsjcwbeV762zRVOU+84lyDDnTwFcpKg9to1mQTtyUtAPLxDGf
 FMaS0o3Dr6HqsCd+qLiaXWc4pwl5x+ji39UVI+Is=
X-QQ-FEAT: UlgdEqxMX/LsQHOuPWpusvH/1DEjdjtEkYX712JOFKB5zJW5BPIRAau2TJDUE
 lTm5vSA2vbPhqXVzfjZ1EN9e2KtmkglX6zaBrkB038CZeELmZ7e6L76F8VDg4L3zQIBdDtL
 Ur0i95EpYTy/AHbyVTUNj/fU7piLyFcRJ9N4qq9KnIPX4h+xZ3yGF721/jOBHfkT75Bm+/1
 5GSLgItlD6w5JE2ZWgGQOFFplprYm8R4SYtRX/SrxkvFbQSdDuhPwbLFGTFrbNfjAJzQt6/
 4oK+fQm5K4ATJr
X-QQ-SSF: 00000000000000F000000000000000S
X-QQ-XMAILINFO: Ny+F/mTnIjIKg/uKncmVeB1gDSAd0Ac65E+uJJ3ruOv28fhO3uD9QbdxXkBnFl
 nWkVXhALSpzxNsZkmwpR6O0Sp6o0W7I65CEkWiCLXTnjm7Z6Ay8AUIYEbBOVk7MQnxnuOfeQoEzfO
 iNvxhp1FnOtXyuBpeGKthNTmHEn7DrDDil6AdmB0A/QM0G4f9UukD8I00C8Nj/Osq68KPaBSqSPd6
 5JaJ8WraCgJVpHJ7NvdgjlPnhhS46EQ1/mRIZx0NyWttFlXIddazg5j6owJcYwI7HKbLxFjSOoPCo
 gqJQCAROO+UpdZ5Q6PtfK2VMkTeQqExpAGbstow5QATO1pnM0nDpRnNNd12jtb6XyvRTTdqYPlSbf
 a1iaMG5Ke5MEY4nv6np28qZWIBazjpCBZ5LHvgEc77qXszpFSfraZEITZyWS8oawd/JHyc58JDoOB
 9bARJZ3Vhhsn3JdBCDc/CYimZz7nJhfDXN+KPOGW1SCUzRmMLhirCGQRXZtJ7a+Mpka3p6wisXXls
 xi2/NLTFt4BhgMIyUHz8Op/rJ56NvOmIk394H2Qx26iGyVZhDElX7XvHYKlHEkSk1n1K9ImBFYysu
 iMR/1lBS6RoaPePw2tROy5mAv7rAXncNaRhqN8dgqpKRj4QuRwsVdWyqNGym01S09Wn0mxbnbMNp3
 90I03mIsfeiHu5AZ8=
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 106.47.147.152
X-QQ-STYLE: 
X-QQ-mid: webmail700t1593620632t5694488
From: "=?gb18030?B?xM/SsKXgpeult6WopemltA==?=" <1181052146@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: How can I redirect my usb storage device to host through BMC?
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5EFCB898_111A3E48_5D817856"
Content-Transfer-Encoding: 8Bit
Date: Thu, 2 Jul 2020 00:23:52 +0800
X-Priority: 3
Message-ID: <tencent_603A787DA4AAFF65D9FB47C8274E019D000A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Thu, 02 Jul 2020 00:23:53 +0800 (CST)
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

------=_NextPart_5EFCB898_111A3E48_5D817856
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

R3JlZXRpbmdzIQ0KDQpJIGFtIHVzaW5nIHRoZSB2aXJ0dWFsIG1lZGlhIGZ1bmN0aW9uIG9m
IG9wZW5ibWMuIEkgY2FuIHJlZGlyZWN0IGEgSVNPL0lNRyB0byBob3N0IGJ5IHVzaW5nIHRo
ZSBibWN3ZWIncyB2aXJ0dWFsIG1lZGlhIGZ1bmN0aW9uLg0KQnV0IEkgZG8gbm90IGtub3cg
aG93IHRvIHJlZGlyZWN0IGEgdXNiIHN0b3JhZ2UgZGV2aWNlIHRvIGhvc3QuIElzIHRoZXJl
IGFueSB3YXlzIGZvciBtZSB0byBkbyBzbz8NCg0KQmVzdCBSZWdhcmRzIQ0KTGl1IEhvbmd3
ZWk=

------=_NextPart_5EFCB898_111A3E48_5D817856
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

R3JlZXRpbmdzITxicj48YnI+SSBhbSB1c2luZyB0aGUgdmlydHVhbCBtZWRpYSBmdW5jdGlv
biBvZiBvcGVuYm1jLiBJIGNhbiByZWRpcmVjdCBhIElTTy9JTUcgdG8gaG9zdCBieSB1c2lu
ZyB0aGUgYm1jd2ViJ3MgdmlydHVhbCBtZWRpYSBmdW5jdGlvbi48YnI+QnV0IEkgZG8gbm90
IGtub3cgaG93IHRvIHJlZGlyZWN0IGEgdXNiIHN0b3JhZ2UgZGV2aWNlIHRvIGhvc3QuIElz
IHRoZXJlIGFueSB3YXlzIGZvciBtZSB0byBkbyBzbz88YnI+PGJyPkJlc3QgUmVnYXJkcyE8
YnI+TGl1IEhvbmd3ZWk8YnI+

------=_NextPart_5EFCB898_111A3E48_5D817856--



