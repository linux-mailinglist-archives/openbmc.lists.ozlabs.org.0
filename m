Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3724251217B
	for <lists+openbmc@lfdr.de>; Wed, 27 Apr 2022 20:45:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpSNp0nDpz3bdK
	for <lists+openbmc@lfdr.de>; Thu, 28 Apr 2022 04:45:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.177;
 helo=mail-oi1-f177.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpSNS49dQz2x9W;
 Thu, 28 Apr 2022 04:44:55 +1000 (AEST)
Received: by mail-oi1-f177.google.com with SMTP id e189so2924868oia.8;
 Wed, 27 Apr 2022 11:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/sIxYWvFlMoHReoMPfX2NBRTuxsiKhz/pal5GhylPqg=;
 b=58AQ4PoYwAKv+EpB1asqlygstMrwwI1sbparJHTk2hdFEJNbCrK22ySHrAlrJOBcNl
 xLnl3R7sBuJ4DFwZv9GNVfOHw0MJdRNf+LwTBmw2UwrwaV/l/SzWIElheGEod8bFHipB
 o+JWqXARzXF4Qf8othUuEkAlAURUVBSH/oq/EDvMb7oRYWswEXN65Uvpe/OBfbd0kBDp
 fm8VptoN2vWm8BM1nDeWiR/FLiunEBhveF0cmUwfFLC0ioAg6pklWK34DBULknmg22Sf
 GnMiLEqfZxn612uPkFzpqU+30J1IibqENhsJ+L1SsA1H+FVTR3OoztK2VpTOjsK8WKp3
 EItg==
X-Gm-Message-State: AOAM533t7XYm0D8Ol9FQHffzI7tvCcDdzj0QQ+X2Fg0/+lYN2Ujalw6W
 Sq13UC6b29rBXWzWzWB9pw==
X-Google-Smtp-Source: ABdhPJz6nKdb0AwwSKP/n1AYikKnnui7VO1eKjkTuDHiUj8S52Lm4O++NP3zOk3jiqIIDRQN/19pQA==
X-Received: by 2002:aca:1a09:0:b0:325:90ab:a812 with SMTP id
 a9-20020aca1a09000000b0032590aba812mr1384519oia.131.1651085093218; 
 Wed, 27 Apr 2022 11:44:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m4-20020a056870030400b000e686d13890sm963611oaf.42.2022.04.27.11.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 11:44:52 -0700 (PDT)
Received: (nullmailer pid 436853 invoked by uid 1000);
 Wed, 27 Apr 2022 18:44:52 -0000
Date: Wed, 27 Apr 2022 13:44:52 -0500
From: Rob Herring <robh@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] dt-bindings: pinctrl: aspeed: Drop referenced nodes in
 examples
Message-ID: <YmmPJLcI7PnsBtXn@robh.at.kernel.org>
References: <20220422192139.2592632-1-robh@kernel.org>
 <CACPK8XcQNJNyzqdjMQuCP+z-L-A9mcMqs-HJJrh9MscasV+D=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XcQNJNyzqdjMQuCP+z-L-A9mcMqs-HJJrh9MscasV+D=A@mail.gmail.com>
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
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Apr 27, 2022 at 08:40:31AM +0000, Joel Stanley wrote:
> On Fri, 22 Apr 2022 at 19:21, Rob Herring <robh@kernel.org> wrote:
> >
> > The additional nodes in the example referenced from the pinctrl node
> > 'aspeed,external-nodes' properties are either incorrect (aspeed,ast2500-lpc)
> > or not documented with a schema (aspeed,ast2500-gfx). There's no need to
> > show these nodes as part of the pinctrl example, so just remove them.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> 
> Nak.

I welcome patches that add schemas for the undocumented compatibles 
instead. Otherwise, I will be turning on this check by default and 
nagging people to fix them.

> This removes the information on how to use the bindings. Surely we
> prefer to over document rather than under document?

How is what the 'gfx' and 'lpc' nodes contain relevant to how the 
pinctrl binding works? If a user wants to know, then they should go look 
at the aspeed,ast2500-lpc/aspeed,ast2500-gfx bindings and their 
examples. Which brings up my secondary issue which is having the same 
example multiple times. It is multiple chances for errors (that I end 
up fixing).

How do we know the example is even correct without any schema checks? 
The 'framebuffer' node is not in a valid location is the most obvious 
thing I see.

Rob
