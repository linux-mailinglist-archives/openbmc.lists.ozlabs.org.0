Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DCA8B0099
	for <lists+openbmc@lfdr.de>; Wed, 24 Apr 2024 06:33:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FcnYxgdb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VPR1V1pqvz3btk
	for <lists+openbmc@lfdr.de>; Wed, 24 Apr 2024 14:33:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FcnYxgdb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VPR0v63Vfz3bZN
	for <openbmc@lists.ozlabs.org>; Wed, 24 Apr 2024 14:32:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DD5846197C;
	Wed, 24 Apr 2024 04:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE8FC2BD11;
	Wed, 24 Apr 2024 04:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713933146;
	bh=k7pN2KXlqMSU8lAV83Hzq9FVYo5DmXtPRb058mbP4/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FcnYxgdb0NjsGQVp7Ggh0QOJ503fD0J3LvM5R0HruE1WkcJS4gbrhS2QCStgSejfZ
	 ZQXndEQFwvvGrfGvxGlFV+thdCR5Tm4HHk0l3CJ6gT37a/0VhyhH38xi7pKpk1Z+l9
	 k4FnycZU1chKkm1F94bzMzFSQ/6X3fw4CKkmDAOY=
Date: Tue, 23 Apr 2024 21:32:16 -0700
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Subject: Re: [GIT PULL] PECI changes for v6.10-rc1
Message-ID: <2024042308-strongbox-unsaddle-42f4@gregkh>
References: <51cf4c457f1cb77468070e3ec8c3901cd1d056da.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51cf4c457f1cb77468070e3ec8c3901cd1d056da.camel@intel.com>
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

On Fri, Apr 19, 2024 at 09:45:08PM +0000, Winiarska, Iwona wrote:
> Hi Greg!
> 
> Please pull PECI update for Linux v6.10.
> 
> Thanks
> -Iwona
> 
> The following changes since commit 0bbac3facb5d6cc0171c45c9873a2dc96bea9680:
> 
>   Linux 6.9-rc4 (2024-04-14 13:38:39 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwi/linux.git tags/peci-next-6.10-rc1

Pulled and pushed out, thanks.

greg k-h
