Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD2D59006
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 03:56:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zfxn4D1yzDqWM
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 11:56:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=113.96.223.47; helo=qq.com; envelope-from=1450335857@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="OYqI+imb"; 
 dkim-atps=neutral
X-Greylist: delayed 67 seconds by postgrey-1.36 at bilbo;
 Fri, 28 Jun 2019 11:55:37 AEST
Received: from qq.com (smtpbg403.qq.com [113.96.223.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zfx607MlzDqS6
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 11:55:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1561686819; bh=eMA9Pp/tvnu1DaFt2H/1NepsiZD9DrtmnMojyDNfCWY=;
 h=From:To:Subject:Mime-Version:Date:Message-ID;
 b=OYqI+imbqBBrJV2Z1oMW8LzMnSg8eR072kfpPmxA5e12f+wdMAflLVoLK7FEMdw1r
 ieSoUMwG0cwlRohKTpLEm94/lT27gJp6hE9kvCseazfJtif2HQxdI4t4X6RLwWaEgh
 7JGK4pN+lmuQWpUUuf/H4BGzuPQLOOsNK5sWDC4c=
X-QQ-SSF: 00000000000000F000000000000000H
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.247.157.87
X-QQ-STYLE: 
X-QQ-mid: webenglish1t1561686818t210332
From: "=?ISO-8859-1?B?eGl1emhp?=" <1450335857@qq.com>
To: "=?ISO-8859-1?B?amFlLmh5dW4ueW9v?=" <jae.hyun.yoo@linux.intel.com>,
 "=?ISO-8859-1?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>,
 "=?ISO-8859-1?B?ZWFqYW1lcw==?=" <eajames@linux.ibm.com>,
 "=?ISO-8859-1?B?Sm9lbCBTdGFubGV5?=" <joel@jms.id.au>,
 "=?ISO-8859-1?B?QW5kcmV3LkplZmZlcnk=?=" <andrew@aj.id.au>,
 "=?ISO-8859-1?B?cmF0YWd1cHQ=?=" <ratagupt@linux.vnet.ibm.com>
Subject: How to prevent the user repeat-login to avoid the ikvm overload
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_5D157322_0CE10608_40841D02"
Content-Transfer-Encoding: 8Bit
Date: Fri, 28 Jun 2019 09:53:38 +0800
X-Priority: 3
Message-ID: <tencent_7DE3A7000B33C89E09783AFC@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-ReplyHash: 109030438
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1]) by smtp.qq.com (ESMTP) with SMTP
 id ; Fri, 28 Jun 2019 09:53:39 +0800 (CST)
Feedback-ID: webenglish:qq.com:bgforeign:bgforeign4
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

------=_NextPart_5D157322_0CE10608_40841D02
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

