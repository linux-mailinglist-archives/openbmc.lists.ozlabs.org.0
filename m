Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2EBA77BE
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 02:03:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NPCz4s9pzDqpy
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 10:03:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="nzDjn94z"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TP9LTiUr"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NPC76G0LzDqkW;
 Wed,  4 Sep 2019 10:02:26 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 616A04EC;
 Tue,  3 Sep 2019 20:02:21 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 03 Sep 2019 20:02:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=e2m08tJLme9DAXqhOo/SiutMgnTWzRV
 5kaLQ5K1ekAY=; b=nzDjn94z9twTnGbhrKJ/a73kjcHrGTL9VWrGlAJuPT6XS2b
 ghrJMcXU8s6VbgR17WvlJaho31+Eh/OQwEkyj0vYFsgn2UHXgny78fRx/LjbptIS
 MhA1CSzESkwlAeP5Akm6WDmDXiJ3OlqUq8jF1jq5Wc+/9RgOQAALIOwcRzYqpCcV
 By30GqX5fXYxyOKKlqg7YrvUE+e+W4BpDRYZIG93ILZPheSplnh+9ldj3A05OMuV
 5T2pyhvcZZ/wHOBYb/4ivhjA+AtQ2iaUdRYaMG/3dE0frBQ7oMNKk41qtCH6V7xw
 Nmehft5ZwLynGIrFxHg0s6gAjW4j3Xq8czo2qpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=e2m08t
 JLme9DAXqhOo/SiutMgnTWzRV5kaLQ5K1ekAY=; b=TP9LTiUreJY4bZLWzMJ1fk
 oTwdGNuCbqXjxZX+qj8doMbEAr4qwhNPd0ogE7rUnt3pj6MUxznpkmNGE3Na2iW7
 IuqYY92EMFrTnCEf3MENAU2Ob/jtroq4uJY8zWCf8ntpoRF35EejGSJ0Uxp2TI65
 IOC7h3GDw/zy0DamxQ00nV8D2qxIDjzCRa7554IGJTw+rUCFqNzmmw0RTqjaRVDQ
 ruU6uRB5l0LFQ9nwEgO87wSKTK31bHvsmH9KOOhGVNjLZRmdi2ZifZtBY1C//NRh
 Cj/v+pJU4ujHPC5+kayV9O6kokfdKuFCCB2IwIQ1uXlyonfmdHDcAUshtV75jNMQ
 ==
X-ME-Sender: <xms:C_9uXbcxP2ZIW9ShjiBFkTgSlNMrsYIBE_TuiLO1yU8EpbgBExZ96g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejgedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:C_9uXUNGfWVK6Pu3ZUBOvzJ6bFKv4JeQID4Y8l2M4pzPGY8cVJnxAA>
 <xmx:C_9uXeb4vzNVrfsUUkEuXqkogR7Cad-_J3fBJm2JG3AYTvbzJ-ODAA>
 <xmx:C_9uXYC3_rVXSh611uTU2_uEd4lFI-hBt5mTDTqHpKAeGEikQsWqDQ>
 <xmx:Df9uXa8S4WRLMDJI7BY_Rw3nHq-_YQE3oi5P35WPeIkz-w1PjvkFnQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2A685E00A3; Tue,  3 Sep 2019 20:02:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-154-gfa7592a-fmstable-20190829v1
Mime-Version: 1.0
Message-Id: <38ff59e7-491b-478b-afff-a664d8f66547@www.fastmail.com>
In-Reply-To: <CAPDyKFpWJu3RH4TWoO_wcJq0LDrM_fAUfsCC==e8O_6A8dLhiA@mail.gmail.com>
References: <20190902035842.2747-1-andrew@aj.id.au>
 <20190902035842.2747-2-andrew@aj.id.au>
 <CACPK8XfYgEUfaK6rtr+FdEq-Vau6d4wE2Rvfp6Q4G2-kjVLT0g@mail.gmail.com>
 <83570e25-b20a-4a17-85ea-15a9a53289bf@www.fastmail.com>
 <CAPDyKFpWJu3RH4TWoO_wcJq0LDrM_fAUfsCC==e8O_6A8dLhiA@mail.gmail.com>
Date: Wed, 04 Sep 2019 09:32:44 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ulf Hansson" <ulf.hansson@linaro.org>
Subject: Re: [PATCH v2 1/4] mmc: sdhci-of-aspeed: Fix link failure for SPARC
Content-Type: text/plain
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 kbuild test robot <lkp@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 4 Sep 2019, at 00:18, Ulf Hansson wrote:
> On Mon, 2 Sep 2019 at 07:26, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> >
> >
> > On Mon, 2 Sep 2019, at 13:42, Joel Stanley wrote:
> > > On Mon, 2 Sep 2019 at 03:58, Andrew Jeffery <andrew@aj.id.au> wrote:
> > > >
> > > > Resolves the following build error reported by the 0-day bot:
> > > >
> > > >     ERROR: "of_platform_device_create" [drivers/mmc/host/sdhci-of-aspeed.ko] undefined!
> > > >
> > > > SPARC does not set CONFIG_OF_ADDRESS so the symbol is missing. Guard the
> > > > callsite to maintain build coverage for the rest of the driver.
> > > >
> > > > Reported-by: kbuild test robot <lkp@intel.com>
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > > ---
> > > >  drivers/mmc/host/sdhci-of-aspeed.c | 38 ++++++++++++++++++++----------
> > > >  1 file changed, 25 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> > > > index d5acb5afc50f..96ca494752c5 100644
> > > > --- a/drivers/mmc/host/sdhci-of-aspeed.c
> > > > +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> > > > @@ -224,10 +224,30 @@ static struct platform_driver aspeed_sdhci_driver = {
> > > >         .remove         = aspeed_sdhci_remove,
> > > >  };
> > > >
> > > > -static int aspeed_sdc_probe(struct platform_device *pdev)
> > > > -
> > > > +static int aspeed_sdc_create_sdhcis(struct platform_device *pdev)
> > > >  {
> > > > +#if defined(CONFIG_OF_ADDRESS)
> > >
> > > This is going to be untested code forever, as no one will be running
> > > on a chip with this hardware present but OF_ADDRESS disabled.
> > >
> > > How about we make the driver depend on OF_ADDRESS instead?
> >
> > Testing is split into two pieces here: compile-time and run-time.
> > Clearly the run-time behaviour is going to be broken on configurations
> > without CONFIG_OF_ADDRESS (SPARC as mentioned), but I don't think
> > that means we shouldn't allow it to be compiled in that case
> > (e.g. CONFIG_COMPILE_TEST performs a similar role).
> >
> > With respect to compile-time it's possible to compile either path as
> > demonstrated by the build failure report.
> >
> > Having said that there's no reason we  couldn't do what you suggest,
> > just it wasn't the existing solution pattern for the problem (there are
> > several other drivers that suffered the same bug that were fixed in the
> > style of this patch). Either way works, it's all somewhat academic.
> > Your suggestion is more obvious in terms of correctness, but this
> > patch is basically just code motion (the only addition is the `#if`/
> > `#endif` lines over what was already there if we disregard the
> > function declaration/invocation). I'll change it if there are further
> > complaints and a reason to do a v3.
> 
> I am in favor of Joel's suggestion as I don't really like having
> ifdefs bloating around in the driver (unless very good reasons).
> Please re-spin a v3.
> 
> Another option is to implement stub function and to deal with error
> codes, but that sounds more like a long term thingy, if even
> applicable here.

No worries then, will post a respin shortly.

Andrew
