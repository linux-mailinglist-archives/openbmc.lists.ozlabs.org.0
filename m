Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48251E7EE9
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 04:54:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472HlP3Pl6zF0WF
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 14:54:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="nIj8QhAk"; 
 dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472Hkj20rLzDsTX
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 14:53:49 +1100 (AEDT)
Received: by mail-qk1-x743.google.com with SMTP id m4so10889905qke.9
 for <openbmc@lists.ozlabs.org>; Mon, 28 Oct 2019 20:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NWEHZlIqU3zwiVDov9z83TF+hUG/JlmoTUfz/Vrl1AA=;
 b=nIj8QhAkJ+TaCXmgn6SMVVkdYCRy5L97UsY1azp7WYHgO2PZ4cygqtOwyMsWEYzXAo
 Ryym4AmO2VWWb8OtDvQPFzFRVj08mjZYJpHhnQiRB3Bf6/AaZCkvbNT9vt+z/cvlvDQ7
 Mvd04UgAQaz/Bcp1GjDzb1aQqzhoeNuIrPRms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NWEHZlIqU3zwiVDov9z83TF+hUG/JlmoTUfz/Vrl1AA=;
 b=YrPL4vWDp9WcJ60fZZGExvzBq8jXZLMQpIJw1Z9Aw+CxW8cM0LmUGOBbv6t7aPxlZv
 0jMPGG6XzZ4aEyxUXnq25haPOhKZrMMVeDl6mbzy/apgWdXHD7KWOXH9k1HjGYAo7tQX
 +2/gJGWjQDcI/qSO7av9poOZV5wuPPFbcClrgRB+TqlAOKdcWEkWxmh3WIu1LqjSxP+c
 kn2vZWj29jZwxyMaezJ1ia2sVi2Igi5PNAskMjT39NMe2X2KXq+w+us31sFrj/Z4XINh
 WlMQFOtv7inVEBIUsWsUtI84fhy/ywqXY9oSaCn/yJNeiNoGbEVIzmPOlfJ1VHw3d3ZP
 p2PA==
X-Gm-Message-State: APjAAAV6X2NZS7VeE/1uB307X3O5H23rnlnB5SgFH2/Gd3KJYoeCPXaL
 hSXw9+X3WirDO1BM/SIexCjcLQb/oJn0J5QJx14=
X-Google-Smtp-Source: APXvYqycO7QPU2qYdXdehvvfXcCZ6vedoh6WtZS5hx/qd44vqihjP11UTBxMRJcxFwgusp154sxVDBwfJQywDwv5MRM=
X-Received: by 2002:a37:aa07:: with SMTP id t7mr19650804qke.414.1572321225491; 
 Mon, 28 Oct 2019 20:53:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191025010351.30298-1-joel@jms.id.au>
 <20191025010351.30298-8-joel@jms.id.au>
 <1673c225b25d37ab3bdc2bf2b8fb67abb0f77f60.camel@ozlabs.org>
In-Reply-To: <1673c225b25d37ab3bdc2bf2b8fb67abb0f77f60.camel@ozlabs.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 29 Oct 2019 03:53:33 +0000
Message-ID: <CACPK8XcL181f6DiE=JskVvd8qE+51UT8s31HAOAd7M4uZZ5Pkg@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.3 7/7] fsi: aspeed: Special case repeated full
 word reads
To: Jeremy Kerr <jk@ozlabs.org>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 29 Oct 2019 at 03:17, Jeremy Kerr <jk@ozlabs.org> wrote:
>
> Hi Joel,
>
> > The driver can skip doing some of the AHB2OPB setup if the operation is
> > of the same type. Experiment with this for full word reads, which could
> > be extended to writes if it shows an improvement.
>
> I would have taken a slightly different approach here - to do the "last
> value" caching at the OPB register set level, rather than working at the
> FSI-operation level. ie, keep a copy of the AHB registers that control
> OPB transactions, then only set them when they differ from the intended
> writes.
>
> That would give us something like this for opb_read():
>
>     if (aspeed->opb0_select != 0x1) {
>         aspeed->opb0_select = 0x1;
>         writel(aspeed->opb0_select, base + OPB0_SELECT);
>     }
>
>     if (aspeed->opb0_rw != CMD_READ) {
>         aspeed->opb0_rw = CMD_READ;
>         writel(aspeed->opb0_rw, base + OPB0_RW);
>     }
>
>     if (aspeed->opb0_xfer_size != XFER_WORD) {
>         aspeed->opb0_xfer_size = XFER_WORD;
>         writel(aspeed->opb0_xfer_size, base + OPB0_XFER_SIZE);
>     }
>
>     if (aspeed->opb0_addr != addr) {
>         aspeed->opb0_addr = addr;
>         writel(aspeed->opb0_addr, base + OPB0_FSI_ADDR
>     }
>
>     writel(0x1, base + OPB_IRQ_CLEAR);
>     writel(0x1, base + OPB_TRIGGER);
>
> [which we could simplify with a helper function for the caching...]

I am not convinced that this would be faster. In the best case (same
operation) it's N branches. In the worst case, it's N branches and N
mmio operations. I don't have any data for how often the values
change, so that's something I could collect.

I'll defer merging this change until we have more data.

Cheers,

Joel

>
> However, if the aim is to just stage this to just the fullword reads for
> now, this looks fine for me.
>
> Cheers,
>
>
> Jeremy
>
