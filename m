Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC90A2EC06B
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 16:32:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9tfZ0q41zDqjh
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 02:32:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.47; helo=mail-io1-f47.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9tdk1vVmzDqfH;
 Thu,  7 Jan 2021 02:32:09 +1100 (AEDT)
Received: by mail-io1-f47.google.com with SMTP id z5so3065173iob.11;
 Wed, 06 Jan 2021 07:32:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t80RrQIP9pcWO65dqznFuyn9d1RG+MW1J0H6Xs08o5Q=;
 b=bnfpJu+r47+oXtW69r8HlX6R3QUIDfrQXWvM12mkoB9+AVqXN+u5VCzJFX6kVAwspJ
 rPLsv6ddSlkCebcxziDGneVY61Mtgbr+KvGt6chV/f9uFyed3iDdsszpYPHIAt2Y+awF
 vhBgFenp85HERKDOYfl3aoLCjrzfSFx2Nq6+aBYIp6rMwjthoyy33rONVoIopT8EFTzu
 kwhc/BI4ao8UB8JgbtO8u4HniIlPT4rV3P5rpuBn6n97nkOfm0a7w2MSWk9nn/NZxF75
 roZb11OADaovHZFvVXCrPMaWDdYVFI04GmP7uHwcN2HFFSl1eHIvXyW6GhyJawiw0dmZ
 7Pog==
X-Gm-Message-State: AOAM5313wx9mgpbNUmuTuewAy5ZD+mNl+0i7cbhjiBDbU1qdPWgFkSWI
 C9nHJxonNxTkkRRpM7jCGA==
X-Google-Smtp-Source: ABdhPJyz6kf7fccUgN42Q21kf9oT8emUqUG0qvmMQDGTyBYyMTKFCZbUVC4pPwY/vKQfpxrz6D+Cnw==
X-Received: by 2002:a02:b709:: with SMTP id g9mr4250778jam.90.1609947126638;
 Wed, 06 Jan 2021 07:32:06 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id n10sm2371751ila.69.2021.01.06.07.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 07:32:05 -0800 (PST)
Received: (nullmailer pid 2267272 invoked by uid 1000);
 Wed, 06 Jan 2021 15:32:02 -0000
Date: Wed, 6 Jan 2021 08:32:02 -0700
From: Rob Herring <robh@kernel.org>
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH 5/6] soc: aspeed: Add eSPI driver
Message-ID: <20210106153202.GA2258036@robh.at.kernel.org>
References: <20210106055939.19386-1-chiawei_wang@aspeedtech.com>
 <20210106055939.19386-6-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106055939.19386-6-chiawei_wang@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com, andrew@aj.id.au, maz@kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jan 06, 2021 at 01:59:38PM +0800, Chia-Wei, Wang wrote:
> The Aspeed eSPI controller is slave device to communicate with
> the master through the Enhanced Serial Peripheral Interface (eSPI).
> All of the four eSPI channels, namely peripheral, virtual wire,
> out-of-band, and flash are supported.
> 
> Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
> ---
>  drivers/soc/aspeed/Kconfig                  |  49 ++
>  drivers/soc/aspeed/Makefile                 |   5 +
>  drivers/soc/aspeed/aspeed-espi-ctrl.c       | 197 ++++++
>  drivers/soc/aspeed/aspeed-espi-flash.c      | 490 ++++++++++++++
>  drivers/soc/aspeed/aspeed-espi-oob.c        | 706 ++++++++++++++++++++
>  drivers/soc/aspeed/aspeed-espi-peripheral.c | 613 +++++++++++++++++
>  drivers/soc/aspeed/aspeed-espi-vw.c         | 211 ++++++
>  include/uapi/linux/aspeed-espi.h            | 160 +++++
>  8 files changed, 2431 insertions(+)
>  create mode 100644 drivers/soc/aspeed/aspeed-espi-ctrl.c
>  create mode 100644 drivers/soc/aspeed/aspeed-espi-flash.c
>  create mode 100644 drivers/soc/aspeed/aspeed-espi-oob.c
>  create mode 100644 drivers/soc/aspeed/aspeed-espi-peripheral.c
>  create mode 100644 drivers/soc/aspeed/aspeed-espi-vw.c

drivers/spi/ is the correct location for a SPI controller.

>  create mode 100644 include/uapi/linux/aspeed-espi.h

This userspace interface is not going to be accepted upstream.

I'd suggest you look at similar SPI flash capable SPI controller drivers 
upstream and model your driver after them. This looks like it needs 
major reworking.

Rob
