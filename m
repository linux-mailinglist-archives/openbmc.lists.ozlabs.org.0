Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2DA2D745B
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 11:58:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Csnnl3CWczDqTP
	for <lists+openbmc@lfdr.de>; Fri, 11 Dec 2020 21:58:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=59.36.132.57; helo=qq.com; envelope-from=1181052146@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=Ref6PBgm; dkim-atps=neutral
X-Greylist: delayed 229 seconds by postgrey-1.36 at bilbo;
 Fri, 11 Dec 2020 21:57:39 AEDT
Received: from qq.com (smtpbg468.qq.com [59.36.132.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Csnmz03WZzDq83
 for <openbmc@lists.ozlabs.org>; Fri, 11 Dec 2020 21:57:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1607684001; bh=VHGFtMKS5XR6j4Rmm3yGvvu43ZClqAYYp60qPER9OeE=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=Ref6PBgmsK3xZTbcQAfwHO2mna6wmyYSSjY06rIYXopnqGISIu/sOd63akxjpExUU
 vQ4P7MqVtr7NhJ6Ygg2yvn+RemTQYg9QNb3bqaHcQKaR5eDZ1cVZTcx28O9M1yP1T4
 lWxBXC74g3YK5/ZCUx0StgTPcPaNGEbndWO9ktFc=
X-QQ-FEAT: RxUCDZI2pForhmYpd2gQwKDusLavSWVG45IPlm2u/4OkmIO6jeZJF8G3tenp2
 jwJ5mqwCGWl3mW++HwWj04mQOdRSaRUoHZBUUJtragWShfv6Gk3T9FHv+KVwUDxXkk1J1Y+
 hs65yzwalWozk2gNxiFwoqbBXrnnRxa5uZwkIVHXqS8layImRXAKBkrxr68zRueqmEqOlAS
 lWoDuUDcwE1RQz4MipnIAElsWs1HQ4lWXV5St1/eu5B0jpNuPO0sJooD8AbagNFXx5vvvnG
 vWEXVvBiCuEQVEwqVR/xL+Wtw=
X-QQ-SSF: 00000000000000F000000000000000S
X-QQ-XMAILINFO: N8q2imhmJf/OBCfI/PaeCcfBYhrbZSRQpbqdEdRyVeKEon+T/Ifsra6JcAK3cZ
 YeVX6dDPCEidfadWZM1HTrt4LjFxLV6pJrk3Nz6Maa4JsV9FuBt7n/bcBb5hxftpGY539eWSsiDHz
 csqi2AbXQ4agYbkMOZu4o3mcCdMvvs1EYJ7S5oOL9xLwgXGbE27RN2yYFRBPCmKTgwFwoAh78kIyx
 hy8tiNHbGn1U05xoZLKIxLUAg3BD8ETEF1V5eEV8A7ddc7sGwtSBbajdZ3w/3rRLNEWCFfvyMY8K/
 WowyMEomIfEZHGTzB3DKb6uxPujR/co0zIeVYh3/ORiYchDqSW5ZKw+kSi+xpHB0tD99MJ6SmpRle
 k0lO+NBfVeUCNl5PnYiF2ZZV16nPNIyAyZt0BZjzK/1EXE2yAGVJAIXntrbNMmmiFDHSkBFC4bGwW
 onDXgXQnN1THp/D/oYi0plaOIGYJ3ZalS/ZrpjzonoFAhhMrKxkQo7qcNBE8Of6yJqdc8L6e+YSf5
 JxJLcEdgyj0ppKfR1E0GTebmPdAHMSLIlFQ1oT0kHFB+6DteRmGPILPK7yRkHrJw4W9dmXQSfZH08
 Jl1RE+P8+xeep86ILPKho9n5c9PqIFk+OXbOg3YI15rDDiVv7sXSuMDSLlpAqMxJlbYLxDChhwMGF
 PerwGOBH26AJ2S9cjBdjSRLsri8UtLFc9Pbai4st/PgnN8ffRhWSgklqJdsTe/Q5QSlV76w/BN5NN
 1wIuYmiXoyLT9Sse4z1V0jl+GB8Fqys5i+rujavkB2UlsGrgDBWnuBC+XU4XqvMiWTM25/J/LQDQC
 zw6sKBE+yj0hZMxRFsciF84=
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 255.5.109.125
X-QQ-STYLE: 
X-QQ-mid: webmail700t1607683999t5645544
From: "=?gb18030?B?xM/SsKXgpeult6WopemltA==?=" <1181052146@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: Can AST2400 generate MSI to Host after xdma-engine complete a dma
 cycle?
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5FD34F9E_1230FB50_5ABB0C46"
Content-Transfer-Encoding: 8Bit
Date: Fri, 11 Dec 2020 18:53:18 +0800
X-Priority: 3
Message-ID: <tencent_C899FE71F261535C27100E971F35EA485908@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 11 Dec 2020 18:53:20 +0800 (CST)
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

------=_NextPart_5FD34F9E_1230FB50_5ABB0C46
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGksIEdyZWV0aW5ncw0KSSBhbSB1c2luZyBBU1QyNDAwJ3MgeGRtYS1lbmdpbmUgdG8gcmVh
ZCBhbmQgd3JpdGUgbWVtb3J5IG9mIGhvc3QuIEFzIHRoZSBkYXRhc2hlZXQgc2F5cywgeGRt
YS1lbmdpbmUgY2FuIGdlbmVyYXRlIGEgbXNpIG9yIGludHggaW50ZXJydXB0IHRvIGJvdGgg
Qk1DIGFuZCBob3N0IGFmdGVyIGNvbXBsZXRlIGEgZG1hIHJlYWQgb3Igd3JpdGUuIEhvd2V2
ZXIgSSBjYW4gb25seSByZWNlaXZlIHRoZSBpbnRlcnJ1cHQgaW4gdGhlIEJNQyBzaWRlLCBh
bmQgdGhlIGhvc3Qgc2lkZSBkb2VzIG5vdCByZWNlaXZlIGFueSBpbnRlcnJ1cHQuDQpDYW4g
c29tZSBvbmUgaGVscCBtZT8NCg0KQmVzdCBSZWdhcmRzIQ0KTGl1IEhvbmd3ZWk=

------=_NextPart_5FD34F9E_1230FB50_5ABB0C46
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

SGksIEdyZWV0aW5nczxicj5JIGFtIHVzaW5nIEFTVDI0MDAncyB4ZG1hLWVuZ2luZSB0byBy
ZWFkIGFuZCB3cml0ZSBtZW1vcnkgb2YgaG9zdC4gQXMgdGhlIGRhdGFzaGVldCBzYXlzLCB4
ZG1hLWVuZ2luZSBjYW4gZ2VuZXJhdGUgYSBtc2kgb3IgaW50eCBpbnRlcnJ1cHQgdG8gYm90
aCBCTUMgYW5kIGhvc3QgYWZ0ZXIgY29tcGxldGUgYSBkbWEgcmVhZCBvciB3cml0ZS4gSG93
ZXZlciBJIGNhbiBvbmx5IHJlY2VpdmUgdGhlIGludGVycnVwdCBpbiB0aGUgQk1DIHNpZGUs
IGFuZCB0aGUgaG9zdCBzaWRlIGRvZXMgbm90IHJlY2VpdmUgYW55IGludGVycnVwdC48YnI+
Q2FuIHNvbWUgb25lIGhlbHAgbWU/PGJyPjxicj5CZXN0IFJlZ2FyZHMhPGJyPkxpdSBIb25n
d2VpPGJyPg==

------=_NextPart_5FD34F9E_1230FB50_5ABB0C46--



