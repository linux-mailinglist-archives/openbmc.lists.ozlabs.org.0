Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BCF4445BC
	for <lists+openbmc@lfdr.de>; Wed,  3 Nov 2021 17:16:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HksNG4g9Gz2yHV
	for <lists+openbmc@lfdr.de>; Thu,  4 Nov 2021 03:16:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JtxbmZGM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JtxbmZGM; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HksMr26Ljz2xCB;
 Thu,  4 Nov 2021 03:16:24 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B46A5610A8;
 Wed,  3 Nov 2021 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635956182;
 bh=fBBwqxhpkN2IhJ6CoL2JqIThEEgrJYdG6WDndfKiqF4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JtxbmZGMmI8BFKM3/NRL8+1eT7NdqleGgzc5k0XdstU6XtoNYpjvu+qdmUCwsP4sT
 DCavy25NG0Uzz6TA9FPOPJikjOcKDeQBlYFJhipeLPxtaPVj/XzV5pD5euUrXmCbjb
 xljlv1al3D/BphYDroDL2BHA2XY44l+fb2h08Ym/ksPnuzVy8ufy81PhAYdsdpvqQT
 1BTyY4ke2qYHIJKZ/Myb9PyzlHiU8qpJXndSvpM4phRsQnkmgJKAg7yY5/7DzpM4z6
 Z6GeK3BU4XvWW6BgKehfZ6rX3psbvhutXcZmTktxyWE7cHp3G/AOwJWXIK5Mrz+oMt
 h1igyCzVfxj/A==
Date: Wed, 3 Nov 2021 09:16:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: [PATCH v4] Add payload to be 32-bit aligned to fix dropped packets
Message-ID: <20211103091620.718b4e11@kicinski-fedora-PC1C0HJN>
In-Reply-To: <CAA7Tbcu7rOxhP45m0tkQBKWxUFGwtQ3Z485wyCtS-wVaTtq2=g@mail.gmail.com>
References: <20211028095047.GA15236@gmail.com>
 <CAA7TbctGtHBuVOsamFH1sQq_C5BvtsRyCM+b0Z7W=fS_eb8ATA@mail.gmail.com>
 <20211103084939.04f6813f@kicinski-fedora-PC1C0HJN>
 <CAA7Tbcu7rOxhP45m0tkQBKWxUFGwtQ3Z485wyCtS-wVaTtq2=g@mail.gmail.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Amithash Prasad <amithash@fb.com>,
 patrickw3@fb.com, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 velumanit@hcl.com, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 3 Nov 2021 21:43:03 +0530 Kumar Thangavel wrote:
> Hi Jakub,
> 
> Thanks for your response.
> 
> Somehow, My mails are not delivered to netdev@vger.kernel.org.
> 
> So, I removed it in my last 2 patchsets.
> 
> I will try again to CCing netdev@vger.kernel.org.

For normal replies you need to use plain text, not HTML. The mailing
list rejects HTML emails. But the patch should go thru, we'll see.
