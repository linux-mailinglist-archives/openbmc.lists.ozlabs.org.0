Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0F54D1141
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 08:46:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCS7h0Q8zz3bTH
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 18:46:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=kTjwDSVG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=kTjwDSVG; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCS7G04R8z2x9b
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2022 18:46:01 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id BA823D7;
 Mon,  7 Mar 2022 23:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1646725560;
 bh=HXpXa9hrjYoPMQUYirJanMV84faarG7+Ko1HRfUY6j4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kTjwDSVGY2weTNLpafdlH+jLwLqhKbWrUql8kHzXgqB3xfvm5vZnR+3PmlIKgm56m
 iGySOKgao2fUuCtRRA1JA5a8CFT7JqOKmfwAPbOqzCwiHF5UorobuUdolqO86p6Ck1
 cy5RIrfcitrlzkUqEjO0sy4mpR8kFej7koDgPNxw=
Date: Mon, 7 Mar 2022 23:45:57 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 2/2] misc: Add power-efuse driver
Message-ID: <YicJtee4LrShiUC9@hatter.bewilderbeest.net>
References: <20220308011811.10353-1-zev@bewilderbeest.net>
 <20220308011811.10353-3-zev@bewilderbeest.net>
 <YicAWbGN74F6SSNs@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YicAWbGN74F6SSNs@kroah.com>
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

On Mon, Mar 07, 2022 at 11:06:01PM PST, Greg Kroah-Hartman wrote:
>On Mon, Mar 07, 2022 at 05:18:10PM -0800, Zev Weiss wrote:
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7058,6 +7058,11 @@ S:	Orphan
>>  W:	http://aeschi.ch.eu.org/efs/
>>  F:	fs/efs/
>>
>> +POWER EFUSE DRIVER
>> +M:	Zev Weiss <zev@bewilderbeest.net>
>> +S:	Maintained
>> +F:	drivers/misc/power-efuse.c
>> +
>>  EHEA (IBM pSeries eHEA 10Gb ethernet adapter) DRIVER
>>  M:	Douglas Miller <dougmill@linux.ibm.com>
>>  L:	netdev@vger.kernel.org
>
>Entries need to be in sorted order :(
>

Ack, forgot to move it when I renamed an earlier incarnation from 
"efuse" to "power-efuse"...will fix.


Zev

