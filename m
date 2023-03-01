Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E89C66A64D1
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 02:31:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRGsG5Gtwz3bgX
	for <lists+openbmc@lfdr.de>; Wed,  1 Mar 2023 12:30:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jAZJqxNn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=jAZJqxNn;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRGrb4Fdwz3bTS;
	Wed,  1 Mar 2023 12:30:21 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id ck15so47993032edb.0;
        Tue, 28 Feb 2023 17:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZS4srdzYPX5rwf8hBmS3h/CSWlxeptJDidxpQ52/rY=;
        b=jAZJqxNnaCbGp3Cn7I115sC3pbOLIoFPvymD9tvjSPw0mD8MYApBCMMkCAcdj8mh4M
         CYNw1xXXsUQgDqAQwJSWMhpwGV560MZ6TvUwZPW5XxlgGBOVUQxzgAgWb/FAlfACMBTH
         MSAmXvY5yDuOu8EgKMsqpKhQTl1+tPDCB02CE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZS4srdzYPX5rwf8hBmS3h/CSWlxeptJDidxpQ52/rY=;
        b=jCvv9CGY59gVgv58/t4joiW1dYRoQPu57ZSms3Jr62QUlF6G+BCoXFWJheTSWVuqFp
         gPeaBAOEWDjEgWnePvTMvW/5b/tA3PlFXi3jxX6jKHWe0qit26PH2S1uNohawk8bPn65
         2ok22R9nNo08iZLARVLn5FobZ2r++JMQRQs0FGsQ/8zFM+sPmIAbUCMm36vUV+6QnIZo
         tLK4WUigCMH66f7yFvM9KKX+lvZMBPngNdMeW4rSdmoGMr7cEoFRznEOpVQkKVwgLL56
         iV1lOlIc+Qmv8XWYplhZf+9RrNPR4PrwjdqjXnAOCGmrXIgTkPUHW0zyxU8KxPtegzSN
         1uig==
X-Gm-Message-State: AO0yUKXBqctxvfUL94vaHwWAWFiNpa/4cNnZRV7VE+MdUJe20fUqQJJQ
	+2jRc8S+3viY/8MHKa5QZetNX+kdqufdfp2k2dk=
X-Google-Smtp-Source: AK7set/PW9p3+rsDwfdQvTVOa0cA7HHEYagI+NeYdL0zp0aQTvVe97kOvNfE5b67MEGgt5lDe1NN/RWcCezxLJstPSQ=
X-Received: by 2002:a17:906:d82:b0:87b:db55:4887 with SMTP id
 m2-20020a1709060d8200b0087bdb554887mr2237966eji.4.1677634218221; Tue, 28 Feb
 2023 17:30:18 -0800 (PST)
MIME-Version: 1.0
References: <20230224000400.12226-1-zev@bewilderbeest.net> <20230224000400.12226-4-zev@bewilderbeest.net>
In-Reply-To: <20230224000400.12226-4-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Mar 2023 01:30:05 +0000
Message-ID: <CACPK8XdFT=+VJJ=iDhcmWPh9m9of2b+2UYxkrAisp6tdmWOWKg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: aspeed: asrock: Correct firmware flash
 SPI clocks
To: Zev Weiss <zev@bewilderbeest.net>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 24 Feb 2023 at 00:04, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> While I'm not aware of any problems that have occurred running these
> at 100 MHz, the official word from ASRock is that 50 MHz is the
> correct speed to use, so let's be safe and use that instead.

:(

Validated with which driver?

C=C3=A9dric, do you have any thoughts on this?

>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Cc: stable@vger.kernel.org
> Fixes: 2b81613ce417 ("ARM: dts: aspeed: Add ASRock E3C246D4I BMC")
> Fixes: a9a3d60b937a ("ARM: dts: aspeed: Add ASRock ROMED8HM3 BMC")
> ---
>  arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts | 2 +-
>  arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts b/arch/arm=
/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> index 67a75aeafc2b..c4b2efbfdf56 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> @@ -63,7 +63,7 @@ flash@0 {
>                 status =3D "okay";
>                 m25p,fast-read;
>                 label =3D "bmc";
> -               spi-max-frequency =3D <100000000>; /* 100 MHz */
> +               spi-max-frequency =3D <50000000>; /* 50 MHz */
>  #include "openbmc-flash-layout.dtsi"
>         };
>  };
> diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts b/arch/arm=
/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
> index 00efe1a93a69..4554abf0c7cd 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-asrock-romed8hm3.dts
> @@ -51,7 +51,7 @@ flash@0 {
>                 status =3D "okay";
>                 m25p,fast-read;
>                 label =3D "bmc";
> -               spi-max-frequency =3D <100000000>; /* 100 MHz */
> +               spi-max-frequency =3D <50000000>; /* 50 MHz */
>  #include "openbmc-flash-layout-64.dtsi"
>         };
>  };
> --
> 2.39.1.438.gdcb075ea9396.dirty
>
