Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E54F3B613E
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 16:32:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GD96j217cz30D6
	for <lists+openbmc@lfdr.de>; Tue, 29 Jun 2021 00:32:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=netrider.rowland.org (client-ip=192.131.102.5;
 helo=netrider.rowland.org; envelope-from=stern+60c002ba@netrider.rowland.org;
 receiver=<UNKNOWN>)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
 by lists.ozlabs.org (Postfix) with SMTP id 4GD96V5Bbqz2ydK
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jun 2021 00:32:01 +1000 (AEST)
Received: (qmail 658330 invoked by uid 1000); 28 Jun 2021 10:31:58 -0400
Date: Mon, 28 Jun 2021 10:31:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: "i.kononenko" <i.kononenko@yadro.com>
Subject: Re: [PATCH 3/6] fms: Add TOC/PMA/ATIP DVD-ROM capabilities
Message-ID: <20210628143158.GD656159@rowland.harvard.edu>
References: <20210626211820.107310-1-i.kononenko@yadro.com>
 <20210626211820.107310-4-i.kononenko@yadro.com>
 <20210627142952.GE624763@rowland.harvard.edu>
 <3f9c6e4a-18b7-db11-8b23-f0473a649d06@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f9c6e4a-18b7-db11-8b23-f0473a649d06@yadro.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Jun 27, 2021 at 09:45:07PM +0300, i.kononenko wrote:
> 
> 
> On 27.06.2021 17:29, Alan Stern wrote:
> > Is any of this really needed?  What usage scenarios require
> > f_mass_storage to emulate a DVD-ROM that couldn't use f_tcm instead?
> 
> I can't see any impediments to supplement the already existing 
> implementation of MMC-(2/3) specification of multimedia devices to 
> represent the DVD/BD features. If the kernel presents the CD-ROM SCSI 
> commands, why the mass_storage:usb-gadget-function still doesn't include
> that for DVD/BD?
> 
> Many modern embedded systems (e.g., BMC, OpenBMC) implements their 
> required features, e.g., Virtual Media Device, which is based on the 
> usb:gadget:mass-storage. 
> The purpose of that features is extensive, and their use the mass-storage
> not only as a cdrom-device.
> 
> The required features of such systems might expect image back-end files
> that size is significant than 2.1Gb, but such medium is not the CD-ROM 
> device. USB-gadget consumers can incorrectly interpret such device by 
> loading the wrong driver. I believe that should be the DVD-medium device,
> at least. 

You should include this information in the patch description, so that 
people will understand why you wrote the patch.

> Additionally, please note the current patch also fixes the incorrect 
> implementation of retrieving TOC/PMA/ATIP data, which is required for the 
> CD-ROM. One system might correct works with retrieving first with the 
> last session together, but for some systems, e.g., OS ESXi, OS Windows, 
> should retrieving first and last border sessions in separate SCSI-request. 

What's wrong with the existing implementation?  Are you talking about 
the do_read_toc function?  The driver only supports one session in any 
case.

In general, fixes to existing code and additions of new code should go 
in separate patches.

Alan Stern
