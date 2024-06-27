Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E468391A8B6
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 16:10:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q+NC4Ka4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W90nz3LcHz3cf8
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 00:10:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q+NC4Ka4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W90nR1cTdz3cFN
	for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2024 00:09:45 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-52caebc6137so7360427e87.0
        for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719497382; x=1720102182; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WxbdUF3igWgZnkX8ezz96rfrkEDeMV7VPqBBzmY6B/M=;
        b=Q+NC4Ka41/bdU2n2RfyJusW6DAr0MsqyeZqQXCfhRrNeAOUOFyROMJTvp6dw/cDWbf
         Qz7MbxbRXZdDNp7GscE/dHaWGomd2Ck3P0WPDQNPKfhgAFuPRq3Ipj41NPfCh2BzI1nw
         sCCugml53/a+13H5emGC+IxqwhqUUlbQoiSxl2bungUjOeOobiHc8V9qEmUcfS6Agrz1
         X7KHrVO34Y/1DNll0ah1y3IqrfN5hrNGAI+hPC8w3XV7QjlBR14R5289eJLzBsbLOtJa
         YnapIZOkma6oZIZvUkNY1xXlCk69Q6uZ8VLqvR1j4p2FRO1JIlpLdJTRBc7x0jSv4hRv
         yi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719497382; x=1720102182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxbdUF3igWgZnkX8ezz96rfrkEDeMV7VPqBBzmY6B/M=;
        b=GxDmooXUDOA9CzeVlvHPCEymDRa9rF9PxrCiRmARYA5sQ3KWxcMmz+ue6hQYUOJRM7
         EPqT9IpguYjpnDHgi/G8ymZJS/JUfVU3ObOQSqGctbA2XuLKGFqProyzrBOBqp4gI/Bi
         0hGNLen57wdNTt3UEOcdh6QjackQ052T9DfhybcLY/gKsdSWL4FHaBHJui5kQeLh7WgJ
         FcsWeliFpYL1Grv8Ql/eGR8VtyGAavgIEiZvvgOEdvexbdHkPUnvDzjUokZoTvm06bhw
         uFtQBTrRn5UocLQiFbMjt01TxQn4RJsjA0APT3LtvDyCeQqDF4rcKhwNBWBhqUINiw0S
         RIlA==
X-Forwarded-Encrypted: i=1; AJvYcCVdaITrGbZ1JvJ/bAnESHojeit+dm2b/jfqlDhgV7NggHOjQEfP06tLHs6hzPReNyARRhAiHWnbaIUcjX3YFmgMx7NVhDdDL/I=
X-Gm-Message-State: AOJu0YxBy8IJECYH8reFB46VhXwAZy9la6E+EIx1bz2jFeVjuaqkV24T
	e0I95KHlV+jJE/cRHo17HMakBCXeFKH0JHvzDs+YbfeClAwk3TF6
X-Google-Smtp-Source: AGHT+IGYnYpUx4D98KzvsoiC9IwR+Ky0CtunlggIok0VAdrIJJsUBpeuWypCrzdBCggYRccbsLhkLg==
X-Received: by 2002:a05:6512:281:b0:52c:e10b:cb36 with SMTP id 2adb3069b0e04-52ce183add6mr8239966e87.33.1719497379045;
        Thu, 27 Jun 2024 07:09:39 -0700 (PDT)
Received: from mobilestation ([213.79.110.82])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e71329529sm215060e87.293.2024.06.27.07.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:09:38 -0700 (PDT)
Date: Thu, 27 Jun 2024 17:09:36 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next v3 00/10] net: pcs: xpcs: Add memory-mapped
 device support
Message-ID: <nct7rbh5w7nd4jneiqzwqpwv5gy6t7q2xobv74hqgilzpykzx5@v6l2aoh5fcaj>
References: <20240627004142.8106-1-fancer.lancer@gmail.com>
 <20240627111034.nusgjux3lzf5s3bk@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627111034.nusgjux3lzf5s3bk@skbuf>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>, Florian Fainelli <f.fainelli@gmail.com>, openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Jose Abreu <joabreu@synopsys.com>, Abhishek Chauhan <quic_abchauha@quicinc.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Vladimir

On Thu, Jun 27, 2024 at 02:10:34PM +0300, Vladimir Oltean wrote:
> Hi Sergey,
> 
> This does not apply to net-next.
> 
> Applying: net: pcs: xpcs: Move native device ID macro to linux/pcs/pcs-xpcs.h
> Applying: net: pcs: xpcs: Split up xpcs_create() body to sub-functions
> Applying: net: pcs: xpcs: Convert xpcs_id to dw_xpcs_desc
> Applying: net: pcs: xpcs: Convert xpcs_compat to dw_xpcs_compat
> Applying: net: pcs: xpcs: Introduce DW XPCS info structure
> Applying: dt-bindings: net: Add Synopsys DW xPCS bindings
> Applying: net: pcs: xpcs: Add Synopsys DW xPCS platform device driver
> Applying: net: pcs: xpcs: Add fwnode-based descriptor creation method
> Applying: net: stmmac: Create DW XPCS device with particular address
> Using index info to reconstruct a base tree...
> M       drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
> M       include/linux/stmmac.h
> Checking patch drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c...
> Checking patch drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c...
> Checking patch include/linux/stmmac.h...
> Applied patch drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c cleanly.
> Applied patch drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c cleanly.
> Applied patch include/linux/stmmac.h cleanly.
> Falling back to patching base and 3-way merge...
> error: Your local changes to the following files would be overwritten by merge:
>         drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
>         drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
>         include/linux/stmmac.h
> Please commit your changes or stash them before you merge.
> Aborting
> error: Failed to merge in the changes.
> Patch failed at 0009 net: stmmac: Create DW XPCS device with particular address
> hint: Use 'git am --show-current-patch=diff' to see the failed patch

Argg, right! I forgot to port the Russell' latest series introduced
the select_pcs() callback. Sorry for the inconvenience.

I'll get it merged in my repo (based on the kernel upstream tree with
verious plat-specific fixes) and test it out again. Then I'll _make
sure_ this time that the series is applicable onto the net-next tree
before resubmitting.

Thanks,
-Serge(y)

> 
> Thanks,
> Vladimir
