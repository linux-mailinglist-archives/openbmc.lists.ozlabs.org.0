Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33563986782
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2024 22:19:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDSkG3Rl8z3by2
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2024 06:19:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727295554;
	cv=none; b=Er2Yx/bt9LIzIUimzWIc9fdCoyW6+/jJd+xYPMempgjEUzrqbFAe42P1MNsbtnnx8FU5bLqkcSTg4LRoIobv4i+cEvasG6ySPncqYfXFU78JkkuNpJZ1JUvREQYbz1h8YIgqshKgzWiSlrqiYSSjWfcsQyFRjosxlGJY0adOvvH2hOoEhp9JHt4ItIhU9ILNetxzp3yjS2UeAoffoaXWmTx5jIEjqdKvUIDYMctdgPjuGtYZCci+NbLV7BSK92SgWdO22w7wvNR9Z4UTafVmPkPYTW9K85frj8L4wmbrnT72x5VGo6lsg7uvn3Oq0D4MfZEFve6e82huTUbHtTIUqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727295554; c=relaxed/relaxed;
	bh=kxKKUcrZB/+rHKHIj4EsZr/uNVxIOKhVxGwF/VNM2+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltVSbwCOU7lLQACTo46NQ5NeFlS+Y1qRUOd/VNWK9yPrrCVS4z0VsrWbnJqYr2z5zRGxmi5foiNvjxiQSHOyDeyBEKULEUl1RfdqHOUKB/mPlq9hCmnqhDMumU26HFCJPO09prOYvRXGugNojHjCpgsSQNTl5bef23Zif4uOl6TrckuweHwXc4qVGhUUjdVIrPghnuBxtJyv1VWbRKv8SVbKUcbUNid/vqfqBrILWRYJ32aKn46DOUicqtD7inoKJy5oS2EHuhiNWxbKsPw8N1VbSDfNHFcSEGH6yg0tY7NarK3X42HXWPk/+SV1chpitwoDrfExZZP4l+efyWW+nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TK3JSYw7; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TK3JSYw7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDSkB1D37z2xmk
	for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2024 06:19:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1211AA44798;
	Wed, 25 Sep 2024 20:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE080C4CEC3;
	Wed, 25 Sep 2024 20:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727295550;
	bh=vAWMx9G13EynX00wpjAYAtIgxqGNrZ8HS8AmNSNLzmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TK3JSYw7OksLYc64eM2dFrj77UAE82vPI0wTltj2nMZZtgh39bGoooZmRMfcmZeIH
	 0uxWhFlApIimXYuYNT4GUkJeJ9pH6yqnwlQif4YPazukSweFaSjBteuU24g0w2b3i4
	 paJycJC9fjNF43l9Rr9VMkfOKEoVZftXF5OeYZnrxehjkH1Vk97NusWYzoEZC0qA7Q
	 Bw0dZxUN5HMr1gp6GWSe9vt0ir40YKRt6u41GJ3pE+Y1keIxTW6bwOW+GNjokh/T+i
	 70PAUoJkTE/NbB3i41WJbau+zE6YquJS9YKYj8iq/x6cV4vhDWpT0vvOEFPlG1S6Vo
	 iwUwt6tTSbVqQ==
Date: Wed, 25 Sep 2024 22:19:06 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: warp5tw@gmail.com
Subject: Re: [PATCH v4 1/6] i2c: npcm: correct the read/write operation
 procedure
Message-ID: <rpu2o2vw6jqbuywabaxaqepathkqlzjzjvn7j6h5lq6zslitu4@icj5hpmwo6kr>
References: <20240920101820.44850-1-kfting@nuvoton.com>
 <20240920101820.44850-2-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920101820.44850-2-kfting@nuvoton.com>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tyrone,

On Fri, Sep 20, 2024 at 06:18:15PM GMT, warp5tw@gmail.com wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
> 
> From: Tyrone Ting <kfting@nuvoton.com>

no worries, I can take care of this.

> Originally the driver uses the XMIT bit in SMBnST register to decide
> the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
> write operation. If it's 0, then a read operation will be executed.
> 
> In slave mode the XMIT bit can simply be used directly to set the state.
> XMIT bit can be used as an indication to the current state of the state
> machine during slave operation. (meaning XMIT = 1 during writing and
> XMIT = 0 during reading).
> 
> In master operation XMIT is valid only if there are no bus errors.
> For example: in a multi master where the same module is switching from
> master to slave at runtime, and there are collisions, the XMIT bit
> cannot be trusted.
> 
> However the maser already "knows" what the bus state is, so this bit
> is not needed and the driver can just track what it is currently doing.
> 
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Reviewed-by: Tali Perry <tali.perry1@gmail.com>

This patch is independent from the rest of the series, can I
start takin this in and unburden you from this?

Andi
