Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E874296E522
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2024 23:33:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0CKJ6v1Dz3cFw
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 07:33:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725572018;
	cv=none; b=JASpyn1Z8q8/W3uekDY3jguZ4B/LJJW86S89iRFyl80rd/YO1YcqNe3Q06hzapHjNaqO7mc3bgha/Nrxb8yd13xOi43Qe24DbLn7EEWeXU0wL4GXV1FNwqnmMWZAOUDtJMDT/sb1CW999fCEc2kr0QS+Er9dsYa/8S0DQzcdjZ+q0GYlV8mgXmj8n1ZaWWUSAR8pXN7HZpXBCNMMiC5LJHQL3t4OWZHuD0sdaV/RJ4fx3iB6eCfvThSHFlHG4jQpCXlcDYu08iTswwq3NoTxhx/Zk0RT7RE/MFmuJMjq+J+WO4hw+nHUxAhdqRJf60RQA0je3RyA7tnuvslMeqZ+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725572018; c=relaxed/relaxed;
	bh=45jVooRxOgy7ViY40EhNxsXt7uuuUfPPi7StgZfwlGA=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=jYuBhRQ1ig4s46B1V+LObYZQvRuEAPs3NiUIBtTBTzP9yZ5lUMHX9m07U3RSlFs1E0YvH27koyYncwNB9c6ZbhwuAI89P9L2ONiPUHhEVDHCsDZA8BEgPJoul6bZ2SWD9X3lhbI774zo18OEYp2sC+HYkQdv/l1kA+3ckm/3fvVztqlWWj2Iv2QX4M2cuxoA85clQoIv3Kb43TEO83MoM1v78cAPhjehppQe+3quWlxG6kj2iC5jqTCUsmoy3n6oJnUcTLORIeXCV3TOWfRtKLJFW2kpJuj9HkhOFp0aLEW7rugoohf8Gn4o+4+DGWtiAnHcZof6YHZ6DcZc8JUN6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QYcXAoWL; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QYcXAoWL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0CKG2zjSz2yWr
	for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2024 07:33:38 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8A3EFA406D9;
	Thu,  5 Sep 2024 21:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FBEC4CEC3;
	Thu,  5 Sep 2024 21:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725572015;
	bh=6KuSkCJ1CtFCClGKj7CSV7OM6CHwqk+v2vBLB3hZSqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QYcXAoWLbatqmYxADWvkQkhwBi5XOl+zAmXvhjz4jOPmQ8LuW4aQ0icRI2lJOmkZp
	 Ce732iVhphRPtSrYrERYFBrb6RTcqPYJCMoc9J7eI3TKsuZA9dg8e2Lguw71qQTT7e
	 EXt+l79GJU1sOynMTWg+Y9pc7ctA8v02P4IZbufNV6PVRj/0PvwJIeejtmR9fQU2oX
	 RtD1llyTFu0onwBAoxjB38t3eE7xpK7WQHJ0OElDIkP57vwqHmbUUU6lKvPRkvIq4+
	 6blVXZo9ObX8I05zbUiM9zeV81idIi9Gcd1eb/fg0V+i0u0ZfFAsj7GkORczMq1ida
	 f9J7W0Q5f6cVg==
Date: Thu, 5 Sep 2024 23:33:31 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v2 3/7] i2c: npcm: use a software flag to indicate a BER
 condition
Message-ID: <x3qhp6xpmeafsaufplh76tflru5bfbjjhndnu3ethw6gpbkre6@pyaswbbuog7y>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-4-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034640.7049-4-kfting@nuvoton.com>
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

Hi,

On Fri, Aug 30, 2024 at 11:46:36AM GMT, Tyrone Ting wrote:
> If not clearing the BB (bus busy) condition in the BER (bus error)
> interrupt, the driver causes a timeout and hence the i2c core
> doesn't do the i2c transfer retry but returns the driver's return
> value to the upper layer instead.
> 
> Clear the BB condition in the BER interrupt and a software flag is
> used. The driver does an i2c recovery without causing the timeout
> if the flag is set.
> 
> Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

Can I have an ack from the supporters of the ARM/NUVOTON NPCM
ARCHITECTURE here?

Thanks,
Andi
