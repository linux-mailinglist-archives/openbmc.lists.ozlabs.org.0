Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 336DF271897
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 01:28:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvkJY0JB4zDqhC
	for <lists+openbmc@lfdr.de>; Mon, 21 Sep 2020 09:27:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=203.205.195.102; helo=smtpproxy21.qq.com;
 envelope-from=869883681@qq.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
X-Greylist: delayed 68564 seconds by postgrey-1.36 at bilbo;
 Sun, 20 Sep 2020 17:31:38 AEST
Received: from smtpproxy21.qq.com (smtpbg702.qq.com [203.205.195.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvK560pyvzDqgp
 for <openbmc@lists.ozlabs.org>; Sun, 20 Sep 2020 17:31:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1600587062; bh=vIv5GykN3isKvr3Z+DodyJdnS2Re/r3QCk8lkoxClGM=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=hChd48jOLcTnyanZGkw+u+Wfbj5GZZIcEZ5HiTqMEf94pBwOYxkPZIGuxHDMxkPGD
 daFvS4LDZ4I90ffq5KfQLbkuY+o2jB8cJY82kVLebIuSoRSMd7knFDFrNRkt2faBdW
 Ah9GTTAy0uiZ8Pa3q1xFYhm/LN2eeq3qI8blqxkU=
X-QQ-FEAT: mrx7kevsF4zZalgxDHSeilLzcafO0KTQlvhA49Lp5w50GzrPyNI2CQoJURM4x
 kdtSnbQ+iDNwv9uNSRh7GL4lcycvf/l5JfY1wpK+3usXHJdK9wbQAvjffNf9Ql77zNuCeAv
 ORLUYyOBzLx3eLf8dH7+c6YTMaTb1afuc3ww1fyZ3BHGHLs7g5j3hQkKvLksS8MW9tNNx9p
 WU0A8RH6rQ5xrE+46JP1t2Rz7+ZsMsfuo8NGmp0qodOKf8XLH6wzAeaAfSsiS7TCFQJ2tQX
 6DUIKJeu1yr8k3
X-QQ-SSF: 0000000000000000000000000000002
X-QQ-XMAILINFO: MvEPQ1AMzmJvgNknAoh1b/cWzUzJS0D0Y3CDBojj4+AMdoScKOiFCYNgBHhshb
 Sx23VTQQnAJoTj+f7V/M4u+xP9aXM2gHUQgAnoyWuszjPJtfgJ39H9mR4y1U+XSdNPvDfdxw12tSe
 NwN/W6YYT9W36P6uqoVOqW2BBp2OEoVRq6pqelXfSoFLWkkrTXUV76YybzeEdiBpUX2srTzrK2Onk
 XPDvhIZmZ52fcP650DWg/wQImRA1EctdYxKGAsv/PdH/HqO5bQvGaNDIokxnFeHsQ4zzn4kd4WVhW
 bjFrvFuJ9fJkBZra8+VuIaAQWJOkkI86E3nvLzlDotyZZjVpmpXmvSV4AJOOOUG5GSucQPuv3KyYp
 4eJIItBkCFEFSk8drKKR3L7f0zfTI6dReOLaVI552GCYsGLHyRZXI7LQgcwz7WP3Pn16xtjp0nany
 BTV080az2AyXz6LTtAs0VDFoJoABmM19upX5N4djW0/H2T9HylR/J+SjcJ3mgk2CtbW4zDPxxQNia
 /Dn7cjLkZxNsxwu0bLVrQtc6a+AYX4pF594C/TeBzP8NGP4GLwHQVZN7uSsW44tk3Qfs0zgarFWmj
 dDaCyI1+HpvVIgqi0nJiMV9NeSx8T5UB+Qix2hUAyU9l5MhORq9rPuDqemUYK5vf7fImrUlcxOE7X
 PLbPwvBh5Wgk5JDa/P0X0uPmzp291VpdB3Y9I+
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 114.85.152.56
X-QQ-STYLE: 
X-QQ-mid: webmail704t1600587060t7955530
From: "=?gb18030?B?yL3RqQ==?=" <869883681@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: How to change the default output serial
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5F670534_103C9248_063C01D4"
Content-Transfer-Encoding: 8Bit
Date: Sun, 20 Sep 2020 15:31:00 +0800
X-Priority: 3
Message-ID: <tencent_34CE0CBCEE22E9E6CF3069506723323E9B06@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Sun, 20 Sep 2020 15:31:01 +0800 (CST)
Feedback-ID: webmail:qq.com:bgforeign:bgforeign11
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Mon, 21 Sep 2020 09:26:09 +1000
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

------=_NextPart_5F670534_103C9248_063C01D4
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGVsbG8gdGhlcmUNCkkgYW0gdHJ5aW5nIHRvIHVzZSBvcGVuYm1jIHJlY2VudGx5LiBUaGUg
Ym9hcmQgdXNlcyB1YXJ0MiBhcyB0aGUgb3V0cHV0IG9mIEJNQy4gSG93IGNhbiBJIGNoYW5n
ZSB0aGUgZGVmYXVsdCB1YXJ0IGZyb20gdWFydDUgdG8gdWFydDI/DQpUaGUgaW1hZ2UgSSBj
b21waWxlZCBvbiB0aGUgYmFzaXMgb2Ygcm9tdWx1cywgZmlyc3QgSSBtb2RpZmllZCBhc3Bl
ZWQtYm1jLW9wcC1yb211bHVzLmR0cywgSSBvcGVuZWQgdGhlIHVhcnQyIHNlcmlhbCBwb3J0
IGluIGR0cywgYW5kIG1vZGlmaWVkIHN0ZG91dC1wYXRoPSZhbXA7dWFydDIsYm9vdGFyZ3Mg
PSAiY29uc29sZSA9IHR0eVMxIiBpbiBjaG9zZW4uDQpUaGVuLCBJIG1vZGlmaWVkIHRoZSBp
bmNsdWRlL2NvbmZpZy9hc3QtY29tbW9uLmggZmlsZSBpbiB1Ym9vdCAsICNkZWZpbmUgQ09O
RklHX1NZU19OUzE2NTUwX0NPTTEgQVNUX1VBUlQyX0JBU0Uod2hpY2UgaXMgQVNUX1VBUlQw
X0JBU0UpLg0KQW0gSSBkb2luZyBzb21ldGhpbmcgd3Jvbmc/IERvIHlvdSBoYXZlIGFueSBz
dWdnZXN0aW9uPw0KVGhhbmtzISENCnNnYy4=

------=_NextPart_5F670534_103C9248_063C01D4
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PGRpdj48ZGl2PkhlbGxvIHRoZXJlPC9kaXY+PGRpdj5JIGFtIHRy
eWluZyB0byB1c2Ugb3BlbmJtYyByZWNlbnRseS4gVGhlIGJvYXJkIHVzZXMgdWFydDIgYXMg
dGhlIG91dHB1dCBvZiBCTUMuIEhvdyBjYW4gSSBjaGFuZ2UgdGhlIGRlZmF1bHQgdWFydCBm
cm9tIHVhcnQ1IHRvIHVhcnQyPzwvZGl2PjxkaXY+VGhlIGltYWdlIEkgY29tcGlsZWQgb24g
dGhlIGJhc2lzIG9mIHJvbXVsdXMsIGZpcnN0IEkgbW9kaWZpZWQgYXNwZWVkLWJtYy1vcHAt
cm9tdWx1cy5kdHMsIEkgb3BlbmVkIHRoZSB1YXJ0MiBzZXJpYWwgcG9ydCBpbiBkdHMsIGFu
ZCBtb2RpZmllZCBzdGRvdXQtcGF0aD0mYW1wO3VhcnQyLGJvb3RhcmdzID0gImNvbnNvbGUg
PSB0dHlTMSIgaW4gY2hvc2VuLjwvZGl2PjxkaXY+VGhlbiwgSSBtb2RpZmllZCB0aGUgaW5j
bHVkZS9jb25maWcvYXN0LWNvbW1vbi5oIGZpbGUgaW4gdWJvb3QgLCAjZGVmaW5lIENPTkZJ
R19TWVNfTlMxNjU1MF9DT00xIEFTVF9VQVJUMl9CQVNFKHdoaWNlIGlzIEFTVF9VQVJUMF9C
QVNFKS48L2Rpdj48ZGl2PkFtIEkgZG9pbmcgc29tZXRoaW5nIHdyb25nPyBEbyB5b3UgaGF2
ZSBhbnkgc3VnZ2VzdGlvbj88L2Rpdj48ZGl2PlRoYW5rcyEhPC9kaXY+PGRpdj5zZ2MuPC9k
aXY+PC9kaXY+

------=_NextPart_5F670534_103C9248_063C01D4--



