Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D99D1C65ED
	for <lists+openbmc@lfdr.de>; Wed,  6 May 2020 04:38:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H14c6cwkzDqjg
	for <lists+openbmc@lfdr.de>; Wed,  6 May 2020 12:38:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.13.140; helo=m13-140.163.com;
 envelope-from=lemon_zhang555@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=jGsx7Npf; dkim-atps=neutral
Received: from m13-140.163.com (m13-140.163.com [220.181.13.140])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H13r68P9zDqT3
 for <openbmc@lists.ozlabs.org>; Wed,  6 May 2020 12:38:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=mPGsq
 7QVTmbr0UL3lZafhou0YJCZF/36SDU7nzcsntY=; b=jGsx7NpfkC/PhJblaZ2fZ
 WwzHtPd/HsxpgjFvAMtY76TPL/w/HRGbe4d/oykSUi08dAQ86hzH9KH/iLgE9vsE
 Y6FIixmdEPRkQgmvT8R9mAnNKzEGvEhAsQCHiQQMdB6Ad4fApEyl8h+nR6UgluP4
 e09qfOen0P3O9JDXGj3SMI=
Received: from lemon_zhang555$163.com ( [112.224.32.183] ) by
 ajax-webmail-wmsvr140 (Coremail) ; Wed, 6 May 2020 10:38:04 +0800 (CST)
X-Originating-IP: [112.224.32.183]
Date: Wed, 6 May 2020 10:38:04 +0800 (CST)
From: hgfcc <lemon_zhang555@163.com>
To: openbmc@lists.ozlabs.org
Subject: use the LTC2990 monitors the temperature
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2020 www.mailtech.cn 163com
Content-Type: multipart/alternative; 
 boundary="----=_Part_36634_201144583.1588732684258"
MIME-Version: 1.0
Message-ID: <22969cf5.2743.171e7d8e7e2.Coremail.lemon_zhang555@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: jMGowACHoqYNI7JeWYoqAA--.40166W
X-CM-SenderInfo: pohp00pb2kt0jjvvkqqrwthudrp/1tbiVBsckVUMM2cQDAABsS
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

------=_Part_36634_201144583.1588732684258
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

SGVsbG8sIEkgdXNlIHRoZSBMVEMyOTkwIHRvIG1vbml0b3IgdGhlIG1vdGhlcmJvYXJkIHRlbXBl
cmF0dXJlLiBCdXQgdGhlIExUQzI5OTAgaGFzIGZvdXIgbW9uaXRvcmluZyBwaW5zLiBIb3cgY2Fu
IEkgY29uZmlndXJlIGl0IHRvIHNwZWNpZnkgd2hpY2ggcGluIEkgdXNlLiBGb3IgZXhhbXBsZSwg
SSBvbmx5IHVzZWQgdGhlIHNlY29uZCBhbmQgdGhpcmQgcGlucy4KUmVnYXJkcywKR2FybmV0
------=_Part_36634_201144583.1588732684258
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXYgc3R5bGU9Im1hcmdpbjowOyI+SGVsbG8sIEkgdXNlIHRo
ZSBMVEMyOTkwIHRvIG1vbml0b3IgdGhlIG1vdGhlcmJvYXJkIHRlbXBlcmF0dXJlLiBCdXQgdGhl
IExUQzI5OTAgaGFzIGZvdXIgbW9uaXRvcmluZyBwaW5zLiBIb3cgY2FuIEkgY29uZmlndXJlIGl0
IHRvIHNwZWNpZnkgd2hpY2ggcGluIEkgdXNlLiBGb3IgZXhhbXBsZSwgSSBvbmx5IHVzZWQgdGhl
IHNlY29uZCBhbmQgdGhpcmQgcGlucy48L2Rpdj48ZGl2IHN0eWxlPSJtYXJnaW46MDsiPjxkaXYg
c3R5bGU9ImNvbG9yOiByZ2IoMzYsIDQxLCA0Nik7IGZvbnQtZmFtaWx5OiAtYXBwbGUtc3lzdGVt
LCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCBIZWx2ZXRpY2EsIEFy
aWFsLCBzYW5zLXNlcmlmLCAmcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7U2Vn
b2UgVUkgRW1vamkmcXVvdDs7IG1hcmdpbjogMHB4OyI+UmVnYXJkcyw8L2Rpdj48ZGl2IHN0eWxl
PSJtYXJnaW46IDBweDsiPjxmb250IGNvbG9yPSIjMjQyOTJlIiBmYWNlPSItYXBwbGUtc3lzdGVt
LCBCbGlua01hY1N5c3RlbUZvbnQsIFNlZ29lIFVJLCBIZWx2ZXRpY2EsIEFyaWFsLCBzYW5zLXNl
cmlmLCBBcHBsZSBDb2xvciBFbW9qaSwgU2Vnb2UgVUkgRW1vamkiPkdhcm5ldDwvZm9udD48L2Rp
dj48L2Rpdj48L2Rpdj4=
------=_Part_36634_201144583.1588732684258--

