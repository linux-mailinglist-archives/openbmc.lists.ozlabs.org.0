Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFB197B67B
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2024 02:39:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7ftR3rlzz3by2
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2024 10:39:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726619980;
	cv=none; b=P6ujzzVBJFgRR9QuYzCXRKbftnsz2lyRlm3FT0RhM4vlvn+RB06wBTMgTLFOSh8vTLyKTRKL/TqIE0Dvl4nvM0Xp1cAKttKAO3UsVUNmj6j9sly2gmT0IvQt88ykzNraDHYjDSN65tTkzQHUbAY0EQEKw8qVGyc5FX6rDju3PVXDFvLE6zu7r5v/d7bpDbEkgX/EX19lcnPhyz7DgKz6GUudxkIdVxP08iHNdOn5tXgxsTW0bnTSdIPbbGxGSNK+7kXF95u5iUPPK05vK3F1FK9IagK2kmgOaaFfNtDb7kag64n///Xu1/FVUZVC8wQNelwevOvtRgcbqXHcHG03dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726619980; c=relaxed/relaxed;
	bh=bB9wz1pn4unz4DteEJ1OCScHoZj6nzWMZM6+pB5xUkc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nnprA8ku3uwpon98FLNtvhva/oO/yBc7p5QLYmBQk8eTNeh1mwDeaScbbxf+OoN1Jv2Z9R6SP/5EFVk5lrmV/c49nBvAE2CVHse2IX8wAGaxeMbsuaLgMz1pR0dgkm/CIBAwYTQLh+5rZ6uq1gegd68/7GjlLsKP0X8GjajE8RwXnRH68IM/fE8l71YElmfNDMatFZMDd8X/votzwGgEUhfoSlZBnheg3WF2Qh+uwm/0EIK4TCb2p5c5XVGzm3PnTrymMFB7IAwzV9iI18uZz7mFO+SJ0v0GlVYuFX5wAoF1MEdO4O1dKX1dS0ociLiNSh3x4tLNebXQLFdVg9zczg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=kbc85T7u; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=kbc85T7u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7ftN1DH9z2xJJ
	for <openbmc@lists.ozlabs.org>; Wed, 18 Sep 2024 10:39:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726619979;
	bh=bB9wz1pn4unz4DteEJ1OCScHoZj6nzWMZM6+pB5xUkc=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=kbc85T7upzVk+/ecuGhh2XSTU7Ir0vFBOZDT1VyInDtzrK6k2Y6LC+TDr36sNfUk2
	 l0Z3WLDdtek3YlsuU7fZyZzQDPoZ2mjuzuqPBUgGCKM0K7yJZ5KKYzjsJWBFlTddPh
	 zWEXbpjru9uYUsBj2tHDBmx2Yj/RtoNn+f9VLP/Ev4HhDN7vS0BWX/P6OOir4dCgKO
	 qOm5jie9V7YkbdgUF5STWn3cZ63sanigfpKtKpOHOK/Nl5UVrbh4PKR5R0EW6vXPOm
	 TOKH/M6JFdSCgQJd94pUuOX7innRB1QzhGmzejykYYNFBF68CSE2Kc1NvgecTtRMRE
	 WatdG+IVEzW7g==
Received: from [192.168.68.112] (ppp118-210-161-36.adl-adc-lon-bras34.tpg.internode.on.net [118.210.161.36])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3309A65027;
	Wed, 18 Sep 2024 08:39:39 +0800 (AWST)
Message-ID: <8be299b4caa0e638e981f7d256206b74c534aae3.camel@codeconstruct.com.au>
Subject: Re: [PATCH] arm: dts: aspeed: Enable PECI and LPC Snoop
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: manojkiran.eda@gmail.com, Ninad Palsule <ninad@linux.ibm.com>, Joel
 Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org, Eddie James
 <eajames@linux.ibm.com>
Date: Wed, 18 Sep 2024 10:09:38 +0930
In-Reply-To: <20240917-dts-aspeed-system1-peci-snoop-v1-1-b967fb3a6735@gmail.com>
References: 	<20240917-dts-aspeed-system1-peci-snoop-v1-1-b967fb3a6735@gmail.com>
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

Hi Manoj,

Can you please mention mentions the specific platform in the subject
(IBM System1)? Otherwise the single-line log view gives the impression
that you're enabling them for all Aspeed-based platforms.

Perhaps:

   ARM: dts: aspeed: Enable PECI and LPC snoop for IBM System1

Also, can you please send this to the upstream lists? From there I'll
backport it to the openbmc tree. `b4 prep --auto-to-cc` should help.

Andrew

On Tue, 2024-09-17 at 17:27 +0530, Manojkiran Eda via B4 Relay wrote:
> From: Manojkiran Eda <manojkiran.eda@gmail.com>
>=20
> This patch enables the PECI interface and configures the LPC Snoop for
> ports 0x80 and 0x81 in the ASPEED BMC for IBM System1.
>=20
> Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
> ---
> This patch enables PECI and LPC snoop functionality on the IBM System1
> BMC in the device tree.
>=20
> The following changes have been made:
>=20
> 1. Enabled the PECI controller (peci0) by marking its status to "okay".
> 2. Enabled the LPC snoop engine, configuring snoop ports at 0x80 and
>    0x81.
>=20
> These changes are required to support PECI communication and LPC
> snooping for system monitoring and debugging purposes.
> ---
>  arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/a=
rm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> index cb3063413d1f..738a86c787c0 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> @@ -464,6 +464,15 @@ &kcs3 {
>  	aspeed,lpc-interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
>  };
> =20
> +&peci0 {
> +	status =3D "okay";
> +};
> +
> +&lpc_snoop {
> +	status =3D "okay";
> +	snoop-ports =3D <0x80>, <0x81>;
> +};
> +
>  &i2c0 {
>  	status =3D "okay";
> =20
>=20
> ---
> base-commit: ca2478a7d974f38d29d27acb42a952c7f168916e
> change-id: 20240917-dts-aspeed-system1-peci-snoop-725c70f4a485
>=20
> Best regards,

