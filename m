Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 398CA8684AE
	for <lists+openbmc@lfdr.de>; Tue, 27 Feb 2024 00:44:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dZ9yY35a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkHKH6lCmz30P0
	for <lists+openbmc@lfdr.de>; Tue, 27 Feb 2024 10:44:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=dZ9yY35a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Th5Cz1Dzcz3c0n
	for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2024 21:02:38 +1100 (AEDT)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id F0A1FC0A3F
	for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2024 09:56:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A86031BF20B;
	Fri, 23 Feb 2024 09:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708682191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F+3ui4MTey0h3yMuAIR85kZGD6qDVbJZoIy/CfcoFU4=;
	b=dZ9yY35ac+PkpZTeHWyoX8fwl12pTM/KBK+uK5NZOMXMMwRu7nZt/nPeb4WrtkpE4kUVoG
	JtoC2VWAhV1v9zPBannrTy349VpaZMT8tg4VSG6Q/EWcDRZXFd/h5h7tMPZ9NIMLBVJSiG
	j9lgUJBiqrBPKpEofmPDCJjpVN7EZIlQ6DFjT09C/lWARcUcc2G6mRte7K9mGNRpbQt7gE
	a/gwK+Zv3yQWzPPNar2HVpMepeiVcmBZ7FqVUyN8gO6DdzcFP/CYUpFXIkrLEnk+DvwAsZ
	v47LMvVbmHF26lJbaDZqWd6im5aO9I2IbKkwcrwaomUqmRQiaKtzWnm9+wRr6w==
Date: Fri, 23 Feb 2024 10:56:26 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next v2 4/4] net: pcs: xpcs: Explicitly return error
 on caps validation
Message-ID: <20240223105626.71b2bcb2@device-28.home>
In-Reply-To: <20240222175843.26919-5-fancer.lancer@gmail.com>
References: <20240222175843.26919-1-fancer.lancer@gmail.com>
	<20240222175843.26919-5-fancer.lancer@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-Mailman-Approved-At: Tue, 27 Feb 2024 10:43:30 +1100
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, Russell King <linux@armlinux.org.uk>, Jiawen Wu <jiawenwu@trustnetic.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Serge,

On Thu, 22 Feb 2024 20:58:23 +0300
Serge Semin <fancer.lancer@gmail.com> wrote:

> If an unsupported interface is passed to the PCS validation callback there
> is no need in further link-modes calculations since the resultant array
> will be initialized with zeros which will be perceived by the phylink
> subsystem as error anyway (see phylink_validate_mac_and_pcs()). Instead
> let's explicitly return the -EINVAL error to inform the caller about the
> unsupported interface as it's done in the rest of the pcs_validate
> callbacks.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

This looks good to me,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
