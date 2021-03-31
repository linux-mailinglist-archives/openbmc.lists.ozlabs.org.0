Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7079734FABC
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 09:51:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9JQv375rz304Q
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 18:51:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PTGFvl2R;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=PTGFvl2R; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9JQc6NbGz2yx8;
 Wed, 31 Mar 2021 18:50:47 +1100 (AEDT)
Received: by mail-qk1-x733.google.com with SMTP id c3so18511086qkc.5;
 Wed, 31 Mar 2021 00:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PvFE5J3FezlEE8pnDN5zAGS+SdlnCyime9vQnsZ9wkY=;
 b=PTGFvl2RypZxM0OoGUctoQGNsTqmeQLWPd4faKZB3LNwJY5otlqSbQokWFD+XxB4cZ
 k7JcAGMHpQ6KFSA1ShU4X+lxf2geDdc31fr0WaZmQY56ejVKYekOO2OgPZ+IUK3N0tjk
 rXeVUBoRE+TKa8974Zv0HzFjrsw95+klEl990=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PvFE5J3FezlEE8pnDN5zAGS+SdlnCyime9vQnsZ9wkY=;
 b=YCd/aJtireby4JX8vVrrZ9W10/4JzGrXgfPSt7Dx9MmKdC6jvWurjRgYqzrpygnuXr
 6p2WoDh5TPoqTFHC3D2ESPW+/LfeRh/YcmzU2x13KxGg7bkH9MKV2Y3SFTkVmGpMmscI
 gdSgvQmkzbI8EB1OOpEY9k5xBGqsIIudZfpWC2YHbbGNNjLqVXJYx4+ZqmctuDOxQGm+
 4yzEDYgh7kA8hK1K2dDTz+0USrHimY7iVLdbOY6+5KH4o7s1MPcsWC+vQYV8A0b/lubr
 rsTR8ZtgkoR7PG1xWhezZZctPuHIWpuhT+szXISgJ2fji/cQblk3ZREru2wa95aymkoV
 9c/Q==
X-Gm-Message-State: AOAM532mMFMZoTj+rhp2cSzU0EJyDC7R4uxmrxuLYlGz+mZEyX6EOs6O
 KyH38MpaQeewpEBQwfK3ikQ/x8UCFK5MfTqfd8g=
X-Google-Smtp-Source: ABdhPJyMt3JEgZQNa/c4w8WpbFN1v/ZWTRBHzplPfi6vA5v5QT21JEeEclDxFGpB1WMPbDt6DMynOc5coOB4FZ/iNj0=
X-Received: by 2002:a37:d202:: with SMTP id f2mr1940297qkj.273.1617177044244; 
 Wed, 31 Mar 2021 00:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210330002338.335-1-zev@bewilderbeest.net>
 <20210330002338.335-4-zev@bewilderbeest.net>
 <CACPK8XcwMYgc9R24KuGa0hqKQAxawDScHp1+y62aeEvcpvPiSw@mail.gmail.com>
In-Reply-To: <CACPK8XcwMYgc9R24KuGa0hqKQAxawDScHp1+y62aeEvcpvPiSw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 Mar 2021 07:50:32 +0000
Message-ID: <CACPK8XfBsq6H5qsSNgwqdRhHXTUYnNQKekSNMnxXoVaAzMc=MQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: aspeed: add ASRock E3C246D4I BMC
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 31 Mar 2021 at 07:41, Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 30 Mar 2021 at 00:25, Zev Weiss <zev@bewilderbeest.net> wrote:
> >
> > This is a relatively low-cost AST2500-based Xeon E-2100/E-2200 series
> > mini-ITX board that we hope can provide a decent platform for OpenBMC
> > development.
> >
> > This initial device-tree provides the necessary configuration for
> > basic BMC functionality such as host power control, serial console and
> > KVM support, and POST code snooping.
> >
> > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> > ---
> >  .../boot/dts/aspeed-bmc-asrock-e3c246d4i.dts  | 188 ++++++++++++++++++
> >  1 file changed, 188 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts
> > new file mode 100644
> > index 000000000000..27b34c3cf67a
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed-bmc-asrock-e3c246d4i.dts

When adding the device tree please also add it to the makefile in
arch/arm/boot/dts.
