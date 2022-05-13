Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 816DB526C63
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 23:39:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0MVh3dQgz3c8r
	for <lists+openbmc@lfdr.de>; Sat, 14 May 2022 07:39:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=OxIqojsY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=OxIqojsY; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0MVJ1Cplz2xnC
 for <openbmc@lists.ozlabs.org>; Sat, 14 May 2022 07:39:19 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id EDD5AA21;
 Fri, 13 May 2022 14:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1652477955;
 bh=daeFLf+AhaKwZp2OdaLLNRuVaf0ltxVYDfAY45oXBpw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OxIqojsYQxbjfbJUKz7Xq9kXWARnitZSWMnfkPlnTXoidPQznkVJ3ruUpQ9mhoWvA
 ysPcYV4aG/xWUnPCmwnLmJiy7Ku+1DbuAmqLny4CDk2n2BAZGpcfAcGSPFL5XLLFsC
 UkZHK4JpAr6PL398IsdPAhnu5758mfa9c8tZV030=
Date: Fri, 13 May 2022 14:39:12 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Peter Delevoryas <pdel@fb.com>
Subject: Re: [PATCH 0/2] hw: aspeed: Init all UART's with serial devices
Message-ID: <Yn7QAJK7jnE7kz9T@hatter.bewilderbeest.net>
References: <20220513040220.3657135-1-pdel@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513040220.3657135-1-pdel@fb.com>
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
Cc: peter.maydell@linaro.org, andrew@aj.id.au, irischenlj@fb.com,
 openbmc@lists.ozlabs.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 clg@kaod.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 12, 2022 at 09:02:18PM PDT, Peter Delevoryas wrote:
> CC'ing Zev and OpenBMC since this was motivated by a problem Zev had there:
> 
> https://lore.kernel.org/openbmc/YnzGnWjkYdMUUNyM@hatter.bewilderbeest.net/
> 
> This series adds all the missing UART's in the Aspeed chips, and initializes
> them all with serial devices (even if there is no peer character device provided
> by the QEMU user).
> 
> This allows users to quickly test UART output without any code changes. In fact,
> you could even connect all the UART's to separate sockets and check which one is
> emitting data.
> 

Thanks Peter -- I tried this out with an ahe-50dc u-boot build (ast2400 
with stdio on uart3), and with

  -serial null -serial null -serial null -serial mon:stdio

added to the command-line I get the u-boot stdio and the qemu monitor in 
my terminal as expected.

Tested-by: Zev Weiss <zev@bewilderbeest.net>

