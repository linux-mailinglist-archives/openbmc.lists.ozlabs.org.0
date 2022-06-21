Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 582AB552AE8
	for <lists+openbmc@lfdr.de>; Tue, 21 Jun 2022 08:16:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRx9t1Bndz3bs5
	for <lists+openbmc@lfdr.de>; Tue, 21 Jun 2022 16:16:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Mf+BQVdz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.181.13.102; helo=m13102.mail.163.com; envelope-from=junhengdi@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Mf+BQVdz;
	dkim-atps=neutral
Received: from m13102.mail.163.com (m13102.mail.163.com [220.181.13.102])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRx9L5d8Kz3059
	for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2022 16:16:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=kFn0K
	GOY8HSGXBRqzNLbvHY3jdePZLCQETQbNir1VB0=; b=Mf+BQVdzP8ts4y2Av6WGN
	QIGZhgH5PTCLrg5N7Wz0/Tf8q2HZ94HS+jpsaHiURy7W4okBRSUmhfY690lcAPIt
	CokcoaGqg10rmirvW3BLUHYoAYJT10p0lVDTqGuuLo/7lRIcQG4LZbEMfFUwOETE
	x9u/mGX5MCEWhxTySeeCBU=
Received: from junhengdi$163.com ( [202.96.123.226] ) by
 ajax-webmail-wmsvr102 (Coremail) ; Tue, 21 Jun 2022 14:16:06 +0800 (CST)
X-Originating-IP: [202.96.123.226]
Date: Tue, 21 Jun 2022 14:16:06 +0800 (CST)
From: =?GBK?B?srvT7w==?= <junhengdi@163.com>
To: openbmc@lists.ozlabs.org
Subject: How to config sol uart/serial io addr on ast2500?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
Content-Type: multipart/alternative; 
	boundary="----=_Part_57107_1226754072.1655792166541"
MIME-Version: 1.0
Message-ID: <4dc827d0.3c15.18184e7668d.Coremail.junhengdi@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: ZsGowADXtIUnYrFiu4wjAA--.20708W
X-CM-SenderInfo: xmxqxvpqjgxqqrwthudrp/xtbBPRcnf2AZBKfUVAACsq
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

------=_Part_57107_1226754072.1655792166541
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

