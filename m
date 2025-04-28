Return-Path: <openbmc+bounces-16-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A93A9E5F4
	for <lists+openbmc@lfdr.de>; Mon, 28 Apr 2025 03:49:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zm5ws0c1Vz2yf1;
	Mon, 28 Apr 2025 11:49:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745804988;
	cv=none; b=kxVVt6E+/7pale7pDSlm5uUmvLu4/cIfz7stOMNeo13l1r6WaZDxyodOUFPA7gEIlEJXtwHvYOtx3L3zjJgtrkFDJJeLT80yG+VfJLaVfwxDmotJVu+irhN84hBba4b73lJNVtodO2aveO6BpVu04sKA2UFskGeoXF+5/Q5gAZcfaGv1vcsB9Km5429yp5ctXvWthGGYRolQSBflkQJEWvEeIzmsWT7NEPMWmw5QlYIBAuyqTqRXdqAm7cFvzZ1KvEFQzACwCsBIyhePUh3nAR5yM1GOlovp3w06TIvsabgIUl5WGsW4JduGUwXEkgQpBLdGzwf1IZJHBXu9gcPChQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745804988; c=relaxed/relaxed;
	bh=YLeadQKDsTFkcmZe6oLvMXEQ+li/QAmkWjOcjYAHSvs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B78fMnpvPBx+9U1J6SJ+Ne6ldgSDKJmpdq8LCgs9b24liclPjUgghts1OGuqVOga+UMxDCbN18rvPBLvx/P+NZzpZ1QMMPfh7Ot31Ps8KjnBgZgs9x+LK/G8rxEHD1SS2QqQwKBVNgtOwvWxLKc9teqpsVFi1dXIkyKM3XBPHQZselQ8oBfIlW6lPQD/M5JPyh4tSly5873AJ1/Sb2fAtQws7sPK8sbqzszJCAaf5jdZ80OS0dwRmzHWReJTLW2/huPzBoO87woc2XjC0Lkw92Ij4ChsqVpQeD/Q37lAx66zNHYsNak9BJkbrh9p6xeDoWfF7dh/su8rAZW5IROCnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ApXH5Wtl; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ApXH5Wtl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 351 seconds by postgrey-1.37 at boromir; Mon, 28 Apr 2025 11:49:47 AEST
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zm5wq5jMLz2xd5
	for <openbmc@lists.ozlabs.org>; Mon, 28 Apr 2025 11:49:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1745804633;
	bh=YLeadQKDsTFkcmZe6oLvMXEQ+li/QAmkWjOcjYAHSvs=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=ApXH5WtldX6tFa5TILXw5j1jW5kxYJ14L7SrgewKSjhEdGPx961SYoWgpleq4oj2G
	 DHC0yrvUP7tI0f9A6ELMk6l/dQMNU3OPbNLFW26c9REGbGG37qpwReSCi5hmGsonyK
	 rF7VlNLN4HycMa0tC0Rq3k8njRdfJaQK2gnqabdAKl68Vl4ka1gc/7vc8yRt9YR1bx
	 oCo2U2xAdF/z2zifSDA6WOR4xo3xUO5x0OP6/eXKrx2u43kHLq+U4PVyqh9uilNLrX
	 Fue9FqOaX62DUYEzsQiMUpX3eRaOVGWJUIlZVYgSdoP/S2XXEAZFSXmzdatkGFHTFZ
	 5G0hs+5E6Ij6w==
Received: from [192.168.72.171] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1D44A7F93A;
	Mon, 28 Apr 2025 09:43:53 +0800 (AWST)
Message-ID: <d91c2e0617d97c79a31ac0b4d9db9d20506736eb.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6 0/3] Backport MCTP Over USB Binding
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Santosh Puranik <santosh.puranik.ibm@gmail.com>,
 openbmc@lists.ozlabs.org,  joel@jms.id.au, andrew@codeconstruct.com.au
Date: Mon, 28 Apr 2025 09:43:52 +0800
In-Reply-To: <20250427153008.3166922-1-santosh.puranik.ibm@gmail.com>
References: <20250427153008.3166922-1-santosh.puranik.ibm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Santosh,

> This series backports the MCTP over USB binding driver and associated
> definitions.
>=20
> Patches 1 and 2 were cherry-picked from upstream linux master and
> patch 3 includes fixes needed to backport the binding to 6.6.

We'll want to have f5d83cf0eeb9 ("net: mctp: unshare packets when
reassembling") included too:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/net/mctp?id=3Df5d83cf0eeb90fade4d5c4d17d24b8bee9ceeecc

- that should come from the 6.6 stable updates, but doesn't look like it
has hit the openbmc tree yet. Could just be a matter of sequencing vs.
that update, or you could include explicitly.

(Andrew or Joel may have opinions one way or the other)

A couple of comments on 3/3 too.

Cheers,


Jeremy

