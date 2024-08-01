Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7D1944F41
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 17:30:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SkJwmeHj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZXws3Dx6z3dTm
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2024 01:30:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SkJwmeHj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZXvV053vz3dSG;
	Fri,  2 Aug 2024 01:29:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 37E7F628F5;
	Thu,  1 Aug 2024 15:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B5CC4AF0B;
	Thu,  1 Aug 2024 15:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722526180;
	bh=Nyd4g5rhTQbe44jgfTOL5a3YHQWfVlAEm0eqKH+VvZ0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=SkJwmeHjFADZd6O4hfrUM5ED6u0ENUlkgkDi3LGm988eJgr6P5a4v/oJhAlmfv+5G
	 C9I/3FPONFytE5XBLEo/FjEhxDR+vegIpVbQB+2SPPSvWGwj4tYlazHgPFIAOKZrPz
	 9y/Il9xf1yzIDVvZeyabQrDeqRWzNG9KapfvbRd5zo3iB827zQL+L0W//BQTPsIOy/
	 Gb7aHNQu78slFxgiAzEpgJp8BgaepD9cboxhP8ioEdmBZjdud7wcZQqB0D9/uP+vSi
	 EiB3Tcn4H5WQALCO+4u/riraf7o04zTVQ12xlDNrDfDTiyU+Fig+lRySFgV1b2e+Zu
	 9tXdndj4g+Wwg==
Date: Thu, 01 Aug 2024 09:29:38 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chanh Nguyen <chanh@os.amperecomputing.com>
In-Reply-To: <20240801091217.1408809-1-chanh@os.amperecomputing.com>
References: <20240801091217.1408809-1-chanh@os.amperecomputing.com>
Message-Id: <172252600912.120761.16384387883905749466.robh@kernel.org>
Subject: Re: [PATCH 0/6] Update the device tree for Ampere's BMC platform
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On Thu, 01 Aug 2024 09:12:10 +0000, Chanh Nguyen wrote:
> Updates the device tree to support some features on Ampere's
> Mt.Mitchell BMC and Ampere's Mt.Jade BMC.
> 
> Chanh Nguyen (6):
>   ARM: dts: aspeed: mtjade, mtmitchell: Add OCP temperature sensors
>   ARM: dts: aspeed: mtmitchell: Add I2C temperature sensor alias ports
>   ARM: dts: aspeed: mtmitchell: Add I2C Riser card alias ports
>   ARM: dts: aspeed: mtmitchell: Enable i2c10 and i2c15
>   ARM: dts: aspeed: mtmitchell: Add LEDs
>   ARM: dts: aspeed: mtmitchell: Add I2C FAN controllers
> 
>  .../dts/aspeed/aspeed-bmc-ampere-mtjade.dts   |  16 ++
>  .../aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 152 ++++++++++++++++++
>  2 files changed, 168 insertions(+)
> 
> --
> 2.43.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ampere-mtjade.dtb aspeed/aspeed-bmc-ampere-mtmitchell.dtb' for 20240801091217.1408809-1-chanh@os.amperecomputing.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@1e78a000/i2c@480/fan-controller0@20: failed to match any schema with compatible: ['maxim,max31790']
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: /ahb/apb/bus@1e78a000/i2c@480/fan-controller1@2f: failed to match any schema with compatible: ['maxim,max31790']





