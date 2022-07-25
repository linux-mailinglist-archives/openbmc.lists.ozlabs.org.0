Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F8857FED3
	for <lists+openbmc@lfdr.de>; Mon, 25 Jul 2022 14:15:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrzXC4TVSz2xn1
	for <lists+openbmc@lfdr.de>; Mon, 25 Jul 2022 22:15:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QHMLAVVL;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QHMLAVVL;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrzWm5cddz2xn1
	for <openbmc@lists.ozlabs.org>; Mon, 25 Jul 2022 22:15:16 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F2AB960FE3;
	Mon, 25 Jul 2022 12:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C897C341C6;
	Mon, 25 Jul 2022 12:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658751313;
	bh=ND6sJqpmi/ZIFCyzo6WuKYHiyg2EE+4CRPxEUCsFK3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QHMLAVVLDYRp1oaAJv87qeUzZKi963pn9yJ4TdIiLgyUPXJ7maR0JSYzRCsz5bCA3
	 SIOtEFw/sCupJThINvfy+WST8Uc1ViiP37DrbnMBvOsIJzzNH+7JxvsQFPN211iR8J
	 n0x8H0/5Z9Eig7SjFQbnQC2V5g5zH/+gLClyJbX55c5TpDu3i5p3hgRpMYEewn8fwh
	 bnorhXsU/j3PhW04nzy082yFIt1nxIvdpEcwFhufodneJKMRQ8bOkgTSTh1P7yLu3V
	 CtlftF9xzaq+9tGqYAfV+xMCVhlzeFAGmMY6uti4aCaHRtYlCH5RH+3wbf9LvT1INZ
	 ZzrGzsumXOl4A==
Date: Mon, 25 Jul 2022 13:15:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 1/2] spi: npcm-pspi: add full duplex support
Message-ID: <Yt6JSm3vrkdkvSpo@sirena.org.uk>
References: <20220721101556.118568-1-tmaimon77@gmail.com>
 <20220721101556.118568-2-tmaimon77@gmail.com>
 <YtlYt/5VKIblUHBP@sirena.org.uk>
 <CAP6Zq1hu4GtFrLa5O_7gyszXwpfijJF=XU0hdw8FBbvj3Bk8Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xAtPP1KaYCL3Kz0X"
Content-Disposition: inline
In-Reply-To: <CAP6Zq1hu4GtFrLa5O_7gyszXwpfijJF=XU0hdw8FBbvj3Bk8Hg@mail.gmail.com>
X-Cookie: Replace with same type.
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
Cc: devicetree <devicetree@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--xAtPP1KaYCL3Kz0X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 24, 2022 at 12:35:37PM +0300, Tomer Maimon wrote:
> On Thu, 21 Jul 2022 at 16:46, Mark Brown <broonie@kernel.org> wrote:
> > On Thu, Jul 21, 2022 at 01:15:55PM +0300, Tomer Maimon wrote:

> > > This patch adds full duplex support for NPCM PSPI driver by storing all
> > > rx-data when the Rx-buffer is defined also for TX-buffer handling.

> > This doesn't seem to entirely correspond to what the patch does, nor to
> > what the driver currently does?  I can't see any dummy read code in the
> > current driver.

> In the current handler file, in the handler function.
> static irqreturn_t npcm_pspi_handler(int irq, void *dev_id)

> -       if (priv->tx_buf) {
> -               if (stat & NPCM_PSPI_STAT_RBF) {
> -                       ioread8(NPCM_PSPI_DATA + priv->base);

> the read above doing a dummy read

That's reading a single byte, not an entire buffer, and from a quick
glance looks more like an ack.  Though perhaps you just end up with a
lot of interrupts and do that anyway.

--xAtPP1KaYCL3Kz0X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLeiUkACgkQJNaLcl1U
h9BdCQf/QdlNiAcmCougz2zZbczwVhrOeD9z3yH0yaWm4vI2eCWPVZ8A8YdC/oYC
hyo8qoU5Aa4cSorcJ0cTQf+P5mbi18i67ZMCTkSIhMGMpo1ozHNMX5RvD7ykhUNQ
hMZUpNohI+yjLHhGaGzZhROgKbmuvwnacC7fBUmcOKDnwpoy7z346AgP0usZkt8w
6tz5ffXZvBfOTBZ9iOXo7xtv+YvMekDS0DEyZCo1O92gcWlJgV/xanBOTBR+ba2E
tDeIxu1gForYMOKwGHeHKpFG8uIy/qeNRx2gOV9YW5yV9iFtax+zdJBcjrPmFGKI
wsXb4i/iIfSCpPAftoTR8IjOjzUGng==
=GWj5
-----END PGP SIGNATURE-----

--xAtPP1KaYCL3Kz0X--
