Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0A14FF2DD
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 11:04:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kdc8m6SgFz3bbp
	for <lists+openbmc@lfdr.de>; Wed, 13 Apr 2022 19:04:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=gClOCyeG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=gClOCyeG; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kdc8N1hWhz2xsb
 for <openbmc@lists.ozlabs.org>; Wed, 13 Apr 2022 19:03:47 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id ADC7632C;
 Wed, 13 Apr 2022 02:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1649840621;
 bh=B8/+Q5Rg/0rSicwts1SK29yG4QDu+01MQufsM4qsUdw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gClOCyeGYs96fwgpgp/j4LHwum1IXq+xCwwHsdprimUV+ysN+vskRlxDkC25IC4sp
 rhuDkYP4D5qT1GJngfu2TMMc6Ebd7tiE5mqMGtSb1B4CVkWLJkJ0Sa7p17jfhtqXjc
 j4WncKKTp1sK6LrzY2/12WaYCsHBVAX7c1T4qyhQ=
Date: Wed, 13 Apr 2022 02:03:38 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/2] misc: Add power-efuse driver
Message-ID: <YlaR6kfhQHd3b8Ay@hatter.bewilderbeest.net>
References: <20220308011811.10353-1-zev@bewilderbeest.net>
 <20220308011811.10353-3-zev@bewilderbeest.net>
 <YicAzSara5Sr3LQ7@kroah.com>
 <YicSj3ZuetRkYxH1@hatter.bewilderbeest.net>
 <YlSnMVVE63xqGSGa@hatter.bewilderbeest.net>
 <YlUFuoFPveAYRQDm@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YlUFuoFPveAYRQDm@kroah.com>
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

On Mon, Apr 11, 2022 at 09:53:14PM PDT, Greg Kroah-Hartman wrote:
>On Mon, Apr 11, 2022 at 03:09:53PM -0700, Zev Weiss wrote:
>>
>> Ping...Mark (or Liam?), any thoughts on an appropriate path forward on this?
>
>Make it a regular regulator driver please.
>

The existing userspace-consumer regulator driver does provide some of 
the functionality I'm looking for (the on/off switch), and I think would 
be pretty easy to extend to provide the rest of it as well.  When I 
previously proposed using it as such though, Mark stated quite firmly 
that that wasn't going to fly [0]; this approach was my attempt at 
implementing a generic, abstracted mechanism as he had suggested later 
in that thread, though I haven't gotten any further feedback from him on 
what he thought of it.

If he's had a change of heart and would be open to the 
userspace-consumer driver taking on a bit of new functionality I'd be 
happy to go that route though.

[0] https://lore.kernel.org/openbmc/20210330174221.GJ4976@sirena.org.uk/


Thanks,
Zev

