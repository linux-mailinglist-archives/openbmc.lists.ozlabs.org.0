Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5142C32523C
	for <lists+openbmc@lfdr.de>; Thu, 25 Feb 2021 16:21:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dmc1q1Zp7z3cZL
	for <lists+openbmc@lfdr.de>; Fri, 26 Feb 2021 02:21:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bisyst.ru header.i=@bisyst.ru header.a=rsa-sha256 header.s=mail header.b=JqFiOkmP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bisyst.ru (client-ip=2a02:6b8:0:1a2d::606;
 helo=forward103o.mail.yandex.net; envelope-from=pavlov@bisyst.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bisyst.ru header.i=@bisyst.ru header.a=rsa-sha256
 header.s=mail header.b=JqFiOkmP; dkim-atps=neutral
X-Greylist: delayed 507 seconds by postgrey-1.36 at boromir;
 Fri, 26 Feb 2021 02:20:50 AEDT
Received: from forward103o.mail.yandex.net (forward103o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::606])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dmc1Z38sFz3cWJ
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2021 02:20:50 +1100 (AEDT)
Received: from forward103q.mail.yandex.net (forward103q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:50:0:640:b21c:d009])
 by forward103o.mail.yandex.net (Yandex) with ESMTP id 975D75F82C47
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2021 18:12:09 +0300 (MSK)
Received: from vla5-8987bf54d6da.qloud-c.yandex.net
 (vla5-8987bf54d6da.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3614:0:640:8987:bf54])
 by forward103q.mail.yandex.net (Yandex) with ESMTP id 9511761E0005
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2021 18:12:09 +0300 (MSK)
Received: from mail.yandex.ru (mail.yandex.ru [46.148.198.118])
 by vla5-8987bf54d6da.qloud-c.yandex.net (mxback/Yandex) with HTTP id
 4CmxdX0HqiE1-C8HuG2nw; Thu, 25 Feb 2021 18:12:09 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bisyst.ru; s=mail;
 t=1614265929; bh=o7QCOrEQcHWjc1GnvgyOZkpmDl8DYiJGbF/KOrB3IeQ=;
 h=Message-Id:Date:Subject:To:From;
 b=JqFiOkmPojXrKHeRnzTgAiwW+C0a382W3y5hO4usQzJd4Q7mtbKmXHtEkwyDh6Q6p
 +pksSknmp/UOeoU0UJa3cNcc05vW80GE2vpwTizERFFPvh/8MFe9aTJf6QdME6qtug
 NdJm5QYZra2B/4I8lGWTFhPIWwY0gu9ciMr244F8=
Authentication-Results: vla5-8987bf54d6da.qloud-c.yandex.net;
 dkim=pass header.i=@bisyst.ru
Received: by vla1-3b11765fa32e.qloud-c.yandex.net with HTTP;
 Thu, 25 Feb 2021 18:12:08 +0300
From: =?utf-8?B?0J3QuNC60LjRgtCwINCf0LDQstC70L7Qsg==?= <pavlov@bisyst.ru>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Question about compile bmcweb
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 25 Feb 2021 18:12:08 +0300
Message-Id: <170251614265496@mail.yandex.ru>
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8
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

