Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA7993CDFD
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2024 08:10:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VbnvqkgF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVcml2WwPz3d9V
	for <lists+openbmc@lfdr.de>; Fri, 26 Jul 2024 16:10:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=VbnvqkgF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVcmC1S8sz3cXt
	for <openbmc@lists.ozlabs.org>; Fri, 26 Jul 2024 16:09:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1721974186;
	bh=4W/RJ8v1V6l6GJJ7gH4ftTodCweVvCXBx46M4PiIBGM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VbnvqkgFHG6y4aKMDDhufU9jGOJZWjyVz/yHvZUCpUE2yx3i1PAl6wycbuQy7xsJ+
	 0DI2imz7WbewZmm12l7pskE+HD2lh+nl2QWwCMXDQR4Wjvak3NwLy2sAc7fNmE86Tl
	 hdTEZRnoq8Wmh0PbQRFwyuKJYGY9ErFk3dfidQZxUVTonEx6MNe6cPEimjG+YvoN3K
	 NwnL2pAEeiVbgk9QS0iZVMGXEMEIREdngAyzjATsHMBZLhhP+wg9JCiJjIyD10JDgT
	 AiDAXmjQeHRdkL86sGlqtlBI6WMS6RbTJHUXTbdmKHn0n/n5xJ71obtRggeVwnGzRr
	 bOIwzhPV6pojA==
Received: from [192.168.68.112] (unknown [118.211.93.69])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5A85266AB4;
	Fri, 26 Jul 2024 14:09:46 +0800 (AWST)
Message-ID: <2de21feba0601cbecc40082454bbb999f1ee8e2a.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v1] usb: chipidea: udc: enforce write to the
 memory.
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>
Date: Fri, 26 Jul 2024 15:39:45 +0930
In-Reply-To: <CAP6Zq1hi5Rw+hVn48Taqs=3jQn_9+PC+ZNuvorcm6s_uJURP7w@mail.gmail.com>
References: <20240710124157.2106609-1-tmaimon77@gmail.com>
	 <0cd404956b827b5ac5407b8de7866a221ea0700c.camel@codeconstruct.com.au>
	 <CAP6Zq1hi5Rw+hVn48Taqs=3jQn_9+PC+ZNuvorcm6s_uJURP7w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-07-16 at 16:56 +0300, Tomer Maimon wrote:
> Hi Andrew,
>=20
> On Tue, 16 Jul 2024 at 06:34, Andrew Jeffery
> <andrew@codeconstruct.com.au> wrote:
> >=20
> > On Wed, 2024-07-10 at 15:41 +0300, Tomer Maimon wrote:
> > > In the prime endpoint function, we need to read from qh.ptr->td.token
> > > to ensure that the previous write to it has indeed been committed
> > > to memory.
> > >=20
> > > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > > ---
> > >  drivers/usb/chipidea/udc.c | 15 ++++++++++++---
> > >  1 file changed, 12 insertions(+), 3 deletions(-)
> >=20
> > What's the state of this patch with respect to upstream? Is this
> > something specific to the openbmc/linux dev-6.6 tree, or is there an
> > upstream equivalent? If the latter, can you please link to the relevant
> > patch?
> This patch didn't upstream yet to OpenBMC vanilla.
> Its not specific to openbmc/linux dev-6.6 tree, but it is something
> that related to NPCM UDC module and I am not sure that Chipidea will
> approve to upstream it to the main chipidea driver

Given it's a driver for shared IP I prefer you get some feedback on the
upstream lists before we apply this to the openbmc tree.

Andrew
