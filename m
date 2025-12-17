Return-Path: <openbmc+bounces-1040-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A514CC5AF8
	for <lists+openbmc@lfdr.de>; Wed, 17 Dec 2025 02:21:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWGGX6ZYpz2yGQ;
	Wed, 17 Dec 2025 12:21:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765934484;
	cv=none; b=b9zXy80odzyTRCemsVXXsNcLU9oLwFFB4XBqm1eTjUw/X6Mqgw9/A7M6tjSNHfLF+5gNfc9skBL6qJx66vmj5gIhq00dtyophy/19u1msV8mar/+lhFMvA8kKDgl27imdwvkMGVpPxs1X08oHO1n0iVsPaZW/BrsVHb9TAKbwq3rB/oGP9eYWNHvID0GBMFr71mkC2VJAqvwq+62DDukEwUZgJkxpRxvvTsOOLgXepcbWNXLn7h5XkXFk2kFmkQmB/d4W1zFPwrFzaomQ3eflScWnPbgT+NpP4CB04CvKm/QPytH0zGXq/WL5f6zhHTd5uRumQ+T8BRSPDhBlBZEWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765934484; c=relaxed/relaxed;
	bh=UntsnSvfS6vvlKRq+G9cUj/3hwAVKW0hMYVCAfG5wsU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VgZM7cYgHdd87a9QGudNKKFdq52ri/RYXXHf38UAs3/Cz4YDaWtK2aHoCgsNqB4akvu1chKEUduyalqt1Jsggsh8cFeA02OiLGBKRzroA/OyDkBzNasUrcMxbo1gOgcUpgHw5mP/co5FMStDOGc5T2SI1yoUrsQZUXsQX2kmMPSuWidk4LCiTw4OabHFXXXOLvZbGeOpaCZ9H5uCXAHTSdGjy53RBNIuGvWJfARbm81A2PjSTj3bFFWaFLm2Y0WAyfOuGUoc6Kg5CBbExUegUZptnrRtjpy090+yYyQONNKGdXwjhn6FSa/YbDov93GgWYuqd5GWcKSS75f8TlwOfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NvR/Zf/H; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=NvR/Zf/H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWGGX38R7z2yG0
	for <openbmc@lists.ozlabs.org>; Wed, 17 Dec 2025 12:21:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765934483;
	bh=UntsnSvfS6vvlKRq+G9cUj/3hwAVKW0hMYVCAfG5wsU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NvR/Zf/HnySY5A5yYVqqbmSZU4orM9XKh3hEn9EZsG4g/nWHtKZoo36eRYaT2DVEX
	 18RsDObvyYyKnIPuCQalausMxGnXHMOHBXN+gEhLpFnuPmALduAP/jjugEtmjxv8ec
	 dVk4IQD+orvLvQb+vCLmgD8d4lGIYEHGT0tyIVEshFIXM7xoimZKh87gXj1FuLK56y
	 sykvIn/Bh4zUiruq9DPY0Hj4FznzEjMOICzY1zPIZvD1Kj26+g2AyhLsFX6tiSHVTT
	 jnZ1YNkYmGkmQ8QlPpBNtYH0/HzOINkbzRqHM2ZOTNoMeWsjlszR3bpwaHMpUj66Le
	 gRZFDsT29cZAg==
Received: from [192.168.68.115] (unknown [180.150.112.216])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B82357C127;
	Wed, 17 Dec 2025 09:21:23 +0800 (AWST)
Message-ID: <99968f334d03e901a6fe29b97369a75d05d881ba.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot v2 1/2] drivers: spi: Add support for disabling
 FMC_WDT2 for aspeed
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>
Cc: joel@jms.id.au, openbmc@lists.ozlabs.org, eajames@linux.ibm.com
Date: Wed, 17 Dec 2025 11:51:23 +1030
In-Reply-To: <f69874a680db4abdf0bc3af59ea7f559db925dca.camel@codeconstruct.com.au>
References: <20251202-msx4-v2-0-a605d448bd02@nvidia.com>
		 <20251202-msx4-v2-1-a605d448bd02@nvidia.com>
		 <cc4141d2b1636c99c8f25b378f34ca214289a51a.camel@codeconstruct.com.au>
		 <aUIEFWIUWoMlbEMC@molberding.nvidia.com>
	 <f69874a680db4abdf0bc3af59ea7f559db925dca.camel@codeconstruct.com.au>
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

