Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0898A179DF0
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 03:37:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XvzF25xPzDqkG
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 13:37:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uE5L3OIF; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XvyL04MXzDqjv;
 Thu,  5 Mar 2020 13:36:23 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id f2so3174086pjq.1;
 Wed, 04 Mar 2020 18:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Vq5qjs7qz67UNM1UqkjHI/TeAVWlJM1Ckq9qqFzOF58=;
 b=uE5L3OIFH7hgJXdE2xCGSnwOEDkEdOH6qfYcBHj7RrpUuVb8NudQzuYzTLzNigApeY
 xobwj3AdEYtxjBRciNj1RXv+Qnem14byPSHBdlQcEErL8Dxx25Orm2wuubO/5QumyzO5
 zgN0+CUWswBgTFj0daaQ2uMSjwp+6ucbZkxp4g+BLqqsemJCNXTDjsienFBprKW2wgsk
 fo1whqLhoCLPykP2ghqcoFgLOPuhiiybH5KKwGp0bH7/6lQ3Qyygp6OJRjkPrLUElinK
 yP+ZWBnjOtFegqqs54R0PVV4caZaYQbjqsQtShhCVSGY0pv0enLCA7MU50OpdnfIEPDt
 bdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Vq5qjs7qz67UNM1UqkjHI/TeAVWlJM1Ckq9qqFzOF58=;
 b=h4LN5+yGxtc18rOduVCCRVZ3IuoZzj9YY6400FMmTRDWId5893T3GZ57buxn6Y3C1H
 w0P9LVIzyIlDv25S9dNpMLIbXrP9trEskh8PUeJtJw2ULF8rzQh0LbapEWlpKdbkjl/v
 gCWtM7VQ6zNSJFM2jEpuU8MJDMDWwtttpBNl/L2X1MWvRMH3uObYiK97IloAYMuYVCaO
 7SQE/iRk4zOsjtKFx5X4P+cne7kCSKbWql5vG+Ec3CazpXMBUZpOjNmfpHCLoW3bR2zR
 NqJHXokuL9frumD7jkYSU+4z+giBje+iy4pkjqwt7q5ggFKKzcobKSC+XxJ+LcTgVHSf
 ad0A==
X-Gm-Message-State: ANhLgQ3wVzt7kaL0vFfQHi3DpZn4bu+oKz8s/lVp7nk10j7obL2X68vr
 MfeoNO7vWzQZb1JGR8FDypE=
X-Google-Smtp-Source: ADFU+vtegKp7SsWIhtQi5FLswdvNjiO6nAc+nLdA+8v8NJ3m8Z1MDgeAPG6oduDk7/r++EGg7Ok6bA==
X-Received: by 2002:a17:90a:8806:: with SMTP id
 s6mr6165058pjn.141.1583375780299; 
 Wed, 04 Mar 2020 18:36:20 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:500::5:7dc6])
 by smtp.gmail.com with ESMTPSA id b3sm3961744pjo.30.2020.03.04.18.36.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 04 Mar 2020 18:36:19 -0800 (PST)
Date: Wed, 4 Mar 2020 18:36:11 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 7/7] dt-bindings: usb: add documentation for aspeed
 usb-vhub
Message-ID: <20200305023609.GA15787@taoren-ubuntu-R90MNF91>
References: <20200303062336.7361-1-rentao.bupt@gmail.com>
 <20200303062336.7361-8-rentao.bupt@gmail.com>
 <20200304161610.GA26873@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200304161610.GA26873@bogus>
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
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, taoren@fb.com, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 04, 2020 at 10:16:10AM -0600, Rob Herring wrote:
> On Mon,  2 Mar 2020 22:23:36 -0800, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Add device tree binding documentation for the Aspeed USB 2.0 Virtual HUb
> > Controller.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > ---
> >  Changes in v7:
> >    - updated to dual license.
> >    - removed description for "reg" and "clocks" properties.
> >    - Added constraints (minimum/maximum/default) for vendor specific
> >      properties.
> >  Changes in v6:
> >    - added 2 required properties into example and passed "make
> >      dt_binding_check".
> >  Changes in v5:
> >    - updated maintainer to Ben.
> >    - refined patch description per Joel's suggestion.
> >  No change in v2/v3/v4:
> >    - the patch is added to the patch series since v4.
> > 
> >  .../bindings/usb/aspeed,usb-vhub.yaml         | 77 +++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks Rob.

Cheers,

Tao
