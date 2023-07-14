Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D28275310C
	for <lists+openbmc@lfdr.de>; Fri, 14 Jul 2023 07:19:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ocHt077N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2KXl1DsQz3c5M
	for <lists+openbmc@lfdr.de>; Fri, 14 Jul 2023 15:19:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ocHt077N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2KX45qWqz3bkm
	for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2023 15:18:59 +1000 (AEST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b701e41cd3so23323501fa.3
        for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2023 22:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689311933; x=1691903933;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qanFZMj30IH4XW48WS0t6ILLRq3RPYhmVjv06bs4ifs=;
        b=ocHt077NOqJgR/r/AnSkTtXME0GBY2YvFrJMUkK/HReb5GKgR0PSEXUAwNrQyvTzrZ
         WhOTnDSvJa43aNxuo0C++s0HxDE7B76u9aFlT/TrrX1hGWa6R9MmseWw0b23iWDkjxS+
         790Mce8LTojIbjb2vRnQIMF7QjDbGYGGRROvXOl1FNWijTcH9HdlNH5GARWvA3M1Rd5v
         VGF34BYfbXZ7AqpAcr9bXdw2FfdGB4jakjeGp7TNDv2GdlsdLNe504osmEJ7dYkNA0rk
         nFD9MIdfYVpls54NEE8KiW9Ny96vziJlPDvtTKUxPCFrhyP6A3kD03o0uoTP8eb/DOIw
         AYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689311933; x=1691903933;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qanFZMj30IH4XW48WS0t6ILLRq3RPYhmVjv06bs4ifs=;
        b=JKgjN4gDdAGF20AggHxBkCDJD5nF/Zb4cV7P7WsE8Z3RL4bNOw0nmnN2923KgvP0Z4
         V19OlcYJorEmQ1+fUTey4f+TjLezGAWi82Zw95FbyK2NS6AC0b+c13fYUhoIB9WHBgx+
         PJyoku76uwt5iHW0Gb1jFhMLwWQ/bzXjxjuazwC8FSOhWv9CfWC2UMO97o61qqYoY6B1
         NfodwHTPgY8cqij7dbQmBr37JbkG0b6j9uLE8Dt4aalNsPeWHAe+HQl1O9eFq1zBYc29
         jOiuzWrGBP7ycDVGuWJU3uvWUgLOAjKL0Mk6krDpPKtCys4Qn2VuHlP9hh+V6biAn8dT
         sxqA==
X-Gm-Message-State: ABy/qLaM/4O2VbkbA+17pJBf5UvJTLQsUWDPudrHHz5niQdH79B39OBg
	nl0I4MYPzxFOAnibEAMK5g8=
X-Google-Smtp-Source: APBJJlGxgthe95pGtfOYdEqnunDYQ9Kdsp6Bokjz5y6f0Rvss1Ai7/1q54Fx0YbtPfESYolrgvu6Jg==
X-Received: by 2002:a2e:9d0f:0:b0:2b6:f21c:2c46 with SMTP id t15-20020a2e9d0f000000b002b6f21c2c46mr2781140lji.53.1689311932414;
        Thu, 13 Jul 2023 22:18:52 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id e16-20020a2e9310000000b002b6cb40e9aasm1762440ljh.103.2023.07.13.22.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 22:18:51 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22) with ESMTP id 36E5Imqq000481;
	Fri, 14 Jul 2023 08:18:49 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 36E5Ihls000480;
	Fri, 14 Jul 2023 08:18:43 +0300
Date: Fri, 14 Jul 2023 08:18:43 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Subject: Re: [PATCH] net: ftgmac100: support getting MAC address from NVMEM
Message-ID: <ZLDas0gsLNkzuUWR@home.paul.comp>
References: <20230713095743.30517-1-fercerpav@gmail.com>
 <CALs4sv08GJXexShzkrhhW5CDSgJC0z3om5YJzy_qYRqEtvyMtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALs4sv08GJXexShzkrhhW5CDSgJC0z3om5YJzy_qYRqEtvyMtg@mail.gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Leon Romanovsky <leon@kernel.org>, Geoff Levand <geoff@infradead.org>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Eric Dumazet <edumazet@google.com>, Tao Ren <rentao.bupt@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Liang He <windhl@126.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Pavan,

On Fri, Jul 14, 2023 at 10:14:02AM +0530, Pavan Chebbi wrote:
> On Thu, Jul 13, 2023 at 3:28 PM Paul Fertser <fercerpav@gmail.com> wrote:
> > Make use of of_get_ethdev_address() to support reading MAC address not
> > only from the usual DT nodes but also from an NVMEM provider (e.g. using
> > a dedicated area in an FRU EEPROM).
> 
> Looks like earlier ftgmac100_probe() would move on with self generated
> (random) MAC addr if getting it from the device failed.
> Now you will fail the probe in a failure case. Is that OK?

I think the previous behaviour is preserved with this patch in all the
cases other than of_get_ethdev_address returning -EPROBE_DEFER. Can
you please explain what failure case you have in mind and how the
probe is going to be failed in that case?

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
