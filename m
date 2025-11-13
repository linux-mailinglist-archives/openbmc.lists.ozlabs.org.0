Return-Path: <openbmc+bounces-889-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1BAC5A66C
	for <lists+openbmc@lfdr.de>; Thu, 13 Nov 2025 23:55:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6wZr3sCZz2yv4;
	Fri, 14 Nov 2025 09:55:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763074500;
	cv=none; b=eCpuCRYEx4NbsSRcbuxwO72Ca+qP3Szcqhh/HsZ/gwW1V5OslZ1ZvmC2oxKxn1CKZyvrXPNqVIaPzFJPuRqDurKGhBvXO2KGgV8A0cBeMFWvd8QR3K4IBybke4xJfvnovbGaOgw0BkX2mTv0g7lmlbWHMgabYj20AzVUzMBI9hEuMQTXBclVkEO4BpKMzmzQMmFLWUoWhyrjrCZSiV6ErLK4XqdNm+LMQQ687BYLLyLPEuLfaj5ghBZ9k5Ul2JSFuYZtwUH0TqEY3nq8M6/OTI3ORj8MhTqOX/xNEhmLXBAU7szfBOmLtW7kg8uRPAb5BquRWiMcsYlHWRUXX9YV3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763074500; c=relaxed/relaxed;
	bh=qf5iG0YulqsX3ilZljdWbpGqZ5z7sP/Rw4cw/BkrOT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnSXUbIXLbhZuKfhdsmOPwXT6f2lLsUoqqjkFGMIg4Ki/Nf4j4qT3ahjUIeWK8lDMt0lKxQULluwbaNdxhM/2zA2c8bjBBWbfCboJS069zwGoyo4z5Jia7LSnhaVXTqh5O3Y0xpIP04dBdUuETU/OBvwVnkyTJPJt8iklpy/CLdqxvA7Vs59ZN9rC8FFX4kP7sYXWUIB01qYm4Slr7UJJq5o2+3XzCZUfVY1JJNnVGBu5eQrjvsFcsEFuU8Z8BaMi2BCrLYcAae96RgWOgHzsEShGKLMa8sH5et7wtgE3pa3ggQbe3vR0DGJNBF6w0pCu8m8DhO7PkK08OePQY2R5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=E5oaF4WW; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=E5oaF4WW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6wZq1QWDz2xS2
	for <openbmc@lists.ozlabs.org>; Fri, 14 Nov 2025 09:54:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D45646014F;
	Thu, 13 Nov 2025 22:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E47C4CEF5;
	Thu, 13 Nov 2025 22:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763074495;
	bh=eeNgS6dMdW8BnBJ9EzIq7wsx+e6NcysMDkT6yoLcd8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E5oaF4WWoAKKiTbP50n9GPojFIN3+OVf4K27SD/aRe1C7TNbx4VQ372K3KbgV8fo+
	 V2f/EvYpSeO5KfvSjDSTKJI1EObKwiIzzDq3C4AfPv5mnQlsldjovP+aqdaw5kvkiv
	 kvD0VMKlVpD21V766qE3ec98cpUJqqWDL5IfFqUs=
Date: Thu, 13 Nov 2025 17:54:54 -0500
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] PECI changes for v6.19-rc1
Message-ID: <2025111346-radiation-tripping-3cb8@gregkh>
References: <a8bc9becd448a48eb286697155ac8ec716e3467c.camel@intel.com>
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
In-Reply-To: <a8bc9becd448a48eb286697155ac8ec716e3467c.camel@intel.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 06, 2025 at 03:02:15PM +0000, Winiarska, Iwona wrote:
> Hi Greg!
> 
> Please pull PECI update for Linux v6.19.
> 
> Thanks
> -Iwona
> 
> The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:
> 
>   Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwi/linux.git tags/peci-next-6.19-rc1

Pulled and pushed out, thanks.

greg k-h

