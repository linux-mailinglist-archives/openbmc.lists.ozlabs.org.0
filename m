Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE82868D87
	for <lists+openbmc@lfdr.de>; Tue, 27 Feb 2024 11:26:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=X3o4ZMum;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkYZ73Vc5z3dW1
	for <lists+openbmc@lfdr.de>; Tue, 27 Feb 2024 21:26:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=X3o4ZMum;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+openbmc=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
Received: from pandora.armlinux.org.uk (unknown [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkYXk0zDrz30Pp
	for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2024 21:25:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JCdHzu2wkDIMV3N9KhEnaZn7nt+SUq/lt3fcc9JJLCM=; b=X3o4ZMumh+WSsbya++ZFhtGQtB
	3jMjGFRyAKDrQ6bMJQKbd5y2qsY7D3/VmDpfzHkMH6PakulAFqF4HNgsDc+owbvCfZ25CP4XYfCH8
	UI1Bniqs7Jl4UNl7QATUXCDQ4jt5ilvkda3mO8VTmuqAWYPbOZo1ZNyepxPTNnIe0Hn8zYSQ1TKht
	bIHEJ2YbLwz0NAk4PA2pJ8O6+fUsmTVV+IlhQK6S+xBqMUsrvHTTA032uvVTQJ9WktNmcvAj3bs18
	X05XBlfCFGcbmJCi8KFVH92pbunbs7dz9v//Po5GYryvsw2rE6JPZ2AUOoV+6jgR8tKVzoKMDTHe2
	k+PD2pug==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36722)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1reudi-0007kH-1R;
	Tue, 27 Feb 2024 10:24:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1reudc-0007J2-Nc; Tue, 27 Feb 2024 10:24:40 +0000
Date: Tue, 27 Feb 2024 10:24:40 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH RESEND 1/2] prctl: Generalize PR_SET_MDWE support check
 to be per-arch
Message-ID: <Zd24aCps4xD28c74@shell.armlinux.org.uk>
References: <20240227013546.15769-4-zev@bewilderbeest.net>
 <20240227013546.15769-5-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227013546.15769-5-zev@bewilderbeest.net>
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
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Miguel Ojeda <ojeda@kernel.org>, Florent Revest <revest@chromium.org>, Kees Cook <keescook@chromium.org>, Stefan Roesch <shr@devkernel.io>, Sam James <sam@gentoo.org>, Josh Triplett <josh@joshtriplett.org>, "Borislav Petkov \(AMD\)" <bp@alien8.de>, Oleg Nesterov <oleg@redhat.com>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, Yin Fengwei <fengwei.yin@intel.com>, Ondrej Mosnacek <omosnace@redhat.com>, stable@vger.kernel.org, Yang Shi <yang@os.amperecomputing.com>, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, openbmc@lists.ozlabs.org, "Mike Rapoport \(IBM\)" <rppt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26, 2024 at 05:35:41PM -0800, Zev Weiss wrote:
> There exist systems other than PARISC where MDWE may not be feasible
> to support; rather than cluttering up the generic code with additional
> arch-specific logic let's add a generic function for checking MDWE
> support and allow each arch to override it as needed.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Cc: <stable@vger.kernel.org> # v6.3+

PA-RISC folk need to ack/review-by this patch. Alternatively, it needs
to be restructured to add the arch_memory_deny_write_exec_supported()
override without touching the PA-RISC code, which then makes the Arm
patch independent of the status of the PA-RISC patch. That will allow
the Arm issue to be solved even if an ack is not forthcoming for the
PA-RISC parts.

Alternatively, I wonder whether akpm would be willing to pick up this
patch set as-is.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
