Return-Path: <openbmc+bounces-756-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC34BE6BBB
	for <lists+openbmc@lfdr.de>; Fri, 17 Oct 2025 08:41:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnwFn17Pzz2xcB;
	Fri, 17 Oct 2025 17:41:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760683277;
	cv=none; b=IqFr1Fe8XFN+X9uM46Mw02i4Y8vYXk7uYj2Lwxa2opwKU2oGCJ6z+qc9ae6YfkGaWmGA98Plzghzv29AwVS/Ajpx14NNcObUeZW92uKUs7y1sRI0u2/7xQvSa9jQ37c5BN4LPz/6wDv/4Vhai0e1UoAoI5evAhS0BIpPLvCebvzMHQFrX937zR71+9oB8D8EUb8DYc8mGgT5oZoLnYkMBkPCt1tTnQMbxdUIkwX0CSnn/ZlDylgeXW4EHS4ODEf0cI6iOWSghmwZS6eQEoYlbLoZwvJAxx7Tiugmvk1M1zWMtIH8bnEI9yjsK3w2lQC8hntJzpIXwdegOC18nE89eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760683277; c=relaxed/relaxed;
	bh=GR/46E3t8O4BoEnYL7GKIwU/6ad7LoZ6u0anUZpRyoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZnze1oWIeR5L0vLpPFN0+BIp10Can42pEOk9zrEALpvjhkaqmwQ49yl9+SC/HykAqqUhptNzjocqdMHP97h39ZWpwinKfCeCC33imPySGwGimr9Ppy7Bg9cnkihNEYqVudVMD9f7ONZjfuoOxvXHYyA7geNCipaxUOiW/mjFWnAc8LqUJcbAvanTzH91oeAKvwRUj/4np3eO/0ieOiJd8kEtVZpGeH0keA7snnUz8bjfZehxXc3sqQt2Wdfj0bFxqcAKaAlP3LaXviHUVi3ZVCrA7PUu018DzBtM2VKniUiHgEQyX/MPWN17hXrME+Q5akWyfk6XHV5jaPT1ial6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=hjBxTQvr; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=hjBxTQvr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnwFl35h6z2xBV;
	Fri, 17 Oct 2025 17:41:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 043E545B06;
	Fri, 17 Oct 2025 06:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B59AC4CEE7;
	Fri, 17 Oct 2025 06:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760683272;
	bh=boNVW1ZqVyp6QPqYXslzFhQnM4rFlkUnf9eUPHMVPYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hjBxTQvrAfuLPNC2keww1Wt8vFoF+J+E8ZZ0BZQWAaPazcqvI4z2lHr1qsXFDTv/E
	 HZDrhFWcgHNRAyJYhFFQ+UUaT8nUdAvkG0GMPYwg4QEnDODqyjrWgO3lvvqAvTRwdR
	 /JfiPXvXBFFDP7HmxhTJoqTqyxScFrArfwBCKeH0=
Date: Fri, 17 Oct 2025 08:41:10 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Brian Masney <bmasney@redhat.com>,
	Iwona Winiarska <iwona.winiarska@intel.com>,
	Joel Stanley <joel@jms.id.au>, Maxime Ripard <mripard@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from round_rate()
 to determine_rate()
Message-ID: <2025101759-runner-landing-374b@gregkh>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
 <aMatZAX6eFI1RmDH@redhat.com>
 <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
 <aPEZSY6RC-UVclxN@redhat.com>
 <ba2e6b78e59afb7c89e5022770a142ec8c31659a.camel@codeconstruct.com.au>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba2e6b78e59afb7c89e5022770a142ec8c31659a.camel@codeconstruct.com.au>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 17, 2025 at 04:52:37PM +1030, Andrew Jeffery wrote:
> Hi Greg,
> 
> On Thu, 2025-10-16 at 12:11 -0400, Brian Masney wrote:
> > Hi Andrew and Iwona,
> > 
> > On Mon, Sep 15, 2025 at 02:36:48PM +0930, Andrew Jeffery wrote:
> > > Hi Brian,
> > > 
> > > On Sun, 2025-09-14 at 07:56 -0400, Brian Masney wrote:
> > > > Hi Iwona, Joel, and Andrew,
> > > > 
> > > > On Sun, Aug 10, 2025 at 06:21:51PM -0400, Brian Masney wrote:
> > > > > The round_rate() clk ops is deprecated, so migrate this driver from
> > > > > round_rate() to determine_rate() using the Coccinelle semantic patch
> > > > > appended to the "under-the-cut" portion of the patch.
> > > > > 
> > > > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > > 
> > > > Would it be possible to get this picked up for v6.18? I'd like to remove
> > > > this API from drivers/clk in v6.19.
> > > 
> > > My (strong) preference is that Iwona applies it, but I'll keep an eye
> > > out for any unusual delays.
> > 
> > This patch wasn't picked up for v6.18. Any chance this can get picked up
> > now for v6.19?
> > 
> > I'm hoping to get this merged so that we can remove the round_rate() clk
> > op from the clk core. The clk maintainer (Stephen) mentioned this work
> > in his last pull to Linus.
> > 
> > https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/
> 
> Are you happy to pick this up directly in Iwona's absence?

Why me?

confused,

greg k-h

