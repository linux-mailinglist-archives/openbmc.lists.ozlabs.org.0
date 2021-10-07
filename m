Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 155B9424CC2
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 07:27:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ0F56tLyz2yy3
	for <lists+openbmc@lfdr.de>; Thu,  7 Oct 2021 16:27:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=iObknFTY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=iObknFTY; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ0Dk6vtZz2xXx
 for <openbmc@lists.ozlabs.org>; Thu,  7 Oct 2021 16:26:46 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FB2A60F6D;
 Thu,  7 Oct 2021 05:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1633584404;
 bh=QqmyEQpHgC3C4+/OVPi6gbIPhuxRqSoGV3n0WbYwbEM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iObknFTYbCIn2HzSPecreysRmY24UzEfOzfeWW21TtJtTKgGbGYszOY2S2MRCwPIe
 wmpf2rvLx3E5OcD8uOgVPm9XFZpan0FvYhKf1MXueKiNrfU4pazuxClLKhe4Nxg6Qv
 FO9m9aAMuvprn6rGw5bphgcvnSex1I5Y9VtBkmJY=
Date: Thu, 7 Oct 2021 07:26:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 8/9] dt-bindings: document new 'dynamic' common property
Message-ID: <YV6FEisHXqdBuduZ@kroah.com>
References: <20211007000954.30621-1-zev@bewilderbeest.net>
 <20211007000954.30621-9-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211007000954.30621-9-zev@bewilderbeest.net>
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
 Jeremy Kerr <jk@codeconstruct.com.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 06, 2021 at 05:09:53PM -0700, Zev Weiss wrote:
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

I know I can not take patches without any changelog text.  Maybe other
maintainers are more "lax" :(

thanks,

greg k-h
