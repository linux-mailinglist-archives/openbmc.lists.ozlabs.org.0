Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4003591D5D6
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2024 03:41:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EcvLGR5Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WC7zg0Ckqz3dK6
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2024 11:41:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EcvLGR5Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WC7z700wWz30TB
	for <openbmc@lists.ozlabs.org>; Mon,  1 Jul 2024 11:40:34 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5295e488248so3088332e87.2
        for <openbmc@lists.ozlabs.org>; Sun, 30 Jun 2024 18:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719798028; x=1720402828; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SwnfzGgZbXchQuvwIi7BwMqkkcPzYDSZ1lkWRl6NvOM=;
        b=EcvLGR5Y5m26I4qwyPqgvKJnRlaqzai5L4RTQ8us5cvvOq9t+CfjSiVyPR7qFKwBev
         KovsxOj3q81SLhnwYTjKO3rnCE2NHtyEEJhNXUpYnmyf8kRsnHFjSTXHslSv+vfzaFxC
         CyZIfVActgyuWmAIxKc0geQoFGKkBeYEB6AfC4xt/v5rnMidzjrzO2lLLFZgdlrn+Dgd
         C9YoqKpB7tlwMpFxIZO5LnNUdmLHbobfzcGDT+buf/TUEzTEeHERVSOv7WYQ6qa5eSXL
         WM7kega/Gur4+KTdQQT0sU0uLXWe248VDss5Qf8bHW6r73wb1eKWzcOtklCVeyz67dKj
         iFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719798028; x=1720402828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwnfzGgZbXchQuvwIi7BwMqkkcPzYDSZ1lkWRl6NvOM=;
        b=wzFy1KmuHpi6RMFBIxEPqCyp3jHO3w3Z9tg5lTW+lEnSdQD1u0FAXrCkkswVUYnXe/
         /R1832sl/ThimH1zU4R3UDC2w53i7ZTjeuJoTj1HWdNyXv8rn8NbyQ47Pal/03+WHvTD
         LC2qaA9NZtBOjL120PY6ZFqFMTyMN4bB5ZEQJQq+kgUn/bW8MjGGcBLxslgY6GmCW/WH
         WCwnaMTUCTHPrAWk78+V/Nd6XTKxFXvukNmcMrA1RqX8ufbkahzO6e+XtDPueV9yAFy4
         dubiu8s4shuZ383t7ZmhocQjuP738Z0o+yQHFISfBcBM/5n7brSgIPqT47HX0X5nMNbA
         NWLA==
X-Forwarded-Encrypted: i=1; AJvYcCWXyHexTL9B84TNSZxQ9FybqHuoNVSocnnK2XN4hy4cm1wTS+kSlzrBObrEuO7MgICcp8AkoOAvE//Xx1trH9aWxd9ea2CQxe8=
X-Gm-Message-State: AOJu0YwTS+RPMcsc6wpzKF9Y4mlNOEN7rhRm21gPKGpVhy5ewTAPLtjO
	DyfyGKPEWdmA94LJqwpvuDJmSIN6MOGiZRRQjoi9kJkgkK1Z2WjM
X-Google-Smtp-Source: AGHT+IE7kAt6EsHOnTzUdCIGnBj2h9mmrLiQhrSexUxPRaRVqV6UHVmgj5fZQR2jnaMRamWK2GFoig==
X-Received: by 2002:a05:6512:6c3:b0:52c:def3:44b with SMTP id 2adb3069b0e04-52e8268b40amr2615295e87.31.1719798027768;
        Sun, 30 Jun 2024 18:40:27 -0700 (PDT)
Received: from mobilestation ([176.213.1.81])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab0fff6sm1173823e87.81.2024.06.30.18.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 18:40:27 -0700 (PDT)
Date: Mon, 1 Jul 2024 04:40:24 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH net-next v3 06/10] dt-bindings: net: Add Synopsys DW xPCS
 bindings
Message-ID: <a2quritc5udbpebvymbbhez2e4g5qk774trpzvsmtzgd4bpc4y@ckaqnqyrkszx>
References: <20240627004142.8106-1-fancer.lancer@gmail.com>
 <20240627004142.8106-7-fancer.lancer@gmail.com>
 <20240627-hurry-gills-19a2496797f3@spud>
 <e5mqaztxz62b7jktr47mojjrz7ht5m4ou4mqsxtozpp3xba7e4@uh7v5zn2pbn2>
 <20240628221246.GA296233-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628221246.GA296233-robh@kernel.org>
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

On Fri, Jun 28, 2024 at 04:12:46PM -0600, Rob Herring wrote:
> On Thu, Jun 27, 2024 at 08:10:48PM +0300, Serge Semin wrote:
> > On Thu, Jun 27, 2024 at 04:51:22PM +0100, Conor Dooley wrote:
> > > On Thu, Jun 27, 2024 at 03:41:26AM +0300, Serge Semin wrote:
> > > > +  clocks:
> > > > +    description:
> > > > +      Both MCI and APB3 interfaces are supposed to be equipped with a clock
> > > > +      source connected via the clk_csr_i line.
> > > > +
> > > > +      PCS/PMA layer can be clocked by an internal reference clock source
> > > > +      (phyN_core_refclk) or by an externally connected (phyN_pad_refclk) clock
> > > > +      generator. Both clocks can be supplied at a time.
> > > > +    minItems: 1
> > > > +    maxItems: 3
> > > > +
> > > > +  clock-names:
> > > > +    oneOf:
> > > > +      - minItems: 1
> > > > +        items:
> > > > +          - enum: [core, pad]
> > > > +          - const: pad
> > > > +      - minItems: 1
> > > > +        items:
> > > > +          - const: pclk
> > > > +          - enum: [core, pad]
> > > > +          - const: pad
> > > 
> > 
> > > While reading this, I'm kinda struggling to map "clk_csr_i" to a clock
> > > name. Is that pclk? And why pclk if it is connected to "clk_csr_i"?
> > 
> > Right. It's "pclk". The reason of using the "pclk" name is that it has
> > turned to be a de-facto standard name in the DT-bindings for the
> > peripheral bus clock sources utilized for the CSR-space IO buses.
> > Moreover the STMMAC driver responsible for the parental DW *MAC
> > devices handling also has the "pclk" name utilized for the clk_csr_i
> > signal. So using the "pclk" name in the tightly coupled devices (MAC
> > and PCS) for the same signal seemed a good idea.
> 

> It is? That's really just the name of the bus clock for APB (Arm 
> Peripheral Bus). If there's a name that matches the docs, use that. 
> Though I'd drop 'clk_' part.

Yes, it's normally should have been utilized for APB, but as I see it
the name utilization has gone wider than to just the ARM Peripheral
bus clock. The DW MAC clock-names DT-property bindings is just one
example of that.

Anyway. Ok. I'll convert the name to "csr". (I'll drop the _i suffix
too since it's obvious that the clock signal is the connected to the
device input pin.)

-Serge(y)

> 
> Rob
