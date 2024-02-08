Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C71E84DCE9
	for <lists+openbmc@lfdr.de>; Thu,  8 Feb 2024 10:29:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=19wkwW+6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVsBs1bvZz3cDr
	for <lists+openbmc@lfdr.de>; Thu,  8 Feb 2024 20:29:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=19wkwW+6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+openbmc=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
X-Greylist: delayed 444 seconds by postgrey-1.37 at boromir; Thu, 08 Feb 2024 20:29:10 AEDT
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVsBG1dGrz3bvd
	for <openbmc@lists.ozlabs.org>; Thu,  8 Feb 2024 20:29:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vb5dORbqze0SdpTtcMmBFKm/vy+xDGZxBk1OHiDwRbc=; b=19wkwW+6sREDBf78amIq92Zl1u
	e0eDGWzYrrGtPBT4FJQqeLmWlR6shetElr7ZzQCoLltdJmNRw0G4p65NnJYLS2gWYBIG3kvGV6Zb2
	CFEwQkt7+rau4DEIzj3JN+cbQOW5aH8P3W3GtuwGs6bHnQB31qUBihTOi6hWKSukGnetdMu40rso5
	BCwYq62lFyF5fRzDyTdtThxAyJqGAZ+uC+eAisSBHqM5Hv8wSPjV0s8VV1W9GYxawEocCSD9GXL7k
	LRqcTe00XNGg5NXGm9EvurzWQCwplVd2IY/XPRawXuE4h+SXY2uu9DVLxciVr7wpLRW6YklafcQwd
	HHZQ/DXg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38480)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rY0ad-00048s-1h;
	Thu, 08 Feb 2024 09:21:03 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rY0aX-0005QB-5C; Thu, 08 Feb 2024 09:20:57 +0000
Date: Thu, 8 Feb 2024 09:20:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 0/2] ARM: prctl: Reject PR_SET_MDWE where not supported
Message-ID: <ZcSc+ftxHY8RyinQ@shell.armlinux.org.uk>
References: <20240208012620.32604-4-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240208012620.32604-4-zev@bewilderbeest.net>
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
Cc: Florent Revest <revest@chromium.org>, Sam James <sam@gentoo.org>, Ondrej Mosnacek <omosnace@redhat.com>, linux-parisc@vger.kernel.org, Stefan Roesch <shr@devkernel.io>, linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>, Oleg Nesterov <oleg@redhat.com>, stable@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Borislav Petkov \(AMD\)" <bp@alien8.de>, linux-arm-kernel@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, openbmc@lists.ozlabs.org, "Mike Rapoport \(IBM\)" <rppt@kernel.org>, Yang Shi <yang@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

Where is patch 1 of this series? It doesn't seem to have been Cc'd to
linux-arm-kernel. Therefore, this can't be reviewed.

Thanks.

On Wed, Feb 07, 2024 at 05:26:18PM -0800, Zev Weiss wrote:
> Hello,
> 
> I noticed after a recent kernel update that my ARM926 system started
> segfaulting on any execve() after calling prctl(PR_SET_MDWE).  After
> some investigation it appears that ARMv5 is incapable of providing the
> appropriate protections for MDWE, since any readable memory is also
> implicitly executable.
> 
> (Note that I'm not an expert in either ARM arch details or the mm
> subsystem, so please bear with me if I've botched something in the
> above analysis.)
> 
> The prctl_set_mdwe() function already had some special-case logic
> added disabling it on PARISC (commit 793838138c15, "prctl: Disable
> prctl(PR_SET_MDWE) on parisc"); this patch series (1) generalizes that
> check to use an arch_*() function, and (2) adds a corresponding
> override for ARM to disable MDWE on pre-ARMv6 CPUs.
> 
> With the series applied, prctl(PR_SET_MDWE) is rejected on ARMv5 and
> subsequent execve() calls (as well as mmap(PROT_READ|PROT_WRITE)) can
> succeed instead of unconditionally failing; on ARMv6 the prctl works
> as it did previously.
> 
> Since this was effectively a userspace-breaking change in v6.3 (with
> newer MDWE-aware userspace on older pre-MDWE kernels the prctl would
> simply fail safely) I've CCed -stable for v6.3+, though since the
> patches depend on the PARISC one above it will only apply cleanly on
> the linux-6.6.y and linux-6.7.y branches, since at least at time of
> writing the 6.3 through 6.5 branches don't have that patch backported
> (due to further missing dependencies [0]).
> 
> 
> Thanks,
> Zev
> 
> [0] https://lore.kernel.org/all/2023112456-linked-nape-bf19@gregkh/
> 
> Zev Weiss (2):
>   prctl: Generalize PR_SET_MDWE support check to be per-arch
>   ARM: prctl: Reject PR_SET_MDWE on pre-ARMv6
> 
>  arch/arm/include/asm/mman.h    | 14 ++++++++++++++
>  arch/parisc/include/asm/mman.h | 14 ++++++++++++++
>  include/linux/mman.h           |  8 ++++++++
>  kernel/sys.c                   |  7 +++++--
>  4 files changed, 41 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/include/asm/mman.h
>  create mode 100644 arch/parisc/include/asm/mman.h
> 
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
