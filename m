Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C62C780532B
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 12:40:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BipFjU+2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Skz9F29xvz3cZr
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 22:40:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BipFjU+2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skz8d2v31z30gH
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 22:39:28 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50bffb64178so1499260e87.2
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 03:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701776365; x=1702381165; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y6buYNz993iCGb+jfBAh+xTF839hKLJuyBWYlwBk8YQ=;
        b=BipFjU+2RU+ih0S92cPsG9LbXOi4C6xGh1bP/qgfkLeGfZ01MZ1JqkF3LaEXUcvoMZ
         geLWE80hnhgagVoD+bCwbHFJn41grzhLXGjOLVal7oNTtHGoKnC8rqBz3uUZgmCCaTYw
         rAr0opH/wfI3mlMUFVCrUIlGiECsnZS39sJ4iP8qfEkc43VBjswCcRDA5vbtXYKt5gwy
         6rvQAs6Mxy5VTM8mHfYrssrjMYdzGkePNSftAZlMv4/yz9JXt//GGXSIebUtXZOP9FOu
         R8Q2i/uqCapwrEgpHDsz4X8M9hPf0+nzzAnJU8sqJaW89W57VKwTCUiv8OwXjswiY9mr
         3Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701776365; x=1702381165;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6buYNz993iCGb+jfBAh+xTF839hKLJuyBWYlwBk8YQ=;
        b=UJxHQCWAvCRmQaB/OAFKeEKKSlnOhXxD76lk1sIz/QFf7JFR0vLU52T93rR4v7eL5i
         zxee+2spVXxpPvGUNxO6AjlQqDhsQtJ7jLXB8IfSPk7/eA6gyonus5Q2NlbzW55ZrYsk
         yPeysW1nAK8Bw2rjdiOuJsJl7cwUzy2UHJgjSA4SyMJD0Uk6njAG6GEVaugQq1qflcf/
         ATVoZMRwCdhZIPiUB1lkhAauP8UbdL7uWxIWsfozBSrNgLK1QWccTMIYZhKRWnIiztC8
         Eqo45zn5PD2rs8GUfPO9D2w6YV3b56/IinHtkn+OswXAU+ibjuAy/rDU4rmkRI8GkmZy
         vOUA==
X-Gm-Message-State: AOJu0YxDc3zBPN5CPNMPItbOv5MC3+PXlC3eak+3swNCdz0/xwSK4f0E
	M+iJoWct+bau/uGQa/b5HVo=
X-Google-Smtp-Source: AGHT+IHdLSTpHvIGV+soo8O6/Z+FCsJYVpGnEa7erjBtlciJpMf8bljF17p1tFZGlBWyR34QMQeAZQ==
X-Received: by 2002:a05:6512:3d8e:b0:50b:e637:b319 with SMTP id k14-20020a0565123d8e00b0050be637b319mr2982528lfv.14.1701776364975;
        Tue, 05 Dec 2023 03:39:24 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id o5-20020ac24bc5000000b0050c017fffe4sm210928lfq.122.2023.12.05.03.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 03:39:24 -0800 (PST)
Date: Tue, 5 Dec 2023 14:39:22 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next 01/16] net: pcs: xpcs: Drop sentinel entry from
 2500basex ifaces list
Message-ID: <xuwdtvep7iiqhptiraldr56us5zmgoripzo3kzy3ntrtlf2rxe@5a5qyqfrt2t3>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-2-fancer.lancer@gmail.com>
 <20231205112429.bp6lpvj4klrfrrim@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205112429.bp6lpvj4klrfrrim@skbuf>
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

On Tue, Dec 05, 2023 at 01:24:29PM +0200, Vladimir Oltean wrote:
> On Tue, Dec 05, 2023 at 01:35:22PM +0300, Serge Semin wrote:
> > There are currently two methods (xpcs_find_compat() and
> > xpcs_get_interfaces()) defined in the driver which loop over the available
> > interfaces. All of them rely on the xpcs_compat.num_interfaces field value
> > to get the number of interfaces. That field is initialized with the
> > ARRAY_SIZE(xpcs_*_interfaces) macro function call. Thus the interface
> > arrays are supposed to be filled with actual interface IDs and there is no
> > need in the dummy terminating ID placed at the end of the arrays. Let's
> > drop the redundant PHY_INTERFACE_MODE_MAX entry from the
> > xpcs_2500basex_interfaces list and the redundant
> > PHY_INTERFACE_MODE_MAX-based conditional statement from the
> > xpcs_get_interfaces() method then.
> 
> It would help the readability of the commit message if you would split
> it into multiple paragraphs.

Yeah, creating sometimes overcomplicated log messages is my eternal
problem.) Ok. I'll split it up.

> 
> > 
> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > ---
> 
> Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks.

-Serge(y)
