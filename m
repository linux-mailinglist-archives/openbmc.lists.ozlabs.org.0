Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C450A318708
	for <lists+openbmc@lfdr.de>; Thu, 11 Feb 2021 10:25:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dbrp74KCdzDwnC
	for <lists+openbmc@lfdr.de>; Thu, 11 Feb 2021 20:25:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=XIiXsVnZ; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbrnC0TrGzDwlQ
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 20:24:45 +1100 (AEDT)
Received: by mail-qk1-x734.google.com with SMTP id s77so4540799qke.4
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2021 01:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EB4cpZM+1lgLg4XXoCepq0StQ9E30uwOM8fKt6c0ebY=;
 b=XIiXsVnZJCIVqtr59CMEP7HUTJ0//m3g8ddD95RJqrV10uUfqorm0u7L6pOknunvrl
 VlKNVVl9d91iZz73GOsDics93lyL/DD78U2bgIaK/pfpYxlnz/SULlW4OP4dHSA0Gkjj
 5VbL3GE3A2xb4CzLXVW5nVgTD5/5lYpQjSKVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EB4cpZM+1lgLg4XXoCepq0StQ9E30uwOM8fKt6c0ebY=;
 b=l/+SfvN3ogEzA8GM8eCDSWGoMmSQLjyCSQuRIlcsgqajkpoL8fmZoIPs63HF9sseva
 2vgVusJzc64Ba5O9D0QjpUjh/Z03GfI6mmOhyXDgnQhOC4P85xddnN+GGJvazmJU+T6m
 bDDMqem7LpTK282kHJ4d6JVMZSxLJzhGDSO2G1xvf+xCpjCdSCSjkVirWXwwgYR/WmS0
 9J8JI19ObZ4iUYaS0kOhHucR4qCG1am6BskcADAzYL3C8fjU6VNy/s+rXTjBdxAT5qrW
 xAKkB7KtqVMNL2vlrgKhNwR17y1DocdHr5QgnvJEe93JfvJ4sk5RiotCY1Jwvfr+ahqI
 5FLw==
X-Gm-Message-State: AOAM530t6sQIF8mHwtj3M5fDi2a/F8h5nUWj0t8NyY/cXp8t69lAK3h6
 mLCMDpOs0ZuQP71eZIq4bvIInSJOSvAjMpF7Rv8=
X-Google-Smtp-Source: ABdhPJyhHPnHlG4Jo/rYqu9jWrVBsR5bzvAeINqgBCDgfcwGiandcngtAcDZmqzZG4sgi7k0Inm8vvUki50X7bC3n9o=
X-Received: by 2002:ae9:e314:: with SMTP id v20mr7468774qkf.66.1613035481338; 
 Thu, 11 Feb 2021 01:24:41 -0800 (PST)
MIME-Version: 1.0
References: <20210211083454.37117-1-gmouse@google.com>
 <20210211083454.37117-2-gmouse@google.com>
In-Reply-To: <20210211083454.37117-2-gmouse@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 11 Feb 2021 09:24:29 +0000
Message-ID: <CACPK8XdjeidAdPYXV1-WXrbxcPyy4PBE0S-u-3FoH3UcEj0d6g@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: nuvoton: Add Fii Kudo system
To: gmouse@google.com
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
Cc: Mohaimen alsmarai <Mohaimen.alsamarai@fii-na.com>,
 Benjamin Fair <benjaminfair@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vivekanand Veeracholan <vveerach@google.com>,
 Lancelot Kao <lancelot.kao@fii-usa.com>,
 Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Anton,

On Thu, 11 Feb 2021 at 08:35, <gmouse@google.com> wrote:
>
> From: Lancelot Kao <lancelot.kao@fii-usa.com>
>
> Add device tree for the Kudo BMC. Kudo is an Ampere (Altra)
> server platform manufactured by Fii and is based on a Nuvoton
> NPCM730 SoC.

I see you got git send email working :)

Where did you want this patch applied? We already have it in the
openbmc tree (both 5.8 and 5.10).

If you would like to see it merged upstream, a few notes:

 - remove the OpenBMC-Staging-Count tag. That's for us to use in
openbmc land, but will confuse mainline devs
 - When sending someone else's patch, be sure to add your own signed
off by. This applies for the openbmc kernel tree as well as mainline.
 - Use scripts/get_maintainer.pl in the kernel tree to work out where
to send the patch. In this case, it should go to linux-arm-kernel. You
can cc me as I've been helping out with Nuvoton pull requests.

Cheers,

Joel


>
> OpenBMC-Staging-Count: 1
> Signed-off-by: Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>
> Signed-off-by: Mohaimen alsmarai <Mohaimen.alsamarai@fii-na.com>
> Signed-off-by: Lancelot Kao <lancelot.kao@fii-usa.com>
> Reviewed-by: Vivekanand Veeracholan <vveerach@google.com>
> Reviewed-by: Benjamin Fair <benjaminfair@google.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Link: https://lore.kernel.org/r/20201116232127.7066-1-lancelot.kao@fii-usa.com
> Signed-off-by: Joel Stanley <joel@jms.id.au>
