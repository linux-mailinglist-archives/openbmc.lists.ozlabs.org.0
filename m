Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E6880535D
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 12:49:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EOUEaOjW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkzMg29F4z3cb1
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 22:49:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EOUEaOjW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkzM52b8pz3cQg
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 22:48:31 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50bf8843a6fso1921803e87.0
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 03:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701776908; x=1702381708; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iMgwW6vx/jK9Cw7fgT+rzd5j+aMjeAnF9YT/yUvZ84M=;
        b=EOUEaOjWZR+EqCtoOdQOLQ/J956sWjZrWneVG69H7Vrjr23bJYRRzVSPk79hk3BijY
         Abhb8ZxGEg5xrCM/b0OEOgH06rHa6qI8PW1dpA9yVeP2OdhuJevBpE8maw5gH5PnOyAR
         ibYRRM/u0/MxtKwKJALPoYoqwU2/ONkg9npzSBta5npcn93JQcUfahr7/KKBD/7i3eCv
         tW60LdqWRk25E/RPtCI50ToOrLIQUAuzqAj4BIIIPdtmbsMXnRosqc3p6TR7A9BLzizA
         E/pBMuRLdw7TV+hmsfH0vrDm2TJU0rMoyqDW6q6pRFImRPembNMO1phrKtc8HSiWygbQ
         YArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701776908; x=1702381708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMgwW6vx/jK9Cw7fgT+rzd5j+aMjeAnF9YT/yUvZ84M=;
        b=VspbSlhA9saOX+VhAgW+wX3Do8AuXalEUD5g7DoUeFQcYpYFBYig3jbJbOwHp4yFN1
         0jj6BBqKgYbMxZzpXuzDkMaSFAv0xSB/ur0ij9h3tW3tMz8IrqvM0Mp4cUcxAhGpzHuG
         FDg/LHkK2uYEXfw1YOnC4I0qxH5fbtQ7Gh4/5adnAu2ldS/ei6J8hqsya4vpLlTImxuP
         AXdslO0jv3tY94VR6jU/zVGsdNjQkywe37vOQjIoVdMLAibXwd1VJCyQVXRke7GFBS1H
         MWy3rwJR5CflpdW7otu3kk/V9QF2+k1NzVUwNXMmza6mMSc5ZEHuBKI6QmDaUXOVZFfO
         3EVQ==
X-Gm-Message-State: AOJu0YwW5nsiqWlKIPZMPNp4rp449267uVI74QfN4/0KDin5mEMViCq+
	BaYZwf6JVXduzzZ4+qDhr84=
X-Google-Smtp-Source: AGHT+IE4QS2OUuOuA8w6IIfWCOOlZexYeQ2PWBcGw2WPfl/X1e0YgNE9s7aTbsrFGohK/qiG1pBTFg==
X-Received: by 2002:a05:6512:230a:b0:50b:e92c:de18 with SMTP id o10-20020a056512230a00b0050be92cde18mr925702lfu.22.1701776907951;
        Tue, 05 Dec 2023 03:48:27 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id q13-20020a19430d000000b0050be813bf9dsm1000150lfa.183.2023.12.05.03.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 03:48:27 -0800 (PST)
Date: Tue, 5 Dec 2023 14:48:25 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next 05/16] net: pcs: xpcs: Move native device ID
 macro to linux/pcs/pcs-xpcs.h
Message-ID: <syr55e2c7izap6fc2yzmz6gyzcybmmxe3dyjoxencb2tylss2p@tpu2pfh33ked>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-6-fancer.lancer@gmail.com>
 <ZW7/TrtSols1igy/@shell.armlinux.org.uk>
 <bas6l42vk2zzrwo22ss7fuganf4ekvhtvkb32duydjise7ui3o@o4f3rbcpokur>
 <ZW8ICvzwIHJhoV9U@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZW8ICvzwIHJhoV9U@shell.armlinux.org.uk>
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

On Tue, Dec 05, 2023 at 11:22:50AM +0000, Russell King (Oracle) wrote:
> On Tue, Dec 05, 2023 at 02:14:34PM +0300, Serge Semin wrote:
> > On Tue, Dec 05, 2023 at 10:45:34AM +0000, Russell King (Oracle) wrote:
> > > On Tue, Dec 05, 2023 at 01:35:26PM +0300, Serge Semin wrote:
> > > > Generic MDIO-device driver will support setting a custom device ID for the
> > > > particular MDIO-device.
> > > 
> > > Why future tense? I don't see anything later in this patch set adding
> > > this.
> > 
> > After the next patch is applied
> > [PATCH net-next 10/16] net: pcs: xpcs: Add generic DW XPCS MDIO-device support
> > the DW XPCS driver _will_ support setting custom IDs based on the
> > platform data and the DT compatibles.
> 

> What is confusing is that the sentence makes it sound like it's some
> generic driver that can be used for any PCS, whereas in reality it is
> _this_ XPCS driver which is not generic.
> 
> "This driver will support setting a custom device ID in a future patch."
> or explicitly state the summary line of the patch concerned so one can
> refer to it. Future references are difficult to find whether they're in
> email and especially once they're merged into git.

Ok. I'll convert the patch log to be less confusing. As I already said
to Vladimir writing sometimes overcomplicated messages my eternal
problem.

> 
> > It can be used for instance to
> > fix the already available SJ1105 and SJ1110 MDIO bus implementations,
> > so instead of substituting the XPCS IDs on the PHYSID CSR reads the
> > driver could just pass the device ID and PMA ID via the device
> > platform data.
> > 
> > If my patch log text looks unclear anyway, just say so. I'll change it
> > accordingly. I guess it would be enough to say that moving is required
> > just to collect all the IDs in a single place.
> 

> You need to adjust your attitude - I did exactly that. There was
> something which I didn't understand, so I raised the issue. Sorry
> for spotting a problem, but do you always get arsey when a reviewer
> picks up on something wrong? If that's your attitude, then for this
> entire series: NAK.

I'm sorry if what I wrote sounded like I was arsey. I didn't mean it
at all, really. By this sentence:

> I guess it would be enough to say that moving is required
> just to collect all the IDs in a single place.

I meant that _I_ should have just stated in the log message that
moving was required to collect all the IDs in a single place. The
rest of the text was redundant and caused confusion what you pointed
out to.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
