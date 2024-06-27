Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5905191AD93
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 19:11:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QxL5tvt4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W94q65Q8hz3clw
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 03:11:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QxL5tvt4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W94pV5Syvz3cBG
	for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2024 03:10:57 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ee4ab4076bso7552651fa.0
        for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 10:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719508251; x=1720113051; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hQlcJ+6aWC6ZSM3mk9e3WLtJ8bng42FgNFtFpOoN34I=;
        b=QxL5tvt4+ynjh8lPDg9J1W+h7QHScRcWx7EdhdPPsR1NAjxLU4CDt+/gFsNIuzikfx
         JcH1ZtWh7PA6yjUrKmY7e804qf4ugyWqOY0GpTtAqLtg8jBPlZFJJVxtroPyOpnzt0CG
         N8kSO+gD5aA4hEYS6AFkwXMh1UdzNXLQob9BKX94cYhvGC6iD0DX7VVbIxKX74oZ1y9o
         8AnCPr/PtPmrqb887Tf3sEl91gOMyuRVaZlu8mCOuYY2vM3qB/chKQXCdO19T2HPDVH1
         erI1MGnWOErCQdDntW583HsnUq75RPA+x0o4CjX7J3ySCBV9V2kJ4RKegOgH8nwXPXnU
         w9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719508251; x=1720113051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQlcJ+6aWC6ZSM3mk9e3WLtJ8bng42FgNFtFpOoN34I=;
        b=hHa+HOxRnNUco6j5BJ5ymWZyJxi2yXmPnE7IYWVMKhCyKYi04ysBshctrbBY1SzhYy
         kdPTramcwxSVxsR61w8TOvYB/CPocqNqs+xVP+hQgVn5y9KuhfDKa3ldcxQjVHKv3T6+
         qzyfXdFkhxweP5OFlSkTtXeCYqxJsg1KQSJT1VOxejhqossDEtgOk5mAZQS0XUM/owRe
         rujAWNQ7sX9a6zNh7aXf8nWN3gzmbkj9VC7Tk47qZ+TgL9m2YzI6ODcQQFJgQvk7ezJ6
         7e9YiWIeBmfTikPTycrohtQJKW65AJO6UlzjR5R5tJkr251h7wA//bsifxS9im3zo1rO
         dMWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+1CDrtwkqgLW61GNyWkLqoqBdvUC0qUvFSJPkjWWhoaIAxB9sWn+Ka3ieJU0wcjN2+KHizh2RnQ6m3qmZ5jXqJzW+HxqEWZw=
X-Gm-Message-State: AOJu0YzfV104BE9c/n8jwW3N6nt4/1zxe81RFDnPbwuvClQRDEftpUrq
	R9YhhutltSNrXjcuAUfB7iJ1zf2nXh5yQFhVKWRMHpKBzyUAr477
X-Google-Smtp-Source: AGHT+IH2++0VlmY/PoUFoK6twB3OYGqFKj6eVnvwbmE3JDf/EUiLDbwoFbuBSVIfzxdfjfkEmAnCPQ==
X-Received: by 2002:a2e:b0e2:0:b0:2ec:361b:c079 with SMTP id 38308e7fff4ca-2ee49863be6mr6958261fa.25.1719508251179;
        Thu, 27 Jun 2024 10:10:51 -0700 (PDT)
Received: from mobilestation ([213.79.110.82])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee4a34411esm3151361fa.19.2024.06.27.10.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 10:10:50 -0700 (PDT)
Date: Thu, 27 Jun 2024 20:10:48 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH net-next v3 06/10] dt-bindings: net: Add Synopsys DW xPCS
 bindings
Message-ID: <e5mqaztxz62b7jktr47mojjrz7ht5m4ou4mqsxtozpp3xba7e4@uh7v5zn2pbn2>
References: <20240627004142.8106-1-fancer.lancer@gmail.com>
 <20240627004142.8106-7-fancer.lancer@gmail.com>
 <20240627-hurry-gills-19a2496797f3@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627-hurry-gills-19a2496797f3@spud>
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

On Thu, Jun 27, 2024 at 04:51:22PM +0100, Conor Dooley wrote:
> On Thu, Jun 27, 2024 at 03:41:26AM +0300, Serge Semin wrote:
> > +  clocks:
> > +    description:
> > +      Both MCI and APB3 interfaces are supposed to be equipped with a clock
> > +      source connected via the clk_csr_i line.
> > +
> > +      PCS/PMA layer can be clocked by an internal reference clock source
> > +      (phyN_core_refclk) or by an externally connected (phyN_pad_refclk) clock
> > +      generator. Both clocks can be supplied at a time.
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  clock-names:
> > +    oneOf:
> > +      - minItems: 1
> > +        items:
> > +          - enum: [core, pad]
> > +          - const: pad
> > +      - minItems: 1
> > +        items:
> > +          - const: pclk
> > +          - enum: [core, pad]
> > +          - const: pad
> 

> While reading this, I'm kinda struggling to map "clk_csr_i" to a clock
> name. Is that pclk? And why pclk if it is connected to "clk_csr_i"?

Right. It's "pclk". The reason of using the "pclk" name is that it has
turned to be a de-facto standard name in the DT-bindings for the
peripheral bus clock sources utilized for the CSR-space IO buses.
Moreover the STMMAC driver responsible for the parental DW *MAC
devices handling also has the "pclk" name utilized for the clk_csr_i
signal. So using the "pclk" name in the tightly coupled devices (MAC
and PCS) for the same signal seemed a good idea.

> If two interfaces are meant to be "equipped" with that clock, how come
> it is optional? I'm probably missing something...

MCI and APB3 interfaces are basically the same from the bindings
pointer of view. Both of them can be utilized for the DW XPCS
installed on the SoC system bus, so the device could be accessed using
the simple MMIO ops.

The first "clock-names" schema is meant to be applied on the DW XPCS
accessible over an _MDIO_ bus, which obviously doesn't have any
special CSR IO bus. In that case the DW XPCS device is supposed to be
defined as a subnode of the MDIO-bus DT-node.

The second "clock-names" constraint is supposed to be applied to the
DW XPCS synthesized with the MCI/APB3 CSRs IO interface. The device in
that case should be defined in the DT source file as a normal memory
mapped device.

> 
> Otherwise this binding looks fine to me.

Shall I add a note to the clock description that the "clk_csr_i"
signal is named as "pclk"? I'll need to resubmit the series anyway.

Thanks
-Serge(y)

> 
> Wee bit confused,
> Conor.


