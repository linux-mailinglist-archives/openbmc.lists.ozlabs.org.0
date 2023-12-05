Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B260805377
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 12:50:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G+jRhi0f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkzP64WZCz3cVN
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 22:50:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G+jRhi0f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkzNX0WCVz3cQg
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 22:49:47 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-50be4f03b06so3295973e87.0
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 03:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701776984; x=1702381784; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AcNcuzGaQBjUBsiLWETqgO5QGNFrGHbqm/wUp0AM8dI=;
        b=G+jRhi0ftPUsEVSW0RbFdo36tJ1EptzU8uZBrYVPLwUOlQSLtiAl8liCkxDggVfALk
         B9f//Jk1JoBqmni8qmez3u9EkpCtpFWiTO5OZY1NCg3RlSPUWdJuhlYGV0oElWfP5TBH
         j9ZX1b+2UhJVpt+31FzZNnI4nyrE3T8If0m+WXzpt6GhTSnebMNtyE2EqQg4MV0KWAjv
         RAvR3d72Gz06r2c/PJ4l/eTe9aXKLRNW6yMxEBblvjKXkW31nV94g1nti85odZ6r0THx
         vuygRASStJuuSLc49EboIoK/eaUL+GTdQTslDBPzdlTcC5QtyR7qNghawQFvW/S6a8e5
         HLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701776984; x=1702381784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcNcuzGaQBjUBsiLWETqgO5QGNFrGHbqm/wUp0AM8dI=;
        b=LFKIrta/6qZyLMzNNGqbjoWincqzs8ntV2VaLuHU2DRr2/Oea35vQXvX56Cal8Zqi/
         ekqBMrVPpDo0p4fednUhs975UvJcTcZgejV8UOwKrdDfEQ17e4hvD0XpZPt6iQ5jH9zY
         tEMQkUd7tTR58YJ7ujQkmN0K3OTX4ozQQvD3R2uJAnkfGEgkUMGvZYP/o9LX5iotJU8e
         7/JLanIXDagsg5Y0sUxJ2KrGDm7kHJUgIe3LSyva2DaSfEMARcC4tN1IsGbpWw5G3E/i
         yPJ2EOjoPVgsOzTlTq9QQpk6bmgXLc2J9Wuae+F7hWAlf+BjiqRamu9x1WjZtoIA/Rtd
         a9IQ==
X-Gm-Message-State: AOJu0YyhRuBxoIpdEy30WceSCjqFyKcS3GEmEPvH3E68j8nMh5smphl0
	B+AuVnlNnMmBX/LK2QMaSz4=
X-Google-Smtp-Source: AGHT+IHG01Rbi7bi2+HqRxjF1g6Uid7DKqoIjAsfnJUvTJZdfjRyLs23pzhCbhHBaCrpogRFumVNSg==
X-Received: by 2002:a05:6512:1394:b0:50c:320:f171 with SMTP id fc20-20020a056512139400b0050c0320f171mr476503lfb.197.1701776983952;
        Tue, 05 Dec 2023 03:49:43 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id e2-20020a05651236c200b0050bf0921ac1sm792193lfs.206.2023.12.05.03.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 03:49:43 -0800 (PST)
Date: Tue, 5 Dec 2023 14:49:41 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next 05/16] net: pcs: xpcs: Move native device ID
 macro to linux/pcs/pcs-xpcs.h
Message-ID: <6zejbbv6oriaztbbgyjy6r6hycccq6rvypb5ywxf7nqx3vlq7r@na5eossdsuec>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-6-fancer.lancer@gmail.com>
 <20231205103559.9605-6-fancer.lancer@gmail.com>
 <20231205112755.3am2mazwireflpkq@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205112755.3am2mazwireflpkq@skbuf>
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

On Tue, Dec 05, 2023 at 01:27:55PM +0200, Vladimir Oltean wrote:
> On Tue, Dec 05, 2023 at 01:35:26PM +0300, Serge Semin wrote:
> > In addition to that having all supported DW XPCS device IDs defined in
> > a sinle place will improve the code maintainability and readability.
> 
> single

Got it. Thanks. Seeing there are so many comments about the log
messages I'll double check them on v2.

-Serge(y)
