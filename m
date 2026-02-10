Return-Path: <openbmc+bounces-1339-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qXFXFFJ8imkgLAAAu9opvQ
	(envelope-from <openbmc+bounces-1339-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 01:31:14 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A731159E4
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 01:31:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f92Y75ymgz2xVT;
	Tue, 10 Feb 2026 11:31:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770683467;
	cv=none; b=XSh2LXfuKh9W/ct/+OZ5nA7Z9DN1nxEzH3RX/Se0S6tdf6upFkaqHPnbZXd1AKwRmwhUltvdjFNXu4LOwpgq6FIlakODJtsoyx26o/0Hf+J1BSsUGBJHbFDRlvGV7Ck59MCsDz58jAuZTqISzcGBNpEqIPIitASchQ9BP94TpMHfiAp79Jzb3r0d1R6QRPho27RgRnbLxLKOYxRctJnemqqW9JbLIQ36uWtpXNlIWOkXABYPF8VmQZmWInEScrgU4ojH3DCvg1qQkcis8fOmnzLKTC0yGs+a4ux3MQy8p5FcBzlxrQPoaF5g1o21eAOiYOhk0WE0WlOksdWHMoDFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770683467; c=relaxed/relaxed;
	bh=vIC6klmE2grs757S2BtTR4Xf9BMT0al058Lg2IE70rw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l8Yez/KRF9HdqfV1bqJVpUe3kZa/FCcuEHM7yDxsR0a5/YURdYyWcPa44X+09niah+lZPyDaBSXJ3zq2c8VYiSdLJCHbaUbzHNOfCyrZfh7q3zQhCxU8pcMgDePHHDZ6oxoEGgTx2rTj6L31S6WU1ny1KdzB/2Lht9RjzSdSQHs3nMi7O+um36f1cRDZpR2vOgFpus/mSCB3Dz7vKi+Pve2aL17+5LVmX0VpRBS5rdXxrUuM/doerzFP4WHqHB8evJRZyep3KmeBUxgyGlM92N4zQUJlk5RQhASw2buAvjQ7Gk1hH4PiYKErlodwuxnwlkVpZqcHvYkFT3QiB1Iflw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fFcjQSfw; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fFcjQSfw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f92Y66lKDz2xNB
	for <openbmc@lists.ozlabs.org>; Tue, 10 Feb 2026 11:31:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770683465;
	bh=vIC6klmE2grs757S2BtTR4Xf9BMT0al058Lg2IE70rw=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=fFcjQSfwk5xL7JlY8b7bQoORLgAySbr26ErTQGVByeFUePdI1pleid4rHIbU/26f6
	 XJRDmOZgst73UtVozgz8SZWS+Rf7fuM0H/wFEJGFQzF4yrWyfeaH4b9TJRhphYU/+s
	 rcIgsdxYIl5Oxi7AJUtpj91t7WM/mNTnGamR00lbTBZPXg26LyI9/nbZON/AEDrvfq
	 I+QNE/Y6JIHvm4Qewip7E44rSDYeRAB/ijk1NmQ1dNEhelP+Drk3bLN0KzweMyouUP
	 jh/6V6i81w5cqHq128xKcSuFx9soUZ0s8YtBUr5YHlNt1DYuD+8GGHSXpu4DLisP8X
	 EsRW1rFUJGluA==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 04897603B4;
	Tue, 10 Feb 2026 08:31:03 +0800 (AWST)
Message-ID: <9f8ff691fbee2680b3070abcc4838a964892fb72.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.18 0/2] hwmon: Add support for MPS mp5926
 chip
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Potin Lai <potin.lai.pt@gmail.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au
Date: Tue, 10 Feb 2026 11:01:03 +1030
In-Reply-To: <20260130021701.2357288-1-potin.lai.pt@gmail.com>
References: <20260130021701.2357288-1-potin.lai.pt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-0+deb13u1 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.10 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MAILLIST(-0.19)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.ozlabs.org,jms.id.au];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:potin.lai.pt@gmail.com,m:openbmc@lists.ozlabs.org,m:joel@jms.id.au,m:potinlaipt@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1339-lists,openbmc=lfdr.de];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: B8A731159E4
X-Rspamd-Action: no action

T24gRnJpLCAyMDI2LTAxLTMwIGF0IDEwOjE2ICswODAwLCBQb3RpbiBMYWkgd3JvdGU6Cj4gQmFj
a3BvcnQgbXA1OTI2IGRyaXZlciBzdXBwb3J0IHRvIGtlcm5lbCA2LjE4Lgo+IAo+IFl1eGkgV2Fu
ZyAoMik6Cj4gwqAgZHQtYmluZGluZ3M6IGh3bW9uOiBBZGQgbXBzIG1wNTkyNiBkcml2ZXIgYmlu
ZGluZ3MKPiDCoCBod21vbjogYWRkIG1wNTkyNiBkcml2ZXIKPiAKPiDCoC4uLi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3RyaXZpYWwtZGV2aWNlcy55YW1swqAgfMKgwqAgMiArCj4gwqBEb2N1bWVudGF0
aW9uL2h3bW9uL2luZGV4LnJzdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKg
IDEgKwo+IMKgRG9jdW1lbnRhdGlvbi9od21vbi9tcDU5MjYucnN0wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCA5MiArKysrKysrKysKPiDCoE1BSU5UQUlORVJTwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqAgNyArCj4gwqBkcml2ZXJzL2h3bW9uL3BtYnVzL0tjb25maWfCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgOSArCj4gwqBkcml2ZXJzL2h3bW9uL3BtYnVzL01h
a2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxICsKPiDCoGRy
aXZlcnMvaHdtb24vcG1idXMvbXA1OTI2LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMTgzICsrKysrKysrKysrKysrKysrKwo+IMKgNyBmaWxlcyBjaGFuZ2VkLCAyOTUgaW5z
ZXJ0aW9ucygrKQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vaHdtb24vbXA1
OTI2LnJzdAo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaHdtb24vcG1idXMvbXA1OTI2
LmMKCkkndmUgYXBwbGllZCB0aGlzIHNlcmllcywgaG93ZXZlciBJJ3ZlIGRvbmUgaXQgYnkgYmFj
a3BvcnRpbmcgdGhlCnBhdGNoZXMgb3V0IG9mIGh3bW9uLW5leHQuIFBsZWFzZSB0YWtlIGEgbG9v
ayBhdCB0aGUgZGV2LTYuMTggYnJhbmNoLgoKSW4gdGhlIGZ1dHVyZSwgaWYgeW91IHNlbmQgYmFj
a3BvcnRzIGxpa2UgdGhpcywgY2FuIHlvdSBwbGVhc2UgaW5jbHVkZQp5b3VyIFNpZ25lZC1vZmYt
YnksIGFuZCB3aGVyZSBhcHByb3ByaWF0ZSwgdXNlIGBnaXQgY2hlcnJ5LXBpY2sgLXhgIHRvCm1h
a2Ugc3VyZSB0aGUgY29tbWl0LXRyYWNraW5nIGluZm9ybWF0aW9uIGFwcGVhcnMgaW4gdGhlIHBh
dGNoLgoKVGhhbmtzLAoKQW5kcmV3Cg==


