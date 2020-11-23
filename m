Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FA32C110D
	for <lists+openbmc@lfdr.de>; Mon, 23 Nov 2020 17:53:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CftWf6vb3zDqRS
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 03:53:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=hXj/yv9u; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CftVX0vsNzDqQm
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2020 03:52:19 +1100 (AEDT)
Received: from threadripper.lan
 (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E10C221FE;
 Mon, 23 Nov 2020 16:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606150336;
 bh=ZbQO0wa84CKGmqS3FOl4uLA3+qgQpN0+P3FceI0HToQ=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hXj/yv9uz5UzttE6VGWWc6FV1Xg1QQMrWsYmjHNRzvVeoNeszOwuGFUdjQCnccSsX
 /+n8SE44mbIgPz1rdAJgxUkAtruQ6dWN3sY+11rUBXvZPc/XNBuMCeNeXwkjiSDPyv
 J6/XM2g2xs/sgUQo5I/yZFZoPAzH5ZRUDdYTR5G8=
From: Arnd Bergmann <arnd@kernel.org>
To: mark.rutland@arm.com, soc@kernel.org, olof@lixom.net,
 benjaminfair@google.com, avifishman70@gmail.com, arm@kernel.org,
 joel@jms.id.au, robh+dt@kernel.org, yuenn@google.com,
 Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1] ARM: dts: add Nuvoton NPCM730 device tree
Date: Mon, 23 Nov 2020 17:52:02 +0100
Message-Id: <160615031117.69876.2661433561026777420.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201119080002.100342-1-tmaimon77@gmail.com>
References: <20201119080002.100342-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 19 Nov 2020 10:00:02 +0200, Tomer Maimon wrote:
> Add Nuvoton NPCM730 SoC device tree.
> 
> The Nuvoton NPCN730 SoC is a part of the
> Nuvoton NPCM7xx SoCs family.

Applied to arm/dt, thanks!

[1/1] ARM: dts: add Nuvoton NPCM730 device tree
      commit: b2d91953b66c724eaf8d7f84f37c006d966f67ac

       Arnd
