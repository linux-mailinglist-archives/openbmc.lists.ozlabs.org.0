Return-Path: <openbmc+bounces-534-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8F9B3BBCD
	for <lists+openbmc@lfdr.de>; Fri, 29 Aug 2025 14:59:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCyyy62gDz2yrX;
	Fri, 29 Aug 2025 22:59:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756472378;
	cv=none; b=EIrkWjabIKW03P9yav0zWLgOQ3n/6+QAdpZ9iamUhmM3RywziGtj+UAZeKbtPduNmsNE9r7MSxvLByR9CgqOkCqawLHexIUqypvRgkS4RLBTl53VmlOrL1RveeVGKGknisuQjtNKtnB2ZytrVDCMnprxm+qxxzP1vahcoVamTrNYGdBkvP87c3K4xH94LhfOrN+S0L5SfSE2OqdkuD/pYCeBJ5h8UlYy/DR8PlmC1Epa727ms5mMuI9cyULogWDg4CRUz4srapnrWi7FV4djD38T70N6pq18gmxsI2d2HkH27sI0ivy6s4lwdNTlmSUF/ft8oNDdZ5rdF0yuqh+HzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756472378; c=relaxed/relaxed;
	bh=4FyR9qAjovqeI+m+jitViHE2vvgDOS41Mzfn/3JqrYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZXZWsm2lVIRsl7GT9q8LILej/m2r9jJjF6Y43d0V+wEXPkUdWdBH+InZde2h9USb+5RRBRxqc1q5E4umulWjKo+IVtAynNS/BsMAv0v1XcpL/OQXTPnYyFTw7iAueBun2Yxov8HVz2JkF6FhcTOX0n4LRhDK1Ke7HMI+Z36dpBZ348ztSsC7TJCjrbhYf/j4PrfS2oKgKKQB78978WiqXqXRWJsZlJcl2OqvIQR4NKFxTgMJv9W9n5ce+EaW8dEERBGMpW31R0KJ4v4KVXWERSY2w/TZWnWRDwSolRH93A4wF+lS9aO/qLKdl5YgkJFe3Xl6+Dl9Z77muR0S5L3WQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=T6hXfMb5; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=T6hXfMb5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCyyx5bscz2yqW
	for <openbmc@lists.ozlabs.org>; Fri, 29 Aug 2025 22:59:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 19D9A60054;
	Fri, 29 Aug 2025 12:59:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52181C4CEF0;
	Fri, 29 Aug 2025 12:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756472374;
	bh=wKLwAaatVuawwgX4VZr5eDDAPSUu3FZl1wwkTtrtsy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T6hXfMb5bYn7IWB82cTdE3Lz/3IcLWwWb4ymP2x+ooS7udAN4zgW90uS/cmBkq/CW
	 6ZilIx2xF3VTDrbBSr73CTlydetl7+KQwzaHVHvv743yDg+2QnjEDsitWJU66GN8pA
	 2n98vIwmxRDub97zjB1EEn1Mub19xUmUm51wpHx8=
Date: Fri, 29 Aug 2025 14:59:31 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] PECI changes for v6.18-rc1
Message-ID: <2025082920-ozone-starry-8675@gregkh>
References: <26c72666403f2718409d903957ddebb3984f4ed4.camel@intel.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26c72666403f2718409d903957ddebb3984f4ed4.camel@intel.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 28, 2025 at 09:51:37PM +0000, Winiarska, Iwona wrote:
> Hi Greg!
> 
> Please pull PECI update for Linux v6.18.
> 
> Thanks
> -Iwona
> 
> The following changes since commit 1b237f190eb3d36f52dffe07a40b5eb210280e00:
> 
>   Linux 6.17-rc3 (2025-08-24 12:04:12 -0400)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwi/linux.git tags/peci-next-6.18-rc1
> 
> for you to fetch changes up to e27f158cf1e98d9a541282ef4b36dfa4427bf361:
> 
>   peci: remove unneeded 'fast_io' parameter in regmap_config (2025-08-28 22:43:23 +0200)

Pulled and pushed out, thanks.

greg k-h

