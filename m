Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 492F5857262
	for <lists+openbmc@lfdr.de>; Fri, 16 Feb 2024 01:18:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=FJ0tJps7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbXb06n1Dz3vY2
	for <lists+openbmc@lfdr.de>; Fri, 16 Feb 2024 11:18:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=FJ0tJps7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbXZM0NDsz3btP;
	Fri, 16 Feb 2024 11:17:46 +1100 (AEDT)
Received: from [192.168.68.112] (ppp14-2-94-146.adl-apt-pir-bras31.tpg.internode.on.net [14.2.94.146])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6723A2009E;
	Fri, 16 Feb 2024 08:17:40 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1708042663;
	bh=M/FMdOoy6aMi24ewH9zofBlYD2XprYoCM/TIf5gAcDs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FJ0tJps7wyvVhd0rHdmK6uxliQ0CUy4f9kT74A8di+dS9mdD0ArR8eYYFpEQmCdth
	 fafxPWzJFeAX/6bnRGiN7g8WhLvPSruR56WBGzKAA1mJhCK3Qr70xQIXtPlWx08qs8
	 UfLu0Ey5I80K8CIiXnlWyHht6/FN9vRA0sVNHQqmoNGS/1o/VE2LAI3Njne8HfMAVP
	 3M2tRNYOkcLJDIC+ILqoZMvIRemcqlIR3T383SSpcE9MiekObZzIt9h5LhyF9vTArh
	 VqQkIMggtgHSesl1AbNYK4sF3n6UCSAxyAhjuV9yi8NpYuIoM5mkRwqmnUfLZNIkVj
	 TYXYTlStNVtzw==
Message-ID: <ae876e697ba16ba2925ec217c6b4e3d8ffea4ab3.camel@codeconstruct.com.au>
Subject: Re: [PATCH] mmc: host: replace 1st argument to struct device * for
 mmc_of_parse_clk_phase()
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: forbidden405@outlook.com, Ulf Hansson <ulf.hansson@linaro.org>, Adrian
	Hunter <adrian.hunter@intel.com>, Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Feb 2024 10:47:36 +1030
In-Reply-To: <20240215-mmc_phase-v1-1-f27644ee13e4@outlook.com>
References: <20240215-mmc_phase-v1-1-f27644ee13e4@outlook.com>
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
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-02-15 at 19:03 +0800, Yang Xiwen via B4 Relay wrote:
> From: Yang Xiwen <forbidden405@outlook.com>
>=20
> Parsing dt usaully happens very early, sometimes even bofore struct
> mmc_host is allocated (e.g. dw_mci_probe() and dw_mci_parse_dt() in
> dw_mmc.c). Looking at the source of mmc_of_parse_clk_phase(), it's
> actually not mandatory to have a initialized mmc_host first, instead we
> can pass struct device * to it directly.
>=20
> Also fix the only current user (sdhci-of-aspeed.c).
>=20
> Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
> ---
>  drivers/mmc/core/host.c            | 4 +---
>  drivers/mmc/host/sdhci-of-aspeed.c | 2 +-

So I think I wrote the mmc_of_parse_clk_phase() prototype with `struct
mmc_host *` simply because mmc_of_parse() took `struct mmc_host *`.

I'll defer to Ulf for whether what you're proposing is desirable, but
in terms of the impact on the Aspeed driver it seems okay.

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>
