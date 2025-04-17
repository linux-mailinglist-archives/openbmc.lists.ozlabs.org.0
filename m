Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE64A9225E
	for <lists+openbmc@lfdr.de>; Thu, 17 Apr 2025 18:12:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdjZY6Dn9z3cVc
	for <lists+openbmc@lfdr.de>; Fri, 18 Apr 2025 02:11:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744906303;
	cv=none; b=RMnVkCRMhzWixG5lrp3342iotviJIdWsSltHBOP2BadfpUIArV7R28LzGOuIuG8uRL+uxmh9pGb4BVeId4EGEVqk925wDFmTVg7CRx1COYTE1cUnAIM39OG4NcLHtLjLiwHkN6FdEj+U3TnHFvHDIK6q6PyWtVBz5C1z56+ap5rXPuE92AP9x7t1A4DF05B6hCeejcVoXi9Gd/COJ5O5IlU5EWPZHaWz9NfWSGiIXnuzPXerm2f5BkRq5hLH5KFavCD05sqZvqxJCARCC1Xp6TEZYC7Ys+sogCyaVE5DW+8TFj3XdvfKrMKqZoLVsrr5IzepgpglZsBWrHYYQyuwCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744906303; c=relaxed/relaxed;
	bh=4zKXsYZgNVzNu/d3cclN8/zwjrKzTlKy8vEuKt0nqLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEIK80YtkUQvM9kGCdsBIjreS1xBtBpqnU+6fmvaUMEPEZKnTWY3nYDJLnAg+mbebGElcgxfbMBa8ADPVQ93Shf//tG66Dxb76VugESBfMCvS1OP16+aT3+dho+Kd4BUQptVfLFaF3RFLpR9vZSX2tSYKJ/lldSUQMtLnjkIlVvHQDBnJhZyd0YpqSTmxdvsWhSeK5ZxZmxu4piWXRNp8+jEBCk+sRbGgYWoWBxkKCQ/VQpZJNu7cXpa08kd90pBmWepJPcR4pNv9oGrBDAzxNxr+wg8JEGOLYg5cIUX5KFXI+ep038EmkycA6vaKWAR088g/pMgu8xJWutyFYarfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bCD+0vPV; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bCD+0vPV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdjZQ5Ylqz3bxM
	for <openbmc@lists.ozlabs.org>; Fri, 18 Apr 2025 02:11:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 95CA65C5427;
	Thu, 17 Apr 2025 16:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D088C4CEE4;
	Thu, 17 Apr 2025 16:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744906299;
	bh=PKyTrfEuurXxihtN12vI8NuAEhUtn57gwj36sy0sUYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bCD+0vPVYt8lxFPizihBcQn3MUxV7msoi9R/0BSSqif6oAzf6csPfNORTq9d29CCi
	 7jgxjJAP34YLUrgTshKOP6UGPJ/6eFcAy+ja/nj6yGS7fXBJe9STfgVGbCRAT/+w5n
	 IPTj7wBWnLTmEGUwuEr9nZgMDqNeb3jKSEVBXSpjNW5iE4XfWM5tvwzLfnQiSLBeOR
	 yk5C2cMlMg7Begf9t4GDRwo6AZVvjXF85v+cXEe+vyInuCkIwWTaGT+M3l8s7cjn4J
	 CWh4geb5bvrrCkC47wO/NhqxG2AiARSAyayY5+mgG9Nmv2IoCjHT23rNLUxMbsvE7u
	 lY/UfMKhaQ9jw==
Date: Thu, 17 Apr 2025 18:11:34 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Mohammed Elbadry <mohammed.0.elbadry@gmail.com>
Subject: Re: [PATCH v4] i2c: npcm: Add clock toggle recovery
Message-ID: <npt666jrmw4qhesdwup4khufkxczy3zkf4sd4ygjx6dl6joas2@pb2jumja7cgb>
References: <20250327193816.670658-1-mohammed.0.elbadry@gmail.com>
 <20250328193252.1570811-1-mohammed.0.elbadry@gmail.com>
 <4wbq7yepeqg6lhu34giqlz7fwamtuv4o5r5slm6ggj5ut7omvd@archqknzat3u>
 <CAHdq5QHUeMk4WLf8uGz78KagN3WSvS_skhvKFMqUD5YkwJOOkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHdq5QHUeMk4WLf8uGz78KagN3WSvS_skhvKFMqUD5YkwJOOkg@mail.gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, linux-i2c@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Mohammed,

...

> > > +                              npcm_i2c_get_SDA(&bus->adap), npcm_i2c_get_SCL(&bus->adap));
> > > +             if (npcm_i2c_recovery_tgclk(&bus->adap)) {
> > > +                     dev_err(bus->dev, "I2C%d init fail: SDA=%d SCL=%d\n",
> > > +                             bus->num, npcm_i2c_get_SDA(&bus->adap),
> > > +                             npcm_i2c_get_SCL(&bus->adap));
> > > +                     return -ENXIO;
> >
> > why don't we return the error coming from
> > npcm_i2c_recovery_tgclk() instead of forcing it to ENXIO?
> 
> The error that comes from the current driver is only -ENOTRECOVERABLE.
> I do not see why we cannot return that error instead. I understand the
> difference between both states; however, from the driver's
> perspective, on initialization, ENXIO and ENOTRECOVERABLE behavior is
> identical in that state.

I think it makes more sense to return the error we receive from
npcm_i2c_recovery_tgclk(). Then we can discuss whether that error
is correct or not, but that's a different topic.

> ENXIO was what the driver returned by default without trying to
> recover. Do you recommend changing it? Let me know. I am happy to send
> the v5 patch with the change and address the above comments, too.

Yes, please do.

Andi
