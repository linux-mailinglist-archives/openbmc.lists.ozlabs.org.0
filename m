Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE618FBC8B
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2024 21:29:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OnRHsQUR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv0yp5c1dz3cc0
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 05:29:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OnRHsQUR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv0xp5KRfz3d28;
	Wed,  5 Jun 2024 05:28:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8757F6129B;
	Tue,  4 Jun 2024 19:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0A6BC2BBFC;
	Tue,  4 Jun 2024 19:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717529309;
	bh=yHhhDzlKF7G9fNEWVYCNK4S9k0Vpn9UqS34WAkP/yZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OnRHsQURR862djue5zJjpjLjcKh9JCBLSihkDF3AkUsroMfcaMVj7x/t92zNGR/Or
	 EXQ9GpsVdJ0WqUWYUcAu/nbjc2hLd/LF9GE9c2HAOTjCyzFdZbN7Ue8PauJyMXkjVj
	 DacvAsT1AWIVZvD+OAprGqKIfUIl67a3URummRJRlThTg0EUW2gOFnZ7S9fpwB6Hyu
	 pqjD5L2ZSjjpPSiQIbGZI8rU3A1UxE+HjjokMcmmt8ifMq/dcb0l5rw10EYvRvUJDF
	 oPcbnkH3jUpUTkwyp5nf92bLd0G4lWiDEbxuJhi24buBFjzx6lo9n1TB6K7s12H+Wo
	 dJR2pqGFTpUfA==
Date: Tue, 4 Jun 2024 14:28:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: aspeed,ast2500-pinctrl:
 Describe SGPM
Message-ID: <171752930363.1149680.127041721707495986.robh@kernel.org>
References: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-0-a6fe2281a1b8@codeconstruct.com.au>
 <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-2-a6fe2281a1b8@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240531-dt-warnings-gpio-ast2600-pinctrl-funcs-groups-v1-2-a6fe2281a1b8@codeconstruct.com.au>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Fri, 31 May 2024 12:32:48 +0930, Andrew Jeffery wrote:
> Squash warnings such as:
>=20
>     arch/arm/boot/dts/aspeed/aspeed-ast2500-evb.dtb: pinctrl@80: sgpm_def=
ault:groups:0: 'SGPM' is not one of ['ACPI', 'ADC0', 'ADC1', 'ADC10', 'ADC1=
1', 'ADC12', 'ADC13', 'ADC14', 'ADC15', 'ADC2', 'ADC3', 'ADC4', 'ADC5', 'AD=
C6', 'ADC7', 'ADC8', 'ADC9', 'BMCINT', 'DDCCLK', 'DDCDAT', 'ESPI', 'FWSPICS=
1', 'FWSPICS2', 'GPID0', 'GPID2', 'GPID4', 'GPID6', 'GPIE0', 'GPIE2', 'GPIE=
4', 'GPIE6', 'I2C10', 'I2C11', 'I2C12', 'I2C13', 'I2C14', 'I2C3', 'I2C4', '=
I2C5', 'I2C6', 'I2C7', 'I2C8', 'I2C9', 'LAD0', 'LAD1', 'LAD2', 'LAD3', 'LCL=
K', 'LFRAME', 'LPCHC', 'LPCPD', 'LPCPLUS', 'LPCPME', 'LPCRST', 'LPCSMI', 'L=
SIRQ', 'MAC1LINK', 'MAC2LINK', 'MDIO1', 'MDIO2', 'NCTS1', 'NCTS2', 'NCTS3',=
 'NCTS4', 'NDCD1', 'NDCD2', 'NDCD3', 'NDCD4', 'NDSR1', 'NDSR2', 'NDSR3', 'N=
DSR4', 'NDTR1', 'NDTR2', 'NDTR3', 'NDTR4', 'NRI1', 'NRI2', 'NRI3', 'NRI4', =
'NRTS1', 'NRTS2', 'NRTS3', 'NRTS4', 'OSCCLK', 'PEWAKE', 'PNOR', 'PWM0', 'PW=
M1', 'PWM2', 'PWM3', 'PWM4', 'PWM5', 'PWM6', 'PWM7', 'RGMII1', 'RGMII2', 'R=
MII1', 'RMII2', 'RXD1', '
>  RXD2', 'RXD3', 'RXD4', 'SALT1', 'SALT10', 'SALT11', 'SALT12', 'SALT13', =
'SALT14', 'SALT2', 'SALT3', 'SALT4', 'SALT5', 'SALT6', 'SALT7', 'SALT8', 'S=
ALT9', 'SCL1', 'SCL2', 'SD1', 'SD2', 'SDA1', 'SDA2', 'SGPS1', 'SGPS2', 'SIO=
ONCTRL', 'SIOPBI', 'SIOPBO', 'SIOPWREQ', 'SIOPWRGD', 'SIOS3', 'SIOS5', 'SIO=
SCI', 'SPI1', 'SPI1CS1', 'SPI1DEBUG', 'SPI1PASSTHRU', 'SPI2CK', 'SPI2CS0', =
'SPI2CS1', 'SPI2MISO', 'SPI2MOSI', 'TIMER3', 'TIMER4', 'TIMER5', 'TIMER6', =
'TIMER7', 'TIMER8', 'TXD1', 'TXD2', 'TXD3', 'TXD4', 'UART6', 'USB11BHID', '=
USB2AD', 'USB2AH', 'USB2BD', 'USB2BH', 'USBCKI', 'VGABIOSROM', 'VGAHS', 'VG=
AVS', 'VPI24', 'VPO', 'WDTRST1', 'WDTRST2']
>=20
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml | =
1 +
>  1 file changed, 1 insertion(+)
>=20

Acked-by: Rob Herring (Arm) <robh@kernel.org>

