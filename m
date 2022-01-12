Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A5448BC42
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 02:15:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYV3Y6Prnz30D7
	for <lists+openbmc@lfdr.de>; Wed, 12 Jan 2022 12:15:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=K2ve6+e/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=K2ve6+e/; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYV3B00G4z2xDV
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jan 2022 12:14:45 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-190-118.tukw.qwest.net
 [174.21.190.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id C2F2F293;
 Tue, 11 Jan 2022 17:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1641950082;
 bh=ZT9PJgDrRvnP2QDGwtXPPP/4k5HNYE0wgsYa9UJT854=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K2ve6+e/Wb3O8ZduDSRjEZzuxJGea+jfax//ksc/Hy/zXpM/RKo3AxqWPb4van+yu
 pHP13cg1diJKrks2OVy0GJPVKmcSpdRDsNTVhvvjh8TOuhdaz5GLPl/fpRKt7cLhlG
 0wSnqA17NpekCGWo1D57vLEge9d/c9YC9lO+Z0I0=
Date: Tue, 11 Jan 2022 17:14:38 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Add ASRock ROMED8HM3 BMC
Message-ID: <Yd4rfi/iICQ5EjGh@hatter.bewilderbeest.net>
References: <20220105101719.7093-1-zev@bewilderbeest.net>
 <CACPK8XeHyoo0D1vQm=L8m284kC5n-O+FEMp1HN+ROWJfx7qjhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACPK8XeHyoo0D1vQm=L8m284kC5n-O+FEMp1HN+ROWJfx7qjhQ@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Neil Horman <neil.horman@privafy.com>,
 Olof Johansson <olof@lixom.net>, Anthony Jenkins <anthony.jenkins@privafy.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 11, 2022 at 02:59:28AM PST, Joel Stanley wrote:
>On Wed, 5 Jan 2022 at 23:10, Zev Weiss <zev@bewilderbeest.net> wrote:
>>
>> This is a half-width, single-socket Epyc server board with an AST2500
>> BMC.  This device tree is sufficient for basic OpenBMC functionality,
>> but we'll need to add a few more devices (as driver support becomes
>> available) before it's fully usable.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>
>Reviewed-by: Joel Stanley <joel@jms.id.au>
>

Thanks!

>Have you considered using the openbmc gpio naming scheme for the
>gpio-line-names?
>

I looked at it, but decided not to for a few reasons:

  - For systems that are in the early stages of a porting effort (like 
    this one currently is), I'm still referring to hardware schematics 
    fairly often, and using the same identifiers in software that are 
    used in the schematics simplifies things by avoiding an extra
    translation step between the two.

  - Most of the GPIO-related userspace components (that I'm dealing with 
    anyway, e.g. x86-power-control and host-error-monitor) already have 
    their own GPIO line-name configuration/remapping mechanisms that need 
    to be set up anyway.

  - There's a solid mix of GPIOs that would be covered by the naming 
    guidelines and others that aren't; having a mix of the two styles 
    seems a bit awkward to me.

That said, I sympathize with the motivation behind it and I'm not 
vehemently opposed on the whole, so if there's a strong preference to 
follow that scheme I could probably be talked into changing it.


Zev

