Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C952CEFBF
	for <lists+openbmc@lfdr.de>; Fri,  4 Dec 2020 15:36:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnZyG06J4zDrTH
	for <lists+openbmc@lfdr.de>; Sat,  5 Dec 2020 01:36:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=183.3.255.84; helo=qq.com; envelope-from=1181052146@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=juhuV94B; dkim-atps=neutral
X-Greylist: delayed 70 seconds by postgrey-1.36 at bilbo;
 Sat, 05 Dec 2020 01:35:00 AEDT
Received: from qq.com (smtpbg449.qq.com [183.3.255.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnZx06WcjzDrQx
 for <openbmc@lists.ozlabs.org>; Sat,  5 Dec 2020 01:35:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1607092311; bh=JTgW/wmcuRokhKR2WQkQpJl460aV8axEZD3yEzrrF0E=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=juhuV94BSRASAGHMCYdR6L3rlRFq9UCOzxL6M89HhCGka/DDiqxGl0RhoKjdooGbX
 ApRsEt+6BOJhdBORF0OYPPipsc1bgw96JzIqbbSgaIhN/v9vGx8RoeCyrKgHpSl0Zx
 JFLuU3NnsqA7vIRt/ZOQhIM2SDwx8fqFzc2SZlSc=
X-QQ-FEAT: cpxeTCD++sCK5tHE2+OG8Dup4zTRXAkPxrkiDn66+sRb1xCCInikcuKRRpBRG
 LVeXclCTrObqfCJWz3PDyWwO0dkinzoRXNCFTUytlxDTIeVLfBQ8Ej0cngpsM9nl491cz4D
 U5sGBHbn9auWXNaS1mT4bOFV5iBvzKhveq0qxafUMfEkaNrhnriAmQsCTZMNnv+qlf6Ud71
 fHhS5MztAGNgUhtelUpn71vrM1bYA1i+uRnsfsjCwznGAG3tiiJjt6aYry/w9M93uW18BWC
 wDSCD4J/+AaTlw4ksDOQ4hBxo=
X-QQ-SSF: 00000000000000F000000000000000S
X-QQ-XMAILINFO: N6FT8W9KeN0pcztbgh1keL5nHewN8JghaWyoQ6xZz1P2KBL2mfp8qIF5mZWmSI
 5jPJpb8LiIBLEBeVLwNQ0vTjl28TH4FhkXGcDlqPF1COyc6bv/OMAFCAFybXqZSk+tuQ2GXeEcgUQ
 0w0X5zW2kLDHuBsvJTt9WdWkhO2nCnUSkCq4EKyqozR7kBJXqjvZi7S6EDx3bTnsPzvF6AzUbXCOs
 kSgAreN12RgZDxzYCunKBeRRRJtz7o3xwzTyOBUQh7u5Qjj1ZaUarm0jnV2DSw7Mkd6pIHIBcfjhL
 FD5xfdELdMQ7Yd1IN3CndbOXBD0xKk9Ju3ijfthYT+N8JMdGjr2q/uzbzk5mep8pvmksxziKqdv+Z
 5P6LA046d9FK6IhVGx9RxTIOcRrQ2Ap+SO+BIKNQVrQCOHPuu0cBCPB9582Y2JtFmbY1JnnCLcevP
 ZwQGyfjjsGQbeBnfn61wCYE8EKcPaDMORHTYB920K7OxOwcHsdVyXR41B0036Cr6fh/xOtkM3kVdX
 IF0GYPYb6+kT9JfetK98h8i+UhXy76WsNWaWeF0lguiOPBx3gx3E5ZWLzkTYpHLKD/MB1iVbySd+K
 NfWDFbze2r5N6kCdJClOm4RS8LkpzFyFCUyAMkabUDyyTrHTkVvqGD1VYdmTyf1CuuXeNQfWLNv9Y
 M61ipTPmiZa/Ihjn1bggvFV5IigQCmVFjJnFjLVMf/V7u2fD56P8YSDPtE8nKzBlqTj1C9EPeK56K
 p8Y+wdK7Tj8PBtN5lBJdsgDSiag7hW0NnTGhbCqXzcNhOzbx0y5HA/qKlilnvaevKLicQ6zvD8DTj
 jA20v8qUBVop
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 255.24.189.15
X-QQ-STYLE: 
X-QQ-mid: webmail700t1607092309t50295
From: "=?gb18030?B?xM/SsKXgpeult6WopemltA==?=" <1181052146@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: How to use xdma-engine to read host server's memory in ast2400?
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5FCA4855_0ED3D508_29B5E573"
Content-Transfer-Encoding: 8Bit
Date: Fri, 4 Dec 2020 22:31:49 +0800
X-Priority: 3
Message-ID: <tencent_38FDA7E411A6D04E141CC03FEAD467B37609@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 04 Dec 2020 22:31:50 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign11
X-QQ-Bgrelay: 1
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

------=_NextPart_5FCA4855_0ED3D508_29B5E573
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

R3JlZXRpbmdzOg0KDQpJIGFtIHVzaW5nIGFzdDI0MDAncyB4ZG1hLWVuZ2luZSB0byByZWFk
IGFuZCB3cml0ZSBob3N0IHNlcnZlcidzIG1lbW9yeS4gQnkgdXNpbmcgYXNwZWVkLXhkbWEg
ZHJpdmVyIEkgY2FuIHdyaXRlIGRhdGEgdG8gaG9zdCBzZXJ2ZXIncyBtZW1vcnkuIEJ1dCBJ
IGhhdmUgcHJvYmxlbSB3aGVuIHJlYWRpbmcgaG9zdCBzZXJ2ZXIncyBtZW1vcnkuIEFmdGVy
IHB1dHRpbmcgdGhlIHJlYWQgY29tbWFuZCB0byB0aGUgY29tbWFuZCBxdWV1ZSwgdGhlIHhk
bWEtZW5naW5lJ3Mgc3RhdHVzIHJlZ2lzdGVyIGNoYW5nZSB0byBibWMgY29tbWFuZCBub3Qg
aWRsZSwgZG93biBzdHJlYW0gZW5naW5nIG5vdCBpZGxlLiBCdXQgdGhlIHhkbWEtZW5naW5l
IGRvZXMgbm90IGNvbXBsZXRlIHRoZSByZWFkIGNvbW1hbmQgbmVpdGhlciBpdCBnZW5lcmF0
ZSBhbnkgaW50ZXJydXB0Lg0KSG93IGNhbiBJIGRvPw0KDQpCZXN0IFJlZ2FyZHMhDQoNCkxp
dSBIb25nd2Vp

------=_NextPart_5FCA4855_0ED3D508_29B5E573
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

R3JlZXRpbmdzOjxicj48YnI+SSBhbSB1c2luZyBhc3QyNDAwJ3MgeGRtYS1lbmdpbmUgdG8g
cmVhZCBhbmQgd3JpdGUgaG9zdCBzZXJ2ZXIncyBtZW1vcnkuIEJ5IHVzaW5nIGFzcGVlZC14
ZG1hIGRyaXZlciBJIGNhbiB3cml0ZSBkYXRhIHRvIGhvc3Qgc2VydmVyJ3MgbWVtb3J5LiBC
dXQgSSBoYXZlIHByb2JsZW0gd2hlbiByZWFkaW5nIGhvc3Qgc2VydmVyJ3MgbWVtb3J5LiBB
ZnRlciBwdXR0aW5nIHRoZSByZWFkIGNvbW1hbmQgdG8gdGhlIGNvbW1hbmQgcXVldWUsIHRo
ZSB4ZG1hLWVuZ2luZSdzIHN0YXR1cyByZWdpc3RlciBjaGFuZ2UgdG8gYm1jIGNvbW1hbmQg
bm90IGlkbGUsIGRvd24gc3RyZWFtIGVuZ2luZyBub3QgaWRsZS4gQnV0IHRoZSB4ZG1hLWVu
Z2luZSBkb2VzIG5vdCBjb21wbGV0ZSB0aGUgcmVhZCBjb21tYW5kIG5laXRoZXIgaXQgZ2Vu
ZXJhdGUgYW55IGludGVycnVwdC48YnI+SG93IGNhbiBJIGRvPzxicj48YnI+QmVzdCBSZWdh
cmRzITxicj48YnI+TGl1IEhvbmd3ZWk8YnI+

------=_NextPart_5FCA4855_0ED3D508_29B5E573--



