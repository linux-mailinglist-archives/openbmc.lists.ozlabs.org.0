Return-Path: <openbmc+bounces-29-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C753AAD39C
	for <lists+openbmc@lfdr.de>; Wed,  7 May 2025 04:52:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zsftg0l4Lz2y8W;
	Wed,  7 May 2025 12:52:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746586331;
	cv=none; b=B+30atVc2UWBnxgs/Cig/fPkAsY5dYtKtqmoR9u0OoS+y74Tiy1Ao1FCjb3Cg0fnAOhaDAFDUm9K+QUH+rG0mogpZA9Gic9TVhLDH2i/f4Ka+NDFdROO2z2KpZQn9VA+Re0QQJ64e+FDb+ancHbZsE2rqYC7PlNrx1Wh7MpHmdYNehajDHU0cXJhHegC8wLqSoeptUNiR6O7LjekDyJtGJB3tFFxtzPJUG+BlMhjHmB4bB397BlR9+4NM7y/O6I/WwMCjynYSA69KlfoyJMBh1jVkLl2LUMw5mL7aD+eaC4SVkQw5ToiWsm9DnfKBt5pA/A/hXtE/98mHhFCxF+RUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746586331; c=relaxed/relaxed;
	bh=jla9KNrIyCdQo3DzfEhy08PcQH+6cSQg16Xv+U233AU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=REQyqB3pBdlH45WHefdWWZvA2xh/Gkhcw9tlm6OHsP42/n3cPMJQXX4RD/L1vAHyJzTTF0eftaQJRzXZNnN/BEs0+vEz/Nip6CXlc2DJXC/Kwu+CBoeDYQvox0rHH4bEOrQsILoT+HaPWa/j2Kd448pjz7nD6KQAPCAbZGREcVwap97M8HI+v1iNaUF/WFm6LfL2pIYCxUxFD5pc1sPVi0gKZhzK5GIt3K7+Dmj+l/bm6gyIXuZfuXL+r3zf0AxXv85SU6/luN8R3Jf2MTc8GnS/bMPofeUAOP1fCSZ5nK/weH7JwDAW+AAEDiEeO+ta9vdDMRX6bQ+oXfLBk5lrNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DEAxXyIW; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=DEAxXyIW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zsftf0nlgz2xYl
	for <openbmc@lists.ozlabs.org>; Wed,  7 May 2025 12:52:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1746586329;
	bh=jla9KNrIyCdQo3DzfEhy08PcQH+6cSQg16Xv+U233AU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DEAxXyIW/x7MxY0+7oDOoLYtt8LXGz1pQqcEmy/0HTyKS8dm4l8erumNwzO07H7K4
	 n0vWuEVTc/pZZxYQEapnu9D8kulboSld91j2dGSHH8U+m38Tyf5JspN5j9ZYgxJ8pr
	 e/Bx+K+Rlpgdulin/WuxhXSTfhXeC/h/jVrNa6nOPYS4OFKmfC8Gmk7y7SRvbUKQdT
	 /mrzZLZFagMzN1+9UCl5pvflJtjYJZD0Y3l5nDgLjdcrN3MFjzbF9MjWf1/xWQeOle
	 U2mzLOuF71sPUsRmesGjqbTYFJtsrRh0r3dZQFCpjvWjwR3mNHpqOBsOnNxaZVz1jm
	 D11auCpKfOHkA==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E93E764473;
	Wed,  7 May 2025 10:52:08 +0800 (AWST)
Message-ID: <2ed50b1463f62a829f863b889ab818f492b73946.camel@codeconstruct.com.au>
Subject: Re: [PATCH] arm64: dts: nuvoton: Add EDAC controller
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "William A. Kennington III" <william@wkennington.com>, Avi Fishman
 <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry
 <tali.perry1@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 07 May 2025 12:22:08 +0930
In-Reply-To: <20250415233403.2052913-1-william@wkennington.com>
References: <20250415233403.2052913-1-william@wkennington.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gVHVlLCAyMDI1LTA0LTE1IGF0IDE2OjM0IC0wNzAwLCBXaWxsaWFtIEEuIEtlbm5pbmd0b24g
SUlJIHdyb3RlOgo+IFdlIGhhdmUgdGhlIGRyaXZlciBzdXBwb3J0IGJ1dCBuZWVkIGEgY29tbW9u
IG5vZGUgZm9yIGFsbCB0aGUgOHh4Cj4gcGxhdGZvcm1zIHRoYXQgY29udGFpbiB0aGlzIGRldmlj
ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXaWxsaWFtIEEuIEtlbm5pbmd0b24gSUlJIDx3aWxsaWFt
QHdrZW5uaW5ndG9uLmNvbT4KPiAtLS0KPiDCoGFyY2gvYXJtNjQvYm9vdC9kdHMvbnV2b3Rvbi9u
dXZvdG9uLWNvbW1vbi1ucGNtOHh4LmR0c2kgfCA3ICsrKysrKysKPiDCoDEgZmlsZSBjaGFuZ2Vk
LCA3IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9u
dXZvdG9uL251dm90b24tY29tbW9uLW5wY204eHguZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bnV2b3Rvbi9udXZvdG9uLWNvbW1vbi1ucGNtOHh4LmR0c2kKPiBpbmRleCA0ZGE2MjMwOGIyNzQu
LmNjZWJjYjExYzA1ZSAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL251dm90b24v
bnV2b3Rvbi1jb21tb24tbnBjbTh4eC5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9u
dXZvdG9uL251dm90b24tY29tbW9uLW5wY204eHguZHRzaQo+IEBAIC01Niw2ICs1NiwxMyBAQCBj
bGs6IHJzdGM6IHJlc2V0LWNvbnRyb2xsZXJAZjA4MDEwMDAgewo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCNjbG9jay1jZWxscyA9IDwxPjsKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07Cj4gwqAKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgbWM6IG1lbW9yeS1jb250cm9sbGVyQGYwODI0MDAwIHsKPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbXBhdGlibGUgPSAibnV2b3Rv
bixucGNtODQ1LW1lbW9yeS1jb250cm9sbGVyIjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDAgMHhmMDgyNDAwMCAweDAgMHgyMDAwPjsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludGVycnVw
dHMgPSA8R0lDX1NQSSAyNSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH07Cj4gKwoKVGhlIHBhdGNoIGZhaWxzIHRvIGFw
cGx5IGR1ZSB0byBmdXp6LCBkbyB5b3UgbWluZCByZWJhc2luZyBpdCBvbgpudXZvdG9uL2FybTY0
L2R0IGZyb20gWzFdPwoKWzFdOiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9hcmovYm1jLmdpdAoKUG9zc2libHkgaXQncyB0aGUgcmVzdWx0IG9mIGFwcGx5
aW5nIG90aGVyIHBhdGNoZXMgb2YgeW91cnMgYXMgdGhleQp3ZXJlIHNlbnQgaW5kZXBlbmRlbnRs
eS4gSXQgbWlnaHQgYmUgYmVzdCB0byBzZW5kIHRoZW0gYXMgYSBzZXJpZXMgZXZlbgppZiB0aGV5
IGFyZSBjb25jZXB0dWFsbHkgaW5kZXBlbmRlbnQuCgpBbmRyZXcK


