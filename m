Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0130B3B5464
	for <lists+openbmc@lfdr.de>; Sun, 27 Jun 2021 18:39:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GCc0L32gjz300T
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 02:39:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=netrider.rowland.org (client-ip=192.131.102.5;
 helo=netrider.rowland.org; envelope-from=stern+60c002ba@netrider.rowland.org;
 receiver=<UNKNOWN>)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by lists.ozlabs.org (Postfix) with SMTP id 4GCc0748H2z2yjJ
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jun 2021 02:39:34 +1000 (AEST)
Received: (qmail 629122 invoked by uid 1000); 27 Jun 2021 12:39:33 -0400
Date: Sun, 27 Jun 2021 12:39:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "i.kononenko" <i.kononenko@yadro.com>
Subject: Re: [PATCH 1/6] usb:gadget:mass-storage: Improve the signature of
 SCSI handler function
Message-ID: <20210627163933.GA628603@rowland.harvard.edu>
References: <20210626211820.107310-1-i.kononenko@yadro.com>
 <20210626211820.107310-2-i.kononenko@yadro.com>
 <20210627141836.GC624763@rowland.harvard.edu>
 <ded6e647-6dd9-ebd0-0ea5-b20e113bf57f@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ded6e647-6dd9-ebd0-0ea5-b20e113bf57f@yadro.com>
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

On Sun, Jun 27, 2021 at 06:32:03PM +0300, i.kononenko wrote:
> Good morning, Alan!
> 
> First of all, thank you for your time to review my first patchset for 
> the Linux Kernel and valuable advice on the right way of patchwriting!
> 
> On 27.06.2021 17:18, Alan Stern wrote:
> > On Sun, Jun 27, 2021 at 12:18:14AM +0300, Igor Kononenko wrote:
> >> SCSI command handlers currently have an ambiguous return value. This
> > 
> > (I dislike very much this way of writing patch descriptions.  Unless
> > the reader has already looked at the email subject line and remembers
> > that this patch affects the mass-storage gadget, he will think the
> > sentence above is talking about command handlers in the SCSI core -- a
> > completely different part of the kernel.  When writing patch
> > descriptions, please do not assume that the reader already knows what
> > the patch is about.)
> > 
> >> return value may indicate the length of the data written to the response
> >> buffer and the command's processing status. Thus, the understanding of
> >> command handling may be implicit.
> 
> First of all, thank you for your time to review my first patchset for the
> Linux Kernel and valuable advice on the right way of patchwriting!
> 
> I noticed that the status/datasize return value pattern is pervasive for 
> Linux and used through many subsystems. But for the f_mass_storage.c,
> such approach use case is not documented anywhere, and implementation has 
> too many magic-constant, e.g.
> ```
> static int do_inquiry(struct fsg_common *common, struct fsg_buffhd *bh)
> {
>    ....
>    return 36;
> }
> ```
> IMHO, this way is not giving the developer an explicit understanding of 
> 'what is the 36' and its origin.
> If moving to the suggested way is unwanted, I'd keep the implementation 
> as is with additional documentation for each function where uses this 
> approach.

Since every one of the command handler functions uses this convention, 
it would be wasteful to have separate documentation of the return value 
for each function.  A single documentation comment that covers all the 
command handlers would be acceptable.

> Additionally, I guess, define clarify macros of return value instead of 
> magic numbers is required.

If you want, okay.  That should go in a separate patch from the 
documentation patch.

Also, since the return values are different for each command handler, I 
suggest that the macro definitions be placed along with the handler 
functions and not in a separate header file.  Having a separate file for 
these macros would not make any sense, because the values do not need to 
be shared across multiple functions or source files.

> > The return value is _not_ ambiguous.  If the value is >= 0 then it is
> > a data length, otherwise it is a status.  Yes, this is implicit, but it
> > is a very common pattern used throughout the kernel and everyone
> > understands it.
> > 
> >> After this patch, the output buffer's size will be set in the
> >> 'data_size_to_handle' field of 'struct fsg_common', and the command
> >> handler's return value indicates only the processing status.
> > 
> > What is the reason for making this change?  Does it fix any problems
> > or prepare the way for any future patches?  It seems like this is
> > completely unnecessary.
> 
> Yes, the patch uses as part of the incoming implementation of refactoring
> 'usb:gadget:mass-storage:scsi' command handling.

That incoming implementation uses the refactored command handling but 
doesn't depend on the refactoring.  It could just as easily use the 
existing command handling.

> I believed the suggested improvement would be useful for the community as 
> an improvement of code.

Unless you can provide a convincing reason for this change, it doesn't 
seem like an improvement to me.  It's no easier to read or understand, 
and it doesn't improve execution speed on a critical pathway.  It just 
seems like pointless code churn.

Alan Stern
