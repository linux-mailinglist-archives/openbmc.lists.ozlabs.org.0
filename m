Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D882521FF
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 22:27:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbgXW6Lb8zDqXv
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 06:27:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CvyGmsYJ; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbgWc5GrDzDqWX;
 Wed, 26 Aug 2020 06:26:52 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id d22so8234992pfn.5;
 Tue, 25 Aug 2020 13:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hViqvBMVikZrtzrVDOIX1RxTOt+cw+ucTuPZjUrSRMo=;
 b=CvyGmsYJE8o29oOkb16rdJUytyHwpjTL1ouL7mheA5ViFyotFWyMuusPvKOVIzBbao
 HN1Ig6W+VoQ7ji2J5SeTMm9hgcmbJGc974ulDXgx5Cu5KtSkkeFVuRWgpfBuOG9L5Inq
 SSuCNeAm67gf3igbQQwKf2DGmEFDS6hemU2rSlNvD7NYXFUMYqXTTedtriqLwljgcA7m
 nPHZIIFT7+9I2t85zlwF5+FrQLikhSIbSnacdWTSbVy8Drlv/Rq1VTHBytSUOsCcJpPT
 2TfQY0CnhmLmeH8JmHNmTA6lyAMr1ZFUn9cW9yaswKbCXx2xA4Bu/fTIU/lv14A92s4q
 VKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hViqvBMVikZrtzrVDOIX1RxTOt+cw+ucTuPZjUrSRMo=;
 b=hG0dvSzh11HntS8QwQNuZe7R76ftxlOtGqJggBKC/fybC0f4QJ7yA843x7iWutaLmm
 rLXvk5pk0DcMX6edRRvDpRSb97Ps7Kc8pB5iSYB2Jcte+lF/ntI4/iAd/0xS3IVgNnZM
 iMDUriD3N/kQSUIhCmzGrK0c65u7R0xJm3sQ3q/ZXKv2WCu6VcdhivSMTMhgNgk0B2aQ
 cnVhkfYGkm4rPTVTnRk6D4cuxVKzT0PEhLTC93TJ0tdhF8hjQkVAn47SwLVHv8g6A+9z
 noHivotv0CZ3ZK0n8x/YUK6phiqq00KDFZPtLjtFXrUiczgQ4gDWfr6QckVyd4+2KaL6
 dEZA==
X-Gm-Message-State: AOAM53135Mc34QPTvSoSPbi9DqUV0IQZd3dfWpUAuHLWmhnQe/hUOdFL
 xncCk7JSv9WFiRriNBQc7r8=
X-Google-Smtp-Source: ABdhPJzQ5pw3dFa8nSlHXAXCWo8jZx7k/xr4WSZtGq0OJpfhKUc1gXp8HphomS3PeFnoTJql1GICUw==
X-Received: by 2002:a63:7e55:: with SMTP id o21mr8126549pgn.5.1598387210237;
 Tue, 25 Aug 2020 13:26:50 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id x15sm82677pfr.208.2020.08.25.13.26.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Aug 2020 13:26:49 -0700 (PDT)
Date: Tue, 25 Aug 2020 13:26:43 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [PATCH 4/5] ARM: dts: aspeed: minipack: Update 64MB FMC flash
 layout
Message-ID: <20200825202642.GA23335@taoren-ubuntu-R90MNF91>
References: <20200824211948.12852-1-rentao.bupt@gmail.com>
 <20200824211948.12852-5-rentao.bupt@gmail.com>
 <20200825141808.GH3532@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825141808.GH3532@heinlein>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, taoren@fb.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Aug 25, 2020 at 09:18:08AM -0500, Patrick Williams wrote:
> On Mon, Aug 24, 2020 at 02:19:47PM -0700, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Set 64Mb FMC flash layout in Minipack device tree explicitly because the
> > flash layout was removed from "ast2500-facebook-netbmc-common.dtsi".
> > 
> > Please note "data0" partition' size is updated to 4MB to be consistent
> > with other Facebook OpenBMC platforms.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > ---
> >  .../boot/dts/aspeed-bmc-facebook-minipack.dts | 47 ++++++++++++++++++-
> >  1 file changed, 45 insertions(+), 2 deletions(-)
> > 
> 
> Reviewed-by: Patrick Williams <patrick@stwcx.xyz>

Thanks for the review, Patrick.


Cheers,

Tao

