Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 195EA45D631
	for <lists+openbmc@lfdr.de>; Thu, 25 Nov 2021 09:30:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J09zZ0GJ8z3cPr
	for <lists+openbmc@lfdr.de>; Thu, 25 Nov 2021 19:30:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ChJYRMWJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.15.241; helo=m15241.mail.126.com;
 envelope-from=cld795@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=ChJYRMWJ; dkim-atps=neutral
Received: from m15241.mail.126.com (m15241.mail.126.com [220.181.15.241])
 by lists.ozlabs.org (Postfix) with ESMTP id 4J09z719plz2x9X
 for <openbmc@lists.ozlabs.org>; Thu, 25 Nov 2021 19:29:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=b6WLL
 0U+s0s+AZ4tRhfDOcG1akRqvY09w+nhV9Ei1b0=; b=ChJYRMWJaP502jb1MqUcU
 H0O1pRzEBTVFA9X9HUyoRyBQyTv+Ouh/xrutp9Vy7eBNNyB3S2PDAkG9ljn69aBB
 Tiv88DydNn+X8zl66FrPV9Ua8mIYjaGSCbxQOg0/WdG5lhroSlmaA877EkPnU3Wv
 gWxzz0j3mq67MbJI9mGl9w=
Received: from cld795$163.com ( [183.6.112.102] ) by ajax-webmail-wmsvr209
 (Coremail) ; Thu, 25 Nov 2021 16:29:23 +0800 (GMT+08:00)
X-Originating-IP: [183.6.112.102]
Date: Thu, 25 Nov 2021 16:29:23 +0800 (GMT+08:00)
From: Landon <cld795@163.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: openBMC pwm-fan control policy
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 MailMasterPC/4.15.8.1002_(Windows_10_20H2) Copyright (c) 2002-2021
 www.mailtech.cn 163com
In-Reply-To: <mailman.0.1637828525.15424.openbmc@lists.ozlabs.org>
References: <mailman.0.1637828525.15424.openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; 
 boundary="----=_Part_42957_1156991552.1637828963253"
MIME-Version: 1.0
Message-ID: <217ffd16.389b.17d5636abb5.Coremail.cld795@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: kMeowACXn7NjSZ9hH21EAQ--.17349W
X-CM-SenderInfo: 5foglmqv6rljoofrz/1tbiqBZWgFc7Wzht+AABsz
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
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

------=_Part_42957_1156991552.1637828963253
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SGVsbG8gZXZlcnlvbmUsIEkgd291bGQgbGlrZSB0byBhc2sgd2hhdCBpcyBzdXBwb3J0ZWQgYnkg
b3BlbkJNQyBwd20tZmFuIGNvbnRyb2wgcG9saWN5PwpDYW4gaXQgYmUgbGlua2VkIHdpdGggdGVt
cGVyYXR1cmUgYW5kIGN1cnJlbnQ/IFdoZXRoZXIgdGhlIHB3bS1mYW4gb3V0cHV0IGNhbiBiZSBj
b250cm9sbGVkIGJ5IHRoZSBjb3JyZXNwb25kaW5nIHRlbXBlcmF0dXJlIGFuZCBjdXJyZW50PwpB
cmUgdGhlcmUgYW55IGluc3RydWN0aW9ucyBvciByZWZlcmVuY2VzPwpUaGFua3Mh
------=_Part_42957_1156991552.1637828963253
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGh0bWw+CjxoZWFkPgogICAgPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50
PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPgo8L2hlYWQ+Cjxib2R5Pgo8c3R5bGU+CiAgICBm
b250ewogICAgICAgIGxpbmUtaGVpZ2h0OiAxLjY7CiAgICB9CiAgICB1bCxvbHsKICAgICAgICBw
YWRkaW5nLWxlZnQ6IDIwcHg7CiAgICAgICAgbGlzdC1zdHlsZS1wb3NpdGlvbjogaW5zaWRlOwog
ICAgfQo8L3N0eWxlPgo8ZGl2IHN0eWxlPSJmb250LWZhbWlseTrlvq7ova/pm4Xpu5EsVmVyZGFu
YSwmcXVvdDtNaWNyb3NvZnQgWWFoZWkmcXVvdDssU2ltU3VuLHNhbnMtc2VyaWY7Zm9udC1zaXpl
OjE0cHg7IGxpbmUtaGVpZ2h0OjEuNjsiPgogICAgSGVsbG8gZXZlcnlvbmUsIEkgd291bGQgbGlr
ZSB0byBhc2sgd2hhdCBpcyBzdXBwb3J0ZWQgYnkgb3BlbkJNQyBwd20tZmFuIGNvbnRyb2wgcG9s
aWN5Pzxicj5DYW4gaXQgYmUgbGlua2VkIHdpdGggdGVtcGVyYXR1cmUgYW5kIGN1cnJlbnQ/IFdo
ZXRoZXIgdGhlIHB3bS1mYW4gb3V0cHV0IGNhbiBiZSBjb250cm9sbGVkIGJ5IHRoZSBjb3JyZXNw
b25kaW5nIHRlbXBlcmF0dXJlIGFuZCBjdXJyZW50Pzxicj5BcmUgdGhlcmUgYW55IGluc3RydWN0
aW9ucyBvciByZWZlcmVuY2VzPzxicj5UaGFua3MhPCEtLfCfmIAtLT4KPC9kaXY+CjwvYm9keT4K
PC9odG1sPg==
------=_Part_42957_1156991552.1637828963253--

