Return-Path: <openbmc+bounces-237-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F71EADE14C
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 04:50:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMSrk0B9Yz30RN;
	Wed, 18 Jun 2025 12:49:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750214997;
	cv=none; b=TET0R3svsmw21QdQ3mroY4gFR2hSFXiPXFTECXK2eW63Gde6EaLmG/66DkQgR1vyafX+NIGWHNF3mLRMZFIZOHY6nO0ghSDYfz4438SfDGXM7RYlwwW4850EMswAiGZLDRsKXa9wLWCbOa4NZL72wV9zZ3yN4YC0b8MnHxr6PQ/lbQw6P2wc7989GEWKsZG/5X7HN45y7Cu49h7CGAxGijE1DvajxFHUBJG9zc7F/iP+XR1wzhb1WYp8bRoqzgAn0ENGC3ZCZVQD71FFsk5uo9/tfaC9VuN20k6llJSQN2Ecj3TYgEtfXBmqyhr18xBt6Vat78JMyQEPoSbEcCzJrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750214997; c=relaxed/relaxed;
	bh=ak6kVTFoArwDV/4ozE74qsjM9VnnJ3y5qUizMDA0RPU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ib1Jp2Xkw/YjsvYxfUwvTQsui7SoLHooWrG0aO2RYOiFatjLExLWmvK/RwRbEDiBJJLW9jf5SKmKov0e4Q8tV0pu08+nJfcJL7fh4h4ST998gEThxedhAhSjZ9iR61sIZrlw4z/d+2LLDlmrci8DV9Kh5rpyu4+cmPSGM6Nyk6vXA3GShbO6pHuDVvBzqAuSaIOLgjmYcRkaPE4NE7AvUzN8g1iUrXy64wPUQDjX+Yx95B2wmGtqHx69/abd6Rsr4h+IE6imnllVMhYtv/ZZk5CRyO8Sy/BT5cUiM1Ks8EK0/bBjJFezIPWZAN/i7JhmwyHIHnpj5TUFfTJlc6O1yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=V9brWjey; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=V9brWjey;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMSrg425jz309v;
	Wed, 18 Jun 2025 12:49:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750214994;
	bh=ak6kVTFoArwDV/4ozE74qsjM9VnnJ3y5qUizMDA0RPU=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=V9brWjey/MQ5R9FzjHwP+8hFRC5Mdjc/FSFzXPmZ4bW3XdyAi3jeUYRsYyelmm8Oz
	 ay2Q8J3o0HY7OkQZ3nLmavnSPmqHsYUfVYTM3DjuLDHiyDbB8/EBsu14iI1Glum0zG
	 qccbl7kenLfdTpkU4AftytDU3lh2KeEuA+pk+hVyGYFQtgK2u+oJmGv7EWTs7xXNv1
	 MhL5N5AdesyHk0KhzFAKr030S/HIvLMlUk4AQYqylDX5d2Tgh4+km5byPtslY6XR6J
	 nOfUaYl0bbKXxQBF3RXA1yOxOxnYCaPYmnSQCgjePQTmHe2AtkStmf50nANOBhCZV6
	 M8q8+sIn2pvYg==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 00565640A0;
	Wed, 18 Jun 2025 10:49:53 +0800 (AWST)
Message-ID: <4e6fd85cc8ed6c4261844842bc2e5e54e5db04e6.camel@codeconstruct.com.au>
Subject: Re: [PATCH 5/8] mmc: sdhci-of-aspeed: Fix null pointer
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cool Lee <cool_lee@aspeedtech.com>, adrian.hunter@intel.com, 
	ulf.hansson@linaro.org, joel@jms.id.au, p.zabel@pengutronix.de, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 18 Jun 2025 12:19:53 +0930
In-Reply-To: <20250615035803.3752235-6-cool_lee@aspeedtech.com>
References: <20250615035803.3752235-1-cool_lee@aspeedtech.com>
	 <20250615035803.3752235-6-cool_lee@aspeedtech.com>
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

