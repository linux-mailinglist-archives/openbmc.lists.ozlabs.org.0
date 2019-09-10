Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8316EAEBAE
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 15:36:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SR044hCQzDrMv
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 23:36:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=163.com
 (client-ip=220.181.13.84; helo=m13-84.163.com;
 envelope-from=ouyangxuan10@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.b="LySDgmZM"; 
 dkim-atps=neutral
X-Greylist: delayed 919 seconds by postgrey-1.36 at bilbo;
 Tue, 10 Sep 2019 23:19:28 AEST
Received: from m13-84.163.com (m13-84.163.com [220.181.13.84])
 by lists.ozlabs.org (Postfix) with ESMTP id 46SQc10HjBzDqjy
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 23:19:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=ZgRxx
 hUXcEnuVe3xBknwBe2U/jQOUd/IA4vEOGwPH4A=; b=LySDgmZMHW9965E/aQ9H9
 mQovlU+d976xyMKUB4efA4e4XmjMZRNGqKzj9Ia5eonMpYKa+2VhPxbMGRy7b0Yw
 KEPZ95FohJmrMTx/VBY1rVZal9zwN8oeQSi7LBES1BIqff94IXXq4errmnGBGUwn
 s+oYze4HiYU9dDQlvvIwS0=
Received: from ouyangxuan10$163.com ( [106.120.127.15] ) by
 ajax-webmail-wmsvr84 (Coremail) ; Tue, 10 Sep 2019 21:03:52 +0800 (CST)
X-Originating-IP: [106.120.127.15]
Date: Tue, 10 Sep 2019 21:03:52 +0800 (CST)
From: www <ouyangxuan10@163.com>
To: openbmc@lists.ozlabs.org
Subject: how to use spi flash BIOS/Host firmware??
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190724(ac680a23)
 Copyright (c) 2002-2019 www.mailtech.cn 163com
X-CM-CTRLDATA: wPwYRGZvb3Rlcl9odG09NTM0OjU2
Content-Type: multipart/alternative; 
 boundary="----=_Part_186615_1492613926.1568120632755"
MIME-Version: 1.0
Message-ID: <69859184.bebd.16d1b45f5b3.Coremail.ouyangxuan10@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: VMGowAC3zo44n3ddGrjyAA--.58379W
X-CM-SenderInfo: prx1t0pj0xt0irq6il2tof0z/xtbByw8s2lPAIvkFJgABsY
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

------=_Part_186615_1492613926.1568120632755
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

RGVhciBhbGwsCgoKICAgIEkgd2FudCB0byBhc2sgYSBxdWVzdGlvbiBhYm91dCBob3cgdG8gc3Bp
IGRyaXZlciBmbGFzaCBob3N0L2Jpb3MgZmlybXdhcmU/IEkgZG9uJ3Qgd2FudCB1c2UgbXRkIG1v
ZGUgZmxhc2ggaXQsIGJlY2F1c2UgdGhlIG10ZCBtb2RlIG5lZWQgcmVhZCBzcGktaWQgd2hlbiBC
TUMgbG9hZCBzcGkgZHJpdmVyLCBtYXkgYmUgaXQgaXMgcmlza3ksIGl0IG5lZWQgc3dpdGNoIHRo
ZSAgc3lzdGVtIHNwaSB0byBCTUMgd2hlbiB0aGUgaG9zdCBydW5uaW5nLCBJdCBtYXkgYnJlYWsg
aG9zdCBzdGFydHVwLiBEbyB3ZSBoYXZlIG90aGVyIHNvbHV0aW9ucyB0byBzb2x2ZSB0aGlzIHBy
b2JsZW0/CgoKdGhhbmtzLApCeXJvbiA=
------=_Part_186615_1492613926.1568120632755
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+RGVhciBhbGwsPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj4mbmJzcDsgJm5ic3A7IEkgd2FudCB0byBhc2sgYSBxdWVzdGlvbiBhYm91dCBob3cgdG8gc3Bp
IGRyaXZlciBmbGFzaCBob3N0L2Jpb3MgZmlybXdhcmU/IEkgZG9uJ3Qgd2FudCB1c2UgbXRkIG1v
ZGUgZmxhc2ggaXQsIGJlY2F1c2UgdGhlIG10ZCBtb2RlIG5lZWQgcmVhZCBzcGktaWQgd2hlbiBC
TUMgbG9hZCBzcGkgZHJpdmVyLCBtYXkgYmUgaXQgaXMgcmlza3ksIGl0IG5lZWQgc3dpdGNoIHRo
ZSZuYnNwOyBzeXN0ZW0gc3BpIHRvIEJNQyB3aGVuIHRoZSBob3N0IHJ1bm5pbmcsIEl0IG1heSBi
cmVhayBob3N0IHN0YXJ0dXAuIERvIHdlIGhhdmUgb3RoZXIgc29sdXRpb25zIHRvIHNvbHZlIHRo
aXMgcHJvYmxlbT88L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PnRoYW5rcyw8L2Rpdj48ZGl2PkJ5
cm9uJm5ic3A7PC9kaXY+PC9kaXY+PGJyPjxicj48c3BhbiB0aXRsZT0ibmV0ZWFzZWZvb3RlciI+
PHA+Jm5ic3A7PC9wPjwvc3Bhbj4=
------=_Part_186615_1492613926.1568120632755--

