Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81969546E14
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 22:09:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKX9m2Qkkz3bxk
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 06:09:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RZqW19Xi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RZqW19Xi;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKX9M0K3Qz3btb
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 06:09:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 99327B83765;
	Fri, 10 Jun 2022 20:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B2AC341C0;
	Fri, 10 Jun 2022 20:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654891744;
	bh=iwnIUaWssTlHqycGijCDdgg7r32DPi0ilgri/+5YyAU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RZqW19XiHxniX1vI+hPIGPdhpVzh1qA+4vF7yCUG5w3gttxIs0U64yy4B4ZWvXzHC
	 GdSaR2FYi3wsghxQS7AEmdiBLt4qehKK/48UCZCGjEBE0b9Myh6imoUb2PposDfimo
	 SLUK7XTxWnApGDRFTwkFX2gpuOD6OZBqB2UmVhXlIB3DfX0sQcHrBtpTKY5vaDo0Yp
	 /hcXWudhme0PUKm5UKADcIohLrwmG44dl0+LnKJK2O4S3JDNhutsp4GHYJsVXyRnUB
	 B/qAGDlZMQ0gew0+SggS0lbmhm+zSHVc+xlvUezvaH6TlPtJyQuOmkTuLjVcpW/iy6
	 IBtewMQAhYCyg==
Date: Fri, 10 Jun 2022 13:09:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: Re: [PATCH v2 0/6] Configurable VLAN mode for NCSI driver
Message-ID: <20220610130903.0386c0d9@kernel.org>
In-Reply-To: <20220610165940.2326777-1-jiaqing.zhao@linux.intel.com>
References: <20220610165940.2326777-1-jiaqing.zhao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, 11 Jun 2022 00:59:34 +0800 Jiaqing Zhao wrote:
> Currently kernel NCSI driver only supports the "VLAN + non-VLAN" mode
> (Mode #2), but this mode is an optional mode [1] defined in NCSI spec
> and some NCSI devices like Intel E810 Network Adapter [2] does not
> support that mode. This patchset adds a new "ncsi,vlan-mode" device
> tree property for configuring the VLAN mode of NCSI device.
> 
> [1] Table 58 - VLAN Enable Modes
>     https://www.dmtf.org/sites/default/files/standards/documents/DSP0222_1.0.0.pdf
> [2] 12.6.5.4.3 VLAN
>     https://cdrdv2.intel.com/v1/dl/getContent/613875

Please don't post the same patches more than once a day. You posted the
same patches 3 times within 15 minutes with no major difference :/

Why is "ncsi,vlan-mode" set via the device tree? Looks like something
that can be configured at runtime. 
