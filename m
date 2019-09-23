Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7E4BB73E
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 16:54:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cS650Cs4zDqLd
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 00:54:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=163.com
 (client-ip=220.181.13.86; helo=m13-86.163.com;
 envelope-from=ouyangxuan10@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.b="aCK/fW9a"; 
 dkim-atps=neutral
Received: from m13-86.163.com (m13-86.163.com [220.181.13.86])
 by lists.ozlabs.org (Postfix) with ESMTP id 46cS5K6fTGzDqCY
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 00:54:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=68yhp
 6Mo2LRAn6Km9oq6kyIr7RaYrGFdvfmCRvgD4jQ=; b=aCK/fW9a5LhI+Hfb9Qaoh
 TGTuN9g8CjQjK4PkfKjxSoHJBbCU0IETyiVUeUTqmScYGAPa5bEOnJvCpmfBSIqG
 TNa/FJhn54NXHaD4unXSFtJL/aTOWrHDKwmTdq6q+dNWyHHLnGk+hZkKUqzHXhvp
 IDLkIEcIVefjfLEbrltOy4=
Received: from ouyangxuan10$163.com ( [221.219.103.57] ) by
 ajax-webmail-wmsvr86 (Coremail) ; Mon, 23 Sep 2019 22:53:59 +0800 (CST)
X-Originating-IP: [221.219.103.57]
Date: Mon, 23 Sep 2019 22:53:59 +0800 (CST)
From: www <ouyangxuan10@163.com>
To: openbmc@lists.ozlabs.org
Subject: why cow cannot upload *.bin file ?
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2019 www.mailtech.cn 163com
X-CM-CTRLDATA: GjFeFWZvb3Rlcl9odG09MzkwOjU2
Content-Type: multipart/alternative; 
 boundary="----=_Part_148340_197596382.1569250439224"
MIME-Version: 1.0
Message-ID: <146fa66a.9acd.16d5e9d7038.Coremail.ouyangxuan10@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: VsGowABndnaH3IhdxMj+AA--.51764W
X-CM-SenderInfo: prx1t0pj0xt0irq6il2tof0z/1tbiLgc52lSIkKvidAAAs7
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

------=_Part_148340_197596382.1569250439224
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

RGVhciBhbGwsCgoKd2hlbiBJIHVzZSBjb3cgdXBsb2FkICouYmluIHRvIEJNQywgaXQgcmV0dXJu
IGVycm9yIHdpbGwgcXVpY2tseSwgYW5kIEkgY2FuIGNvbmZpcm0gdGhhdCB0aGUgbWlycm9yIGZp
bGUgaGFzIG5vdCBiZWVuIHVwbG9hZGVkIGludG8gdGhlIEJNQywgYnV0IGl0IGhhcyBiZWVuIHJl
dHVybmVkIGluY29ycmVjdGx5KGp1c3Qgb25lIG9yIHR3byBzZWNvbmQpLCB3aHk/IAoKCnRoYW5r
cywKQnlyb24=
------=_Part_148340_197596382.1569250439224
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+RGVhciBhbGwsPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj53aGVuIEkgdXNlIGNvdyB1cGxvYWQgKi5iaW4gdG8gQk1DLCBpdCByZXR1cm4gZXJyb3Igd2ls
bCBxdWlja2x5LCBhbmQgSSBjYW4gY29uZmlybSB0aGF0IHRoZSBtaXJyb3IgZmlsZSBoYXMgbm90
IGJlZW4gdXBsb2FkZWQgaW50byB0aGUgQk1DLCBidXQgaXQgaGFzIGJlZW4gcmV0dXJuZWQgaW5j
b3JyZWN0bHkoanVzdCBvbmUgb3IgdHdvIHNlY29uZCksIHdoeT8mbmJzcDs8L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PnRoYW5rcyw8L2Rpdj48ZGl2PkJ5cm9uPC9kaXY+PC9kaXY+PGJyPjxicj48
c3BhbiB0aXRsZT0ibmV0ZWFzZWZvb3RlciI+PHA+Jm5ic3A7PC9wPjwvc3Bhbj4=
------=_Part_148340_197596382.1569250439224--

