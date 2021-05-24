Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A50F38EDE3
	for <lists+openbmc@lfdr.de>; Mon, 24 May 2021 17:41:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FphK56X8dz2yxv
	for <lists+openbmc@lfdr.de>; Tue, 25 May 2021 01:41:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=I6ucW0gs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32a;
 helo=mail-ot1-x32a.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=I6ucW0gs; dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FphJm3KB6z2yWP;
 Tue, 25 May 2021 01:41:27 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id
 80-20020a9d08560000b0290333e9d2b247so15057636oty.7; 
 Mon, 24 May 2021 08:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=4dcNCzYKaU8yqVyhBoUyr8CwTAgBxgmUmDbR8bnQPpc=;
 b=I6ucW0gsmv9GXh2UeJAOVE7pTQo41QoTCF0AMAzGtHj3sMngaptn5NEaWzkhPcaxQz
 7RNNQufSi8UO76a/vJnOANF0etsn31hTUdRfA9+FBpUn7Z9OTl4SwzlxeTHDkrfYnjZk
 pGtoYzC8G77lYdzSmk1xwlGSozjA3Bg2TKak8Zeu77bZaE2wA3KGAOxophrdaWupZkn0
 oH85zl32DxLtcj3F0zUIeQSUWpbTmMb37JzyIcZT6VR113aq7HyipWxbex2eZKF+Dr8G
 wkJEa3zUY9k8zpv+As8XfFegAdkSqJYSLiuluacXvn6ETgW3ICP+DdgLb7gJXnzEG/29
 Y1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=4dcNCzYKaU8yqVyhBoUyr8CwTAgBxgmUmDbR8bnQPpc=;
 b=lfjixc7olCY8hUI22kboXO8GFRdv8c+fD2zWhzDbts880wAp1+QsQOiV3Qj5ICiyBu
 GGQNMe8J1/h7NMop8pkFoT2NJYtbirReKN62LPJl6/9QpR6MCGx5+qjXLeJuXiVGgG5l
 iO6XqCb00emkSOc2Q/qmv480ZgiF3nTvObGRr2mIu/obCWNOP1v/KLCrn37oAxVs3DMK
 40G6i2yfYQLSZ7CRPwFZIkOhmuHQ1flVD9oMka4y7wNnGUTY7I5vj2VtU+LKvvUK7EL0
 e3VgMACW08lXwdDsoqXqLR++IAh+1O779FAMCmfAU9IedQggBrLyOmda8nzeGqsxM80S
 OaGg==
X-Gm-Message-State: AOAM5305ggQOd7fc0nxD6sqUbs08hqnWS1F3urrOCiQVKLo2yW+fyrTe
 GzP1g79Ir/4SmdI5jUBj0g==
X-Google-Smtp-Source: ABdhPJx9uG7vgPNQiz9ZqMwDWzSLYJO8Mq3ppmWDr/gyp6m3yZkxHQ20XoOv2XHvWKoAk0irDjn2rQ==
X-Received: by 2002:a05:6830:903:: with SMTP id
 v3mr19391088ott.192.1621870882919; 
 Mon, 24 May 2021 08:41:22 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id o18sm3142274otp.61.2021.05.24.08.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 08:41:21 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:8d79:38d0:810:96ad])
 by serve.minyard.net (Postfix) with ESMTPSA id C2CCE180105;
 Mon, 24 May 2021 15:41:20 +0000 (UTC)
Date: Mon, 24 May 2021 10:41:19 -0500
From: Corey Minyard <minyard@acm.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [Openipmi-developer] [PATCH v3 05/16] ipmi: kcs_bmc: Turn the
 driver data-structures inside-out
Message-ID: <20210524154119.GN2921206@minyard.net>
References: <20210510054213.1610760-1-andrew@aj.id.au>
 <20210510054213.1610760-6-andrew@aj.id.au>
 <20210521171412.GI2921206@minyard.net>
 <79f3c6d1-1f74-46ec-99a0-37faf11517b6@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79f3c6d1-1f74-46ec-99a0-37faf11517b6@www.fastmail.com>
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
Reply-To: minyard@acm.org
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 linux-aspeed@lists.ozlabs.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Benjamin Fair <benjaminfair@google.com>,
 openipmi-developer@lists.sourceforge.net, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, linux-arm-kernel@lists.infradead.org,
 Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 24, 2021 at 10:23:36AM +0930, Andrew Jeffery wrote:
