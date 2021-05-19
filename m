Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76423388E2A
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 14:34:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlXPB3Przz303h
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 22:34:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=WSbmTBjM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WSbmTBjM; dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlXNv2M9pz2xZZ;
 Wed, 19 May 2021 22:34:06 +1000 (AEST)
Received: by mail-oi1-x230.google.com with SMTP id v22so12968389oic.2;
 Wed, 19 May 2021 05:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=VrjofVBqpi4EHgG9TcMkr4kH1OnwVdI3jKjQrhy1Fug=;
 b=WSbmTBjMuGsiyyywp5Dh3Q3mVYW2nbZQjg0K6XpN0ym7Jrl7a5IQuCF3IA3QXe4shk
 Ng8JJSYbNTWhKXk9LZm6Ks6Q4VkQ67uzl+BHacClNTEsfVOw/4DTeqzd/8NTDS2Xbk0Z
 ta+hXBtHynyG4MWZyKPg6/es2FymwlidZMkU7Z+7qGt2kU16NoC7yi0X/hKPBlybJxLS
 nW30UfL3+CWamV4v6eEu79DvmCx7vOijxZNl6iGcLa6U530GJ6DakL3VwL2DteDB0c9M
 xoJXf0W7rhuoTQrHKa1N7zPYAfPaMS9yiITcKYvZaU4xDeDvS0H6OHndrcIElujRWsT0
 j8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=VrjofVBqpi4EHgG9TcMkr4kH1OnwVdI3jKjQrhy1Fug=;
 b=UBHxJ6iiLvYEKqj5GS2lBbDaw8km91kNTHJvxXJbp/s64BiQlvpMjqdFSn1giaryiJ
 k7cN7OONp/lTLQxmoU5pg5CoNThXUPP5Agu7yYRWIVQsuLDUQB61rBMlrrsOp8cT+vOr
 yq9ijUhQYsFWX0FzjGuIOGTpJ8FaHhQovyjrLJ4hZM06oC2vdQkDINAfcfx4uwzL9da0
 c70Dj2dZiMMb3W9JptuDpAjag0UWNA495Ja1mRjbZjucFUOpIZZAlIu9nrpvLGMOgWgB
 DDYUuRF7kGvJV88kniGZJ2cl210FHGGRmRVPC+EKiSCuHJtNnib8u0VDZiqMgx5SH0gV
 FcGg==
X-Gm-Message-State: AOAM532PglxLW11nX3I//u+zLN1QEuIIF5L52E5gXwr61OoLYxuarZdj
 jT9/cA7zxVL/maagNwgFmg==
X-Google-Smtp-Source: ABdhPJzF+Fy8did2QXIYwMFyj+Pr3q+myW/DhiifWrK0n5h2AtQhvpL+QDG4LfcQO07Tc5btOdZCGg==
X-Received: by 2002:aca:b5c4:: with SMTP id e187mr8250914oif.149.1621427643980; 
 Wed, 19 May 2021 05:34:03 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id x78sm888530ooa.15.2021.05.19.05.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 05:34:03 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:9144:ba66:ea13:f260])
 by serve.minyard.net (Postfix) with ESMTPSA id 93A3618000C;
 Wed, 19 May 2021 12:34:02 +0000 (UTC)
Date: Wed, 19 May 2021 07:34:01 -0500
From: Corey Minyard <minyard@acm.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v3 0/7] Add Aspeed SSIF BMC driver
Message-ID: <20210519123401.GG2921206@minyard.net>
References: <20210519074934.20712-1-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519074934.20712-1-quan@os.amperecomputing.com>
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
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 19, 2021 at 02:49:27PM +0700, Quan Nguyen wrote:
> This series add support for the Aspeed specific SSIF BMC driver which
> is to perform in-band IPMI communication with the host in management
> (BMC) side.
> 
> v3:
>   + Switched binding doc to use DT schema format [Rob]
>   + Splited into generic ssif_bmc and aspeed-specific [Corey, Joel]
>   + Removed redundant license info [Joel]
>   + Switched to use traditional if-else [Joel]
>   + Removed unused ssif_bmc_ioctl() [Joel]
>   + Made handle_request()/complete_response() to return void [Joel]
>   + Refactored send_ssif_bmc_response()/receive_ssif_bmc_request() [Corey]
>   + Remove mutex [Corey]
>   + Use spin_lock/unlock_irqsave/restore in callback [Corey]
>   + Removed the unnecessary memset [Corey]
>   + Switch to use dev_err() [Corey]
>   + Combine mask/unmask two interrupts together [Corey]
>   + Fixed unhandled Tx done with NAK [Quan]
>   + Late ack'ed Tx done w/wo Ack irq [Quan]
>   + Use aspeed-specific exported aspeed_set_slave_busy() when slave busy
> to fix the deadlock [Graeme, Philipp, Quan]
>   + Clean buffer for last multipart read [Quan]
>   + Handle unknown incoming command [Quan]
> 
> v2:
>   + Fixed compiling error with COMPILE_TEST for arc
> 
> Quan Nguyen (7):
>   i2c: i2c-core-smbus: Expose PEC calculate function for generic use

Note that for this I2C-specific change, I will need acks from the I2C
maintainers to be able to include this in my tree.

>   ipmi: ssif_bmc: Add SSIF BMC driver
>   i2c: aspeed: Fix unhandled Tx done with NAK

For the aspeed changes, they don't really belong here, they belong in
the aspeed tree.  I see that you need them for the device to work
correctly, though.  I'll need acks from maintainers to include them.

>   i2c: aspeed: Acknowledge Tx done w/wo ACK irq late
>   i2c: aspeed: Add aspeed_set_slave_busy()
>   ipmi: ssif_bmc: Add Aspeed SSIF BMC driver
>   bindings: ipmi: Add binding for Aspeed SSIF BMC driver
> 
>  .../bindings/ipmi/aspeed-ssif-bmc.yaml        |  33 +
>  drivers/char/ipmi/Kconfig                     |  22 +
>  drivers/char/ipmi/Makefile                    |   2 +
>  drivers/char/ipmi/ssif_bmc.c                  | 605 ++++++++++++++++++
>  drivers/char/ipmi/ssif_bmc.h                  |  93 +++
>  drivers/char/ipmi/ssif_bmc_aspeed.c           |  75 +++
>  drivers/i2c/busses/i2c-aspeed.c               |  51 +-
>  drivers/i2c/i2c-core-smbus.c                  |  12 +-
>  include/linux/i2c.h                           |   1 +
>  9 files changed, 884 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-ssif-bmc.yaml
>  create mode 100644 drivers/char/ipmi/ssif_bmc.c
>  create mode 100644 drivers/char/ipmi/ssif_bmc.h
>  create mode 100644 drivers/char/ipmi/ssif_bmc_aspeed.c
> 
> -- 
> 2.28.0
> 
