Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7B5403842
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 12:53:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4Js10W9Pz2yLg
	for <lists+openbmc@lfdr.de>; Wed,  8 Sep 2021 20:53:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oCkzDEUS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oCkzDEUS; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4JrW70rXz2yHL;
 Wed,  8 Sep 2021 20:52:59 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id m4so2740214ljq.8;
 Wed, 08 Sep 2021 03:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SCa5sUcg3hd31K9Jh0v/b9ezKnAfrViWPcQLkGDjQ+4=;
 b=oCkzDEUShK5lI6n91PzLUskjiJzDmMHgbLjz+KXzkc3Rfw26w3sRoW8v962TNFfa4M
 LsrrvsBQeSkrcbTeOeRR4l8qvU6E/8I2wBFPYE6JUUQcYNr+aebrSAXpirXTJmM1x1nX
 ZEl9Pi2vuebkV5Tt0mat0PwmMWj2KFR1AMJT8WCEXuE1wxBUfgcSbkDXEJ2cLXlKkwjJ
 AVMKcRonmm3JkuZjdZybhr3eYQSlH5CC3n66VmGnipizSPmq33qJFWDib6RxUYg3IVg1
 0yVgTa1YzQxeU4xMujoXFRDUsET4S612uh/mofJ43hKBtxo7TM9wOGzq6SK+it8jLiz1
 CFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SCa5sUcg3hd31K9Jh0v/b9ezKnAfrViWPcQLkGDjQ+4=;
 b=dCCSAsaOMT6yH7dtCDG7b3Y71BlxR54UmT5MQiVe9B0JqyrzD64UYh+EOoxH7Zls7w
 uncwBrFI2AFx89KnBsO2BHxw+RQQC4fnnpxFzAmGRnyHvMNqbrnz3v70h27vkorDsQOz
 DkTZdI6BGhxLOuNE8IH9bt9PkQrwTNS5UUtmOu3QzQvppUn2iUKEvDxqBXre5YWTz7/l
 +K/vR6nIxlSjbk2KPf1iJlvQ2i9V6nJmi2N6tkGIxFEiykmXW1nys12+baChTupoYzc6
 d/4Dsw7QNfYKoaA4NWnOjDxydrnsyFukm8rWOjtCpryxc8hHje+ERni6t1FG48M1oUaS
 KpGg==
X-Gm-Message-State: AOAM531zn890OlyY+eUxVQvBblFP/a20hWuz1bW1MZekXyOg0aCdhNNa
 HhMIFIE067wBn+BvN9XWYH8=
X-Google-Smtp-Source: ABdhPJzwOrSuphL+vd9b2Iy/O3YtR+9hdvovE6aK5/918675iAVWeZPr9K75U2+6lQiLHq5djr8icA==
X-Received: by 2002:a2e:99d9:: with SMTP id l25mr2262345ljj.217.1631098371710; 
 Wed, 08 Sep 2021 03:52:51 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id o7sm201332lji.17.2021.09.08.03.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 03:52:51 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 188Aqmlt015750; Wed, 8 Sep 2021 13:52:49 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 188Aqkv8015749;
 Wed, 8 Sep 2021 13:52:46 +0300
Date: Wed, 8 Sep 2021 13:52:45 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH v2 0/3] arm: aspeed: Add UART routing support
Message-ID: <20210908105245.GB23326@home.paul.comp>
References: <20210902021817.17506-1-chiawei_wang@aspeedtech.com>
 <20210908094248.GZ23326@home.paul.comp>
 <HK0PR06MB3779180F75DB8BD872F8A78391D49@HK0PR06MB3779.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HK0PR06MB3779180F75DB8BD872F8A78391D49@HK0PR06MB3779.apcprd06.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Konstantin Klubnichkin <kitsok@yandex-team.ru>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "osk@google.com" <osk@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 08, 2021 at 10:18:35AM +0000, ChiaWei Wang wrote:
> > Does UART1 need some explicit disabling for VUART IRQs to work? It looks like
> > setting LPC address and IRQ number in VUART is enough to override the
> > register part but probably not for the interrupt?
> 
> You may need to confirm that the Host does not enable the SIO SUART1
> device. This will conflict with VUART as both SUART and VAURT are
> competing for the port address 0x3f8 and SIRQ 4.

Do you really mean the Host here, that is, software that controls LPC
master when ASpeed is used as an LPC slave? Linux driver is not doing
anything special with the UART1, it's just trying to use it as if it
was a hardware 16550A physical IC on I/O bus.

Or do you mean the BMC software shouldn't be enabling SUART1 by making
sure its clock is disabled in SCU0C? Is there anything else needed?
I've tried reading the ast2500 datasheet many times but this detail
seem to be missing. Is there some appnote on the topic probably?

In this case do we have some way to make it an obvious error to enable
both SUART1 and VUART in DTS? If they're conflicting surely there
should be a way to express that?

Thank you for looking into this!

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
