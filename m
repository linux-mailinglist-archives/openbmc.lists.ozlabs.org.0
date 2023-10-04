Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 001E17BF141
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 05:15:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kRDgIR6W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4LdG6CQQz3c8r
	for <lists+openbmc@lfdr.de>; Tue, 10 Oct 2023 14:15:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kRDgIR6W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0v8w1cDJz307y;
	Wed,  4 Oct 2023 23:27:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0371FCE1C17;
	Wed,  4 Oct 2023 12:27:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518ACC433C9;
	Wed,  4 Oct 2023 12:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696422460;
	bh=jLtpvUu3o2mCQfgfqelejQUPXc1SMpmQFBdmvnSadmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kRDgIR6WXxZmRUOX9AEKsETpXqUxHBzUG3ZCxQNV3A7erIU9r4H3qNZEIpmsNZ6vd
	 +YHymlJhFlVRq/pg0hiFAm2cc9E4cdWW3wZqZdKHxOAOZ1BlIYJiqkYttXL8/Kep6p
	 MiReP0tpPrGNdcUMIoRYJZWGBtXFlMaTRItg1RyOX/sAVu/Lqvy9BKvV30ojNCVHgn
	 aQcx+pXRM38ku9h0V2Acup8diwx67h2bgNr96QT+z0SUui2EcOK+dbzLcmsKo79S2E
	 vH8GGZ7E49F7rpSxVAbzeKbw5xO07Ece7lYGYdFF1nL+T47G+Ux27S1d3AekE4fi6B
	 I4VhYRuyZ9aXQ==
Date: Wed, 4 Oct 2023 14:27:33 +0200
From: Simon Horman <horms@kernel.org>
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Subject: Re: [PATCH v3 3/3] mctp: Add MCTP-over-KCS transport binding
Message-ID: <ZR1aNb0+D+uO+Qm8@kernel.org>
References: <20231003131505.337-1-aladyshev22@gmail.com>
 <20231003131505.337-4-aladyshev22@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003131505.337-4-aladyshev22@gmail.com>
X-Mailman-Approved-At: Tue, 10 Oct 2023 14:15:18 +1100
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
Cc: tmaimon77@gmail.com, minyard@acm.org, andrew@aj.id.au, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, avifishman70@gmail.com, edumazet@google.com, netdev@vger.kernel.org, linux-aspeed@lists.ozlabs.org, joel@jms.id.au, kuba@kernel.org, jk@codeconstruct.com.au, matt@codeconstruct.com.au, pabeni@redhat.com, openipmi-developer@lists.sourceforge.net, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 03, 2023 at 04:15:05PM +0300, Konstantin Aladyshev wrote:
> This change adds a MCTP KCS transport binding, as defined by the DMTF
> specificiation DSP0254 - "MCTP KCS Transport Binding".
> A MCTP protocol network device is created for each KCS channel found in
> the system.
> The interrupt code for the KCS state machine is based on the current
> IPMI KCS driver.
> 
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>

...

> diff --git a/drivers/net/mctp/mctp-kcs.c b/drivers/net/mctp/mctp-kcs.c

...

> +static inline void set_state(struct mctp_kcs *mkcs, u8 state)

Hi Konstantin,

Please avoid the inline keyword in C files unless there is a demonstrable
reason to use it. In general, the compiler should be left to decide.

> +{
> +	dev_dbg(mkcs->client.dev->dev, "%s: state=0x%02x", __func__, state);
> +	kcs_bmc_update_status(mkcs->client.dev, KCS_STATUS_STATE_MASK,
> +			      KCS_STATUS_STATE(state));
> +}

...

> +static inline struct mctp_kcs *client_to_mctp_kcs(struct kcs_bmc_client *client)

Ditto.

> +{
> +	return container_of(client, struct mctp_kcs, client);
> +}

...
