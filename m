Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C25880395
	for <lists+openbmc@lfdr.de>; Tue, 19 Mar 2024 18:38:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Yw23IB9o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tzf8D0XpRz3dVj
	for <lists+openbmc@lfdr.de>; Wed, 20 Mar 2024 04:38:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Yw23IB9o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tzf7h08GQz3d2g
	for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2024 04:37:52 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 8C49F6C5;
	Tue, 19 Mar 2024 10:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1710869867;
	bh=3SfnrzwmkkMF8R9JhbYStPD6FosPH0R9WbGo/F4C5jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yw23IB9oMmIiDLLw4cX4HvHYB6lxgOSm1IJBbODouWBF6Tdg9DIANXgrscEsrepIn
	 w05eEa0mr0polnd9iRwE9B69iugXx+h8TR/FTlvcRIZwBNtXDJfHVpjNVdn1GFUy9M
	 k6xGaqa1kNQcU91A5R5+pBy5Xq8yeo6zMG2TgW/I=
Date: Tue, 19 Mar 2024 10:37:45 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH RESEND 1/2] prctl: Generalize PR_SET_MDWE support check
 to be per-arch
Message-ID: <c7bb388b-2c4c-4102-9b84-278f6c6855ee@hatter.bewilderbeest.net>
References: <20240227013546.15769-4-zev@bewilderbeest.net>
 <20240227013546.15769-5-zev@bewilderbeest.net>
 <Zd24aCps4xD28c74@shell.armlinux.org.uk>
 <e391cad0-7b98-4efd-bea1-cf5ab9c626bf@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <e391cad0-7b98-4efd-bea1-cf5ab9c626bf@gmx.de>
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
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, openbmc@lists.ozlabs.org, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, Florent Revest <revest@chromium.org>, Kees Cook <keescook@chromium.org>, Stefan Roesch <shr@devkernel.io>, Sam James <sam@gentoo.org>, Josh Triplett <josh@joshtriplett.org>, "Borislav Petkov \(AMD\)" <bp@alien8.de>, Oleg Nesterov <oleg@redhat.com>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, Yin Fengwei <fengwei.yin@intel.com>, Ondrej Mosnacek <omosnace@redhat.com>, stable@vger.kernel.org, Yang Shi <yang@os.amperecomputing.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, "Mike Rapoport \(IBM\)" <rppt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Feb 27, 2024 at 11:53:59AM PST, Helge Deller wrote:
>On 2/27/24 11:24, Russell King (Oracle) wrote:
>>On Mon, Feb 26, 2024 at 05:35:41PM -0800, Zev Weiss wrote:
>>>There exist systems other than PARISC where MDWE may not be feasible
>>>to support; rather than cluttering up the generic code with additional
>>>arch-specific logic let's add a generic function for checking MDWE
>>>support and allow each arch to override it as needed.
>>>
>>>Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>>>Cc: <stable@vger.kernel.org> # v6.3+
>>
>>PA-RISC folk need to ack/review-by this patch.
>
>I'm fine with patch 1/2:
>Acked-by: Helge Deller <deller@gmx.de> # parisc
>
>>Alternatively, it needs
>>to be restructured to add the arch_memory_deny_write_exec_supported()
>>override without touching the PA-RISC code, which then makes the Arm
>>patch independent of the status of the PA-RISC patch. That will allow
>>the Arm issue to be solved even if an ack is not forthcoming for the
>>PA-RISC parts.
>>>Alternatively, I wonder whether akpm would be willing to pick up this
>>patch set as-is.
>
>I have no preference, but I think both patches should be pushed
>together via arm tree or akpm.
>
>Helge

Ping...Russell, Andrew, any thoughts on how this could move forward?


Thanks,
Zev

