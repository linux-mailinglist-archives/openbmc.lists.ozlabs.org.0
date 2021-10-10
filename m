Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8B8428174
	for <lists+openbmc@lfdr.de>; Sun, 10 Oct 2021 15:11:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HS2Nw1LJkz2yQL
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 00:10:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FlVt5E5h;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=FlVt5E5h; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HS2NT1zn4z2xtv
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 00:10:32 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1F6A61076;
 Sun, 10 Oct 2021 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633871428;
 bh=ofLwMdJPr8c/nsbZa56UKm1KuyjPyG9jWpmTcjItIHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FlVt5E5hCUuYIzb0anOPd40p3AUJyGYcdEiISlWEgBLmKbO3UmSM8vhIz22loHgnj
 fYGaBiGQC9nK1cLDkpyuwLwd9gTo48LdQ1wcM26g+fEAH7/tzGUCpu9wPqmSKgwltr
 +nGSMitrNMxUeVIrfQLW7Nnhm8suc7dBctswbzDE=
Date: Sun, 10 Oct 2021 15:10:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v4] usb: ehci: handshake CMD_RUN instead of STS_HALT
Message-ID: <YWLmQcw1ON4/BWfV@kroah.com>
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

This is already in my tree, but waiting until 5.16-rc1, sorry.  You can
see it at commit 7f2d73788d90 ("usb: ehci: handshake CMD_RUN instead of
STS_HALT") in linux-next.  I'll try to remember to queue it up in stable
after it hits Linus's tree.

thanks,

greg k-h
