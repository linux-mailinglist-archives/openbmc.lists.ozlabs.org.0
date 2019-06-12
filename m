Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A79741BC1
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 07:56:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Nx1w4MpDzDqnM
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 15:56:04 +1000 (AEST)
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
 header.b="jSwyPocG"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="XNV27xpo"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NwzQ678NzDr1x
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 15:53:54 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 1F8D830B;
 Wed, 12 Jun 2019 01:53:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 12 Jun 2019 01:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=P4SbxbKxZ8QnU4kBGRZfLD13Wm
 w2RzlkyLXn+cSL6iE=; b=jSwyPocGcIuEIHd32RpiLwXExNLbV9l8w8YAayT4bG
 y+O/Bhl/qZnpBBW7iyXnaMHrLrJAcADMGliN2OT92pcTj4BV0QkJt1JP6Dfg/ydW
 XJ7+7M8j0/xZ8LOp+fW0xZCn5CBFYvTnOn22qjcosCN4mI6vKWpkpvIOzGi464cy
 +AL7pME4qjK9cF/RrCsB2p/P8aJBysafeMg9GwHaYZ9/aoyruM7vSYSoBV3Zf/Jo
 Ks1ndozvyHs7Yh40Q+h+ObDlkOk2dzr6hiBF7fCKh934173FHukfH0IdhLWTk1Xh
 73ypLTzvUvsfGUgXVntZ94SPk1lCgLBa3gN7efw3mm7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=P4SbxbKxZ8QnU4kBGRZfLD13Wmw2RzlkyLXn+cSL6
 iE=; b=XNV27xpoBv5esnl0xsFRAkfhVpKISWeFgw8Qy7X+lAR6s1qRXZ/8iBaoa
 vux3Lc5xtxmdQNw/vzBkoutEUawff3w00cKmUXNkvLerBBLNL8b2Bffw2hgLPXlo
 E2U286oe/op463qAWdCoaCMc4D00A5CQxXa6Go0dYkeWfVRqHj4bD4FA/oI6p9Hq
 CT5kQFL2CUtj10GnPwZ1jgYKXOfFt9ZW1iydh68Emipe1DU/mkkD6uvTjP6LwXWi
 XIQ/2hXomsdWLpPj5D7GpLIsgg/c5pXjtwkhXzaXFI3UKwGbNt7D7339yapsEMd4
 GDvVTtMkScrG5XpjGen6+Dmv1nQvg==
X-ME-Sender: <xms:b5MAXcuBfSnGxxOQbpD80hu8EMVbvG2oQuJKuPZsf4-mpswwOQMe1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehiedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepufgrmhhu
 vghlucfovghnughoiigrqdflohhnrghsuceoshgrmhesmhgvnhguohiirghjohhnrghsrd
 gtohhmqeenucfkphepuddvfedrvdehgedruddviedruddtieenucfrrghrrghmpehmrghi
 lhhfrhhomhepshgrmhesmhgvnhguohiirghjohhnrghsrdgtohhmnecuvehluhhsthgvrh
 fuihiivgeptd
X-ME-Proxy: <xmx:b5MAXZqbeVI97mZB3zLhNoZfKDQDEF8-SmeoAAvflNnVa8hvC732UA>
 <xmx:b5MAXZnlZYWDSWCTxsUFAVT-3tNMq4CfLLUN7F7SzJnWHWMFBNJWTA>
 <xmx:b5MAXdy1fJnD64uFoHIJjtIea_1905fTDGgkZZ1uhjCzvVr9mh9cGw>
 <xmx:b5MAXXg2FiE6Q0_RDYJCElMHIbS50FcuJes4e0okW0h0oq8xnu4V7Q>
Received: from v4 (unknown [123.254.126.106])
 by mail.messagingengine.com (Postfix) with ESMTPA id DBFD580060;
 Wed, 12 Jun 2019 01:53:48 -0400 (EDT)
Message-ID: <955024633e676cbaced59467644a6a6dedbb4e2d.camel@mendozajonas.com>
Subject: Re: [PATCH 4/4] net: NC-SI setup and handling
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Jun 2019 15:53:46 +1000
In-Reply-To: <CACPK8XdB6HN13Ov=vO++2tYCakbwqPDEfbsOA9dzBj5hs9Jvmg@mail.gmail.com>
References: <20190606044950.5930-1-sam@mendozajonas.com>
 <20190606044950.5930-5-sam@mendozajonas.com>
 <CACPK8XdB6HN13Ov=vO++2tYCakbwqPDEfbsOA9dzBj5hs9Jvmg@mail.gmail.com>
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

On Wed, 2019-06-12 at 02:05 +0000, Joel Stanley wrote:
> On Thu, 6 Jun 2019 at 04:50, Samuel Mendoza-Jonas <sam@mendozajonas.com> wrote:
> > Add the handling of NC-SI ethernet frames, and add a check at the start
> > of net_loop() to configure NC-SI before starting other network commands.
> > This also adds an "ncsi" command to manually start NC-SI configuration.
> > 
> > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> 
> We need the u-boot net specialists to weigh in, but this looks okay to
> me. Please clarify the help text for the NCSI command, then add:
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> > --- a/cmd/Kconfig
> > +++ b/cmd/Kconfig
> > @@ -1296,6 +1296,12 @@ config CMD_LINK_LOCAL
> >         help
> >           Acquire a network IP address using the link-local protocol
> > 
> > +config CMD_NCSI
> > +       bool "ncsi"
> > +       depends on PHY_NCSI
> > +       help
> > +         Configure the attached NIC via NC-SI
> 
> Can we clarify in the text if we need the 'ncsi' command to use any
> NC-SI attached NIC, or if it's more for ncsi and network debugging?

Can do - the command manually kicks off configuration of the NC-SI
topology, but isn't needed in normal use.

