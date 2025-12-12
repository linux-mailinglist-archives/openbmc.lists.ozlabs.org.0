Return-Path: <openbmc+bounces-1016-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A147CCB8BDA
	for <lists+openbmc@lfdr.de>; Fri, 12 Dec 2025 12:44:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dSSL00T20z2xSZ;
	Fri, 12 Dec 2025 22:44:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.197.31.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765539879;
	cv=none; b=e71xGnCbDegcqxpoOUnqH/Eu1hPHjYFKcOtRU89zyJMmORhqf5TKy8qKr45PTk5Yx2ChelmntlToG6/1EtnU4x/RyCkKGmZrKi/k11NVZZ7C8slshZh3f8SpPK5zcTrpViyQHsPbdHIxNjuF3/HkToBZgdm14V6YVPm6ZS4oBv4C+WUoYY8TgRnlv+lO8b5HbypA2388qMBPtO3AmYJ+agn8ZqyoDzSk3o5/pl3flj3ozwVYjXqF2a4HoHO9IyjC5XTJQbXoqHXR2IklhevUjgKR4lNQvua41tltkO9moNaDBHWvPU5a9bY9MeReI8+1vcCtte8UC6RtVzak6OIs2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765539879; c=relaxed/relaxed;
	bh=j1RvNXg4n+xFfDm+kc30nUmc0uneRrsJn3Bs8XlbROA=;
	h=Date:From:To:Subject:Content-Type:MIME-Version:Message-ID; b=TndujSXMNeJRmFu1y8UKUgQkiqE56blMT4FMzVqZKo/Od6tjbHfzm8riebDBxs8zj1LAWftzLCNySlyUon8/QhO7zYIla/RHSHsmbOlUQ7OllcJL23Oxs8PGcsvavslmVoiwi5+peFnQkdSqwlt2MATZ3irDy7tpoQfE9qoyXkqhh9e2h+NuUkG/j5Hi2USb7MhNhVKOxpxnUTTY4gE1SPtwXZNbz0+ii67OdI2BN6+/6aJJDi2HD3Q9PvUt2BRaP/d2ycHQnyszCJWJ6nPP4dPCxI5236/PH70/FzFMgomDhQDTFqVH8GP+l4ggZQ5VQJzZ9rkfWPUnqnu4f6p2QQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=CSS/BTpK; dkim-atps=neutral; spf=pass (client-ip=220.197.31.5; helo=m16.mail.163.com; envelope-from=zhangshk2021@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=CSS/BTpK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.5; helo=m16.mail.163.com; envelope-from=zhangshk2021@163.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 133 seconds by postgrey-1.37 at boromir; Fri, 12 Dec 2025 22:44:35 AEDT
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dSSKv1k5yz2xRq
	for <openbmc@lists.ozlabs.org>; Fri, 12 Dec 2025 22:44:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=j1RvNXg4n+xFfDm+kc30nUmc0uneRrsJn3Bs8XlbROA=; b=C
	SS/BTpK3anHJpsi1ESPIYzxmMlMpYxidneS1jJVjISz/APrdN95o7bE3k/IYuGjz
	dzFprnP3tzczsjEXZBctvMjOGrJgoE3s/kUiFouG5BuMS1C3us7qUBdHQXY3NdyG
	7dh5KxmXLXkpDjrAwVLmDztoKjmJAhaUIJOSRhNWHw=
Received: from zhangshk2021$163.com (
 [240e:404:7910:1af8:5814:a4ff:fe76:2132] ) by ajax-webmail-wzpm-k8s-gz
 (Coremail) ; Fri, 12 Dec 2025 19:42:08 +0800 (GMT+08:00)
X-Originating-IP: [240e:404:7910:1af8:5814:a4ff:fe76:2132]
Date: Fri, 12 Dec 2025 19:42:08 +0800 (GMT+08:00)
From: "zhangshk2021@163.com" <zhangshk2021@163.com>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: [Question] Some issues with openbmc
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20250911(16116b36) MailAndroid/7.24.5_(16) Copyright (c) 2002-2025
 www.mailtech.cn 163com
X-NTES-SC: AL_Qu2dB/mYtk8p7iGeZOkXk04Rhu8/WsSzsvgn24RVOZ00hSXg8x4bc1BDOkHmy92sDimIjgiUfydtzftYe654UYmm7pecTgXd6yiIrXr5Cxob
Content-Type: multipart/alternative; 
	boundary="----=_Part_995009_1478231669.1765539728170"
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <701153f.3d85d.19b125e4b2a.Coremail.zhangshk2021@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:_____wD3v42Q_ztpvQUAAA--.270W
X-CM-SenderInfo: x2kd0whvknjiisr6il2tof0z/xtbCxBBNAmk7-5AbCQAA30
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

------=_Part_995009_1478231669.1765539728170
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

CgpoaSBhbGw6CkknbSBhIGJlZ2lubmVyIG9mIG9wZW5ibWMuIEkndmUgZW5jb3VudGVyZWQgc29t
ZSBwcm9ibGVtcyBhbmQgZmVsdCBxdWl0ZSBjb25mdXNlZCB3aGlsZSBnZXR0aW5nIGZhbWlsaWFy
IHdpdGggdGhlIGNvZGUuIEkgaGF2ZW4ndCBmb3VuZCB0aGUgb2ZmaWNpYWwgZG9jdW1lbnRhdGlv
biB5ZXQuIENvdWxkIHlvdSBwbGVhc2UgaGVscCBtZSBzb2x2ZSB0aGVtPwpRdWVzdGlvbiAxOiBX
aHkgYXJlIHRoZSBsYXllcnMgb2Ygb3BlbmJtYyBkaXJlY3RseSBjb3BpZWQgaW5zdGVhZCBvZiBi
ZWluZyBtYW5hZ2VkIHVzaW5nIGdpdCBzdWJtb2R1bGVzIG9yIHJlcG8KUXVlc3Rpb24gMjogV2h5
IGlzIHRoZSBSZWxlYXNlIENvbnRlbnQgb2Ygb3BlbmJtYyBvbmx5IDIuMTA/IFdoYXQgYWJvdXQg
dGhlIHN1YnNlcXVlbnQgdmVyc2lvbiBkZXNjcmlwdGlvbnM/IElzIGl0IHN0aWxsIHVuZGVyIG1h
aW50ZW5hbmNlPwpRdWVzdGlvbiAzOiBXaHkgZG9lcyB0aGUgcG9reSB1c2VkIGluIHRoZSBvcGVu
Ym1jIG1hc3RlciBicmFuY2ggdXNlIHRoZSB3YWxuYXNjYXIgYnJhbmNoPyBUaGlzIGlzIG5vdCBh
biBsdHMgYnJhbmNoIGVpdGhlci4KCgp0aGFua3MKU2hvdWt1aQ==
------=_Part_995009_1478231669.1765539728170
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdj48YnI+PC9kaXY+PGRpdj5oaSBhbGw6IDwvZGl2PjxkaXY+SSdtIGEgYmVnaW5uZXIgb2Yg
b3BlbmJtYy4gSSd2ZSBlbmNvdW50ZXJlZCBzb21lIHByb2JsZW1zIGFuZCBmZWx0IHF1aXRlIGNv
bmZ1c2VkIHdoaWxlIGdldHRpbmcgZmFtaWxpYXIgd2l0aCB0aGUgY29kZS4gSSBoYXZlbid0IGZv
dW5kIHRoZSBvZmZpY2lhbCBkb2N1bWVudGF0aW9uIHlldC4gQ291bGQgeW91IHBsZWFzZSBoZWxw
IG1lIHNvbHZlIHRoZW0/IDwvZGl2PjxkaXY+UXVlc3Rpb24gMTogV2h5IGFyZSB0aGUgbGF5ZXJz
IG9mIG9wZW5ibWMgZGlyZWN0bHkgY29waWVkIGluc3RlYWQgb2YgYmVpbmcgbWFuYWdlZCB1c2lu
ZyBnaXQgc3VibW9kdWxlcyBvciByZXBvIDwvZGl2PjxkaXY+UXVlc3Rpb24gMjogV2h5IGlzIHRo
ZSBSZWxlYXNlIENvbnRlbnQgb2Ygb3BlbmJtYyBvbmx5IDIuMTA/IFdoYXQgYWJvdXQgdGhlIHN1
YnNlcXVlbnQgdmVyc2lvbiBkZXNjcmlwdGlvbnM/IElzIGl0IHN0aWxsIHVuZGVyIG1haW50ZW5h
bmNlPyA8L2Rpdj48ZGl2PlF1ZXN0aW9uIDM6IFdoeSBkb2VzIHRoZSBwb2t5IHVzZWQgaW4gdGhl
IG9wZW5ibWMgbWFzdGVyIGJyYW5jaCB1c2UgdGhlIHdhbG5hc2NhciBicmFuY2g/IFRoaXMgaXMg
bm90IGFuIGx0cyBicmFuY2ggZWl0aGVyLiA8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PnRoYW5r
cyA8L2Rpdj48ZGl2PlNob3VrdWk8L2Rpdj48ZGl2PiA8L2Rpdj48ZGl2PiA8L2Rpdj48ZGl2PiA8
L2Rpdj48ZGl2PiA8L2Rpdj48ZGl2IGlkPSJpbWFpbF9zaWduYXR1cmUiIGNsYXNzPSJudGVzLXNp
Z25hdHVyZSI+PC9kaXY+
------=_Part_995009_1478231669.1765539728170--


