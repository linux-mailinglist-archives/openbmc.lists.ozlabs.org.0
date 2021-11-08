Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E91447AB4
	for <lists+openbmc@lfdr.de>; Mon,  8 Nov 2021 08:08:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hnhzg432Vz2yXM
	for <lists+openbmc@lfdr.de>; Mon,  8 Nov 2021 18:08:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=bA6UMB6k;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=bA6UMB6k; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnhzG07hfz2x9b
 for <openbmc@lists.ozlabs.org>; Mon,  8 Nov 2021 18:08:25 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 411266112F;
 Mon,  8 Nov 2021 07:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1636355301;
 bh=WG+MUmo7ZfgpICCSz7TrSwgD5tzJlfGEj9mAbIhpCDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bA6UMB6knomM1ld5X5hZ+j+qoN6OKCrPJPhpsm2+hSxbJBueE7fiNviScsDLiXDI7
 zP50uj5iQtRkEEofhAN6zcVd9j8Wz1lTwNGqFVA0OrHela6xEtcIDRUngqqUcfs5kc
 yrePBDYXgcUevFpXptfs9SNi0Jk4iibxeFnkSQSU=
Date: Mon, 8 Nov 2021 08:08:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v4] usb: ehci: handshake CMD_RUN instead of STS_HALT
Message-ID: <YYjM40q6p3zT7CIH@kroah.com>
References: <20210910073619.26095-1-neal_liu@aspeedtech.com>
 <CACPK8Xf40cfnFFeeAzkdXk6ikbfBhWOOt6U8Oq3iCaxe5v5=_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xf40cfnFFeeAzkdXk6ikbfBhWOOt6U8Oq3iCaxe5v5=_w@mail.gmail.com>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, Bruce Mitchell <Bruce.Mitchell@ibm.com>,
 Neal Liu <neal_liu@aspeedtech.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-usb@vger.kernel.org,
 Eddie James <eajames@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tony Prisk <linux@prisktech.co.nz>, Alan Stern <stern@rowland.harvard.edu>,
 Tao Ren <rentao.bupt@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 06, 2021 at 01:27:02AM +0000, Joel Stanley wrote:
> Hi Greg,
> 
> On Fri, 10 Sept 2021 at 07:38, Neal Liu <neal_liu@aspeedtech.com> wrote:
> >
> > For Aspeed, HCHalted status depends on not only Run/Stop but also
> > ASS/PSS status.
> > Handshake CMD_RUN on startup instead.
> >
> > Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> > Acked-by: Alan Stern <stern@rowland.harvard.edu>
> > Reviewed-by: Tao Ren <rentao.bupt@gmail.com>
> > Tested-by: Tao Ren <rentao.bupt@gmail.com>
> 
> Has this one gone in? If not, here's some tags:
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> It also needs to go to stable:
> 
> Cc: stable@vger.kernel.org
> Fixes: 280a9045bb18 ("ehci: fix EHCI host controller initialization sequence")

This patch failed to apply to 4.4.y, 4.9.y, and 4.14.y, so could you
provide a working backport for those kernels for me to be able to queue
it up to the stable queues there?

thanks,

greg k-h
