Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FF0350E47
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 06:57:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9rXG50s4z304G
	for <lists+openbmc@lfdr.de>; Thu,  1 Apr 2021 15:57:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=KqKIFjoQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=KqKIFjoQ; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9rX05dWCz2xg7;
 Thu,  1 Apr 2021 15:57:20 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id EDFBF6F;
 Wed, 31 Mar 2021 21:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1617253038;
 bh=/OFrumQsIOz4iJCnXsvYbRHkqc1dbRe2/tQBo/d/ldk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KqKIFjoQeMd0usXeCOewSZVXGqKTaqxtdO2A065RaVsCHjr1ulhCW6cC1/2FEXt1D
 69deZT8CjP6UHfihlRbLw2aAt/sMx4M9AsG/OC0Ek/DDuK2h860pIPpdRlPI9qKxjg
 oSrrcgzqgDZiFNcAH82msjTMpyIZSaEMKyE92tpo=
Date: Wed, 31 Mar 2021 23:57:16 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH v2 3/3] dt-bindings: serial: 8250: add
 aspeed,sirq-active-high
Message-ID: <YGVSrCo7mVkSJTeQ@hatter.bewilderbeest.net>
References: <YGOuhjD19SmjmQou@hatter.bewilderbeest.net>
 <20210401005702.28271-1-zev@bewilderbeest.net>
 <20210401005702.28271-4-zev@bewilderbeest.net>
 <d66753ee-7db2-41e5-9fe5-762b1ab678bc@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <d66753ee-7db2-41e5-9fe5-762b1ab678bc@www.fastmail.com>
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

On Wed, Mar 31, 2021 at 11:04:44PM CDT, Andrew Jeffery wrote:
>
>
>On Thu, 1 Apr 2021, at 11:27, Zev Weiss wrote:
>> This provides a simpler, more direct alternative to the deprecated
>> aspeed,sirq-polarity-sense property for indicating the polarity of
>> the Aspeed VUART's SIRQ line.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> ---
>>  Documentation/devicetree/bindings/serial/8250.yaml | 13 ++++++++++---
>>  1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/serial/8250.yaml
>> b/Documentation/devicetree/bindings/serial/8250.yaml
>> index 491b9297432d..e79bb6ab9d2c 100644
>> --- a/Documentation/devicetree/bindings/serial/8250.yaml
>> +++ b/Documentation/devicetree/bindings/serial/8250.yaml
>> @@ -12,8 +12,9 @@ maintainers:
>>  allOf:
>>    - $ref: /schemas/serial.yaml#
>>    - if:
>> -      required:
>> -        - aspeed,sirq-polarity-sense
>> +      anyOf:
>> +        - required: [ aspeed,sirq-active-high ]
>
>Do you think we could make use of the approach I put forward here?
>
>https://lore.kernel.org/openbmc/20210319062752.145730-18-andrew@aj.id.au/T/#u
>
>Andrew

If you mean using a u32 property (say aspeed,sirq-polarity) with an 
explicit IRQ_TYPE_LEVEL_{LOW,HIGH} instead of a present/absent bool,
sure, I guess that seems like a somewhat clearer, more orthogonal 
arrangement.


Zev

