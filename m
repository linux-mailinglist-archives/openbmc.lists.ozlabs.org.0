Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE518172EC4
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 03:19:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TCsv6ql5zDrFJ
	for <lists+openbmc@lfdr.de>; Fri, 28 Feb 2020 13:19:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hxyIrW6h; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TCqG0sRhzDqvl;
 Fri, 28 Feb 2020 13:17:29 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id m15so659490pgv.12;
 Thu, 27 Feb 2020 18:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2EGIDOcwSkQzmyztRJT0eD0yvIAqM5S1zi6e6PNVyBE=;
 b=hxyIrW6h6Ksa8bvLFVo5YgU+CvO5X/olU27A6pYYW76LeZfR4jZ8f8GVTuclvQdm35
 7Xivx1a7iFUjwdrTMQD+wjxC9C8mg/36mvjEzV69PG7apCteWxANtJfQmjescKO4nzb4
 +GIjeyT9KxhNLjNOAmEPh7PIWiuDeD/Sgu8a/8B49qQLPHhdse0LWldQ4B3+kNuozhDl
 LNVwypVwSM2iN89h1gz8E2KXgEBxQCRfnV+D7wv1tta50ly6Pwepl8eN8n7ZkV5Tzfd+
 FsNfc6qDHLBk7OH2XsYWwvyJ5634BgdBxfLMMcTH8GBjeViZpmiZX601BMpnDEHWOGfm
 GGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2EGIDOcwSkQzmyztRJT0eD0yvIAqM5S1zi6e6PNVyBE=;
 b=h6349ntfOPOTNOMP2GmQdyYNRoYex/xJyEfGMiVxGWNBazLW2eiU9b3g3ChEKtpZ1h
 Dv9ecEhdHFFZbuzFrT0YLnCsM2fbvMz/RFkrrVnJYoeQzoOSO6qCLPFlE1fa0EYX6Dyu
 LBFwpFmevZx3V81MLSEK+GB9QBfq7rlnn2igP13t8URW5cc3Qtbp9p2IpVqOzI/UKUMp
 N7w5gS5FYM/t2wb2sO5gvM0bTO02dmlcr3c5StzeMpMLkg3JJSsliDmsXPZQ5wruh22U
 WXS3zWG27dqByeRB+3q0wl6A6I9+vM/jo9tb6hqgQ/Vp+WWnIOOQF4gk7ay2YGIX0KRA
 j/EA==
X-Gm-Message-State: APjAAAUuuw2cZJEu4sfhQhHDqyMQf2Zqk2J6HcbGAgYCMExpgxthC7ol
 ZkEeJ9CtxfdqEikQPNPSGLc=
X-Google-Smtp-Source: APXvYqyUgHXDdMtyN5qf7cF9j3WUfPh16bn//Fez+Zv6OmxeEF/n0f8zXq5msQ21fZp6elwSchs83Q==
X-Received: by 2002:a63:6ec7:: with SMTP id j190mr2177647pgc.356.1582856247969; 
 Thu, 27 Feb 2020 18:17:27 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:500::4:d8f5])
 by smtp.gmail.com with ESMTPSA id h185sm8824175pfg.135.2020.02.27.18.17.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Feb 2020 18:17:27 -0800 (PST)
Date: Thu, 27 Feb 2020 18:17:19 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 7/7] dt-bindings: usb: add documentation for aspeed
 usb-vhub
Message-ID: <20200228021718.GA10827@taoren-ubuntu-R90MNF91>
References: <20200226230346.672-1-rentao.bupt@gmail.com>
 <20200226230346.672-8-rentao.bupt@gmail.com>
 <20200227165504.GA26955@bogus>
 <20200227224250.GC29420@taoren-ubuntu-R90MNF91>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227224250.GC29420@taoren-ubuntu-R90MNF91>
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

Hi Rob,

On Thu, Feb 27, 2020 at 02:42:51PM -0800, Tao Ren wrote:
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.example.dt.yaml: usb-vhub@1e6a0000: 'aspeed,vhub-downstream-ports' is a required property
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.example.dt.yaml: usb-vhub@1e6a0000: 'aspeed,vhub-generic-endpoints' is a required property
> > 
> > See https://patchwork.ozlabs.org/patch/1245388
> > Please check and re-submit.
> 
> I ran "make dt_binding_check" in my local environment and don't see the
> failures. The 2 properties are introduced in this patch set and I add
> the properties in aspeed-g4/5/6 dtsi files (patch #4, #5 and #6): am I
> missing something?

I think I missed "libyaml-dev" package. I've reproduced the error in my
environment and added the 2 required properties in patch v6.


Cheers,

Tao
