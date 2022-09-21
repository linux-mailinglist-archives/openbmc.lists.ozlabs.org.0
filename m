Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D9C5BF6C9
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 08:55:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXTgm0Jmvz3c6M
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 16:55:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=CmS8jUu+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=CmS8jUu+;
	dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTgL3w1wz3bfH
	for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 16:54:54 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id t7so8183778wrm.10
        for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2022 23:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=CI6MMXe4/Qnk2+ZOytrTm90NhwfgkTSCGscomEe56LQ=;
        b=CmS8jUu+SdeT4AirZA2ci08rSsLKNonpViRYk6czARg32MeHYoFofPOS2AkO3oNpld
         jg+9IzOXP7iGAWYcHFevbH23yXfsCNS715SUvjpwU3MVaAOQjH1BXZHgOAJL54aeRot2
         FEFDbpSU5T5Rv23XsS2kH5AMY0O6OQbTgaB0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=CI6MMXe4/Qnk2+ZOytrTm90NhwfgkTSCGscomEe56LQ=;
        b=yG343Z6wwjT1SdeOtAI5H5xscMio5fX7RkKFxJCslk1ZWJNSgmgOD3ZU90aYZh/4+E
         An9UulS91g/4qLwfgLVxdMWUeyOtgMjASPbSTejSFmb4WPov4X9qxymnIF3CnJFPLZhS
         05//aMK/ag4+lAXg2AQtitOdyBALCs+klRqBGzexvO/Y7SGxKhnj05XewOPhfLH5f1av
         gsYUCUalc0FTe4nPYqn22Sw3cjegrt/UWLV8LZeTlhMLffvIpASOyW7hl/2xi0eBriPH
         Pvm2Qn3O+EGuXHGOTi7Wb9TuWVsfy3poul+Y9ZdgudGFAD7Dd/bKv4yAYGodCtSo6H89
         XJmw==
X-Gm-Message-State: ACrzQf3i6PqZlNHgq2Xy5moft3AvNZO1lrLrxGFvrtqfIPeyJaZ6r4je
	VtuEkaE0LrdK7TCSL10uV1ddDx69gyCvhpf2FqE=
X-Google-Smtp-Source: AMsMyM7RBQaQBgX/ClDGNoJlEp474D3EhfjKeRaW+ugMQeQpkGRzSIfAGdxlYA+8mfJpmp+g1tc7YyGyLwRIyNe9YGI=
X-Received: by 2002:a5d:4688:0:b0:22a:f718:7f36 with SMTP id
 u8-20020a5d4688000000b0022af7187f36mr10134660wrq.315.1663743287232; Tue, 20
 Sep 2022 23:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220921045420.2116037-1-joel@jms.id.au> <20220921045420.2116037-2-joel@jms.id.au>
 <f72c4381-f9e4-4f43-9a6e-dc0b30a04613@app.fastmail.com>
In-Reply-To: <f72c4381-f9e4-4f43-9a6e-dc0b30a04613@app.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Sep 2022 06:54:35 +0000
Message-ID: <CACPK8Xfnsuc29FhZ8D--FhaUzOZxOZ41FH00ydQv_RLy6viQLw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 1/3] aspeed/sdram: Use
 device tree to configure ECC
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
Cc: openbmc@lists.ozlabs.org, Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 21 Sept 2022 at 06:10, Andrew Jeffery <andrew@aj.id.au> wrote:

> >  #ifdef CONFIG_ASPEED_ECC
> > -     ast2500_sdrammc_ecc_enable(info);
> > +     if (dev_read_bool(dev, "aspeed,ecc-enabled")) {
> > +             u32 ecc_size;
> > +
> > +             ecc_size = dev_read_u32_default(dev, "aspeed,ecc-size-mb", 0);
> > +             ast2500_sdrammc_ecc_enable(priv, ecc_size);
>
> The code you deleted passes `info` to ast2500_sdrammc_ecc_enable() as
> the first argument but you're passing `priv` here. Do they alias?
>
> Ah, actually, I think you copied the code from sdram_ast2600.c into
> sdram_ast2500.c. I suspect this might not compile?

Well spotted. I was build testing, but it seems it wasn't building
what I thought it was.

Cheers,

Joel
