Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C8A4D10B4
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 08:06:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCRFk0jQNz2yLX
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 18:06:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Mqfig3KD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=Mqfig3KD; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCRFJ173zz2yph
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2022 18:06:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9DFEDB817CF;
 Tue,  8 Mar 2022 07:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F96C340EB;
 Tue,  8 Mar 2022 07:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646723166;
 bh=SsdHusTl3QI8L9Ly+y53eKxrZbMr6a0OkOwSEoD9JVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mqfig3KDabrKxjUQH4fbAy3ai5Rig5TC0dONyPe8WoLOMcDB9GjViUgDzd4pAyjeR
 lSoX8erYqF9i8dU14DAhKvxxqHsU/RP90DcsochSvcJwiMpUpzQr4IS3er65NlUW7S
 wiDizF0RwKMY6XOzFfeTtYw4o8bd/hZ66cAqktoI=
Date: Tue, 8 Mar 2022 08:06:01 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2 2/2] misc: Add power-efuse driver
Message-ID: <YicAWbGN74F6SSNs@kroah.com>
References: <20220308011811.10353-1-zev@bewilderbeest.net>
 <20220308011811.10353-3-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308011811.10353-3-zev@bewilderbeest.net>
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
Cc: openbmc@lists.ozlabs.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Mar 07, 2022 at 05:18:10PM -0800, Zev Weiss wrote:
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7058,6 +7058,11 @@ S:	Orphan
>  W:	http://aeschi.ch.eu.org/efs/
>  F:	fs/efs/
>  
> +POWER EFUSE DRIVER
> +M:	Zev Weiss <zev@bewilderbeest.net>
> +S:	Maintained
> +F:	drivers/misc/power-efuse.c
> +
>  EHEA (IBM pSeries eHEA 10Gb ethernet adapter) DRIVER
>  M:	Douglas Miller <dougmill@linux.ibm.com>
>  L:	netdev@vger.kernel.org

Entries need to be in sorted order :(

