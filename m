Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB504C4FB
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 03:31:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tkmy4B0SzDqs3
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 11:31:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=103.7.29.139; helo=smtpbg64.qq.com; envelope-from=1450335857@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="toxVDmab"; 
 dkim-atps=neutral
Received: from smtpbg64.qq.com (unknown [103.7.29.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TkmM3dhWzDqrM
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 11:30:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1560994239; bh=TY4NDsFalG1uIuJ3H3zKFkFJqqeeKedHB5K7VHgDPYg=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=toxVDmabOdacv28NV2P219ZKnPPfCytxRH5qqJD6LoUuux6d+EHODDv6OLqC8obcH
 CLFa/nHg8FfEbtu411DgNtsB2Nf3Um4aoGhANHWZM6nUaqfIbW2x7F5V0Fi3WVRvh1
 7VUhK4sYgJ4JuMGy6TKJvWLPOu4JRbxccE/Sf2Ho=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
In-Reply-To: <CAOUmYFTVYjXwXP_oC6+yMUaUS8d15=Ys5BDqGjc-N5JBQC8HQg@mail.gmail.com>
References: <mailman.3250.1560532343.4162.openbmc@lists.ozlabs.org>
 <tencent_69C7E9EC6F65C50D0F925BFF@qq.com>
 <CAOUmYFRYB3i_-sLBMbmOXJX3-Lo49QjfK2G01XFHbj4Mndx4sA@mail.gmail.com>
 <CAMTupoQ9fovzOcFH__Ljq=y8RKAp8_7WYunzQ8xNcc6Qjk+Dvg@mail.gmail.com>
 <tencent_799D81715559779D478D3D61@qq.com>
 <CAOUmYFTVYjXwXP_oC6+yMUaUS8d15=Ys5BDqGjc-N5JBQC8HQg@mail.gmail.com>
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1560994238t12671
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?RGVyaWNr?=" <derick.montague@gmail.com>
Subject: Re:  Re: Network Settings GUI
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5D0AE1BE_0C516CB8_5B7C1869"
Content-Transfer-Encoding: 8Bit
Date: Thu, 20 Jun 2019 09:30:38 +0800
X-Priority: 3
Message-ID: <tencent_1BF1F4AC2B9970D9471A8668@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 3821290864
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Thu, 20 Jun 2019 09:30:38 +0800 (CST)
Feedback-ID: webenglish:qq.com:bgweb:bgweb115
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
Cc: =?ISO-8859-1?B?b3BlbmJtYw==?= <openbmc@lists.ozlabs.org>,
 =?ISO-8859-1?B?cnhzdW4=?= <rxsun@zd-tech.com.cn>,
 =?ISO-8859-1?B?SmFuZHJhIEE=?= <jandraara@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.

------=_NextPart_5D0AE1BE_0C516CB8_5B7C1869
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgRGVyaWNrLA0KPj4gVGhlIElQVjYgd2VidWkgc2hvdWxkIHN1cHBvcnQgYm90aCBJUFY0
IGFuZCBJUFY2IG9uIGEgc2luZ2xlIGludGVyZmFjZSBhdCB0aGUgc2FtZSB0aW1lIGFuZCB1
c2VycyBjYW4gc2V0IElQVjQgYW5kIElQVjYgb24gdGhlIHNhbWUgbmV0d29yayB3ZWJwYWdl
IGZyb20gTGVub3ZvIHRlc3QgY2FzZXMuDQoNCj5UaGFuayB5b3UhDQoNCj4+ICBSdWl4aWEg
KGhlciBlbWFpbDogcnhzdW5AemQtdGVjaC5jb20uY247KSwgZm9ybSBteSB0ZWFtIGNhbiBk
byAgZnJvbnQtZW5kICB0byBpbXBsZW1lbnQgeW91ciBkZXNpZ24gLiAgSXQgd291bGQgYmUg
YmVzdCBpZiB0aGUgSVBWNiBmZWF0dXJlIGNvdWxkIGJlIGFjaGlldmVkIGluIG9uZSB0byB0
d28gbW9udGhzLg0KDQo+SXQgd291bGQgYmUgZ3JlYXQgaWYgc2hlIHdlcmUgYWJsZSB0byBq
b2luIG91ciBHVUkgQ29tbXVuaXR5DQp3b3JrZ3JvdXAuIEl0J3MgZXZlcnkgb3RoZXIgV2Vk
bmVzZGF5IGF0IDEwOjAwIENlbnRyYWwgVGltZS4gV2UgdXNlDQp0aGVzZSB0byBkaXNjdXNz
IGFsbCB0aGUgR1VJIGlzc3Vlcy4gV2hlcmUgYXJlIHlvdSBsb2NhdGVkPw0KICBJIGFtIGlu
IEJlaUppbmcgIFVUQys4LiBUaGUgbWVldGluZyB0aW1lIGlzICBXZWRuZXNkYXkgIDIzOjAw
IEJlaWppbmcgVGltZSAoV2VkbmVzZGF5IDEwOjAwIGFtIENlbnRyYWwgRGF5bGlnaHQgVGlt
ZSksaXNuJ3QgaXQ/DQo+R1VJIENvbW11bml0eSBXb3JrZ3JvdXAgV2lraToNCmh0dHBzOi8v
Z2l0aHViLmNvbS9vcGVuYm1jL29wZW5ibWMvd2lraS9HVUktRGVzaWduLXdvcmstZ3JvdXAN
Cg0KDQoNCkJlc3QsDQpYaXV6aGk=

------=_NextPart_5D0AE1BE_0C516CB8_5B7C1869
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj5IaSBEZXJpY2ssPC9kaXY+PGRpdj4mZ3Q7Jmd0OyBUaGUgSVBWNiB3ZWJ1aSBzaG91
bGQgc3VwcG9ydCBib3RoIElQVjQgYW5kIElQVjYgb24gYSBzaW5nbGUgaW50ZXJmYWNlIGF0
IHRoZSBzYW1lIHRpbWUgYW5kIHVzZXJzIGNhbiBzZXQgSVBWNCBhbmQgSVBWNiBvbiB0aGUg
c2FtZSBuZXR3b3JrIHdlYnBhZ2UgZnJvbSBMZW5vdm8gdGVzdCBjYXNlcy48L2Rpdj48ZGl2
Pjxicj4mZ3Q7VGhhbmsgeW91ITxicj48YnI+Jmd0OyZndDsmbmJzcDsgUnVpeGlhIChoZXIg
ZW1haWw6IHJ4c3VuQHpkLXRlY2guY29tLmNuOyksIGZvcm0gbXkgdGVhbSBjYW4gZG8mbmJz
cDsgZnJvbnQtZW5kJm5ic3A7IHRvIGltcGxlbWVudCB5b3VyIGRlc2lnbiAuJm5ic3A7IEl0
IHdvdWxkIGJlIGJlc3QgaWYgdGhlIElQVjYgZmVhdHVyZSBjb3VsZCBiZSBhY2hpZXZlZCBp
biBvbmUgdG8gdHdvIG1vbnRocy48YnI+PGJyPiZndDtJdCB3b3VsZCBiZSBncmVhdCBpZiBz
aGUgd2VyZSBhYmxlIHRvIGpvaW4gb3VyIEdVSSBDb21tdW5pdHk8YnI+d29ya2dyb3VwLiBJ
dCdzIGV2ZXJ5IG90aGVyIFdlZG5lc2RheSBhdCAxMDowMCBDZW50cmFsIFRpbWUuIFdlIHVz
ZTxicj50aGVzZSB0byBkaXNjdXNzIGFsbCB0aGUgR1VJIGlzc3Vlcy4gV2hlcmUgYXJlIHlv
dSBsb2NhdGVkPzxicj4mbmJzcDsgSSBhbSBpbiBCZWlKaW5nJm5ic3A7IFVUQys4LiBUaGUg
bWVldGluZyB0aW1lIGlzJm5ic3A7Jm5ic3A7V2VkbmVzZGF5Jm5ic3A7IDIzOjAwIEJlaWpp
bmcgVGltZSAoV2VkbmVzZGF5IDEwOjAwIGFtJm5ic3A7PHNwYW4gc3R5bGU9ImZvbnQtZmFt
aWx5OiBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE3cHg7Ij5D
ZW50cmFsIERheWxpZ2h0IFRpbWU8L3NwYW4+KSxpc24ndCBpdD88L2Rpdj48ZGl2PiZndDtH
VUkgQ29tbXVuaXR5IFdvcmtncm91cCBXaWtpOjxicj5odHRwczovL2dpdGh1Yi5jb20vb3Bl
bmJtYy9vcGVuYm1jL3dpa2kvR1VJLURlc2lnbi13b3JrLWdyb3VwPGJyPjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+QmVzdCw8L2Rpdj48ZGl2PlhpdXpoaTwvZGl2Pg==

------=_NextPart_5D0AE1BE_0C516CB8_5B7C1869--

