Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7339A424CBF
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 07:26:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ0DH2bZ0z2ywX
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 16:26:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=K/pkgEaT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=K/pkgEaT; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ0Cx48Xnz2xXx
 for <openbmc@lists.ozlabs.org>; Thu,  7 Oct 2021 16:26:05 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 114C9611AE;
 Thu,  7 Oct 2021 05:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633584363;
 bh=x2wFVdUzumwx8hHL6zp2elbESyJKKZzYQG0HU/tZB1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K/pkgEaTeWzw2a8Cu+KPDGJAkOrrQrygbcIN4qtbPTxnrBn4FHdvUDlfAjur/Z4mO
 Yolqun6+sbUA+RIUGzDdfMWuibYw+5MTJoHSO/ilUb57a5vBM8iAc3Op7Plm/mt0cO
 p2Ts9mdZAgiQh4PVkvEkIpHzibzZD3YT7xmLYYSE=
Date: Thu, 7 Oct 2021 07:26:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 5/9] of: add self parameter to of_update_property()
Message-ID: <YV6E6UcMEOyNCXqW@kroah.com>
References: <20211007000954.30621-1-zev@bewilderbeest.net>
 <20211007000954.30621-6-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007000954.30621-6-zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Frank Rowand <frowand.list@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 06, 2021 at 05:09:50PM -0700, Zev Weiss wrote:
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -64,7 +64,7 @@ int of_node_is_attached(struct device_node *node);
>  int __of_add_property_sysfs(struct device_node *np, struct property *pp);
>  void __of_remove_property_sysfs(struct device_node *np, struct property *prop);
>  void __of_update_property_sysfs(struct device_node *np, struct property *newprop,
> -		struct property *oldprop);
> +		struct property *oldprop, bool self);

Again, not a good api decision at all

thanks,

greg k-h
