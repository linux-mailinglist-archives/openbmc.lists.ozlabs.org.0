Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 032ED931F3C
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 05:24:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=FONxyg0K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNPZP6VFNz3cbX
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 13:24:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=FONxyg0K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNPYv3N5Cz2xQB
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 13:24:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1721100258;
	bh=S1xKNYIzvhT9TGUFuW8/16POTS0Kp+HnBpRhBfcMyy8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FONxyg0KNM/GjnaZnpd/e5oNWScJWK2SnrAweCcVAbH3Ch3SGJfH9Qi/f+ACZLDgY
	 Oies6/5ZrxJ93A2K/L6bAN87z1Z45EN3Usbd37qbJXJbEuq0gOkxlIN7blk33zV2vw
	 NOP+zqLjFgr2kMtVbtmFHpiXEc2G7uWO9S17l5ovA64igIEHnpgVXFxcTzFdGS06yX
	 Rjru0OPbaTLqhE16QRN7f6bMscXWxFaMG7gowUIVGSm8UXAYr4t6YopHeWHGKBhMGg
	 DPm7gTJRW8x18xPbt+AuwuV+KvwqeE8+ZeN+Ys0e2w+aKAxrMWtYrllquO3l4IkFgw
	 foZ1SW2AFt5Sw==
Received: from [192.168.2.243] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3344965555;
	Tue, 16 Jul 2024 11:24:18 +0800 (AWST)
Message-ID: <eb1002c1ab0214dcc91526462e4f3694ab465561.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v1] spi: npcm-fiu: add dual and quad write
 support
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
Date: Tue, 16 Jul 2024 11:24:18 +0800
In-Reply-To: <20240709184813.1946724-1-tmaimon77@gmail.com>
References: <20240709184813.1946724-1-tmaimon77@gmail.com>
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
Cc: Stanley Chu <yschu@nuvoton.com>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-07-09 at 21:48 +0300, Tomer Maimon wrote:
> Add dual and quad write support by writing the command write in the UMA
> register first and then write the data in chunks of 16 bytes.
>=20
> Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  drivers/spi/spi-npcm-fiu.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

What's the state of this patch with respect to upstream? Is this
something specific to the openbmc/linux dev-6.6 tree, or is there an
upstream equivalent? If the latter, can you please link to the relevant
patch?

Andrew
