Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B4591A4AC
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 13:11:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UwOebzAi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8wqQ4jW7z30V7
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 21:11:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UwOebzAi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8wps2q1pz30V7
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 21:10:44 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4217c7eb6b4so62959855e9.2
        for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 04:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719486639; x=1720091439; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dJ41cKVFUDoayT4CnMdbSFrorOT6+T+2QyObCadagbA=;
        b=UwOebzAikFago4dio1mjgnDeI0W5dUmcyyHmKezPQ7ANShJgHJQAb/eGnseVPs5Dxj
         hezLLZHWs/AB1Nnfs7xNYII7DbZWxRYhIIRa3YYoCor+MK8O6rM2qGorGrh22K0ZghkQ
         ls27MyCxIWw60mqpIwCwYhfwd3QKzRnj9a4WNwmSu8/wjqah3/m884vL3LoBQAXhtsdr
         Y/8WyoodFestYpT5rq1PnS4RE30MbSGe/S2JGbccen8HbkgENuG7sRU+Q7BjdekDaeD2
         7jglvnzh5g8ZfiqJSjeszAI5808GQjKLTJi3HdMMnR6/dedZOa+B2dlq/qhOKwdtPlby
         Ah0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719486639; x=1720091439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJ41cKVFUDoayT4CnMdbSFrorOT6+T+2QyObCadagbA=;
        b=QurD8wtbEPeBTgHNTDw0+ToilYctYG/fvilL6V+v/OpgUlWHSmT8M0YoPJu/TD9ctU
         DqjNG7GURsqOjIpNfYDwcVycHg5ixFUeSAoXSQhONrj8weflWdaFam7JyYHHlF5RuxwB
         gJYu4U61pT9mAoodShvHytAuUYj2EgjVUUmKdlth7Ev6vFLYC9EzNEr8MfN1R1R2ytl7
         5OgpZ6/BZlivJpSS5hI2zdBmlv7IDilIRZR1uyNP25WityIVe6w5VJpg/7LMQxpWFUlX
         Ax7FcmQcoEie3dKwVI/476+wjOSdkvuqxAYzqiKPNTonVUmOI5Hx1Stsw7Q7RSFQg+QU
         AxfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJFrWx0ppiqVFUhj7D5PcL11iw+DldX9CalNuMAOSGazECb0NGthhRMBhY8VuB70g5Sf542Mx/TXTPtHEckb3AOzVO30J/VW0=
X-Gm-Message-State: AOJu0YwW8n675HCU46BmfOAMhk35MM9ib4rgV6ya+uSzY3UroHIW/w9i
	vzYhNHlAGJwyqisWP5RPvYBwEo/rHbO6GslphWbn/0cR5N+mOkjf
X-Google-Smtp-Source: AGHT+IGjITfTRof17ZOH07aYl96wyP8RcQUw3qHVP4Fjlv+Ra5754pHItvboK3VjmikCndiKEWX44g==
X-Received: by 2002:a05:600c:3399:b0:424:a5e3:8022 with SMTP id 5b1f17b1804b1-424a5e38107mr42905705e9.34.1719486638478;
        Thu, 27 Jun 2024 04:10:38 -0700 (PDT)
Received: from skbuf ([79.115.210.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3674369982bsm1484333f8f.74.2024.06.27.04.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:10:37 -0700 (PDT)
Date: Thu, 27 Jun 2024 14:10:34 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next v3 00/10] net: pcs: xpcs: Add memory-mapped
 device support
Message-ID: <20240627111034.nusgjux3lzf5s3bk@skbuf>
References: <20240627004142.8106-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627004142.8106-1-fancer.lancer@gmail.com>
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

Hi Sergey,

This does not apply to net-next.

Applying: net: pcs: xpcs: Move native device ID macro to linux/pcs/pcs-xpcs.h
Applying: net: pcs: xpcs: Split up xpcs_create() body to sub-functions
Applying: net: pcs: xpcs: Convert xpcs_id to dw_xpcs_desc
Applying: net: pcs: xpcs: Convert xpcs_compat to dw_xpcs_compat
Applying: net: pcs: xpcs: Introduce DW XPCS info structure
Applying: dt-bindings: net: Add Synopsys DW xPCS bindings
Applying: net: pcs: xpcs: Add Synopsys DW xPCS platform device driver
Applying: net: pcs: xpcs: Add fwnode-based descriptor creation method
Applying: net: stmmac: Create DW XPCS device with particular address
Using index info to reconstruct a base tree...
M       drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
M       include/linux/stmmac.h
Checking patch drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c...
Checking patch drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c...
Checking patch include/linux/stmmac.h...
Applied patch drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c cleanly.
Applied patch drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c cleanly.
Applied patch include/linux/stmmac.h cleanly.
Falling back to patching base and 3-way merge...
error: Your local changes to the following files would be overwritten by merge:
        drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
        drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
        include/linux/stmmac.h
Please commit your changes or stash them before you merge.
Aborting
error: Failed to merge in the changes.
Patch failed at 0009 net: stmmac: Create DW XPCS device with particular address
hint: Use 'git am --show-current-patch=diff' to see the failed patch

Thanks,
Vladimir
