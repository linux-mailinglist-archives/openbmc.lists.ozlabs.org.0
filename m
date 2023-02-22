Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A344369EC4B
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 02:18:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLywX3kPNz30QS
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 12:18:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=N9ryFOLc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=N9ryFOLc;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLyvc5Q97z3c8h
	for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2023 12:18:04 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id ec43so23821946edb.8
        for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2023 17:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/hWDbQev0yI31EnRgauXLmlzkeDYy6v/hywRMQVlP38=;
        b=N9ryFOLcY4gzbUA0sIRbHc5TlftC6vK3EgZ85fg8Yf47yRwBalfmB3RG9oeRfAZ0MO
         sRO/g3YWuN+efz0NPZOPqGDF4c6ddQNBStEvzk+vKLQcmywm5TbG6Ti+ply+TK6198H+
         QoWok8lvCUU95iqYc0KekZjq1MPUfFPBomxcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/hWDbQev0yI31EnRgauXLmlzkeDYy6v/hywRMQVlP38=;
        b=cj7GEFGRA8ejP5KgGIJTaHwSajScX09MXzo81RzwDixyO11btZeME+xw3MPIJdOvN/
         ijfEStVDfEvmOaX2coJ/c/n4nhWhMvwp/xWLT18oqd07CcUoHNUOoyojyiV7GF2ei0CO
         IlFksTqQgectKSpkF6Q5j2SATA3FMp5IdNEIhVDF8xSxjc9IInqiPQlBpmvn9vnjXJrR
         YWOKOrVEiSR2CGgecep5txLxli6YQNCiy8ytdCieHR71LrNTysNJ/e26IK5EqhjGZEhb
         xv7bnFrfG/qc1R2WcE1noq5HxY3T+RSrwE9TkbNTwO3V6GVjhiBFjii8D/cxU4Y4nekx
         SmUQ==
X-Gm-Message-State: AO0yUKWI1soK80YgGeILSRi0egPOxvOgc3QvVfdn5bD4M7XWIIy8vfpa
	BLXUMcC/EXKQnFXBWFZcNfHzYbwCQlycDO2npwo=
X-Google-Smtp-Source: AK7set+ggLkNm7nggVr6GqGY83iiMg0n17baMQNeArsIoD8UxfSP3A3WPOGwEyhUExzpN7zVo/k9xhyHr8wcq2cxTko=
X-Received: by 2002:a50:9fa8:0:b0:4ad:6052:ee90 with SMTP id
 c37-20020a509fa8000000b004ad6052ee90mr2942112edf.7.1677028681519; Tue, 21 Feb
 2023 17:18:01 -0800 (PST)
MIME-Version: 1.0
References: <20221226055118.2836493-1-potin.lai.pt@gmail.com> <20221226055118.2836493-2-potin.lai.pt@gmail.com>
In-Reply-To: <20221226055118.2836493-2-potin.lai.pt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Feb 2023 01:17:49 +0000
Message-ID: <CACPK8Xdp+YMNN-OQRWjBT2hoFw6vuFCNLAq0x-jAx4_AYimg1g@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.0 1/2] ARM: dts: aspeed: bletchley: rename
 flash1 label
To: Potin Lai <potin.lai.pt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: openbmc@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 26 Dec 2022 at 05:53, Potin Lai <potin.lai.pt@gmail.com> wrote:
>
> In OpenBMC, phosphor-software-manager use "alt-bmc" for secondary falsh
> label.
> Rename flash1 label to "alt-bmc" to support dual image feature inOpenBMC.
>
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>

These two are in 6.1 so you're good to go.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> index a619eec70633..791f83aaac50 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> @@ -307,7 +307,7 @@ flash@0 {
>         flash@1 {
>                 status = "okay";
>                 m25p,fast-read;
> -               label = "flash1";
> +               label = "alt-bmc";
>                 spi-max-frequency = <50000000>;
>         };
>  };
> --
> 2.31.1
>
