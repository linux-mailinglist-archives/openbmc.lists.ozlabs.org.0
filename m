Return-Path: <openbmc+bounces-680-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5F4B8E9C6
	for <lists+openbmc@lfdr.de>; Mon, 22 Sep 2025 02:01:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVNZM63Rcz2yyx;
	Mon, 22 Sep 2025 10:01:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758499307;
	cv=none; b=GprhV9a07CALGKsoPVpY3VbaoybgPKHzy3McY6rfN+S2+5YIenuNmEcVJa4qEqWU39l4neGpPh7bdlGOZiYKU0RgtVoANuZrENh30ybDhIbzXpYResdIygMjQHLZvBJ3jW8rEGpWo0svX0TCFDn/J4/FqH1dZz/WMbdZclwU4oSaZBBOk3zvPfxz7b7UwMVjBegXkBxLgNDQF5+32GQQLs9p/SEuD5UikRqlV4yOhXFtf25f+7WxyW4K3IdC+4YsOIMphXdZRmAPFzWE5MK0v5gIbmmsRmLqL/v527sA1blX/pT/xYuG3mvVyyRKUco1gQfLsy1eGh7vdS0a+e/xkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758499307; c=relaxed/relaxed;
	bh=ssCcYwBx7eN15S8v3W+NcEBDkcN4VuRj1TXQodQTrzY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W1lyDRxvVVR31gGbDUQaI+vpXAYG6gSw6JuYYG9sPvk4jmL9KSwJ8h7B8ksaqo37+Zw0rBYd6vkgee0RFwLv2Z3Po/2WvXtgF9FhKXrWkTD75EJW42jBb9+9i1zKFaESBZZu/iHz3QVdLlDshWytxSf8EnRNyvvtw5wxMtwzyduM9jUu1TnJ0Wp+ZnRUsjM0S09owH0LQJ87W6xXocEv0FkJhiKyQiLKIMiZ+J0xMfU2do+WwJZp0NXnHH2arT5NX9XajMrJViXoB/lwAvCNcy4Y6xC9dzmXspACQQcn/w+4yKfWlayeM/YWY6NBCu1bOkh3yXqHWfD5paTp4qbnIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GgK+T2On; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GgK+T2On;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVNZK6jnwz2ytg
	for <openbmc@lists.ozlabs.org>; Mon, 22 Sep 2025 10:01:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1758499304;
	bh=ssCcYwBx7eN15S8v3W+NcEBDkcN4VuRj1TXQodQTrzY=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=GgK+T2On95f8vSSeEzl5d4nUztifGDNjq+4+Ms18JtV8tx+hNevjy5Co75KRCMkHr
	 WV1oRHgMUtiWoRHLTZB80JyXFbT5jamqaCNBP+kcTi/5NnqpBpU/wHfFRSFtCPqmU0
	 r3mLHEUSgHdzLEuuaTQ+7ML2Unn0e7QsYDo2VASqao56TYSPylP0VlrgUGTuLPbLmm
	 KQN1hMSnJq3/cvbSWL9qqyEAPzxKrYACW9L+5bJ0ot9UfRIhJN6eFlYjQVMes53RFD
	 IWBoceLUsxWN3Ak928gvucENg2oERpHUjypxzsiJem48ZoIP15Qov4AQgupX9FZwSR
	 6oHWLx/Nq5Uog==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D53C764730;
	Mon, 22 Sep 2025 08:01:43 +0800 (AWST)
Message-ID: <66be0d751eec0223d6c64a94b1c60009950a996c.camel@codeconstruct.com.au>
Subject: Re: On Code Reviews...
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Williams <patrick@stwcx.xyz>, OpenBMC List
	 <openbmc@lists.ozlabs.org>
