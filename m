Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FCC5A65FC
	for <lists+openbmc@lfdr.de>; Tue, 30 Aug 2022 16:13:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MH8Rv2NK2z3c3B
	for <lists+openbmc@lfdr.de>; Wed, 31 Aug 2022 00:13:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FC5PtbFC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FC5PtbFC;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MH8RS0n9Bz3bcc
	for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2022 00:13:22 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 52A8861517;
	Tue, 30 Aug 2022 14:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BB2C433D6;
	Tue, 30 Aug 2022 14:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1661868798;
	bh=ZTk15ZgVYXrQGuome5BmZMDt8/CCStppaB/q541mVbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FC5PtbFCsH/4038LOLUR7Ia9VSEqlv+Pi/d0Lo0RHJ2IMuLJ1ED9mhDQYDxNhz6/9
	 eZ/8iaM5cznE7OaOaqYdxQ4rljnUc31x6T/mw0zNdTzPpfSLvlYOKBHEki99y0LVdS
	 2vpIHJfewiR1io/tM5SCTsZYDfiFO3zui1MlBuO4=
Date: Tue, 30 Aug 2022 16:13:12 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Subject: Re: [GIT PULL] PECI fixes for v6.0
Message-ID: <Yw4a+EbQSiSw7JR/@kroah.com>
References: <c0585d60961ed200f422a9f2124ee269827504e3.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0585d60961ed200f422a9f2124ee269827504e3.camel@intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 15, 2022 at 06:58:16PM +0000, Winiarska, Iwona wrote:
> Hi Greg,
> 
> Those fixes were previously sent after your development tree was already closed.
> It would be great, if you can pull them for Linux v6.0.
> 
> Thanks
> -Iwona
> 
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwi/linux.git tags/peci-fixes-6.0

Pulled and pushed out, thanks.

greg k-h
