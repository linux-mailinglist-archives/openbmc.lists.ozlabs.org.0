Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBC81CCEE5
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 02:47:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49L2N46S8bzDqjR
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 10:47:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49L2MM35hszDqhK
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 10:47:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=VotOyfhZ; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49L2MK3RlZz9sNH;
 Mon, 11 May 2020 10:47:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1589158030; bh=nW0qKAASREZcngQPCjdvhhZ6ixzlz4KDwsOx0W2evcU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=VotOyfhZv9X+KyW7P1F6U9gHz4UF1l9LTanBUHINGtAhCMKXGMVItGQhuE+v/51mZ
 rbbwMrmVRvApvvQlZCC5G8rfbLyNgfn4bzXtmIgXdPon+lhg0dbePzwuJcMT0ym+bX
 L1tb9f6RzDNCqN86yb0zpO5L1Xyogp3KS4Jb4mBtxaMg9ipSgZQt0EdMyYXieHPvMF
 +AlmRwjK2joOJNoyv3eps3iAoRQW8zoJhPUa6Y3utg9pVlTn/ZS6OgwtIFAZfJLc6Y
 xoS6QQxCankH5Am0ZdGV6e3suAJLtrpNGXyYmZLjnk6rQ+AmJrN04muw5nVBoQLuP7
 1DdOoxHtp5y1g==
Message-ID: <840ea83777699177e2af8ba77c193c73e27feaca.camel@ozlabs.org>
Subject: Re: How to use eSPI between Host and slave BMC in openbmc project
From: Jeremy Kerr <jk@ozlabs.org>
To: Andrew Jeffery <andrew@aj.id.au>, zhang_cy1989 <zhang_cy1989@163.com>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Date: Mon, 11 May 2020 08:47:08 +0800
In-Reply-To: <775abd77-ce5b-4f1d-99e6-8f14b06114fa@www.fastmail.com>
References: <50cce7b2.1057.171fdb24f4d.Coremail.zhang_cy1989@163.com>
 <775abd77-ce5b-4f1d-99e6-8f14b06114fa@www.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Felix,

> 1 Are there some solutions to use eSPI interface in openbmc project?

There are some platforms in development that use eSPI between the host
and BMC, yes.

> 2 Whether the Host side needs eSPI controler driver? I can't find any
> info about eSPI in linux kernel for host os. Is eSPI transparent to
> the Host side?

For the host hardware I've seen, the eSPI channel doesn't need a driver
- it's usually controlled entirely in hardware by the PCH.

 
> 3 Whether the slave side（Ex BMC/EC） needs slave eSPI driver? I know
> there are some registers descriptions of eSPIcontroller in the
> ast2500 data sheet. Unfortunately, I don't find slave eSPI driver
> either.

For the BMC, we need some support in the kernel to handle eSPI
behaviour. There is a prototype driver for the ast2500 eSPI slave
around, but it hasn't made it upstream:

https://lists.ozlabs.org/pipermail/openbmc/2018-February/010937.html

> 4 which intel products include eSPI feature?

I'm aware of the C62x series of PCH chipsets, there may be others too.

> 5 eSPI interface can transmit io cycle and mem cycle， 
> but in which case or applications eSPI transfer mem cycle?

I haven't seen anything specific, I don't think it'd be too useful in
our architecture.

Cheers,


Jeremy

