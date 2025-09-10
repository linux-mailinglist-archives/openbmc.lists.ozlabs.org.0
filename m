Return-Path: <openbmc+bounces-622-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57746B50FFC
	for <lists+openbmc@lfdr.de>; Wed, 10 Sep 2025 09:52:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMCZx0vLmz3d2c;
	Wed, 10 Sep 2025 17:52:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757490745;
	cv=none; b=ef4xJuK3AFDg4iHiUz6Ke/2QC6LvXoF/oLDERdCenuf1SkzqI236fvl6sTFFKwqMFqTgGVLnACxJ8OuSDD7llVKNQRmZSghofeNylurFqy7985lic6mYY7zeiw84ShBwQbyr7ZpOXQILnMSsrbgohb6/uhkVUyybJGwvkFOY29t+gE7M2BN6kDof0SIFWt6sy/UEjy76Vy0lX0gic92+8rgHebgjwyfrLLV8KbtnFyO1aco7UE56VhUm929Au55OJvY/U6w8k3TkyJ0Dd2ECGTWynGzz/03SFVAEITbFP7AUgDpWRa/Lv8wiz2nyLR5WZvQohCRr1msm9Mpgd/ASNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757490745; c=relaxed/relaxed;
	bh=0t9yGEEXA3Nn31jI+sccFFY5GV7rY3i2PAjiZdNyzW8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mAOcZG/9tB98l1Le6krawvke7TXLoxvRqgSPB91l3AvIzLUaYebz3OtBnOx9pYypknJUtGOAVLQyVTdj1EwIWOO853jRBfhYZ6NUcRb02JRHw1t1MXh3yu+SFdNQXx2CMAztP0Uljwwh1501CVNZnIpNTy9QmzJci9/ynvzylLJhJ+kPKG3tjVn37x2EE41/GcuDJAiF6GCVnuNNmnw3iEBhvheaXoXjfnGYTruLiEDMvrj9o5k4k64jjWWHzYi3Bx05fC0ppM67TVBCA1/M11uTLWcutDU/xDQbIudc8Fq73yRP/OcLHahl1JvdXIyL/3cNbtRXUxXK4GXpiMPeUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=UpAiqXB3; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=UpAiqXB3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMCZr0MPnz3d2S
	for <openbmc@lists.ozlabs.org>; Wed, 10 Sep 2025 17:52:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1757490737;
	bh=0t9yGEEXA3Nn31jI+sccFFY5GV7rY3i2PAjiZdNyzW8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=UpAiqXB3yiQEgpvPHKLvbnNRdMV2SHfn0p0a6v3MF12xT+5TlctwrtOaez6Zk8spA
	 HKpx8SPWcBAY4YqjIMk26VoKiqfN5w5wLppLQellIXouGegIg0Jcf6Kp9IyriWmXN9
	 LLRHX8UelKi428SLse1/00tT3wpIxnQlJDYHdMvIsMU567h1onU0npm/Htx10tLv2c
	 pcAN37aMAdTZ11uKoQ2sZf/3NM6BDgVBIp/JnZ3DMe5shE9ZVpfO7dQM8ZmyyfxHRY
	 SX8pU7R2QMK5P8ueaTyw3akgbDB00Zs3klVO2sFazRiUMlspkxMDyhX33Q6x52mLsD
	 w2X6o2szzBrzQ==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A1CD067672;
	Wed, 10 Sep 2025 15:52:15 +0800 (AWST)
Message-ID: <bee023bb9b2ccb3e2437e466190dff2304268db9.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/2] arm64: dts: nuvoton: npcm845: Add peripheral
 nodes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 avifishman70@gmail.com,  tali.perry1@gmail.com, joel@jms.id.au,
 venture@google.com, yuenn@google.com,  benjaminfair@google.com
Cc: openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 10 Sep 2025 17:22:14 +0930
In-Reply-To: <20250908125938.3584927-2-tmaimon77@gmail.com>
References: <20250908125938.3584927-1-tmaimon77@gmail.com>
	 <20250908125938.3584927-2-tmaimon77@gmail.com>
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

