Return-Path: <openbmc+bounces-937-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A85FC7F00D
	for <lists+openbmc@lfdr.de>; Mon, 24 Nov 2025 06:36:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFF0x1HMtz2yvN;
	Mon, 24 Nov 2025 16:36:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763962561;
	cv=none; b=VRaHV+Oiz1S6jRZmedKGA210Tj31UnIt6zdPje6lNLKm0khIhQagMTv0t+1OJqE/OaiIr8vgfC7SIBNzvv/F86uRa/RbHTvXXMq94cl5uBuXTxlWPtgES8xUfa2vZ/G5SQTeZaTDqePknDJVLQP7T94ywVDr1bu4k5IpUCd68HSIhFYczdq/FBG8iSCDEANlJaf3OhEVpOzNG2k2wU1e7CY0Y8Jwc1nkQ6t2KYjCH2rbFlAVckcB+x9KPEp4oIhMAWcDBA5JNFOolrFBJqYu8pXyho4XVEHCkfRHHoqNptTjtzMOSevGgDv1Rd79RmZeUPjQK6zadqCjmQkM7daXOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763962561; c=relaxed/relaxed;
	bh=X196kFX/Ou4gjUdw8NjxD+jTng0S2pIxqJUCLf6sdNs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GfredMdUwxIC7aGvxkRWDdCUpuM24ZTQixB0jP5hTel/PUDvXwJwiyZ4nlJvUujy6RzHyadkpQCnb2jgxwmKydIDAMNMT8BzSmZ6CEFNYBWQvp0n8PrArziec5Gs2vKV7bdJ/HNAIIUgxTMc9sVgnb2s38mTzfUx8/Y+AayUmyNzAcs5pON4M0tu7PpP+vXf56T95bK4jrqd6r2rFDJ7ozQsOjhga8UHVyPpyHYwKFGYNxEtI0VfjCiliD6mAZRw6e6Kem6va30CzAPkt410PHRIu3gzdDxwWW2uAu2xdWRmlvZRVJkduXW6kPSFLAIQdoLZOCK2BsD9OaAdn3MOnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=UmlXrqpx; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=UmlXrqpx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFF0w3t9vz2xS2
	for <openbmc@lists.ozlabs.org>; Mon, 24 Nov 2025 16:36:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763962560;
	bh=X196kFX/Ou4gjUdw8NjxD+jTng0S2pIxqJUCLf6sdNs=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=UmlXrqpxb9SWBvrq0Kw0e+T+eM36OS+4GrdJOvp/1AlQbq5SoWh1VO7po7kwwO1fw
	 ccaAn1HRD4jd0w6UIPTFZYCdvkWd98bYwomCxx5AcDGJRAMlNFzzSTG64ngdE06Nzr
	 TraC/+EUmIGRNbJsv5gXbdCMXHqWU/WpiVtngzRLKyCiM0+X03anDpFsrhif/SYeSt
	 u0Yq9eAjDppFhkN/2rfHw0Vie1RPeVhBbPitBH7AZleLTBc8FQbHa4kcQXJpWOaSdl
	 Y6gJlYE9Z6y5oCH/Kg61N+Ul6hIRRCZM6mLXqYFIuZxsoW5JG6TbPl7lFEHT2nd7bp
	 Jygs0pZwig8gQ==
Received: from [192.168.68.115] (unknown [180.150.112.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C96EF64DF4;
	Mon, 24 Nov 2025 13:35:59 +0800 (AWST)
Message-ID: <88585442dc88144d0cb0e46bdcac161f8baa71c4.camel@codeconstruct.com.au>
Subject: Re: [PATCH] net: mctp: Fix tx queue stall
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au
Date: Mon, 24 Nov 2025 16:05:59 +1030
In-Reply-To: <20251121-mctpusb-backport-v1-1-e53b4c80e06c@nvidia.com>
References: <20251121-mctpusb-backport-v1-1-e53b4c80e06c@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Marc,

On Fri, 2025-11-21 at 12:29 -0800, Marc Olberding wrote:
> From: Jinliang Wang <jinliangw@google.com>
>=20
> The tx queue can become permanently stuck in a stopped state due to a
> race condition between the URB submission path and its completion
> callback.
>=20
> The URB completion callback can run immediately after usb_submit_urb()
> returns, before the submitting function calls netif_stop_queue(). If
> this occurs, the queue state management becomes desynchronized, leading
> to a stall where the queue is never woken.
>=20
> Fix this by moving the netif_stop_queue() call to before submitting the
> URB. This closes the race window by ensuring the network stack is aware
> the queue is stopped before the URB completion can possibly run.
>=20
> (cherry picked from commit da2522df3fcc6f57068470cbdcd6516d9eb76b37)

Interesting that this hasn't yet come in via stable, but oh well.

>=20
> Fixes: 0791c0327a6e ("net: mctp: Add MCTP USB transport driver")
> Signed-off-by: Jinliang Wang <jinliangw@google.com>
> Acked-by: Jeremy Kerr <jk@codeconstruct.com.au>
> Link: https://patch.msgid.link/20251027065530.2045724-1-jinliangw@google.=
com
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> Backports a fix from net-next to openbmc 6.12 for a race condition
> in the mctp-usb driver that results in an effective deadlock.
> This was seen to fix issues on the nvl32-obmc model with pldm
> firmware update
>=20
> Signed-off-by: Marc Olberding <molberding@nvidia.com>

Just a quick note that because you've put this below the --- mark git
drops it when the patch is applied. You need to put your tag in the
trailer section above, under Jakub's S-o-b tag.

See [1] for a bit of a formalisation of it all.

Andrew

[1]: https://git-scm.com/docs/git-interpret-trailers

