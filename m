Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAC0172B70
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 23:35:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T6vV5wyGzDr81
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 09:35:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qBGk3y53; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T6t10bmjzDr6v;
 Fri, 28 Feb 2020 09:34:32 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id a14so401799pgb.11;
 Thu, 27 Feb 2020 14:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uEgm7G3Oorn2p+U3SUvjAXjrUbk1a/Mg7TANrk2b//4=;
 b=qBGk3y53fGrIoD9YVbCtRjk94Q6RcxNk2DSm3mh434SY+OeNEv+jBkV8dglcusUA+R
 L9mwI4MHxQNulbX/2XretJJFtukcDGzr2zLCBNAkiws90+uuoSKtuF1EROggBJffSdKA
 qgggk49UicheeH2QMRaXodHbyDiRh7P6/kHwp03Qgo9PQ24UR4jbyoqss3gfllwvQvVL
 xwPDxSBopjmtHJX5f74rVo97JgjI8Yitea1jHRJYWPIvIVzfbC6PC9a5X0IHms8IgMCK
 4WlJkdiWKYejSZSyCp9T8rIybyOSefTm2XK4DXMzvuRuMra5mVvzOdAJGX853Tdp2LWM
 Rx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uEgm7G3Oorn2p+U3SUvjAXjrUbk1a/Mg7TANrk2b//4=;
 b=Pv32Ibrjz3YFw6LPVSKFCVyyvITWQ+zgR0sZKEJP01/PCl4vfDh+vCT3xzXMYNbfWY
 D1ElH8jpNPagK5c6VNKdZJxRDWkBYLIACj7pwCbZeSqAAkbMgy4LOHBGQbxEUUikIHae
 o8pjqfXOMQuRntfF0nEHg5yvjiLZj+ppuu688w6W4hQI9KACemM74RMsGJ87U5CrpMdc
 U7jj9ZNYlZ+nN+HPbMaVapfSPszQeQ0rKkMUHDB0zpuAXvglItplPnBlTphE7I1M0lBH
 srBKTeMgX3WjTrgmA8iPBfDcmqIgQn9H9eadI/igM3UZDzSUODJVE5Lz61/gaUddP10E
 soIw==
X-Gm-Message-State: APjAAAW8mnqTKKNJPLT7r0urBlsuIFF1EVvDAagBrUriGbI+E82eE6Es
 V5HqVEMphKelWqNrZWx0bAo=
X-Google-Smtp-Source: APXvYqw5t5F5Y64xPWlPBKQeB1b3ZAolobkAyq2a30keMZ7QjMV3RtaaKUEDeVezZZN7BeyPxNi9EQ==
X-Received: by 2002:a62:6d01:: with SMTP id i1mr1237798pfc.94.1582842869095;
 Thu, 27 Feb 2020 14:34:29 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:500::4:d8f5])
 by smtp.gmail.com with ESMTPSA id y193sm5500583pgd.87.2020.02.27.14.34.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Feb 2020 14:34:28 -0800 (PST)
Date: Thu, 27 Feb 2020 14:34:25 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v4 6/7] ARM: dts: aspeed-g4: add vhub port and endpoint
 properties
Message-ID: <20200227223425.GB29420@taoren-ubuntu-R90MNF91>
References: <20200226230346.672-1-rentao.bupt@gmail.com>
 <20200226230346.672-7-rentao.bupt@gmail.com>
 <83d7b817234f99c92272f7950129c56a58f4de54.camel@kernel.crashing.org>
 <CACPK8XdkPLZVJTpAc2u3Q0W0KoRrC4hfHjy27VKpGDRF45JByg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XdkPLZVJTpAc2u3Q0W0KoRrC4hfHjy27VKpGDRF45JByg@mail.gmail.com>
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
 Tao Ren <taoren@fb.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 27, 2020 at 05:54:34AM +0000, Joel Stanley wrote:
> On Thu, 27 Feb 2020 at 04:11, Benjamin Herrenschmidt
> <benh@kernel.crashing.org> wrote:
> >
> > On Wed, 2020-02-26 at 15:03 -0800, rentao.bupt@gmail.com wrote:
> > > From: Tao Ren <rentao.bupt@gmail.com>
> > >
> > > Add "aspeed,vhub-downstream-ports" and "aspeed,vhub-generic-
> > > endpoints"
> > > properties to describe supported number of vhub ports and endpoints.
> > >
> > > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> >
> > Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> I will take this patch through the aspeed tree for 5.7.
> 
> Cheers,
> 
> Joel

Thanks Joel for the continued support!

Cheers,

Tao
