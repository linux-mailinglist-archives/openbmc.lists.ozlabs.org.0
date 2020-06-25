Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 918712099D4
	for <lists+openbmc@lfdr.de>; Thu, 25 Jun 2020 08:26:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sqmP15pDzDqkf
	for <lists+openbmc@lfdr.de>; Thu, 25 Jun 2020 16:26:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sqlf6RNpzDqgb
 for <openbmc@lists.ozlabs.org>; Thu, 25 Jun 2020 16:26:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=DWKnw2/w; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49sqlf3f30z9s1x;
 Thu, 25 Jun 2020 16:26:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1593066366; bh=6cOL1t0E5J93PxFkI7gIXlwvfLeg7Dxsk+mOuoFarmY=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=DWKnw2/w4/GMhSXSU8ThhGGTGzBQjHsZrppWLiF4CTUqXvwng6+h5iLyv/6rWVli3
 LHufQlBAPT6QEN0iQUTHPrBmxi8rbzoUBrIM+XE0K50lXsSLvi8nhTEO0NcsACFf/Y
 xgZ8Q8PDgGaDSFp8wKlHFU9taUerLSpmCD2efJGXADGlBBEWkPL0UzXoAIO08F8wXL
 SAchMa0MnZwZytB/F4H3P5lv+YVcfvX1wJuWwucuiSSJD1RDX6T0KgvYTg+t6dcmDO
 BOgJrjI8ksZpQlUQfBCB+kHQsloqih6QxhDGLZtI0xr4RsjEe5gIUTBbd1wDAhr/cB
 MENIFOjGNGmMg==
Message-ID: <f5ab3dea6acecfb865e98e9330a052c6a5d98474.camel@ozlabs.org>
Subject: Re: Release 2.8 Continued
From: Jeremy Kerr <jk@ozlabs.org>
To: Kurt Taylor <kurt.r.taylor@gmail.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Thu, 25 Jun 2020 14:26:02 +0800
In-Reply-To: <CAG5Oiwi4rXDd1M+YxdiXkx=mAxgt5pZOeEC3DZaRq1_cDB-qsQ@mail.gmail.com>
References: <CAG5Oiwi4rXDd1M+YxdiXkx=mAxgt5pZOeEC3DZaRq1_cDB-qsQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi Kurt,

> SUMMARY
> Release 2.8 is still pending. We need to either get these problems
> fixed ASAP, or release and document the problems/limitations,
> backporting as needed. I feel like too much time has passed and we
> just need to release and move on. We'll do better next time.
> Opinions?

No opinions, but just a thanks for keeping track of things here.

I'll take a look at the DHCP issue.

> Any others? Anyone else testing the release?

One thing I'm aware of: none of the IPMI assertion sensors will work on
the 2.8 branch. Could we pull this one in?

  https://github.com/openbmc/phosphor-host-ipmid/commit/3dc3558944

Cheers,


Jeremy

