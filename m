Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 012412AFBB4
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 00:35:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWh0x5lbtzDqSK
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 10:35:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=bSYQInO/; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWh065xZ4zDqQr;
 Thu, 12 Nov 2020 10:34:27 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id j31so2721284qtb.8;
 Wed, 11 Nov 2020 15:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KnLt8VXQwwM0iYUheRJOiNo0F+wh49CPTe2gDfhO7W8=;
 b=bSYQInO/99sJwYtrycfWh2p+Q1AZAdK+UIgIk/sTa62d96oToAujYSzo1mXEwXkD0x
 Or98pU873ZtbSXzDUetksAxIxA8zGSGCwDFCX0xOZXe4XlLkar/ov+O+MJUH0X/TYCwh
 TB+35Ly2xbXJ2r9425YbecqXgoDl2Saf2L13Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KnLt8VXQwwM0iYUheRJOiNo0F+wh49CPTe2gDfhO7W8=;
 b=fmv5cTDGbUudXx+NUZ6jWndUslaY8BouJbPtJzjnsVmGuiigWfXW6jrP0dDDN8g7uB
 Z5b8/XIB9BXDWCgHoaEBPEn6cXB4SAUd7JpKUuMGvCVUT7iH9uDX4kfY4RZaRAb7Lt84
 QOhMqYSBVJs2OwlL2dH7fEnAYJ8aq+S3v0Qd4YbJmjPhxWBziKRJNdrEtUWefrOSQkFW
 d4Pv2rdiM/q+DB7GNSsZKuy0bNFv4XPdq9SwCYJFI/shUBxe3y/0/rPY/EMUVKfiLyuD
 iylo022LZnJGe0C3iXHtP5HbdJ2QPg/bYrnW82Tynzl/tWw+JVKO7qCqn9147xig/uvH
 9XlA==
X-Gm-Message-State: AOAM532jrg0o3zu085VZpr7/DnH6IgU/gtJvgD9DAOBxKdBTXRQEx3ts
 Jy325fG5Mn8lkCKwJnMe8mN6LukB3gohLpXuwNA=
X-Google-Smtp-Source: ABdhPJwcjoyijjlf9fwP/sU1FX6AbUsAS3hkkdBB32/dHqXA3RyjccEybxC7rChDrlK0oiWb72YIjY8nc0FZJRARCAg=
X-Received: by 2002:ac8:5854:: with SMTP id h20mr25684587qth.176.1605137662938; 
 Wed, 11 Nov 2020 15:34:22 -0800 (PST)
MIME-Version: 1.0
References: <20201111232330.30843-1-rentao.bupt@gmail.com>
In-Reply-To: <20201111232330.30843-1-rentao.bupt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Nov 2020 23:34:10 +0000
Message-ID: <CACPK8XdC8FRKOLQ9e583gVuDrL5829MOfx5L=O68dou6mjW_6g@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: dts: aspeed: Add Facebook Galaxy100 BMC
To: Tao Ren <rentao.bupt@gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 11 Nov 2020 at 23:23, <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> The patch series adds the initial version of device tree for Facebook
> Galaxy100 (AST2400) BMC.
>
> Patch #1 adds common dtsi to minimize duplicated device entries across
> Facebook Network AST2400 BMC device trees.
>
> Patch #2 simplfies Wedge40 device tree by using the common dtsi.
>
> Patch #3 simplfies Wedge100 device tree by using the common dtsi.
>
> Patch #4 adds the initial version of device tree for Facebook Galaxy100
> BMC.

Nice. They look good to me.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Is there another person familiar with the design you would like to
review before I merge?


>
> Tao Ren (4):
>   ARM: dts: aspeed: Common dtsi for Facebook AST2400 Network BMCs
>   ARM: dts: aspeed: wedge40: Use common dtsi
>   ARM: dts: aspeed: wedge100: Use common dtsi
>   ARM: dts: aspeed: Add Facebook Galaxy100 (AST2400) BMC
>
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../dts/aspeed-bmc-facebook-galaxy100.dts     |  57 +++++++++
>  .../boot/dts/aspeed-bmc-facebook-wedge100.dts | 120 +++---------------
>  .../boot/dts/aspeed-bmc-facebook-wedge40.dts  | 112 +---------------
>  .../dts/ast2400-facebook-netbmc-common.dtsi   | 117 +++++++++++++++++
>  5 files changed, 191 insertions(+), 216 deletions(-)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-galaxy100.dts
>  create mode 100644 arch/arm/boot/dts/ast2400-facebook-netbmc-common.dtsi
>
> --
> 2.17.1
>
