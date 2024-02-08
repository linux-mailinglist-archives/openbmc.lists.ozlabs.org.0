Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1EE84DACA
	for <lists+openbmc@lfdr.de>; Thu,  8 Feb 2024 08:43:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=HFF2JT2k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVpqp4b6gz3cH4
	for <lists+openbmc@lfdr.de>; Thu,  8 Feb 2024 18:43:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=HFF2JT2k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVpqD3ZJdz2ykC
	for <openbmc@lists.ozlabs.org>; Thu,  8 Feb 2024 18:42:32 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 42776B20;
	Wed,  7 Feb 2024 23:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1707378149;
	bh=nc6/jWnwLX397A9Ey6yCLTE82wXsWB+Hnpcpb6UbAaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HFF2JT2kZMnF214qt6j38Xz6hmZbZihcccEsXXLVpOZge0Y+/IFzMg908eI0wbIV7
	 YXtGEDNHiBGpRa8I/5d46CgHNKKNxsl9z5aeMrfLDPQ/eBeQ8KHqpzb4vVZKFcJl+7
	 t5j2ipv2LWbAGVn8TTcMYKOsCE+Hbi5BrgLIhoYo=
Date: Wed, 7 Feb 2024 23:42:27 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 0/2] ARM: prctl: Reject PR_SET_MDWE where not supported
Message-ID: <aee52007-b805-40a0-976b-eee52c98099c@hatter.bewilderbeest.net>
References: <20240208012620.32604-4-zev@bewilderbeest.net>
 <385d72eb-2443-42e5-858d-0cc083a29a26@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <385d72eb-2443-42e5-858d-0cc083a29a26@gmx.de>
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
Cc: Florent Revest <revest@chromium.org>, Sam James <sam@gentoo.org>, Ondrej Mosnacek <omosnace@redhat.com>, linux-parisc@vger.kernel.org, Stefan Roesch <shr@devkernel.io>, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, David Hildenbrand <david@redhat.com>, Oleg Nesterov <oleg@redhat.com>, stable@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Borislav Petkov \(AMD\)" <bp@alien8.de>, linux-arm-kernel@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>, Russell King <linux@armlinux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, "Mike Rapoport \(IBM\)" <rppt@kernel.org>, Yang Shi <yang@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Helge,

Thanks for taking a look!

On Wed, Feb 07, 2024 at 11:02:24PM PST, Helge Deller wrote:
>Hi Zev,
>
>On 2/8/24 02:26, Zev Weiss wrote:
>>Hello,
>>
>>I noticed after a recent kernel update that my ARM926 system started
>>segfaulting on any execve() after calling prctl(PR_SET_MDWE).  After
>>some investigation it appears that ARMv5 is incapable of providing the
>>appropriate protections for MDWE, since any readable memory is also
>>implicitly executable.
>>
>>(Note that I'm not an expert in either ARM arch details or the mm
>>subsystem, so please bear with me if I've botched something in the
>>above analysis.)
>>
>>The prctl_set_mdwe() function already had some special-case logic
>>added disabling it on PARISC (commit 793838138c15, "prctl: Disable
>>prctl(PR_SET_MDWE) on parisc"); this patch series (1) generalizes that
>>check to use an arch_*() function, and (2) adds a corresponding
>>override for ARM to disable MDWE on pre-ARMv6 CPUs.
>
>Instead of splitting it out to a new function in mman.h,
>I'd prefer having it as config option, e.g. ARCH_HAS_NO_MDWE_SUPPORT (?)
>which could be checked instead.
>For parisc we still want to allow mdwe in the future, we just have
>to wait until most user-space programs have updated to the latest
>binaries which don't need an executable stack any longer.
>

I considered that, but it seems that ARM kernels at least may not know 
the answer to that question at compile-time -- see patch 2, where the 
ARM implementation does a runtime check on cpu_architecture().

>>With the series applied, prctl(PR_SET_MDWE) is rejected on ARMv5 and
>>subsequent execve() calls (as well as mmap(PROT_READ|PROT_WRITE)) can
>>succeed instead of unconditionally failing; on ARMv6 the prctl works
>>as it did previously.
>>
>>Since this was effectively a userspace-breaking change in v6.3 (with
>>newer MDWE-aware userspace on older pre-MDWE kernels the prctl would
>>simply fail safely) I've CCed -stable for v6.3+, though since the
>>patches depend on the PARISC one above it will only apply cleanly on
>>the linux-6.6.y and linux-6.7.y branches, since at least at time of
>>writing the 6.3 through 6.5 branches don't have that patch backported
>>(due to further missing dependencies [0]).
>>[0] https://lore.kernel.org/all/2023112456-linked-nape-bf19@gregkh/
>
>I think you don't need to worry about that, since stable kernel series
>for 6.3 up to 6.5 were stopped...
>

Ah, hadn't realized that -- thanks for the tip.


Zev

