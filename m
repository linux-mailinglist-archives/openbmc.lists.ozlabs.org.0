Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3274691C474
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 19:07:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IPpvj09Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9hgX3G54z3d2x
	for <lists+openbmc@lfdr.de>; Sat, 29 Jun 2024 03:07:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IPpvj09Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9hg06KTfz3cWf
	for <openbmc@lists.ozlabs.org>; Sat, 29 Jun 2024 03:06:35 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2ec002caf3eso13706131fa.1
        for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2024 10:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719594385; x=1720199185; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwOwymiTFXK5bpxKsm90XNAEfYuUZk1CldR/MN3iO+A=;
        b=IPpvj09ZGxKdMjRf+XZUNQsth1SDGjNCeJdwkp0F0faM1COY7B+S5ADqIPBkFhFz/o
         3swsPgwrsCOGz/PYc+xtDO5CmhgFzCoaM2/0UNcwwwLAGcmE0Aqy3lvFyo2tioxWH+3y
         1kCFHo3SWE+2+cBarF9kXBIqi3kC73uI1TVSBSohLKSjdJ3FJVGoFrEML/ji/6NgV77c
         806cVR/tIBhjpIIbEzZf+p11boFfU4eBVJlBakvj4uo7Uh9LS7ynKfFom+IT9H33dHUF
         nQDOJiK6ho8YNoh5es1SRcVEtQYlcmqOMiC1+ySHaLEPiTVjb+U/JnhsxGCatwleWm9t
         V0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719594385; x=1720199185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZwOwymiTFXK5bpxKsm90XNAEfYuUZk1CldR/MN3iO+A=;
        b=erBuArdq9tEcguxMFGl58omcp1xhXbqnxP75OxPQtaULfKCqci0x9kGLP3u19QD006
         Kor+WW25vZLHpgcsEBDX4cFRATpbCRZyNp2D1dSc+KSdmQHv1UtXYOVzZK6epM3dDsW0
         aMH3PsbSP0iwkLodzBv+QedNS/0cV3RYRp4/dr6Abwsc+msvkQzbdCBv1iJMjrVHaaRb
         nHNvuUDUPgiczTG5X7S106XqVmVkuAAnbO5yEVTlA0ooWpgdn0kTgp59NYSMeyrATxDi
         xgs+IsQ3JWoxXz1d3Rk1tnRMIObCO8ejCY6ShHwXwP3SqVpvgiW0xB9kMA7Ft0GLJziR
         ll8w==
X-Forwarded-Encrypted: i=1; AJvYcCVOmPhItgcbLrGt7AHKkq+6pTI5U2MnjCiCig0OeZbJhuxSgV5k7ko60eysOalv7Qhk2My/IFDldSybJvoh2DJp7xrLtNheiuI=
X-Gm-Message-State: AOJu0YxTCHonOi5t1SHyVvOjSc0f71B+y24oCGZxcOvD4/M60sUH60IK
	pY4U84itCXlavMPytiw2JQhPn32O7WT1Bqe8iEMy16cCyrS87E3y
X-Google-Smtp-Source: AGHT+IHZHBnsfVjk3W/G/V45o0piL4CHZadYb28IWJPLziXyOpgdnn/L+zGnCB+cQ2zlzrmqkvnoiA==
X-Received: by 2002:a2e:7211:0:b0:2ea:e74c:40a2 with SMTP id 38308e7fff4ca-2ec5b2d5b95mr125913701fa.20.1719594384850;
        Fri, 28 Jun 2024 10:06:24 -0700 (PDT)
Received: from mobilestation ([213.79.110.82])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee5168cf89sm3362251fa.115.2024.06.28.10.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 10:06:24 -0700 (PDT)
Date: Fri, 28 Jun 2024 20:06:21 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH net-next v3 06/10] dt-bindings: net: Add Synopsys DW xPCS
 bindings
Message-ID: <a234uiz4gtjpgq3uphe2dh42nihkg6bzlspslhhfuv32f53yli@fypobrcl3wyp>
References: <20240627004142.8106-1-fancer.lancer@gmail.com>
 <20240627004142.8106-7-fancer.lancer@gmail.com>
 <20240627-hurry-gills-19a2496797f3@spud>
 <e5mqaztxz62b7jktr47mojjrz7ht5m4ou4mqsxtozpp3xba7e4@uh7v5zn2pbn2>
 <20240628-ovary-bucket-3d23c67c82ed@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628-ovary-bucket-3d23c67c82ed@spud>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>, Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Jose Abreu <joabreu@synopsys.com>, Abhishek Chauhan <quic_abchauha@quicinc.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jun 28, 2024 at 05:42:58PM +0100, Conor Dooley wrote:
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
> > 
> > > If two interfaces are meant to be "equipped" with that clock, how come
> > > it is optional? I'm probably missing something...
> > 
> > MCI and APB3 interfaces are basically the same from the bindings
> > pointer of view. Both of them can be utilized for the DW XPCS
> > installed on the SoC system bus, so the device could be accessed using
> > the simple MMIO ops.
> > 
> > The first "clock-names" schema is meant to be applied on the DW XPCS
> > accessible over an _MDIO_ bus, which obviously doesn't have any
> > special CSR IO bus. In that case the DW XPCS device is supposed to be
> > defined as a subnode of the MDIO-bus DT-node.
> > 
> > The second "clock-names" constraint is supposed to be applied to the
> > DW XPCS synthesized with the MCI/APB3 CSRs IO interface. The device in
> > that case should be defined in the DT source file as a normal memory
> > mapped device.
> > 
> > > 
> > > Otherwise this binding looks fine to me.
> > 
> > Shall I add a note to the clock description that the "clk_csr_i"
> > signal is named as "pclk"? I'll need to resubmit the series anyway.
>
 
> Better yet, could you mention MDIO? It wasn't clear to me (but I'm just
> reviewing bindings not a dwmac-ist) that MCI and APB3 were only two of
> the options and that the first clock-names was for MDIO. Maybe something
> like:
> 
>   clock-names:
>     oneOf:
>       - minItems: 1
>         items: # MDIO
>           - enum: [core, pad]
>           - const: pad
>       - minItems: 1
>         items: # MCI or APB
>           - const: pclk
>           - enum: [core, pad]
>           - const: pad

Agreed. I'll add the comments to the oneOf-subschemas as you
suggested.

Thanks,
-Serge(y)

