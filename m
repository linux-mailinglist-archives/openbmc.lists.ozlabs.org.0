Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CD149712
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 03:43:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SW7X68ZLzDqXQ
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2019 11:43:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=184.105.206.29; helo=smtpbg202.qq.com;
 envelope-from=1450335857@qq.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="fKJt99Df"; 
 dkim-atps=neutral
Received: from smtpbg202.qq.com (smtpbg202.qq.com [184.105.206.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SW3v148qzDqXm
 for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2019 11:40:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1560822000; bh=K9YhUVyFpQfEStdp/mF159Ld+lkjNVbucsxkQ8YyfSM=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=fKJt99DfCwFlQRHn9uA9II3MV2QV9WUETGuAkje1zFoZ8H8Ub6PtWsWAYTvq6KibJ
 uqGeSTWE5XN1dk1KIBz3AakHtiqMebH1bvLClIS2jmZaDm5YwQ0gUTSWaVMJKXvB1R
 6ltTKGJU91S3T7494f4ZhprYUsBqkY/A6H0rHXcg=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
In-Reply-To: <mailman.3250.1560532343.4162.openbmc@lists.ozlabs.org>
References: <mailman.3250.1560532343.4162.openbmc@lists.ozlabs.org>
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1560822000t303684
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: Re:Re: Network Settings GUI
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5D0840EF_0C3214E0_20C7BB0E"
Content-Transfer-Encoding: 8Bit
Date: Tue, 18 Jun 2019 09:39:59 +0800
X-Priority: 3
Message-ID: <tencent_69C7E9EC6F65C50D0F925BFF@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 1810783009
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Tue, 18 Jun 2019 09:40:00 +0800 (CST)
Feedback-ID: webenglish:qq.com:bgforeign:bgforeign2
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

------=_NextPart_5D0840EF_0C3214E0_20C7BB0E
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgRGVyaWNrLA0KICAgIA0KTWVzc2FnZTogNA0KRGF0ZTogRnJpLCAxNCBKdW4gMjAxOSAx
MDo0OTozNiAtMDUwMA0KRnJvbTogRGVyaWNrIDxkZXJpY2subW9udGFndWVAZ21haWwuY29t
Pg0KVG86IFJhdGFuIEd1cHRhIDxyYXRhZ3VwdEBsaW51eC52bmV0LmlibS5jb20+LCBKYW5k
cmEgQQ0KCTxqYW5kcmFhcmFAZ21haWwuY29tPg0KQ2M6IE9wZW5CTUMgTWFpbGxpc3QgPG9w
ZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NClN1YmplY3Q6IFJlOiBOZXR3b3JrIFNldHRpbmdz
IEdVSQ0KTWVzc2FnZS1JRDoNCgk8Q0FPVW1ZRlJwaGY2RUViOXpiS18wTzhCWGd5dGdoclp3
PVdhOXJIMkxzUWFXT0tFZ1B3QG1haWwuZ21haWwuY29tPg0KQ29udGVudC1UeXBlOiB0ZXh0
L3BsYWluOyBjaGFyc2V0PSJVVEYtOCINCg0KPj4gSXMgdGhlIEdVSSBzcGVjaWZpYyBmb3Ig
SUJNLCBpZiBub3QgdGhlbiBJIGtub3cgZ29vZ2xlIGlzIHBsYW5uaW5nIHRvIHN1cHBvcnQg
dGhlIElQdjYgYW5kIHRoZSBndWkgc2hvdWxkIGJlIGF0IHBhciB3aXRoIG90aGVyIGF2YWls
YWJsZSBzdGFjayhBTUkvQVRFTikuDQoNCj5XZSBoYXZlIHByZXNlbnRlZCB0aGUgZGVzaWdu
IHRvIHRoZSBjb21tdW5pdHkgY29udGludW91c2x5IGZvciBxdWl0ZSBzb21lIHRpbWUuDQo+
V2UgYXJlIG5vdCBoZWFyaW5nIHRoYXQgdGhpcyBpcyBuZWVkZWQgaW4gdGhlIEdVSSBmcm9t
IGN1c3RvbWVycyBvcg0KdGhlIGNvbW11bml0eS4gV2UgZG9yZWFsaXplIHRoZXJlIGlzIHN1
cHBvcnQgaW4gb3RoZXIgc3RhY2tzLCBidXQgd2UgaGF2ZSBub3QgaGVhcmQgZnJvbWFueSB1
c2VycyB0aGF0IHRoZXkgdXNlIGl0IG9yIHBsYW4gdG8gdXNlIGl0LiBJdCB3b2xkIGJlIGhl
bHBmdWwgdG8ga25vdyB0aGF0IHRoZSBleHBlY3RhdGlvbnMgYXJlLiBJcyBWaWN0b3IgSHUg
dGhlIHBlcnNvbiB0aGF0IGlzIHRhbGtpbmcgdG8gR29vZ2xlIGFib3V0IHRoZWlyIHN1cHBv
cnQgbmVlZCBhbmQgZXhwZWN0YXRpb25zPw0KDQpJUFY2IGlzIG9uZSBvZiB0aGUgZnVuY3Rp
b25zICB1cmdlbnRseSBuZWVkIGJ5IExlbm92byBDb21tZXJjaWFsIFNlcnZlciBQcm9kdWN0
cy4gDQoNCg0KQmVzdCwNClhpdXpoaQ==

------=_NextPart_5D0840EF_0C3214E0_20C7BB0E
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj5IaSBEZXJpY2ssPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7Jm5ic3A7PC9kaXY+PGRp
dj5NZXNzYWdlOiA0PGJyPkRhdGU6IEZyaSwgMTQgSnVuIDIwMTkgMTA6NDk6MzYgLTA1MDA8
YnI+RnJvbTogRGVyaWNrICZsdDtkZXJpY2subW9udGFndWVAZ21haWwuY29tJmd0Ozxicj5U
bzogUmF0YW4gR3VwdGEgJmx0O3JhdGFndXB0QGxpbnV4LnZuZXQuaWJtLmNvbSZndDssIEph
bmRyYSBBPGJyPgkmbHQ7amFuZHJhYXJhQGdtYWlsLmNvbSZndDs8YnI+Q2M6IE9wZW5CTUMg
TWFpbGxpc3QgJmx0O29wZW5ibWNAbGlzdHMub3psYWJzLm9yZyZndDs8YnI+U3ViamVjdDog
UmU6IE5ldHdvcmsgU2V0dGluZ3MgR1VJPGJyPk1lc3NhZ2UtSUQ6PGJyPgkmbHQ7Q0FPVW1Z
RlJwaGY2RUViOXpiS18wTzhCWGd5dGdoclp3PVdhOXJIMkxzUWFXT0tFZ1B3QG1haWwuZ21h
aWwuY29tJmd0Ozxicj5Db250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9IlVURi04
Ijxicj48YnI+Jmd0OyZndDsgSXMgdGhlIEdVSSBzcGVjaWZpYyBmb3IgSUJNLCBpZiBub3Qg
dGhlbiBJIGtub3cgZ29vZ2xlIGlzIHBsYW5uaW5nIHRvIHN1cHBvcnQgdGhlIElQdjYgYW5k
IHRoZSBndWkgc2hvdWxkIGJlIGF0IHBhciB3aXRoIG90aGVyIGF2YWlsYWJsZSBzdGFjayhB
TUkvQVRFTikuPGJyPjxicj4mZ3Q7V2UgaGF2ZSBwcmVzZW50ZWQgdGhlIGRlc2lnbiB0byB0
aGUgY29tbXVuaXR5IGNvbnRpbnVvdXNseSBmb3IgcXVpdGUgc29tZSB0aW1lLjxicj4mZ3Q7
V2UgYXJlIG5vdCBoZWFyaW5nIHRoYXQgdGhpcyBpcyBuZWVkZWQgaW4gdGhlIEdVSSBmcm9t
IGN1c3RvbWVycyBvcjxicj50aGUgY29tbXVuaXR5LiBXZSBkb3JlYWxpemUgdGhlcmUgaXMg
c3VwcG9ydCBpbiBvdGhlciBzdGFja3MsIGJ1dCB3ZSBoYXZlIG5vdCBoZWFyZCBmcm9tYW55
IHVzZXJzIHRoYXQgdGhleSB1c2UgaXQgb3IgcGxhbiB0byB1c2UgaXQuIEl0IHdvbGQgYmUg
aGVscGZ1bCB0byBrbm93IHRoYXQgdGhlIGV4cGVjdGF0aW9ucyZuYnNwO2FyZS4gSXMgVmlj
dG9yIEh1IHRoZSBwZXJzb24gdGhhdCBpcyB0YWxraW5nIHRvIEdvb2dsZSBhYm91dCB0aGVp
ciBzdXBwb3J0IG5lZWQgYW5kIGV4cGVjdGF0aW9ucz88YnI+PGJyPklQVjYgaXMgb25lIG9m
IHRoZSBmdW5jdGlvbnMmbmJzcDsgdXJnZW50bHkgbmVlZCBieSBMZW5vdm8gQ29tbWVyY2lh
bCBTZXJ2ZXIgUHJvZHVjdHMuJm5ic3A7PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5CZXN0
LDwvZGl2PjxkaXY+WGl1emhpPC9kaXY+PGRpdj48YnI+Jm5ic3A7PC9kaXY+

------=_NextPart_5D0840EF_0C3214E0_20C7BB0E--



