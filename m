Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8D9547213
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 06:45:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKldD6Jp8z3c8X
	for <lists+openbmc@lfdr.de>; Sat, 11 Jun 2022 14:45:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EOyxoKLc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EOyxoKLc;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKlcp6rjdz3bm5
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 14:45:14 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E0C67B83277;
	Sat, 11 Jun 2022 04:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FDABC34116;
	Sat, 11 Jun 2022 04:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654922708;
	bh=wGn2rPCuxew5qwldJYSVq19UhC8f95uZDKrBI+AiCAs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EOyxoKLc9zXozWV7DhcLaFfbrZrgbhBfWXvYbc+Lt4wFOIHKclOPGOCzoYGcMtDZh
	 RG+SyRAXenLZQC7KMgi/e5wAXA9dlIAaqo4FYwicuklL6O0V9bglXECa/erWrP4892
	 sw28v8UNUIYjuFFFMlOHMn/BdLYAZIHQRGrzcV/XzvwhmGAi9GgAUU1+7j9oQpVSZu
	 KEAJfI1eUdBhkdaITLN7U9feUtgkZEAQHZnP6BAj4Ky1qSqXNF/e0sJZ9ONuARh66L
	 ayhkV6fKRt1LWfXp0iWBx92ZBISS7NHAaodySUd+q6PFhPK39pZ2YFQtu5IxElOEY1
	 U14TuxV1zh5dQ==
Date: Fri, 10 Jun 2022 21:45:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: Re: [PATCH v2 0/6] Configurable VLAN mode for NCSI driver
Message-ID: <20220610214506.74c3f89c@kernel.org>
In-Reply-To: <3c9fa928-f416-3526-be23-12644d18db3b@linux.intel.com>
References: <20220610165940.2326777-1-jiaqing.zhao@linux.intel.com>
	<20220610130903.0386c0d9@kernel.org>
	<3c9fa928-f416-3526-be23-12644d18db3b@linux.intel.com>
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

On Sat, 11 Jun 2022 11:25:03 +0800 Jiaqing Zhao wrote:
> > Why is "ncsi,vlan-mode" set via the device tree? Looks like something
> > that can be configured at runtime.   
> 
> Actually this cannot be configured at runtime, the NCSI spec defines no
> command or register to determine which mode is supported by the device.

To be clear I'm not saying that it should be auto-detected and
auto-configured. Just that user space can issue a command to change 
the config.

> If kernel want to enable VLAN on the NCSI device, either "Filtered tagged
> + Untagged" (current default) or "Any tagged + untagged" mode should be
> enabled, but unfortunately both of these two modes are documented to be
> optionally supported in the spec. And in real cases, there are devices
> that only supports one of them, or neither of them. So I added the device
> tree property to configure which mode to use.

But for a given device its driver knows what modes are supported.
Is it not possible to make the VLAN mode passed thru ncsi-netlink?

Better still, can't "Filtered tagged + Untagged" vs "Any tagged +
untagged" be decided based on netdev features being enabled like it
is for normal netdevs?
