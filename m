Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 219E08052B1
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 12:25:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gLgAndXk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Skyr44jG2z3cYN
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 22:25:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gLgAndXk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkyqT1yZtz3cRp
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 22:24:36 +1100 (AEDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2ca00dffc23so28948801fa.2
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 03:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701775472; x=1702380272; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zQQyxGUKk4pbCHDpcs6JlELv+pOGJjJC9lYpip2lfKM=;
        b=gLgAndXkEuHx0gfFe8ZqYlNqWqAMgO5cY5kO15IVK4SSvFDo6UYxryqAmdd9/zoEjp
         CYodcwI1orhft2Xevf/VyzaagJ+wqKUXqn6CICsLictNZ5j74za2MnGi5ddsfhDaPyZc
         AtHO5Fvp04K893EPdFDfm/6tEe4Dz4B11n77WbncyQP80JcmjQfDRIoLy/sVXZcl+8a6
         AKaZVeePlAe++fB2mguEcg9dmENGEITobrlexJ38xf+sHUpIOJ9VSjUriWiTWtcPBsiN
         cP2VJmjt+BdpSnLZI/Senik13r/eBAm6s5zipSfTW8E8xd4S2qa8RH3bkyp4/iKPFDkp
         uRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701775472; x=1702380272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQQyxGUKk4pbCHDpcs6JlELv+pOGJjJC9lYpip2lfKM=;
        b=NBhIB9bQwb06k1LanaUIPlu/6o10xGaYk7T3J9AG0UCEcD7Znza5V+/gQwVEdQ9Yvi
         HNKBGYawQwg03nSa7KBXmwWBHBukecvgkYka8mStHliphIHSL7C4k5qHNWTo2+cB5/EN
         d5VXPU7Y2rggtKuZvwRuricrOW5fvRTkKjT5uETnFyz3qKLmqnEBHU5vHrQUou5qxeWj
         QuSsecrltvdyA9YylaIBrJgS4g+UjfBV2kSOVuDu6OSkDtYJT3eSMUsRKTG6OywYklUc
         FS3091J0ZOVQDE/XkSqB5rP+t/TuR+QyAUstLuOPnVpvNmL88BfZVd5wKU2oNkgPNn0V
         N4Fg==
X-Gm-Message-State: AOJu0Yw4X2L+Bd6Hm0FkDfZ2MRdW2iWshlaBtHTeKETBqvFbJruzjnKM
	0vOP6kKoBVyuq56varPzilE=
X-Google-Smtp-Source: AGHT+IEMbJi9JfgwJmbW7rz+XhmNZMSh11Xumx4Y4u6mllkJx9Vg0PTHAe8th3MAn+PEuygze2apvA==
X-Received: by 2002:a2e:9284:0:b0:2c9:cf94:94bc with SMTP id d4-20020a2e9284000000b002c9cf9494bcmr3021288ljh.33.1701775471899;
        Tue, 05 Dec 2023 03:24:31 -0800 (PST)
Received: from skbuf ([188.27.185.68])
        by smtp.gmail.com with ESMTPSA id x12-20020a170906298c00b00a1cbb055575sm412662eje.180.2023.12.05.03.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 03:24:31 -0800 (PST)
Date: Tue, 5 Dec 2023 13:24:29 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next 01/16] net: pcs: xpcs: Drop sentinel entry from
 2500basex ifaces list
Message-ID: <20231205112429.bp6lpvj4klrfrrim@skbuf>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-2-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205103559.9605-2-fancer.lancer@gmail.com>
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

On Tue, Dec 05, 2023 at 01:35:22PM +0300, Serge Semin wrote:
> There are currently two methods (xpcs_find_compat() and
> xpcs_get_interfaces()) defined in the driver which loop over the available
> interfaces. All of them rely on the xpcs_compat.num_interfaces field value
> to get the number of interfaces. That field is initialized with the
> ARRAY_SIZE(xpcs_*_interfaces) macro function call. Thus the interface
> arrays are supposed to be filled with actual interface IDs and there is no
> need in the dummy terminating ID placed at the end of the arrays. Let's
> drop the redundant PHY_INTERFACE_MODE_MAX entry from the
> xpcs_2500basex_interfaces list and the redundant
> PHY_INTERFACE_MODE_MAX-based conditional statement from the
> xpcs_get_interfaces() method then.

It would help the readability of the commit message if you would split
it into multiple paragraphs.

> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
