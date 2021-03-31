Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E49E34F79C
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 05:47:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9C1t3dlcz3by1
	for <lists+openbmc@lfdr.de>; Wed, 31 Mar 2021 14:47:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Ovm3ccj1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ovm3ccj1; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9C1c1gMyz2xYx;
 Wed, 31 Mar 2021 14:47:14 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id v10so8229773pfn.5;
 Tue, 30 Mar 2021 20:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=U0ybPJ4IUj7A9WiPX6++C9vlgGXr5Xx8nEXJ1UKkhm8=;
 b=Ovm3ccj1Gkreg3858fKpv3NAk23NEwwFzrJg8scUGuiVgd/lWz9MV0+716OM+d2wFf
 gtcf02bbchFFt2TP6DA8kMYhX7viY9Wew0V1iC3mcNZRAsp513LCmXMy4CZpIzn0KkE1
 qbNcE8wQd5P7SSBE1YJfEaMYr0t5Hxlrj4wFiH4lpRQgLugscp24O73O7B5pWaqjbUfi
 XRYzC5hNE/RECINx2jT9IsZ4mb5J9PkMW5QUXqwUj2d++OodhwmXi4501PPLOUokfDua
 c1CMXcXooDtcBxA8ELHbVp4w1hQfej39OQU9Zi7FgudIQSmHLNFBdGKBVycCiXOWx/s3
 GRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=U0ybPJ4IUj7A9WiPX6++C9vlgGXr5Xx8nEXJ1UKkhm8=;
 b=WFYwjHdg1ayEN7R1mqui3AEJccL1HuEJVH+nVfpkh/Dla0tDiBZ6zPCTp/LsHgdvao
 lQVbewZKLiIgCFQLk+MO2HkGSYZwd2ci4OxYph2DRkCdnk8JBmq8vsCqD4MpqVxelFYN
 hOFXs9ksJ0twC8nO+Jo5O6y4ug+ki7KaiQBcQhBSLyCOdr8RUIuOF7R8e17DmqMMCmFV
 aG9saXxYDXx04zHVsj8sQWqH0tj2EJrw7Zut7OAa4iRagkCPe0MnXLWgckiuF9s4sh3h
 kHegOmdgPt3XJ1VoYWH2g7G79OUPd+ppKYQiXXVJGQBMwMukKwulZJS/lrbitJ+gzZP5
 QbVg==
X-Gm-Message-State: AOAM532afVLXg3v0MkdduQeK4VWfxy393JlYk4uX01L3d0uXirNOBjyx
 OE8g3/+VoZJzxDV/VXFYDGg=
X-Google-Smtp-Source: ABdhPJyauHHwpjyiuukvlQwcFr75L5EGfWTiT3+42JyY+XkZ0d42RuforqZEr35yuq0JFRrmYydfXQ==
X-Received: by 2002:a65:53c8:: with SMTP id z8mr1284073pgr.340.1617162429825; 
 Tue, 30 Mar 2021 20:47:09 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id j3sm407019pfc.49.2021.03.30.20.47.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Mar 2021 20:47:09 -0700 (PDT)
Date: Tue, 30 Mar 2021 20:47:02 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] usb: gadget: aspeed: set port_dev dma mask
Message-ID: <20210331034701.GA3185@taoren-ubuntu-R90MNF91>
References: <20210326070214.6719-1-rentao.bupt@gmail.com>
 <10920f34-289c-feac-79b6-71bff2aea67d@arm.com>
 <20210326120526.GA14169@lst.de>
 <20210327221759.GA2997@taoren-ubuntu-R90MNF91>
 <20210329061735.GA27510@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329061735.GA27510@lst.de>
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
Cc: Sasha Levin <sashal@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, kernel test robot <lkp@intel.com>,
 linux-aspeed@lists.ozlabs.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-usb@vger.kernel.org,
 Tao Ren <taoren@fb.com>, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, Robin Murphy <robin.murphy@arm.com>,
 Thomas Tai <thomas.tai@oracle.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 29, 2021 at 08:17:35AM +0200, Christoph Hellwig wrote:
> On Sat, Mar 27, 2021 at 03:17:59PM -0700, Tao Ren wrote:
> > On Fri, Mar 26, 2021 at 01:05:26PM +0100, Christoph Hellwig wrote:
> > > On Fri, Mar 26, 2021 at 12:03:03PM +0000, Robin Murphy wrote:
> > > > This might happen to work out, but is far from correct. Just wait until you 
> > > > try it on a platform where the USB controller is behind an IOMMU...
> > > >
> > > > It looks like something is more fundamentally wrong here - the device 
> > > > passed to DMA API calls must be the actual hardware device performing the 
> > > > DMA, which in USB-land I believe means the controller's sysdev.
> > > 
> > > The shiny new usb_intf_get_dma_device API provides the device to use.
> > 
> > Thanks Robin and Christoph for the feedback.
> > 
> > If I understand correctly, usb_intf_get_dma_device API is mainly for usb
> > host drivers? I just found usb_gadget_map_request_by_dev API: does it
> > make sense to replace usb_gadget_map_request with
> > usb_gadget_map_request_by_dev so we can pass the actual DMA-capable
> > hardware device (aspeed-vhub platform device) to the API?
> 
> Oh, right you're dealing with a gadget side driver.  Not sure about
> the API there, I'll let the relevant maintainers chime in.

Given this is not the right path, I will drop the patch and work out a
new fix soon (by calling usb_gadget_map_request_by_dev, and with
modified subject).


Cheers,

Tao
