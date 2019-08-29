Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9042A1656
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 12:37:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JzZN2lmczDqn1
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 20:37:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=203.205.250.114; helo=smtpbg.qq.com;
 envelope-from=1450335857@qq.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="CaA9CUf9"; 
 dkim-atps=neutral
X-Greylist: delayed 66 seconds by postgrey-1.36 at bilbo;
 Thu, 29 Aug 2019 20:36:32 AEST
Received: from smtpbg.qq.com (smtpbg505.qq.com [203.205.250.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JzYX0XXNzDqSM
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 20:36:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1567074985; bh=vETSxXFz+z6kkvd8+tgnd2IUnTRcMWof/A+nrcPf4o0=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=CaA9CUf9ajaWBZO94dIpZ+/EIldSm9k6alYLf8R5FmyBBOvmmLY9+Z9NrTxd+n4+v
 Qva+FFHo6iB8SIDN4atM8dpKUfQzWTUqIXStWoHkzR6V16Ba7mulBOoxWJ+54nh58Z
 35RSdFGuMNzwSuBZB8BQyXr38sZGKaPmBUY84RVI=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
In-Reply-To: <mailman.1763.1567021708.372.openbmc@lists.ozlabs.org>
References: <mailman.1763.1567021708.372.openbmc@lists.ozlabs.org>
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1567074663t463459
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: How to configure the snmp trap
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5D67A966_0E3F04B0_1EE927D1"
Content-Transfer-Encoding: 8Bit
Date: Thu, 29 Aug 2019 18:31:02 +0800
X-Priority: 3
Message-ID: <tencent_2C97DABC4F44BB346BFBDE36@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 386828080
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Thu, 29 Aug 2019 18:31:04 +0800 (CST)
Feedback-ID: webenglish:qq.com:bgweb:bgweb1
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
Cc: =?ISO-8859-1?B?UmF0YW4gR3VwdGE=?= <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.

------=_NextPart_5D67A966_0E3F04B0_1EE927D1
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgUmF0YW4sDQogIEkgYW0gdHJ5IHRvIHRlc3QgdGhlIHNubXAgdHJhcCBmZWF0dXJlIG9u
IG9wZW5ibWMgMi44LjAtZGV2Lg0KVGhlcmUgaXMgbm8gbW9yZSBzbm1wIHV0aWwgY29tbWFu
ZHMgc3VjaCBhcyBzbm1wdHJhcCBldGMuIGV4cGVjdCAgIHBob3NwaG9yLW5ldHdvcmstc25t
cGNvbmYgLiBUaGUgZG9jdW1lbnQgLA0KICBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9w
aG9zcGhvci1zbm1wL2Jsb2IvbWFzdGVyL2RvY3Mvc25tcC1jb25maWd1cmF0aW9uLm1kICwg
IGRvZXMgbm90IGd1aWRlIG1lIHRvIGRvIHRoZSBzbm1wIHRyYXAgdGVzdC4NCiAgV291bGQg
eW91IGxpa2UgdG8gZ2l2ZSBtZSBhIGRldGFpbCBpbnN0cnVjdGlvbiB0byBkbyB0aGUgc25t
cCB0cmFwIHRlc3Q/IA0KDQoNCkJlc3QsDQpYaXV6aGk=

------=_NextPart_5D67A966_0E3F04B0_1EE927D1
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj5IaSBSYXRhbiw8L2Rpdj48ZGl2PiZuYnNwOyBJIGFtIHRyeSB0byB0ZXN0IHRoZSBz
bm1wIHRyYXAgZmVhdHVyZSBvbiBvcGVuYm1jIDIuOC4wLWRldi48L2Rpdj48ZGl2PlRoZXJl
IGlzIG5vIG1vcmUgc25tcCB1dGlsIGNvbW1hbmRzIHN1Y2ggYXMgc25tcHRyYXAgZXRjLiBl
eHBlY3QmbmJzcDsgJm5ic3A7cGhvc3Bob3ItbmV0d29yay1zbm1wY29uZiAuIFRoZSBkb2N1
bWVudCAsPC9kaXY+PGRpdj4mbmJzcDsmbmJzcDtodHRwczovL2dpdGh1Yi5jb20vb3BlbmJt
Yy9waG9zcGhvci1zbm1wL2Jsb2IvbWFzdGVyL2RvY3Mvc25tcC1jb25maWd1cmF0aW9uLm1k
ICwmbmJzcDsgZG9lcyBub3QgZ3VpZGUgbWUgdG8gZG8gdGhlIHNubXAgdHJhcCB0ZXN0Ljwv
ZGl2PjxkaXY+Jm5ic3A7IFdvdWxkIHlvdSBsaWtlIHRvIGdpdmUgbWUgYSBkZXRhaWwgaW5z
dHJ1Y3Rpb24gdG8gZG8gdGhlIHNubXAgdHJhcCB0ZXN0Pzxmb250IGNvbG9yPSIjMzMzMzMz
IiBmYWNlPSJhcmlhbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTogMTZweDsiPiZuYnNwOzwv
c3Bhbj48L2ZvbnQ+PC9kaXY+PGRpdj48Zm9udCBjb2xvcj0iIzMzMzMzMyIgZmFjZT0iYXJp
YWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6IDE2cHg7Ij48YnI+PC9zcGFuPjwvZm9udD48
L2Rpdj48ZGl2Pjxmb250IGNvbG9yPSIjMzMzMzMzIiBmYWNlPSJhcmlhbCI+PHNwYW4gc3R5
bGU9ImZvbnQtc2l6ZTogMTZweDsiPkJlc3QsPC9zcGFuPjwvZm9udD48L2Rpdj48ZGl2Pjxm
b250IGNvbG9yPSIjMzMzMzMzIiBmYWNlPSJhcmlhbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6
ZTogMTZweDsiPlhpdXpoaTwvc3Bhbj48L2ZvbnQ+PC9kaXY+

------=_NextPart_5D67A966_0E3F04B0_1EE927D1--

