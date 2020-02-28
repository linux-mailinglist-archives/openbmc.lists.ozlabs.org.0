Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FC6172DF5
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 02:06:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TBFJ31qszDr10
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 12:06:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QFlUCv7n; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TBDG2MHxzDr0T;
 Fri, 28 Feb 2020 12:05:31 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id x185so781217pfc.5;
 Thu, 27 Feb 2020 17:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vYKIHHhVn7nSPH52/lrlIOtB7hqwWnXUydbXUcnZWnI=;
 b=QFlUCv7nCT2v8zoOhV2qa4uo6mlR9+Nsq7/xVvJLjsHIYBg9P4ixu6A7b7qhQfX8Qe
 vM2r2IJLVY9WzSAiDaGRlFnxtMv0848tL6yTTWdVjghb2Xv7E37AEUDJvaVREmp1BNIY
 940Ae6Ut8CrQrOp26oJlS2RyZXS+vfTFD/yZ9tb3CLTw9R9hPaFCY9Tmvvtv3wtrpMv2
 wsbFKm7PATc4wfRkkFxv4OB6EejtTBAuwkvi2tchL/GS8lh0brgPhwBQKAmHXetqk/pd
 Fczf/Ob3g8Rk03buXNFyaS8jPj0aEMjWjAAnatVfiDQsw3OFVl9MCsiJrbJCHh/etzdq
 Iy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vYKIHHhVn7nSPH52/lrlIOtB7hqwWnXUydbXUcnZWnI=;
 b=oD9qQ6RyLg7gUhOlLpkqHxJqWnr12UTCQPKIrulWq95Qgn3879+dillE+D7mBvFS2g
 uUEMzhiwcn18rh6x3C8ZF+z44RTYH0cScHBU1mPax4ILJAbg0JAu73bIC3TCagMNC6em
 RfTk/cB7ZpFtFzE5PiOLZbYQ7ShxtBwGeTjY7vCXDEDXDVnTTHuf/a2GJpgB5vzKe8gF
 0o0rzDVX6jiO5uv7sA8qsGHOC+qb59VNRCL46WlpXnsz56FcSpvJJ6dCLGr4Tu8mpAyz
 N0hBT/IQSscFV/Bb3ipz5SyR58bIXTiB+er7GfAm8eM9dDGzPJnVUYNLhh21Iadx+jFV
 KJxg==
X-Gm-Message-State: APjAAAWEhv/zu3mFCh5XT0nJ5iHdlovvkMxtnulp0QqA+naIGvAvTNme
 azJHdSjX3ZZXhKTFwha5n7c=
X-Google-Smtp-Source: APXvYqyTntILByeXSll2nrJCqdigFZSVhDQGQyd6dWT/1lZozrCoBY86BHFMbLTiHaa612sjWifBGQ==
X-Received: by 2002:a62:3343:: with SMTP id z64mr1754059pfz.150.1582851928639; 
 Thu, 27 Feb 2020 17:05:28 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:500::4:d8f5])
 by smtp.gmail.com with ESMTPSA id 136sm7975604pgh.26.2020.02.27.17.05.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Feb 2020 17:05:28 -0800 (PST)
Date: Thu, 27 Feb 2020 17:05:20 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH v5 7/7] dt-bindings: usb: add documentation for aspeed
 usb-vhub
Message-ID: <20200228010444.GA19910@taoren-ubuntu-R90MNF91>
References: <20200227230507.8682-1-rentao.bupt@gmail.com>
 <20200227230507.8682-8-rentao.bupt@gmail.com>
 <3150424b9e9f5856c747a0fbf44647919f49209d.camel@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3150424b9e9f5856c747a0fbf44647919f49209d.camel@kernel.crashing.org>
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
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 taoren@fb.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Feb 28, 2020 at 10:30:02AM +1100, Benjamin Herrenschmidt wrote:
> On Thu, 2020-02-27 at 15:05 -0800, rentao.bupt@gmail.com wrote:
> 
>  .../...
> 
> You haven't fixed the problem spotted by Rob which is that the example
> is now out of sync, it's missing the required properties.

Ahhh, now I know where my problem is..
Let me see why I cannot reproduce the error on my side; otherwise I may
create more noise in my next patch set (customize device IDs/strings)..

> Also long run I think best is going to have a child node per downstream
> port, so we create a matching linux struct device. This will make it
> easier to deal with the other device-controller in the ast2600 which is
> basically one of these without a vhub above it.

Maybe a dumb question: what would be the proper place to parse the child
node/properties when they are added? For example, in some usb_gadget_ops
callback?


Cheers,

Tao