On Wed, 2025-12-17 at 11:48 +1030, Andrew Jeffery wrote:
> On Tue, 2025-12-16 at 17:15 -0800, Marc Olberding wrote:
> > On Wed, Dec 17, 2025 at 09:53:33AM +1030, Andrew Jeffery wrote:
> > > On Tue, 2025-12-02 at 15:52 -0800, Marc Olberding wrote:
> > > > Adds support for disabling the ast2600 FMC_WDT2 through
> > > > a device tree entry in the fmc node.
> > > > Set `aspeed,watchdog-disable` in your device tree to have
> > > > the driver disable it.
> > > >=20
> > > > Signed-off-by: Marc Olberding <molberding@nvidia.com>
> > > > ---
> > > > =C2=A0drivers/spi/aspeed_spi.c | 19 +++++++++++++++----
> > > > =C2=A01 file changed, 15 insertions(+), 4 deletions(-)
> > > >=20
> > > > diff --git a/drivers/spi/aspeed_spi.c
> > > > b/drivers/spi/aspeed_spi.c
> > > > index
> > > > 54520122f1c48c8b2052b4b1e47445a9b990d25e..de954e477aa15e6d1be04
> > > > 2a2aee47f5a501178da 100644
> > > > --- a/drivers/spi/aspeed_spi.c
> > > > +++ b/drivers/spi/aspeed_spi.c
> > > > @@ -30,14 +30,16 @@ struct aspeed_spi_regs {
> > > > =C2=A0					/* 0x30 .. 0x38
> > > > Segment Address */
> > > > =C2=A0	u32 _reserved1[5];		/* .. */
> > > > =C2=A0	u32 soft_rst_cmd_ctrl;	/* 0x50 Auto Soft-Reset
> > > > Command Control */
> > > > -	u32 _reserved2[11];		/* .. */
> > > > +	u32 _reserved2[4];		/* .. */
> > > > +	u32 wdt2_ctrl;			/* 0x64 FMC_WDT2
> > > > control */
> > > > +	u32 _reserved3[6];		/* .. */
> > >=20
> > > Ugh (passing commentary, not your fault).
> > >=20
> > Yeah this sucks, if you have a better idea, let me know.
> >=20
> > > > =C2=A0	/*
> > > > =C2=A0	 * Set safe default settings for each device. These
> > > > will be
> > > > =C2=A0	 * tuned after the SPI flash devices are probed.
> > > > @@ -1907,6 +1914,10 @@ static int aspeed_spi_probe(struct
> > > > udevice *bus)
> > > > =C2=A0	 * SPI controllers
> > > > =C2=A0	 */
> > > > =C2=A0	priv->is_fmc =3D dev_get_driver_data(bus);
> > > > +	if (device_is_compatible(bus, "aspeed,ast2600-fmc") &&
> > > > +	=C2=A0=C2=A0=C2=A0 dev_read_bool(bus, "aspeed,watchdog-disable"))
> > > > +		priv->disable_wdt =3D true;
> > >=20
> > > We're not setting it to false, just declaring it above, which
> > > means if
> > > this branch isn't taken then its value is undefined.
> > >=20
> > > Perhaps initialise it to false by default.
> >=20
> > Ah, I figured that priv would've been callocd by the driver
> > framework
> > before being passed to probe.
> > I'll change this to=20
> > priv->disable_wdt =3D <boolean expression>
> >=20
> > in the next rev. Thanks.
>=20
> Oh, wait, the stack variable is just redundant? My eyes glazed over
> that.

Nope, ignore that too, I misinterpreted the diff.

Ugh, sorry for the noise.

