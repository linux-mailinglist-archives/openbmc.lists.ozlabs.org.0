Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F19B5B5A73
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 14:50:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR5zD0J3gz3blV
	for <lists+openbmc@lfdr.de>; Mon, 12 Sep 2022 22:50:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jZM0/drk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jZM0/drk;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR4jH3NVXz2xJ6;
	Mon, 12 Sep 2022 21:52:51 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EFDF461199;
	Mon, 12 Sep 2022 11:52:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CA9C433C1;
	Mon, 12 Sep 2022 11:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662983566;
	bh=AvA6TgPUAVeyXLqYp+8Bg4Oa2Z6Als9d4E+bEmPak0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZM0/drk+x0laRAb59LlFYkv6q5lTomulnBKT1HsEcB43LFDNJwPfNPbDjWnHDPzi
	 RwDZABlj4xgXfi7MmWA0qn92sumOh3IAcLL0RN+7OnntmFElFj990/TZKbnj9K9Dv5
	 wfnoTx9yc33qw8zzeNakcZWiLEvV5ytVS2LNmvJfCLu8NjCuw9DWT/Nsd8vUhylkLa
	 LuZCtQtHZwlrxuN8SSMfWy62JPnha2LPZa++3+hRjac2Un6MP0v7umWZXq+73g0qDR
	 WcCGg6S+ssMSKy3GhN2mTtpp8aZBPhmEANjBKGUJynRwNRGF7VPaGEwgWSQ3OFsQjf
	 JMq/0PxULG+mw==
Date: Mon, 12 Sep 2022 12:52:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Sergiu Moga <sergiu.moga@microchip.com>
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
Message-ID: <Yx8didL1aFc4XxGa@sirena.org.uk>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tsMpd7wbAJx2xcTL"
Content-Disposition: inline
In-Reply-To: <20220911174551.653599-1-sergiu.moga@microchip.com>
X-Cookie: One FISHWICH coming up!!
X-Mailman-Approved-At: Mon, 12 Sep 2022 22:41:37 +1000
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, linux-aspeed@lists.ozlabs.org, alexandre.torgue@foss.st.com, tali.perry1@gmail.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, tmaimon77@gmail.com, benjaminfair@google.com, kdasu.kdev@gmail.com, richard@nod.at, chin-ting_kuo@aspeedtech.com, michal.simek@xilinx.com, haibo.chen@nxp.com, openbmc@lists.ozlabs.org, bcm-kernel-feedback-list@broadcom.com, joel@jms.id.au, yogeshgaur.83@gmail.com, linux-rockchip@lists.infradead.org, tudor.ambarus@microchip.com, john.garry@huawei.com, linux-mediatek@lists.infradead.org, clg@kaod.org, matthias.bgg@gmail.com, han.xu@nxp.com, linux-arm-kernel@lists.infradead.org, andrew@aj.id.au, venture@google.com, heiko@sntech.de, nicolas.ferre@microchip.com, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, avifishman70@gmail.com, michael@walle.cc, mcoquelin.stm32@gmail.com, claudiu.beznea@microchip.com, pratyush@kernel.o
 rg
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--tsMpd7wbAJx2xcTL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 11, 2022 at 08:45:53PM +0300, Sergiu Moga wrote:
> In order to properly represent the hardware functionality
> in the core, avoid reconverting the number of dummy cycles
> to the number of bytes and only work with the former.
> Instead, let the drivers that do need this conversion do
> it themselves.

Acked-by: Mark Brown <broonie@kernel.org>

If this gets applied it might be good to have a tag in case we
need it for any SPI updates.

--tsMpd7wbAJx2xcTL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMfHYUACgkQJNaLcl1U
h9BR0ggAgkV1J8/o/vgLngoRQlQriv74OFxhNN5+lL+Ue4so/rZcuKbaX7fW6yVN
5WwRPm0joSHJslzR37N/Q1ajnX5ZooQm33WIVzToQBU0liUpwIC9pn84Em0ebD1T
yRd21CVYYsPcwrRr3STSzjZpMq+CRQMfe4hvBOHirS+hQqQ9gnfpQ6NJyhkF4w6P
rUiOb9TYvfLqi8usgPC20TbdPjQxz+a3LoKzZokU2CgnnjSTUTRHf9BfCfuyOqZE
18MRkCDY7zUwO7D580ojgXe0kAAIQIxaN4QAZSG6e/hC9BziHeHJOMua0S56E4Xw
WIP/Lcq6BWueOZUfZglx7aACizALEA==
=BL9e
-----END PGP SIGNATURE-----

--tsMpd7wbAJx2xcTL--
