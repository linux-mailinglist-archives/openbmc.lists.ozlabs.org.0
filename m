Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6932971A24
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2024 14:57:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2Rgb472Zz3cG0
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2024 22:57:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725886631;
	cv=none; b=Pes/Nvx7+tQEc86RtD5oa52320UC9Vj4vpYX1s6CacPBwWAqi8YbFtjs7OBkrrle9S8gdmnbeW/42tL9pn8tvbm4rP+1uRkFw6YbS8qPXtDd9riWQNSFq08zBwrtmpRhO8KzvTc8ya7DP/7fo9NO9SIUQueEpLIhCeBO92fSktuMogvfvI0Y5DhkVtk4UYnEdSyiC1LjeSuf8jgfb47Os+Or6GExiE+uH+yCQyotyPMEDev/Z7lEqdBZGFtCfrL787WptOg9Sa84mhOERjhs7qlvoFF9wnVsl0WPhtvF/76jIAaHFgHwcCBgzVe5i0cGsoQaPCJMSHVWeea7Irga8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725886631; c=relaxed/relaxed;
	bh=IoWOk+MadJq4aQPitAOEe4gF4LU/y3wUC36xSO9O4n0=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=S2e1Gkhajwr+qrlDLfq3p9wGRLIzRBMRNfioOZU8kBxAtlnAdOKWywFtsj8vvoRRrg6e5iMm5ldjXzv0+Vlz3GiIXTAZOtoxrIFOek7ZSnNuD5PRjiDlSNTZ6uOVbZZ/2dYiAHdq6V6hlt0hFnLu5/jPIc16j0cIraAA4IZBlS+aui9qHViSQoHdb1f993uDPuq89fuiDtw4UAUgBwNb4P3qIUpNfoS9ncDaBMz1hmjHtGQvzxOtTLv3niyt/U1Bm87XMLuY5sRS6JO1MvXcSYrsyhaMp7+a9HHlpYmoEplSjlodLyop99JTwwwx8Ieidd8ioUEMaqqD7MxXxFxW/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g4NVS6Sl; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g4NVS6Sl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2RgW56mqz2yL0
	for <openbmc@lists.ozlabs.org>; Mon,  9 Sep 2024 22:57:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 546765C4D29;
	Mon,  9 Sep 2024 12:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0746EC4CEC5;
	Mon,  9 Sep 2024 12:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725886627;
	bh=n1LtFgen2lM9wDK2rBgOQxPzxNJOXud50nqNizGKKoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g4NVS6Sl/mpDVc76o61sNyZZWAnteT9uMb/RNeRdfJMDPr/i7R6sQ/le8t+iGghoC
	 dmzDrVBEBII2dyxxWUS7ygw5EDxMAYDz8S+NLvHDL36wt8P8omaajqyFvtT5dKJySP
	 mQlLpZWZ+e7xXfjHdX95O/WBpOQSS+5TxP/Gporh3hVZIUaF1mR5cR43a5TJrKdTUj
	 B+B4kp6dmJ1tlUfRjFyycyB5thY5R+24dftbTIu6BTE11D4UCrCggI9VIlNU0oSsgd
	 xbRlQDkcpWUp1bo9LuVOUEBKPphoGNAQQaOXB/zWv6olrAv1sCAtKukMUYyJMRAQwz
	 Dnm+0POZAVqqQ==
Date: Mon, 9 Sep 2024 14:57:03 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v2 6/7] i2c: npcm: use i2c frequency table
Message-ID: <2kqhf2ad3omx3dsjucrqhtnonnox7ghtp7vkogrwrdfh3dgg2o@4cpa4gfg6c3f>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-7-kfting@nuvoton.com>
 <3wz36hrpicogoakqhmveppcrt6s52zmlcgjpio3wwpil3rdwdi@ft7tloqqf2zt>
 <CACD3sJYFNV9Vxmq1Ydp=+wh-52DOCMsECO+RmP_K6t4B8wzbmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACD3sJYFNV9Vxmq1Ydp=+wh-52DOCMsECO+RmP_K6t4B8wzbmA@mail.gmail.com>
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

On Mon, Sep 09, 2024 at 09:56:25AM GMT, Tyrone Ting wrote:
> Hi Andi:
> 
> Thank you for your review.
> 
> Andi Shyti <andi.shyti@kernel.org> 於 2024年9月6日 週五 上午5:43寫道：
> >
> > Hi,
> >
> > On Fri, Aug 30, 2024 at 11:46:39AM GMT, Tyrone Ting wrote:
> > > Modify i2c frequency from table parameters
> > > for NPCM i2c modules.
> > >
> > > Supported frequencies are:
> > >
> > > 1. 100KHz
> > > 2. 400KHz
> > > 3. 1MHz
> >
> > I agree with Andy, please add a good explanation for this change.
> >
> > > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > > ---
> > >  drivers/i2c/busses/i2c-npcm7xx.c | 230 +++++++++++++++++++------------
> > >  1 file changed, 144 insertions(+), 86 deletions(-)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> > > index 67d156ed29b9..cac4ea0b69b8 100644
> > > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > > @@ -263,6 +263,121 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
> > >  #define I2C_FREQ_MIN_HZ                      10000
> > >  #define I2C_FREQ_MAX_HZ                      I2C_MAX_FAST_MODE_PLUS_FREQ
> > >
> > > +struct SMB_TIMING_T {
> >
> > Please run checkpatch.pl before sending the patches.
> I did run the checkpatch.pl against this patch.
> Here is the log from the checkpatch.pl:
> -------------------------------------------------------------
> ./patch_i2c_v2/v2-0006-i2c-npcm-use-i2c-frequency-table.patch
> -------------------------------------------------------------
> total: 0 errors, 0 warnings, 265 lines checked
> 
> ./patch_i2c_v2/v2-0006-i2c-npcm-use-i2c-frequency-table.patch has no
> obvious style problems and is ready for submission.

mmhhh... I thought checkpatch hated capital letter declarations.

Please, then, use only lower character names for declarations.

Thanks,
Andi
