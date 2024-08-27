Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A12DA95FEDC
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2024 04:10:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wt9xh2KKPz30Vr
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2024 12:10:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724724644;
	cv=none; b=SpLWjYu6EEghLs27ccKhxHgOR0TYWtydZeABKi/2YZWrh8W2jxeVE2YmqTKihUUogL++4nJ4FoxXPCHKS11Vuzm5I1vAdktLMllEnPbznGunL5aSjF8CFMOM16J+tyYiFZFTghFanx3tkW3UQY9g8fKnjfRk2RJazkSp+GHNVa+RfUz5s7IaP5n/HRZN4vPotIszEidlzVlKEAtzxyISSwlvLxDx34scnydGpOAS+U9T9A1LlYTQLJ1kJjgDHOMFKq230Blx4AgU/pAOCyR33lkHqJJUrZw2R78ivPBhVQ05eCU+AgKzsME3c6+w3JwAGZgOMedhMadlxc00UEM7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724724644; c=relaxed/relaxed;
	bh=9j30gj+qp/C7SdKEpmSsJzayBMelBsPxi/9o36B59C0=;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version; b=fO7DQG2ZpdBrToWXxd6Fv+tJ50ylweukBxoY0HZUOSRc7t4tW7YiVVRZSqiNjNbjcNRqDGAWe1XH8XCy6yJzybKieaZ/E5rISQBcfBhWy0g00IHhSXpoiw8sIEUTb7bgt3z2P3rGgNsS0sYP8A53eFJbltdGYVgtp8FOxkW+7ZzdrwhIXc0CjqkkMXA5V03/dRyYjH6hDhLO3DQk2cBIav/wHRW0MP3cWYObq9v0rlbHbufMYEseejX15MMKX63h51LXUKEjJONl+nZZxQcXxQ99ZRWA6ciXO8AlSvoOceBbYIrLtmSJtIWIXJcLgZjLZtFyBp+fttGd0ZvBc5iFSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WztVIcGY; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WztVIcGY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wt9xb5wgkz2xZt;
	Tue, 27 Aug 2024 12:10:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724724640;
	bh=9j30gj+qp/C7SdKEpmSsJzayBMelBsPxi/9o36B59C0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WztVIcGYX9waqgzvv+NSUHCtUC14eoRTRFdgWOsbLHv75norQcg8+AN7PsQ9Uc7Cv
	 tCLQZiECwGN6Os+WeHJUSxws2MziDvtu4TN82alu7WKKLlOTODSWpSxqIWeLrEL4Xf
	 +1NMhr1wxoqzXtyK3yDPKACznY8pmIUhdE+z1m+Bxq8USispFqAJYVYKSvDOUSjyQo
	 m/J4U0xtKdcECPJxVM1wmZWsfQZOJp4z3K/hokIlJefRDksWEy7hHtHcKKyZNNPrAK
	 ywMDoBUjddkaR1NOL2pd3YhsY+UdvEM09adBVKDk9iHYrFYMNNYoj4snfT3QvMb83k
	 yboVnh+I/waOg==
Received: from [192.168.68.112] (ppp118-210-185-99.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.99])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7C22665140;
	Tue, 27 Aug 2024 10:10:37 +0800 (AWST)
Message-ID: <9a810b982c7d9b3c2b6ea1feb560ee9cd8ffe113.camel@codeconstruct.com.au>
Subject: Re: [PATCH -next] mmc: sdhci-of-aspeed: fix module autoloading
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Liao Chen <liaochen4@huawei.com>, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 27 Aug 2024 11:40:35 +0930
In-Reply-To: <20240826124851.379759-1-liaochen4@huawei.com>
References: <20240826124851.379759-1-liaochen4@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: ulf.hansson@linaro.org, adrian.hunter@intel.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2024-08-26 at 12:48 +0000, Liao Chen wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.
>=20
> Signed-off-by: Liao Chen <liaochen4@huawei.com>

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>