RGVhciBvcGVuYm1jZXIsCgpBcyBJIGtub3cgYnkgZGVmYXVsdCAsIGFzdDI1MDAgb24gZXNwaSBv
ciBscGMgaXMgSU8gc2xhdmUgd2l0aCBiYXNlIGlvIGFkZHIgMHgzZjggLiBDcHUgY29uc29sZSBz
ZW5kIHVhcnQvY29tIGRhdGEgdG8gYXN0MjUwMCBieSBhY2Nlc3MgaW8gYWRkciAweDNmOCB3aGlj
aCBpcyBtYXBwZWQgdG8gZXNwaSBvciBscGMuVGhlbiBhc3QyNTAwIGdldCB0aGUgZGF0YSBhbmQg
c2VuZCB0byBvbmUgb2YgdWFydC4KCkkgaGF2ZSBzZXZlcmFsIHF1ZXN0aW9ucyBhYm91dCB0aGUg
cmVhbGl6YXRpb24gb3Igb3BlcmF0aW9uIGFzIGZvbGxvd3M6CgoxICBJIHdhbnQgdG8ga25vdyB0
aGUgZnVuY3Rpb24gb2YgZXNwaSBzbGF2ZSAweDNmOCBvbiBhc3QyNTAwIGlzIHJlYWxpemF0aW9u
IGJ5IHNvbWUga2VybmVsIGRyaXZlcnMgb3Igc29saWRpZmllZCBvbiB0aGUgY2hpcCByb20/Cgog
ICAgICAgICAgICAgICAgMiAgSG93IHRvIGNvbmZpZyB0aGUgdWFydC9zZXJpYWwgYmFzZSBpbyBh
ZGRyIHN1Y2ggYXMgIDB4MmY4ICwweDJlOCBieSBhc3QyNTAwIHJlZ2lzdGVyPyAKCjMgIEhvdyB0
byBjb25maWcgd2hpY2ggYXN0MjUwMCB1YXJ0IHdpbGwgaW50ZXJhY3RpdmUgd2l0aCAweDNmOCBi
eSBhc3QyNTAwIHJlZ2lzdGVyPyAKCkFueSBhZHZpY2Ugd2lsbCBiZSBhcHByZWNpYXRlZC4KClRo
YW5rcywKCkp1bkhlbmc=
------=_Part_57107_1226754072.1655792166541
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxwIHN0eWxlPSJtYXJnaW46MDsiPkRlYXIgb3BlbmJtY2VyLDwv
cD48cCBzdHlsZT0ibWFyZ2luOjA7Ij48c3BhbiBjbGFzcz0iQXBwbGUtdGFiLXNwYW4iIHN0eWxl
PSJ3aGl0ZS1zcGFjZTpwcmUiPgkJPC9zcGFuPkFzIEkga25vdyBieSBkZWZhdWx0ICwgYXN0MjUw
MCBvbiBlc3BpIG9yIGxwYyBpcyBJTyBzbGF2ZSB3aXRoIGJhc2UgaW8gYWRkciAweDNmOCAuIENw
dSBjb25zb2xlIHNlbmQgdWFydC9jb20gZGF0YSB0byBhc3QyNTAwIGJ5IGFjY2VzcyBpbyBhZGRy
IDB4M2Y4IHdoaWNoIGlzIG1hcHBlZCB0byBlc3BpIG9yIGxwYy5UaGVuIGFzdDI1MDAgZ2V0IHRo
ZSBkYXRhIGFuZCBzZW5kIHRvIG9uZSBvZiB1YXJ0LjwvcD48cCBzdHlsZT0ibWFyZ2luOjA7Ij48
c3BhbiBjbGFzcz0iQXBwbGUtdGFiLXNwYW4iIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgkJPC9z
cGFuPkkgaGF2ZSBzZXZlcmFsIHF1ZXN0aW9ucyBhYm91dCB0aGUgcmVhbGl6YXRpb24gb3Igb3Bl
cmF0aW9uIGFzIGZvbGxvd3M6PC9wPjxwIHN0eWxlPSJtYXJnaW46MDsiPjxzcGFuIGNsYXNzPSJB
cHBsZS10YWItc3BhbiIgc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CQk8L3NwYW4+MSAmbmJzcDtJ
IHdhbnQgdG8ga25vdyB0aGUgZnVuY3Rpb24gb2YgZXNwaSBzbGF2ZSAweDNmOCBvbiBhc3QyNTAw
IGlzIHJlYWxpemF0aW9uIGJ5IHNvbWUga2VybmVsIGRyaXZlcnMgb3Igc29saWRpZmllZCBvbiB0
aGUgY2hpcCByb20/PC9wPjxwIHN0eWxlPSJtYXJnaW46MDsiPiZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgMiAmbmJzcDtIb3cgdG8gY29uZmln
IHRoZSB1YXJ0L3NlcmlhbCBiYXNlIGlvIGFkZHIgc3VjaCBhcyAmbmJzcDsweDJmOCAsMHgyZTgg
YnkgYXN0MjUwMCByZWdpc3Rlcj8mbmJzcDs8L3A+PHAgc3R5bGU9Im1hcmdpbjowOyI+PHNwYW4g
Y2xhc3M9IkFwcGxlLXRhYi1zcGFuIiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JCTwvc3Bhbj4z
ICZuYnNwO0hvdyB0byBjb25maWcgd2hpY2ggYXN0MjUwMCB1YXJ0IHdpbGwgaW50ZXJhY3RpdmUg
d2l0aCAweDNmOCBieSBhc3QyNTAwIHJlZ2lzdGVyPyZuYnNwOzwvcD48cCBzdHlsZT0ibWFyZ2lu
OjA7Ij48c3BhbiBjbGFzcz0iQXBwbGUtdGFiLXNwYW4iIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUi
PgkJPC9zcGFuPjwvcD48cCBzdHlsZT0ibWFyZ2luOjA7Ij48c3BhbiBjbGFzcz0iQXBwbGUtdGFi
LXNwYW4iIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgkJPC9zcGFuPkFueSBhZHZpY2Ugd2lsbCBi
ZSBhcHByZWNpYXRlZC48L3A+PHAgc3R5bGU9Im1hcmdpbjowOyI+PHNwYW4gY2xhc3M9IkFwcGxl
LXRhYi1zcGFuIiBzdHlsZT0id2hpdGUtc3BhY2U6cHJlIj4JCTwvc3Bhbj48L3A+PHAgc3R5bGU9
Im1hcmdpbjowOyI+PHNwYW4gY2xhc3M9IkFwcGxlLXRhYi1zcGFuIiBzdHlsZT0id2hpdGUtc3Bh
Y2U6cHJlIj4JCTwvc3Bhbj5UaGFua3MsPC9wPjxwIHN0eWxlPSJtYXJnaW46MDsiPjxzcGFuIGNs
YXNzPSJBcHBsZS10YWItc3BhbiIgc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CQk8L3NwYW4+SnVu
SGVuZzwvcD48L2Rpdj4=
------=_Part_57107_1226754072.1655792166541--

