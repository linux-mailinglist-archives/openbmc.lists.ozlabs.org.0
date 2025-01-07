Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B65A0340D
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 01:31:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRsRL3CjTz3cTj
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 11:31:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736209867;
	cv=none; b=WOGL19D3sYtLP1G5x+rhVNR7n3gTBFRzHXzDNmoiTtRapQ3KUey+pDCg/RvNY6/YmO8fvaR/PbAder+0eLZ2KDEmdFKQFMaFj8iVi4SD0Qo0p/8CRT1YAq291Iqkfc/jsM/aFLL+lPP2oJyntpQ9QxznnqRwGM7D4BFgTUNPfezI5tmKHqsNr6kbCU4DLAhTbRH9fOU3pQRn+ffaQlxGZhxeBioPmZTaA/k+lfpuA7hvW8SbV46oW5xZ0U/JJk1vGFjpH6f7hNqLqykDaQrRzQVBdt+WVm9vWTM9iWC1tLIQiCqsPU3OgnJSpNbrI5kF288kKQpEYZmyiRvZgQavhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736209867; c=relaxed/relaxed;
	bh=krLcUhB+H3+rCqm9IrFZZfanLZTEha1VXLaGt1AsXto=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jVoVU0o07q4vBxPNIah9QRzsf/4fuTIg9VGzJwnuktEJccnzRRdapK49ZqAx4A8hYntxzq1R4fQWqSCyoF6iwaINJKd++VxBtE/wFiSRciTWt0KnTGE4lbcdPcqgEtB2GU9XBMqU4J02M1dia5z9mO7MrrzK15AUsTPOGoVsm18LBvTRxgszBVPWryqYbT5DDTM+1es08rS9WTtuwhwETVPy8jO2kl/TP/WqGadPvMGkFKnjATLCdc6AiwmG/lcBI6n6zs2coJzGMZqp/KneIbapLi3gfK6u1tmpWp9Qx1wzXptv0iudaKhPYUtouAUez+s+YGZ7gHFq7CeTW0pDrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hpl6zwgd; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hpl6zwgd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRsRB5gXPz3055
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2025 11:31:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EF184A41FE7;
	Tue,  7 Jan 2025 00:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530BFC4CED2;
	Tue,  7 Jan 2025 00:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736209856;
	bh=wDhSYOfboak3qK+hy1jYjiF2LpSH+HGBwrcDHRKoB60=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Hpl6zwgdR4rZ4/LVHS2TAzt0LK+XL1glv0sqbDQZP5vA/yFhfcJUM/eZMo6mBhJG5
	 XyzVwBNReTSIVRdlVitJ1NShl44sdJ0tzFaKhuvroIL1z4OEWZ6V5iR9Qu0HlW7kNg
	 6ymMwWmMG8LsBL81AQsCNwYMqgv9UXNZMC6TTPeSVj0YYaO61EtJEwaQk1aLAD9pa+
	 7pEmZ69BMmznRpGThBIONnF1Y7/r40mDlKWDJJv/TMQiD8ons7ehNGNdLqmj44+dKj
	 7upTyLTWkJ5nTVSqIm8ITzVHXzrR+oKncduJjAlNMaVm3wCqB72QGwqf0IodKWQjlS
	 nFn5woCVD5o0w==
Date: Mon, 6 Jan 2025 16:30:54 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Subject: Re: [PATCH net-next v6 0/3] Add support for Nuvoton MA35D1 GMAC
Message-ID: <20250106163054.79cdd533@kernel.org>
In-Reply-To: <20250103063241.2306312-1-a0987203069@gmail.com>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, netdev@vger.kernel.org, richardcochran@gmail.com, ychuang3@nuvoton.com, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, joabreu@synopsys.com, linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com, schung@nuvoton.com, peppe.cavallaro@st.com, krzk+dt@kernel.org, pabeni@redhat.com, davem@davemloft.net, yclu4@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri,  3 Jan 2025 14:32:38 +0800 Joey Lu wrote:
> This patch series is submitted to add GMAC support for Nuvoton MA35D1
> SoC platform. This work involves implementing a GMAC driver glue layer
> based on Synopsys DWMAC driver framework to leverage MA35D1's dual GMAC
> interface capabilities.

Would be good if you could reply to Christophe's question.

Then please rebase on top of net-next/main and repost.
The first patch doesn't currently apply cleanly.
Please leave out the second patch, it has to go via
the appropriate platform tree, rather than the networking
tree.
-- 
pw-bot: cr
