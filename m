Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4AC8075F9
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 18:02:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Tz380/2r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlkGt0jPSz3cZn
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 04:02:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Tz380/2r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlkG96vyCz307y
	for <openbmc@lists.ozlabs.org>; Thu,  7 Dec 2023 04:01:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QhFNxKgCFf/61DTwc6QlhGdBbP5mcipQDmaNT85ix3s=; b=Tz380/2r18As3xEEp/1BV295ze
	s8q6PQ7Lz9wuX/MPbpIZ4DPOyXUdGTm3xgIMyML30BNkWQaNbehOn/WatOlqGvxDQPfoti+GWyw91
	pdNskVBUpept2AX+Uj8r0FW8t/3M+gtxOHr09j6V5IYWR0/ZvxR4ZLC/W8kppaIyJ7Tk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rAvH8-002EPI-TA; Wed, 06 Dec 2023 18:01:30 +0100
Date: Wed, 6 Dec 2023 18:01:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next 09/16] net: mdio: Add Synopsys DW XPCS
 management interface support
Message-ID: <15e6857a-b1d1-465a-945e-6f31edac62fb@lunn.ch>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-10-fancer.lancer@gmail.com>
 <20231205133205.3309ab91@device.home>
 <cv6oo27tqbfst3jrgtkg7bcxmeshadtzoomn2xgnzh2arz4nwy@wq5k7oygto6n>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cv6oo27tqbfst3jrgtkg7bcxmeshadtzoomn2xgnzh2arz4nwy@wq5k7oygto6n>
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Tomer Maimon <tmaimon77@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> > You shouldn't use inline in C files, only in headers.
> 
> Could you please clarify why? I failed to find such requirement in the
> coding style doc. Moreover there are multiple examples of using the
> static-inline-ers in the C files in the kernel including the net/mdio
> subsystem.

The compiler does a better job at deciding what to inline than we
humans do. If you can show the compiler is doing it wrong, then we
might accept them. But in general, netdev does not like inline in .C
file. Also, nothing in MDIO is hot path, it spends a lot of time
waiting for a slow bus. So inline is likely to just bloat the code for
no gain.

   Andrew
