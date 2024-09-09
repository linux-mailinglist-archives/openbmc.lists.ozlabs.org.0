Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6932A971A36
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2024 15:00:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2RlB0QLmz3cHN
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2024 23:00:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725886819;
	cv=none; b=SJyw5YsXwe7CE5QMWXDEX62VIvgBBcF4MvMJ+3VosY6JPoHV9rN88IwM/550J3ceiDT9ZRzFfbmGPLHXDdbO/cUT0EkKCE4Xb3LqyTRyYQ0/tV54O38P2FsKKvj9AHGQVyxCVatKyeO63Efw8taXtZylB7/g8Hc9y/k+pPHT91uQ5gtQIhi9g5LN+GRmzjEqWfblIgdf8JLIampAoQH67wUMGIS6i6CCtcP3914PrV7c0eEgEjzqO6OKsXxcuAKGY7yMWNNT2BjrusyQ5N36Vg4M2v7Mr+kjjOjHfL8Dq8XRdgn+9QHBJERNnmc6VdpnJMugM1cpM1tA0kyvTvuEyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725886819; c=relaxed/relaxed;
	bh=zwsfhKrVwb/we3c6vVFUv79KDd8E8tEqs9s7mb6vTZc=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=Zfzpk4lXDHXXilBSd6ZddRHhFK6PHKq6DWpRQthO8T8iqPQWDkc1+dKW/u1fX5hRRZFPEyeOQ1tEeujK5CUNebRftnu+sAimcSQE2rkJ0duuX0E3Mno6Y7EJSiuHwG6eh5TuqiKy2OfmaAOIC9QkH4YOh+Ulbaea0D0ELGGaikQDfU/WAXC3rFyI2pvAQPd5/5efEff3d42wtp3zby9uOyVhlSMMxcFv+3LT2drbvLMX4vEmQJqr6Wg96koG+p4zr1Mcwli1RY/9Cc2tFTc/tsm96mgamjyYw8pzVq96JY6AmbQa6yBRFGGR0CQdneLd96tBw6Wurp8vrobZ1TSuDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=phi5IflI; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=phi5IflI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2Rl66B6zz2xWb
	for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2024 23:00:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 33D11A437D7;
	Mon,  9 Sep 2024 13:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691E6C4CEC5;
	Mon,  9 Sep 2024 13:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725886815;
	bh=ruHz9KHuDIKm3cQM/2NT6sIheDvmMycaOm0h2WUqGKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phi5IflIz+sPJez3pTiHiRXgsY5nGq8Ma8vBQFvAcCj+LdwafZMzpuIILyTSZivgx
	 l74g2su/9m6h3LjLk8Dv1UXO3TYu9DVmj8l20wYIYy0G2xrsCFoMPc5kxSLGpf4zmJ
	 d9p43OXT6MDiKdNupoj4LtXuW6w/rEhT3gmt83azYOthj29IATEtux5QrhImdL1j+Y
	 y4xmYwNi0aPlfGl6e+5IjrQprSiHhkwjAIgOZKUFOvw9UhCmTIW0WLLn49+IPcKRNg
	 HMezMCXocPpuDsMDa9gU3qoOP23ACS+P1Oq5ys3WTT4+KoniPgLM2HzdUWjkNMAPDY
	 5YAgJ2AybwUOw==
Date: Mon, 9 Sep 2024 15:00:11 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v2 0/7] i2c: npcm: Bug fixes read/write operation,
 checkpatch
Message-ID: <qr3q7stbuwl3ylcqnfftg43nvnzi5cz2wcrhinlek6kvzb7wyi@uqgq4z5b6ob5>
References: <20240830034640.7049-1-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034640.7049-1-kfting@nuvoton.com>
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

On Fri, Aug 30, 2024 at 11:46:33AM GMT, Tyrone Ting wrote:
> This patchset includes the following fixes:
> 
> - Restore the npcm_i2caddr array length to fix the smatch warning.
> - Enable the target functionality in the interrupt handling routine 
>   when the i2c transfer is about to finish.
> - Correct the read/write operation procedure.
> - Introduce a software flag to handle the bus error (BER) condition
>   which is not caused by the i2c transfer.
> - Modify timeout calculation.
> - Assign the client address earlier logically.
> - Use an i2c frequency table for the frequency parameters assignment.
> - Coding style fix.
> 
> The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.

first of all, Thanks Tali for your reviews.

Second, Tyronne, can we please incorporate Tali's comments into
commit messages and improve the code comments so that we don't
leave room for more questions?

Consider that not everyone knows the device and we need good
reasons for accepting the changes.

Thanks,
Andi


> Addressed comments from:
> - kernel test robot : https://lore.kernel.org/oe-kbuild-all/
>   202408080319.de2B6PgU-lkp@intel.com/
> - Dan Carpenter : https://lore.kernel.org/all/202408130818
>   .FgDP5uNm-lkp@intel.com/
> - Andrew Jeffery : https://lore.kernel.org/lkml/
>   20240807100244.16872-7-kfting@nuvoton.com/T/
>   #m3ed3351bf59675bfe0de89c75aae1fb26cad5567
> 
> Changes since version 1:
> - Restore the npcm_i2caddr array length to fix the smatch warning.
> - Remove unused variables.
> - Handle the condition where scl_table_cnt reaches to the maximum value.
> - Fix the checkpatch warning.
> 
> Charles Boyer (1):
>   i2c: npcm: Enable slave in eob interrupt
> 
> Tyrone Ting (6):
>   i2c: npcm: restore slave addresses array length
>   i2c: npcm: correct the read/write operation procedure
>   i2c: npcm: use a software flag to indicate a BER condition
>   i2c: npcm: Modify timeout evaluation mechanism
>   i2c: npcm: Modify the client address assignment
>   i2c: npcm: use i2c frequency table
> 
>  drivers/i2c/busses/i2c-npcm7xx.c | 276 +++++++++++++++++++------------
>  1 file changed, 172 insertions(+), 104 deletions(-)
> 
> 
> base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
> -- 
> 2.34.1
> 
