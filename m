Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0E741BA7
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 07:53:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NwyZ0Jl0zDqkd
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 15:53:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="iLxARqYo"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="nnD6ubrG"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NwxM6W78zDqx2
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 15:52:07 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 1461B41D;
 Wed, 12 Jun 2019 01:52:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 12 Jun 2019 01:52:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=KTxzfp2mv3yGdo+q8WP/TgT4OE
 pmxgsGO/h16NV+VEg=; b=iLxARqYoXQx9Ri/SHDhdKgyNh+KXCXlPDqscXK4D6h
 bYo/cAFDzVUHfWYKHWhX0zChpPD88NDKJJ8uKFDsUgJvwsCOKNRC97qNTVYpUDWG
 KuV5lC5qj5PrJkkt7/qU14tK6ceUpO7JBKCzr0LARNNks9UQleDOHKb0F6EqzF5f
 0Ac6LldC0C3n3RKPvq6grzZF9eX3Dfcx7babbjMbyF36geM8kZsNFvmj1/HclizO
 bqhWcQiYCG6TT50J89csaZB9LuoEdHmLUUHa6ygZNE7VQ1v4lx+vW7+XF4t7fk46
 tFYPj/XvL4aZMwoqxEI1QFIfUW+QZfBifT24tmEfg/Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=KTxzfp2mv3yGdo+q8WP/TgT4OEpmxgsGO/h16NV+V
 Eg=; b=nnD6ubrGmGDaUoWaHAuVpg0GoQjuax7OEi72AHTS2jvuRiY+sTkdIUu9p
 CAPfJtGc9fmzFAvuKZa6/MAsh+kcuW9ecUyMruilucDya9TzoVJXpAJQnzc+wAyD
 7Xc/k1i9LdQlJD0VODob/efCiAgbbOhdWMUltLXTWb3dvVdREWyPHiEQPloFOdtp
 aPuGfBQBWvoaN45s7KJLzZl7LTc3Oh429sqVi+6gV7SZVpVIrDBoDP+9ghvZWuRt
 kKjE/Rj1DgdrTHpST3ZfNiOID9AYuRKOCyKu46sKq/IsDhKR19w0Zx6RKItzL/DD
 6Wh557UWUTlqVEJJLEaGNkPv37AHA==
X-ME-Sender: <xms:ApMAXWgoR3YnurG9qDAK_sFaOrIia9Q3R5jok9kWJ45hsNDOw0h1iA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehiedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepufgrmhhu
 vghlucfovghnughoiigrqdflohhnrghsuceoshgrmhesmhgvnhguohiirghjohhnrghsrd
 gtohhmqeenucfkphepuddvfedrvdehgedruddviedruddtieenucfrrghrrghmpehmrghi
 lhhfrhhomhepshgrmhesmhgvnhguohiirghjohhnrghsrdgtohhmnecuvehluhhsthgvrh
 fuihiivgeptd
X-ME-Proxy: <xmx:A5MAXW4jXNuXfCeiLIO8aqGNIA5u_hcN51aYDgkzOg9Eu9pBN5xx9Q>
 <xmx:A5MAXbbwT5LrBsT7T8IhPZRX2H370V8RgZX78DVSFW3ehm4koOQEKA>
 <xmx:A5MAXbe4xcHhhDpgzYaZaDgaZZDfCps8BVCYixjwNW10yx-3-XuYIw>
 <xmx:BJMAXWdJHRQWVaIEI23JgpS2OQ8nOGVLbm_Epgp0Ojnk_hmFqzi1qg>
Received: from v4 (unknown [123.254.126.106])
 by mail.messagingengine.com (Postfix) with ESMTPA id 569628005C;
 Wed, 12 Jun 2019 01:52:00 -0400 (EDT)
Message-ID: <f66e5f86b95295600ed301ede04fb65094fec1e8.camel@mendozajonas.com>
Subject: Re: [PATCH 3/4] net/ftgmac100: Add NC-SI mode support
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Jun 2019 15:51:57 +1000
In-Reply-To: <CACPK8Xdm4_Pnyj02Fws26mPeNSpRo5i7xHA__YbX94GbXU70mQ@mail.gmail.com>
References: <20190606044950.5930-1-sam@mendozajonas.com>
 <20190606044950.5930-4-sam@mendozajonas.com>
 <CACPK8Xdm4_Pnyj02Fws26mPeNSpRo5i7xHA__YbX94GbXU70mQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Simon Glass <sjg@chromium.org>, joe.hershberger@ni.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2019-06-12 at 03:04 +0000, Joel Stanley wrote:
> On Thu, 6 Jun 2019 at 04:50, Samuel Mendoza-Jonas <sam@mendozajonas.com> wrote:
> > Update the ftgmac100 driver to support NC-SI instead of an mdio phy
> > where available. This is a common setup for Aspeed AST2x00 platforms.
> > 
> > NC-SI mode is determined from the device-tree if either phy-mode sets it
> > or the use-ncsi property exists. If set then normal mdio setup is
> > skipped in favour of the NC-SI phy.
> > 
> > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> > ---
> >  drivers/net/ftgmac100.c | 39 +++++++++++++++++++++++++++++----------
> > @@ -181,7 +183,7 @@ static int ftgmac100_phy_adjust_link(struct ftgmac100_data *priv)
> >         struct phy_device *phydev = priv->phydev;
> >         u32 maccr;
> > 
> > -       if (!phydev->link) {
> > +       if (!phydev->link && !priv->ncsi_mode) {
> >                 dev_err(phydev->dev, "No link\n");
> >                 return -EREMOTEIO;
> >         }
> > @@ -217,7 +219,8 @@ static int ftgmac100_phy_init(struct udevice *dev)
> >         if (!phydev)
> >                 return -ENODEV;
> > 
> > -       phydev->supported &= PHY_GBIT_FEATURES;
> > +       if (!priv->ncsi_mode)
> > +               phydev->supported &= PHY_GBIT_FEATURES;
> 
> Instead of hiding this behind ncsi_mode I was assuming the ncsi "phy"
> driver would answer these questions through the phy_read callbacks.
> 
> If you don't think that is going to work then this solution isn't too
> invasive, and we've been using this in Linux for a while, so we know
> it works.

Having this purely transparent would indeed be nice, but it's been a
little awkward fitting NCSI into the u-boot model. phy_read, etc don't
really make sense for a NCSI "PHY" like in the Linux model since there
aren't any registers as such to query - thus checking the device-tree and
skipping the normal mdio bus setup.
I'll have a bit more of a think about the driver model, and probably
exactly how Aspeed (for example) hooks this up; maybe there's a way we
can fit in to the more usual model.

