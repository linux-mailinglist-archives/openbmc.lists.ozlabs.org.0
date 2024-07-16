Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D17D931F3E
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 05:25:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=E30LGaX0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNPbZ144Fz3cVY
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 13:25:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=E30LGaX0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNPb32wkSz2xQB
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 13:25:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1721100318;
	bh=WSN63KWmV8Eo9js4SoNfDSFP6feBZGsDPo/aVLgtgWw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=E30LGaX0L/BeQRg8kUtxm3MfuW8Sg4dn09CzH+T9U+xx4kkhmGE+UVa/Xqm9PGcOw
	 E/Fm0+vDOFu03hF98CVC1LcFwyAaKVM7Os/gjE3RXVfQ4E7WmdsOKf1rsl/LYO1nNh
	 uQnI0qEqi7pT9J9wE9F/MKmXKCBO1B0bRofzwmGHFpheXQSBwvVaa5mOlXasrgIUKQ
	 ZybR31DIqSzSDVVnNKA4ZCbcqet7gkGY72PeK9wzQE9Iwzo0Y57if+jmQCidn2PKFI
	 aoEW38LTsS2eUeNCqr/bPRziqsw6IyYhQ7b5FCI3fHJiUP09fBI/H0MKUz4zg787+Y
	 puwSY/ytdtTrQ==
Received: from [192.168.2.243] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E551465555;
	Tue, 16 Jul 2024 11:25:18 +0800 (AWST)
Message-ID: <f17486d058ef660c65a9911d62605c250cdc0b09.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v1 0/2] spi: npcm-pspi: add full duplex and fix
 word issue
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
Date: Tue, 16 Jul 2024 11:25:18 +0800
In-Reply-To: <20240709160242.1921541-1-tmaimon77@gmail.com>
References: <20240709160242.1921541-1-tmaimon77@gmail.com>
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
Cc: Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-07-09 at 19:02 +0300, Tomer Maimon wrote:
> This patch set:
> 	1. Add full duplex support - this patch have been upstream to dev-6.1
> 								 and removed.
> 	2. Fix transfer bits per word issue.
>=20
> Tomer Maimon (2):
>   spi: npcm-pspi: add full duplex support
>   spi: npcm-pspi: Fix transfer bits per word issue
>=20
>  drivers/spi/spi-npcm-pspi.c | 90 ++++++++++++++++---------------------
>  1 file changed, 38 insertions(+), 52 deletions(-)
>=20

What's the state of this series with respect to upstream? Is this
something specific to the openbmc/linux dev-6.6 tree, or is there an
upstream equivalent? If the latter, can you please link to the relevant
series?

Andrew
