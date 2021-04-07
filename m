Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CCE356E9A
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 16:28:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFmwd1X1Yz3bsb
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 00:28:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LareH35x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335;
 helo=mail-ot1-x335.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LareH35x; dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFmwM5nKmz2yYn;
 Thu,  8 Apr 2021 00:28:34 +1000 (AEST)
Received: by mail-ot1-x335.google.com with SMTP id
 w31-20020a9d36220000b02901f2cbfc9743so18216465otb.7; 
 Wed, 07 Apr 2021 07:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=jOETYTM8063hIe+H5kFUr3hMwnez+idh/fGpidnkrFU=;
 b=LareH35xQvx6q7WindtheaqOLJg6+SkWSAntFgw7HjS3Tk4qDPoemJ1YOk85nmgPvg
 9mZw56tpm53uQl29e+NuknOwYdP0xUGUxUvEzj64/Y7PD4nxPHMwswMAL8E4iHbcAhMx
 h0MdSnsyeyH4HD8RzChFdMtN/SVH7ahCvfGaZEIguKsC0HUgs97KIN7GkKUfnrLM2q+p
 MiRkxAMy9OTppt3tkoTAy1Zc4dPeODYOUi9GXRMbSxlEeRbbwdMytDy+G8hVjD1aj6yC
 LVzR9U89e8uevanQxmVqNCGOgMvZJvLBAuD6ahPOCf7aN31WHqeQdfIWyETLDQl2tc04
 +zlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=jOETYTM8063hIe+H5kFUr3hMwnez+idh/fGpidnkrFU=;
 b=Y+W2gyXYc/tbt1bUxaK/jI4wAoymqCAkBo50W4UZpDER1aHPv++gv2GgM/LNWNiXXX
 /v+sdxix9A5afyds5sj7jfDXTpMyGLKyvFxcNNd1HyVvWjURtEhFZLeRySsg5X+bBuRo
 ruBrhZn6otfpzO66BMXCNebhYFXhBPbhA59YC0KRFI6fiVIL/UZZCQ1nuqmqt47qSpq9
 9w2cs35SNzQNsuZIQfz6KSo5EO+quSghAQVE6h4Ktzfg+EZ6NerrJJBjAjKZy7+DgY+9
 6uaQRuFSjOItFyx2q9lfuGuEJmlagLjbD5P1cXF2g+wvtaIpLdRyGDeCH7CbWkPQcBr3
 sJCA==
X-Gm-Message-State: AOAM530ICa1Mt1Gpk6aoMpmPLmxt2DzEJNf32ILxf0/U+q5m80634Oic
 Q3vDeIyvvapGKjBnL8azBA==
X-Google-Smtp-Source: ABdhPJxYDEUlP0EObBbm9VfamGrvC+u2TKkp/NeoRSzuuBtqMWkEEaA6ECIMT4B8dpnH6MIjEYoYqQ==
X-Received: by 2002:a9d:37b4:: with SMTP id x49mr3212457otb.237.1617805711619; 
 Wed, 07 Apr 2021 07:28:31 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id h24sm5501853otg.20.2021.04.07.07.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 07:28:30 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:f036:ecd9:2bd0:ef09])
 by serve.minyard.net (Postfix) with ESMTPSA id 89595180570;
 Wed,  7 Apr 2021 14:28:29 +0000 (UTC)
Date: Wed, 7 Apr 2021 09:28:28 -0500
From: Corey Minyard <minyard@acm.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v2 0/3] Add Aspeed SSIF BMC driver
Message-ID: <20210407142828.GE7166@minyard.net>
References: <20210330141029.20412-1-quan@os.amperecomputing.com>
 <20210402142124.GV507977@minyard.net>
 <0e7fceff-4a01-5cb0-72eb-8b47d598f1c3@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e7fceff-4a01-5cb0-72eb-8b47d598f1c3@os.amperecomputing.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>,
 Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Apr 07, 2021 at 08:09:50PM +0700, Quan Nguyen wrote:
> Hi Corey,
> 
> Thank you for reviewing
> I'll put my respond inline below.
> 
> -Quan
> 
> On 02/04/2021 21:21, Corey Minyard wrote:
> > On Tue, Mar 30, 2021 at 09:10:26PM +0700, Quan Nguyen wrote:
> > > This series add support for the Aspeed specific SSIF BMC driver which
> > > is to perform in-band IPMI communication with the host in management
> > > (BMC) side.
> > 
> > I don't have any specific feedback for this, but I'm wondering if it's
> > really necessary.
> > 
> > Why can't the BMC just open the I2C device and use it?  Is there any
> > functionality that this provides that cannot be accomplished from
> > userland access to the I2C device?  I don't see any.
> > 
> > If it tied into some existing framework to give abstract access to a BMC
> > slave side interface, I'd be ok with this.  But I don't see that.
> > 
> 
> The SSIF at the BMC side acts as an I2C slave and we think that the kernel
> driver is unavoidable to handle the I2c slave events
> (https://www.kernel.org/doc/html/latest/i2c/slave-interface.html)
> 
> And to make it works with existing OpenBMC IPMI stack, a userspace part,
> ssifbridge, is needed (https://github.com/openbmc/ssifbridge). This
> ssifbridge is to connect this driver with the OpenBMC IPMI stack so the IPMI
> stack can communicate via SSIF channel in similar way that was implemented
> with BT and KCS (ie: btbridge/kcsbridge and its corespondent kernel drivers
> (https://github.com/openbmc/btbridge and
> https://github.com/openbmc/kcsbridge))

Dang, I don't know why there's not a generic userland interface for
the slave.  And I've made this mistake before :(.

Anyway, you are right, you need a driver.  I'll review.

-corey

> 
> > Unless there is a big need to have this in the kernel, I'm against
> > including this and would suggest you do all this work in userland.
> > Perhaps write a library.  Sorry, but I'm trying to do my part to reduce
> > unnecessary things in the kernel.
> > 
> > Thanks,
> > 
> > -corey
> > 
