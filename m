Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF226B2B8E
	for <lists+openbmc@lfdr.de>; Thu,  9 Mar 2023 18:06:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXbF855GPz3cdn
	for <lists+openbmc@lfdr.de>; Fri, 10 Mar 2023 04:06:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=et4WE6hm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=et4WE6hm;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXbDX0FLpz3cLs
	for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2023 04:06:02 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1D16561C63;
	Thu,  9 Mar 2023 17:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16C99C433D2;
	Thu,  9 Mar 2023 17:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678381559;
	bh=RSAcqfw4DMiJLx3ImYjFMzMWkPOStE1x/RPh9faErv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=et4WE6hm2isC5kXMdE+ecn3CDmiqVOOnkljYx1MXTIqaakWdZ4hwV1MXy5gmLRHLB
	 cNno5cB/DxyAraiUtPwPo02Km5mxNUFNVuQB2UsM94wnYuHHbke28mgOtyBgJE1Ya7
	 +zotgLElptdLwreqs5LcYmcuVKoi5tl8O7VUSINo=
Date: Thu, 9 Mar 2023 18:05:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v2 2/2] misc: smpro-errmon: Add dimm training failure
 syndrome
Message-ID: <ZAoR9EnGBAwGaF0l@kroah.com>
References: <20230228092010.1863419-1-quan@os.amperecomputing.com>
 <20230228092010.1863419-3-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230228092010.1863419-3-quan@os.amperecomputing.com>
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

On Tue, Feb 28, 2023 at 04:20:10PM +0700, Quan Nguyen wrote:
> Adds event_dimm[0-15]_syndrome sysfs to report the failure syndrome
> to BMC when DIMM training failed.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> v2:
>   + Change "to initialized" to "to initialize"            [Paul]
>   + Corrected kernel version to 6.3                  [Greg,Paul]

Sorry, but this is going to have to be 6.4 now.

thanks,

greg k-h
