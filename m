Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A7480F05E
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 16:27:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T0VADPLo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqMsv4n1zz3bw2
	for <lists+openbmc@lfdr.de>; Wed, 13 Dec 2023 02:26:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T0VADPLo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqMsJ6838z2ytm
	for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2023 02:26:27 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c9fe0b5b28so74995131fa.1
        for <openbmc@lists.ozlabs.org>; Tue, 12 Dec 2023 07:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702394781; x=1702999581; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RzfykjqVsJboNXe+GyM6OYXbP3W5WNnJ1aGISEQJa3Q=;
        b=T0VADPLoEDUDd+scJ+LsAdrsmuVxQBfrG45cadqo1CKTodlCAquONn9y7h9W1w7dHN
         iTF6ATLqemI+tYAbFI3j6KgPrqlwrPneiym/cm8JDJvqgYX8XBjeiElVkkPSyHyX9Den
         QuIrC+Ug1XERXLdEpPkhC8nTqMPzfB6IRdk9co8aYPIcFv4k7Mnf70/NvOyzVvA/muNh
         DzSDWF1PeRqmcQ1grisH4U0l9f/7o9PQVSy3eM6RnqdaTqL+nsp5uz8n2c7yx85y++ug
         dZtvmd50ME06owYz1ezbExaeTh9GVPWJJ1pt9f7LVt/SvYBF0pIx8MajxMck9Q2f3uBD
         Rr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702394781; x=1702999581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzfykjqVsJboNXe+GyM6OYXbP3W5WNnJ1aGISEQJa3Q=;
        b=FuzU0KfK5OknqZxV8k/rp9SEA2ZyqlIjnwdBIAaJFD8yFoe74c3pE+EVGXFNPbdsDk
         ZDUSZ+u+psXNr4kV18FuJBLgGRGXXH5Og4mAwMkV50DH4F8yuJ5upNQGPEzVADRPsIk6
         Qbw9ZwT3unlM0PYjKhfno16MhW9ubkzJ3w+Zv1dcA5QL+bQ8tV+nFCcQyrlEf+U27Idu
         cczGQRGFa8iw3pbr793XIfJf1BYygYu+HvRUgI31CCG7Y6bN+IQutB9WcZszwaTFw2+y
         JF2XPfXFjst6kj6UgN65IGH/YkTcv70oIEZ58eU6ksoM7PZPEp9J3gKdBoEC1iHvzx3T
         Fnbw==
X-Gm-Message-State: AOJu0YwerJuDEAEPwawjeMO2HpXbsMfkyIqUmRmLM0g/FvqBxByRcNmO
	9b72OZaS2tfLgVM/zg+Fmmo=
X-Google-Smtp-Source: AGHT+IFitWMolf9+MGbv8J/HUGRQFIiJq5Iv39LqC9IhSSbGgybQNYWznOea4pt3phQe2oNaB8bqQQ==
X-Received: by 2002:a2e:9ec4:0:b0:2ca:752:24a3 with SMTP id h4-20020a2e9ec4000000b002ca075224a3mr2851858ljk.22.1702394780915;
        Tue, 12 Dec 2023 07:26:20 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id z18-20020a2ebe12000000b002c9f59f1748sm1537789ljq.7.2023.12.12.07.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 07:26:20 -0800 (PST)
Date: Tue, 12 Dec 2023 18:26:16 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next 06/16] net: pcs: xpcs: Avoid creating dummy XPCS
 MDIO device
Message-ID: <kagwzutwnbpiyc7mmtq7ka3vhffw4fejuti5vepnla74rocruh@tryn6lxhwbjz>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-7-fancer.lancer@gmail.com>
 <ZW8pxM3RvyHJTwqH@shell.armlinux.org.uk>
 <ZW85iBGAAf5RAsN1@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZW85iBGAAf5RAsN1@shell.armlinux.org.uk>
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

On Tue, Dec 05, 2023 at 02:54:00PM +0000, Russell King (Oracle) wrote:
> On Tue, Dec 05, 2023 at 01:46:44PM +0000, Russell King (Oracle) wrote:
> > For your use case, it would be:
> > 
> > 	mdiodev = bus->mdio_map[addr];
> 
> By the way, this should be:
> 
> 	mdiodev = mdiobus_find_device(bus, addr);
> 	if (!mdiodev)
> 		return ERR_PTR(-ENODEV);
> 
> to avoid a layering violation.

I would have used in the first place if it was externally visible, but
it's defined as static. Do you suggest to make it global or ...

> At some point, we should implement
> mdiobus_get_mdiodev() which also deals with the refcount.

... create mdiobus_get_mdiodev() instead?

* Note in the commit message I mentioned that having a getter would be
* better than directly touching the mii_bus instance guts.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
