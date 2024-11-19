Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A84229D3068
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2024 23:23:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtJsR0Zvdz3c7d
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2024 09:22:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732054967;
	cv=none; b=Gm4GuRV9q6lDHBKxFyt2ZOhAa4YxsST+aKvfA6UgaZ3UiNo/Echo2wJb2ieKBa/97Zkpf1r+znngP10RT14abKUqTEJl/vTRBGbdycUElqopRDveLGGGKIUCymc7pT9riyng1FT8I502VnAWJ2ArHjb4NBS/N2vif7RlpyBE75NaGWpH4v1K+jzgsrSulAbB8kgui58G5jgzwS9B3iop2WvozgrYyKZGLjWVfIhhrefwQ4r0Fnitknf1alFWvevEBeVUdGZr8U2u3yIlNG544ho6pXVhY3pcX9cPCBS5lk+jRUKgx0oikvMYGGY88yDgboE1ZcHxuU8KTe43o7h8Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732054967; c=relaxed/relaxed;
	bh=VJVmzaginJmQ7F7tSneOieAVuosgCnUAAnwsNZcDlbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKvYdXSAhgkQzKiYSSwqtmxGWCSa4uOnfLUkGXF+1VZtuEmM5jPqLFfJ6TOnNYcrTsndvbqqcSDu7IHEXt0FDY4GgMvULlnuTgxQzSOmkksJKXmKlB1HEYek3ck4FKbIey/F+oWqg0iAR/wTn9LoK2cB0m6pM7R4CihIirZUPQzr5xUWcSKhHoJAv4sea2As9FYQ5Myz/4olpWHk/PJ5wZi5nH3+1WYoQz10lh87BwpcUDKVWRLgZYMlfiSWqY+QitGYIT3G8F3186DEctTMvlkmM7mdYwV0VtU0Yn7RQMFI8tbq2Rh2bLGn1WvCBf2hBibMuKbN+wJpuMnlKaZvWg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DEpwJ3MG; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DEpwJ3MG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtJsL1395z2xpl
	for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2024 09:22:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 801E8A40DC6;
	Tue, 19 Nov 2024 22:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18ACCC4CECF;
	Tue, 19 Nov 2024 22:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732054961;
	bh=zqKj2HCLC2L9GHTZn+KhLac8fwhAptxey2L9oF72u1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DEpwJ3MGZvf21K+uD84+JsfQMN4Dk31IaVnCzT7faclZ/R84rYlx6ibPGzFBbgCgU
	 Y36yAZnPHA9MXqWnPGuPiZrBHQO7yzlKHiNMvv+o+x/Txi5bQRDpBw5RItTfdMdgjp
	 jOOrfGr/RNxXkPf01C+Mpg0UPZuaQtt6C2WFBW9N7aqHGMcxBuhBX3iFCEd307OQHw
	 EGTTrs4C7wIT/SWxUVoSmd5XlQ+HFeJZGf/T0g6Ahe5HiqFKfQb5Cl3EfIfCepPxoZ
	 kLo12uAi+2hiZWCjyRLSO0QcGhfHjp2H3Fn188SHBEWtUh0O23h0ut6VM3HW/9LVVs
	 kh3z6DRR1ok1Q==
Date: Tue, 19 Nov 2024 23:22:38 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
Message-ID: <cexpymszobfl7676acibp474eq3qx242ppo22wrbjepxhufkvt@w4ptnmfjx7yo>
References: <20241021062732.5592-1-kfting@nuvoton.com>
 <20241021062732.5592-3-kfting@nuvoton.com>
 <kzsvr3jepoqjahn7n2jch5vrqim5eknylrasvsbjugfhzny46o@bemfk6knfmxi>
 <CACD3sJbWKkBtyq-gnicASJvRnz_nGjVAyVgnreNV7RS+MLOWJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACD3sJbWKkBtyq-gnicASJvRnz_nGjVAyVgnreNV7RS+MLOWJw@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tyrone,

Sorry for the late reply!

...

> > > @@ -2172,7 +2191,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
> > >       }
> > >
> > >       npcm_i2c_init_params(bus);
> > > -     bus->dest_addr = slave_addr;
> >
> > We can now get rid of slave_addr. It's just used in
> > npcm_i2c_master_start_xmit(). Right?
> 
> Yes, slave_addr is just used as the link
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7xx.c#L2182
> suggests with this patch.

What I mean is that slave_addr now is completely unused. We
declare it, we initialize it to msg0->addr and it stays like
this.

What I'm suggesting is to remove it completely.

Andi
