Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D5591C8F8
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2024 00:13:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=URvGmxRW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9qSt4BYYz3cm7
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2024 08:13:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=URvGmxRW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9qSL1nm7z30Vl
	for <openbmc@lists.ozlabs.org>; Sat, 29 Jun 2024 08:12:50 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 72C48621B3;
	Fri, 28 Jun 2024 22:12:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BD8C116B1;
	Fri, 28 Jun 2024 22:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719612769;
	bh=AyisUTH6Ol1mb1jrlE0aMiW6gf83ZXx6hkss3LG5i/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=URvGmxRWPzOuC2Z1GL011/xd9Zr8GFj7+4PjTus12MhMkaPcgoJabZK7FKyAtvnxL
	 knElPOgi15X4njF8T++B5ljJJkzH/FUiaXUyOGYCVOIS0gY8U9KOKIv9Qm1y225JNZ
	 35htzufXm7da+xXZcroUOpkdfOnvreY5oSJZjRoPjutvre9KLXxdVPN5bP1IKQaubV
	 v9Cr3yPokQR0zo5ycCb9f+yfH4CuHcqSQo/Tlxq5tlJ6icsDB+h/5hk62f5SYDc8X7
	 7SHStzB2rcJKwemgvPqWoNSUZ/P618druhC0UK04RTJ6+JBQU6T5EDaez33cQt7Hcl
	 j7SGDlML3bk8g==
Date: Fri, 28 Jun 2024 16:12:46 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next v3 06/10] dt-bindings: net: Add Synopsys DW xPCS
 bindings
Message-ID: <20240628221246.GA296233-robh@kernel.org>
References: <20240627004142.8106-1-fancer.lancer@gmail.com>
 <20240627004142.8106-7-fancer.lancer@gmail.com>
 <20240627-hurry-gills-19a2496797f3@spud>
 <e5mqaztxz62b7jktr47mojjrz7ht5m4ou4mqsxtozpp3xba7e4@uh7v5zn2pbn2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5mqaztxz62b7jktr47mojjrz7ht5m4ou4mqsxtozpp3xba7e4@uh7v5zn2pbn2>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>, Florian Fainelli <f.fainelli@gmail.com>, openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Jose Abreu <joabreu@synopsys.com>, Abhishek Chauhan <quic_abchauha@quicinc.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 27, 2024 at 08:10:48PM +0300, Serge Semin wrote:
> On Thu, Jun 27, 2024 at 04:51:22PM +0100, Conor Dooley wrote:
> > On Thu, Jun 27, 2024 at 03:41:26AM +0300, Serge Semin wrote:
> > > +  clocks:
> > > +    description:
> > > +      Both MCI and APB3 interfaces are supposed to be equipped with a clock
> > > +      source connected via the clk_csr_i line.
> > > +
> > > +      PCS/PMA layer can be clocked by an internal reference clock source
> > > +      (phyN_core_refclk) or by an externally connected (phyN_pad_refclk) clock
> > > +      generator. Both clocks can be supplied at a time.
> > > +    minItems: 1
> > > +    maxItems: 3
> > > +
> > > +  clock-names:
> > > +    oneOf:
> > > +      - minItems: 1
> > > +        items:
> > > +          - enum: [core, pad]
> > > +          - const: pad
> > > +      - minItems: 1
> > > +        items:
> > > +          - const: pclk
> > > +          - enum: [core, pad]
> > > +          - const: pad
> > 
> 
> > While reading this, I'm kinda struggling to map "clk_csr_i" to a clock
> > name. Is that pclk? And why pclk if it is connected to "clk_csr_i"?
> 
> Right. It's "pclk". The reason of using the "pclk" name is that it has
> turned to be a de-facto standard name in the DT-bindings for the
> peripheral bus clock sources utilized for the CSR-space IO buses.
> Moreover the STMMAC driver responsible for the parental DW *MAC
> devices handling also has the "pclk" name utilized for the clk_csr_i
> signal. So using the "pclk" name in the tightly coupled devices (MAC
> and PCS) for the same signal seemed a good idea.

It is? That's really just the name of the bus clock for APB (Arm 
Peripheral Bus). If there's a name that matches the docs, use that. 
Though I'd drop 'clk_' part.

Rob
