Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A0272F314
	for <lists+openbmc@lfdr.de>; Wed, 14 Jun 2023 05:27:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=uJG8njXB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgrTM6s35z30PM
	for <lists+openbmc@lfdr.de>; Wed, 14 Jun 2023 13:27:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=uJG8njXB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=qq.com (client-ip=203.205.221.173; helo=out203-205-221-173.mail.qq.com; envelope-from=992492046@qq.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 853 seconds by postgrey-1.37 at boromir; Wed, 14 Jun 2023 13:27:01 AEST
Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgrSj6TsMz2xwc
	for <openbmc@lists.ozlabs.org>; Wed, 14 Jun 2023 13:26:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1686713215; bh=lL+ulDIcz4STKpB/t/QCwdDZnmjKo4p7KG1a3AzCeM4=;
	h=From:To:Subject:Date;
	b=uJG8njXBw5M1d/B8lKwu2XR6rumnFzErdOcYa7FQCmGYaVJAkKjjY0I4SgYeCpVyO
	 Pvb77/WWpnb/JlmGN8GEHCoO/9M6SQ7NMKvk9MhhuOPfn2Xs1Fy3ZdiEkC+XiF1rok
	 urWinQ4cIVaJGg2kNLjsycDPdwrSFU/eBaIfKe+Q=
X-QQ-FEAT: oHWrrGTW1dBM1wq2dbSTgn8AaBOV+Hnu
X-QQ-SSF: 00000000000000F0000000000000
X-QQ-XMAILREADINFO: OWGjEroX2VOy/dXPOYIzQK4=
X-QQ-XMAILINFO: M97kRfYivzNAzJ/2lDr8hT4qNUG98gvQleUPAYsVF5/vWrTpe/CxAQ/N6f8imG
	 v06ZJGoe4nwZiuFzIUV/8vyMKVKKwrvrv9et09ROatsLOWqPqPeJgIjvV2UT8aD8zaguY+lfxRu/S
	 iaDGh2Cx24lFLwd6mYjXipxiAgDYyE588N4335cxo1PKMVtUXC9qQeVjFRi5hVmv1C4ZGIr3BkU7Y
	 scoqAhni2WXnWo/tkPepnV8OYDkgeLz3fbe03gJ2ruNkCrpm4NeGln0VWdzC6i1WXaUEq6rL/HU/q
	 NEwoCzGiQLBX6cyOkAoQRM7WVyFqHTcY78Pbgcc4IV5meCvI4TWjLL0mv7DX2wCyBEgyFh4izeTU7
	 BXo9J//a4VRLQojt6sQ1/EHsvuEhVlzynaTSYUD5iHBMxVpk7Q7leodbm89cNvvlVDkQZ7NkmYisK
	 FeXgsXME70r0Nv72mAxnlkliHe5oQYqpsB0DhdpqZwGJWjtyyZRewGOud1anTUrOjnrJVnKiVwmEp
	 8CuKLRM6jCY/bQjsIPTNodjVLFvOmeYAbrrafEjUUxQKXU+LpPZ5yqYWIZSKHotk7mTICC96CX98b
	 MWsofTzFKJSxwoifYNSnVLtARQEzlLfRcS/1zFIRwhKeVvPKOIlFc2TwsucWLTNI9jsZ5qKxURuP0
	 7kymUPKIO3ZC6IWC3sTXAk/bsbnTOGop34EgrHJMfvcbrwVnpWW5HODApLHnp0d0cj4xi12/jAFLO
	 rYReyYKw1T/Nb1lm7BDdN1wGdmJQjFLp1XxKuUW5jYFckgK2cq7YszCUD2b8WX2PFu0v9i5WT2Z2m
	 Be9yGXw1MQ1sSCh2oregyHYt7JmOKoguUZ9bsSxLKQtg/IDmJ0t+PBpVYK4VtEzBjwTbBlenpgPgA
	 SqafU8HU8G/taKFEZa8Vj5ZFXUOMVyXbXj/iK06tu0NPtl+Uip7pUY5XU0ueLeM
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 218.76.101.94
X-QQ-STYLE: 
X-QQ-mid: webmail631t1686712292t5405807
From: "=?gb18030?B?ucy8/rb+sr/T97DY7L8=?=" <992492046@qq.com>
To: "=?gb18030?B?b3BlbmJtYw==?=" <openbmc@lists.ozlabs.org>
Subject: How can I short time of compiling bmcweb for develop and debug?
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_64892FE4_0F320E10_1FB2B0D3"
Content-Transfer-Encoding: 8Bit
Date: Wed, 14 Jun 2023 11:11:32 +0800
X-Priority: 3
Message-ID: <tencent_F28333DC12EF23784BA9F47E1E894F293C0A@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
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

------=_NextPart_64892FE4_0F320E10_1FB2B0D3
Content-Type: text/plain;
	charset="gb18030"
Content-Transfer-Encoding: base64

RWFjaCB0aW1lIHRoYXQgSSBjb2RlIGFueSBsaW5lIGluIGJtY3dlYiBzdWNoIGFzICdwcmlu
dGYoJ2hlbGxvIGJtYycpICcgc3RpbGwgbmVlZCB0byB0YWtlIHRvbyBtdWNoIHRpbWUoJmd0
OzVtaW4pIHRvIGNvbXBpbGUgcHJvamVjdC5BcyBhIGRldmVsb3BlciwgSXQgaXMgaGFyZCB0
byBzdGFuZCBmb3IgdGhpcyBpc3N1ZS5JIGNvbXBpbGVkIHRoZSBibWN3ZWIgYnkgY29tbWFu
ZCAnYml0YmFrZSBibWN3ZWInLldpdGhvdXQgb3BlbmJtYyBzdHJ1Y3R1cmUgY29tcGlsZSBp
bmRlcGVuZHRlbnRseSBpbiBteSBQQyBpcyBhbHNvIGNvc3QgbXVjaCB0aW1lLg0KSG93IGRv
IHlvdSBjb25xdWVyIHRoaXMgcHJvYmxlbSBpbiBkZXZlbG9wIHN0YWdlP1RoYW5rcyE=

------=_NextPart_64892FE4_0F320E10_1FB2B0D3
Content-Type: text/html;
	charset="gb18030"
Content-Transfer-Encoding: base64

PG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNo
YXJzZXQ9R0IxODAzMCI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMzEsIDM1LCA0MCk7IGZv
bnQtZmFtaWx5OiAtYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1Nl
Z29lIFVJJnF1b3Q7LCAmcXVvdDtOb3RvIFNhbnMmcXVvdDssIEhlbHZldGljYSwgQXJpYWws
IHNhbnMtc2VyaWYsICZxdW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdv
ZSBVSSBFbW9qaSZxdW90OzsiPkVhY2ggdGltZSB0aGF0IEkgY29kZSBhbnkgbGluZSBpbiBi
bWN3ZWIgc3VjaCBhcyAncHJpbnRmKCdoZWxsbyBibWMnKSAnIHN0aWxsIG5lZWQgdG8gdGFr
ZSB0b28gbXVjaCB0aW1lKCZndDs1bWluKSB0byBjb21waWxlIHByb2plY3QuQXMgYSBkZXZl
bG9wZXIsIEl0IGlzIGhhcmQgdG8gc3RhbmQgZm9yIHRoaXMgaXNzdWUuPC9zcGFuPjxkaXY+
PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMzEsIDM1LCA0MCk7IGZvbnQtZmFtaWx5OiAtYXBw
bGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1b3Q7LCAm
cXVvdDtOb3RvIFNhbnMmcXVvdDssIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2VyaWYsICZx
dW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBFbW9qaSZxdW90
OzsiPkkgY29tcGlsZWQgdGhlIGJtY3dlYiBieSBjb21tYW5kICdiaXRiYWtlIGJtY3dlYicu
V2l0aG91dCBvcGVuYm1jIHN0cnVjdHVyZSBjb21waWxlIGluZGVwZW5kdGVudGx5IGluIG15
IFBDIGlzIGFsc28gY29zdCBtdWNoIHRpbWUuPC9zcGFuPjxiciBzdHlsZT0iYm94LXNpemlu
ZzogYm9yZGVyLWJveDsgY29sb3I6IHJnYigzMSwgMzUsIDQwKTsgZm9udC1mYW1pbHk6IC1h
cHBsZS1zeXN0ZW0sIEJsaW5rTWFjU3lzdGVtRm9udCwgJnF1b3Q7U2Vnb2UgVUkmcXVvdDss
ICZxdW90O05vdG8gU2FucyZxdW90OywgSGVsdmV0aWNhLCBBcmlhbCwgc2Fucy1zZXJpZiwg
JnF1b3Q7QXBwbGUgQ29sb3IgRW1vamkmcXVvdDssICZxdW90O1NlZ29lIFVJIEVtb2ppJnF1
b3Q7OyI+PHNwYW4gc3R5bGU9ImNvbG9yOiByZ2IoMzEsIDM1LCA0MCk7IGZvbnQtZmFtaWx5
OiAtYXBwbGUtc3lzdGVtLCBCbGlua01hY1N5c3RlbUZvbnQsICZxdW90O1NlZ29lIFVJJnF1
b3Q7LCAmcXVvdDtOb3RvIFNhbnMmcXVvdDssIEhlbHZldGljYSwgQXJpYWwsIHNhbnMtc2Vy
aWYsICZxdW90O0FwcGxlIENvbG9yIEVtb2ppJnF1b3Q7LCAmcXVvdDtTZWdvZSBVSSBFbW9q
aSZxdW90OzsiPkhvdyBkbyB5b3UgY29ucXVlciB0aGlzIHByb2JsZW0gaW4gZGV2ZWxvcCBz
dGFnZT9UaGFua3MhPC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjogcmdiKDMxLCAzNSwgNDAp
OyBmb250LWZhbWlseTogLWFwcGxlLXN5c3RlbSwgQmxpbmtNYWNTeXN0ZW1Gb250LCAmcXVv
dDtTZWdvZSBVSSZxdW90OywgJnF1b3Q7Tm90byBTYW5zJnF1b3Q7LCBIZWx2ZXRpY2EsIEFy
aWFsLCBzYW5zLXNlcmlmLCAmcXVvdDtBcHBsZSBDb2xvciBFbW9qaSZxdW90OywgJnF1b3Q7
U2Vnb2UgVUkgRW1vamkmcXVvdDs7Ij48L3NwYW4+PC9kaXY+

------=_NextPart_64892FE4_0F320E10_1FB2B0D3--

