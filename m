Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA9D53267F
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 11:36:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6pwk2MHnz3blm
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 19:36:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=etVeMvmk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=etVeMvmk; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6pwN5Pzvz2ywN
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 19:35:48 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-184-100.tukw.qwest.net
 [174.21.184.100])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id A6EAC429;
 Tue, 24 May 2022 02:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1653384943;
 bh=BTqNHkD67/fpuYR/WAEHA5IQVnW+uXEXAws/ib0vx1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=etVeMvmkk8zM6BiUcwxUmnLfP9ax+W06zB/pGe0x0pDXd3z6Lw7GcHrleyFiqCLjH
 K879W06Qj5yb91R5sL8LqPEYx/PePc6HZKWZ70smOx7aEbJ4JGXplw5kZk3mgXhjyU
 skuZMMrocaaiHRwb24lxbiH2D+jbk/XAxIOw798s=
Date: Tue, 24 May 2022 02:35:42 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v4 2/2] arm/mach-aspeed:
 Add support for CONFIG_ASPEED_DEBUG_UART_TO_UART1
Message-ID: <Yoym7lELvEgiF8Li@hatter.bewilderbeest.net>
References: <20220523134004.469176-1-patrick.rudolph@9elements.com>
 <20220523134004.469176-3-patrick.rudolph@9elements.com>
 <20220523230656.GL11809@packtop>
 <CALNFmy3mLZQ=zgXcQ1Qa2NMb5=c9tSJ34b-1-MHDZ9DxydECxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALNFmy3mLZQ=zgXcQ1Qa2NMb5=c9tSJ34b-1-MHDZ9DxydECxQ@mail.gmail.com>
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
Cc: "takken@us.ibm.com" <takken@us.ibm.com>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "christian.walter@9elements.com" <christian.walter@9elements.com>,
 "joel@jms.id.au" <joel@jms.id.au>, Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, May 24, 2022 at 02:30:02AM PDT, Patrick Rudolph wrote:
> On Tue, May 24, 2022 at 1:07 AM Zev Weiss <zweiss@equinix.com> wrote:
> 
> > On Mon, May 23, 2022 at 06:40:04AM PDT, Patrick Rudolph wrote:
> > >Introduce CONFIG_ASPEED_DEBUG_UART_TO_UART1 and reuse existing
> > >platform code to route the debug uart to RDX1/TDX1.
> > >This is required on IBM/Genesis3 as it uses RDX1/TDX1 as debug uart.
> > >
> > >Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > >Reviewed-by: Joel Stanley <joel@jms.id.au>
> > >---
> > > arch/arm/mach-aspeed/Kconfig            | 5 +++++
> > > arch/arm/mach-aspeed/ast2500/platform.S | 2 +-
> > > 2 files changed, 6 insertions(+), 1 deletion(-)
> > >
> > >diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
> > >index edb5520aec..a38f070381 100644
> > >--- a/arch/arm/mach-aspeed/Kconfig
> > >+++ b/arch/arm/mach-aspeed/Kconfig
> > >@@ -82,6 +82,11 @@ config ASPEED_ENABLE_DEBUG_UART
> > >         systems, but may be useful to enable for debugging during
> > >         development.
> > >
> > >+config ASPEED_DEBUG_UART_TO_UART1
> > >+      bool "Route debug UART to UART1"
> > >+      depends on ASPEED_AST2500
> > >+      help
> > >+        Route debug UART to TXD1/RXD1 pins.
> >
> > Any reason not to put this in 'if ASPEED_ENABLE_DEBUG_UART' as suggested
> > in the previous review?  And since that one already has the
> > ASPEED_AST2500 dependency, I think it'd obviate the need to have that
> > specified on ASPEED_DEBUG_UART_TO_UART1.
> >
> > While we're at it, slightly more detail in the help text would good I
> > think, perhaps just "... instead of the default TXD5/RXD5."
> >
> > Though actually, looking at the datasheet I'm now not certain if this
> > does exactly what I had been thinking previously -- if I'm understanding
> > it right, it's not so much switching the debug-UART functionality from
> > UART5 to UART1, it's re-routing UART5 itself to the I/Os typically used
> > for UART1?  Which seems somewhat different, and I guess would ultimately
> > be independent of the debug-UART itself being enabled or disabled, in
> > which case maybe what I said earlier wasn't entirely appropriate...maybe
> > someone with more expertise on the ast2500 UARTs (e.g. Andrew?) can
> > weigh in?
> >
> > As I understand it only re-routes the UART5 to UART1 I/Os. However it
> doesn't make any
> sense to re-route the UART5 if it's disabled.
> I'll push a new patch.
> 

Bear in mind that there's a difference between UART5 and the debug-UART 
feature that can be enabled -- UART5 is a UART pretty much like all the 
others, but it happens to be the one on which the debug feature operates 
by default (listening for a secret password and providing access to 
various special operations via a simple command-line interface).  Even 
with CONFIG_ASPEED_ENABLE_DEBUG_UART=n, UART5 is still available for use 
as a normal UART, it just doesn't have that magic debug capability 
turned on.


Zev

