Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3ED9757BA
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2024 17:57:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3lZL5b4jz3cG6
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 01:57:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726070231;
	cv=none; b=IleY36xl4TgVdytsnluIyzLbdtTBK8S6Y6R7lf5Z43N9ZTAnssx5N5oXwBToK35jdGq3HKZf+pyxaQkSl7wKle9xnS2V9iRYA/UCXoIASSzffl4bhgY4PadmRaTv8NuZLMqr7EbE1ZCmJOY93vspK5fLUhFR+5QVHi9c2NXx5hoVE2IRAjCY+SHsvYG4ONFbxRMNiFkQchaKiDPsjzAZLsr2xKjNywEseXdAM9gX1K2TNJEzYTUCIe2oYYSWpD15JItmaLv+sIsxBa+0S5EXC6+DQRy5cbpsJA4jL8Ol4jQFNLdAlfHTwA8K3AFXX13ISMzr32hyuY5ydNnrBxyO1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726070231; c=relaxed/relaxed;
	bh=im55rZeYR3uTzwd5kIXnF92QXRY7fBeMSdYH/M7t628=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6ty7ebegCZruXM6cW63Gq9D5EcqOf/MYnGNRcrTIU78k5xvIqgLmitZCtT30D4gAxvQwB8fVeWuYL0U77rY6nb4PyYK+LiWZ8Dcs5/8Ibijfx5K/o9VjZ9lyP2AtlvQkPV0rZIYqQ6Oa+JWOxxX/KKyNphrmdRV6cM/tjTw9/aUkhn1vUqHR2UoqMIODB424GOEXHGOHtzJwVlMTIZrmzdniuFrereXQED0FiqfRQHvcxcxU242srL6FgaE0EIpxsI5z5/809jSUjUfzjOHnBcM+0eYN8WikQyOFVoUpcDNlhpWzHDF71sry7oRMRmFDd1+vdFSrlwg0gJIW/sLUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MSbZqsXQ; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MSbZqsXQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3lZH35Grz2xYq;
	Thu, 12 Sep 2024 01:57:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 16291A4523C;
	Wed, 11 Sep 2024 15:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1C2C4CEC0;
	Wed, 11 Sep 2024 15:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726070228;
	bh=nF/c18D09Y46sCdwrFKtfmx8kDiDbxV17SDMLV7V/L8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MSbZqsXQZvxGgXr7EMhs3k8GTYGyywHC84W9sj1TjYH8RMZGFoqM6+plv6qYKV3HZ
	 pS6kfpCHlmoV4B+sjBZ4uwr9LaHRu5Mt/kD+ZwONUHx3KGyyrpf8Xa8WDuCoGTSXrS
	 8qZLfV9R21YSnNKTlzsisFjw+a6taz1fqVMP2kjEUOILsMNhu6X7qr+1RuuX1eFryg
	 yghG2INw1jKbRRHHcQn+vnmlBVAlqYZftGFjBxSFcRlthZyVc2BG1zZMcq/SMLP12P
	 rb7U7vopaKPOe0vDpzyrDhbp8IaXAOAx+j7vhxf6Jd/MYZ8K3lX3nnsjoRwbYojnfs
	 yHpsnfl1fLMaw==
Date: Wed, 11 Sep 2024 17:57:04 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Subject: Re: [PATCH v3] i2c: aspeed: Update the stop sw state when the bus
 recovery occurs
Message-ID: <ljwz3zv7sakhqoeuceewmnk34igo2srfhtmbhhxqel3tgvqvou@wpvqldtoq6st>
References: <20240911093951.1674824-1-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911093951.1674824-1-tommy_huang@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, wsa@kernel.org, brendan.higgins@linux.dev, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tommy,

On Wed, Sep 11, 2024 at 05:39:51PM GMT, Tommy Huang wrote:
> When the i2c bus recovery occurs, driver will send i2c stop command
> in the scl low condition. In this case the sw state will still keep
> original situation. Under multi-master usage, i2c bus recovery will
> be called when i2c transfer timeout occurs. Update the stop command
> calling with aspeed_i2c_do_stop function to update master_state.
> 
> Fixes: f327c686d3ba ("i2c: aspeed: added driver for Aspeed I2C")
> 
> Cc: <stable@vger.kernel.org> # v4.13+
> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>

merged to i2c/i2c-host-fixes.

Thanks,
Andi
