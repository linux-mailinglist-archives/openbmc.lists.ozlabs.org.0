Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F67A504ECC
	for <lists+openbmc@lfdr.de>; Mon, 18 Apr 2022 12:22:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhjfM0rzpz3bYT
	for <lists+openbmc@lfdr.de>; Mon, 18 Apr 2022 20:22:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JxwT2fui;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=JxwT2fui; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Khjdw08P8z2xDV
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2022 20:21:37 +1000 (AEST)
Received: by mail-qk1-x72c.google.com with SMTP id q75so2169899qke.6
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2022 03:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7O8eskdzKCKAqOMIsyNWjfVY07SaIWUiRD692X7lgL0=;
 b=JxwT2fuieLPqRPKGfXwF9BHPItuW9ymBUp7vXZZa0m/6tYYVLHrLdd9Nc4ZoC+ypxZ
 NMRswz0ejkJ6ytWvPFtthfYKGMF+lep+QN428U81uAVM/ARTjVPi/WifF3KPIISkuROP
 JC7hmd3m8dRoIppPZFBeoS7643228EFL3EFIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7O8eskdzKCKAqOMIsyNWjfVY07SaIWUiRD692X7lgL0=;
 b=uI2V63rvgwxVdJ7Q+tCcz7VZ3kVmG33zdxt5/WGYwgnZ1UAgLnCK2k9KnhexZ2iawp
 jkNShiLgcE5AuuNCTJMM9sN29HmlXAeQVNDQHjkU8OlhYrt0FXjx3/ZYtAOd5HpUk7YV
 oNCHGHl6zC1zJ6VZE65FlFPHpNYhALzxFdT3q6PMd1gTNYALupvFGolNPm/Pfy00W0Jf
 FBdVLLMrJyzMXhl0P1017wYXWYWr+M2csHFF/e7NLYEBV1FSUf2ChDy2IDs+yb3K/pD1
 Lvb4Y0SQ3ACKcpnvZtSOY9BPxPyD3L5O6+1xi7FGdzGvocrhXNzlE+dQA19aZ+JWINYE
 StWg==
X-Gm-Message-State: AOAM532LSFRr+XNNWIT0imjVN8T5oVZbpUF2vIB6Oo2E++Faa1MaEW2w
 EczIHwiecrHGKc90UCAK081WT/JhMpMzcxPdhc4=
X-Google-Smtp-Source: ABdhPJxM6EyZm+SD16piExsu0w/6td1y4LzvRpyjkjnHx7ZGq0C+/AFYYygVjRHfEM3RW4RvOfUVaFu35TYdM4sAHNc=
X-Received: by 2002:a37:c445:0:b0:69e:9283:b262 with SMTP id
 h5-20020a37c445000000b0069e9283b262mr2823554qkm.296.1650277293962; Mon, 18
 Apr 2022 03:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220418091728.23051-1-potin.lai@quantatw.com>
In-Reply-To: <20220418091728.23051-1-potin.lai@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 18 Apr 2022 10:21:21 +0000
Message-ID: <CACPK8Xc7539nTwiO6HzFPavZazKRdZcMZv5PwMs-4frY00M7yg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15 RESEND 0/2] hwmon: (adm1275) Add sample
 averaging binding support
To: Potin Lai <potin.lai@quantatw.com>
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

On Mon, 18 Apr 2022 at 09:18, Potin Lai <potin.lai@quantatw.com> wrote:
>
> This patch series allow user config PWR_AVG and VI_AVG in PMON_CONF
> register by adding properties in device tree.
>
> Example:
>         adm1278@11 {
>                 compatible = "adi,adm1278";
>                 ......
>                 adi,volt-curr-sample-average = <128>;
>                 adi,power-sample-average = <128>;
>         };
>
> Link: https://lore.kernel.org/all/20220302123817.27025-1-potin.lai@quantatw.com/
>
> Potin Lai (2):
>   hwmon: (adm1275) Allow setting sample averaging
>   dt-bindings: hwmon: Add sample averaging properties for ADM1275

Thanks, I've merged these and the device tree change.

>
>  .../bindings/hwmon/adi,adm1275.yaml           | 68 +++++++++++++++++++
>  drivers/hwmon/pmbus/adm1275.c                 | 40 ++++++++++-
>  2 files changed, 107 insertions(+), 1 deletion(-)
>
> --
> 2.17.1
>
