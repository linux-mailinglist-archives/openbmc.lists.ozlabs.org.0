Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0AF4C5D8
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 05:36:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TnYL0krfzDqw6
	for <lists+openbmc@lfdr.de>; Thu, 20 Jun 2019 13:36:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="UdgBJom2"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="s8zjGGgc"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TnXZ6HPxzDqsX
 for <openbmc@lists.ozlabs.org>; Thu, 20 Jun 2019 13:35:58 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 95F16441;
 Wed, 19 Jun 2019 23:35:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 19 Jun 2019 23:35:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=/W9/bRyG1K82ExsaZbV9oROSoY
 xFY2RbU9rNcg3AoMU=; b=UdgBJom2ilifZ4LcdjZvoYBT6gOV7wPJ5YVU/+kHSM
 C/mgitfVqTgCbCTIZlK9yhrtqS48zsChWubKl32xWkJ2Aoq9Iiw9YyhCW68nYY01
 C2sYjaMMkyalrCyoI1DmAVQ9JaJg3+D8ihu1uVw1+r662nahOKI7/sJPP7kBVaJt
 JP8oi1t4pSTO1cONDos86hUtnSYYIWuUEHXXxviwXwHnx7o/iLIL8rnHsykD+Yqf
 COa1HNOs6IBWUGdMb8E6AqAhjYe/G7iHzals9gkkPSaDNR4vamXo03BG+0wWus8L
 c3GkkA3avPLQ14sx8E3+Myz3uS7cmYA8H5WYZh57QgHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=/W9/bRyG1K82ExsaZbV9oROSoYxFY2RbU9rNcg3Ao
 MU=; b=s8zjGGgc/isd6yoIrC78JwZSoZeBVMBJqPhx5IsyTvxzklQYGQgK3cusv
 47FCXGla4qJ0W/ZHa8CjTSLMm2GpovpMqrSYxo0GaoHLrnn9uABnH7LhnGAQGYq5
 4aDXyypF3oKsrLAWZ8l0XGsatbYfAhWd50NJ80prnFgwjDMEusf5QWTJOHoNldU0
 6G+PQUCfvmf+nyyNqmqrTe898VlVsjc5y+xOG/8EtpgcROhHChp0b1pgEx+PzP0D
 JOXsIr6Ld528OD8qLv6u3Ce3gGA6gCmFnY6yotbGAHG/sjYC284XXG0Jyh2//sWi
 uUxu1TCgUsvE2pIhbf3rgMRB154pA==
X-ME-Sender: <xms:F_8KXXWGAj6JZUxE0MfPDrPhLU_SDAX5ZSuVeUXaLDbZjg9iVb7-og>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtdefgdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefurghmuhgv
 lhcuofgvnhguohiirgdqlfhonhgrshcuoehsrghmsehmvghnughoiigrjhhonhgrshdrtg
 homheqnecukfhppeduvddvrdelledrkedvrddutdenucfrrghrrghmpehmrghilhhfrhho
 mhepshgrmhesmhgvnhguohiirghjohhnrghsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptd
X-ME-Proxy: <xmx:F_8KXU1nuySJF9-bz5_FKEXlIqTx0escVRlDSDnO7OK_ZFaK23byeg>
 <xmx:F_8KXVHJKdxfkpiVvQgEGkXA7u6GTnN7sPJqNia-Lp-88FkiGZ9LEQ>
 <xmx:F_8KXahznlGedo1HyqsDAFRfZnIdDWtTmpjtYG7pc6Jez18JalUsEg>
 <xmx:Gf8KXSgiSa2qWfgfSpCZNs7eZ3dHfA1aY8i1UHMVHzkLlJHkYK1L-Q>
Received: from v4 (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7B4C9380076;
 Wed, 19 Jun 2019 23:35:49 -0400 (EDT)
Message-ID: <6f2bd3960efd895eb2660fcf02053f14f8d6a386.camel@mendozajonas.com>
Subject: Re: [PATCH v2 4/4] net: NC-SI setup and handling
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Joel Stanley <joel@jms.id.au>
Date: Thu, 20 Jun 2019 13:35:45 +1000
In-Reply-To: <CACPK8XctZJj3KwhB_5ctmBgungeNrHe8gCORmjtwdx=enHROxg@mail.gmail.com>
References: <20190618013720.2823-1-sam@mendozajonas.com>
 <20190618013720.2823-5-sam@mendozajonas.com>
 <CACPK8XctZJj3KwhB_5ctmBgungeNrHe8gCORmjtwdx=enHROxg@mail.gmail.com>
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

On Wed, 2019-06-19 at 02:35 +0000, Joel Stanley wrote:
> On Tue, 18 Jun 2019 at 01:38, Samuel Mendoza-Jonas <sam@mendozajonas.com> wrote:
> > Add the handling of NC-SI ethernet frames, and add a check at the start
> > of net_loop() to configure NC-SI before starting other network commands.
> > This also adds an "ncsi" command to manually start NC-SI configuration.
> > 
> > Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> > ---
> > v2: Update ncsi command help text
> > 
> >  cmd/Kconfig   |  8 ++++++++
> >  cmd/net.c     | 18 ++++++++++++++++++
> >  include/net.h |  2 +-
> >  net/net.c     | 27 ++++++++++++++++++++++++++-
> >  4 files changed, 53 insertions(+), 2 deletions(-)
> > 
> > diff --git a/cmd/Kconfig b/cmd/Kconfig
> > index 0badcb3fe0..9851b04972 100644
> > --- a/cmd/Kconfig
> > +++ b/cmd/Kconfig
> > @@ -1332,6 +1332,14 @@ config CMD_LINK_LOCAL
> >         help
> >           Acquire a network IP address using the link-local protocol
> > 
> > +config CMD_NCSI
> > +       bool "ncsi"
> > +       depends on PHY_NCSI
> > +       help
> > +         Manually configure the attached NIC via NC-SI.
> > +         Normally this happens automatically before other network
> > +         operations.
> 
> Do we need to make it even clearer that "this command not required to use NCSI"?
> 
> I'm thinking of future me wondering if we should put this in openbmc
> builds or not. It would be good to have your advice on this.
> 
> Cheers,
> 
> Joel

Either way; it's definitely not required but might be useful for sanity
checking things in BMC bringup.

