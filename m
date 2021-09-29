Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D3441C9C2
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 18:09:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKLt32lz5z2yp0
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 02:09:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GRyIXxJR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GRyIXxJR; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKLsc4l76z2ynD;
 Thu, 30 Sep 2021 02:09:08 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3162614C8;
 Wed, 29 Sep 2021 16:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632931746;
 bh=dijA/w5Ov8JsJ92OsBZBg2039bqDhk6Rb6AyNDbPn44=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GRyIXxJRfhKnK+5BsD7UPdntuXaYJW7vCYQvWn+f0QNjEzDswUR3beLY725k/ywah
 pgk0VTyWSnghpm7b3jd5rukV17M7zrndu73QGAHb9z/AbMSY0xC9L7qGSxYaFur3zV
 SOEnw7Ndd+VxVefysrsTkU/1HJhx1UtnJzNtTXP0drpY4v/EQKwOAT1Jns0gCHx6bs
 gotz+sEpll71VuEdzUBV/VhdXwype2Kia/6cL/R7AKULTOhSz3CThgV2/2dgUxJifO
 rQyiJtoAotBvNXDHRKl8jD2+P5enqi2LXmnERa6N9bi44h75Wwb28Lf5keher5H7dV
 K6447FBzUOM1A==
Received: by mail-ed1-f48.google.com with SMTP id v18so10431896edc.11;
 Wed, 29 Sep 2021 09:09:05 -0700 (PDT)
X-Gm-Message-State: AOAM531XyEv6bQmz9ALmx5De504E7Go5QM0MdDV27twLHaG80iRlh+IY
 5mWP+nLbbILZbtPePSQSm+9k4aRlxttsi7clVQ==
X-Google-Smtp-Source: ABdhPJzrMbYO0rSYnqgmEqL2Di5ODf2KFSFLA0nJG3BUUjFxO4DRvWKc4rYXRSAUryn3020YRQn63vQqdkNzIXSPDII=
X-Received: by 2002:a17:906:7250:: with SMTP id
 n16mr562242ejk.147.1632931694940; 
 Wed, 29 Sep 2021 09:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210929115409.21254-1-zev@bewilderbeest.net>
In-Reply-To: <20210929115409.21254-1-zev@bewilderbeest.net>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 29 Sep 2021 11:08:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJH+b5oFuSP+KBLBsN5QTA6xASuqXJWXUaDkHhugXPpnQ@mail.gmail.com>
Message-ID: <CAL_JsqJH+b5oFuSP+KBLBsN5QTA6xASuqXJWXUaDkHhugXPpnQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] Dynamic aspeed-smc flash chips via "reserved" DT
 status
To: Zev Weiss <zev@bewilderbeest.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Frank Rowand <frowand.list@gmail.com>,
 Pratyush Yadav <p.yadav@ti.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 29, 2021 at 6:54 AM Zev Weiss <zev@bewilderbeest.net> wrote:
>
> Hello,
>
> This patch series aims to improve a scenario that arises in OpenBMC
> and which isn't handled very well at the moment.  Certain devices, the
> example at hand being the flash chip used to store the host's firmware
> (e.g. the BIOS), may be shared between the BMC and the host system but
> only available to one or the other at any given time.  The device may
> thus be effectively off-limits to the BMC when it boots, and only
> usable after userspace performs the necessary steps to coordinate
> appropriately with the host (tracking its power state, twiddling
> GPIOs, sending IPMI commands, etc.).
>
> Neither the "okay" nor the "disabled" device-tree status values works
> nicely for the flash device this case -- an "okay" device gets probed
> automatically as soon as the device and a driver for it are available,
> and a "disabled" one gets forgotten about entirely, whereas we want
> the BMC's kernel to be aware of the existence of the device, but not
> try to actually do anything with it (i.e. probe it) until explicitly
> requested to do so by userspace.

While Linux treats 'disabled' as gone forever, that's not exactly what
the spec says. Either disabled or reserved could change in theory. But
I do agree 'reserved' is the right choice for your use.

> However, while there's no support for it currently in the kernel tree,
> the device-tree spec [0] also lists "reserved" as a possible status
> value, and its description seems like a fairly reasonable fit for this
> situation:
>
>   Indicates that the device is operational, but should not be used.
>   Typically this is used for devices that are controlled by another
>   software component, such as platform firmware.
>
> These patches start making use of this status value in the aspeed-smc
> driver.  The first patch adds a companion routine to
> of_device_is_available() that checks for a "reserved" status instead
> of "okay".  The second patch is a small MTD adjustment to allow an
> unregistered device to be cleanly re-registered.  Patches 3 through 5
> modify the aspeed-smc driver to allow individual chips to be attached
> and detached at runtime, and to avoid automatically attaching any
> marked as reserved.  Finally, patch 6 employs the newly-supported
> status in adding support for the BIOS flash device to the ASRock Rack
> e3c246d4i BMC.

I'm not sure this should be MTD specific. There's other cases where we
may want devices to become available. So the question is whether there
should be a more generic mechanism rather than each subsystem coming
up with their own thing.

There's out of tree support for applying overlays which could be used
here. The issue with it is we don't want it to be unconstrained where
an overlay can make any change anywhere in a DT.

Another possibility is making 'status' writeable from userspace. It is
just a sysfs file. That too may need to be opt-in.

Rob
