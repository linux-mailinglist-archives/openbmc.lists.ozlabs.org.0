Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E327998EF1B
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2024 14:21:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XK9kt6KwJz3c7N
	for <lists+openbmc@lfdr.de>; Thu,  3 Oct 2024 22:21:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727958067;
	cv=none; b=KRqhA76mhp76d6hGhx30Ewgj/MBHhOPP/IIuDXwPuisNj8OubRrHWxUr5JCmWWE8MsVk4hcajUtFOafTSjpgb5UhKNy7VqlRNJTYqRO/ECTlvn/gSRBbz+xsPvXL7mlmnXb4GC/FTPgw4iQWfxgGkAtQ+Q2ga5cKyNQ6Kt013Fw1JP4dp/ecBJd9dgDMO7uK5eHWGhH3ck7IyTvLmuoxoNnDiBwLVA6H9USJpUEi+2VcDieWCZz9KOgwNJ6CfVc9Yq8NraPbIrr6ON26pyrmjB9zIHrC6Xur0D2L1B8nSdzXqrwK9CXDZ675lGA01zjv9Z3atePJKh377kAdbzx5EA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727958067; c=relaxed/relaxed;
	bh=kUfSPhrHGdI5ntT4II5zUrrU+szf4XUqmh71fZ30/C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QpDDvHpeaGtbUd2uRvbOTfVFBllsq6bYA8Jo7ZNM4zdH4iaaoF1RsdWkoZ20D8S+GlG1uOjUqYgmBDtXSq6+f/4GpvRqvSfjNysKrHZ5nmKVMwRFOaqwW8KRW5DHtBlyFW61pccJ5+qNRrSz5qkvY7lYg1EOs9wiTKL1FnmGjc9abwc1pHtPMfLVjIsoKWqlPtz8ejfDpWmoLURehsUatOWkBuDhtxyZuazT9F1fGm3RGjmBFjHAYbRoHCY0+yazmAE9+i1YaBM5vMx6CwSeKQmyzxomhts0vho2nz4HLLrUNBwnU1VMqQeWujchrSv76lKH4dbOwXWMyZirgtzkyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H4FgrxZE; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H4FgrxZE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XK9kl3gpcz2xsG;
	Thu,  3 Oct 2024 22:21:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D75ED5C0414;
	Thu,  3 Oct 2024 12:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCCBC4CEC5;
	Thu,  3 Oct 2024 12:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727958057;
	bh=Pf0+TU0f00yp9qWjNLSXwb+armxPLekuoPDpZwMlAbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4FgrxZEgU3kWjhmgdHrOtlgKcYXTXghBdWGkzxNjk6OIJqt+Pe476dPs11yGTjuu
	 0tu4/7ntUBgEvNs/JFtoiW35MsWnsi8kQr4KHsDA456buueTqDWkgAZsZUY3liCQKc
	 /BCml7jgM62ad7O21bW94xZjnyle2r22HOE6qDJRHqfLY4gRK21bIpI2Fit2TalhVK
	 FwyO44A2clQQsnz4cn2TP/7wiFyiEbFw5NlkUtSFpIZe270R61Ap3plvZa6+UGriDr
	 BpoXbJhQxBegfUYXZLxoBUF14TPA+cgkCe9nDa/I6Sm/Pnehfo96yFDD9ogZFcB2Vb
	 OsYGVU6G2zRcw==
Date: Thu, 3 Oct 2024 14:20:54 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v14 0/3] Add ASPEED AST2600 I2Cv2 controller driver
Message-ID: <dun5dterlkikft4p2yuuebb2e4nyzed7xeofmeivzldeardhmf@kzv3iokk6cxn>
References: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
 <Zv1aOedi9xl2mg9b@smile.fi.intel.com>
 <SI6PR06MB75359904E108D7D0CC89A329F2712@SI6PR06MB7535.apcprd06.prod.outlook.com>
 <Zv5u1gTK9yug7rbK@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zv5u1gTK9yug7rbK@smile.fi.intel.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "joel@jms.id.au" <joel@jms.id.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, Oct 03, 2024 at 01:15:50PM GMT, Andy Shevchenko wrote:
> On Thu, Oct 03, 2024 at 03:41:57AM +0000, Ryan Chen wrote:
> > > On Wed, Oct 02, 2024 at 03:02:10PM +0800, Ryan Chen wrote:
> 
> ...
> 
> > > Is it possible to switch to new terminology wherever it's possible?
> > > I.e. master --> controller, slave --> target. See, for example, f872d28500bd
> > > ("i2c: uniphier-f: reword according to newest specification").
> > > 
> > Just for cover latter? Or I should modify for each patches commit message?
> > Or entire i2c driver statement need switch to target?
> 
> I believe everywhere, where it applies: driver code, comments, documentation,
> commit messages...

If the datasheet refers to a register, state, or any other
hardware property as master/slave, we should retain the
master/slave terminology. Otherwise, we should follow the i2c and
smbus specifications and use controller/target.

Andi
