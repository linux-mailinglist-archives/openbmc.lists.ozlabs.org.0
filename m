Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 892B49C1594
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2024 05:42:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xl5rb4n6Fz3cPf
	for <lists+openbmc@lfdr.de>; Fri,  8 Nov 2024 15:42:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731040925;
	cv=none; b=YOcVall92cJ5p6pA+0mXwmavuOHZ5tNdo65YrGP+mscGLX7sF7AfU4opX5JM2g+8e5O4kssKCtBSKErYFTSwFVAFnLuvw3v5JVVDE5ihbkZboQfWUm0h1WVuXVdt3xJFjnlJkDGPDh/6a9JqyC4fyJ+ZRFbR4uzSEkyOuBflnrl81xyDceI+i6Mo2zE3n8fnjpzwfT4l+zCOzaP8JAfAYUWwCrn1oFacsWocztgzPU3YryhnASGJRYjZeqNpFVAKiwlzfDqaQNsPIaV7l7hAst0o3zwYU8GMjUnYgkq5MRwgVlWkVe//p6Lq/BxFXY5kKfC4NAlvRviN0ZqrZcXakw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731040925; c=relaxed/relaxed;
	bh=EAF0vpKqq0tY0ucdYYKelJVJzJD156PSleu0qJEzhuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kHIxL8Lft4Q1Tb/SKAu7qFwT/BkVREKtWdkFjuRmEui63KdGz+jGDxxxC3kI/gQWHbkBw1rURbMJ1X0v+x1HXikMxahnZ+xV5s0ii5EqmitzgI00yhR6H7lDKz+iDzMzN1Dezy8r/Lm3Q6lPKe0+kKEq6m+txzSFrziHp0wUMa1WK3GfoNmQSJej0rbj7WTAmG0/GigaExRmzc+O127HSO/1rF3CbdMa2cBmr6K79k0Vceit3LwxZnhjxg0ssd0IegO3WBVMf1tbss3mYcTKSs64T2ocmb8jRlLjcwnMCntcmRwIlI7Qf1ig8ZLhLnjEJ78IlWRwwc6MCETw+EgDlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TkNe8C3I; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TkNe8C3I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xl5rX0Dgjz3bjG
	for <openbmc@lists.ozlabs.org>; Fri,  8 Nov 2024 15:42:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 40A84A44F1F;
	Fri,  8 Nov 2024 04:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B750BC4CECE;
	Fri,  8 Nov 2024 04:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731040919;
	bh=42icZBoK9V7F1r9cTIkKrKqQHCaMvesCSobJJBfi1e0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TkNe8C3IhTDmGkcsXoR98/Jui2Yma4S/ZLPNEurJkDuAJtmYPviluiLwir2SAkrGO
	 jei7wG7pSHpDeoYfYi4vQn7NfmDjWEGwmmq28P0htVc4F4tfhv4KtGWnPSTejZvlFz
	 d9F8a3as6uTUox51Ze3UVNn1CfoY8859trJtVcMir2cdg5dvhoJoNzETXX+zgPPKT2
	 Svx8YWTgfqtfnn+QoJa41jfgqxIrF6/tHD+dhOlbfXErIHDqmKHHeRBS/bYhVj1CIT
	 QwTVF9mJD7kFfKG02Fw5szHsZeDwjqFA1lrGpLu+CXa72hPKMiO7LC0u8DtJ4kCX93
	 whTbzG/7GBV2A==
Date: Thu, 7 Nov 2024 20:41:57 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Khang Nguyen <khangng@os.amperecomputing.com>
Subject: Re: [PATCH net-next] net: mctp: Expose transport binding identifier
 via IFLA attribute
Message-ID: <20241107204157.683bca11@kernel.org>
In-Reply-To: <20241105071915.821871-1-khangng@os.amperecomputing.com>
References: <20241105071915.821871-1-khangng@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
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
Cc: patches@amperecomputing.com, Thu Nguyen <thu@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, ampere-linux-kernel@lists.amperecomputing.com, Phong Vo <phong@os.amperecomputing.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, Hieu Le <hieul@amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Simon Horman <horms@kernel.org>, Phong Vo <pvo@amperecomputing.com>, Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>, Paolo Abeni <pabeni@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, Chanh Nguyen <chanh@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue,  5 Nov 2024 14:19:15 +0700 Khang Nguyen wrote:
> However, we currently have no means to get this information from MCTP
> links.

I'm not opposed to the netlink attribute, but to be clear this info 
is indirectly available in sysfs, right? We link the netdev to 
the parent device so the type of /sys/class/net/$your_ifc/device
should reveal what the transport is?
