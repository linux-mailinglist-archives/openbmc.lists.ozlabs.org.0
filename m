Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB1E35727C
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 18:56:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFrC7068fz3bp3
	for <lists+openbmc@lfdr.de>; Thu,  8 Apr 2021 02:56:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=cKG2oYmQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=cKG2oYmQ; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFrBs5Q7kz2xZH;
 Thu,  8 Apr 2021 02:56:20 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 8E0D1187;
 Wed,  7 Apr 2021 09:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1617814575;
 bh=tLsAzb4i+D0tHvFBkFiYQRURgrJ6ldDUceF5S9p3Lcs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cKG2oYmQSpuqwag1Pf2GiaevvuxrJjNxMrJbyl32waUHhoxaKS0SFLd2SvT2OtfOM
 hO3TaY7+itpDV1HEcyEWcYoMQYTnFUEVxggySVa6TWZgKUPxJM3MfOzmc3SJ7DHUOh
 FAV5ZAWCm9vH+MuStTVP11xStVMMn3DDuRlXduPc=
Date: Wed, 7 Apr 2021 11:56:04 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: serial: 8250: deprecate
 aspeed,sirq-polarity-sense
Message-ID: <YG3kJC+6gLC6RzzQ@hatter.bewilderbeest.net>
References: <20210402182724.20848-1-zev@bewilderbeest.net>
 <20210402182724.20848-2-zev@bewilderbeest.net>
 <YG3NR4bGRjIGZhgx@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YG3NR4bGRjIGZhgx@kroah.com>
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
Cc: - <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Apr 07, 2021 at 10:18:31AM CDT, Greg Kroah-Hartman wrote:
>On Fri, Apr 02, 2021 at 01:27:21PM -0500, Zev Weiss wrote:
>> This property ties SIRQ polarity to SCU register bits that don't
>> necessarily have any direct relationship to it; the only use of it
>> was removed in commit c82bf6e133d30e0f9172a20807814fa28aef0f67.
>
>Please write that as:
>	c82bf6e133d3 ("ARM: aspeed: g5: Do not set sirq polarity")
>

Ack, will do.

>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>> ---
>>  Documentation/devicetree/bindings/serial/8250.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>
>What changed from previous versions?  That always goes below the ---
>line.
>

I included an overview of that in the cover letter 
(https://lore.kernel.org/openbmc/20210402182724.20848-1-zev@bewilderbeest.net/); 
is it desirable to also have that duplicated in the individual patches 
in the series?


Zev
Zev