T24gU3VuLCAyMDI1LTA2LTE1IGF0IDExOjU4ICswODAwLCBDb29sIExlZSB3cm90ZToKPiBQbGF0
Zm9ybSBkYXRhIG1pZ2h0IGJlIG51bGwuCgpDdXJyZW50bHkgaXQgY2FuJ3QgYmU6CgpodHRwczov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5n
aXQvdHJlZS9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWFzcGVlZC5jP2g9djYuMTYtcmMyI24z
NzUKCkFyZSB0aGVyZSBmdXR1cmUgY2lyY3Vtc3RhbmNlcyB3aGVyZSBpdCBtYXkgYmUgTlVMTD8K
CkknbSBhbGwgZm9yIHJlZHVjaW5nIHRoZSByZWFzb25pbmcgZnJvbSBnbG9iYWwgdG8gbG9jYWws
IGJ1dCBJIHRoaW5rCnNvbWUgZGlzY3Vzc2lvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugd291bGQg
YmUgZ29vZC4KCj4gCj4gU2lnbmVkLW9mZi1ieTogQ29vbCBMZWUgPGNvb2xfbGVlQGFzcGVlZHRl
Y2guY29tPgo+IC0tLQo+IMKgZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1hc3BlZWQuYyB8IDcg
KysrKystLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1hc3BlZWQuYwo+
IGIvZHJpdmVycy9tbWMvaG9zdC9zZGhjaS1vZi1hc3BlZWQuYwo+IGluZGV4IDJiZGQ5M2EzZjkx
Zi4uMjJkZGU5MTVlNTFiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbW1jL2hvc3Qvc2RoY2ktb2Yt
YXNwZWVkLmMKPiArKysgYi9kcml2ZXJzL21tYy9ob3N0L3NkaGNpLW9mLWFzcGVlZC5jCj4gQEAg
LTI0MSw3ICsyNDEsNyBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfc2RoY2lfc2V0X2Nsb2NrKHN0cnVj
dAo+IHNkaGNpX2hvc3QgKmhvc3QsIHVuc2lnbmVkIGludCBjbG9jaykKPiDCoMKgwqDCoMKgwqDC
oMKgc3RydWN0IHNkaGNpX3BsdGZtX2hvc3QgKnBsdGZtX2hvc3Q7Cj4gwqDCoMKgwqDCoMKgwqDC
oHVuc2lnbmVkIGxvbmcgcGFyZW50LCBidXM7Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBhc3Bl
ZWRfc2RoY2kgKnNkaGNpOwo+IC3CoMKgwqDCoMKgwqDCoGludCBkaXY7Cj4gK8KgwqDCoMKgwqDC
oMKgaW50IGRpdiA9IDE7Cj4gwqDCoMKgwqDCoMKgwqDCoHUxNiBjbGs7Cj4gwqAKPiDCoMKgwqDC
oMKgwqDCoMKgcGx0Zm1faG9zdCA9IHNkaGNpX3ByaXYoaG9zdCk7Cj4gQEAgLTI1Nyw2ICsyNTcs
OSBAQCBzdGF0aWMgdm9pZCBhc3BlZWRfc2RoY2lfc2V0X2Nsb2NrKHN0cnVjdAo+IHNkaGNpX2hv
c3QgKmhvc3QsIHVuc2lnbmVkIGludCBjbG9jaykKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKFdBUk5f
T04oY2xvY2sgPiBob3N0LT5tYXhfY2xrKSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoGNsb2NrID0gaG9zdC0+bWF4X2NsazsKPiDCoAo+ICvCoMKgwqDCoMKgwqDCoGlmIChzZGhj
aS0+cGRhdGEpCgpHaXZlbiB0aGlzIHNob3VsZG4ndCBiZSB0aGUgY2FzZSwgcGVyaGFwcyBwcmVj
ZWRlIGl0IHdpdGggYQpXQVJOX09OQ0UoIXNkaGNpLT5wZGF0YSk/CgpBbmRyZXcKCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRpdiA9IHNkaGNpLT5wZGF0YS0+Y2xrX2Rpdl9zdGFy
dDsKPiArCj4gwqDCoMKgwqDCoMKgwqDCoC8qCj4gwqDCoMKgwqDCoMKgwqDCoCAqIFJlZ2FyZGlu
ZyB0aGUgQVNUMjYwMDoKPiDCoMKgwqDCoMKgwqDCoMKgICoKPiBAQCAtMjczLDcgKzI3Niw3IEBA
IHN0YXRpYyB2b2lkIGFzcGVlZF9zZGhjaV9zZXRfY2xvY2soc3RydWN0Cj4gc2RoY2lfaG9zdCAq
aG9zdCwgdW5zaWduZWQgaW50IGNsb2NrKQo+IMKgwqDCoMKgwqDCoMKgwqAgKiBzdXBwb3J0aW5n
IHRoZSB2YWx1ZSAwIGluIChFTU1DMTJDWzc6Nl0sIEVNTUMxMkNbMTU6OF0pLAo+IGFuZCBjYXB0
dXJlCj4gwqDCoMKgwqDCoMKgwqDCoCAqIHRoZSAwLXZhbHVlIGNhcGFiaWxpdHkgaW4gY2xrX2Rp
dl9zdGFydC4KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gLcKgwqDCoMKgwqDCoMKgZm9yIChkaXYg
PSBzZGhjaS0+cGRhdGEtPmNsa19kaXZfc3RhcnQ7IGRpdiA8IDI1NjsgZGl2ICo9IDIpCj4gewo+
ICvCoMKgwqDCoMKgwqDCoGZvciAoOyBkaXYgPCAyNTY7IGRpdiAqPSAyKSB7Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBidXMgPSBwYXJlbnQgLyBkaXY7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoYnVzIDw9IGNsb2NrKQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwoK


