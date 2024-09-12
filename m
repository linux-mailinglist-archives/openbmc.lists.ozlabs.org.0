Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7FF976001
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 06:34:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X44NN2YMnz3c9w
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 14:34:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726115681;
	cv=none; b=W/INZbECCQ6KFmTg0knvw1OzaTrjgKjv3koLXkp8dg7Ojt9eKGERHCVBmJSeIu6QZW7Ymd1ox1cm3UugYMx5CiBi/GqxPSIeu80m9Ozz09M0WVTOvv8/BZCVjO+fv1Xs1nOjU9+n+Ol5wXNviI6TrErUkZNciC+2v7Acpr1Y+oKWIFmKlXLnvaGtVy+6kTA56FTPrCaLh7RSpRmmbfnREeSU7ML1KaQy/W0DtoOQKCQqWRwEXZKt0asxuWfUvok+cflaC4EdTDxaT8IcdWhUY6kfCEq54OFTxVqADCG4GvB3xxsEMoIFQ7xLEagmr8mPIdlyY2fGDxJlWbSTXixwBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726115681; c=relaxed/relaxed;
	bh=qaPDBs60GYvv9drlrAghEXB5v3hfoGAd/AfA0tP8YIM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gqDlXABLKlipZL5kXHlLPM81U7AuwsxH9SRwKRigU/K6/UItAjdqVlBpm0QzLQwo2jyZC8NJ+lzi/h59Y5WkxUDq9mr4bVB8dV74vEE7Z1gy/m8xIKYk5Z1crtJ0n5cztLQdQAXzcNpHLTMGcQvYxrhdEg6kyBcu03ZI9ugOvZDIDSZwlSPTAauj9FlPl+ECUvcy+4yBsHyjHQDV9STbPoe1oRVGG+idwS6vVMqdkPYiO3C4ZtFcBPRlGlFBPbraqNcb6VZNF/dez+xfn6Z5u9qUk8dbe418LuV1vMR3gHK5gOmOYIFye2/PPPbvppbUFAWrPv/sDWZkEV+YTuPG2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CYOpulRW; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CYOpulRW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X44NK4bqXz2xjw;
	Thu, 12 Sep 2024 14:34:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726115681;
	bh=qaPDBs60GYvv9drlrAghEXB5v3hfoGAd/AfA0tP8YIM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CYOpulRWGFuI+h8s9pPoqXUJAIWgXxPKdw1zPUUUTZ64tybehBDYGbE9/yUyQszDA
	 2xbNwmBjzOVdeD8GxcsyY1dsStnWWFQnX4Nl61PsHTvbxGF8CD8/jwS4Byi4EUyZf5
	 1Jp5tWLSiPaMVXz0tBSx90bXNJbRrnP851ptO7sn/gJWEPFjQ/Astu4hLAeUPvYl4b
	 LG2l8B2by2JU00n67VZTFOQaeiVMpblDyfGeiITmsBdRFwEsI8EzqZ0H7VHciMEuv9
	 8nrUVOY4IL/tN0ZRJM3xjdZn9naV+C+X+cf7vXDh9G3QtlVnsJb+BtwDYXrQ/9P8Ao
	 nrbTolkhOgILw==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7656964FDD;
	Thu, 12 Sep 2024 12:34:38 +0800 (AWST)
Message-ID: <24ab22b5403adb379f942b3dadb8f49b54f28bb0.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/2] ARM: dts: aspeed: mtmitchell: Add I2C FAN
 controllers
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Chanh Nguyen <chanh@os.amperecomputing.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, OpenBMC
 Maillist <openbmc@lists.ozlabs.org>, Open Source Submission
 <patches@amperecomputing.com>
Date: Thu, 12 Sep 2024 14:04:37 +0930
In-Reply-To: <20240905063521.319416-2-chanh@os.amperecomputing.com>
References: <20240905063521.319416-1-chanh@os.amperecomputing.com>
	 <20240905063521.319416-2-chanh@os.amperecomputing.com>
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-09-05 at 06:35 +0000, Chanh Nguyen wrote:
> Add the MAX31790 nodes as i2c fan controllers.
>=20
> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> ---
>  .../boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts   | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts b/=
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
> index 0295f5adcfbc..da181f9ae820 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts
> @@ -684,6 +684,16 @@ bmc-ocp0-en-hog {
>  			line-name =3D "bmc-ocp0-en-n";
>  		};
>  	};
> +
> +	fan-controller0@20 {
> +		compatible =3D "maxim,max31790";
> +		reg =3D <0x20>;
> +	};
> +
> +	fan-controller1@2f {
> +		compatible =3D "maxim,max31790";
> +		reg =3D <0x2f>;
> +	};
>  };

This generates some warnings based on v6.11-rc1:

Executing: ./scripts/checkpatch.pl --strict -g HEAD                        =
                                                                           =
        =20
WARNING: DT compatible string "maxim,max31790" appears un-documented -- che=
ck ./Documentation/devicetree/bindings/                                    =
        =20
#25: FILE: arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts:689:  =
                                                                           =
        =20
+               compatible =3D "maxim,max31790";                           =
                                                                           =
          =20
                                                                           =
                                                                           =
        =20
WARNING: DT compatible string "maxim,max31790" appears un-documented -- che=
ck ./Documentation/devicetree/bindings/                                    =
        =20
#30: FILE: arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts:694:  =
                                                                           =
        =20
+               compatible =3D "maxim,max31790";                           =
                                                                           =
          =20
                                                                           =
                                                                           =
        =20
total: 0 errors, 2 warnings, 0 checks, 16 lines checked

However, Guenter's applied the binding here:

https://lore.kernel.org/all/3382f952-daae-43ff-bb85-fa4820ecbc5f@roeck-us.n=
et/

`make CHECK_DTBS=3Dy aspeed/aspeed-bmc-ampere-mtmitchell.dtb` didn't turn
up anything interesting after merging in hwmon-next, so I've applied
these to be integrated via the BMC tree.

Andrew
