Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A498A46E60
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2025 23:18:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z385525mwz3cb2
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2025 09:18:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740608326;
	cv=none; b=CuxxE8EN+5ZrisQCKqQwFMOG/jo2NxBjqnN0esLmWvF2v8tXuvG5bhwUhXuP1I5TdENBu67unNcT5baPmwtgGjMajMMuzfExnxczK24/KO7h3mHvVJQEpYNmY3/NVY4LC7vCBIPwKfVKYZYzk5aX9WiCKTcU3ZHuidRmssQ5ooeH36Sg2dw3i4C0RzEtA3lpUWne6DfiklziDDWlHgMbIVNwtFIuIYGCs6AJju587o5MM3O/2YA1jNhzM2GqP+wlaRAdrxlFD7Eivl8YLyWaTzojPDw3/2AFzkOR4NcNCOj3A0BOfRui8MEje+uHhFmcb1krDCX/D1PwvZurDSOH/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740608326; c=relaxed/relaxed;
	bh=cLP2PJ3efgcI4MlJm4t+DzhLwIjEdO/2/L9titqg9gU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnrccfaQWM9wrL7wq9iUWAYBJlWm2EMqaxz1f8GlXJygTl6O83GMi6yx8BRbqaBp8tbc4/VjNXkOUYNpFltJr04sfHqyafRto4bYMG6FN9xFp5JBeqlrkOvr+/N/pUUNHQgq185Fhj5mMdhgAfCWZFpGNM48XQj1DxYd3KmE88Cj9KGKUH4hAz6Qh6mnU4QQ9JLROLA/kft2JtciBniSCiFRYUikUthanawxHqxZBanaBos+lXXIR/6HRMYRPs7U43c9q8hqxGNOHzA+/9niTfjJqAPnVr2NvA+Z9oGDDQakHFD9weM2JOo6eGpV5w6FRqo51kyjM7W9unjA66r5CA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HDOkHq1L; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HDOkHq1L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z38515rclz2yyx
	for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2025 09:18:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EFDAB5C7535;
	Wed, 26 Feb 2025 22:18:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06700C4CED6;
	Wed, 26 Feb 2025 22:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740608323;
	bh=cLP2PJ3efgcI4MlJm4t+DzhLwIjEdO/2/L9titqg9gU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HDOkHq1LSz8+rDhpPeKIDjaUTYNumfgRX5ZOU1iXaXruj+N/vdG+yCiSCpSd9OZ71
	 mrqhf0NF188mNe2Ui+t8PgXAGxnORkAOzirbifapyAT1RC151lXbSdVwRkLhriHOzm
	 1VZL/o9OJinE/GJatkq76y/6AYyXI7LzwN9V0iy3Q6poeUeJDeHk1zh7ICREaQOsCl
	 RLFEFK9RN91sY+Tsx0xHJ4JC4Dvvbx5rJ8wVheA2HOCDOMA6+RtCEEGACNC3EuO7HI
	 rOaENGjy3wCFo+6we2UgpnTF0eGOmiaVSgkX+kQl3+XUdLdWIA5TUt30a5F3lYOKXs
	 91DptvU/Dxp8g==
Date: Wed, 26 Feb 2025 23:18:39 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v1 1/1] i2c: npcm: disable interrupt enable bit before
 devm_request_irq
Message-ID: <nantj66w7l7bmk2sz6i2akyaw7cievmeuuvpl3622wj5xmdmtm@g4rcuwxghxdp>
References: <20250220040029.27596-1-kfting@nuvoton.com>
 <20250220040029.27596-2-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220040029.27596-2-kfting@nuvoton.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: KWLIU@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, linux-i2c@vger.kernel.org, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tyrone,

On Thu, Feb 20, 2025 at 12:00:29PM +0800, Tyrone Ting wrote:
> The customer reports that there is a soft lockup issue related to
> the i2c driver. After checking, the i2c module was doing a tx transfer
> and the bmc machine reboots in the middle of the i2c transaction, the i2c
> module keeps the status without being reset.

...

> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

I guess we also need:

Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver")
Cc: <stable@vger.kernel.org> # v5.8+

I'm now applying the patch to the i2c/i2c-host-fixes with these
tags

Please, let me know if you think that's not the case.

Thanks,
Andi
