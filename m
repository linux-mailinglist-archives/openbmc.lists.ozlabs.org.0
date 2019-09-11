Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 550E3BAD52
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 06:41:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cBV15XhBzDqLB
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 14:41:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lfAI/DCk"; 
 dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SkR20kSszF1ms
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 11:12:43 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id q10so12589891pfl.0
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 18:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=EYMI5WXiWjdR6Ij+VG7m+b1+Dyii6til07Wtqhi6oB4=;
 b=lfAI/DCkfA+6CQkXa4QkdfH2WXGLLLch7UEyqZIDOKIs5c8wlBUJhP4jdmvZFoXEjT
 X8KofvfCXWWfm3pWu2lGM97/YWmO2g5bbvoEkstY3L/IgXI/F7TNeExKZwIyx5vgoris
 Zr4JUyCJCVJqhEtP5ltwOfJRhuX7odO8jQX+2prKGAInPKrHzA1rWHNB7HF8pylh56v4
 GuPxmLRPV+S2lmFb/7VeatKqYm9DpHeHJ/079BnGNyJD9r8bVAgVazaWTLOamwikx73M
 2j+xwNk1yIP27UmmXvmiGkEjCXs3EvzIcwaDj6fLjCbyq9+iBVtFl/aZQaSIhdnxb63R
 cCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=EYMI5WXiWjdR6Ij+VG7m+b1+Dyii6til07Wtqhi6oB4=;
 b=hK8vAEXOzNowcDdwJB1FAvni93BW9Bgq/avguiTHybSAhCMI0SBefTM6fIj30RQ6bL
 +AUPn0gGVUT3iQP9VrQuN5HZ/lICudJf5Gx8Ceilx832XdZnmKaKmjbRJAlPjqjvP2BB
 VdudUh5CNusu9S0GQdvRcfLepvvqMxmyeOI6bXwT/ECW/so0m5P56ZmYe5Qc8dYoMlU7
 jZUVLUIOyqGMXktCLNp27nui34McvVI4r9ua75iqTaM2cLL2xtvuTrRBhajX02ybJoRX
 SE8mQr+97nDoEHjYXBWdG0BxQ97Nk/0FE3NyVBtoEyK1d2s+UpyhEYk6DdAlS/k0qbSC
 Qvfg==
X-Gm-Message-State: APjAAAUFnpjstMFC3sPhVd6krdIYgbIE6TCBs4ZdLGODWfiFynr7It5T
 FEsvUa3o8LEfKn5hPUEDBOg=
X-Google-Smtp-Source: APXvYqzKo5JvbJKzsO99u6GXcMm9YzJqk7gyPkMpDp1kQFvdO7s6x/JZxgZei/4yJ7Wye6ZzlMED+Q==
X-Received: by 2002:a63:494d:: with SMTP id y13mr31092966pgk.109.1568164360172; 
 Tue, 10 Sep 2019 18:12:40 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id g2sm21557192pfm.32.2019.09.10.18.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 18:12:39 -0700 (PDT)
Message-ID: <a9c7851e4cd92bb2de0fb7ec8eccf2f25f652c1a.camel@gmail.com>
Subject: Re: GPIO state in qemu
From: Rashmica Gupta <rashmica.g@gmail.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, James Feist
 <james.feist@linux.intel.com>, Joel Stanley <joel@jms.id.au>, OpenBMC
 Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 11 Sep 2019 11:12:34 +1000
In-Reply-To: <60430dd8-e3c5-e020-2ff7-cb4c536e20a0@kaod.org>
References: <CACPK8XdHwwQwc8-5uf319tX7v3Uh7CcG1rLRmTEK9oKQPYS0hw@mail.gmail.com>
 <6c036cfc-22d4-fd73-da83-60121e6433c2@linux.intel.com>
 <60430dd8-e3c5-e020-2ff7-cb4c536e20a0@kaod.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Sep 2019 14:40:35 +1000
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2019-09-09 at 19:02 +0200, Cédric Le Goater wrote:
> On 09/09/2019 18:20, James Feist wrote:
> > On 9/6/19 11:05 AM, Joel Stanley wrote:
> > > At the osfc hackathon today James and I were talking about Qemu's
> > > new support for modelling GPIOs. Here's some documentation on how
> > > it can be used.
> > > 
> > > To set a pin's state in the monitor:
> > > 
> > > qom-set gpio gpioA0 true
> > > 
> > > To do the equivalent in code:
> > > 
> > > object_property_set_bool(OBJECT(&s->gpio), true, "gpioA0",
> > > &error_abort);
> > 
> > I'm trying to use object_property_set_bool in hw/arm/aspeed.c in an
> > i2c_init block and I'm noticing by the time uboot is reached that
> > the registers are reset back to the default. 
> 
> These routines are called before the machine and devices are reseted.
> 
> > If I use qom-set it seems to work correctly. 
> 
> The machine has been reseted.
> 
> > Where is the correct place to put the object_property_set_bool so
> > that it doesn't get reset by the time it's ready to be read? Does
> > AspeedBoardConfig need a gpio_init as well as an i2c_init?
>  
> we would need to change the default reset value in the reset handler
> of the GPIO device model : aspeed_gpio_reset(). We don't have a way 
> to set default values yet, all 0s for now.
> 
> Rashmica,
> 
> Would it be complex to add a set of default values with which we 
> could memset the ->sets array in the reset handler() like we do 
> for SCU ? 
>

I think it should be pretty straightforward. Do we want one statically
defined set of default values per SoC version?

> Having a different set of default values per machine would require 
> a second set of properties under AspeedGPIOState and some slight 
> rework of aspeed_gpio_get/set_pin.
> 

Why would it require rework of get/set pin?

> Didn't you have a patch for reset tolerant values some time ago ? 
>  

Yes, but it was a bit hacky and I didn't have a good way to test it. We
need to share a property with the wdt and differentiate between a SoC
reset, full system reset and a full wdt reset. Iirc we only use the
reset tolerant values for a SoC reset? I assume we would want to set
the default values for all three types of reset?



> Thanks,
> 
> C.

