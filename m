Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D671BEEB1
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 05:32:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CLXy5vFgzDrC0
	for <lists+openbmc@lfdr.de>; Thu, 30 Apr 2020 13:32:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=qq.com
 (client-ip=203.205.250.101; helo=smtpbg501.qq.com;
 envelope-from=1450335857@qq.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=KWJ627Iv; dkim-atps=neutral
Received: from smtpbg501.qq.com (smtpbg501.qq.com [203.205.250.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CLX62GwQzDr8t
 for <openbmc@lists.ozlabs.org>; Thu, 30 Apr 2020 13:31:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1588217468; bh=j1UNnJpIIries6gzXQYLELL5fJad9Fh/+hxdG/G6UOQ=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=KWJ627IvdaEC0A/pdwAWChG2vWkrUBXeOdEbHvldpEo0c202mghVPf4YQJ/2XMO4b
 HR0xDrKIgPeerM8wKUuIT9dQ9cSrAemBxo6D/GHfRUTm860YU+vABkwP2MASB6v5Pq
 Qi454e4uKFkeoZ/OImw7dqyQlbAVolXW6+zlwWuA=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
In-Reply-To: <tencent_7DE3A7000B33C89E09783AFC@qq.com>
References: <tencent_7DE3A7000B33C89E09783AFC@qq.com>
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1588216734t222039
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?amFlLmh5dW4ueW9v?=" <jae.hyun.yoo@linux.intel.com>,
 "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>,
 "=?ISO-8859-1?B?ZWFqYW1lcw==?=" <eajames@linux.ibm.com>,
 "=?ISO-8859-1?B?Sm9lbCBTdGFubGV5?=" <joel@jms.id.au>,
 "=?ISO-8859-1?B?QW5kcmV3LkplZmZlcnk=?=" <andrew@aj.id.au>
Subject: ikvm suspend on power cycle test
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5EAA439D_0AEEDB78_6427F5C1"
Content-Transfer-Encoding: 8Bit
Date: Thu, 30 Apr 2020 11:18:53 +0800
X-Priority: 3
Message-ID: <tencent_009676CE1A616BB7626EBD76@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 1555523841
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Thu, 30 Apr 2020 11:18:55 +0800 (CST)
Feedback-ID: webenglish:qq.com:bgweb:bgweb1
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

------=_NextPart_5EAA439D_0AEEDB78_6427F5C1
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgSmFlLEVhamFtZXMsDQogICBUaGUgaXBrdm0gd2lsbCBzdXNwZW5kIG9uIHBvd2VyIGN5
Y2xpbmcgdGVzdC4gVGhlIGVycm9yIG9mdGVuIG9jY3VycyBvbiAgaGFwcGVuIG9uIGFzdDI0
MDAgLGFuZCAgdGhlIHByb2JhYmlsaXR5IG9mIGFzdDI1MDAgaXMgcmVsYXRpdmVseSBzbWFs
bC4NCg0KVGVzdCBjYXNlOiBpcG1pdG9vbCBwb3dlciByZXNldA0KDQoNClRoZSBob3N0IHNj
cmVlbiBlcnJvciAgcmVhZDoNCnVzYiAxLTUuMTogZGV2aWNlIGRlc2NyaXB0b3IgcmVhZC82
NCxlcnJvciAtODUNCnVzYiAxLTUuMTogZGV2aWNlIGRlc2NyaXB0b3IgcmVhZC82NCxlcnJv
ciAtODUNCnVzYiAxLTUuMTogZGV2aWNlIGRlc2NyaXB0b3IgcmVhZC82NCxlcnJvciAtODUN
CnVzYiAxLTUuMTogZGV2aWNlIGRlc2NyaXB0b3IgcmVhZC82NCxlcnJvciAtODUNCnVzYiAx
LTUuMTogZGV2aWNlIG5vdCBhY2NlcHRpbmcgYWRkcmVzcyA2LGVycm9yIC04NQ0KdXNiIDEt
NS4xOiBkZXZpY2Ugbm90IGFjY2VwdGluZyBhZGRyZXNzIDcsZXJyb3IgLTg1DQp1c2IgMS01
LXBvcnQxOnVuYWJsZSB0byBlbnVtZXJhdGUgVVNCIGRldmljZXMNCg0KDQoNCg0KYm1jIGNv
bnNvbGU6DQojY2F0IC9zeXMvYnVzL3BsYXRmb3JtL2RldmljZXMvMWU2YTAwMDAudXNiLXZo
dWIvMWU2YTAwMDAudXNiLXZodWJcOnAxL2dhZGdldC9zdXNwZW5kIA0KDQojMQ0KVGhlIGlw
a3ZtIGNhbid0IHdvcmsgYW55bW9yZSBieSByZXN0YXJ0aW5nIHRoZSBzdGFydC1pcGt2bS5z
ZXJ2aWNlLg0KV2hhdCBjYXVzZXMgdGhpcyBwcm9ibGVtLGJtYyBrdm0sIGJpb3Mgb3IgaG9z
dCBPUyBrZXJuZWwgPyANCg0KQW55IGlkZWFzIHRvIHNvbHZlIGl0Pw0KDQoNCg0KQmVzdCwN
ClhpdXpoaQ==

------=_NextPart_5EAA439D_0AEEDB78_6427F5C1
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj48ZGl2PkhpIEphZSxFYWphbWVzLDwvZGl2PjxkaXY+Jm5ic3A7Jm5ic3A7IFRoZSBp
cGt2bSB3aWxsIHN1c3BlbmQgb24gcG93ZXIgY3ljbGluZyB0ZXN0LiBUaGUgZXJyb3IgPHNw
YW4gY2xhc3M9ImhpZ2gtbGlnaHQtYmcgb3JkaW5hcnktc3Bhbi1lZGl0IiBzdHlsZT0iIj5v
ZnRlbiBvY2N1cnMgb24gPC9zcGFuPiBoYXBwZW4gb24gYXN0MjQwMCAsYW5kJm5ic3A7IHRo
ZSBwcm9iYWJpbGl0eSBvZiBhc3QyNTAwIGlzIHJlbGF0aXZlbHkgc21hbGwuPGJyPjwvZGl2
PjxkaXY+VGVzdCBjYXNlOiBpcG1pdG9vbCBwb3dlciByZXNldDwvZGl2PjxkaXY+PGJyPjwv
ZGl2PjxkaXY+VGhlIGhvc3Qgc2NyZWVuIGVycm9yJm5ic3A7IHJlYWQ6PC9kaXY+PGRpdj51
c2IgMS01LjE6IGRldmljZSBkZXNjcmlwdG9yIHJlYWQvNjQsZXJyb3IgLTg1PC9kaXY+PGRp
dj51c2IgMS01LjE6IGRldmljZSBkZXNjcmlwdG9yIHJlYWQvNjQsZXJyb3IgLTg1PC9kaXY+
PGRpdj51c2IgMS01LjE6IGRldmljZSBkZXNjcmlwdG9yIHJlYWQvNjQsZXJyb3IgLTg1PC9k
aXY+PGRpdj51c2IgMS01LjE6IGRldmljZSBkZXNjcmlwdG9yIHJlYWQvNjQsZXJyb3IgLTg1
PC9kaXY+PGRpdj51c2IgMS01LjE6IGRldmljZSBub3QgYWNjZXB0aW5nIGFkZHJlc3MgNixl
cnJvciAtODU8L2Rpdj48ZGl2PnVzYiAxLTUuMTogZGV2aWNlIG5vdCBhY2NlcHRpbmcgYWRk
cmVzcyA3LGVycm9yIC04NTwvZGl2PjxkaXY+dXNiIDEtNS1wb3J0MTp1bmFibGUgdG8gZW51
bWVyYXRlIFVTQiBkZXZpY2VzPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+
PGRpdj5ibWMgY29uc29sZTo8L2Rpdj48ZGl2PiNjYXQgL3N5cy9idXMvcGxhdGZvcm0vZGV2
aWNlcy8xZTZhMDAwMC51c2Itdmh1Yi8xZTZhMDAwMC51c2Itdmh1Ylw6cDEvZ2FkZ2V0L3N1
c3BlbmQgPGJyPjwvZGl2PjxkaXY+IzE8L2Rpdj48ZGl2PlRoZSBpcGt2bSBjYW4ndCB3b3Jr
IGFueW1vcmUgYnkgcmVzdGFydGluZyB0aGUgc3RhcnQtaXBrdm0uc2VydmljZS48L2Rpdj48
ZGl2PldoYXQgY2F1c2VzIHRoaXMgcHJvYmxlbSxibWMga3ZtLCBiaW9zIG9yIGhvc3QgT1Mg
a2VybmVsID8gPGJyPjwvZGl2PjxkaXY+QW55IGlkZWFzIHRvIHNvbHZlIGl0Pzxicj48L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PkJlc3QsPC9kaXY+PGRpdj5YaXV6aGk8L2Rpdj48L2Rp
dj4=

------=_NextPart_5EAA439D_0AEEDB78_6427F5C1--