SGkgSmFlLFJhdGFuLA0KICAgVGhlIGlrdm0gb3Igb3BlbmJtYyBwaG9zcGhvci1yZXN0IHBy
b2Nlc3Mgd2lsbCBkZWFkbG9jayB3aGVuIHVzZXJzIG9wZXJhdGUgdGhlIGlrdm0gb24gZGlm
ZmVyZW50IFBDIGF0IHRoZSBzYW1lIHRpbWUgLiBUaGUgdXNlciBjYW4ndCBsb2dpbiB3aGVu
IHRoZSAgQ1BVIHVzYWdlIG9mIHBob3NwaG9yLWdldmVudCBwcm9jZXNzIG1vcmUgdGhhbiA3
MCUuICBUaGlzIGlzc3VlICB3aWxsIGJlIHRyaWdnZXJlZCB3aGVuIG9uZSB1c2VyIGxvZ2lu
ICBib3RoIG9uIGRpZmZlcmVudCBJUCBhbmQgb3BlcmF0ZSB0aGUgaG9zdCBieSAgaWt2bS4N
CiAgTXkgdGVzdCBjYXNlOg0KMSwgVGhlIHVzZXIgInJvb3QiIGxvZ2luIHRocm93IEFTVDI1
MDAgIG5ldHdvcmsgIGNhcmQsIGVudGVyIHRoZSBpa3ZtIHdlYnBhZ2UgLHRoZSBJUCAxOTIu
MTY4LjAuMTAwLg0KMiwgVGhlIHVzZXIgInJvb3QiIGxvZ2luIHRocm93IE9DUCBuZXR3b3Jr
IGNhcmQgd2l0aCBhIGRpZmZlcmVudCBJUCAxOTIuMTY4LjEuMTAwLCBlbnRlciB0aGUgaWt2
bSB3ZWIgcGFnZSwgZG8gc29tZSBrZXlib2FyZCBhbmQgbW91c2Ugb3BlcmF0aW9ucw0KMywg
VGhlIG9wZW5ibWMgd2lsbCBkZWFkbG9jayBhbmQgY2Fubid0IGxvZ2luLCBJIG11c3QgcmVz
dGFydCB0aGUgcGhvc3Bob3ItZ2V2ZW50IHNlcnZpY2UgLHRoZW4gSSBjYW4gbG9naW4gYWdh
aW4uDQogIEkgY3JlYXRlZCBvdGhlciBjb21tb24gdXNlcnMsIGl0IGlzIGltcG9zc2libGUg
dG8gZm9yYmlkIHRoZW0gdG8gbG9naW4gYW5kIG9wZXJhdGUgdGhlIGlrdm0gYXQgdGhlIHNh
bWUgdGltZSB0byBjYXVzZSB0aGUgYm1jIG92ZXJsb2FkIC4NCiAgIE15IHBlcnNvbmFsIGlk
ZWEgaXMgdG8gYWxsb3cgIG9uZSB1c2VyIHRvIGxvZ2luIG9ubHkgb24gb25lIG1hY2hpbmUg
YXQgYSB0aW1lLiBEbyB5b3UgaGF2ZSBhbnkgZ29vZCBpZGVhcz8NCg0KDQogIEJlc3QsDQpY
aXV6aGk=

------=_NextPart_5D157322_0CE10608_40841D02
Content-Type: text/html;
	charset="ISO-8859-1"
Content-Transfer-Encoding: base64

