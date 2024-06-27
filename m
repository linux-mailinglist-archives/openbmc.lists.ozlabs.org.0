Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3186691A911
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 16:22:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WQuRzjDF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W913R68zxz3cYx
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 00:21:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WQuRzjDF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W912q6KBPz3cXR
	for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2024 00:21:23 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-52cdc4d221eso6664065e87.3
        for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 07:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719498080; x=1720102880; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BNKoH4rzJ344zkKbrOWrYDXvT+iIE/hfmaxUTk56nJM=;
        b=WQuRzjDFtSF128nYd1YWQbTBv1EowTTltzhVzTiaE9vvZwx3wLirGm8NaIh9Y1ODHQ
         MWyA6JNCSXQljmKV9tHBhGwso2hYfn7r0GyGaBZpDQssKfA5T7XlE55nq1aEIqQK2ka0
         xFiYbxUU40oMzZ/k5BAuSqLjgKV+jCCw7keFbD9+dc8KL7lPN/A3YwBp+DljGWtMXeBI
         Knoia5hNqfzQ2PQqV6sxgmxgYJdg7BlK/3wJyqs5QQkCjcQUpRsBc3L9eY5/Lk67YwNJ
         +MuE5Aj4svq/v70KumXOjEFa0zCavTfW9VUSOK3csKHdu24rA0QeCXg0iLedvOywi66Y
         TRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719498080; x=1720102880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNKoH4rzJ344zkKbrOWrYDXvT+iIE/hfmaxUTk56nJM=;
        b=icy4KIjYekXbjZ43+ZnGw6+tj7slDY79dA5gWjixAQ7S/rWn0/h2Pb5JLFGqQi2OWB
         X46B43+T3jbyEM/Kh/IBYx1gVv/lS36H31rmc2RS+MOm4e5kUOFH9qvfjUzZqFouKBbP
         IxNpAXqlwtf3SYtDRZJydln70ybSdQ6CQkW/P2fFqmYA9DgRRwsrtngF7R0VpUk1gbGA
         WZaTvfst3BFBQgFgBLGNtSWFAeK1XqxIi49ba4jQy3Dm4gb3bQkHQF/p2m7bDiMMd1lZ
         dzypIRMokeWTpl2tnnHO62ZPjn4bDq4lTx8ROe895K4D8/fjhbR8nuTCERmeI/Rgsobz
         WcWg==
X-Forwarded-Encrypted: i=1; AJvYcCXApXAjZLBzkUuHFyS6y14FYaZSpdAdjbRGKQAMBgmpKAhpvDO1hRkr+AQSK4iHwTYRkiRwCE9nI7lsCKj8+dNP4S7IbGEjoSM=
X-Gm-Message-State: AOJu0YxkTi92sPh7pl9/uuSeyi1lugjNm61GHZZF6JYNwLN/ifkRiVNk
	Kf9B0e9Z97M3htUVdWPf90pM5j99m1IG9UNo0gX0KVxOwD6IQ3FJ
X-Google-Smtp-Source: AGHT+IEHVOZ10FR3wZmTdwRxdIJLg1s0iN53vUF5fAbGXdSCMOMhDB4n8Z8vdnbYCxSJ4aGmRz1Ybw==
X-Received: by 2002:ac2:5e79:0:b0:52c:dc0b:42cf with SMTP id 2adb3069b0e04-52ce18324e0mr7752453e87.9.1719498079833;
        Thu, 27 Jun 2024 07:21:19 -0700 (PDT)
Received: from mobilestation ([213.79.110.82])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7676dd0esm50342e87.87.2024.06.27.07.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:21:19 -0700 (PDT)
Date: Thu, 27 Jun 2024 17:21:17 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v3 03/10] net: pcs: xpcs: Convert xpcs_id to
 dw_xpcs_desc
Message-ID: <2iwe4r3lgx3peufwuzdjhpqdxlbupwant72smia3fir2u5va64@ofbylcmizolx>
References: <20240627004142.8106-1-fancer.lancer@gmail.com>
 <20240627004142.8106-4-fancer.lancer@gmail.com>
 <15754e63-be47-4847-8b61-af7f8a818a3c@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15754e63-be47-4847-8b61-af7f8a818a3c@lunn.ch>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>, Florian Fainelli <f.fainelli@gmail.com>, openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Jose Abreu <joabreu@synopsys.com>, Abhishek Chauhan <quic_abchauha@quicinc.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jun 27, 2024 at 03:10:18PM +0200, Andrew Lunn wrote:
> > -	for (i = 0; i < ARRAY_SIZE(xpcs_id_list); i++) {
> > -		const struct xpcs_id *entry = &xpcs_id_list[i];
> > +	for (i = 0; i < ARRAY_SIZE(xpcs_desc_list); i++) {
> > +		const struct dw_xpcs_desc *entry = &xpcs_desc_list[i];
> >  
> >  		if ((xpcs_id & entry->mask) != entry->id)
> >  			continue;
> >  
> > -		xpcs->id = entry;
> > +		xpcs->desc = entry;
> 
> Maybe rename entry to desc here?

Curiously to note that originally I had the same idea in mind and even
implemented it in the first v2 version. But then decided to preserve
the original name to signify that the pointer is a temporary
variable pointing to the desc list entry.

Anyway I don't mind changing the name to desc especially seeing I need
to resubmit the series anyway. Using the desc name here won't make
thing less readable here, but will also provide a notion about the
variable content.

I'll change the name to "desc" in v4.

> 
> Otherwise
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Thanks.

-Serge(y)

> 
>     Andrew
