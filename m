Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB003B53C3
	for <lists+openbmc@lfdr.de>; Sun, 27 Jun 2021 16:26:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GCY295wySz3005
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 00:26:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=netrider.rowland.org (client-ip=192.131.102.5;
 helo=netrider.rowland.org; envelope-from=stern+60c002ba@netrider.rowland.org;
 receiver=<UNKNOWN>)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by lists.ozlabs.org (Postfix) with SMTP id 4GCY1z5vnqz2ysm
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jun 2021 00:25:59 +1000 (AEST)
Received: (qmail 625832 invoked by uid 1000); 27 Jun 2021 10:18:36 -0400
Date: Sun, 27 Jun 2021 10:18:36 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Igor Kononenko <i.kononenko@yadro.com>
Subject: Re: [PATCH 1/6] usb:gadget:mass-storage: Improve the signature of
 SCSI handler function
Message-ID: <20210627141836.GC624763@rowland.harvard.edu>
References: <20210626211820.107310-1-i.kononenko@yadro.com>
 <20210626211820.107310-2-i.kononenko@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210626211820.107310-2-i.kononenko@yadro.com>
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

On Sun, Jun 27, 2021 at 12:18:14AM +0300, Igor Kononenko wrote:
> SCSI command handlers currently have an ambiguous return value. This

(I dislike very much this way of writing patch descriptions.  Unless
the reader has already looked at the email subject line and remembers
that this patch affects the mass-storage gadget, he will think the
sentence above is talking about command handlers in the SCSI core -- a
completely different part of the kernel.  When writing patch
descriptions, please do not assume that the reader already knows what
the patch is about.)

> return value may indicate the length of the data written to the response
> buffer and the command's processing status. Thus, the understanding of
> command handling may be implicit.

The return value is _not_ ambiguous.  If the value is >= 0 then it is
a data length, otherwise it is a status.  Yes, this is implicit, but it
is a very common pattern used throughout the kernel and everyone
understands it.

> After this patch, the output buffer's size will be set in the
> 'data_size_to_handle' field of 'struct fsg_common', and the command
> handler's return value indicates only the processing status.

What is the reason for making this change?  Does it fix any problems
or prepare the way for any future patches?  It seems like this is
completely unnecessary.

Alan Stern

> Tested: By probing the USBGadget Mass-Storage on the YADRO VEGMAN
> BMC(AST2500) sample, each SCSI command was sent through HOST->BMC; the
> USBGadget MassStorage debug print showed all sent commands works
> properly.
> 
> Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