Date: Mon, 22 Sep 2025 09:31:42 +0930
In-Reply-To: <aM9suaMKrCk9PY-T@heinlein>
References: <aM9suaMKrCk9PY-T@heinlein>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.1-1 
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
X-Spam-Status: No, score=1.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gU2F0LCAyMDI1LTA5LTIwIGF0IDIzOjEwIC0wNDAwLCBQYXRyaWNrIFdpbGxpYW1zIHdyb3Rl
Ogo+IAo+IAo+ICMgRGF0YSBvbiBjb21taXRzCj4gCj4gSSBoYXZlIGFub3RoZXIgdG9vbCB3aGlj
aCBjYW4gY29sbGVjdCB0aGUgY3VycmVudCBzdGF0ZSBvZiBjb2RlIHJldmlld3MKPiAobW9yZSBv
biB0aGlzIGxhdGVyKS7CoCBUaGlzIGlzIGEgcmVwb3J0IG9mIHdoZXJlIHdlIGFyZSBjdXJyZW50
bHkgYXQ6Cj4gCj4g4pWt4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSs4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSs4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSs4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pWuCj4g4pSCwqDCoMKgwqDC
oMKgwqDCoMKgwqAg4pSGIENvbW11bml0eSDilIYgTWFpbnRhaW5lcnMg4pSGIEF1dGhvciDilIIK
PiDilZ7ilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilarilZDilZDilZDilZDilZDi
lZDilZDilZDilZDilZDilZDilarilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDilZDi
lZDilarilZDilZDilZDilZDilZDilZDilZDilZDilaEKPiDilIIgPDI0IGhvdXJzIOKUhiAzwqDC
oMKgwqDCoMKgwqDCoCDilIYgMcKgwqDCoMKgwqDCoMKgwqDCoMKgIOKUhiAywqDCoMKgwqDCoCDi
lIIKPiDilJzilYzilYzilYzilYzilYzilYzilYzilYzilYzilYzilYzilLzilYzilYzilYzilYzi
lYzilYzilYzilYzilYzilYzilYzilLzilYzilYzilYzilYzilYzilYzilYzilYzilYzilYzilYzi
lYzilYzilLzilYzilYzilYzilYzilYzilYzilYzilYzilKQKPiDilIIgPDcyIGhvdXJzIOKUhiA2
NMKgwqDCoMKgwqDCoMKgIOKUhiAxNcKgwqDCoMKgwqDCoMKgwqDCoCDilIYgNjbCoMKgwqDCoCDi
lIIKPiDilJzilYzilYzilYzilYzilYzilYzilYzilYzilYzilYzilYzilLzilYzilYzilYzilYzi
lYzilYzilYzilYzilYzilYzilYzilLzilYzilYzilYzilYzilYzilYzilYzilYzilYzilYzilYzi
lYzilYzilLzilYzilYzilYzilYzilYzilYzilYzilYzilKQKPiDilIIgPDIgd2Vla3PCoCDilIYg
NzPCoMKgwqDCoMKgwqDCoCDilIYgMjTCoMKgwqDCoMKgwqDCoMKgwqAg4pSGIDkywqDCoMKgwqAg
4pSCCj4g4pSc4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pS84pWM4pWM4pWM4pWM
4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pS84pWM4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pWM
4pWM4pWM4pS84pWM4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pSkCj4g4pSCIDw4IHdlZWtzwqAg4pSG
IDQzwqDCoMKgwqDCoMKgwqAg4pSGIDM4wqDCoMKgwqDCoMKgwqDCoMKgIOKUhiAxMzLCoMKgwqAg
4pSCCj4g4pSc4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pS84pWM4pWM4pWM4pWM
4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pS84pWM4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pWM
4pWM4pWM4pS84pWM4pWM4pWM4pWM4pWM4pWM4pWM4pWM4pSkCj4g4pSCID44IHdlZWtzwqAg4pSG
IDk3wqDCoMKgwqDCoMKgwqAg4pSGIDM0wqDCoMKgwqDCoMKgwqDCoMKgIOKUhiA1ODjCoMKgwqAg
4pSCCj4g4pWw4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS04pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pS04pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pS04pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pWvCj4gCj4gTGVnZW5kOgo+IMKgwqDC
oCAqICJBdXRob3IiIC0gVGhlcmUgaXMgc29tZXRoaW5nIHdyb25nIHdpdGggdGhpcyBjb21taXQg
dGhhdCBuZWVkcyB0bwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJlIGFkZHJl
c3NlZCBieSB0aGUgYXV0aG9yLgo+IMKgwqDCoCAqICJDb21tdW5pdHkiIC0gVGhlcmUgaGFzIG5v
dCBiZWVuIGFueSByZXZpZXcgb2YgdGhpcyBjb21taXQ7IHRoZQo+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGV4cGVjdGF0aW9uIGlzIHRoYXQgd2UgaGF2ZSBfc29tZW9u
ZV8gb3RoZXIgdGhhbiB0aGUKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBtYWludGFpbmVyIGRvIGFuIGluaXRpYWwgcmV2aWV3Lgo+IMKgwqDCoCAqICJNYWludGFpbmVy
IiAtIFRoZSBjb21taXQgaXMgImdvb2QgdG8gZ28iIGFuZCBoYXMgYXQgbGVhc3Qgb25lCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXZpZXcuwqAgSXQgaXMgbm93
IHdhaXRpbmcgZm9yIGZpbmFsIHJldmlldyBhbmQKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFtob3BlZnVsbHldIG1lcmdlLgoKQSBiaXQgb2YgYSBkaXZlcmdlbmNl
IGludG8gcGVyc29uYWwgcHJlZmVyZW5jZSwgYnV0IGNhbiB3ZSBvcmRlciB0aGUKY29sdW1ucyBp
biB0ZXJtcyBvZiBwYXRjaCBwcm9ncmVzc2lvbiBpbnRvIHRoZSB0aGUgcmVwbz8gU28gQXV0aG9y
LApDb21tdW5pdHksIE1haW50YWluZXJzPwoKPiAKPiBJbiBEaXNjb3JkIHlvdSdsbCBzZWUgYSBu
ZXcgIm9wZW5ibWMtYm90Ii7CoCBUaGlzIGJvdCBhbHNvIHNlcnZlcyBhIHdlYnNpdGUKPiBhdCBo
dHRwczovL29wZW5ibWMuc3R3Y3gueHl6L2JvdMKgLsKgIEZlZWwgZnJlZSB0byBwYXVzZSBhbmQg
Z28gdGhlcmUgbm93LgoKSXQnZCBiZSBtaWxkbHkgaW50ZXJlc3RpbmcgdG8gYWxsb3cgc29ydGlu
ZyBieSBlLmcuIHRvdGFsIG91dHN0YW5kaW5nCnBhdGNoZXMsIG9yIHNwZWNpZmljIHBhdGNoIHN0
YXRlcy4KCkFuZHJldwo=


