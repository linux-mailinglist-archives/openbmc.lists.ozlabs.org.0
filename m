Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC6E524D1
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 09:31:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XyXH53byzDqJL
	for <lists+openbmc@lfdr.de>; Tue, 25 Jun 2019 17:31:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="H2cHmo2p"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XyWN047szDqFZ
 for <openbmc@lists.ozlabs.org>; Tue, 25 Jun 2019 17:30:55 +1000 (AEST)
Received: from localhost (f4.8f.5177.ip4.static.sl-reverse.com
 [119.81.143.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 115A72085A;
 Tue, 25 Jun 2019 07:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561447852;
 bh=4epmSJ7jd5ByQ7pNK6zUj/oXuoSovcWeH6v4vssgIIw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H2cHmo2pJI4ZbLSNajdR8C1HfNEzADIySNJJJxfU3WrRJjFGTMd7Tj4NZsusZXPd5
 3nAepyNZW5/ttcQvB315a2rWjAL6kZhytnMwzTIqgpGC0tYNMSi6PT8CYJpivwWamZ
 kNGQYa7q9J/a4ZY67R5lhT9nSq6mcmMZKUuYpUSk=
Date: Tue, 25 Jun 2019 15:24:07 +0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] fsi: sbefifo: Don't fail operations when in SBE IPL state
Message-ID: <20190625072407.GA18197@kroah.com>
References: <1548090958-25908-1-git-send-email-eajames@linux.ibm.com>
 <1780173.icGFXHrAMq@townsend>
 <CACPK8XfqSyMB4pWLffzx+8qOj+m54h=aWUhYsKMV4TQR0fKVUg@mail.gmail.com>
 <CACPK8Xfns=dSD5gaVJ--OkmVe7ggqF8acGsszdPqM1AqpPSAiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xfns=dSD5gaVJ--OkmVe7ggqF8acGsszdPqM1AqpPSAiA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 25, 2019 at 04:35:50AM +0000, Joel Stanley wrote:
> Hi Greg,
> 
> On Mon, 17 Jun 2019 at 05:41, Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Mon, 17 Jun 2019 at 02:09, Alistair Popple <alistair@popple.id.au> wrote:
> > >
> > > On Monday, 21 January 2019 11:15:58 AM AEST Eddie James wrote:
> > > > SBE fifo operations should be allowed while the SBE is in any of the
> > > > "IPL" states. Operations should succeed in this state.
> > > >
> > > > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > >
> > > This fixed the problem I was having trying to issue istep operations to the
> > > SBE.
> > >
> > > Tested-by: Alistair Popple <alistair@popple.id.au>
> >
> > This one slipped through the cracks.
> >
> > Fixes: 9f4a8a2d7f9d fsi/sbefifo: Add driver for the SBE FIFO
> > Reviewed-by: Joel Stanley <joel@jsm.id.au>
> >
> > Greg, can you please queue this one up for 5.3?
> 
> Ping?

I don't see this in my queue at all, sorry.  Can someone resend it in a
format that I can apply it in with the needed tested-by and reviewed-by
added to it?

thanks,

greg k-h
