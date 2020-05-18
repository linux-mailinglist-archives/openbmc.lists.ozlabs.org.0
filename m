Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF8D1D7B5E
	for <lists+openbmc@lfdr.de>; Mon, 18 May 2020 16:37:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QhRx0hN0zDqcN
	for <lists+openbmc@lfdr.de>; Tue, 19 May 2020 00:37:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.13; helo=m1313.mail.163.com;
 envelope-from=lemon_zhang555@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=hu92oxoW; dkim-atps=neutral
Received: from m1313.mail.163.com (m1313.mail.163.com [220.181.13.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QhPd3zMBzDqfG
 for <openbmc@lists.ozlabs.org>; Tue, 19 May 2020 00:35:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=zXIcx
 aW4/zculqFp96SH84976iXdai62Lx1gjKEpFO8=; b=hu92oxoWCB+bkcjD1qreR
 IX/hbzeOJHqzzKulZdFFisTjBMH1uRF/wfJOP0rpYBIb8IOxyiKc5fgq3LDufK3H
 HRpj1qH4BXi8+4ReN0b6XRbrlBhgIF3RdPg/1uGyzAzauYFdJZrMoHvlxaKrfog3
 WTuHiuOQaYo2eKwgmxClzw=
Received: from lemon_zhang555$163.com ( [113.128.100.128] ) by
 ajax-webmail-wmsvr13 (Coremail) ; Mon, 18 May 2020 22:35:01 +0800 (CST)
X-Originating-IP: [113.128.100.128]
Date: Mon, 18 May 2020 22:35:01 +0800 (CST)
From: "Lemon Zhang" <lemon_zhang555@163.com>
To: openbmc@lists.ozlabs.org
Subject: some code in power_control_obj.c
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2020 www.mailtech.cn 163com
Content-Type: multipart/alternative; 
 boundary="----=_Part_110696_371098107.1589812501746"
MIME-Version: 1.0
Message-ID: <607ad726.7940.17228359cf2.Coremail.lemon_zhang555@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: DcGowADnXO0VncJeDH8mAA--.15949W
X-CM-SenderInfo: pohp00pb2kt0jjvvkqqrwthudrp/1tbiQAcokVSIfIFkyAABsy
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

------=_Part_110696_371098107.1589812501746
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

aGVsbG8sCjEgSW4gdGhlIGZpbGUgcG93ZXJfY29udHJvbF9vYmouY6OsIHRoZXJlIGlzIHRoZSBm
b2xsb3dpbmcgcHJvZ3JhbSBjb2RlCmBgYAppZiAocGdvb2Rfc3RhdGUgPT0gMCkKICAgICAgICAg
ICAgIHsKICAgICAgICAgICAgICAgICBjb250cm9sX3Bvd2VyX2VtaXRfcG93ZXJfbG9zdCAoY29u
dHJvbF9wb3dlcik7CiAgICAgICAgICAgICAgICAgZ19wY2lfcmVzZXRfaGVsZCA9IDE7CiAgICAg
ICAgICAgICB9CiAgICAgICAgICAgICBlbHNlCiAgICAgICAgICAgICB7CiAgICAgICAgICAgICAg
ICAgY29udHJvbF9wb3dlcl9lbWl0X3Bvd2VyX2dvb2QgKGNvbnRyb2xfcG93ZXIpOwogICAgICAg
ICAgICAgfQp9CmBgYApJcyB0aGlzIHRoZSBjb2RlIHRoYXQgbm90aWZpZXMgdGhlIGhhcmR3YXJl
IHBvd2VyIHN0YXR1cz8gSWYgeWVzLCB0byB3aG9tIGRpZCBpdCBub3RpZnk7IGlmIG5vdCwgd2hh
dCBpcyBpdCB1c2VkIGZvcj8KMiBJbiBmdW5jdGlvbiAKYGBgCnN0YXRpYyBnYm9vbGVhbiBvbl9z
ZXRfcG93ZXJfc3RhdGUgKENvbnRyb2xQb3dlciAqIHB3ciwKICAgICAgICAgR0RCdXNNZXRob2RJ
bnZvY2F0aW9uICogaW52b2NhdGlvbiwKICAgICAgICAgZ3VpbnQgc3RhdGUsCiAgICAgICAgIGdw
b2ludGVyIHVzZXJfZGF0YSkKYGBgCk5vIG1hdHRlciB3aGV0aGVyIEkgc2V0IHRoZSBwb3dlci1v
biBjb21tYW5kIG9yIHRoZSBwb3dlci1vZmYgY29tbWFuZCwgdGhlIHBhcmFtZXRlciBzdGF0ZSBp
cyBhbHdheXMgMC4gSXMgdGhlcmUgYW55IHByb2JsZW0gaGVyZT8KUmVnYXJkcywKR2FybmV0CgoK
Cg==
------=_Part_110696_371098107.1589812501746
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+aGVsbG8sPC9kaXY+PGRp
diBzdHlsZT0ibWFyZ2luOjA7Ij4xIEluIHRoZSBmaWxlIHBvd2VyX2NvbnRyb2xfb2JqLmOjrCZu
YnNwO3RoZXJlIGlzIHRoZSBmb2xsb3dpbmcgcHJvZ3JhbSBjb2RlPC9kaXY+PGRpdiBzdHlsZT0i
bWFyZ2luOjA7Ij48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPmBgYDwvZGl2PjxkaXYgc3R5bGU9Im1h
cmdpbjowOyI+aWYgKHBnb29kX3N0YXRlID09IDApPC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOjA7
Ij4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt7PC9kaXY+
PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO2NvbnRyb2xfcG93ZXJfZW1pdF9wb3dlcl9sb3N0
IChjb250cm9sX3Bvd2VyKTs8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPiZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7Z19wY2lf
cmVzZXRfaGVsZCA9IDE7PC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij4mbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt9PC9kaXY+PGRpdiBzdHlsZT0ibWFy
Z2luOjA7Ij4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtl
bHNlPC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDt7PC9kaXY+PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij4mbmJz
cDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
O2NvbnRyb2xfcG93ZXJfZW1pdF9wb3dlcl9nb29kIChjb250cm9sX3Bvd2VyKTs8L2Rpdj48ZGl2
IHN0eWxlPSJtYXJnaW46MDsiPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwO308L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPn08L2Rpdj48ZGl2IHN0eWxl
PSJtYXJnaW46MDsiPmBgYDwvZGl2PjwvZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+SXMgdGhp
cyB0aGUgY29kZSB0aGF0IG5vdGlmaWVzIHRoZSBoYXJkd2FyZSBwb3dlciBzdGF0dXM/IElmIHll
cywgdG8gd2hvbSBkaWQgaXQgbm90aWZ5OyBpZiBub3QsIHdoYXQgaXMgaXQgdXNlZCBmb3I/PC9k
aXY+PGRpdiBzdHlsZT0ibWFyZ2luOjA7Ij4yIEluIGZ1bmN0aW9uJm5ic3A7PC9kaXY+PGRpdiBz
dHlsZT0ibWFyZ2luOjA7Ij5gYGA8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPnN0YXRpYyBn
Ym9vbGVhbiBvbl9zZXRfcG93ZXJfc3RhdGUgKENvbnRyb2xQb3dlciAqIHB3ciw8L2Rpdj48ZGl2
IHN0eWxlPSJtYXJnaW46MDsiPiZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtHREJ1
c01ldGhvZEludm9jYXRpb24gKiBpbnZvY2F0aW9uLDwvZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjow
OyI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO2d1aW50IHN0YXRlLDwvZGl2Pjxk
aXYgc3R5bGU9Im1hcmdpbjowOyI+Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO2dw
b2ludGVyIHVzZXJfZGF0YSk8L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPmBgYDwvZGl2Pjxk
aXYgc3R5bGU9Im1hcmdpbjowOyI+Tm8gbWF0dGVyIHdoZXRoZXIgSSBzZXQgdGhlIHBvd2VyLW9u
IGNvbW1hbmQgb3IgdGhlIHBvd2VyLW9mZiBjb21tYW5kLCB0aGUgcGFyYW1ldGVyIHN0YXRlIGlz
IGFsd2F5cyAwLiBJcyB0aGVyZSBhbnkgcHJvYmxlbSBoZXJlPzwvZGl2PjxkaXYgc3R5bGU9Im1h
cmdpbjowOyI+PGRpdiBzdHlsZT0ibWFyZ2luOiAwcHg7Ij48c3BhbiBzdHlsZT0iY29sb3I6IHJn
YigzNiwgNDEsIDQ2KTsgZm9udC1mYW1pbHk6IC1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVt
Rm9udCwgJnF1b3Q7U2Vnb2UgVUkmcXVvdDssIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYs
ICZxdW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBFbW9qaSZxdW90
OzsiPlJlZ2FyZHMsPC9zcGFuPjwvZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4OyI+PGZvbnQg
Y29sb3I9IiMyNDI5MmUiIGZhY2U9Ii1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwg
U2Vnb2UgVUksIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsIEFwcGxlIENvbG9yIEVtb2pp
LCBTZWdvZSBVSSBFbW9qaSI+R2FybmV0PC9mb250PjwvZGl2PjwvZGl2PjxkaXYgc3R5bGU9Im1h
cmdpbjowOyI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+PGJyPjwvZGl2PjwvZGl2
Pg==
------=_Part_110696_371098107.1589812501746--

