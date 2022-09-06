Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D5A5ADFC2
	for <lists+openbmc@lfdr.de>; Tue,  6 Sep 2022 08:28:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMFng3jBJz306l
	for <lists+openbmc@lfdr.de>; Tue,  6 Sep 2022 16:28:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=q5hGWkzH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=rentao.bupt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=q5hGWkzH;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMFn80M14z2xZ4;
	Tue,  6 Sep 2022 16:27:55 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id jm11so10286403plb.13;
        Mon, 05 Sep 2022 23:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=tZGkVWfVwu3VMSzAGROw7vkLVEx9FkktQXY75aiAv1g=;
        b=q5hGWkzHC+IcxG4HYOa7ijNSm1gIy0xI5yvRIJoJ4rgtFb2yeGg7eV0Lgc8rAzwEyh
         /QWrx4UiRJbjR2JAimM/PiPuId0VOld9GL6aNQX60m10yKQ3PY4GXU4P0J5Qfj+tgw/D
         6Hhqvib3H9O+nL22TPeHRfO/axMjJNt23nIm9cgDFLQrD32clHnaShP4nWQe5Gj3lIp/
         owHKctlCy1/sheAOOwGmfruXxWvuJi7QF+kUQOZVB5KwuStkhy8x4nUJZbOrG/W7gZEW
         Q3HfIxUSPIf3wLI/8Z6m8zljULEgzTDuyImYCzcxsooqpotxIO4mGp2rrvhmSXoveut/
         g/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=tZGkVWfVwu3VMSzAGROw7vkLVEx9FkktQXY75aiAv1g=;
        b=IDTntESJIdi3LGKO/Dm+M4cIri8lBhriAxCRvPf2kFAyvpEfuH74fr7WUE4+LNPqbA
         HCdPSfgKtbHoZQdQ9hhJPHC8AYFxYn8wCYFqfDE5s7BmV00zOwBCaFZzwkDUc5V5RopU
         f6o9EXnXZ523wZ8hZxGihPgUYAgN8Z1zvUdoC8EO3dxZtuth9Q5Cp23XZ4Z7kVlD+Rei
         S3hEbbavRAR1ReV/LGOu3a7FdnJtEQL4NpAI4PnGBIEBacuEGMRYaFmaff4XZNPxhmP0
         +8EN3mBEBpIKYRBOe8lf12II9ssKvce6bxSY3doP5oW5mMfp7az8JX2hXj2iw9Wf1qb3
         rgJA==
X-Gm-Message-State: ACgBeo0ClSQcJUJhVT7nkKumJEKC7/dJTh8zSFOKLD5rJGcYB3HG0vz8
	CMi+7QJlLW0qJCx42qKyk7g=
X-Google-Smtp-Source: AA6agR6bqQvVPxZDdNU9/IYUxuqxClwUpHLhvoX7Ki3t2GJAr6RH4b3PG2Cl6yU8oos1upmBqsa86w==
X-Received: by 2002:a17:90a:5988:b0:1fd:6a33:abf with SMTP id l8-20020a17090a598800b001fd6a330abfmr23105126pji.69.1662445672225;
        Mon, 05 Sep 2022 23:27:52 -0700 (PDT)
Received: from taoren-fedora-PC23YAB4 ([76.132.249.1])
        by smtp.gmail.com with ESMTPSA id 5-20020a170902c24500b0016dc78d0153sm842426plg.296.2022.09.05.23.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 23:27:51 -0700 (PDT)
Date: Mon, 5 Sep 2022 23:27:42 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
Subject: Re: [PATCH v1] Update for Facebook yosemite V2 BMC.
Message-ID: <YxboXspF+0Y/+spD@taoren-fedora-PC23YAB4>
References: <20220906050702.GA10565@hcl-ThinkPad-T495>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220906050702.GA10565@hcl-ThinkPad-T495>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Karthikeyan,

I don't have much experience with ipmb-dev, but I'd suggest updating the
patch tile so it's consistent with other dts patches. For example:

"ARM: dts: aspeed: yosemitev2: Enable i2c13 controller"


Cheers,

- Tao

On Tue, Sep 06, 2022 at 10:37:02AM +0530, Karthikeyan Pasupathi wrote:
> Added IPMB-13 channel for Debug Card communication.
> 
> ---
> --- v1 - Initial draft.
> ---
> 
> Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> index 8864e9c312a8..84236df522dc 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> @@ -215,6 +215,17 @@
>  	};
>  };
>  
> +&i2c13 {
> +	status = "okay";
> +	// Debug Card
> +	multi-master;
> +	ipmb13@10 {
> +		compatible = "ipmb-dev";
> +		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +		i2c-protocol;
> +	};
> +};
> +
>  &pwm_tacho {
>  	status = "okay";
>  	//FSC
> -- 
> 2.17.1
> 
