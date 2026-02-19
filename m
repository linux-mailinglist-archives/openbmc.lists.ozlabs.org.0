Return-Path: <openbmc+bounces-1397-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ox3DMjclmlJpgIAu9opvQ
	(envelope-from <openbmc+bounces-1397-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 19 Feb 2026 10:50:00 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B035715D87A
	for <lists+openbmc@lfdr.de>; Thu, 19 Feb 2026 10:49:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGpWl6df5z2xlj;
	Thu, 19 Feb 2026 20:49:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771494595;
	cv=none; b=RAjdBCMc4INEjOAnNnXbE+Hm5wsmZLw704518uMZU4NYJUv+q9vL5qY9tX2eBa2anMM5B1rsp+YReyaOTKrwsu05gBgOFa8L+8ak8yW8OEGwxJ7CNezuOh5sMdooyx2V8v31i0fcVFcLmn+y0sUelM+Y3mCrmSczyvmkr2HJhnnQAmVciU2PAol8uXzHZFvtpjxJjh1rkIxfZf0bt2t/s/9gVJPIu6mp3iTOR2XJoTmORHowAYjMY7n7tPVNiGTh9aW1RCSTXZvA2pN7RKHkkQazXNX8pBH8lnA3dqCCmp1J7NNLcHpmWajq4khWeckyr0IDwn6z5jcx+TWt8uBl1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771494595; c=relaxed/relaxed;
	bh=KpRjGf8tTa0bff3tHuXhbFHTQr9Nrq5VxEq5ympGIHQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OU/B+/y9kT8slwHvDA7TWffrBOD6uwhc8LyZXAt1C+PFHbPAnN9Hc0av0v+V7PDaqipVViQtMZ19ck0MLS8q01rxXIgMCnwR4gO8WTQ8VOpsC4P2ramjM+2EjZsBRruDTUPvABR84E/8NpH8+wSiH8Z5mgBwu8O5ym8rvAgW0vIX71yz6Rx9vouw/eQ6L9OaGct5bAlqA5znXv3sekcYl+Z7/2JarpY1YeKY7IXm2hhPW1pBNv5waWTL+v0o6WyYZNjGVwDGfEYyydEIrxgkq9FwHckHWnKIYFE3s/0ByV+Y8affFes2SS2mXMzml/sotFTG+CrLXtnxENSEORAcEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Xdbd+7Yj; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Xdbd+7Yj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGpWl150Kz2xd6
	for <openbmc@lists.ozlabs.org>; Thu, 19 Feb 2026 20:49:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1771494594;
	bh=KpRjGf8tTa0bff3tHuXhbFHTQr9Nrq5VxEq5ympGIHQ=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Xdbd+7Yj0xd5mF97LdPKfh8+k0it6fG/1yBaam9hQLNN2oX5KNGDrurvjylSYNUJb
	 2saN5NTRCCSPVh7ulCuqgaWFSqIfRQRVSxItF79/y/oHM5G8ddDkwozLRPW9ccZ0Ph
	 CrtTIIIbE0ANkXsvX/DT7r5QTJ+TU5NO639shJ867cWn666fDbVcWuInBBOZzaZOnH
	 j5UfJ5aePwAYfjZ9wweK/fqDwlaqVgCJ27nfF//chlSXP47GVhxIYwdSpWsdFDoOU7
	 ocJ77diayeSeJv22NFzydQ8y6yWuy+PJUnpCQQlVdEPQCJJkHJvszALf8jitiqrZV6
	 Dz3rnEz4woe3w==
Received: from [192.168.68.114] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4BE9C6002C;
	Thu, 19 Feb 2026 17:49:54 +0800 (AWST)
Message-ID: <bb69a6c68656fbf91b2bdce60455a16846e5545c.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.18 v1 0/3] Axiado AX3000 SoC SPI DB
 controller driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kuan-Jui Chiu <kchiu@axiado.com>, openbmc@lists.ozlabs.org,
 joel@jms.id.au
Date: Thu, 19 Feb 2026 20:19:53 +1030
In-Reply-To: <20260213070927.1114371-1-kchiu@axiado.com>
References: <20260213070927.1114371-1-kchiu@axiado.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1397-lists,openbmc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:kchiu@axiado.com,m:openbmc@lists.ozlabs.org,m:joel@jms.id.au,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeconstruct.com.au:mid,codeconstruct.com.au:dkim]
X-Rspamd-Queue-Id: B035715D87A
X-Rspamd-Action: no action

On Thu, 2026-02-12 at 23:09 -0800, Kuan-Jui Chiu wrote:
> This patch series introduces new SPI controller driver for Axiado
> AX3000 SoC and its evaluation board.

Applied to dev-6.18.

Cheers,

Andrew

