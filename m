Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A40598051CB
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 12:15:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NPyvE8RC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Skycq0xKrz3cVS
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 22:15:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NPyvE8RC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skyc05mfVz3cTl
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 22:14:40 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50bf2d9b3fdso3068233e87.3
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 03:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701774877; x=1702379677; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zN4p9mMSLweMOX963KYS5AfN9Bd0ihIcJsLmbUm7JFg=;
        b=NPyvE8RCHOOBdLxDbo2dBfhjPTH3wXFr7CSXAfre7K+zftOamUmV44S2YwdQi74c2H
         WD+nQ1YFPToYLlPD6Kyahk1lbP4giVXjUH6hRz1yo4DKYgkz9Ty1E0lQTFX92P3j/Kot
         6npmyM0/D10u5ZXhfKqLpo5ucceZddWa7p/yKzoEcE9DnOxJGM+ocQ5sr3n/hjRk95Gh
         KBT3hlK0yC2app0FlwebczGvSM4hfIK4UTX5jSqm2JwvpjB09bsT3s29r9bLDkwkCteG
         MfuJuGnjl1Dgbe5adMlCSIxBEGxlbIXc/CmR0QwH6Zrv7j/098jTCdEu3998gk/omzjf
         6+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701774877; x=1702379677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zN4p9mMSLweMOX963KYS5AfN9Bd0ihIcJsLmbUm7JFg=;
        b=hhrqc/URrBdAoYfiCJ8XpErRxRhVtsKrHboy0YiTYWDy6NxjXU0FckyBNAsziE7d4/
         8BwGqWzY1Xu5qnCjlRfZIimleyrXoPxIN1l14bGxcQI/VPImBB4amFDa0srLe1VAQgg3
         xHTBxzFlo5iGDHtBe1XWjYf33kM7AZ3OE521kRnXTippJMslzyFpSCX/rG50ohN4hdK0
         aIHIv3K7kkI6PwGh+mC/TfUhmSt7jYum4j9wxVZuDvLyZIacjtm+2pLHZIxRMl7kv1Bv
         gq9qLnaINkq91kvXV/vGIhBVsla8ALFG2UznyZjKvulEz4WB6WOZpUua8TatOqY/jQwb
         4bNw==
X-Gm-Message-State: AOJu0Yy/iiyWkR1U+H3OzkIlnhz4uOGSd2YrewujD6DgG3lriVXMcZRI
	I190sJ1xVhT1eXGkIO9FVbE=
X-Google-Smtp-Source: AGHT+IFO6YQ2N6cG11AmaArtSFV31rZG99Hh99XcCX4X/mpgvCD31u2wtEom9rvvimoggkIAkJoWDQ==
X-Received: by 2002:a05:6512:3082:b0:50c:aa5:1214 with SMTP id z2-20020a056512308200b0050c0aa51214mr400277lfd.38.1701774876689;
        Tue, 05 Dec 2023 03:14:36 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id z28-20020a19505c000000b0050bfe37d283sm358069lfj.262.2023.12.05.03.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 03:14:36 -0800 (PST)
Date: Tue, 5 Dec 2023 14:14:34 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next 05/16] net: pcs: xpcs: Move native device ID
 macro to linux/pcs/pcs-xpcs.h
Message-ID: <bas6l42vk2zzrwo22ss7fuganf4ekvhtvkb32duydjise7ui3o@o4f3rbcpokur>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-6-fancer.lancer@gmail.com>
 <ZW7/TrtSols1igy/@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZW7/TrtSols1igy/@shell.armlinux.org.uk>
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Tomer Maimon <tmaimon77@gmail.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Dec 05, 2023 at 10:45:34AM +0000, Russell King (Oracle) wrote:
> On Tue, Dec 05, 2023 at 01:35:26PM +0300, Serge Semin wrote:
> > Generic MDIO-device driver will support setting a custom device ID for the
> > particular MDIO-device.
> 
> Why future tense? I don't see anything later in this patch set adding
> this.

After the next patch is applied
[PATCH net-next 10/16] net: pcs: xpcs: Add generic DW XPCS MDIO-device support
the DW XPCS driver _will_ support setting custom IDs based on the
platform data and the DT compatibles. It can be used for instance to
fix the already available SJ1105 and SJ1110 MDIO bus implementations,
so instead of substituting the XPCS IDs on the PHYSID CSR reads the
driver could just pass the device ID and PMA ID via the device
platform data.

If my patch log text looks unclear anyway, just say so. I'll change it
accordingly. I guess it would be enough to say that moving is required
just to collect all the IDs in a single place.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
