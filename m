Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F680948052
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2024 19:31:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XjN9P6Qm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wd3Pd22ggz3ccN
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2024 03:31:01 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XjN9P6Qm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wd3P12wFWz2ysc;
	Tue,  6 Aug 2024 03:30:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69F0060CA4;
	Mon,  5 Aug 2024 17:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F420C32782;
	Mon,  5 Aug 2024 17:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722879026;
	bh=HMmdU3ZbYWB/563oquMicHskGpOAbjwkdkx67Dh+ymc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XjN9P6Qmc1kvluuH/sYzLTgFD4e++TzSgq9mhGtEV3uvnSVBrX6n1mimRiy5/3bwl
	 Xq3R9wcz5TixZf4PvZJWGFjYy2iljuUNhXaAPkbnONXv/v0vOMtp7izSRyE8A+PTsG
	 pjJYqRIQ0GR0EsRngwCuFkFsZUl+74bM/X05oQTtWaASthLT96VKFOG1VRbQYXM72w
	 Wjlzk0I4Us19YR7MGRS+acG8jUCUwgYbpLmw7wp59PcFVzZ7ojKCEV+HXrx4qWVfJE
	 pdZkDFjcpzPJxKyOBdRNFCdgoebnFMgC2y/utWKA1P7yYsjOd7/L6JyvUJcxNB6+yK
	 +vDLcpWOWjilA==
Date: Mon, 5 Aug 2024 19:30:20 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] i2c: don't use ',' after delimiters
Message-ID: <gipvrndaja55f2fh3iwjvcenvdbizuzwrkcf6wow3c2y3pimgr@vorn7q2snn2o>
References: <20240730220401.3649-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730220401.3649-2-wsa+renesas@sang-engineering.com>
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
Cc: imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram,

On Wed, Jul 31, 2024 at 12:01:59AM GMT, Wolfram Sang wrote:
> Delimiters are meant to be last, no need for a ',' there. Remove a
> superfluous newline in the ali1535 driver while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

pushed into i2c/i2c-host.

Thanks,
Andi
