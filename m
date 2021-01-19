Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B56C2FC3F6
	for <lists+openbmc@lfdr.de>; Tue, 19 Jan 2021 23:48:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DL3hn2PlnzDqw4
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 09:48:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=FbV21+eE; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DL3gr048yzDqtW
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 09:47:15 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id b64so23615623qkc.12
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jan 2021 14:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t1z728CwUXUwBbalzcJUQFQoojFtqyiOytGhRqAvO38=;
 b=FbV21+eEaiOQwb0B3oUASbNT9xZD2VYmc5qD9xDL8bRK7UnMlgguYXa3zCBD4KwmVf
 9cTxAInKSCfnmzLNqsrA4DB7ZIcjUlRKxiOYOaj6yUKF/g5p3dK/6p3LPeomBZEkXbOz
 6QbFCuzsCZHOH6Z5zvvtpLwvNe4VhJORJ758A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t1z728CwUXUwBbalzcJUQFQoojFtqyiOytGhRqAvO38=;
 b=T2Ayyce+IwISI3y6jPECYVamx5+er9NjqGFQyWvWbaE4JtxTA3VwtMULcy580+0EYL
 p9oRUXN7TKSkGOg/tCtAh9uRCwHi090qNJg+5bRNFwW66eiKIoSpQqmVkF+hbLrKZaxq
 kcXf4yRLYQkfAHvoZyA4abw73Xzv4kdM5Fn94Eysd0m/2l4e42Odmz0HDZVIl3VU8SPV
 t3wMivHII/iI8ATWuAO9gJT40SQW/9BdYaKFcJOJc7Mt94k6zXVoybJcpac+Ywlo7X9C
 kg4d26huAR17dfFDGBhZggIyR3ThD8il1kz5KhyEVrt6GBpMLhyAERD1P4twI46Ksyc+
 pNMw==
X-Gm-Message-State: AOAM53099CCbGZxRVS9fpUaa4wVOhcfIv5sa6ngAwbmRjIsdB/yW349t
 GCQr7xWFNc0POhSyx2VS2J9k+IghZmugYrQUiag=
X-Google-Smtp-Source: ABdhPJyQxHLgF4rRdfDo4Srnhf2+354iX4Nre+z6WXZNupNYRh2TYS21Tx1kvXeWuUh3KRrzdxv4aneK6zexN68QO2Q=
X-Received: by 2002:a37:57c7:: with SMTP id l190mr6724935qkb.487.1611096431859; 
 Tue, 19 Jan 2021 14:47:11 -0800 (PST)
MIME-Version: 1.0
References: <20210119223412.223492-1-tmaimon77@gmail.com>
 <20210119223412.223492-4-tmaimon77@gmail.com>
In-Reply-To: <20210119223412.223492-4-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 Jan 2021 22:46:59 +0000
Message-ID: <CACPK8XeXRNWeWwv8bWr-k8aHH_fqf1kpG5EN4kXMJbbOsp7iAA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v1 3/4] arm: dts: Olympus: Enable PECI dimm
 temperature
To: Tomer Maimon <tmaimon77@gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 19 Jan 2021 at 22:34, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Enable PECI dimm temperature nodes in Olympus
> Quanta machine.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
> index 1692bb7314c5..de34c9b2ff2c 100644
> --- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts
> @@ -910,10 +910,12 @@
>         intel-peci-dimmtemp@30 {
>                 compatible = "intel,peci-client";
>                 reg = <0x30>;
> +               status = "okay";

Nodes are enabled by default, you shouldn't need to add "okay" for it
to work. Can you confirm it works without adding this?


>         };
>         intel-peci-dimmtemp@31 {
>                 compatible = "intel,peci-client";
>                 reg = <0x31>;
> +               status = "okay";
>         };
>  };
>
> --
> 2.22.0
>
