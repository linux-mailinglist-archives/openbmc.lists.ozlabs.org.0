Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2943943F53
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 03:38:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=TYIq+6H2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZBS64l2zz3c8x
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 11:38:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=TYIq+6H2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZBRb4Shbz2ydQ
	for <openbmc@lists.ozlabs.org>; Thu,  1 Aug 2024 11:37:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722476267;
	bh=h6YKSu0NazeWuDPaMYysZ6HJe0OvSm+3TFCSJEBZiu0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TYIq+6H2v0RBzwTXZhcO7qLvYUgVpghet3sppiN+sAq6si8rW1MhQMxwls4EDyVdh
	 nX2klx5SRP6CMt5QYg4A+WEL4l7gTDSSAdewarkEw1EjXdZjDnTB9Au9vbPtao0/zk
	 5tamWBU1N2mUoVkVtx7z0sq3Sp17rjhY4WiT+lxgkbdzIrzbkrdtEPqGf43T/GhYhi
	 SMFMdjztepiNtY5y/iBP1D4Wtl4YPUsiAN/2m+ORhm0GUbMrh1/zfpENtjyub5xNNP
	 evH8XUa5sUJz6LPWrSfQe1kP/O7sBB5NBKylZYr/MwmmB6M30YZJ4YCL0oGZOn7e4U
	 Me8CVEP4iranA==
Received: from [192.168.68.112] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B5B9064B84;
	Thu,  1 Aug 2024 09:37:46 +0800 (AWST)
Message-ID: <fcdb4d899effa877e1acc0576194425484d5208a.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 1/1] ARM: dts: aspeed: system1: IBM System1 BMC update
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>
Date: Thu, 01 Aug 2024 11:07:46 +0930
In-Reply-To: <20240731214737.986010-2-ninad@linux.ibm.com>
References: <20240731214737.986010-1-ninad@linux.ibm.com>
	 <20240731214737.986010-2-ninad@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, eajames@linux.ibm.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2024-07-31 at 16:47 -0500, Ninad Palsule wrote:
> Updated MAX31785a pmbus based fans in the device tree.
>=20
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>  .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/a=
rm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> index f3efecc7eb8d0..f96b299d743ba 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
> @@ -764,17 +764,113 @@ regulator@43 {
>  	};
>  };
> =20
> +

This whitespace change seems unnecessary.

>  &i2c6 {
>  	status =3D "okay";
> =20
>  	fan-controller@52 {
>  		compatible =3D "maxim,max31785a";
>  		reg =3D <0x52>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		fan0: fan@0 {
> +			compatible =3D "pmbus-fan";
> +			reg =3D <0>;
> +			tach-pulses =3D <2>;
> +			maxim,fan-rotor-input =3D "tach";
> +			maxim,fan-pwm-freq =3D <25000>;
> +			maxim,fan-dual-tach;
> +			maxim,fan-no-watchdog;
> +			maxim,fan-no-fault-ramp;
> +			maxim,fan-ramp =3D <2>;
> +			maxim,fan-fault-pin-mon;

Note that none of these maxim-specific properties are documented in the
upstream bindings. You will need to get that addressed either before or
in the same series as this DTS patch when you send it upstream.

Can you please fix up the whitespace and re-send this to the OpenBMC
list, with the appropriate subject prefix, and _without_ including the
upstream maintainers and lists (but still including Joel and myself)?

Please reach out if there's anything that needs clarification before
you do so.

Andrew
