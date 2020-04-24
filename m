Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 748D61B7860
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 16:35:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497xXb1n15zDr7K
	for <lists+openbmc@lfdr.de>; Sat, 25 Apr 2020 00:35:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=203.205.250.101; helo=smtpbg501.qq.com;
 envelope-from=1181052146@qq.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=MWizYVCV; dkim-atps=neutral
X-Greylist: delayed 187 seconds by postgrey-1.36 at bilbo;
 Sat, 25 Apr 2020 00:34:03 AEST
Received: from smtpbg501.qq.com (smtpbg501.qq.com [203.205.250.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497xWH0ksQzDqQW
 for <openbmc@lists.ozlabs.org>; Sat, 25 Apr 2020 00:34:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1587738836; bh=nP/M85BxSrATFk/lK/1Lmah0Yo5hi1bDRS8GU6hA1YI=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=MWizYVCVCufz2IOS9yWZhZdJCRMnze3CAWQoqSD3FdV5vipPP3dRw/M8opPia3iKq
 ltXuY90YdhEURBd44s0D0kUF+w61PNkEJAlMNW4I9H5583PSh2LqupYlej4WAYmWFR
 3upiBHhIKzn/b2J28nD4TLbKcHdln2Qdcel1jrI8=
X-QQ-FEAT: W6fIo0Owl0BB9dx2WVYACh12u5xevpfKlva9RFPCtFmk3FpqIk2bUqaX5xqxb
 8+XzrHOKaETkx3fQQcdSPeN3APFN/MsBAkjH4melJCgrPJPtQuPkAet5GBFzQ+Lz3TdQj8N
 o2TKSm4vNeZruYV9jFF9HMHaQcXsoZ6KyXJhxX/6e580YzWR6IAbSy4hih8knTIl50jOv0i
 kWxSQybOCMFzgoZl6KdoQPl1rYsgdWHm6kN8MmWd6AXFti3nntWt11Vt/3WyKxlf0GtJfdl
 8xo0kBy02DG15G70jrGDrxeTM=
X-QQ-SSF: 00000000000000F000000000000000S
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 211.75.18.137
X-QQ-STYLE: 
X-QQ-mid: webmail700t1587738507t1103318
From: "=?gb18030?B?xM/SsKXgpeult6WopemltA==?=" <1181052146@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: How can the host access BMC's SPI Flash via LPC and How do BMC's CPU
 read uboot from SPI Flash when power up?
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5EA2F78A_1357F2E0_3DA63BB4"
Content-Transfer-Encoding: 8Bit
Date: Fri, 24 Apr 2020 22:28:26 +0800
X-Priority: 3
Message-ID: <tencent_2D6AE7A4D981E94342BD340BC7DF4EBE7F05@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 24 Apr 2020 22:28:29 +0800 (CST)
Feedback-ID: webmail:qq.com:bgweb:bgweb5
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

This is a multi-part message in MIME format.

------=_NextPart_5EA2F78A_1357F2E0_3DA63BB4
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGksIEdyZWV0aW5ncw0KJm5ic3A7ICZuYnNwOyBBIEJNQyB1c3VhbGx5IHVzZXMgYXNwZWVk
J3MgY2hpcC4gVG8gbGVhcm4gQk1DIEkgcmVhZCB0aGUgc3BlYyBvZiBhc3BlZWQncyBBU1Qy
NTAwLiBJIGhhdmUgbG9uZyBiZWVuIGNvbmZ1c2VkIGJ5IHR3byBxdWVzdGlvbnMgd2hlbiBJ
IGFtIGxlYXJuaW5nIEJNQy4NCiZuYnNwOyAmbmJzcDsgMS4gT25lIGlzIHRoYXQ6IEhvdyBj
YW4gdGhlIGhvc3QgYWNjZXNzIEJNQydzIFNQSSBGbGFzaCB2aWEgTFBDPyBJIHJlYWQgZnJv
bSBBU1QyNTAwJ3Mgc3BlYyB0aGF0IHRoZSBob3N0IGNhbiB1cGRhdGUgdGhlIEJJT1Mgc3Rv
cmVkIGluIHRoZSBTUEkgZmxhc2ggdmlhIExQQy4gSSBhbHNvIHNlZW4gZnJvbSBBU1QyNTAw
J3Mgc3BlYyB0aGF0IHRoZSBTUEkgY29udHJvbGxlciBpbiBBU1QyNTAwIGNhbiBiZSBhY2Nl
c3MgYnkgaG9zdCB0aHJvdWdoIExQQy4gSXQgc2VlbXMgbGlrZSB0aGUgYXJjaGl0ZWN0dXJl
IGlzIGFzIGJlbG93Lg0KJm5ic3A7ICZuYnNwOyBIb3N0IENQVS0tLS0mZ3Q7TFBDLS0tLSZn
dDtTUEkgY29udHJvbGxlci0tLS0mZ3Q7U1BJIEZsYXNoW0JJT1NdDQombmJzcDsgJm5ic3A7
IEkgZG8gbm90IGtub3cgaG93IGl0IHdvcmtzLCBkb2VzIHRoaXMgbmVlZCB0byBpbnN0YWxs
IGEgTFBDIGRyaXZlciBpbiBob3N0IE9TIGFuZCBvcGVuYm1jIE9TPyBBbmQgZG9lcyB0aGlz
IG5lZWQgc29mdHdhcmUgaW50ZXJ2ZW50aW9uPw0KJm5ic3A7ICZuYnNwOyAyLiBUaGUgb3Ro
ZXIgaXMgdGhhdDogSG93IGRvZXMgQk1DJ3MgQ1BVIHJlYWQgdWJvb3QgY29kZSBmcm9tIFNQ
SSBmbGFzaCB3aGVuIHBvd2VyIHVwPyBJIGtub3cgdGhhdCB0aGUgdWJvb3QoYWN0IGFzIGJv
b3Rsb2FkZXIpIGlzIHN0b3JlZCBpbiBhIFNQSSBmbGFzaCwgYW5kIHVib290IGlzIHRoZSBm
aXJzdCBjb2RlIHRoYXQgaXMgZXhlY3V0ZWQgYnkgQk1DJ3MgQ1BVLiBJIGRvIG5vdCBrbm93
IHdoZXRoZXIgaXQgaXMgcmlnaHQgb3Igd3JvbmcgYnV0IEkgdGhpbmsgQk1DJ3MgQ1BVIGNh
biBvbmx5IGV4ZWN1dGUgdGhlIGNvZGUgc3RvcmVkIGluIERSQU0uIFdobyBjb3B5IHRoZSBj
b2RlIGZyb20gU1BJIGZsYXNoIHRvIERSQU0/IEdpdmVuIHRoYXQgd2hlbiBCTUMgaXMgcG93
ZXJlZCB1cCB0aGVyZSBpcyBubyBTUEkgZHJpdmVyLCBob3cgU1BJIGNvbnRyb2xsZXIgd29y
a3M/DQombmJzcDsgJm5ic3A7IFRoYW5rcyBmb3IgaGVscGluZyBtZSwgdGhleSByZWFsbHkg
Y29uZnVzZWQgbWUgZm9yIGEgcGVyaW9kIG9mIHRpbWUoVKOsVCkuDQoNCg0KQmVzdCBSZWdh
cmRzIQ0KTGl1IEhvbmd3ZWk=

------=_NextPart_5EA2F78A_1357F2E0_3DA63BB4
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj5IaSwgR3JlZXRpbmdzPC9kaXY+PGRpdj4mbmJzcDsgJm5i
c3A7IEEgQk1DIHVzdWFsbHkgdXNlcyBhc3BlZWQncyBjaGlwLiBUbyBsZWFybiBCTUMgSSBy
ZWFkIHRoZSBzcGVjIG9mIGFzcGVlZCdzIEFTVDI1MDAuIEkgaGF2ZSBsb25nIGJlZW4gY29u
ZnVzZWQgYnkgdHdvIHF1ZXN0aW9ucyB3aGVuIEkgYW0gbGVhcm5pbmcgQk1DLjwvZGl2Pjxk
aXY+Jm5ic3A7ICZuYnNwOyAxLiBPbmUgaXMgdGhhdDogSG93IGNhbiB0aGUgaG9zdCBhY2Nl
c3MgQk1DJ3MgU1BJIEZsYXNoIHZpYSBMUEM/IEkgcmVhZCBmcm9tIEFTVDI1MDAncyBzcGVj
IHRoYXQgdGhlIGhvc3QgY2FuIHVwZGF0ZSB0aGUgQklPUyBzdG9yZWQgaW4gdGhlIFNQSSBm
bGFzaCB2aWEgTFBDLiBJIGFsc28gc2VlbiBmcm9tIEFTVDI1MDAncyBzcGVjIHRoYXQgdGhl
IFNQSSBjb250cm9sbGVyIGluIEFTVDI1MDAgY2FuIGJlIGFjY2VzcyBieSBob3N0IHRocm91
Z2ggTFBDLiBJdCBzZWVtcyBsaWtlIHRoZSBhcmNoaXRlY3R1cmUgaXMgYXMgYmVsb3cuPC9k
aXY+PGRpdj4mbmJzcDsgJm5ic3A7IEhvc3QgQ1BVLS0tLSZndDtMUEMtLS0tJmd0O1NQSSBj
b250cm9sbGVyLS0tLSZndDtTUEkgRmxhc2hbQklPU108L2Rpdj48ZGl2PiZuYnNwOyAmbmJz
cDsgSSBkbyBub3Qga25vdyBob3cgaXQgd29ya3MsIGRvZXMgdGhpcyBuZWVkIHRvIGluc3Rh
bGwgYSBMUEMgZHJpdmVyIGluIGhvc3QgT1MgYW5kIG9wZW5ibWMgT1M/IEFuZCBkb2VzIHRo
aXMgbmVlZCBzb2Z0d2FyZSBpbnRlcnZlbnRpb24/PC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7
IDIuIFRoZSBvdGhlciBpcyB0aGF0OiBIb3cgZG9lcyBCTUMncyBDUFUgcmVhZCB1Ym9vdCBj
b2RlIGZyb20gU1BJIGZsYXNoIHdoZW4gcG93ZXIgdXA/IEkga25vdyB0aGF0IHRoZSB1Ym9v
dChhY3QgYXMgYm9vdGxvYWRlcikgaXMgc3RvcmVkIGluIGEgU1BJIGZsYXNoLCBhbmQgdWJv
b3QgaXMgdGhlIGZpcnN0IGNvZGUgdGhhdCBpcyBleGVjdXRlZCBieSBCTUMncyBDUFUuIEkg
ZG8gbm90IGtub3cgd2hldGhlciBpdCBpcyByaWdodCBvciB3cm9uZyBidXQgSSB0aGluayBC
TUMncyBDUFUgY2FuIG9ubHkgZXhlY3V0ZSB0aGUgY29kZSBzdG9yZWQgaW4gRFJBTS4gV2hv
IGNvcHkgdGhlIGNvZGUgZnJvbSBTUEkgZmxhc2ggdG8gRFJBTT8gR2l2ZW4gdGhhdCB3aGVu
IEJNQyBpcyBwb3dlcmVkIHVwIHRoZXJlIGlzIG5vIFNQSSBkcml2ZXIsIGhvdyBTUEkgY29u
dHJvbGxlciB3b3Jrcz88L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDsgVGhhbmtzIGZvciBoZWxw
aW5nIG1lLCB0aGV5IHJlYWxseSBjb25mdXNlZCBtZSBmb3IgYSBwZXJpb2Qgb2YgdGltZShU
o6xUKS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkJlc3QgUmVnYXJkcyE8L2Rpdj48ZGl2
PkxpdSBIb25nd2VpPC9kaXY+

------=_NextPart_5EA2F78A_1357F2E0_3DA63BB4--

