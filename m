Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FD9299403
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 18:38:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKhs05f5bzDqQ6
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 04:38:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yandex-team.ru (client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 helo=forwardcorp1p.mail.yandex.net; envelope-from=kitsok@yandex-team.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=yandex-team.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.a=rsa-sha256 header.s=default header.b=1Pcyq1/N; 
 dkim-atps=neutral
Received: from forwardcorp1p.mail.yandex.net (forwardcorp1p.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b6:217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKhr82TC0zDqGL
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 04:37:57 +1100 (AEDT)
Received: from sas1-5717c3cea310.qloud-c.yandex.net
 (sas1-5717c3cea310.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:3616:0:640:5717:c3ce])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 64E842E1286
 for <openbmc@lists.ozlabs.org>; Mon, 26 Oct 2020 20:37:20 +0300 (MSK)
Received: from localhost (localhost [::1])
 by sas1-5717c3cea310.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 cYyWJ2UqQj-bKw0CEKb; Mon, 26 Oct 2020 20:37:20 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1603733840; bh=pTlZuDBQQqx5J5fz9RtmlGtlhIcLBdAHzra4zpdRlw0=;
 h=Date:Message-Id:Subject:To:From;
 b=1Pcyq1/NsJj2dFmfrK5UdkWKKkfz4DJSgkK5rHa5en0RTLUB96x6NA2ZNkyQgBVZq
 RfDuchWZhjBfcgTdmaKqzzau4mzy5k8LUeYXM+FHpFfZZtcJjT7y7hWkOApl4k/6Cn
 /6tPAyY0eJtvF29bSrdIj0+saJmwKm3Ys8H00bIQ=
Authentication-Results: sas1-5717c3cea310.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000049860
X-Yandex-Avir: 1
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net [2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by sas1-c3eab8bf7b15.qloud-c.yandex.net with LMTP id NqGYyvTNcG-XEXqtKsk
 for <kitsok@yandex-team.ru>; Mon, 26 Oct 2020 20:37:10 +0300
Received: by vla5-c30c59847b9e.qloud-c.yandex.net with HTTP;
 Mon, 26 Oct 2020 20:37:09 +0300
From: Konstantin Klubnichkin <kitsok@yandex-team.ru>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: AST2500 PWM/Tacho problem
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Mon, 26 Oct 2020 20:37:20 +0300
Message-Id: <208531603730759@mail.yandex-team.ru>
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

PGRpdj5IZWxsbyBhbGwhPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+SSdtIHRyeWluZyB0byBnZXQg
Y29udHJvbCBvdmVyIGZhbnMgY29ubmVjdGVkIHRvIFBXTS9UYWNobyBjb250cm9sbGVyIHdpdGhv
dXQgc3VjY2Vzcy48L2Rpdj48ZGl2PlRoZSBjb25maWd1cmF0aW9uIGluIERUUyBpcyBzdGFuZGFy
ZDo8L2Rpdj48ZGl2PjxkaXY+JmFtcDtwd21fdGFjaG8gezwhLS0gLS0+PC9kaXY+PGRpdj5zdGF0
dXMgPSAib2theSI7PC9kaXY+PGRpdj5waW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOzwvZGl2Pjxk
aXY+cGluY3RybC0wID0gJmx0OyZhbXA7cGluY3RybF9wd20wX2RlZmF1bHQgJmFtcDtwaW5jdHJs
X3B3bTFfZGVmYXVsdCZndDs7PC9kaXY+PGRpdj5mYW5AMCB7IHJlZyA9ICZsdDsweDAwJmd0Ozsg
YXNwZWVkLGZhbi10YWNoLWNoID0gL2JpdHMvIDggJmx0OzB4MDAmZ3Q7OyB9OzwvZGl2PjxkaXY+
ZmFuQDEgeyByZWcgPSAmbHQ7MHgwMSZndDs7IGFzcGVlZCxmYW4tdGFjaC1jaCA9IC9iaXRzLyA4
ICZsdDsweDAxJmd0OzsgfTs8L2Rpdj59PGRpdj7CoDwvZGl2PjxkaXY+U3lzZnMgZW50cmllcyBh
cmUgY3JlYXRlZCBhbmQgdGhlcmUgYXJlIG5vIGVycm9ycyBpbiBkbWVzZy48L2Rpdj48ZGl2PsKg
PC9kaXY+PGRpdj5CdXQgaWYgSSB3cml0ZSBwd20mbHQ7ZmFuIG51bWJlciZndDsgaW4gL3N5cy9j
bGFzcy9od21vbi8uLi4gZmFucyBjb250aW51ZSB0byByb3RhdGUgYXQgbWF4aW11bSBzcGVlZC48
L2Rpdj48ZGl2PlJlYWQgZnJvbSBmYW5faW5wdXQgZ2l2ZXMgdGltZW91dCBlcnJvci4gUmF3IHJl
YWQgZnJvbSBQVENSMkMgdXNpbmcgZGV2bWVtIGdpdmVzIDB4MDAwMUVFRkUgYWxsIHRoZSB0aW1l
LjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2PkkndmUgY2hlY2tlZCBhbGwgU0NVcyBpbnZvbHZlZCBp
biBQV00gcGlucyBhbmQgYWRkZWQgc29tZSBkZWJ1ZyB0byBwaW4gY29udHJvbGxlciBjb2RlIC0g
aXQgbG9va3MgbGlrZSB0aGVyZSBhcmUgbm8gaXNzdWVzIHdpdGggcGluIGNvbnRyb2wuPC9kaXY+
PGRpdj5JJ3ZlIHJldmlld2VkIGhhcmR3YXJlIHN0cmlwZXMgYW5kIGxvb2tzIGxpa2UgdGhlcmUg
YXJlIG5vIHN0cmlwZXMgdGhhdCBtYXkgYWZmZWN0IHB3bS90YWNobyBjb250cm9sbGVyLjwvZGl2
PjxkaXY+wqA8L2Rpdj48ZGl2PldoYXQgYW0gSSBtaXNzaW5nIGFuZCB3aGF0IGVsc2UgY2FuIGJl
IGNoZWNrZWQ/PC9kaXY+PC9kaXY+PGRpdj5UaGFuayB5b3UhPC9kaXY+PGRpdj4tLcKgPC9kaXY+
PGRpdj5CZXN0IHJlZ2FyZHMsPC9kaXY+PGRpdj5Lb25zdGFudGluIEtsdWJuaWNoa2luLDwvZGl2
PjxkaXY+bGVhZCBmaXJtd2FyZSBlbmdpbmVlciw8L2Rpdj48ZGl2PnNlcnZlciBoYXJkd2FyZSBS
JmFtcDtEIGdyb3VwLDwvZGl2PjxkaXY+WWFuZGV4IE1vc2NvdyBvZmZpY2UuPC9kaXY+PGRpdj50
ZWw6ICs3LTkwMy01MTAtMzMtMzM8L2Rpdj48ZGl2PsKgPC9kaXY+
