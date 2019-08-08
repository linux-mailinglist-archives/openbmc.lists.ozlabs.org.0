Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF9B86932
	for <lists+openbmc@lfdr.de>; Thu,  8 Aug 2019 20:56:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464HfC5wWGzDqJt
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 04:56:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=sirena.co.uk
 (client-ip=2a01:7e01::f03c:91ff:fed4:a3b6; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.co.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="vqt03qIK"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464Hd50HJFzDqpq
 for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2019 04:55:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QjkoBON2R0G9dPWiD46toYdQm9FG0fge33xVSCag5ms=; b=vqt03qIKNSYXmWRwtn6SMC0vn
 2KxAD407l3Awcyh2IzdII6GyPqRZFsRiCPW6czfrc9RB9mRifazXgV+8/2TNZ76/UaOA0+A2UJDmJ
 IyNQtmNyWKwRuBMlsGkSPrg8Pj0jKAk8CeSe2LXRN+1EW53APKC59dZ9Blp6kqbrQuQNw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvnZL-0003lN-Gm; Thu, 08 Aug 2019 18:55:23 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 5CB972742B42; Thu,  8 Aug 2019 19:55:22 +0100 (BST)
Date: Thu, 8 Aug 2019 19:55:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 2/2] spi: npcm-fiu: add NPCM FIU controller driver
Message-ID: <20190808185522.GJ3795@sirena.co.uk>
References: <20190808131448.349161-1-tmaimon77@gmail.com>
 <20190808131448.349161-3-tmaimon77@gmail.com>
 <20190808132740.GG3795@sirena.co.uk>
 <CAP6Zq1j7jHejdx9h-nxCJcVjtGx_3rHmay7R8nn11DLaE8Q4gA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5me2qT3T17SWzdxI"
Content-Disposition: inline
In-Reply-To: <CAP6Zq1j7jHejdx9h-nxCJcVjtGx_3rHmay7R8nn11DLaE8Q4gA@mail.gmail.com>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 bbrezillon@kernel.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-spi@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--5me2qT3T17SWzdxI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 08, 2019 at 06:37:06PM +0300, Tomer Maimon wrote:

> for example in our driver we modify the access type (singe, dual or quad)
> according the op->addr.buswidth
> for example in the npcm_fiu_set_drd function.

>         regmap_update_bits(fiu->regmap, NPCM_FIU_DRD_CFG,
>                            NPCM_FIU_DRD_CFG_ACCTYPE,
>                            ilog2(op->addr.buswidth) <<
>                            NPCM_FIU_DRD_ACCTYPE_SHIFT);

> we also modify it in the UMA R/W functions.

Ah, it's only for the flash functions - that's fine.

--5me2qT3T17SWzdxI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1McBkACgkQJNaLcl1U
h9CSyQf9HMQyWI7F+/mz/TefzbACHnpE0c8lwToPC8gs3NlHo8g0orLblfG3DsLm
UEB893DEnNq2PyAZ3RalNBeet13paLEA0qBru8OSMUWpeNwDNxNPJnw0LKgWMfJd
hR7ajSCzI8nNleQRxNko7depUDzpemRXDWxmIyeoBPOYzHxX3AWFoyuaz9aUo2Rl
Unh0Hf1osxqIy1e/McvePEnPv0TT99Ymj8k6/8GnvioyP4EpahOXI8dSR2jI0EhD
E00zLhgmAoNpkwrV/jtjy/U4bWl2oEXrySbQ9Ljy8b0iFVArSIEFILHO06iXOkXP
gKzJeeqWsQ6fz//+fGxegx1F6fcTpg==
=AZer
-----END PGP SIGNATURE-----

--5me2qT3T17SWzdxI--
