Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E55F3B121A
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 05:21:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8pSl6KNMz303h
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 13:21:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=J6sifTkq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=B2zVLhBd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=J6sifTkq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=B2zVLhBd; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8pSP227Hz2xZh
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 13:20:51 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id EEECEF55;
 Tue, 22 Jun 2021 23:20:47 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Tue, 22 Jun 2021 23:20:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=qKWeGxkF//73HuA8ULy/cAH6m0LHKfy
 t8q4Q1u5aLZ4=; b=J6sifTkqB70JrhE8TxseZiEsyduXYHdc9SpO8i5KdFTzwet
 M9Cyw9JO5csikOWq6nnO4gFmi7dWXw3pGLbEVKTTn1knYe+pIef9x3pWtCO9r0ds
 4WVV+F2ctBGaOd2dkNaEE0P+3RSQJ+1HDugCzEIxS726V1ZvI/bHXh2uIzgsGBUg
 7MANd9/dPTCGxK/z0MEoTYoyi6HHuGKHhjVytcgsNnjvovmxG/Gz3ghwU5vloBNx
 HMlVApF9Anjk1v4UxfA8tb9I9z1fHx5wnoKTe/3RWg1B7nCLByO9A6dXPilZ64CO
 wjnnPCSi5B5J9qpCpdBXjm85HwEZs7Ae4KJvP5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qKWeGx
 kF//73HuA8ULy/cAH6m0LHKfyt8q4Q1u5aLZ4=; b=B2zVLhBd49qEyiG8RHb/53
 e8ib27cXllutN1IBHf575ixtPavgvamim5coDD0CPD8zBRCNnJyzO4tslbuNucph
 BTMEqLRL9NzM9H/ysjWxnDjSgEnqzBIR8ZxKWt+pwZ7jBYBAODeedp9wxo2tI78J
 cdKRRTG3k8c33zv/5QTqs09RTLb20u1q68agRlXqTdrINxTr8oFx4Dg5bM4WaYjh
 Rq0arDUVscY+SZp9uFBsLSWtpVE3zYj5D0N5JpWuRty8p5BqB63FZ1p8RPW8yCpl
 zb3Zy3syKiCdq3uClaybTt9xBMvQL1Py9Pm2thkTtvvZtEML0P7W+REo3KwE+Zhg
 ==
X-ME-Sender: <xms:jqjSYLr-_gWJiv4_taERp11bS1pncN_kcVcO_ejPDXN_9myMAOQWaA>
 <xme:jqjSYFqt2w03xVFjYpKmZE7OyCIkvLCtUN7vO6zJBLJ0mTve7VipjcbshLV170dsm
 aNGYsqkx2n9l4_KoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegvddgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepudehtddtleektedvfeeitdeljeekveelkeegvdfhtdejhefgfedtfedv
 jeejledtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:jqjSYIMDoBYAS4mhlhVioe4Wb6iHl-s97MEdaG6STndAmjnD2W8SOA>
 <xmx:jqjSYO6c8IBQK5mTl6Tp24ZySYJAJYZMaFCw7BlXm2lYczQ-MajThw>
 <xmx:jqjSYK5pHF9_SIuuR58Qh4Nlg2CZeE0QEd16qu3fcY_ncSWuB44Tpg>
 <xmx:j6jSYHVxwp1OwFTqC6y7RFPvt3kbNlGuP4MXlF95nCYbl953h6ZpVg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 481C8AC0072; Tue, 22 Jun 2021 23:20:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-530-gd0c265785f-fm-20210616.002-gd0c26578
Mime-Version: 1.0
Message-Id: <444e0bdf-7cd4-4682-84a2-7ba0eae419d6@www.fastmail.com>
In-Reply-To: <CACPK8Xei9yNygb3_AO+jyoJwoWJ_=SEuZONqwrzGZDX+KmaURg@mail.gmail.com>
References: <20210618035858.4024689-1-andrew@aj.id.au>
 <20210618035858.4024689-3-andrew@aj.id.au>
 <23fff90a-e291-4874-bb8e-685b69ec5c3f@www.fastmail.com>
 <CACPK8Xei9yNygb3_AO+jyoJwoWJ_=SEuZONqwrzGZDX+KmaURg@mail.gmail.com>
Date: Wed, 23 Jun 2021 12:50:26 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.10_2/7]_ipmi:_kcs=5Fbmc:_Add_a_"raw"_ch?=
 =?UTF-8?Q?aracter_device_interface?=
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 23 Jun 2021, at 10:34, Joel Stanley wrote:
> On Wed, 23 Jun 2021 at 00:48, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> >
> >
> > On Fri, 18 Jun 2021, at 13:28, Andrew Jeffery wrote:
> > > +static int kcs_bmc_raw_add_device(struct kcs_bmc_device *kcs_bmc)
> > > +{
> > > +     struct kcs_bmc_raw *priv;
> > > +     int rc;
> > > +
> > > +     priv = devm_kzalloc(kcs_bmc->dev, sizeof(*priv), GFP_KERNEL);
> > > +     if (!priv)
> > > +             return -ENOMEM;
> > > +
> > > +     priv->client.dev = kcs_bmc;
> > > +     priv->client.ops = &kcs_bmc_raw_client_ops;
> > > +
> > > +     init_waitqueue_head(&priv->queue);
> > > +     priv->writable = false;
> > > +     priv->readable = false;
> > > +
> > > +     priv->miscdev.minor = MISC_DYNAMIC_MINOR;
> > > +     priv->miscdev.name = devm_kasprintf(kcs_bmc->dev, GFP_KERNEL, "%s%u",
> > > DEVICE_NAME,
> > > +                                        kcs_bmc->channel);
> > > +     if (!priv->miscdev.name)
> > > +             return -EINVAL;
> > > +
> > > +     priv->miscdev.fops = &kcs_bmc_raw_fops;
> > > +
> > > +     /* Initialise our expected events. Listen for IBF but ignore OBE
> > > until necessary */
> > > +     kcs_bmc_raw_update_event_mask(priv, (KCS_BMC_EVENT_TYPE_IBF |
> > > KCS_BMC_EVENT_TYPE_OBE),
> > > +                                   KCS_BMC_EVENT_TYPE_IBF);
> >
> > Ah, this is now wrong wrt to some other rework that went on, we should be disabling IBF and OBE until the chardev is opened.
> >
> > With the code as it is we can get a "nobody cared" WARN().
> >
> > I'll send a v2.
> 
> Best to put it on the upstream lists. We can pull it in if you need it sooner.

This driver is just a stop-gap until we get Jeremy's socket-based MCTP work merged. It replaces the pile of hacks known as the mctp-lpc driver.

I've explained a bit more in the cover letter:

https://lore.kernel.org/openbmc/20210618035858.4024689-1-andrew@aj.id.au/

Andrew
