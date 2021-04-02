Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A43352B48
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 16:21:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBj0r2Cy2z3bp3
	for <lists+openbmc@lfdr.de>; Sat,  3 Apr 2021 01:21:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TEke5Gjg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32d;
 helo=mail-ot1-x32d.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TEke5Gjg; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBj0Y6fcBz2yxP;
 Sat,  3 Apr 2021 01:21:31 +1100 (AEDT)
Received: by mail-ot1-x32d.google.com with SMTP id
 s11-20020a056830124bb029021bb3524ebeso5134830otp.0; 
 Fri, 02 Apr 2021 07:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=wFmEeiu8O3e8Ysh2Egg3y980B0w0wNYvL3AQsHO1K90=;
 b=TEke5GjgaqkttHMJd3gpOWOLZlhz+MiKptNdXq8ft1He/cIpADCj3tiZwUM9IYSw4V
 Gvvu7NIe9GL7P0s/lWgZAEyAviwLVRetY8SiH2c1VbyO1i/Tg8l9AY+WD+1EF/woPpfw
 rZBUW88EJspY50LRle0kjWmjeV/75EIcGor9r23rtDPE1G/M2kQMM3+y/hl6247D6rrf
 y7vV3SgypcrgIZcQipJSxG4KqvseVfEv3W9fsNylo2RXNfyFebh5btWeiLqZ4G04uUYr
 V4Cpss+112fE1xJx7eNhLhi30991uwkZKC31i9X3CgMq/2og6LMqgjONxTaOAPOtmXMz
 SGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=wFmEeiu8O3e8Ysh2Egg3y980B0w0wNYvL3AQsHO1K90=;
 b=Zhgv3G6NnOGzAwZ93T0Jl25turcBVVnAb9hq3bwH1h3Dy8yLPmjeKT8bwDVLoNy7aN
 WHAJDs0dDuV2WQCQ6Y3Aj42ZCli5zhrc9SV38IBwtKzypWAl0OyI+MSes+5kqaZsfOx5
 b3toVawY0DKBF4cTEKLKBRJPx69x3FIV3Q/X5DAllOBBxCZ/ANcy35pnfQ4GOj0wMiZ1
 SIKOpXjX26N/ShnjwOh+hvxd7ywq4zbS51LoMecicTXvEmVLNWP9K4yMnndyEkBqmpYc
 Y+SvwobxBz05SKn9GMBJjh0nE3P9CSnWOHz+q02YhQfgUyRyUT+ipqbG04Mg/9BtPjp1
 E43g==
X-Gm-Message-State: AOAM530aiOeiSM60l0nHp7FGUbIR7i53AS5HUYP1oBOqFstxVjrH9KWH
 qk6CLgFW24urO1ESOyxgDw==
X-Google-Smtp-Source: ABdhPJwB49R/AXpP58aqRK6or0bUV24xyuHImwp2nt06uXJKkyQwip4E4SqGVpKu38xSByynoJ4+9g==
X-Received: by 2002:a05:6830:15d2:: with SMTP id
 j18mr11707892otr.75.1617373286969; 
 Fri, 02 Apr 2021 07:21:26 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id b22sm1904897ots.59.2021.04.02.07.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 07:21:26 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:f99f:823a:495e:5af])
 by serve.minyard.net (Postfix) with ESMTPSA id 371D6180570;
 Fri,  2 Apr 2021 14:21:25 +0000 (UTC)
Date: Fri, 2 Apr 2021 09:21:24 -0500
From: Corey Minyard <minyard@acm.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v2 0/3] Add Aspeed SSIF BMC driver
Message-ID: <20210402142124.GV507977@minyard.net>
References: <20210330141029.20412-1-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330141029.20412-1-quan@os.amperecomputing.com>
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

On Tue, Mar 30, 2021 at 09:10:26PM +0700, Quan Nguyen wrote:
> This series add support for the Aspeed specific SSIF BMC driver which
> is to perform in-band IPMI communication with the host in management
> (BMC) side.

I don't have any specific feedback for this, but I'm wondering if it's
really necessary.

Why can't the BMC just open the I2C device and use it?  Is there any
functionality that this provides that cannot be accomplished from
userland access to the I2C device?  I don't see any.

If it tied into some existing framework to give abstract access to a BMC
slave side interface, I'd be ok with this.  But I don't see that.

Unless there is a big need to have this in the kernel, I'm against
including this and would suggest you do all this work in userland.
Perhaps write a library.  Sorry, but I'm trying to do my part to reduce
unnecessary things in the kernel.

Thanks,

-corey

> 
> v2:
>   + Fixed compiling error with COMPILE_TEST for arc
> 
> Quan Nguyen (3):
>   i2c: i2c-core-smbus: Expose PEC calculate function for generic use
>   drivers: char: ipmi: Add Aspeed SSIF BMC driver
>   bindings: ipmi: Add binding for Aspeed SSIF BMC driver
> 
>  .../bindings/ipmi/aspeed-ssif-bmc.txt         |  18 +
>  drivers/char/ipmi/Kconfig                     |  22 +
>  drivers/char/ipmi/Makefile                    |   2 +
>  drivers/char/ipmi/ssif_bmc.c                  | 645 ++++++++++++++++++
>  drivers/char/ipmi/ssif_bmc.h                  |  92 +++
>  drivers/char/ipmi/ssif_bmc_aspeed.c           | 132 ++++
>  drivers/i2c/i2c-core-smbus.c                  |  12 +-
>  include/linux/i2c.h                           |   1 +
>  8 files changed, 922 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.txt
>  create mode 100644 drivers/char/ipmi/ssif_bmc.c
>  create mode 100644 drivers/char/ipmi/ssif_bmc.h
>  create mode 100644 drivers/char/ipmi/ssif_bmc_aspeed.c
> 
> -- 
> 2.28.0
> 
