Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7621796E531
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2024 23:39:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0CRv5jrNz3cGJ
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 07:39:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725572361;
	cv=none; b=bbUSp7JNKq93Az8GkKIYCunVTEbhW/cGT5bvPNFx8XynCT9JgoQAtsRUpH3qSt62bBCrs0KeVcMFMoNUxTNDXeONDeqsLoc7m0FvDphU714hQKvjvfcB2ueJwukMl1BelnGP/bHwS9j674kIC2cfN7LoH5WlixJ6pUEBCFJi3YFRpPiFOXFrDbV3pa4m1JNqEi4rpfL9ZYSsO2aI5XoLeeV2fZKsJhkJwhrpTUcBiHp+UbA5nwstkOfFx45Ee2gOiJaHYAS6OS/GMU+P+92QiiF7bP3Xh46amyw+Vkvw7LtgzKwlkOCNbbsZ8bYFQ4Uk+KApj7aLzQdsx2xekxg42g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725572361; c=relaxed/relaxed;
	bh=hWccAQLWC1UZQ4Bgpr1ykNOGBGDzdOapBv/mdEHdIOg=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=MI3k575dRLdlumIrJ7QAtrWQJ2kJ9QmANqMxDWBz3j9PG/G4UzaaHL5oKampgKp6VwdcBGDY2+7sETTv3t5F1J6UiYimo/WLJ5pgKs5bCQNvn/tzoaJWPFWT21rAf8eNTEXBi93vtn56GKVeAzZYfSfzS0VR+LgwbZzOLvBba+CBhHHIcQ2RnrTqoXQkQm/JSLXNlNnhpR2o1NM36eOuL6IJGdbTDYqAZ9rB9h4P3nAwx2rytPUh110fVWBnR7fbjeWx451x0ewTxdZIApJq/sukmmIXd/ZBoCvyC1BOshx4vV3Zlrvx7zPztOaqAOVxK4E3Z3P6PjU4E1D7T+QUGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gZqIe3WU; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gZqIe3WU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0CRs3Bk9z2yvq
	for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2024 07:39:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C8ADE5C3A56;
	Thu,  5 Sep 2024 21:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF2CC4CEC3;
	Thu,  5 Sep 2024 21:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725572359;
	bh=wwNHDVwarDDWbgFkCqrVArLL1shfHCnjmYLoJJkJYoc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZqIe3WUYfe8lQJ6KgzUugf9dSZfNMLC6ds7+GSZGoL6KmHh+J7F/0OxDiHLFAnI4
	 Bv0XTtZZe917wlXoAniw70emeoDghiJ8d9opNjQ2HSbwaLBD+CeFhvzcptWBO0HF0s
	 eeSpmfW+CPvPNcqdKPIRKXKj5UzYB9h/x3Y4ppHlMoIrHwT30pJsHc9zxaDki92P/x
	 isrPNfH3fU0N2SzLlySn4hc7ea9ggjvkdvra89OCA/wSP3DYZq5JYibeqMpDJ2d0Hl
	 WAjpULF9TRHFK9x7ntAEQS30Phusmmc6d1RSpyPdS1o1UIlpEAPZQ/C8XI85d1stD4
	 CMmpmIVgQy1wA==
Date: Thu, 5 Sep 2024 23:39:15 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v2 4/7] i2c: npcm: Modify timeout evaluation mechanism
Message-ID: <stnyjmnqdobzq2f2ntq32tu4kq6ohsxyevjn5rgz3uu2qncuzl@nt4ifscgokgj>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-5-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034640.7049-5-kfting@nuvoton.com>
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

On Fri, Aug 30, 2024 at 11:46:37AM GMT, Tyrone Ting wrote:
> Increase the timeout and treat it as the total timeout, including retries.
> The total timeout is 2 seconds now.

Why?

> The i2c core layer will have chances to retry to call the i2c driver
> transfer function if the i2c driver reports that the bus is busy and
> returns EAGAIN.
> 
> Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_slave")

What is the bug you are fixing?

> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>

Still... can someone from the nuvoton supporters/reviewers check
this patch?

Thanks,
Andi
