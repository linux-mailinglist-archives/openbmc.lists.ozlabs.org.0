Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CFF8FE3FE
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2024 12:15:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BxuDI76m;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vw0Zk56x3z3dRZ
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2024 20:15:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BxuDI76m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vw0ZC6THtz3d4D
	for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2024 20:14:59 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-52b9af7a01bso947983e87.0
        for <openbmc@lists.ozlabs.org>; Thu, 06 Jun 2024 03:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717668896; x=1718273696; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=THykdbgFjTOi08AMjXYKGq55B3BCRHgQPMDRbnhqys4=;
        b=BxuDI76mBDtXr7pFZpJiChqbY2YhBrqnY90gJVxqLUJnZHKCJjDagc4J3Ncqh8CQFe
         LE2SYWNREp7S/Hx/xZNa4a0lkEkGgEGQHx8tbukzov9DiDmsc1AgB5XGnusoGsVlQZvr
         clRDebqA5ilajHh8lQ5WToZ5m46EC7oEsi9VTOCfbnjQtkkUbFeHzwhCzYyIPDMOKMXK
         Ht0zoEalUA6vl7AL5Jvb/fVNsx1L+mzhDsTC+lPCguBwCrVvvpAdcJHwp9R2QlgmSaho
         zgiDU7xZ5YRfdtMruLdfVvIYhcQpFdMcxrXWWtsoVLlJ2EfAhzu3ZrWQwT++9dy1kvnH
         k7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717668896; x=1718273696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THykdbgFjTOi08AMjXYKGq55B3BCRHgQPMDRbnhqys4=;
        b=qvUNmS+Qmq78LmpstUEf8GuenQ7Az2VwZTzJnPoyIiQX4sDaAOZ9NSFFdJ8pzS3+Ze
         tcOd0fsQGIb2hLwp/4pvmL1lklZ2umTswQDyKetCYvRPJ1NGJae90RhjbCO1OX0DxS+6
         dUBVYHmZvd3kjHvzsNUrpRd3ScAl/3hTKEk8fJb2r7cAteLKuPmzIr1R13gJ4v1xVD7/
         61QJZHs12MLTxTiMai2QnqRL9MQ1sVZwWbWc/3kk24JRBKx0LN1PjshxG2w7f7fvET7t
         eb+d7kq1svR4VwAGW02SSsGzHzWjn+3HimnFo5KJNPfdQFSB1BiHwm/3jxYeBCuuuJ2C
         lPDg==
X-Forwarded-Encrypted: i=1; AJvYcCXWK8OMAh9+5JVE8wycuj0Dx0Gjz8tDQogabQns96YHMrpBgQKzhvQ8VmXpN4dt441mfCdkLj6ZlZ8dFfQafw/AlD/1aNo3XVY=
X-Gm-Message-State: AOJu0YwgsTnM9iR/4FVLOLWWSsbjPlisR4QhgZsCsltrYUsQAUQx/bzl
	3IP2w6umSHh1otDn4WhcWA2KYgYNo9PLvEuX7W2yn2wIEInbM4Oa
X-Google-Smtp-Source: AGHT+IHPfZiIymZUMudH+8iVFccu+amSG59W72z8/IwmTP98F15xmn+i0fwWfRZbTb88pA9/hEqgWg==
X-Received: by 2002:ac2:4282:0:b0:523:8c7a:5f6 with SMTP id 2adb3069b0e04-52bab4f5d39mr2790961e87.51.1717668896147;
        Thu, 06 Jun 2024 03:14:56 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb43327f1sm150215e87.226.2024.06.06.03.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 03:14:55 -0700 (PDT)
Date: Thu, 6 Jun 2024 13:14:53 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v2 07/10] net: pcs: xpcs: Add Synopsys DW xPCS
 platform device driver
Message-ID: <uhswmnjhbu333kz5z4mbjtoao6grftfsn7aj4mcizmqgukn6be@6wc65fpsgkzu>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
 <20240602143636.5839-8-fancer.lancer@gmail.com>
 <20240605174817.GQ791188@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605174817.GQ791188@kernel.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>, Florian Fainelli <f.fainelli@gmail.com>, openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Jose Abreu <joabreu@synopsys.com>, Abhishek Chauhan <quic_abchauha@quicinc.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Simon

On Wed, Jun 05, 2024 at 06:48:17PM +0100, Simon Horman wrote:
> On Sun, Jun 02, 2024 at 05:36:21PM +0300, Serge Semin wrote:
> 
> ...
> 
> > diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-plat.c
> 
> ...
> 
> > +const struct dev_pm_ops xpcs_plat_pm_ops = {
> > +	SET_RUNTIME_PM_OPS(xpcs_plat_pm_runtime_suspend,
> > +			   xpcs_plat_pm_runtime_resume,
> > +			   NULL)
> > +};
> 

> nit: xpcs_plat_pm_ops only seems to be used in this file.
>      If so it should probably be static.
> 
>      Flagged by Sparse.

Right. I'll convert it to being static. Thanks.

-Serge(y)

> 
> ...
> 
> > +static struct platform_driver xpcs_plat_driver = {
> > +	.probe = xpcs_plat_probe,
> > +	.driver = {
> > +		.name = "dwxpcs",
> > +		.pm = &xpcs_plat_pm_ops,
> > +		.of_match_table = xpcs_of_ids,
> > +	},
> > +};
> > +module_platform_driver(xpcs_plat_driver);
> 
> ...
