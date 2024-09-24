Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C14984DBF
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2024 00:26:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCvbY3795z3bxf
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2024 08:26:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727216790;
	cv=none; b=JGxd01etf7SEdtdaIVLI+ST+ia/9Uw4akhH24KDTSklw1j023srsrx24RDgXKgZIwzx6uLOnaBM4EssRXbX9ehDbJpYY/H1SPlIhbjZlA6wPjIQKwqp2jIcFupvITV4KTHn0LYxNsYF3k2OjZW8WvWkFM7LrltLU0pZqbZcoCuBPfL8pOdVhdIMolV5uPKxK8mw5UAKFVKTAoyrOz73fF2WHPcBy9EqRKnP3+vd/afTRb8qb8KSH64Xx5k6NqM/kA+2VaOwqJ33ClVItz2NRVKsBBPMmmUTEUYku9BcQoH8r7XOuaH5ORqLAPoGZG2WheYwdikMrXbG3rIibQMq3oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727216790; c=relaxed/relaxed;
	bh=xD6fjVB/Xyh8YtCKbEF0os2hU2bBQYNMnHylNGWACFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPe99JBayuZ4L1K1/S4GXG3BH2CDAchZ42sin50dWWwBCV4OUQkUUQvuranSOL63bfdlpC3aS2ix54IMCG96R78/6KLHJi0hvgTH6uzNeOVDAbymzhI3gzrCpJIGw7Xz4qVY4OxMV3HXYHNq2p3MAkThPrhZ32jYFh9/3aDSO7CMSP0T1N0OxuaV65AzbV2wCu9Y164adAFjVQm3QKyezBi+/GOFcAlvvmWKvrsj6t3+UhzVieb5siYjnQzB9PiY71Z3o8OX3aDNWlg/wySY6DMPu5O/eYga2oALfW0ZxeNucMy8/g0tq1SVbOpnaiEm/ufh22ZGxezSyrTxWwE7qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KW+5rx58; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KW+5rx58;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCvbV3FcFz2xjK
	for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2024 08:26:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 16BB4A43921;
	Tue, 24 Sep 2024 22:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF21C4CEC4;
	Tue, 24 Sep 2024 22:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727216786;
	bh=YmYTBESt0EqQFqhnzMaFyGYpmk/68DRvs5SHo7cxNSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KW+5rx58Am0dAtvner/unXsVDmx0QycmxdReU8qVh9hd8J2qXt/8xXa+AE2mT669A
	 nM449DLPXw8eQONRvfIrSVc6HOzA2z+5vj9PwU1qWRvY7780Pmixy56hQte1iFE99J
	 gqq5yqYsatOS+m9/7mdkTsn2R6+SKq950WwRTgZqTNxZFOyZ3GICGBtC4GXvOW+ac6
	 3wc/vy2ttKQs2glG0L1bG6zj/XjLvBPebBlFVlPexRp6ne922um0WB2Wf2NK5HaiFN
	 6ANRkMEOdZPrq50mxAiQS1Pg10OAD0VyioSQa6fnsrRT/GmWTXErnlK/IEKZ3lzpkZ
	 wIwvBuegE0xow==
Date: Tue, 24 Sep 2024 17:26:25 -0500
From: Rob Herring <robh@kernel.org>
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
Subject: Re: [PATCH v2] dt-bindings: trivial-devices: add onnn,adt7462
Message-ID: <20240924222625.GA403554-robh@kernel.org>
References: <20240923093800.892949-1-chanh@os.amperecomputing.com>
 <20240923-private-grower-af6a7c1fca09@spud>
 <c536f43a-56f8-4cbf-99a0-fe3b54a42886@amperemail.onmicrosoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c536f43a-56f8-4cbf-99a0-fe3b54a42886@amperemail.onmicrosoft.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Phong Vo <phong@os.amperecomputing.com>, Peter Yin <peteryin.openbmc@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Noah Wang <noahwang.wang@outlook.com>, Lukas Wunner <lukas@wunner.de>, Quan Nguyen <quan@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Open Source Submission <patches@amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 24, 2024 at 11:17:53AM +0700, Chanh Nguyen wrote:
> On 24/09/2024 04:23, Conor Dooley wrote:
> > On Mon, Sep 23, 2024 at 09:38:00AM +0000, Chanh Nguyen wrote:
> > > The adt7462 supports monitoring and controlling up to
> > > four PWM Fan drive outputs and eight TACH inputs measures.
> > > The adt7462 supports reading a single on chip temperature
> > > sensor and three remote temperature sensors. There are up
> > > to 13 voltage monitoring inputs.
> > > 
> > > Add device tree bindings for the adt7462 device.
> > > 
> > > Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
> > > ---
> > > Change in v2:
> > >     - Add onnn,adt7462 to the list of trivial devices       [Guenter]
> > 
> > Is this really a trivial device? If it monitors and controls fans, how
> > come those do not need to be represented in the devicetree? How is it
> > possible to tell the difference between monitoring 1 and 4 fans without
> > the extra detail?
> > 
> 
> Hi Conor, Thank you for your comments!
> 
> The chip is old. The driver was added back in 2008.
> 
> Really, this is such an old chip that it would make more sense to just leave
> its driver alone unless there is a problem with it; this is viewpoint from
> Guenter.
> 
> I'm using the driver and the device tree with only the "compatible" and
> "reg" properties; now it's being good for me without any extra detail.
> 
> Guenter, Rob, Krzysztof, and I discussed making the decision to add this
> device to the list of trivial devices. You can get more information at
> thread
> https://lore.kernel.org/lkml/20240918220553.GA2216504-robh@kernel.org/T/
> (Because the commit title changed between v1 and v2, it's so hard for
> everyone to find it. Sorry! I missed mentioning the link to pacth v1).

It's fine. I'll apply this after the merge window.

Rob
