Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F36A037C0
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 07:13:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS11y2SG7z3cYJ
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 17:13:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736230384;
	cv=none; b=fk1maUIhq9oKxxSpq2RdbxvbeQKVo4ry8c4dhnKxj+5bDYcE9/EQsUNEdZ/L2zVp91UjXU60f/EJ5/Cdl7AFj852D5W46x8veYJdK3QybmUL3GNeaD0aCXlAuXecgvsZHav99U3o4UCmSY3jcnBPBWyx/XrYMPryuKeh4yWWMlLTGrFEGI0jFITys/6UiUPiD9s1lzyKRQuqGz4DKXQWY7QcnOLYM1xL3yDH9z/+q1eUBzd/vlzxYRby8TURL8v7jYRa5GTw6Kcj5Qp4fah5mHsmGwQoAnTH18I4UrWr+2Arw2diZOt43eXuW8JIdWz5fOIZi4euPCARYtYHHnLM3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736230384; c=relaxed/relaxed;
	bh=1Hvm0RDqb7A2rn7TiItPjseU9S8T14JnCwTxrvzhFm0=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aRbNWrh7Myt5Vy/DQxcLp9Ah/S2WPDL0/+p9Pb2fnzMllcAMZzbLaylag4AA1z0X5vlY5pOZyP3ynciRT9AfoK8T3bceqpaVnSQ3WyCUfvCn5fI2JlUidQ6hG2p7wgsgj0fL74x26U71nmpMv7FfTszSsdhVuJ7roy4ny3J1Nl2pX9D+vwTO8Bo0pZcju8LFBvNrZg7K/C3uhNDxZCK47S7ScWgaw7ycfmkatPEN7gkrXt3v0AqxN8opjnn1ILJKq6mNmsM4Etnvns/w9ngd71ZD+qJ+TrYWT5w9OHWGgd9YI5AsgH7NEPybpWG2MEB5DnF4giEg6UkTVqF3VRJILA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CNh8BXH8; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CNh8BXH8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YS11m5Dnbz30g5
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2025 17:13:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1736230380;
	bh=1Hvm0RDqb7A2rn7TiItPjseU9S8T14JnCwTxrvzhFm0=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=CNh8BXH8H1Cl9jEo37bgSRS3Rp4fKlNEPL1zl6ufz31yV5VTDHTpozDnwBT2vaJhF
	 rux4CDqQF+i+8LfM9uhH0HfHGhIju3GHAczFQt/nXLbN/X63w5WuhQ5X06X+MiZ7LB
	 3zUeRvXNksivjVlDYfys6Nr027fHQOY8YkC3g6CEnw4YGle5BS04NDcX0d1CAAOtj8
	 V+aJzxSyNSUGfV5FfC/7ia4TwbWQ3zoeSdKRtah/NBAnY4WAhSg9tBGIpTdrQhy/Ah
	 gPh+tFHt/kUReGFGjK3H4NGyOjt79MIxHli8Fo61MBpsLDktGIkbuHVOrVt7ZwowHf
	 4YnvoBSicaGcw==
Received: from [10.200.97.88] (203-173-1-122.dyn.iinet.net.au [203.173.1.122])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B9A37706BE;
	Tue,  7 Jan 2025 14:12:59 +0800 (AWST)
Message-ID: <48739595439c7b9a39bf97eba86fea064dc16bda.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6 v1 0/4] Add support for Intel CRPS PSU
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au, eajames@linux.ibm.com
Date: Tue, 07 Jan 2025 16:42:58 +1030
In-Reply-To: <20250106171530.1063148-1-ninad@linux.ibm.com>
References: <20250106171530.1063148-1-ninad@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

SGkgTmluYWQsCgpPbiBNb24sIDIwMjUtMDEtMDYgYXQgMTE6MTUgLTA2MDAsIE5pbmFkIFBhbHN1
bGUgd3JvdGU6Cj4gSGVsbG8sCj4gCj4gUGxlYXNlIHJldmlldyB0aGUgdmVyc2lvbiAxIG9mIHBh
dGNoc2V0Lgo+IAo+IFRoaXMgcGF0Y2hzZXQgaXMgYWxyZWFkeSBhcHBsaWVkIHVwc3RyZWFtOgo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWtlcm5lbC8yMDI0MTIxNzE3MzUzNy4xOTIz
MzEtMS1uaW5hZEBsaW51eC5pYm0uY29tCj4gCj4gTmluYWQgUGFsc3VsZSAoNCk6Cj4gwqAgaHdt
b246IChwbWJ1cy9jb3JlKSBBZGQgUE1CVVNfUkVWSVNJT04gaW4gZGVidWdmcwo+IMKgIGh3bW9u
OiAocG1idXMvY3JwcykgQWRkIEludGVsIENSUFMxODUgcG93ZXIgc3VwcGx5Cj4gwqAgZHQtYmlu
ZGluZ3M6IGh3bW9uOiBpbnRlbCxjcnBzMTg1OiBBZGQgdG8gdHJpdmlhbAo+IMKgIEFSTTogZHRz
OiBhc3BlZWQ6IHN5c3RlbTE6IFVzZSBjcnBzIFBTVSBkcml2ZXIKPiAKPiDCoC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3RyaXZpYWwtZGV2aWNlcy55YW1swqAgfMKgIDIgKwo+IMKgRG9jdW1lbnRh
dGlvbi9od21vbi9jcnBzLnJzdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA5
Nwo+ICsrKysrKysrKysrKysrKysrKysKPiDCoERvY3VtZW50YXRpb24vaHdtb24vaW5kZXgucnN0
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKwo+IMKgTUFJTlRBSU5FUlPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgNyArKwo+IMKgLi4uL2R0cy9hc3BlZWQvYXNwZWVkLWJtYy1pYm0tc3lz
dGVtMS5kdHPCoMKgwqDCoCB8wqAgOCArLQo+IMKgZHJpdmVycy9od21vbi9wbWJ1cy9LY29uZmln
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA5ICsrCj4gwqBkcml2ZXJz
L2h3bW9uL3BtYnVzL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgMSArCj4gwqBkcml2ZXJzL2h3bW9uL3BtYnVzL2NycHMuY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHwgNzQgKysrKysrKysrKysrKysKPiDCoGRyaXZlcnMvaHdtb24v
cG1idXMvcG1idXNfY29yZS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMyArKy0KPiDC
oDkgZmlsZXMgY2hhbmdlZCwgMjA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gwqBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9od21vbi9jcnBzLnJzdAo+IMKgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvaHdtb24vcG1idXMvY3Jwcy5jCj4gCgpJJ3ZlIGNoZXJyeS1w
aWNrZWQgdGhlIGNoYW5nZXMgb3V0IG9mIGh3bW9uL2h3bW9uLW5leHQgd2hlcmUKYXBwcm9wcmlh
dGUsIGFuZCBiYWNrcG9ydGVkIHRoZSBkZXZpY2V0cmVlIGNoYW5nZSBmcm9tIG15IEJNQyB0cmVl
LgoKVGhhbmtzLAoKQW5kcmV3Cg==

