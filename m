Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 060241CED31
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 08:46:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LpHb5rF1zDqLW
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 16:46:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.19; helo=m13-19.163.com;
 envelope-from=lemon_zhang555@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=bjlZclcA; dkim-atps=neutral
Received: from m13-19.163.com (m13-19.163.com [220.181.13.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LpGM27LYzDql9
 for <openbmc@lists.ozlabs.org>; Tue, 12 May 2020 16:45:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=6br5z
 FU20UhURnCVR4D8evvddgFtcE/0NOhkZ/QRHRY=; b=bjlZclcARMO77rYYAquzM
 BgnbE4k0m0zwlZbPllWpHLJ9r0IwDT4LqGMTp+dX3a2HpTyhVQPZPHElqm5XeJtP
 Q+CE/nL5QWWc3WNuCLPsVWEQOiHuokW/PkmnJJGaUga7fChg0+gVJW4aVDQthHp/
 dbO7zROJvy5wUHwZS40lbI=
Received: from lemon_zhang555$163.com ( [223.104.194.56] ) by
 ajax-webmail-wmsvr19 (Coremail) ; Tue, 12 May 2020 14:45:17 +0800 (CST)
X-Originating-IP: [223.104.194.56]
Date: Tue, 12 May 2020 14:45:17 +0800 (CST)
From: "Lemon Zhang" <lemon_zhang555@163.com>
To: openbmc@lists.ozlabs.org
Subject: cannot monitor the system hardware power-on
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2020 www.mailtech.cn 163com
Content-Type: multipart/alternative; 
 boundary="----=_Part_68505_939216067.1589265917018"
MIME-Version: 1.0
Message-ID: <24235869.49dc.17207a1645b.Coremail.lemon_zhang555@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: E8GowAA3Tpb9RbpeCPcuAA--.59232W
X-CM-SenderInfo: pohp00pb2kt0jjvvkqqrwthudrp/1tbiQB0ikVSIfDyJIgAAsZ
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

------=_Part_68505_939216067.1589265917018
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

aGVsbG8sCkkgdXNlIHBhbG1ldHRvIGNvZGUgdG8gbW9uaXRvciB0aGUgcG93ZXItb24gc3RhdHVz
IG9mIHRoZSBtb25pdG9yaW5nIHN5c3RlbSBoYXJkd2FyZS4gV2hpbGUgdGhlIEJNQyBpcyBydW5u
aW5nLCB3ZSBjYW5ub3QgbW9uaXRvciB0aGUgc3lzdGVtIGhhcmR3YXJlIHBvd2VyLW9uLCBidXQg
cmVzdGFydGluZyB0aGUgQk1DIGR1cmluZyB0aGUgc3lzdGVtIGhhcmR3YXJlIHBvd2VyLW9uLCB3
ZSBjYW4gbW9uaXRvciB0aGUgc3lzdGVtIHBvd2VyLW9uLiBGb3IgdGhpcyBwcm9ibGVtLCBjYW4g
eW91IGdpdmUgbWUgc29tZSBzdWdnZXN0aW9ucy4KUmVnYXJkcywKR2FybmV0
------=_Part_68505_939216067.1589265917018
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+aGVsbG8sPC9kaXY+PGRp
diBzdHlsZT0ibWFyZ2luOjA7Ij5JIHVzZSBwYWxtZXR0byBjb2RlIHRvIG1vbml0b3IgdGhlIHBv
d2VyLW9uIHN0YXR1cyBvZiB0aGUgbW9uaXRvcmluZyBzeXN0ZW0gaGFyZHdhcmUuIFdoaWxlIHRo
ZSBCTUMgaXMgcnVubmluZywgd2UgY2Fubm90IG1vbml0b3IgdGhlIHN5c3RlbSBoYXJkd2FyZSBw
b3dlci1vbiwgYnV0IHJlc3RhcnRpbmcgdGhlIEJNQyBkdXJpbmcgdGhlIHN5c3RlbSBoYXJkd2Fy
ZSBwb3dlci1vbiwgd2UgY2FuIG1vbml0b3IgdGhlIHN5c3RlbSBwb3dlci1vbi4gRm9yIHRoaXMg
cHJvYmxlbSwgY2FuIHlvdSBnaXZlIG1lIHNvbWUgc3VnZ2VzdGlvbnMuPC9kaXY+PGRpdiBzdHls
ZT0ibWFyZ2luOjA7Ij48c3BhbiBzdHlsZT0iY29sb3I6IHJnYigzNiwgNDEsIDQ2KTsgZm9udC1m
YW1pbHk6IC1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7U2Vnb2UgVUkm
cXVvdDssIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVt
b2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBFbW9qaSZxdW90OzsiPlJlZ2FyZHMsPC9zcGFuPjwv
ZGl2PjxkaXYgc3R5bGU9Im1hcmdpbjogMHB4OyI+PGZvbnQgY29sb3I9IiMyNDI5MmUiIGZhY2U9
Ii1hcHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgU2Vnb2UgVUksIEhlbHZldGljYSwg
QXJpYWwsIHNhbnMtc2VyaWYsIEFwcGxlIENvbG9yIEVtb2ppLCBTZWdvZSBVSSBFbW9qaSI+R2Fy
bmV0PC9mb250PjwvZGl2PjwvZGl2Pg==
------=_Part_68505_939216067.1589265917018--

