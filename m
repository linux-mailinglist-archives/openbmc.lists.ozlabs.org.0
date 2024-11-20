Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B5A9D33D1
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2024 07:54:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtXCZ5jrkz3cBH
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2024 17:54:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732085655;
	cv=none; b=Cks74PLiNVZWH4FDepjsmu1hyt4CslR8x+ATAUNDaErWSg77xcZsUpIy6OwmmsdxeCdZ2iEQvyvN2f75kbtlFKJzWZKmDN14KC/zrpc3cSXpuqM33C/rsyMXyM2VrSgwf5PgCbPfr2+JZglzda1dCIN1mxyAFSaoqLUS4yeLQtCI7dbAHo4YRgs6fPqewpcuD4dlmiUQbUALvi0H5Xz9hH5ictPpXE0sEcAkKMJX8mDfZRm7gqcvNlxTSpZa8jP5dLf12HNhGUprxjqvJ+REYcIAGw1HbC9wij8bjnVaZ0Sb1sAGXH9dq/6aDOWwQZ2jwv/AgsVt4H6XC2QLT7R8Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732085655; c=relaxed/relaxed;
	bh=ZGVDroxvGZaMmvO0knhWHMPeqQ4OtV04fIWg9bKNd7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FW1JirEhFQiAZIoISzDDW7zya1poG3p0v8cBDaMSV0L7M6CORchRZYDtxqEn3m/Q2Tc8rxNAg1EQrnRtGjfPP14lrOedQYUh6ocIphOGsciiGaHSGFm9nZPd4tvonquFRlkFwa5cZZVYZW/LB47UIlHT6qfKEtO+O+K2Z9un54rlkDpEg4oE8CR+GzhTSZhNJGR4kQRZ3eeuJeqpoZO3QHYectrVPIVSAEtV7pnPsnWzx878tt4hULvaLWwkKypBWf8Go7M/U01uKpPMYvUQLniDtkL43m2/GpS9WbLzaeeIqxeeYZdwe3jkIxSnXsTH0cJu/rBZTssLG9DvvsD3ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hs0kvvOv; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hs0kvvOv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtXCV3wCPz2y0K;
	Wed, 20 Nov 2024 17:54:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EB6E6A429FA;
	Wed, 20 Nov 2024 06:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6954CC4CECD;
	Wed, 20 Nov 2024 06:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732085650;
	bh=yu0IVEbUHfOiqCOXFtKIo8jBF0HFsQeEynvGjcvNELw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hs0kvvOvB6EcOyu+DecW4JQwfXGTTJf/6WS3IneXaxhzQ7mCu7eid687fHls1LqR4
	 hVQKmoCeYYzKhg79WNjIfngDZv3Lasyw42DmaJ+pKXXILr8E2Y72GkStjOrN3dLe39
	 wJzV2dNuGPMZ6j3WyTBGBM2G9lei0aZYx3+q3o8Bh7SB3R6jHn5sRwEkZ3FpBHe0eh
	 895uK8IKGwN/BVbfBI2leAI85qRvGeXZl6Lgnp/8bh71dfExQPd1UM9XzlibNTmc8e
	 BrGtmWRZVvM/Kh9sWNyqMp2kEfo3hIhCYl21Rs5S9uy3vYoz+fIKw3UFbXxtdMH/D+
	 /A2DHGXLlw86w==
Date: Wed, 20 Nov 2024 07:54:06 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [RFC v1] MAINTAINERS: transfer i2c-aspeed maintainership from
 Brendan to Ryan
Message-ID: <37pcpov3u7oitszupqaw3upujy7fmns64gijqea5tz3m5zq4yy@stxttuqde5dz>
References: <20241115044303.50877-1-brendanhiggins@google.com>
 <ZzcPJ9sweqxLZOGf@ninjato>
 <OS8PR06MB75413EC87F76AD0B1BBA0FEFF2272@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <x2rt6k5hw2km2vm4wjnqihop3xcy3uirhxs5wvhnesxc2athgb@c2ra7a62mfve>
 <OS8PR06MB754190CEF8763CCF5CE89899F2202@OS8PR06MB7541.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS8PR06MB754190CEF8763CCF5CE89899F2202@OS8PR06MB7541.apcprd06.prod.outlook.com>
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Brendan Higgins <brendanhiggins@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "wsa@kernel.org" <wsa@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, Tommy Huang <tommy_huang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ryan,

...

> > > > > I see that I am the only person actually listed as the maintainer
> > > > > at the moment, and I don't want to leave this in an unmaintained state.
> > > > > What does everyone think? Are we cool with Ryan as the new
> > maintainer?
> > > >
> > > > I am fine, depends on Ryan as far as I am concerned.
> > > Thanks a lot, Brendan.
> > > I am ok to be a maintainer.
> > 
> > can I take this as an a-b by you?
> > 
> Sorry, I don't know your "a-b" means.
> If to be maintainer, Sure, I am willing to be.

a-b is short for "Acked-by:". I assume you have acked this patch :-)

So, thanks Ryan for taking this driver on you, I hope you'll
enjoy. I took this patch into i2c/i2c-host-fixes.

Andi

P.S.
Sometimes you will see r-b which stands for "Reviewed-by".
Sometimes SoB or Sob or s-b for "Signed-off-by".

It's just a way to overcomplicate something that is easy :-)
