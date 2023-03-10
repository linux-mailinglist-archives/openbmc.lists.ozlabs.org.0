Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BA96B3714
	for <lists+openbmc@lfdr.de>; Fri, 10 Mar 2023 08:07:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXxv63QCyz3cdb
	for <lists+openbmc@lfdr.de>; Fri, 10 Mar 2023 18:07:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=WrIssav4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=WrIssav4;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXxtV2Dvkz3cJv
	for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2023 18:06:41 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B482CB82144;
	Fri, 10 Mar 2023 07:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A2EC433EF;
	Fri, 10 Mar 2023 07:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678431995;
	bh=5MOUFWSnqIo6NjaZfs8HYPeTVyUcf2oJ5jGXV/iGSYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WrIssav4U5Byc0TJei5AgQATvlt9VFzxr5LI32HJvsTOnSXG9VPObWz1wAbwP39Gp
	 n92V7f2hqW/bQAe3Ob7oVU2DKYqwpe8ClpxvULRjpuqWfiWEfbTYeqRonozPhtOoNX
	 j30Wzr+fh42Yc2xz4vF0Tqwof4yHfDyVx8y28zpE=
Date: Fri, 10 Mar 2023 08:06:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v2 2/2] misc: smpro-errmon: Add dimm training failure
 syndrome
Message-ID: <ZArW+JvLTLn796Wx@kroah.com>
References: <20230228092010.1863419-1-quan@os.amperecomputing.com>
 <20230228092010.1863419-3-quan@os.amperecomputing.com>
 <ZAoR9EnGBAwGaF0l@kroah.com>
 <57a36c86-3d17-88fd-2ef1-ee4adcea1ce4@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57a36c86-3d17-88fd-2ef1-ee4adcea1ce4@os.amperecomputing.com>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Joel Stanley <joel@jms.id.au>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 10, 2023 at 07:20:56AM +0700, Quan Nguyen wrote:
> 
> 
> On 10/03/2023 00:05, Greg Kroah-Hartman wrote:
> > On Tue, Feb 28, 2023 at 04:20:10PM +0700, Quan Nguyen wrote:
> > > Adds event_dimm[0-15]_syndrome sysfs to report the failure syndrome
> > > to BMC when DIMM training failed.
> > > 
> > > Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> > > ---
> > > v2:
> > >    + Change "to initialized" to "to initialize"            [Paul]
> > >    + Corrected kernel version to 6.3                  [Greg,Paul]
> > 
> > Sorry, but this is going to have to be 6.4 now.
> > 
> 
> Thanks Greg for the review,
> 
> So should I send another version for the patch with 6.3 to 6.4 correction ?

Yes please, for both, so I can queue them up now for the 6.4-rc1 merge
window.

thanks,

greg k-h
