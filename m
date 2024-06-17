Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3AC90BB4B
	for <lists+openbmc@lfdr.de>; Mon, 17 Jun 2024 21:40:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=N4d/aq3n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W30bB6nNBz3gCL
	for <lists+openbmc@lfdr.de>; Tue, 18 Jun 2024 05:40:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=N4d/aq3n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W30Zd61Vsz3g7v
	for <openbmc@lists.ozlabs.org>; Tue, 18 Jun 2024 05:39:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0F198CE119B;
	Mon, 17 Jun 2024 19:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFEFFC4AF1A;
	Mon, 17 Jun 2024 19:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718653169;
	bh=eifoVYumsdizkrAoyM6QgvMhpDqLMiStFLxX6KG1t64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N4d/aq3noWi2duzNPZk1nDL3mUgGnUJSxcqCzdyIUFzCsqp6PMTm6aUHlTWQv3Ec6
	 054Fp8hBQqpPqvzS8c0oyWrosalN6jqs6mZTL+O0yIZMWmawEIWaRPICfsK/GXJRj2
	 97heaekywe1HoweuRn8ZERafGVplV7Ha/sx1pF7k=
Date: Mon, 17 Jun 2024 21:39:26 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Subject: Re: [GIT PULL] PECI changes for v6.11-rc1
Message-ID: <2024061717-ninth-jigsaw-c625@gregkh>
References: <4726946cc4ece91b414994fcd696aebf69ee115b.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4726946cc4ece91b414994fcd696aebf69ee115b.camel@intel.com>
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

On Mon, Jun 17, 2024 at 02:08:58PM +0000, Winiarska, Iwona wrote:
> Hi Greg!
> 
> Please pull PECI update for Linux v6.11.
> 
> Thanks
> -Iwona
> 
> The following changes since commit 6ba59ff4227927d3a8530fc2973b80e94b54d58f:
> 
>   Linux 6.10-rc4 (2024-06-16 13:40:16 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwi/linux.git peci-next-6.11-rc1

Pulled and pushed out, thanks.

greg k-h
