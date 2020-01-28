Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F4214AE55
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 04:15:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486BZ041NWzDqBx
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 14:15:04 +1100 (AEDT)
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
 header.s=20161025 header.b=JP34GVp/; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486BX93H1pzDqDp
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 14:13:28 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id f2so285358pjq.1
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2020 19:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=UfHG7P35w9q/a86UKrOeTZOlhh3L/G/FM07DEjw9lA0=;
 b=JP34GVp/F5Z1AtOub7qzey0hsVJ1jedbLLnB4jSmIFzXCRubusfZZZMQDwBfTEvO99
 5t4q9dBQVER8NZk0lDJ7eSorll0R/BxcT6uPbpLjovpmwNp1noLwM7bUgILhqPE5bneh
 aiebLRWLO80RbLci1Ny7pvki4TeyMXiFZG6uVNx4anX/guvpL1LdTWvJyyCH3K1VTPEf
 Lf3FKq2jUJQimJJTsR7bSpNVfAYZqMhYw6jGudaHy/1ekcJLmMywoSWPyCd0AqNMK1eE
 9RXmmB7hj3EebjCdI/BODUSdTzXcajnwXaQdibeWvSHicshrLNg0x8tZUxoWHe9Ys2ge
 C92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=UfHG7P35w9q/a86UKrOeTZOlhh3L/G/FM07DEjw9lA0=;
 b=p3yuEvM30ByvpJowlw1mcP8+pEh1CFSN5V+i9pxRCZWSauWBcUL9ba6x0qeA7eXe+k
 FdqFnBIg4GMUE+VbZkgU7s6sDTNgm5EEUvHVsjjO9xWQuTfYD7vfIzrpBu1k3dFIEobU
 XNOesn2oSoVWsatQgPr7CNBnT9/CBTLchwTx3xfDyYVPzPZPFRHhaL4FzCVKn1vq6W92
 TRFaiDBQzkRFvX43uLDkvEqZImKDVObIO8zuK9Hod+u6g9iN2nMoZJ5nwOnePWg3+Kpd
 5GzeiNlp2Vl6+FpUOxU4L9LkyB7wYAdd8XGKAcMqlVNRLT6VqhPIlMrMgAJQoCMUqpV0
 PPCw==
X-Gm-Message-State: APjAAAXfVlKy/Q+x+7dINVqdWGaH13Y7EVbr8NePIbaUPMN+f/7Q3TIV
 8ziu2oTnhBrd474jcMB6YYY=
X-Google-Smtp-Source: APXvYqwlbZZfa6Xk68XuKZFnDc6D5w57n4GpnTBumZSs8DpBFtqeMDYR6LA7+AhWFyTzIPDP1om3mw==
X-Received: by 2002:a17:902:8485:: with SMTP id
 c5mr20882712plo.330.1580181205522; 
 Mon, 27 Jan 2020 19:13:25 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:200::2:ab25])
 by smtp.gmail.com with ESMTPSA id t8sm464234pjy.20.2020.01.27.19.13.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Jan 2020 19:13:25 -0800 (PST)
Date: Mon, 27 Jan 2020 19:13:18 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH linux dev-5.4 v2 1/3] usb: gadget: aspeed: read vhub
 config from of_device_id
Message-ID: <20200128031317.GA32684@taoren-ubuntu-R90MNF91>
References: <20200123074956.21482-1-rentao.bupt@gmail.com>
 <20200123074956.21482-2-rentao.bupt@gmail.com>
 <3129984d-421a-42c9-bb5b-c3ee01ccd43e@www.fastmail.com>
 <20200124012317.GA22665@taoren-ubuntu-R90MNF91>
 <1a456e8f-c708-4276-bec8-3b98cee43e47@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a456e8f-c708-4276-bec8-3b98cee43e47@www.fastmail.com>
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
Cc: Tao Ren <taoren@fb.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 28, 2020 at 11:27:57AM +1030, Andrew Jeffery wrote:
> 
> 
> On Fri, 24 Jan 2020, at 11:53, Tao Ren wrote:
> > On Fri, Jan 24, 2020 at 10:39:45AM +1030, Andrew Jeffery wrote:
> > > > diff --git a/drivers/usb/gadget/udc/aspeed-vhub/hub.c 
> > > > b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> > > > index 19b3517e04c0..aa1c127e9f2f 100644
> > > > --- a/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> > > > +++ b/drivers/usb/gadget/udc/aspeed-vhub/hub.c
> > > > @@ -133,10 +133,9 @@ static const struct ast_vhub_full_cdesc {
> > > >  
> > > >  #define AST_VHUB_HUB_DESC_SIZE	(USB_DT_HUB_NONVAR_SIZE + 2)
> > > >  
> > > > -static const struct usb_hub_descriptor ast_vhub_hub_desc = {
> > > > +static struct usb_hub_descriptor ast_vhub_hub_desc = {
> > > 
> > > This seems unfortunate, though we only have one on the SoC... is
> > > it worth dynamically allocating it? Or adding a comment?
> > > 
> > > Andrew
> > 
> > According to the comment at the beginning of the file (line 39-47), we
> > may customize more descriptors in the future. Adding comments involves
> > little change in this case, because by allocating the descriptors, we
> > will also need a function to free the descriptors when ast_vhub_remove
> > is called. Anyways I'm fine with either way.
> > 
> > There is another option which is to fixup descriptors in request_desc
> > callback, like ast_vhub_patch_dev_desc_usb1() in the file. But I don't
> > like the approach personally.
> > 
> > Which way do you prefer?
> 
> I'm not wedded to doing anything different from what you've already got
> in the patch - we don't have hardware that requires a different solution at
> this point. We can always fix the driver if that changes. The approach just
> felt a bit icky, but I can live with that :)
> 
> Andrew

Thanks Andrew. I just sent out patch v3 which adds some comments for the
hub descriptor; 2 compile warnings are also fixed in v3. Please kindly
review when you have bandwidth.

Cheers,

Tao
