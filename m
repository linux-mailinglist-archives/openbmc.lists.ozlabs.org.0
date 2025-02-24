Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C6FA414F9
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 07:00:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1VSR6WdLz3c1Q
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 16:59:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740376789;
	cv=none; b=PhDKesD3RZJhoC79ub4XOb4abobcXTYp+Nq15TaAgI4VTtJFMtfv5b2WCAXFv92SIzUZvJFRIVL2NLjsauARdAAj97zux5EilmVqZqCCZsHp8cC0cT/5p6F4FcM0XbeRD0cOGNoslZRSfT4Nh6G917HFo6kRkdnKrPSFv7ubqJWY0dZgzv1MZy5rHNIjWLiE7syr1GkIRvSKEX5yJnMEyzuTax8gqmmOSv8pdz/zmDUkGeQ2XZ+TJe1Eab+yUBJxYRwK8A8eCXBxJ1yBdj7HPkj5ddCtFDXg0PCykntsVkUWhQHO0lsQEUI5JdMfgCugNnwymYORfXaAD30gq5ZR5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740376789; c=relaxed/relaxed;
	bh=uFvXOi+LUJMKwvGI3qUG435UWhEpNqevyHNPflNad3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqr99dnXP+Qng8bnoewecbM8FKDsWK3jjLChX0KgaURAXEOxwAUgFi/SaGEk8Hpxl5lVoqnmxMjeIS6kFtcX7Vbs5iDGk8PyLbfqIu6sGb+5DuQyTtF2beYgPmtvOv2O56mTq+32bp6oGFrg8Zjt1CaCOfhdqFktqwFF/AH0Ye92pujMDIz4JViz8MkEyQTSd1m3u44z8y3EhMH+1T0shBqpSkhOLXukrL4JpYMZUloz/MbM/vgxKn0LZGOCQNgjRho+yO33XPbAhopisbBBNqGZkYj53rfgYHFFvz3ULt6Ue9sYbZkoqvxmOf5sTgZjNmCobbcrX1xCd7LALhQEBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nFhfYlTh; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nFhfYlTh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 447 seconds by postgrey-1.37 at boromir; Mon, 24 Feb 2025 16:59:47 AEDT
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1VSM380Mz2xgv
	for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2025 16:59:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12CEF61170;
	Mon, 24 Feb 2025 05:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EF5C4CED6;
	Mon, 24 Feb 2025 05:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740376336;
	bh=53H9/x0j02AhPT7w+jFHCR4eR6p48BOhp4/DcjS/5+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nFhfYlTh/vn6++4NrrfuzW63KF6xlniD4USCI+6lyNK0LkAXyU6nIDl5SFg1zC3CY
	 8fULK3IP96tqdq8wj0IN9ERcTVWyWI3H3V9uAAtBXOlUWhDjNvrfCCJ7Iv899ih7hL
	 3+mhMk9Xko2hwR2SeMve8H0FOP832WEiYxQKehyY=
Date: Mon, 24 Feb 2025 06:52:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH 1/4] media: nuvoton: Fix reference handling of ece_pdev
Message-ID: <2025022426-lilly-next-72e0@gregkh>
References: <20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org>
 <20250121-nuvoton-v1-1-1ea4f0cdbda2@chromium.org>
 <df5693d0-7747-4423-809e-ae081c9aae92@xs4all.nl>
 <dffc8e0b-2603-4e7e-ba64-15691c11ff7e@xs4all.nl>
 <CANiDSCsMCSJMEsY3R=pnZ4XUTiEYuPz-N1kEX7y13yTzE6Dm5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCsMCSJMEsY3R=pnZ4XUTiEYuPz-N1kEX7y13yTzE6Dm5w@mail.gmail.com>
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLACK,URIBL_SBL_A autolearn=disabled version=4.0.0
X-Spam-Level: *
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
Cc: Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <milkfafa@gmail.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Marvin Lin <kflin@nuvoton.com>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Feb 23, 2025 at 07:34:30PM +0100, Ricardo Ribalda wrote:
> On Fri, 21 Feb 2025 at 10:18, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >
> > On 21/02/2025 10:04, Hans Verkuil wrote:
> > > Hi Ricardo,
> > >
> > > On 21/01/2025 22:14, Ricardo Ribalda wrote:
> > >> When we obtain a reference to of a platform_device, we need to release
> > >> it via put_device.
> > >>
> > >> Found by cocci:
> > >> ./platform/nuvoton/npcm-video.c:1677:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> > >> ./platform/nuvoton/npcm-video.c:1684:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> > >> ./platform/nuvoton/npcm-video.c:1690:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> > >> ./platform/nuvoton/npcm-video.c:1694:1-7: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> > >
> > > This driver uses this construct:
> > >
> > >                 struct device *ece_dev __free(put_device) = &ece_pdev->dev;
> > >
> > > to automatically call put_device. So this patch would 'put' the device twice.
> > >
> > > Does cocci understand constructs like this? If I hadn't looked closely at the
> > > code first, I would just have merged it.
> >
> > Oh wait, now that I am reading the following patches I see that it was those later
> > patches that add the __free code.
> >
> > This is far too confusing. Please post a v2 that just combines the 'fix references'
> > and 'use cleanup.h macros' in a single patch. It makes no sense to have this two-phase
> > approach.
> 
> I believe this is discouraged.
> 
> cleanup.h macros does not exist in old kernel versions, so makes it
> impossible to backport the fix to them.

That's not a problem, fix things properly in the main tree and let the
stable/lts kernels work it out on their own.

> This is an example of other series following this policy:
> https://lore.kernel.org/lkml/173608125422.1253657.3732758016133408588.stgit@devnote2/
> 
> They also mention the same here:
> https://hackerbikepacker.com/kernel-auto-cleanup-1 .... I am pretty
> sure that I read the policy in a more official location... but I
> cannot find it right now :)

No, it is NOT official policy at all.  Otherwise you would be saying
that no one could use these new functions for 6 years just because of
really old kernels still living around somewhere.  That's not how kernel
development works, thankfully.

thanks,

greg k-h
