Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 507FC3A88C7
	for <lists+openbmc@lfdr.de>; Tue, 15 Jun 2021 20:47:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4HP70Hl8z2ym5
	for <lists+openbmc@lfdr.de>; Wed, 16 Jun 2021 04:47:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=AkDl/pWC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32d;
 helo=mail-ot1-x32d.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AkDl/pWC; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4HNq4Ls8z2yXS;
 Wed, 16 Jun 2021 04:47:06 +1000 (AEST)
Received: by mail-ot1-x32d.google.com with SMTP id
 w22-20020a0568304116b02904060c6415c7so12970721ott.1; 
 Tue, 15 Jun 2021 11:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=M0jPcyN+0GksOscsUu1GV8Mpyh0R661ZmzEHh6E/AMs=;
 b=AkDl/pWCrmnX6WAe8kjc7Wu2g9cEQcW98r+hZ/47zJliuKZ3xPv4lrcY57XTWjjCPN
 TjDxOAuDg549gDq99JX8OINGoRcK9OMKQwzfF4EeKoPx+0wHS1mRdtircff8T97yLmkc
 Vz3ZGBcK/nrDKZg/iaRS6UurBkq7EnJqDlo8mgG8s5pSPB9dG8sia604BeCydvudAoPv
 qcb63CZN0VPQFmYzTsivOp3pohEJOvQJB6ZmSBWX/lxmFFm5R6W7LdFzgmp0ZKYeIEMQ
 TDWvaOEEqRlZflUBxRXidrsGv+QaNPpu+/aRnHiURxqxmURv04tQxyOUaTyA+AarqVIs
 ieNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=M0jPcyN+0GksOscsUu1GV8Mpyh0R661ZmzEHh6E/AMs=;
 b=mE0Kk/SQc7Z4o+t1Alvi+Drsene3A8uSewp8qI31PWMmTT0wS+5y4l7jYbG+KpeOiQ
 TAdWboItYLruReP7fydOhUpX+734oPmLa3UDXD2geordVCm7QhQgGFxIZteI4yNm52JD
 KKa+ExIHmqMafE4Q93rsQlnLC21lzQDB23cnpElngycW7oNK6Gknw9VA/DuFRlDhw/Jy
 EzZnYJU80y7fe87iS90SfdcSjwbP7+qVl9uqLhPgj1cQIt2VWPIMEpcim2UMh3NkAun3
 0kusATTd6E6Zh4e9z70AmfHg1WHpBiEW72CwV21UQ28863v+PfaLVJ920Bu4jKXXTQ69
 wtog==
X-Gm-Message-State: AOAM533l5qw8OCTYDu520xYwKvvkUFasDKV2CFNWdSvjF6b5AyGh0y2c
 H9Zs3lRB/eaSZk4vRMoOlw==
X-Google-Smtp-Source: ABdhPJxQ9rkGnGivDEkuBfraFu5hFHW+Mr+Pxscs4LsNz+yhlOVsSAou40KfWpqyzu7Hu5pbUpQVVw==
X-Received: by 2002:a9d:6a03:: with SMTP id g3mr502028otn.189.1623782821114;
 Tue, 15 Jun 2021 11:47:01 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id r1sm4355328oth.19.2021.06.15.11.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 11:47:00 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:50dd:ab38:f475:bd86])
 by serve.minyard.net (Postfix) with ESMTPSA id 258ED180293;
 Tue, 15 Jun 2021 18:46:59 +0000 (UTC)
Date: Tue, 15 Jun 2021 13:46:57 -0500
From: Corey Minyard <minyard@acm.org>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v4 00/16] ipmi: Allow raw access to KCS devices
Message-ID: <20210615184657.GF2921206@minyard.net>
References: <20210608104757.582199-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608104757.582199-1-andrew@aj.id.au>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com,
 linux-aspeed@lists.ozlabs.org, KWLIU@nuvoton.com, avifishman70@gmail.com,
 venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 tali.perry1@gmail.com, robh+dt@kernel.org, arnd@arndb.de,
 openipmi-developer@lists.sourceforge.net, zweiss@equinix.com,
 chiawei_wang@aspeedtech.com, linux-arm-kernel@lists.infradead.org,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 08, 2021 at 08:17:41PM +0930, Andrew Jeffery wrote:
> 
> Hello,
> 
> This is the 4th spin of the series refactoring the keyboard-controller-style
> device drivers in the IPMI subsystem.

Ok, no comments and everything looks good, I have this queued for the
next Linux release.

Thanks,

-corey

