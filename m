Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8927315836D
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2020 20:17:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GbJG6tsGzDqLd
	for <lists+openbmc@lfdr.de>; Tue, 11 Feb 2020 06:17:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fEJ34Y6B; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GbHW00x5zDqCt;
 Tue, 11 Feb 2020 06:16:36 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id d6so4411065pgn.5;
 Mon, 10 Feb 2020 11:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FR5Haon15BG7fZreS9CoW6URIzJo2qBtC7hHF2/jroU=;
 b=fEJ34Y6BdA6w6G5S2Jhq1WIaZBcBZl0N1iHwv29/wstPx85iA7k/XQuCVR0ogOx1rM
 CyCAPsaV9pFqXT17ET1G1SSpmC5y7bHHsRRVLu3db4hLyVQdfq/crCKdsMtmlkKW6yrN
 cv9QaAcAKSqGCAf+m9F+bzSOVnTVajmt5aJo1ft0ViBAusQlf7gxEKgroFK5ocp0+pJ6
 fME7BZW/0CGHztYJCLOHUWJNT/Vnjb2qIhUmHKCHOrvupR3Al2yRErRrtd9pLWvv0sxT
 GK0V02k2wJ8MdtNyYltsbxXKMvWyGEhoy5SC7o0n4vj/Y5UwN8TDl3w/f/4Ix5zPQOrb
 eSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FR5Haon15BG7fZreS9CoW6URIzJo2qBtC7hHF2/jroU=;
 b=PbM8Lqg7ZyhDi42sEr67NEKd6XMoolBPJfsogLwYccNmGIrYqWtfA+2HrtAJKPFzdA
 hqjoS/kTfnlcP8mty87j+iiXN8JGDjwaKkRJbqu7pdpiO/D8v4kr6VO34bJw62/oje/1
 DJ+AvqteG/0Ze+hYTCpqkrnI3APLdrZNJ2+uS297o3FDQkQVLvYPpuiSQKYwYVDGuJaI
 tPOBA2/TTfMGViDK9cAIQLZ6EIFtsx2knP3quP3X8tBhbPl8tXfWWzY5rdR/0OMChl4p
 h3gHtTci6CVNrCWh1gKzXFHnKuUyvmdJo5OCdpxLpYwmGMIzh4YsbZMR6pPcoqnf+Cbm
 Orug==
X-Gm-Message-State: APjAAAVv30cjxqxVpPNWFfKK5pDZsde4b/jsWn7MR1jzObZfr2SataIt
 nMefBNwlMgi+CKYYxyDcIZU=
X-Google-Smtp-Source: APXvYqwPiKX4wT4FkdKVUqaP0LU+nKJY5DjilOXG82qBEoG10vdlSb+ndGb96C5hXAksxQfSq6VqJQ==
X-Received: by 2002:aa7:9808:: with SMTP id e8mr2597823pfl.32.1581362193401;
 Mon, 10 Feb 2020 11:16:33 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:200::2:87f0])
 by smtp.gmail.com with ESMTPSA id i9sm1168592pfk.24.2020.02.10.11.16.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Feb 2020 11:16:33 -0800 (PST)
Date: Mon, 10 Feb 2020 11:16:30 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 1/3] usb: gadget: aspeed: read vhub config from
 of_device_id
Message-ID: <20200210191629.GB5346@taoren-ubuntu-R90MNF91>
References: <20200131222157.20849-1-rentao.bupt@gmail.com>
 <20200131222157.20849-2-rentao.bupt@gmail.com>
 <CACPK8Xe0b+zVNqf8v5YXOLkzqDeb4JHqec-bqFpaVFGTwHThhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xe0b+zVNqf8v5YXOLkzqDeb4JHqec-bqFpaVFGTwHThhA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 devicetree <devicetree@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Feb 10, 2020 at 02:47:02AM +0000, Joel Stanley wrote:
> On Fri, 31 Jan 2020 at 22:22, <rentao.bupt@gmail.com> wrote:
> >
> > From: Tao Ren <rentao.bupt@gmail.com>
> >
> > The patch moves hardcoded vhub attributes (maximum downstream ports and
> > generic endpoints) to "ast_vhub_config" structure which is attached to
> > struct of_device_id. The major purpose is to add AST2600 vhub support
> > because AST2600 vhub provides more downstream ports and endpoints.
> >
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> 
> This looks generally okay. We should wait for Ben's ack before applying.
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks Joel for reviewing the patches.

Cheers,

Tao
