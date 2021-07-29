Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 832E13DA58C
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 16:02:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbC0R2cwRz3cRK
	for <lists+openbmc@lfdr.de>; Fri, 30 Jul 2021 00:02:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=vVP993V6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=162.62.57.137; helo=out162-62-57-137.mail.qq.com;
 envelope-from=1181052146@qq.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=vVP993V6; dkim-atps=neutral
X-Greylist: delayed 376 seconds by postgrey-1.36 at boromir;
 Fri, 30 Jul 2021 00:02:29 AEST
Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com
 [162.62.57.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GbC0503LQz3bWC
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jul 2021 00:02:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1627567339; bh=lAzbRy2uym6IAwGTp8+rf8vF65voWuPx7l2L5sO7Mgk=;
 h=From:To:Cc:Subject:Date;
 b=vVP993V6lQOgNPoWdHGhM3/FC+Rm/pblbqqOvYYB6eKHAKjgcgGbNvL6NgUGJd6SY
 ACfaHy5+mjnnUB4jbn+wbnOjDl+3+jaZNx4oL6er38Z2cmc0qDtqTaESkFLuGYl8t6
 QHcvKD9UaHmdoSv6Srs7zMvleRTanOpGyStf2PD0=
X-QQ-FEAT: oHWrrGTW1dCWRdSvFwk8wS1KfV3fUYN8
X-QQ-SSF: 00000000000000F000000000000000S
X-QQ-XMAILINFO: N4rl9N6sbzGKqjj1Tt5pILgoT/In3JXQm5RSS1FbADmfteqtwkZ1zqISwX7PTF
 jAt2K9AZJtTd9J9kggP531cRlp8Ef6IzW3DsIWHYvYyskLRqaVj6X0RLPqbcndWn7SdhtyInxurpQ
 3lLYlhdvIhlYX9zCpGNXp7V710Rfk6hLxTZYaC+KPaTVZis5F2B2I06vFdaGUPscZqIOmOiaHZfJD
 PtdYZwijFJ696pRFB4SfsvG0h8bkFUKKUbSg/0AhPXNXN0L8dW80WZuHVdj4TPRQQBBQ7xxdX+ofa
 o5psmD7wM2OJG24LpgfhpljXqLKjHBPfikp73x3EtnyTSpZa3GFTjrc2H65mwDgoAxmHqBhR5FWfj
 nCkkegCOaFhsPTM1i+mJbnYxB2yD4mXX+++ARtLifO0m6Ohosfnfnm0G4/fdMKJVjyvp05Y4j4iLl
 hWaxHMyvg5TbsMmATzsIpGw2BdHPhmenJtvd1mH+QvHr8jOTVsNVeircgtSeWerS16NVw6reYV36Y
 3RHgQ6WxduBS0kZFfrBxAmzZuFq8BPt2EYwThosll81+DfZNzVuI89v2I1c1abmfjphlpTws0QBqb
 CYBzyFLQWGm2WCbza2JFiruZbIWMi05yiqjN9UsowNVDwl1bBrn7zkxsnF8aaoZVF3KOHQoDeNR4L
 Sk3XH0e4WovgJMo7zpsaQylwPOIlaM0wKKNsWfpmj1iTftUuMzFXFF8CHqzQM20fIXp6S252OpFaE
 8JzlrTQYyImEUq++26N+2/Xun9FCzTyPc+0Jgs/qnIOZeEc3JQU6hyCwy5ok1Y8Utb+VoIFa/bShw
 j3UZLQUGQuefMtRuCk+FokJfUTGyriIuzFRU3udaq3hL
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 124.126.116.144
X-QQ-STYLE: 
X-QQ-mid: webmail620t1627566873t46053
From: "=?gb18030?B?xM/SsKXgpeult6WopemltA==?=" <1181052146@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: How about the performance of 2D enging in AST2400
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_6102B319_1109EE98_73BD56C8"
Content-Transfer-Encoding: 8Bit
Date: Thu, 29 Jul 2021 21:54:33 +0800
X-Priority: 3
Message-ID: <tencent_D89F529E732AEFA4CBA1EEC3597D210BC305@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
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
Cc: =?gb18030?B?eGlhaGFvanVu?= <xiahaojun@iie.ac.cn>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.

------=_NextPart_6102B319_1109EE98_73BD56C8
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

R3JlZXRpbmdzOg0KSSBhbSB1c2luZyBBU1QyNDAwIHJlY2VudGx5IGFuZCB1c2UgaXRzIFZH
QSBjb250cm9sbGVyIGFzIG15IHNlcnZlcidzIEdyYXBoaWMgQ2FyZC4gSSBub3RpY2UgdGhh
dCBBU1QyNDAwIHN1cHBvcnRzIDJEIGFjY2VsZXJhdGlvbiB2aWEgMkQgZW5naW5lLiBJIHdv
bmRlciBob3cgYWJvdXQgdGhlIHBlcmZvcm1hbmNlIG9mIEFTVDI0MDAncyAyRCBlbmdpbmUg
YW5kIHdoaWNoIGludGVyZmFjZSBpdCBzdXBwb3J0LCBPcGVuVkcsIE9wZW5HTCBvciBhbnkg
b3RoZXJzLg0KVGhhbmtzIGZvciB5b3VyIHJlcGx5IQ0KQmVzdCBSZWdhcmRzIQ0KTGl1IEhv
bmd3ZWk=

------=_NextPart_6102B319_1109EE98_73BD56C8
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj5HcmVldGluZ3M6PC9kaXY+PGRpdj5JIGFtIHVzaW5nIEFT
VDI0MDAgcmVjZW50bHkgYW5kIHVzZSBpdHMgVkdBIGNvbnRyb2xsZXIgYXMgbXkgc2VydmVy
J3MgR3JhcGhpYyBDYXJkLiBJIG5vdGljZSB0aGF0IEFTVDI0MDAgc3VwcG9ydHMgMkQgYWNj
ZWxlcmF0aW9uIHZpYSAyRCBlbmdpbmUuIEkgd29uZGVyIGhvdyBhYm91dCB0aGUgcGVyZm9y
bWFuY2Ugb2YgQVNUMjQwMCdzIDJEIGVuZ2luZSBhbmQgd2hpY2ggaW50ZXJmYWNlIGl0IHN1
cHBvcnQsIE9wZW5WRywgT3BlbkdMIG9yIGFueSBvdGhlcnMuPC9kaXY+PGRpdj5UaGFua3Mg
Zm9yIHlvdXIgcmVwbHkhPC9kaXY+PGRpdj5CZXN0IFJlZ2FyZHMhPC9kaXY+PGRpdj5MaXUg
SG9uZ3dlaTwvZGl2Pg==

------=_NextPart_6102B319_1109EE98_73BD56C8--

