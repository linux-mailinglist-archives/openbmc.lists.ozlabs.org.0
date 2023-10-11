Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2F07C4769
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 03:47:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=gUvupsvG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4wdL3qFYz3cC9
	for <lists+openbmc@lfdr.de>; Wed, 11 Oct 2023 12:47:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=gUvupsvG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4wcj5X2fz30GC
	for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2023 12:47:16 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-406618d0991so58304375e9.2
        for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2023 18:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1696988823; x=1697593623; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oIzxmf483CnxLtkxRbYL5OELYThZPhe+XxJkQw/O2Ig=;
        b=gUvupsvGKX0rfQK8G5MBiLzsq2jcHO3vCA+4X540FZoz4Gz43TT3AYVaKCkwqAJuBx
         G08iUzvBT6WCmN1RiDW0SaZwC+UYZwYERvi8FSINeb0sRmGOHmIjyJ+xhlcjPA449Nmc
         4cjNsg6dCydE+mxsL9ucF/zCQJ24iWIqh2afA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696988823; x=1697593623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIzxmf483CnxLtkxRbYL5OELYThZPhe+XxJkQw/O2Ig=;
        b=XzuRpz2QLbpxll1ilhi2cbRs7q3OCGp0trSOJx2agR07LBn7irpq2FfRM3TL7HgsYw
         b3g6XkFLEyytxhYIRK/gkO8JpfstmYEE4LDlIHM83YljkkTrpU8nOAmnnaeSF2p7Dk1f
         +HaHY+IG5YeHvv9xczwjqtw01E0h8o1lDNAptD5XPjY53vomzl7nNvEPjMcL2lNW2I0+
         Its3qcY3rJ3WyIEhaeIr1Vr1knY3W4XU5WTXwZK6XMOO+BWAbJsU39L2JFhc2bOKNM12
         M1egDjGQmQHrqzJ16pXug5PFTpnMYaSHgZx6YiP/8gzrtiAd+2nPny8IsV5BcgR1cmam
         JXwg==
X-Gm-Message-State: AOJu0Yz1dgCeBGGUx9VBebC6RExrLCsJDVGvykD2+ZfhXaNynSsfUesP
	MnyBUu5yE4MBv53wYz84vWyfSlOrrcfprBT+gjveexUB
X-Google-Smtp-Source: AGHT+IF9TQzvY/Bz+5SyOVx3pIE0bio0vWDcLj+dvxDchR78DiJSc34m2KqqBi12EHpjBMYFyn1rBhU7K54NvXUvIAw=
X-Received: by 2002:a05:6000:120f:b0:327:e073:d5fe with SMTP id
 e15-20020a056000120f00b00327e073d5femr16748346wrx.38.1696988823238; Tue, 10
 Oct 2023 18:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20231006172735.420566-1-eajames@linux.ibm.com>
In-Reply-To: <20231006172735.420566-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Oct 2023 12:16:51 +1030
Message-ID: <CACPK8XcwULKU16zr5CKtufMV2xqeqhWk+1Pv0VMDmMA6oXUgdQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.5 0/4] ARM: dts: aspeed: p10bmc: Add fan
 controller properties
To: Eddie James <eajames@linux.ibm.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 7 Oct 2023 at 03:58, Eddie James <eajames@linux.ibm.com> wrote:
>
> Now that the max31785 driver can parse the relevant properties, update

I can't see a patch that adds that support. Can you point it out?

Cheers,

Joel

> the device trees with the necessary properties.
>
> Eddie James (4):
>   ARM: dts: aspeed: Rainier: Add fan controller properties
>   ARM: dts: aspeed: Everest: Add fan controller properties
>   ARM: dts: aspeed: Bonnell: Add fan controller properties
>   ARM: dts: aspeed: Rainier 4U: Delete fan dual-tach properties
>
>  .../dts/aspeed/aspeed-bmc-ibm-bonnell.dts     | 14 +++++++
>  .../dts/aspeed/aspeed-bmc-ibm-everest.dts     | 28 +++++++++++++
>  .../dts/aspeed/aspeed-bmc-ibm-rainier-4u.dts  | 24 +++++++++++
>  .../dts/aspeed/aspeed-bmc-ibm-rainier.dts     | 42 +++++++++++++++++++
>  4 files changed, 108 insertions(+)
>
> --
> 2.39.3
>
