Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2144A263990
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 03:48:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn1xd6d8JzDqZR
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 11:48:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=hvhtKVdy; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn1wp6K9yzDqZD
 for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2020 11:47:37 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id p9so6328580ejf.6
 for <openbmc@lists.ozlabs.org>; Wed, 09 Sep 2020 18:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D9x2Zhi2lg5uPTAfHLFGxNCn0iabawo2/+Ma9lrchJA=;
 b=hvhtKVdyAJnFvh/bCKTB1zRzNTIpEtC4MyVmVunclxEwr3xWyI2dqFKP+pR6fx7Xt0
 0BB0WGXqNOiTRmauAtmKESnMdjTNxCEFqRThoLo2mtZJ+hzHqHJhmihCsgHuKcJzRFBq
 Hfl1hwT0Hw0yvbjIjafv2+B2iyZLBkJeUwMo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D9x2Zhi2lg5uPTAfHLFGxNCn0iabawo2/+Ma9lrchJA=;
 b=fser6SYVB7EARfc3UxFYND2UagLFX/9bnO98LYPB4hIy/ggyo8yZ5zVkZ9Cjn+rH2W
 7n+IP+r1kUo6bzQvAafSgHZp4mF1429YL/6QdcaMQpn4FCNplM5ImtzTevrojt19Rb7I
 zDm2sUnLRosJO2A/XASv8kQtw1kc0kjZJ25/l6zHn6wCyW6OICQaAx4SyeHig86qdsAu
 wOTdND44VL+kFwS6G/iTtyoLBIfCrS3eByIQjDy5Kyj8/o15VVyf/mSbRcMewOCKBwNs
 ihJ1kOnuns74H5gwBu1G9CTvQZGRvgW1zpzEuP2DFaFSRtvMiDkm/F+IWOLaN2LD6z8r
 wQbA==
X-Gm-Message-State: AOAM531x8JIDAPkeJjlqUnDuBkO8SZX9kE19SyIq4Pwzr5vEGq76WYz6
 OGxdrmdhx3vjWAN5r6G1zaDW0d+mke+freA5+xDM5SD3
X-Google-Smtp-Source: ABdhPJwDlQvMzL44oHV+oRVcPHYjxdUKPPK3ydVHNCHOyJrZaIRoY/cKKckIrkHS2CeLqBMohwUSo0xUZMowTQ4yLgw=
X-Received: by 2002:a17:906:7cc6:: with SMTP id
 h6mr6465102ejp.266.1599702453489; 
 Wed, 09 Sep 2020 18:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200909112825.2862827-1-andrew@aj.id.au>
In-Reply-To: <20200909112825.2862827-1-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Sep 2020 01:47:21 +0000
Message-ID: <CACPK8Xeza+vDZYDQW8zuibon-p--EGvvvCBjLT7RH_WQOxWm_w@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8] ARM: dts: rainier: Disable internal
 pull-downs on eMMC pins
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 9 Sep 2020 at 11:29, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> There's a veritable tug-of-war going on in the design, so disable one of
> the warring parties.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Upstream?

Applied to dev-5.8.

Cheers,

Joel


> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index cbc64a1d14d1..04fd9e5a34de 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -231,6 +231,10 @@ &emmc_controller {
>         status = "okay";
>  };
>
> +&pinctrl_emmc_default {
> +       bias-disable;
> +};
> +
>  &emmc {
>         status = "okay";
>  };
> --
> 2.25.1
>
