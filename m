Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B66AE35B8BB
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 04:43:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJY1w4YdLz2yR6
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 12:43:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Pj17EJIJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=Pj17EJIJ; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJY1g3Jylz2xZW;
 Mon, 12 Apr 2021 12:42:46 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id AD5774DC;
 Sun, 11 Apr 2021 19:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1618195362;
 bh=2JSiMj2lTtmX/cUYNHcQfWGUlLOWOoaYmlbsGHi9kio=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pj17EJIJVgdcFiOCc3Sp5k+Ahwe2EdYCOMrNIkcBILxo9psf3hCrccvT9SMGg01VH
 HuSkUSpuQaQCc85/EC1LmH/OEuwkcoDCRqG9EYUJRGYv9QG+8O6kzFbVqCZgZ9ZA32
 enjwhxM73UTmJ+0J96VAy9QZoMEhfN4R7652iOlo=
Date: Sun, 11 Apr 2021 21:42:39 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v3] ARM: dts: aspeed: add ASRock E3C246D4I BMC
Message-ID: <YHOznzolgu+j9Ruh@hatter.bewilderbeest.net>
References: <20210401044232.9637-1-zev@bewilderbeest.net>
 <84202973-1a94-4630-beeb-f33d044a0364@www.fastmail.com>
 <CACPK8XcfuEyqGmO72taXFPARxwzLyct5__0C0CF-nyEf6Yubnw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACPK8XcfuEyqGmO72taXFPARxwzLyct5__0C0CF-nyEf6Yubnw@mail.gmail.com>
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
 Rob Herring <robh+dt@kernel.org>, Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Apr 11, 2021 at 09:20:59PM CDT, Joel Stanley wrote:
>On Mon, 12 Apr 2021 at 02:16, Andrew Jeffery <andrew@aj.id.au> wrote:
>> On Thu, 1 Apr 2021, at 15:12, Zev Weiss wrote:
>
>> > +&vuart {
>> > +     status = "okay";
>> > +     aspeed,sirq-active-high;
>>
>> This should probably go away, but otherwise,
>
>Zev, this has already been merged (both to mainline for v5.13 and in
>openbmc), so any fixups need to come as patches on top of the existing
>code.
>

Got it, thanks -- I figured I'd wait until the DT-properties patches got 
approved & merged (I'll be sending v6 of that shortly) and then send an 
incremental update for the e3c246d4i dts to match the final form of 
those.


Zev