> 
> v3 can be found at:
> 
> https://lore.kernel.org/lkml/20210510054213.1610760-1-andrew@aj.id.au/
> 
> v4:
> 
> * Makes kcs_bmc_add_device() return an error if no client successfully
>   initialised with respect to the binding of the device driver
> * Retains the existing single-open semantics (v3 allowed multiple-open)
> * Fixes the OBE macro for the NPCM7xx KCS driver
> * Cleans up Yoda-style masks (mask constant on the LHS rather than RHS)
> * Cleans up includes in kcs_bmc_client.h
> * Adds some comments to the SerIO adapter to clarify object lifetimes
> 
> Previously:
> 
> Changes in v3:
> 
> * The series was rebased onto v5.13-rc1
> * v5.13-rc1 includes Chiawei's patches reworking the LPC devicetree bindings,
>   so they're no-longer required in the series.
> * After some discussion with Arnd[1] and investigating the serio subsystem,
>   I've replaced the "raw" KCS driver (patch 16/21 in v2) with a serio adaptor
>   (patch 11/16 in this series). The adaptor allows us to take advantage of the
>   existing chardevs provided by serio.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/37e75b07-a5c6-422f-84b3-54f2bea0b917@www.fastmail.com/
> 
> Changes in v2 include:
> 
> * A rebase onto v5.12-rc2
> * Incorporation of off-list feedback on SerIRQ configuration from
>   Chiawei
> * Further validation on hardware for ASPEED KCS devices 2, 3 and 4
> * Lifting the existing single-open constraint of the IPMI chardev
> * Fixes addressing Rob's feedback on the conversion of the ASPEED KCS
>   binding to dt-schema
> * Fixes addressing Rob's feedback on the new aspeed,lpc-interrupts
>   property definition for the ASPEED KCS binding
> 
> Please test and review!
> 
> Andrew
> 
> Andrew Jeffery (16):
>   ipmi: kcs_bmc_aspeed: Use of match data to extract KCS properties
>   ipmi: kcs_bmc: Make status update atomic
>   ipmi: kcs_bmc: Rename {read,write}_{status,data}() functions
>   ipmi: kcs_bmc: Split out kcs_bmc_cdev_ipmi
>   ipmi: kcs_bmc: Turn the driver data-structures inside-out
>   ipmi: kcs_bmc: Split headers into device and client
>   ipmi: kcs_bmc: Strip private client data from struct kcs_bmc
>   ipmi: kcs_bmc: Decouple the IPMI chardev from the core
>   ipmi: kcs_bmc: Allow clients to control KCS IRQ state
>   ipmi: kcs_bmc: Enable IBF on open
>   ipmi: kcs_bmc: Add serio adaptor
>   dt-bindings: ipmi: Convert ASPEED KCS binding to schema
>   dt-bindings: ipmi: Add optional SerIRQ property to ASPEED KCS devices
>   ipmi: kcs_bmc_aspeed: Implement KCS SerIRQ configuration
>   ipmi: kcs_bmc_aspeed: Fix IBFIE typo from datasheet
>   ipmi: kcs_bmc_aspeed: Optionally apply status address
> 
>  .../bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml | 106 +++
>  .../bindings/ipmi/aspeed-kcs-bmc.txt          |  33 -
>  drivers/char/ipmi/Kconfig                     |  27 +
>  drivers/char/ipmi/Makefile                    |   2 +
>  drivers/char/ipmi/kcs_bmc.c                   | 523 ++++-----------
>  drivers/char/ipmi/kcs_bmc.h                   |  92 +--
>  drivers/char/ipmi/kcs_bmc_aspeed.c            | 633 +++++++++++++-----
>  drivers/char/ipmi/kcs_bmc_cdev_ipmi.c         | 568 ++++++++++++++++
>  drivers/char/ipmi/kcs_bmc_client.h            |  45 ++
>  drivers/char/ipmi/kcs_bmc_device.h            |  22 +
>  drivers/char/ipmi/kcs_bmc_npcm7xx.c           |  92 ++-
>  drivers/char/ipmi/kcs_bmc_serio.c             | 157 +++++
>  12 files changed, 1594 insertions(+), 706 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/aspeed,ast2400-kcs-bmc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
>  create mode 100644 drivers/char/ipmi/kcs_bmc_cdev_ipmi.c
>  create mode 100644 drivers/char/ipmi/kcs_bmc_client.h
>  create mode 100644 drivers/char/ipmi/kcs_bmc_device.h
>  create mode 100644 drivers/char/ipmi/kcs_bmc_serio.c
> 
> -- 
> 2.30.2
> 
