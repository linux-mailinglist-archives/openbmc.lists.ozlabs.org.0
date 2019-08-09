Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE1287DFF
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2019 17:29:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 464q0F05j3zDqNJ
	for <lists+openbmc@lfdr.de>; Sat, 10 Aug 2019 01:29:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=collabora.com
 (client-ip=2a00:1098:0:82:1000:25:2eeb:e3e3; helo=bhuna.collabora.co.uk;
 envelope-from=boris.brezillon@collabora.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=collabora.com
X-Greylist: delayed 85997 seconds by postgrey-1.36 at bilbo;
 Sat, 10 Aug 2019 01:26:13 AEST
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 464px118mGzDq7W
 for <openbmc@lists.ozlabs.org>; Sat, 10 Aug 2019 01:26:09 +1000 (AEST)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C093628CFB2;
 Fri,  9 Aug 2019 16:25:59 +0100 (BST)
Date: Fri, 9 Aug 2019 17:25:57 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 2/2] spi: npcm-fiu: add NPCM FIU controller driver
Message-ID: <20190809172557.346e7c41@collabora.com>
In-Reply-To: <CAP6Zq1iW0C0FDOoqmn5r_xk5HQFWw+GgLfeapvt-8mB50N2Vvg@mail.gmail.com>
References: <20190808131448.349161-1-tmaimon77@gmail.com>
 <20190808131448.349161-3-tmaimon77@gmail.com>
 <20190808173232.4d79d698@collabora.com>
 <CAP6Zq1iW0C0FDOoqmn5r_xk5HQFWw+GgLfeapvt-8mB50N2Vvg@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 9 Aug 2019 18:26:23 +0300
Tomer Maimon <tmaimon77@gmail.com> wrote:

> Hi Boris,
> 
> Thanks a lot for your comment.
> 
> On Thu, 8 Aug 2019 at 18:32, Boris Brezillon <boris.brezillon@collabora.com>
> wrote:
> 
> > On Thu,  8 Aug 2019 16:14:48 +0300
> > Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> >  
> > > +
> > > +static const struct spi_controller_mem_ops npcm_fiu_mem_ops = {
> > > +     .exec_op = npcm_fiu_exec_op,  
> >
> > No npcm_supports_op()? That's suspicious, especially after looking at
> > the npcm_fiu_exec_op() (and the functions called from there) where the
> > requested ->buswidth seems to be completely ignored...
> >
> > Sorry but I do not fully understand it, do you mean a support for the  
> buswidth?
> If yes it been done in the UMA functions as follow:
> 
>                 uma_cfg |= ilog2(op->cmd.buswidth);
>                 uma_cfg |= ilog2(op->addr.buswidth) <<
>                         NPCM_FIU_UMA_CFG_ADBPCK_SHIFT;
>                 uma_cfg |= ilog2(op->data.buswidth) <<
>                         NPCM_FIU_UMA_CFG_WDBPCK_SHIFT;
>                 uma_cfg |= op->addr.nbytes << NPCM_FIU_UMA_CFG_ADDSIZ_SHIFT;
>                 regmap_write(fiu->regmap, NPCM_FIU_UMA_ADDR, op->addr.val);
>

Hm, the default supports_op() implementation might be just fine for
your use case. But there's one thing you still need to check: the
number of addr cycles (or address size as you call it in this driver).
Looks like your IP is limited to 4 address cycles, if I'm right, you
should reject any operation that have op->addr.nbytes > 4. I also
wonder if there's a limitation on the data size you can have on a
single transfer. If there's one you should implement ->adjust_op() too.