PGRpdj5IaSBKYWUsUmF0YW4sPC9kaXY+PGRpdj4mbmJzcDsgJm5ic3A7VGhlIGlrdm0gb3Ig
b3BlbmJtYyBwaG9zcGhvci1yZXN0IHByb2Nlc3Mgd2lsbCBkZWFkbG9jayB3aGVuIHVzZXJz
IG9wZXJhdGUgdGhlIGlrdm0gb24gZGlmZmVyZW50IFBDIGF0IHRoZSBzYW1lIHRpbWUgLiBU
aGUgdXNlciBjYW4ndCBsb2dpbiB3aGVuIHRoZSZuYnNwOyZuYnNwOzxzcGFuIGlkPSJ3XzMw
IiBoaWdoLWxpZ2h0LWlkPSJ3XzUsd18zMCIgY2xhc3M9IiIgc3R5bGU9ImNvbG9yOiByZ2Io
NTEsIDUxLCA1MSk7IGZvbnQtZmFtaWx5OiBBcmlhbCwgJnF1b3Q7UGluZ0ZhbmcgU0MmcXVv
dDssICZxdW90O0hpcmFnaW5vIFNhbnMgR0ImcXVvdDssIFNUSGVpdGksICZxdW90O01pY3Jv
c29mdCBZYUhlaSZxdW90OywgJnF1b3Q7V2VuUXVhbllpIE1pY3JvIEhlaSZxdW90Oywgc2Fu
cy1zZXJpZjsgYmFja2dyb3VuZC1jb2xvcjogcmdiKDI0OSwgMjQ5LCAyNDkpOyI+Q1BVJm5i
c3A7PC9zcGFuPjxzcGFuIGlkPSJ3XzMxIiBoaWdoLWxpZ2h0LWlkPSIiIHN0eWxlPSJjb2xv
cjogcmdiKDUxLCA1MSwgNTEpOyBmb250LWZhbWlseTogQXJpYWwsICZxdW90O1BpbmdGYW5n
IFNDJnF1b3Q7LCAmcXVvdDtIaXJhZ2lubyBTYW5zIEdCJnF1b3Q7LCBTVEhlaXRpLCAmcXVv
dDtNaWNyb3NvZnQgWWFIZWkmcXVvdDssICZxdW90O1dlblF1YW5ZaSBNaWNybyBIZWkmcXVv
dDssIHNhbnMtc2VyaWY7IGJhY2tncm91bmQtY29sb3I6IHJnYigyNDksIDI0OSwgMjQ5KTsi
PnVzYWdlIG9mJm5ic3A7PC9zcGFuPnBob3NwaG9yLWdldmVudCBwcm9jZXNzIG1vcmUgdGhh
biA3MCUuJm5ic3A7IFRoaXMgaXNzdWUmbmJzcDsgd2lsbCZuYnNwO2JlIHRyaWdnZXJlZCB3
aGVuIG9uZSB1c2VyIGxvZ2luJm5ic3A7IGJvdGggb24gZGlmZmVyZW50IElQIGFuZCBvcGVy
YXRlIHRoZSBob3N0IGJ5Jm5ic3A7IGlrdm0uPC9kaXY+PGRpdj4mbmJzcDsgTXkgdGVzdCBj
YXNlOjwvZGl2PjxkaXY+MSwgVGhlIHVzZXIgInJvb3QiIGxvZ2luIHRocm93IEFTVDI1MDAm
bmJzcDsgbmV0d29yayZuYnNwOyBjYXJkLCBlbnRlciB0aGUgaWt2bSB3ZWJwYWdlICx0aGUg
SVAgMTkyLjE2OC4wLjEwMC48L2Rpdj48ZGl2PjIsIFRoZSB1c2VyICJyb290IiBsb2dpbiB0
aHJvdyBPQ1AgbmV0d29yayBjYXJkIHdpdGggYSBkaWZmZXJlbnQgSVAgMTkyLjE2OC4xLjEw
MCwgZW50ZXIgdGhlIGlrdm0gd2ViIHBhZ2UsIGRvIHNvbWUga2V5Ym9hcmQgYW5kIG1vdXNl
IG9wZXJhdGlvbnM8L2Rpdj48ZGl2PjMsIFRoZSBvcGVuYm1jIHdpbGwgZGVhZGxvY2sgYW5k
IGNhbm4ndCBsb2dpbiwgSSBtdXN0IHJlc3RhcnQgdGhlIHBob3NwaG9yLWdldmVudCBzZXJ2
aWNlICx0aGVuIEkgY2FuIGxvZ2luIGFnYWluLjwvZGl2PjxkaXY+Jm5ic3A7IEkgY3JlYXRl
ZCBvdGhlciBjb21tb24gdXNlcnMsIGl0IGlzIGltcG9zc2libGUgdG8gZm9yYmlkIHRoZW0g
dG8gbG9naW4gYW5kIG9wZXJhdGUgdGhlIGlrdm0gYXQgdGhlIHNhbWUgdGltZSB0byBjYXVz
ZSB0aGUgYm1jIG92ZXJsb2FkIC48L2Rpdj48ZGl2PiZuYnNwOyAmbmJzcDtNeSBwZXJzb25h
bCBpZGVhIGlzIHRvIGFsbG93Jm5ic3A7IG9uZSB1c2VyIHRvIGxvZ2luIG9ubHkgb24gb25l
IG1hY2hpbmUgYXQgYSB0aW1lLiBEbyB5b3UgaGF2ZSBhbnkgZ29vZCBpZGVhcz88L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PiZuYnNwOyBCZXN0LDwvZGl2PjxkaXY+WGl1emhpPC9kaXY+


------=_NextPart_5D157322_0CE10608_40841D02--



