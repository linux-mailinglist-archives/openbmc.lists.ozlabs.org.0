Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4104C352512
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 03:20:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBMg12Bbtz3bvm
	for <lists+openbmc@lfdr.de>; Fri,  2 Apr 2021 12:20:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=HfKFGPOy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=HfKFGPOy; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBMff0l37z2yZC;
 Fri,  2 Apr 2021 12:19:53 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 077D4198;
 Thu,  1 Apr 2021 18:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1617326389;
 bh=G8rBZRZvYmpd8o2JnBLz+E9kxXF/0mTp2nuOMD0ePt4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HfKFGPOy/jqFi/BvkNmXkrnBaEFVbosfT3gvTTCGAShQzSfVHKvS8LGi909Oo6cjT
 DjdjMlrA7IeRZLDE0t4Xq0nZrycHq1uarkkOLR+Z213w1EOBcqy1QseADj3NDeigjE
 DnygHZ1rUPTyHGMr6FPzHpWt9aM8ljyDbZuG9XjQ=
Date: Thu, 1 Apr 2021 20:19:47 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v3 4/4] dt-bindings: serial: 8250: add aspeed, lpc-address
 and aspeed,sirq
Message-ID: <YGZxM31x0All76gm@hatter.bewilderbeest.net>
References: <20210402004716.15961-1-zev@bewilderbeest.net>
 <20210402004716.15961-5-zev@bewilderbeest.net>
 <639f957f-a0d7-4a06-8598-90da0e17820b@beta.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <639f957f-a0d7-4a06-8598-90da0e17820b@beta.fastmail.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>,
 Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 01, 2021 at 08:14:39PM CDT, Andrew Jeffery wrote:
>
>
>On Fri, 2 Apr 2021, at 11:17, Zev Weiss wrote:
>> These correspond to the existing lpc_address, sirq, and sirq_polarity
>> sysfs attributes; the second element of aspeed,sirq provides a
>> replacement for the deprecated aspeed,sirq-polarity-sense property.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>>  .../devicetree/bindings/serial/8250.yaml      | 27 ++++++++++++++++---
>>  1 file changed, 24 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml
>> b/Documentation/devicetree/bindings/serial/8250.yaml
>> index 491b9297432d..a6e01f9b745f 100644
>> --- a/Documentation/devicetree/bindings/serial/8250.yaml
>> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
>> @@ -12,8 +12,13 @@ maintainers:
>>  allOf:
>>    - $ref: /schemas/serial.yaml#
>>    - if:
>> -      required:
>> -        - aspeed,sirq-polarity-sense
>> +      anyOf:
>> +        - required:
>> +            - aspeed,lpc-address
>
>Why not aspeed,lpc-io-reg like the KCS binding?
>
>There are some things we can do to improve it, but we shouldn't go and invent something different. I prefer aspeed,lpc-io-reg because it's name derives from the generic 'reg' property as does it's behaviour (if you assume a related `#size-cells = 0`).
>
>> +        - required:
>> +            - aspeed,sirq
>
>Why not aspeed,lpc-interrupts like the KCS binding?
>
>The generic IRQ property is 'interrupts', so like aspeed,lpc-io-reg the interrupts proposal for KCS follows in name and form. I'm hiding it behind the aspeed vendor prefix for now while I'm not satisfied that I understand the requirements of non-aspeed parts. Similarly, I added the lpc prefix because we don't tend to describe the host devicetree in the BMC devicetree (and so there's no parent interrupt controller that we can reference via a phandle) and we need a way to differentiate from the local interrupts property.
>
>I don't see a reason for either of them to differ from what we already have for KCS, and I don't see any reason to continue the sysfs naming scheme in the binding.
>

Ah, OK -- I was aiming for consistency with the existing vuart sysfs 
attributes, but if that's not a worthwhile concern I'm fine with 
aspeed,lpc-io-reg & aspeed,lpc-interrupts.


Zev

