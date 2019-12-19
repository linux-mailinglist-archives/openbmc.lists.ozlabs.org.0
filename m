Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB27125C90
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 09:26:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47dlMn60ynzDqpL
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 19:26:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=203.205.250.33; helo=smtpbg.qq.com; envelope-from=1181052146@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="z4xdD//7"; 
 dkim-atps=neutral
Received: from smtpbg.qq.com (smtpbg506.qq.com [203.205.250.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47dlM118mzzDqnT
 for <openbmc@lists.ozlabs.org>; Thu, 19 Dec 2019 19:25:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1576743928; bh=Ohx4nCQYi3CPDI9CQl//Nnc4d5edcT8dqe453l+JRdo=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=z4xdD//7TfsFDJpbAmb3cnD3+6EqWZ5sxYizmomWTPWcaaWYX2ajnAVat8QZE/14S
 zkzrcbTKq2PYmPr0ZwNcIVJ5yoqrESjDGFP30IO5Rk/zdMo9etYakc8nwQyFuqsSxB
 id0rnDvZvDSJPhAKZNseHQIwgP1UHCnGPd3AQjKY=
X-QQ-FEAT: R/yWRekfFcouxAf+nnw5Vor5r2iTtSASrYG+iGWgEF8uOp7GjNEb1AcYZqPx1
 42jUz8qid0tcyrJb6QzOyc0Cslgy9WhRuFLfP6PUKNiUVrr8xP+enIRHv+GVGhUdZh9aK5r
 uLXAlr4KvMRBFnej3qtFIr3rPoS1w1PYmHwFYuXeotvvHdCtqhQKNHuIKfWW/LD4nJIhvi3
 /Ep4lrGTQIemUKoZqoxcm6DQej06LOH0Duv+9cf5AW4wN+Nbfei0Mcx1C2uZ8836GT5CkZ5
 zwU2dklwyjOiPI2slDcQN3x7E=
X-QQ-SSF: 00000000000000F000000000000000S
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 211.75.14.191
X-QQ-STYLE: 
X-QQ-mid: webmail700t1576743926t7312903
From: "=?gb18030?B?xM/SsKXgpeult6WopemltA==?=" <1181052146@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: how the openbmc running in qemu communicate with the operating system
 running in another qemu via KCS/BT?
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5DFB33F6_11F20C18_21DED09C"
Content-Transfer-Encoding: 8Bit
Date: Thu, 19 Dec 2019 16:25:26 +0800
X-Priority: 3
Message-ID: <tencent_0139807C40A9C767A1F947C84B4CD99FE80A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Thu, 19 Dec 2019 16:25:27 +0800 (CST)
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

------=_NextPart_5DFB33F6_11F20C18_21DED09C
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

R3JlZXRpbmdzIQ0KDQoNCkkgYW0gYSBsZWFybmVyIG9mIG9wZW5ibWMsIGZvciBzb21lIHJl
YXNvbiBJIGRvIG5vdCBoYXZlIGEgcmVhbCBCTUMgbm9yIGEgcmVhbCBzZXJ2ZXIsIEkgcnVu
IG9wZW5ibWMgaW4gcWVtdS4gUmVjZW50bGx5IEkgd2FudCB0byBsZWFybiBob3cgQk1DIGNv
bW11bmljYXRlIHdpdGggSE9TVCBTeXN0ZW0uIEJ1dCBpdCBzZWVtcyBxZW11IGNhbiBub3Qg
ZW11bGF0ZSB0aGlzIHNjZW5hcmlvLiZuYnNwOw0KQ2FuIHNvbWVvbmUgaGVscCB0ZWxsIG1l
Og0KSXMgdGhlcmUgYSBtZWNoYW5pc20gYWxsb3cgbWUgdG8gcnVuIG9wZW5ibWMgaW4gcWVt
dTEgYW5kIGF0IHRoZSBzYW1lIHRpbWUgcnVuIE9TIGluIHFlbXUyLiBBbmQgbGV0IHFlbXUx
IHJ1biBhcyB0aGUgcWVtdTIncyBCTUMgaGFyZHdhcmUgYW5kIGNvbW11bmljYXRlIHZpYSBL
Q1Mgb3IgQlQgaW50ZXJmYWNlPyBMaWtlIHRoZSBmb2xsb3dpbmcgc2VxdWVuY2U6DQpbcWVt
dTEmbmJzcDsgW29wZW5ibWMmbmJzcDsgW2J0LWJtY11dXTwtLS0tLS1MUEMtLS0tLS0tLSZn
dDt8LS0tLS1zeXN0ZW0gSVBDLS0tLS18PC0tLS0tLUxQQy0tLS0tLS0tJmd0O1tbW2lwbWlf
c2ldJm5ic3A7IGhvc3RdJm5ic3A7IHFlbXUyXQ0KQW5kIHdoYXQgY2FuIEkgZG8/DQpJIGhh
dmUgc2VlbiB0aGVyZSBpcyBzb21lIGNvZGUgaW4gcWVtdSBzb3VyY2UgY29kZToNCnFlbXUv
aHcvaXBtaS8qDQphbmQgaW4gbGludXgtNS4zIHNvdXJjZSBjb2RlOg0KZHJpdmVycy9jaGFy
L2lwbWkvKg0KRG9zZSB0aGlzIGNhbiBoZWxwIG1pdGlnYXRlIG15IHByb2JsZW0/DQoNCg0K
QmVzdCBSZWdhcmRzIQ0KTGl1IEhvbmd3ZWk=

------=_NextPart_5DFB33F6_11F20C18_21DED09C
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PGRpdj5HcmVldGluZ3MhPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGFtIGEgbGVhcm5l
ciBvZiBvcGVuYm1jLCBmb3Igc29tZSByZWFzb24gSSBkbyBub3QgaGF2ZSBhIHJlYWwgQk1D
IG5vciBhIHJlYWwgc2VydmVyLCBJIHJ1biBvcGVuYm1jIGluIHFlbXUuIFJlY2VudGxseSBJ
IHdhbnQgdG8gbGVhcm4gaG93IEJNQyBjb21tdW5pY2F0ZSB3aXRoIEhPU1QgU3lzdGVtLiBC
dXQgaXQgc2VlbXMgcWVtdSBjYW4gbm90IGVtdWxhdGUgdGhpcyBzY2VuYXJpby4mbmJzcDs8
L2Rpdj48ZGl2PkNhbiBzb21lb25lIGhlbHAgdGVsbCBtZTo8L2Rpdj48ZGl2PklzIHRoZXJl
IGEgbWVjaGFuaXNtIGFsbG93IG1lIHRvIHJ1biBvcGVuYm1jIGluIHFlbXUxIGFuZCBhdCB0
aGUgc2FtZSB0aW1lIHJ1biBPUyBpbiBxZW11Mi4gQW5kIGxldCBxZW11MSBydW4gYXMgdGhl
IHFlbXUyJ3MgQk1DIGhhcmR3YXJlIGFuZCBjb21tdW5pY2F0ZSB2aWEgS0NTIG9yIEJUIGlu
dGVyZmFjZT8gTGlrZSB0aGUgZm9sbG93aW5nIHNlcXVlbmNlOjwvZGl2PjxkaXY+W3FlbXUx
Jm5ic3A7IFtvcGVuYm1jJm5ic3A7IFtidC1ibWNdXV0mbHQ7LS0tLS0tTFBDLS0tLS0tLS0m
Z3Q7fC0tLS0tc3lzdGVtIElQQy0tLS0tfCZsdDstLS0tLS1MUEMtLS0tLS0tLSZndDtbW1tp
cG1pX3NpXSZuYnNwOyBob3N0XSZuYnNwOyBxZW11Ml08L2Rpdj48ZGl2PkFuZCB3aGF0IGNh
biBJIGRvPzwvZGl2PjxkaXY+SSBoYXZlIHNlZW4gdGhlcmUgaXMgc29tZSBjb2RlIGluIHFl
bXUgc291cmNlIGNvZGU6PC9kaXY+PGRpdj5xZW11L2h3L2lwbWkvKjwvZGl2PjxkaXY+YW5k
IGluIGxpbnV4LTUuMyBzb3VyY2UgY29kZTo8L2Rpdj48ZGl2PmRyaXZlcnMvY2hhci9pcG1p
Lyo8L2Rpdj48ZGl2PkRvc2UgdGhpcyBjYW4gaGVscCBtaXRpZ2F0ZSBteSBwcm9ibGVtPzwv
ZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QmVzdCBSZWdhcmRzITwvZGl2PjxkaXY+TGl1IEhv
bmd3ZWk8L2Rpdj4=

------=_NextPart_5DFB33F6_11F20C18_21DED09C--

