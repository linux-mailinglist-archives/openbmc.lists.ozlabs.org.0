Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAE08052D3
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 12:28:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MajNU0o6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Skyvy4T9wz3cTs
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 22:28:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MajNU0o6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkyvP62Y3z30gH
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 22:28:01 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50bf32c0140so2690365e87.1
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 03:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701775678; x=1702380478; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/v7mvN9deEkGkoO3uLhdgRvmngCCOUew4NWi2nI998Y=;
        b=MajNU0o6jZ05e0i8xPByXVFLaeKxMvIBGc8EYOGRpRGTJWDwATbWq4NuV7vyXLUckF
         eaw+8UQcDWlei3ak4G4LJGwLR/U4ePPMbaxl2CGXgPKPc0k8+216bAX7DPIyHIK2pwLX
         wYs/mi5H8SpyhkCfxRez2qg9NMKT8khdZR+1zWwMCzUIM1/YZXPO3o/70fWdCBWhZjJ+
         kvTD3bfDNLYBd4y5R34MbODNCYFd6tVLnTEl/tLiqYnGk4StNZ3+461KIS7BTKm2Iv3B
         yvXUZ7Cl4bfEuiala346jbjauVgf+u49aMTe+29XB5bsWjWCsxtxQsvq8/bWyshX3RaA
         xicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701775678; x=1702380478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/v7mvN9deEkGkoO3uLhdgRvmngCCOUew4NWi2nI998Y=;
        b=h3n+NO3hM3eaa6ns/8Ood96gr775vKukxTegJNGZdoOKiSwyRwUC6uDA9DEtuQMC3r
         V1K4syF7ju2q3aCvDy6P9vdCeRjcIBvq4YiiYH8VzI36GEcnWAwKm8tolaeLHKNHvlUN
         oHLDFSAcSyO1JYNz+RdHbYrLpz1v/MUVBQPg89d/tWLroTk1T8yISi0Rg1iMB/IXGqAl
         NUT3Y9jgP9GeEChdKwRqpnjQdhiLVDdC2AMLLsJij2i79KnJxta+dC+ccuPnM1Y5k0qX
         hhssslBoGIU0IMP9+mDa9GHuaDsUrhDY5pAxT2KXb2g+AdsQHqrHP/OY4RG417YCtcRv
         R/Tg==
X-Gm-Message-State: AOJu0YxzyXUIFBQGx3bqdZgfI0SB2DfxMM0/j3Q33YE0aCJ6gz2QkHUb
	btlQ4Q2Ht8LczNZ/JDOhQJU=
X-Google-Smtp-Source: AGHT+IFe2lA1Mf/Iiur7xxZp+MD/kz1MnNPCSfxB6taRVzZdr7Y41r+BOmqbXfAuO7Wa25P9mapKFw==
X-Received: by 2002:a05:6512:239e:b0:50b:c30b:813a with SMTP id c30-20020a056512239e00b0050bc30b813amr4383751lfv.53.1701775678111;
        Tue, 05 Dec 2023 03:27:58 -0800 (PST)
Received: from skbuf ([188.27.185.68])
        by smtp.gmail.com with ESMTPSA id cf6-20020a170906b2c600b00a1937153bddsm5951892ejb.20.2023.12.05.03.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 03:27:57 -0800 (PST)
Date: Tue, 5 Dec 2023 13:27:55 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next 05/16] net: pcs: xpcs: Move native device ID
 macro to linux/pcs/pcs-xpcs.h
Message-ID: <20231205112755.3am2mazwireflpkq@skbuf>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-6-fancer.lancer@gmail.com>
 <20231205103559.9605-6-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205103559.9605-6-fancer.lancer@gmail.com>
 <20231205103559.9605-6-fancer.lancer@gmail.com>
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Tomer Maimon <tmaimon77@gmail.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Dec 05, 2023 at 01:35:26PM +0300, Serge Semin wrote:
> In addition to that having all supported DW XPCS device IDs defined in
> a sinle place will improve the code maintainability and readability.

single
