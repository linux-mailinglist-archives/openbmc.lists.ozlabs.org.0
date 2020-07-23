Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2958922BC01
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 04:33:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCYCK2z6NzDrhd
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 12:33:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.37; helo=m1337.mail.163.com;
 envelope-from=junhengdi@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=SjQOCF5q; dkim-atps=neutral
X-Greylist: delayed 917 seconds by postgrey-1.36 at bilbo;
 Thu, 23 Jul 2020 20:10:28 AEST
Received: from m1337.mail.163.com (m1337.mail.163.com [220.181.13.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC7Pc2R0dzDrGq
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 20:10:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=GXYYM
 iw3rkP/oa0vUY18IHCGjapljxUHAzFfHUdob1U=; b=SjQOCF5qyMaVfA0p8OlDc
 Y1xO7Ef5j8r1hxb7Ja1UiUjVYVlKeAzSbMmeRR9QRR8xEEZ7+lkngrragA6fhm2t
 Ihaxr23arLC4SGY5qpQCaIJEnIEsMANjGKcxREwQQ+RttU3ODy+s0WBoIqExRN6r
 TyTMY0EqhrF3soulS1/n3M=
Received: from junhengdi$163.com ( [202.96.123.226] ) by
 ajax-webmail-wmsvr37 (Coremail) ; Thu, 23 Jul 2020 17:54:56 +0800 (CST)
X-Originating-IP: [202.96.123.226]
Date: Thu, 23 Jul 2020 17:54:56 +0800 (CST)
From: =?GBK?B?srvT7w==?= <junhengdi@163.com>
To: openbmc@lists.ozlabs.org
Subject: how to change debug uart from uart5 to uart1 on ast2500 romulus?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2020 www.mailtech.cn 163com
X-CM-CTRLDATA: ND8Kc2Zvb3Rlcl9odG09MTM3NDo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_129699_102065250.1595498096604"
MIME-Version: 1.0
Message-ID: <5e18b54e.8d5f.1737b18e7dc.Coremail.junhengdi@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: JcGowADXbj1wXhlflZFxAA--.8976W
X-CM-SenderInfo: xmxqxvpqjgxqqrwthudrp/xtbBoQtkf1QHK1+glwACsj
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Approved-At: Fri, 24 Jul 2020 12:32:24 +1000
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

------=_Part_129699_102065250.1595498096604
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

RGVhciBvcGVtYm1jZXIsCgpJIGFtIGdyZWVuIHRvIG9wZW5ibWMgYW5kIEkgd2FudCB0byBsZWFy
biBzb21ldGhpbmcgYWJvdXQgYXN0MjUwMC5Ob3cgSSBoYXZlIG9uZSBib2FyZCBhc3QyNTAwIGFu
ZCAKCnVzZSBvcGVuYm1jIGNvZGUgcm9tdWx1cy5JIGtub3cgdGhlIGRlZmF1bHQgZGVidWcgdWFy
dCBpcyB1YXJ0NSBhbmQgSSB3YW50IHRvIGNoYW5nZSBpdCB0byB1YXJ0MSxiZWNhdXNlCgpvbiBt
eSBib2FyZCwgdWFydDEgaXMgcnMyMzIuSSBoYXZlIHRyaWVkIHRoZXNlICxidXQgbm90IGVmZmVj
dGl2ZS4KCigxKSBzZXQgdGhlIGhhcmR3YXJlIHN0cmFwIHJlZ2lzdGVyIGJpdDI5IDAgb24gYXN0
LWc1LmMKCigyKSBzZXQgQ09ORklHX1NZU19OUzE2NTUwX0NPTTEgZnJvbSAweDFFNzg0MDAwIHRv
IDB4MUU3ODMwMDAKCgoKCkFueSBhZGR2aWNlIHdpbGwgYmUgYXBwcmljYXRlZC4KCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRoYW5rcywKCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEp1bkhlbmc=
------=_Part_129699_102065250.1595498096604
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxwIHN0eWxlPSJtYXJnaW46MDsiPkRlYXIgb3BlbWJtY2VyLDwv
cD48cCBzdHlsZT0ibWFyZ2luOjA7Ij48c3BhbiBjbGFzcz0iQXBwbGUtdGFiLXNwYW4iIHN0eWxl
PSJ3aGl0ZS1zcGFjZTpwcmUiPgk8L3NwYW4+SSBhbSBncmVlbiB0byBvcGVuYm1jIGFuZCBJIHdh
bnQgdG8gbGVhcm4gc29tZXRoaW5nIGFib3V0IGFzdDI1MDAuTm93IEkgaGF2ZSBvbmUgYm9hcmQg
YXN0MjUwMCBhbmQmbmJzcDs8L3A+PHAgc3R5bGU9Im1hcmdpbjowOyI+dXNlIG9wZW5ibWMgY29k
ZSByb211bHVzLkkga25vdyB0aGUgZGVmYXVsdCBkZWJ1ZyB1YXJ0IGlzIHVhcnQ1IGFuZCBJIHdh
bnQgdG8gY2hhbmdlIGl0IHRvIHVhcnQxLGJlY2F1c2U8L3A+PHAgc3R5bGU9Im1hcmdpbjowOyI+
b24gbXkgYm9hcmQsIHVhcnQxIGlzIHJzMjMyLkkgaGF2ZSB0cmllZCB0aGVzZSAsYnV0IG5vdCBl
ZmZlY3RpdmUuPC9wPjxwIHN0eWxlPSJtYXJnaW46MDsiPigxKSBzZXQgdGhlIGhhcmR3YXJlIHN0
cmFwIHJlZ2lzdGVyIGJpdDI5IDAgb24gYXN0LWc1LmM8L3A+PHAgc3R5bGU9Im1hcmdpbjowOyI+
KDIpIHNldCBDT05GSUdfU1lTX05TMTY1NTBfQ09NMSBmcm9tIDB4MUU3ODQwMDAgdG8gMHgxRTc4
MzAwMDwvcD48cCBzdHlsZT0ibWFyZ2luOjA7Ij48YnI+PC9wPjxwIHN0eWxlPSJtYXJnaW46MDsi
PjxzcGFuIGNsYXNzPSJBcHBsZS10YWItc3BhbiIgc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+CTwv
c3Bhbj5BbnkgYWRkdmljZSB3aWxsIGJlIGFwcHJpY2F0ZWQuPC9wPjxwIHN0eWxlPSJtYXJnaW46
MDsiPjxzcGFuIGNsYXNzPSJBcHBsZS10YWItc3BhbiIgc3R5bGU9IndoaXRlLXNwYWNlOnByZSI+
CQkJCQkJCQkJCQkJCTwvc3Bhbj4mbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJz
cDsgJm5ic3A7VGhhbmtzLDwvcD48cCBzdHlsZT0ibWFyZ2luOjA7Ij48c3BhbiBjbGFzcz0iQXBw
bGUtdGFiLXNwYW4iIHN0eWxlPSJ3aGl0ZS1zcGFjZTpwcmUiPgkJCQkJCQkJCQkJCQk8L3NwYW4+
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwO0p1bkhlbmc8L3A+
PC9kaXY+PGJyPjxicj48c3BhbiB0aXRsZT0ibmV0ZWFzZWZvb3RlciI+PHA+Jm5ic3A7PC9wPjwv
c3Bhbj4=
------=_Part_129699_102065250.1595498096604--

