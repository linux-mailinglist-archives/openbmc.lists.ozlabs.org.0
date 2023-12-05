Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3C2805406
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 13:24:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UYMHE4IP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sl07x4RwJz3cbQ
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 23:23:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UYMHE4IP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sl07J6KG6z30h0
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 23:23:23 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a1c7d8f89a5so67225266b.2
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 04:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701778999; x=1702383799; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AMhBj0PFcNsp7ddu4+x1EUxsSq8BTDuggzzUZ8nA8Vo=;
        b=UYMHE4IPRlJkT7L7Mm6n+lFAbfQbMcHiclVhvqnqTWUvVfs9L+A13aKo2rjiPHlYNh
         TJe7uJ2pxoccLf6mIlyvBMttoezWVP3IGILH7APQwgkXybWhuNilQRroyn+Xu57U/RBT
         1/GKDTPjtDrGfurh9inQ4vHVumS5zoIFf36byjoW3iJr5z4/bQulbLPlJpLlA76+rfAK
         zlDCMYJgA1SACIpdWMxkBbXI6MsQU03PCqnvpI/YJlSzpyLko2wtum3bPxEffrx+vYzy
         62/73ueYsSs8gCjkPZug3QbqtF1KIG9QuLAdOit1DWj5BDxv1KUgbty9/8lPfhGa4DJ/
         shxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701778999; x=1702383799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMhBj0PFcNsp7ddu4+x1EUxsSq8BTDuggzzUZ8nA8Vo=;
        b=bSmPUM7mZHurz6ScJ5XJ2kM/Vmi4XiS0Q3W4HPZ1PZ6LEq68yLLPTtfMPgEG6eXDO1
         tS9UNHCSnj40uUbkLrZTTZatDM+NBcC/gElv3xJk84iSHmqpE7CMJp9DyjS1D48LLrkj
         8WhmGqPSUE9RIgYJeXG+UJ+YvMMFNqdpjQW9JzvIAu02ovPRMOjsN1pYQB8iFrAwXlIz
         NkqTETKJv0PunQcZ0U/dxNuSYcqaxaYerNyIvpzA+2iGiVMl8OjgWctd+nvhRTXod3fh
         gV5g3NZFSzJkiXz8VvTAj1nDKFQ15jnRsi1iQbV9ZVV1R46mXHghy1+ooYXJiuHxZSza
         PYRQ==
X-Gm-Message-State: AOJu0Yy0oA+VdBUo7CtbSU7a8D5t/I3aBUFpaIlxY28DhgnEiN/YJDYx
	iZpWNFHULMj781wyugdfRqs=
X-Google-Smtp-Source: AGHT+IHXa16mYQRzXdXsaQ0F8tsGp0lBaqOkdzuQ8VVSVqrPVczhzIUkL1oJDasQLcddWAUvhLTuAA==
X-Received: by 2002:a17:906:3f5c:b0:a19:a1ba:da6a with SMTP id f28-20020a1709063f5c00b00a19a1bada6amr3859595ejj.145.1701778998985;
        Tue, 05 Dec 2023 04:23:18 -0800 (PST)
Received: from skbuf ([188.27.185.68])
        by smtp.gmail.com with ESMTPSA id k11-20020a170906128b00b009ff8f199f21sm6726467ejb.19.2023.12.05.04.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 04:23:18 -0800 (PST)
Date: Tue, 5 Dec 2023 14:23:16 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next 10/16] net: pcs: xpcs: Add generic DW XPCS
 MDIO-device support
Message-ID: <20231205122316.ihhpklv222f5giz3@skbuf>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-11-fancer.lancer@gmail.com>
 <20231205111351.xjjuwpbf7kwg3vuh@skbuf>
 <uivunnjv5vi3w3fkc5w2f4lem5bingrgajgjfsu2ih7fuhz6hd@3naeubr5spak>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <uivunnjv5vi3w3fkc5w2f4lem5bingrgajgjfsu2ih7fuhz6hd@3naeubr5spak>
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

On Tue, Dec 05, 2023 at 02:35:46PM +0300, Serge Semin wrote:
> Omg, thank you very much for testing the series straight away and
> sorry for the immediate trouble it caused. I'll need some more time
> for investigation. I'll get back to this topic a bit later on this
> week.

Don't worry, I got suspicious when I was CCed to review only a one-line
change in patch 11/16. It's never about that one line, is it?)

Anyway, the NULL dev->p is a symptom of device_add() not having been
called, most likely from mdio_device_register().

I'll be honest and say that I still don't quite understand what you're
trying to achieve. You're trying to bind the hardcoded mdio_devices
created by xpcs_create() to a driver? That was attempted a while ago by
Sean Anderson with the Lynx PCS. Are you aware of the fact that even in
the good case in which binding the driver actually works, the user can
then come along and unbind it from the PCS device, and phylink isn't
prepared to handle that, so it will crash the kernel upon the next
phylink_pcs call?

The pcs-rzn1-miic.c driver puts a device_link to the MAC to at least
tear down the whole thing when the PCS is unbound, which is saner than
crashing the kernel. I don't see the equivalent protection mechanism here?

Can't the xpcs continue to live without a bound driver? Having a
compatible string in the OF description is perfectly fine though,
and should absolutely not preclude that.
