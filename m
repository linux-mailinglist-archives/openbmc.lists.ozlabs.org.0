Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D823B53BB
	for <lists+openbmc@lfdr.de>; Sun, 27 Jun 2021 16:24:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GCXzq62vPz30D7
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 00:24:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=netrider.rowland.org (client-ip=192.131.102.5;
 helo=netrider.rowland.org; envelope-from=stern+60c002ba@netrider.rowland.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 315 seconds by postgrey-1.36 at boromir;
 Mon, 28 Jun 2021 00:23:57 AEST
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by lists.ozlabs.org (Postfix) with SMTP id 4GCXzd120Fz2ym7
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jun 2021 00:23:56 +1000 (AEST)
Received: (qmail 625898 invoked by uid 1000); 27 Jun 2021 10:23:55 -0400
Date: Sun, 27 Jun 2021 10:23:55 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Igor Kononenko <i.kononenko@yadro.com>
Subject: Re: [PATCH 2/6] usb:gadget:mass-storage: refactoring the SCSI
 command handling
Message-ID: <20210627142355.GD624763@rowland.harvard.edu>
References: <20210626211820.107310-1-i.kononenko@yadro.com>
 <20210626211820.107310-3-i.kononenko@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210626211820.107310-3-i.kononenko@yadro.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Felipe Balbi <balbi@kernel.org>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Jun 27, 2021 at 12:18:15AM +0300, Igor Kononenko wrote:
> Implements a universal way to define SCSI commands and configure
> precheck handlers.

What is the reason for doing this?

At first glance, it appears you have added a great deal of complexity
to the driver.  The patch replaces a large amount of easily understood
(albeit rather repetitious) code with an approximately equal amount
of rather complicated code.  This does not seem like an improvement.

Furthermore, the code you removed is flexible; it easily allows for
small variations as neede by some command handlers.  But the code you
added is all table-driven, which does not easily permit arbitrary
variations.

> Tested: By probing the USBGadget Mass-Storage on the YADRO VEGMAN
> BMC(AST2500) sample, each SCSI command was sent through HOST->BMC; the
> USBGadget MassStorage debug print showed all sent commands works
> properly.
> 
> Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
> ---
>  drivers/usb/gadget/function/f_mass_storage.c | 540 +++++++++++--------
>  drivers/usb/gadget/function/storage_common.h |   5 +
>  2 files changed, 310 insertions(+), 235 deletions(-)

I don't see the point of adding 75 lines to the kernel source if they
don't accomplish anything new.

Alan Stern
