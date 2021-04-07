Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0045356C1D
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 14:31:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFkKD6F6Xz30Cs
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 22:31:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFkK42HPZz300C
 for <openbmc@lists.ozlabs.org>; Wed,  7 Apr 2021 22:31:20 +1000 (AEST)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E378611EE;
 Wed,  7 Apr 2021 12:31:17 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lU7L1-0064O4-3w; Wed, 07 Apr 2021 13:31:15 +0100
From: Marc Zyngier <maz@kernel.org>
To: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2 00/10] Initial support for Nuvoton WPCM450 BMC SoC
Date: Wed,  7 Apr 2021 13:31:12 +0100
Message-Id: <161779861852.1095473.15662659062108361949.b4-ty@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
References: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: j.neuschaefer@gmx.net, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 tmaimon77@gmail.com, devicetree@vger.kernel.org, joel@jms.id.au
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 6 Apr 2021 14:09:11 +0200, Jonathan Neuschäfer wrote:
> This series adds basic support for the Nuvoton WPCM450 BMC SoC. It's an older
> SoC but still commonly found on eBay, mostly in Supermicro X9 server boards.
> 
> Third-party documentation is available at: https://github.com/neuschaefer/wpcm450/wiki
> 
> Patches 1-4 add devicetree bindings for the WPCM450 SoC and its various parts.
> Patches 5-7 add arch and driver support. Patches 8 and 9 add a devicetree for
> the SoC and a board based on it. Patch 10 finally updates the MAINTAINERS file.
> 
> [...]

Applied to irq/irqchip-next, thanks!

[03/10] dt-bindings: interrupt-controller: Add nuvoton, wpcm450-aic
        commit: 7c18715546203a09f859dac2fe3ea8aceec5f235
[06/10] irqchip: Add driver for WPCM450 interrupt controller
        commit: fead4dd496631707549f414b4059afb86ea8fb80

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.


