Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 125FC80538A
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 12:53:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UIf5u+xV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkzSX3Zv0z3cZx
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 22:53:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UIf5u+xV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkzRx14frz3cNt
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 22:52:44 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a1975fe7befso601336166b.2
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 03:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701777157; x=1702381957; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yQnio+BjHch7uekOs0EbRaR6+xPg48w0mlLLI/zKaaU=;
        b=UIf5u+xV/MZTGxK3hQG0PmHuNhHxtSZ7w7EAUEQ3RilfG7rx9BHC6kMER2ljI5II8U
         YWUQhJ4ysxA0xYorIgxZDNJtI+LyPDchZAGYBSCq9KV4L9jLXTuXTiBiaJsECXLzyWkf
         XQ+ULm9HYQhIu1zC/CIo57nuZ/UBqRTP8sDmUZ7ozYLrTEae0zmgA0eLNUgKzta+j8SZ
         DnmV+JfDSmAD7JeX8AuoV+px8bUHJ8rGaiaawyEMRdyCHXXHueiNfuS3QmlmumD7uhXI
         ipD0ioe7Y0NxP+GZo6bC8JiJaoCG7t/EFF0jUTjWPjah+h9AaJHsbTglPYztTcCtdFIg
         mSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701777157; x=1702381957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQnio+BjHch7uekOs0EbRaR6+xPg48w0mlLLI/zKaaU=;
        b=e150WPKoTlIaHOVfDBB+JLTQbWXYlGUxRlGXNuRQJsb6rZ+0HbrUVWnWuo9GOq/VRG
         5lE1J0LQQ4CiOt3MeVOkdInqixo+6qDJX2zeEGOv1kI+Osvk3H+nD0bTkGbDP2U5szjM
         tpIs7paGp4RsV1o3tm6vSAm/bg9WOJMSsGNXWtSAjSiNSLMqho/EHN/pqeF1zaIXoNu+
         wp78Kyt9HfgAaCXfkOk19Kfqg6Lh7icgHoGwOCRxFt/1EzyMGNlVrC3+FG6IPTLrQpxS
         cdIqwlbYOEwp897JSq8+D59g5GkU1+rz6YB5OzLd9i7mjx2heuV3mVLUg+rTvN3XabDY
         opJA==
X-Gm-Message-State: AOJu0YzNqb0Q5WXoxpYI7z2jqIdu6iqJ+R7jZuawDLxup6QGOZEOMwsL
	MtWxK6h3auHCWm5ZVq+kErE=
X-Google-Smtp-Source: AGHT+IFbcUHHGMa0y7mPKTyHnJVqbuoOrcBU5Fgp7HSueg3Asjnj4OKHJ4FateR0JcHkUAKp1ewXJQ==
X-Received: by 2002:a17:907:8c8:b0:a0e:d93a:3202 with SMTP id zu8-20020a17090708c800b00a0ed93a3202mr323045ejb.4.1701777157222;
        Tue, 05 Dec 2023 03:52:37 -0800 (PST)
Received: from skbuf ([188.27.185.68])
        by smtp.gmail.com with ESMTPSA id x12-20020a170906298c00b00a1cbb055575sm451602eje.180.2023.12.05.03.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 03:52:37 -0800 (PST)
Date: Tue, 5 Dec 2023 13:52:34 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next 06/16] net: pcs: xpcs: Avoid creating dummy XPCS
 MDIO device
Message-ID: <20231205115234.7ntjvymurot5nnak@skbuf>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-7-fancer.lancer@gmail.com>
 <20231205103559.9605-7-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205103559.9605-7-fancer.lancer@gmail.com>
 <20231205103559.9605-7-fancer.lancer@gmail.com>
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

On Tue, Dec 05, 2023 at 01:35:27PM +0300, Serge Semin wrote:
> If the DW XPCS MDIO devices are either left unmasked for being auto-probed
> or explicitly registered in the MDIO subsystem by means of the
> mdiobus_register_board_info() method

mdiobus_register_board_info() has exactly one caller, and that is
dsa_loop. I don't understand the relevance of it w.r.t. Synopsys XPCS.
I'm reading the patches in order from the beginning.

> there is no point in creating the dummy MDIO device instance in order

Why dummy? There's nothing dummy about the mdio_device. It's how the PCS
code accesses the hardware.

> to get the DW XPCS handler since the MDIO core subsystem will create
> the device during the MDIO bus registration procedure.

It won't, though? Unless someone is using mdiobus_register_board_info()
possibly, but who does that?

> All what needs to be done is to just reuse the MDIO-device instance
> available in the mii_bus.mdio_map array (using some getter for it
> would look better though). It shall prevent the XPCS devices been
> accessed over several MDIO-device instances.
> 
> Note since the MDIO-device instance might be retrieved from the MDIO-bus
> map array its reference counter shall be increased. If the MDIO-device
> instance is created in the xpcs_create_mdiodev() method its reference
> counter will be already increased. So there is no point in toggling the
> reference counter in the xpcs_create() function. Just drop it from there.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---

Sorry, because the commit log lost me at the "context presentation" stage,
I failed to understand the "what"s and the "why"s.

Are you basically trying to add xpcs support on top of an mdio_device
where the mdio_device_create() call was made externally to the xpcs code,
through mdiobus_register_board_info() and mdiobus_setup_mdiodev_from_board_info()?
