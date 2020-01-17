Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4327140403
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 07:30:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zWQr5mGyzDqpv
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 17:30:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.149; helo=m13-149.163.com;
 envelope-from=zhang_cy1989@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=UY0Mlzpc; dkim-atps=neutral
Received: from m13-149.163.com (m13-149.163.com [220.181.13.149])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zWQ25LVyzDqgw
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 17:30:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=+fgMo
 GOzBH1VN6Ucs2g1uYZAdKHyybXrdke62XAbGLw=; b=UY0MlzpcaGu1abJ/6Tigo
 G9eJ/VgXTvudTIkKlEUxOqtQ+6enNjm4GqQVRD3a+ZTraqLMwIV+nNwLUKLbvCc/
 ExJfK9kukmrJR1efe1rRb0FeHcxg1e4ri9mAyELUQWz+0tx/v5QP6Qojno1j5VkW
 Au1QIO4hMaDJmF0hOZzuWI=
Received: from zhang_cy1989$163.com ( [106.121.178.112] ) by
 ajax-webmail-wmsvr149 (Coremail) ; Fri, 17 Jan 2020 14:29:51 +0800 (CST)
X-Originating-IP: [106.121.178.112]
Date: Fri, 17 Jan 2020 14:29:51 +0800 (CST)
From: zhang_cy1989 <zhang_cy1989@163.com>
To: openbmc@lists.ozlabs.org
Subject: How to change BT interface to KCS interface In ibm-romulus recipe
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2020 www.mailtech.cn 163com
X-CM-CTRLDATA: qc2mAWZvb3Rlcl9odG09MTMyOTo1Ng==
Content-Type: multipart/alternative; 
 boundary="----=_Part_82754_94835196.1579242591209"
MIME-Version: 1.0
Message-ID: <7ac0bad6.5629.16fb23193e9.Coremail.zhang_cy1989@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: lcGowAB3mDZgVCFemMXZAg--.39646W
X-CM-SenderInfo: x2kd0w5bf1imiyz6il2tof0z/1tbiyACtT1p6+2QkWwACso
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

------=_Part_82754_94835196.1579242591209
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

RGVhciBBbGwKICAgICAgICAgICAgSSB1c2UgImV4cG9ydCBURU1QTEFURUNPTkY9bWV0YS1pYm0v
bWV0YS1yb211bHVzL2NvbmYiIGFuZCBiaXRiYWtlIGl0LgogICAgICAgICAgIAoKICAgICAgICAg
ICAgVGhlIGRldGFpbCBpbmZvcm1hdGlvbnM6CklEPSJvcGVuYm1jLXBob3NwaG9yIgpOQU1FPSJQ
aG9zcGhvciBPcGVuQk1DIChQaG9zcGhvciBPcGVuQk1DIFByb2plY3QgUmVmZXJlbmNlIERpc3Ry
bykiClZFUlNJT049IjIuNy4wLTAiClZFUlNJT05fSUQ9IjIuNy4wLTAtZ2NiOTFhNzc3My1kaXJ0
eSIKUFJFVFRZX05BTUU9IlBob3NwaG9yIE9wZW5CTUMgKFBob3NwaG9yIE9wZW5CTUMgUHJvamVj
dCBSZWZlcmVuY2UgRGlzdHJvKSAyLjcuMC0wIgpCVUlMRF9JRD0iMi43LjAiCk9QRU5CTUNfVEFS
R0VUX01BQ0hJTkU9InJvbXVsdXMiCgoKCiAgICAgICAgICAgRGVmYXVsdCBjYXNlLCByb21sdWx1
cyB1c2VzIGJ0IGludGVyZmFjZSB0byBjb21tdW5pY2F0ZSB3aXRoIEhvc3QuCiAgICAgICAgICAg
Tm93LCBJIHdhbnQgdG8gY2hhbmdlIEJUIGludGVyZmFjZSB0byAgS0NTIGludGVyZmFjZS4KICAg
ICAgICAgIEJ1dCBJIGRvbid0IGtub3cgaG93IHRvIGRvIGl0LgogICAgICAgICAKCiAgICAgICAg
IENhbiBzb21lIG9uZSBoZWxwIG1lPwoKCkZlbGl4emhhbmcKCgo=
------=_Part_82754_94835196.1579242591209
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+RGVhciBBbGw8L2Rpdj48ZGl2PiZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBJIHVz
ZSAiZXhwb3J0IFRFTVBMQVRFQ09ORj1tZXRhLWlibS9tZXRhLXJvbXVsdXMvY29uZiIgYW5kIGJp
dGJha2UgaXQuPC9kaXY+PGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgPGJyPjwvZGl2PjxkaXY+Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IFRo
ZSBkZXRhaWwgaW5mb3JtYXRpb25zOjwvZGl2PjxkaXY+SUQ9Im9wZW5ibWMtcGhvc3Bob3IiPGJy
Pk5BTUU9IlBob3NwaG9yIE9wZW5CTUMgKFBob3NwaG9yIE9wZW5CTUMgUHJvamVjdCBSZWZlcmVu
Y2UgRGlzdHJvKSI8YnI+VkVSU0lPTj0iMi43LjAtMCI8YnI+VkVSU0lPTl9JRD0iMi43LjAtMC1n
Y2I5MWE3NzczLWRpcnR5Ijxicj5QUkVUVFlfTkFNRT0iUGhvc3Bob3IgT3BlbkJNQyAoUGhvc3Bo
b3IgT3BlbkJNQyBQcm9qZWN0IFJlZmVyZW5jZSBEaXN0cm8pIDIuNy4wLTAiPGJyPkJVSUxEX0lE
PSIyLjcuMCI8YnI+T1BFTkJNQ19UQVJHRVRfTUFDSElORT0icm9tdWx1cyI8YnI+PC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsgRGVmYXVsdCBjYXNlLCByb21sdWx1cyB1c2VzIGJ0IGludGVy
ZmFjZSB0byBjb21tdW5pY2F0ZSB3aXRoIEhvc3QuPC9kaXY+PGRpdj4mbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgTm93LCBJIHdhbnQg
dG8gY2hhbmdlIEJUIGludGVyZmFjZSB0byZuYnNwOyBLQ1MgaW50ZXJmYWNlLjwvZGl2PjxkaXY+
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IEJ1
dCBJIGRvbid0IGtub3cgaG93IHRvIGRvIGl0LjwvZGl2PjxkaXY+Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IDxicj48L2Rpdj48ZGl2PiZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBDYW4gc29tZSBvbmUg
aGVscCBtZT88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkZlbGl4emhhbmc8YnI+PC9kaXY+PGRp
dj48YnI+PC9kaXY+PC9kaXY+PGJyPjxicj48c3BhbiB0aXRsZT0ibmV0ZWFzZWZvb3RlciI+PHA+
Jm5ic3A7PC9wPjwvc3Bhbj4=
------=_Part_82754_94835196.1579242591209--