PGRpdj48ZGl2Pm5pa2l0YUB1YnVudHU6fi9ibWN3ZWIkIG5pbmphIC1DIGJ1aWxkZGlyPC9kaXY+
PGRpdj5uaW5qYTogRW50ZXJpbmcgZGlyZWN0b3J5IGBidWlsZGRpcic8L2Rpdj48ZGl2PlsxLzI0
XSBDb21waWxpbmcgQysrIG9iamVjdCAnc3VicHJvamVjdHMvdGlueXhtbDItNy4wLjEvY2U5NzI2
NUBAeG1sdGVzdEBleGUveG1sdGVzdC5jcHAubycuPC9kaXY+PGRpdj5GQUlMRUQ6IHN1YnByb2pl
Y3RzL3Rpbnl4bWwyLTcuMC4xL2NlOTcyNjVAQHhtbHRlc3RAZXhlL3htbHRlc3QuY3BwLm/CoDwv
ZGl2PjxkaXY+YysrIC1Jc3VicHJvamVjdHMvdGlueXhtbDItNy4wLjEvY2U5NzI2NUBAeG1sdGVz
dEBleGUgLUlzdWJwcm9qZWN0cy90aW55eG1sMi03LjAuMSAtSS4uL3N1YnByb2plY3RzL3Rpbnl4
bWwyLTcuMC4xIC1mbHRvIC1mZGlhZ25vc3RpY3MtY29sb3I9YWx3YXlzIC1waXBlIC1EX0ZJTEVf
T0ZGU0VUX0JJVFM9NjQgLVdhbGwgLVdpbnZhbGlkLXBjaCAtV25vbi12aXJ0dWFsLWR0b3IgLVdl
eHRyYSAtV3BlZGFudGljIC1XZXJyb3IgLXN0ZD1jKysxNyAtZm5vLXJ0dGkgLU8yIC1nIC1NRCAt
TVEgJ3N1YnByb2plY3RzL3Rpbnl4bWwyLTcuMC4xL2NlOTcyNjVAQHhtbHRlc3RAZXhlL3htbHRl
c3QuY3BwLm8nIC1NRiAnc3VicHJvamVjdHMvdGlueXhtbDItNy4wLjEvY2U5NzI2NUBAeG1sdGVz
dEBleGUveG1sdGVzdC5jcHAuby5kJyAtbyAnc3VicHJvamVjdHMvdGlueXhtbDItNy4wLjEvY2U5
NzI2NUBAeG1sdGVzdEBleGUveG1sdGVzdC5jcHAubycgLWMgLi4vc3VicHJvamVjdHMvdGlueXht
bDItNy4wLjEveG1sdGVzdC5jcHA8L2Rpdj48ZGl2Pi4uL3N1YnByb2plY3RzL3Rpbnl4bWwyLTcu
MC4xL3htbHRlc3QuY3BwOiBJbiBmdW5jdGlvbiDigJhpbnQgbWFpbihpbnQsIGNvbnN0IGNoYXIq
KinigJk6PC9kaXY+PGRpdj4uLi9zdWJwcm9qZWN0cy90aW55eG1sMi03LjAuMS94bWx0ZXN0LmNw
cDo3MDc6MTA6IGVycm9yOiBpZ25vcmluZyByZXR1cm4gdmFsdWUgb2Yg4oCYY2hhciogZmdldHMo
Y2hhciosIGludCwgRklMRSop4oCZLCBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSB3YXJuX3VudXNl
ZF9yZXN1bHQgWy1XZXJyb3I9dW51c2VkLXJlc3VsdF08L2Rpdj48ZGl2PsKgIDcwNyB8IMKgIMKg
IGZnZXRzKCBzYXZlZEJ1ZiwgMjU2LCBzYXZlZCApOzwvZGl2PjxkaXY+wqAgwqAgwqAgfCDCoCDC
oCB+fn5+fl5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fjwvZGl2PjxkaXY+Li4vc3VicHJvamVjdHMv
dGlueXhtbDItNy4wLjEveG1sdGVzdC5jcHA6MTA2Nzo5OiBlcnJvcjogaWdub3JpbmcgcmV0dXJu
IHZhbHVlIG9mIOKAmGNoYXIqIGZnZXRzKGNoYXIqLCBpbnQsIEZJTEUqKeKAmSwgZGVjbGFyZWQg
d2l0aCBhdHRyaWJ1dGUgd2Fybl91bnVzZWRfcmVzdWx0IFstV2Vycm9yPXVudXNlZC1yZXN1bHRd
PC9kaXY+PGRpdj7CoDEwNjcgfCDCoCDCoGZnZXRzKCBidWYsIDEwMjQsIHRleHRmaWxlICk7PC9k
aXY+PGRpdj7CoCDCoCDCoCB8IMKgIMKgfn5+fn5efn5+fn5+fn5+fn5+fn5+fn5+fn5+fjwvZGl2
PjxkaXY+Y2MxcGx1czogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzPC9kaXY+
PGRpdj7CoDwvZGl2PjxkaXY+SGVscCBwbGVhc2U8L2Rpdj48ZGl2PkhvdyB0byBmaXggdGhpcyBw
cm9ibGVtLCBiZWNhdXNlIEkgY2FudCBjb21waWxlIGJtY3dlYiB3aXRoIHRoaXMgZXJyb3JzLjwv
ZGl2PjwvZGl2Pg==
