Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3E55EC210
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 14:06:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McJHb4M33z3c3V
	for <lists+openbmc@lfdr.de>; Tue, 27 Sep 2022 22:06:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=G+gMsz+4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=G+gMsz+4;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McJH45G9cz3088;
	Tue, 27 Sep 2022 22:05:35 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id cc5so14665156wrb.6;
        Tue, 27 Sep 2022 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=aMFz74PifNUSu/W0zEbEDzLNbyXt9EcYY4KaI+IEVt0=;
        b=G+gMsz+4fAGkT5Px+9K2xvQvfj9D9TKBj+P18qWucd+8pQw+U/rOWuTlHv5B+ULWgT
         5y7QcT8rOOYXt6E2TDNxd5r7cd86ngoHaw5Qxuxys3fzcgGygoE0f++c7fNDk1eXEYl1
         6Z/wo+8NHwi1sqwA5Z3kjzgK1LP2QNOmlaO0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=aMFz74PifNUSu/W0zEbEDzLNbyXt9EcYY4KaI+IEVt0=;
        b=FB0A3l3fa8tPxGaRRLwqdlfEoAM97pGuShA4lGhbmBipmPwSEB3WBtR6nmu88Hnjt4
         H1uy3iYzs52PmfljDANkhwuqvf3AzjUQCxYGw3XEA8pn17JNtaYzRT2E8PCLDRt0IP8Q
         l0HK4pBP36HgxhnKI9NffINnTlMDCQ7Hw2XZvdnh5X1qm6WfidoXmEhIX0BSqfb1zpRP
         WWlazFDOgxQLW82uqSoj0A5cvcMluPaWCKlYw349BoLCqRz+s1m6gPF/hdU3yquaQRut
         mDoA1e+Pwji+J206IZpre4XyFWbEvm+o27NapHFFcPGvrrVnthMhHHK/NN+tgb8wIqyU
         nGdA==
X-Gm-Message-State: ACrzQf08Ahgzqkr3aqyZDThVchV2DKyaZdqTOf11BY1BzSe1YjMDseWn
	F7/wmJ6DdEuvFLhsbvgSO0jMbR1FEu/r/ENOhZw=
X-Google-Smtp-Source: AMsMyM7nMLB0IrCPb2M/nxRoglUKQkXLXDTvev/T6b71kPxYN6T7MwuZB65wnFvN2X+RV+DTVJ2yZoF81QdnU8NDvZ8=
X-Received: by 2002:a5d:4bc3:0:b0:22a:4b7a:6f60 with SMTP id
 l3-20020a5d4bc3000000b0022a4b7a6f60mr16447585wrt.549.1664280326958; Tue, 27
 Sep 2022 05:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220927114515.GA22344@hcl-ThinkPad-T495>
In-Reply-To: <20220927114515.GA22344@hcl-ThinkPad-T495>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 27 Sep 2022 12:05:14 +0000
Message-ID: <CACPK8XdHaExSzdHpCXNzSEK7L-QDDSkz2rud3OynBC-KhEApFA@mail.gmail.com>
Subject: Re: [PATCH v6] ARM: dts: aspeed: Yosemite V2: Enable OCP debug card
To: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 27 Sept 2022 at 11:45, Karthikeyan Pasupathi
<pkarthikeyan1509@gmail.com> wrote:
>
> Added IPMB-13 channel for Debug Card communication.
> which improves the readability of the machine and makes
> it easier to debug the server and it will display some
> pieces of information about the server like "system info",
> "Critical sensors" and "critical sel".
>
> Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>

Thanks, I've queued this.

Thanks Zev for your help reviewing.

> ---
> v6:
>  -Fix the commit format
>
> v5:
>  -Updated commit message
>
> v4:
>  -Resolved syntax error
>
> v3:
>  -Updated the title and commit
>
> v2:
>  -Updated the title
>
> v1:
>  - Initial draft
> ---
> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> index 8864e9c312a8..84236df522dc 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
> @@ -215,6 +215,17 @@
>         };
>  };
>
> +&i2c13 {
> +       status = "okay";
> +       // Debug Card
> +       multi-master;
> +       ipmb13@10 {
> +               compatible = "ipmb-dev";
> +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
> +       };
> +};
> +
>  &pwm_tacho {
>         status = "okay";
>         //FSC
> --
> 2.17.1
>