SGkgVG9tZXIsCgpPbiBNb24sIDIwMjUtMDktMDggYXQgMTU6NTkgKzAzMDAsIFRvbWVyIE1haW1v
biB3cm90ZToKPiBFbmFibGUgcGVyaXBoZXJhbCBzdXBwb3J0IGZvciB0aGUgTnV2b3RvbiBOUENN
ODQ1IFNvQyBieSBhZGRpbmcgZGV2aWNlCj4gbm9kZXMgZm9yIEV0aGVybmV0IGNvbnRyb2xsZXJz
LCBNTUMgY29udHJvbGxlciwgU1BJIGNvbnRyb2xsZXJzLCBVU0IKPiBkZXZpY2UgY29udHJvbGxl
cnMsIHJhbmRvbSBudW1iZXIgZ2VuZXJhdG9yLCBBREMsIFBXTS1GQU4gY29udHJvbGxlciwKPiBh
bmQgSTJDIGNvbnRyb2xsZXJzLiBJbmNsdWRlIHBpbm11eCBjb25maWd1cmF0aW9ucyBmb3IgcmVs
ZXZhbnQKPiBwZXJpcGhlcmFscyB0byBzdXBwb3J0IGhhcmR3YXJlIG9wZXJhdGlvbi4gQWRkIGFu
IE9QLVRFRSBmaXJtd2FyZSBub2RlCj4gZm9yIHNlY3VyZSBzZXJ2aWNlcy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBUb21lciBNYWltb24gPHRtYWltb243N0BnbWFpbC5jb20+Cj4gLS0tCj4gwqAuLi4v
ZHRzL251dm90b24vbnV2b3Rvbi1jb21tb24tbnBjbTh4eC5kdHNpwqDCoCB8IDcwMiArKysrKysr
KysrKysrKysrKy0KPiDCoC4uLi9ib290L2R0cy9udXZvdG9uL251dm90b24tbnBjbTg0NS5kdHNp
wqDCoMKgwqAgfMKgwqAgNyArCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDcwOCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbnV2
b3Rvbi9udXZvdG9uLWNvbW1vbi1ucGNtOHh4LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL251
dm90b24vbnV2b3Rvbi1jb21tb24tbnBjbTh4eC5kdHNpCj4gaW5kZXggMjQxMzM1MjhiOGU5Li43
ZjEyMGRhMzMxMGEgMTAwNjQ0Cj4gCgoqc25pcCoKCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGZpdTE6IHNwaUBmYjAwMjAwMCB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0gIm51dm90b24sbnBjbTg0NS1maXUiOwo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAjc2l6ZS1jZWxscyA9IDwwPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDAgMHhmYjAwMjAwMCAweDAgMHgxMDAwPjsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZy1uYW1lcyA9ICJj
b250cm9sIjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGNsb2NrcyA9wqAgPCZjbGsgTlBDTThYWF9DTEtfU1BJMT47Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjbG9jay1uYW1lcyA9ICJjbGtfc3BpMSI7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcGluY3RybC0wID0gPCZzcGkxX3BpbnM+Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RhdHVzID0gImRpc2FibGVkIjsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGZpdTM6IHNwaUBjMDAwMDAwMCB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0gIm51dm90b24sbnBjbTg0NS1maXUiOwo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAjc2l6ZS1jZWxscyA9IDwwPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDAgMHhjMDAwMDAwMCAweDAgMHgxMDAwPjsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZy1uYW1lcyA9ICJj
b250cm9sIjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGNsb2NrcyA9wqAgPCZjbGsgTlBDTThYWF9DTEtfU1BJMz47Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjbG9jay1uYW1lcyA9ICJjbGtfc3BpMyI7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwaW5jdHJsLW5h
bWVzID0gImRlZmF1bHQiOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcGluY3RybC0wID0gPCZzcGkzX3BpbnM+Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RhdHVzID0gImRpc2FibGVkIjsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGZpdXg6IHNwaUBmYjAwMTAwMCB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBjb21wYXRpYmxlID0gIm51dm90b24sbnBjbTg0NS1maXUiOwo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAjc2l6ZS1jZWxscyA9IDwwPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDAgMHhmYjAwMTAwMCAweDAgMHgxMDAwPiwKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDwweDAgMHhmODAwMDAw
MCAweDAgMHgyMDAwMDAwPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHJlZy1uYW1lcyA9ICJjb250cm9sIiwgIm1lbW9yeSI7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjbG9ja3MgPcKgIDwmY2xrIE5QQ004
WFhfQ0xLX1NQSVg+Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgY2xvY2stbmFtZXMgPSAiY2xrX2FoYiI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSAiZGlzYWJsZWQiOwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqB9OwoKQ2FuIHlvdSBwbGVhc2UgYXVkaXQgdGhlIHBhdGNoIChh
bmQgdGhlIHJlc3Qgb2YgdGhlIGR0c2kpIHRvIG1ha2Ugc3VyZQphbGwgbm9kZXMgYXJlIG9yZGVy
ZWQgYnkgYXNjZW5kaW5nIHVuaXQgYWRkcmVzcywgYXMgcGVyIHRoZSBEVFMgc3R5bGUKZ3VpZGU/
CgpodHRwczovL2RvY3Mua2VybmVsLm9yZy9kZXZpY2V0cmVlL2JpbmRpbmdzL2R0cy1jb2Rpbmct
c3R5bGUuaHRtbCNvcmRlci1vZi1ub2RlcwoKQW5kcmV3Cgo+ICsKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgbWM6IG1lbW9yeS1jb250cm9sbGVyQGYwODI0MDAwIHsKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbXBhdGlibGUgPSAibnV2
b3RvbixucGNtODQ1LW1lbW9yeS1jb250cm9sbGVyIjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJlZyA9IDwweDAgMHhmMDgyNDAwMCAweDAgMHgxMDAw
PjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludGVy
cnVwdHMgPSA8R0lDX1NQSSAyNSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgfTsKPiArCgoqc25pcCoK


