Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E4D179FB2
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 06:57:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Y0QC2v9DzDqjb
	for <lists+openbmc@lfdr.de>; Thu,  5 Mar 2020 16:57:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HlO3Og2d; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Y0PK3L8xzDqjM;
 Thu,  5 Mar 2020 16:56:36 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id nm6so2011660pjb.0;
 Wed, 04 Mar 2020 21:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kM7p6iQbBTR9YfCmEPNGr14KUbGdbLJ4CLDWGt5kFJE=;
 b=HlO3Og2d5uy8+jp2KNfqeoyI4ZzMgtcXv4THIEFH85qz7Iq3CW0zjGMg2ETeHkdf0V
 VfmgUBsyW7Jv13z0mcKXYBkdDBaLI54IS0UyeQlJLstHLl5tFiobCZpnJiZsTvjy/xtr
 IitH9OrIam7YtS4J0jySlx3bJ1+oRszQjn4O1QAdYKQURxzKhQyUjCew0o5yCHtWSLGB
 8P/iAqypxNaRFRkV7JXfP/9XozHsM7QnUa4ZQTnBpz3bMdPFKA5pQbcbOsUCeBNzBmzZ
 ElL/a94ot2WKiPA5nfZj8I7tze2spp6X99eodAnnRLaPSfDMrPH245IVIILue0GP4HdF
 Qp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kM7p6iQbBTR9YfCmEPNGr14KUbGdbLJ4CLDWGt5kFJE=;
 b=m8pXTYWxW/rNVdrsZH5w6BeuabLVQ2j0nmwPWsBjVgwObmJkRXyG5AR6cBWQkvXHyS
 zCc2sn1q0mPg8ouKcLwA6eevesuMbJ+JUQ+Q0rTpsyXaLDnVUw7ys33LaAOFOl5AIo0R
 +uNW+2DJmviaqQd6Vc6CxIZl888U6e/cKhHMeHetEajo5QtJWH7ALtsgeF4lmnjely3E
 isX3uzl5p2ueV+4twPuqAVXCgr/1YojW2i10McU8EF6aFVMfMHFyQh2weY9ywTWB10fB
 JnNy/T1Fm39WhayMp49ILB1BVbrQIsMNqrPAuP0Bms6QiNQNKPG6isPYHyV+KqYJhqvI
 4TXw==
X-Gm-Message-State: ANhLgQ3P+V+maO7bTVib6597fElYKnfKptj3vZyb9Dvd9iZXactHTvg+
 DkygjMyudVvdeRbZx69jf0c=
X-Google-Smtp-Source: ADFU+vuE/IWJczM8wvkwqfTmwzFsFPEGEEsXubYB4VEY+7Kg1OaMFur89CTyXpNeC1VHckqxBzMhmA==
X-Received: by 2002:a17:902:8e8a:: with SMTP id
 bg10mr6325624plb.219.1583387794925; 
 Wed, 04 Mar 2020 21:56:34 -0800 (PST)
Received: from taoren-ubuntuvm (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id m59sm4784883pjb.41.2020.03.04.21.56.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Mar 2020 21:56:34 -0800 (PST)
Date: Wed, 4 Mar 2020 21:56:27 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] usb: gadget: aspeed: improve vhub port irq handling
Message-ID: <20200305055627.GA2296@taoren-ubuntuvm>
References: <20200305023859.21057-1-rentao.bupt@gmail.com>
 <8a9033d5e76951f5bec39531c5d0e0d6ef963ee5.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a9033d5e76951f5bec39531c5d0e0d6ef963ee5.camel@kernel.crashing.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, taoren@fb.com,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 05, 2020 at 02:35:08PM +1100, Benjamin Herrenschmidt wrote:
> On Wed, 2020-03-04 at 18:38 -0800, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > This patch evaluates vhub ports' irq mask before going through per-
> > port
> > irq handling one by one, which helps to speed up irq handling in case
> > there is no port interrupt.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> 
> Looks reasonable, but did you try a find_next_bit() loop and whether
> that's faster ?

Make sense. It should be more efficient especially when most ports are
idle (and I guess it's a common case). Will try and send out v2 soon.


Cheers,

Tao