> 
> 
> On Sat, 22 May 2021, at 02:44, Corey Minyard wrote:
> > On Mon, May 10, 2021 at 03:12:02PM +0930, Andrew Jeffery wrote:
> > > Make the KCS device drivers responsible for allocating their own memory.
> > > 
> > > Until now the private data for the device driver was allocated internal
> > > to the private data for the chardev interface. This coupling required
> > > the slightly awkward API of passing through the struct size for the
> > > driver private data to the chardev constructor, and then retrieving a
> > > pointer to the driver private data from the allocated chardev memory.
> > > 
> > > In addition to being awkward, the arrangement prevents the
> > > implementation of alternative userspace interfaces as the device driver
> > > private data is not independent.
> > > 
> > > Peel a layer off the onion and turn the data-structures inside out by
> > > exploiting container_of() and embedding `struct kcs_device` in the
> > > driver private data.
> > 
> > All in all a very nice cleanup.  A few nits inline.
> > 
> > > 
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > Reviewed-by: Zev Weiss <zweiss@equinix.com>
> > > ---
> > >  drivers/char/ipmi/kcs_bmc.c           | 19 +++++++--
> > >  drivers/char/ipmi/kcs_bmc.h           | 12 ++----
> > >  drivers/char/ipmi/kcs_bmc_aspeed.c    | 56 +++++++++++++------------
> > >  drivers/char/ipmi/kcs_bmc_cdev_ipmi.c | 60 ++++++++++++++++++---------
> > >  drivers/char/ipmi/kcs_bmc_npcm7xx.c   | 37 ++++++++++-------
> > >  5 files changed, 111 insertions(+), 73 deletions(-)
> > > 
> > > diff --git a/drivers/char/ipmi/kcs_bmc.c b/drivers/char/ipmi/kcs_bmc.c
> > > index ef5c48ffe74a..83da681bf49e 100644
> > > --- a/drivers/char/ipmi/kcs_bmc.c
> > > +++ b/drivers/char/ipmi/kcs_bmc.c
> > > @@ -44,12 +44,23 @@ int kcs_bmc_handle_event(struct kcs_bmc *kcs_bmc)
> > >  }
> > >  EXPORT_SYMBOL(kcs_bmc_handle_event);
> > >  
> > > -struct kcs_bmc *kcs_bmc_ipmi_alloc(struct device *dev, int sizeof_priv, u32 channel);
> > > -struct kcs_bmc *kcs_bmc_alloc(struct device *dev, int sizeof_priv, u32 channel)
> > > +int kcs_bmc_ipmi_add_device(struct kcs_bmc *kcs_bmc);
> > 
> > The above (and it's remove function) should be in an include file.
> 
> This is a short-term hack while I'm refactoring the code. It goes away 
> in a later patch when we switch to using an ops struct.
> 
> I didn't move it to a header as it's an implementation detail at the 
> end of the day. I see headers as describing a public interface, and in 
> the bigger picture this function isn't part of the public API. But 
> maybe it's too tricky by half. My approach here generated some 
> discussion with Zev as well.
> 
> > 
> > > +void kcs_bmc_add_device(struct kcs_bmc *kcs_bmc)
> > 
> > This should return an error so the probe can be failed and cleaned up
> > and so confusing message don't get printed after this in one case.
> 
> Hmm. I did this because the end result of the series is that we can 
> have multiple chardev interfaces in distinct modules exposing the one 
> KCS device in the one kernel. If more than one of the chardev modules 
> is configured in and one of them fails to initialise themselves with 
> respect to the device driver I didn't think it was right to fail the 
> probe of the device driver (and thus remove any chardev interfaces that 
> did succeed to initialise against it).
> 
> But this does limit the usefulness of the device driver instance in the 
> case that only one of the chardev interfaces is configured in and it 
> fails to initialise.
> 
> So I think we need to decide on the direction before I adjust the 
> interface here. The patches are architected around the idea of multiple 
> chardevs being configured in to the kernel build and all are exposed at 
> runtime.

Ok, I understand.  The host IPMI driver will attempt to start all
interfaces, if none fail to come up it will return an error, but if any
come up it will not return an error.  So it's a similar situation.

I stole that from something else, but I can't remember what.  I don't
know what the best policy is, really, that was kind of a compromise and
nobody has complained about it.

I will say that the success print in aspeed_kcs_probe() needs to not
happen if there is a failure, though.

-corey

> 
> The serio subsystem does have the 'drvctl' sysfs knob that allows 
> userspace to dictate which serio chardev interface they want to connect 
> to a serio device driver. Maybe that's preferred over my "connect them 
> all" strategy?
> 
> Andrew
> 
> 
> _______________________________________________
> Openipmi-developer mailing list
> Openipmi-developer@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/openipmi-developer
