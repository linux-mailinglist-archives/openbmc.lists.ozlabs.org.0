Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDF62521CC
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 22:18:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbgL02hMLzDqYV
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 06:18:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Bacm3EUT; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbgK46HSdzDqTT;
 Wed, 26 Aug 2020 06:17:43 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id m8so8222479pfh.3;
 Tue, 25 Aug 2020 13:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kTTQkj1GrVnPq+Jl1z8GjL/Z8OGPiCHoo0nN5v+V4rY=;
 b=Bacm3EUT/ArUc+tJ9DwRQAvy/UQanfr22vRs63UqaoZPXSzQYh/+7a0r6T0aQDh4uE
 LzAPULF85HO+nfixAWfuBIZc/sPjruiwm7mOQtvzQDv0GVvB2+WFW0eX4PMqoKoTsov9
 UpSUIHA+kv6ZN6VEmO8wmKc1cT6y2ChnuhrkU4QoBfUo0mvE64ZgjuEpj1Q8zO9WGL5x
 UM+uc+DVQkom+H1zEKh1RyJOA/aVSCrecCoKUepBQScc3bJ1BFMQDefHrsqq66BBSvww
 sLUFov/yW4z8jH4OEIClkRB3sRqS64/ayOG6XHYwJSqrkZVDT1uF75Kia/bBITKArVP4
 QPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kTTQkj1GrVnPq+Jl1z8GjL/Z8OGPiCHoo0nN5v+V4rY=;
 b=IwDogTUMoqehb8QlmyZmFULvw/Cpq2HVIerINEl64g+SvIlSNsVNS7RBS+t8gJutZj
 48GnEfOGeDnFKUg9alHpOnAIa0P5GwPmyea6ln0R/DEqaZ896qSk98K2Zh4YKzfFar77
 48TNYPSgzl8jSPEiXEC4wrl6GDOEHOzo6/7ESyh3BqhZPu7l36aEvpeBEMRn41agfL6r
 ysISQ0cokFHPLKYDjmAwNpNXI/39D9CH1AtZ580TQqvO3ryI4QwD/aXos5jg0mIS3AVK
 dJfZMSBJ2sOUyMAiWYTL8vQ59DJ5aJYYd1uuGEDaoFgoRoMgCkEpoSDp4fxMsY4jIGP5
 Jn8w==
X-Gm-Message-State: AOAM5319XC2WO/xUjdG2pUONaDA/rpVb79qF4cNBL/WowU7E9YxGFFjt
 SY6Tqxsqu5LbijqxmF++MeY=
X-Google-Smtp-Source: ABdhPJy3+1AevdVVKZO0m/DyW+KokVwfuzGmzhV1klUpmR4e2P7ivu3hcck2+VYDCkh7E6/kPMLtLQ==
X-Received: by 2002:a17:902:7605:: with SMTP id
 k5mr9428097pll.122.1598386660168; 
 Tue, 25 Aug 2020 13:17:40 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id o192sm88628pfg.81.2020.08.25.13.17.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Aug 2020 13:17:39 -0700 (PDT)
Date: Tue, 25 Aug 2020 13:17:37 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 5/5] ARM: dts: aspeed: Add Facebook Wedge400 BMC
Message-ID: <20200825201736.GB22083@taoren-ubuntu-R90MNF91>
References: <20200824211948.12852-1-rentao.bupt@gmail.com>
 <20200824211948.12852-6-rentao.bupt@gmail.com>
 <CACPK8XfbUt9W9xQ4Gxj0LMq=C99V1ExBbkOKvbOvCbJR4N_Bwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XfbUt9W9xQ4Gxj0LMq=C99V1ExBbkOKvbOvCbJR4N_Bwg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 25, 2020 at 04:07:56AM +0000, Joel Stanley wrote:
> On Mon, 24 Aug 2020 at 21:20, <rentao.bupt@gmail.com> wrote:
> >
> > From: Tao Ren <rentao.bupt@gmail.com>
> >
> > Add initial version of device tree for Facebook Wedge400 (AST2500) BMC.
> >
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Thank you for the review, Joel.


Cheers,

Tao
