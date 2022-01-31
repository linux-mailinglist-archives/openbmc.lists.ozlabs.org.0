Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0A14A3E68
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 08:57:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnL4y5zKZz3bN7
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 18:57:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=JEYHKiaV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=JEYHKiaV; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnL4b3zKbz2xXy
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 18:57:03 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-190-118.tukw.qwest.net
 [174.21.190.118])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 3100E273;
 Sun, 30 Jan 2022 23:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1643615819;
 bh=PQ2NCVIjITPTwZWs9WNgZzaktRn7uSoq7Gn/fVWuBfU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JEYHKiaVwffY4fazJwlXjSwkpRdoGV/7VIQ8kG9+R8nCzUfrdRHRCvMDsZNWpBvua
 Xuqfl9aiSD3+BZUyrvcs+hfDIR7Hzxhg88aaO+mksNFcTgruFX0OGeBzlf7xrRBTCO
 L+3L4k7TUFIc/U4KaeEFkoSxaQxVoG4NdoXmZKnw=
Date: Sun, 30 Jan 2022 23:56:55 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add
 support for TXD3/RXD3 pins
Message-ID: <YfeWR0rPOQO+SGb/@hatter.bewilderbeest.net>
References: <20211213194703.24060-1-zev@bewilderbeest.net>
 <20220125173206.GJ5754@packtop>
 <CACPK8XcY3AURVWwKnhg1B_f_VFf4Qb8NfO6j1uKK60VVdBMmfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACPK8XcY3AURVWwKnhg1B_f_VFf4Qb8NfO6j1uKK60VVdBMmfw@mail.gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Jan 30, 2022 at 10:25:38PM PST, Joel Stanley wrote:
>On Tue, 25 Jan 2022 at 17:32, Zev Weiss <zweiss@equinix.com> wrote:
>>
>> On Mon, Dec 13, 2021 at 11:47:03AM PST, Zev Weiss wrote:
>> >In order to support putting the u-boot console on UART3 of the
>> >ast2400, this commit adds support for setting bits 22 and 23 of SCU80
>> >to enable TXD3 and RXD3 on pins C14 and B14, respectively.
>> >
>> >Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>> >---
>> > drivers/pinctrl/aspeed/pinctrl_ast2400.c | 10 ++++++++++
>> > 1 file changed, 10 insertions(+)
>> >
>>
>> Ping...Joel?
>
>
>Pinctrl is not my jam. Did you resolve Ryan's concerns?
>

I had interpreted his last message as indicating that he thought it was 
OK as is, though perhaps I misunderstood -- Ryan, can you confirm?

Zev

