Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4609729BC
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2024 08:43:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2vLC5Zm4z3cLk
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2024 16:43:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725950625;
	cv=none; b=hIoMIcf4e/lxA9G/S76sMN8ed9XdB77y8TtIpg+kuKe0YfNp0UFb81l5jEafOt08CmSNWwgZkfsOs5wQeEPhIqI4/fzvhUSX76kx+DT98J0WSUFydB+ZYp7OaWPYhwLj0ynryd/MIiWFhm0mmJHD6VXShD6RbhTmSvJpUlrW6VWswcApdvFm6j2mHYdLcEKH2ZbI8OdN9EDYTTcZG0RwTgpvgclu+N42KaLPZshFRRYFEw3KmokIOQU529rg3zI1+D7lhdIQA33Jb7/FNhX6ti00ut0Mn8ReTFmJVQd7Y8cAtUiQLDOCzqLy95b7l/yuPcXPE7s4cVe6m79LTP/v3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725950625; c=relaxed/relaxed;
	bh=Ar7rNuWOz1CLQeVxt4xohneB3mMSw8G6intxWP83/Pg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y9dPQEgv8FhmWf8kr8Ym/8XGik4Nfwx2+Zd4berCSbhPRtUIxAuKM3H3LV6DijYU6F1zrsCGo80iXNFCW6Z39flzfMgPIDtCBbzU2NvF7AYUx5mW7HMGEns1ceIp4bNEQh04GgBkdyRQCGO1Kho0nDj6DAHt/qBE+M/2R2Z43Ol3ta4c9N8rEog6A4fv71BdB7+ko3ZQ+E9rOxwG1p0zJe3sXcFZYgu5oxY+V0Z+1dcmN0aWUy9vGItfrlOfieBBkjxe0V1c36YWYVJWKeRr37Fsdvxhhr4UxJLbkfRmGtR8dwNHYTj4GBj0/INL12qkwgsamZLZxnmqTt5VPZ7vrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=D9QQol7j; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=D9QQol7j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2vL84xlFz2yPD
	for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2024 16:43:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1725950620;
	bh=Ar7rNuWOz1CLQeVxt4xohneB3mMSw8G6intxWP83/Pg=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=D9QQol7jQq6jhLYzc3tDJBi0SkUKQGVlNp2RxikTUJZgXfx+Kr0fqyw6Z2jB9Xa0Z
	 ihPPPUODPi6aNxCviXcLTrqmpAuYdLt07w9ii0rDqzWZvTE/vI2BjnuJ8YuMbirj0q
	 WpinqXVBreGxXby+KFg6gfmJZfr73q180AcZjGCTmO4UVeXlQu1nTjn99SVAtpjxBV
	 dPlvHUavAU7yqhGt2HP43qXwOvEzCB8h+mGvAaQMH2SPt34X+8zD7n5YKTQdnZ+gEg
	 VFSuh2h2BSJwQQlNxpc96FkiHG26X+Fh9QJsP4Wb7zTMO+qh1IXUM1U2rshK8qQ38D
	 BfHFMEdX0AWpg==
Received: from [192.168.68.112] (ppp118-210-182-249.adl-adc-lon-bras34.tpg.internode.on.net [118.210.182.249])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5C10564FDD;
	Tue, 10 Sep 2024 14:43:40 +0800 (AWST)
Message-ID: <427294e0406f87347a3d35f40b99e2f15f82c61e.camel@codeconstruct.com.au>
Subject: Re: Moving on
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org
Date: Tue, 10 Sep 2024 16:13:38 +0930
In-Reply-To: <adf4ad27-a203-4381-bf3a-0286f75e8097@hatter.bewilderbeest.net>
References: <adf4ad27-a203-4381-bf3a-0286f75e8097@hatter.bewilderbeest.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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

On Fri, 2024-08-30 at 16:09 -0700, Zev Weiss wrote:
> Hi all,
>=20
> I'm not sure if it's been all that noticeable, but I've been kind of
> quiet on the OpenBMC front lately.  A pair of not-entirely-unrelated
> points regarding that: (a) Equinix has decided to suspend development
> work on OpenBMC, and (b) I've accepted an offer elsewhere (unrelated
> to OpenBMC) and will be moving on from the company in two weeks.
>=20
> I'll thus be stepping down from the TOF (due to inactivity I'm not
> even eligible to run for the next term anyway) and relinquishing
> maintainership of the small handful of things I'm currently listed in
> OWNERS files for.

Thanks for all your involvement over the past few years, it's been fun!
(Sorry for the late reply was travelling for OSFC).

All the best for the new gig.

Andrew
