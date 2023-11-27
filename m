Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 020417F97F4
	for <lists+openbmc@lfdr.de>; Mon, 27 Nov 2023 04:32:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QeUDGbRT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sdrjx6LJpz3cSv
	for <lists+openbmc@lfdr.de>; Mon, 27 Nov 2023 14:32:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=QeUDGbRT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 505 seconds by postgrey-1.37 at boromir; Mon, 27 Nov 2023 14:31:37 AEDT
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SdrjP68NTz3cR1
	for <openbmc@lists.ozlabs.org>; Mon, 27 Nov 2023 14:31:37 +1100 (AEDT)
Received: from [192.168.68.112] (203-57-215-234.dyn.iinet.net.au [203.57.215.234])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3F42420034;
	Mon, 27 Nov 2023 11:23:03 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1701055389;
	bh=9Y12ePRBana+i/gp2nHJOJIJGp9W0wzK4lhnfvk1osk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QeUDGbRTji2Gnka1aFgPpDEsTHMgv+RMDklc/gnUyAB9B7iQSECEO8gXh86pHjY4J
	 AfiJiL2NOQkhNadiNRGUDddM8KE4ZMHbL5T/UhCHVkvAh8+YDD2FgxqwTIQ754eC6u
	 md8lNPOvD9ESdCnjghP2r1fbRSmqbVM+IiAkMIzdH1dsCXQ0mUO3orgANJn/J56mwY
	 EnPI9fxcJjtdnZ9Z+PfCln+Pn1UKoliuUfc3H3rr/B+OPdbm4FWoeIAF5T+L0XkQE/
	 pIuv2PdAR/RhHi2T9BwY8veXjgnk0XdCnUYT5yDw6sOztKfah6j3Epl43+XlYIuP8b
	 /inBS/5tzDIcQ==
Message-ID: <fdd884426497486c6b17795b4edc66243bdc7350.camel@codeconstruct.com.au>
Subject: Re: [PATCH] i2c: aspeed: Acknowledge Tx ack late when in
 SLAVE_READ_PROCESSED
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cosmo Chou <chou.cosmo@gmail.com>, brendan.higgins@linux.dev, 
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org, 
	linux@roeck-us.net, wsa@kernel.org, jae.hyun.yoo@linux.intel.com
Date: Mon, 27 Nov 2023 13:53:02 +1030
In-Reply-To: <20231120091746.2866232-1-chou.cosmo@gmail.com>
References: <20231120091746.2866232-1-chou.cosmo@gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, cosmo.chou@quantatw.com, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2023-11-20 at 17:17 +0800, Cosmo Chou wrote:
> commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early
> in interrupt handler") moved most interrupt acknowledgments to the
> start of the interrupt handler to avoid race conditions. However,
> slave Tx ack status shouldn't be cleared before SLAVE_READ_PROCESSED
> is handled.
>=20
> Acknowledge Tx ack status after handling SLAVE_READ_PROCESSED to fix
> the problem that the next byte is not sent correctly.

What does this mean in practice? Can you provide more details? It
sounds like you've seen concrete problems and it would be nice to
capture what it was that occurred.

Andrew
