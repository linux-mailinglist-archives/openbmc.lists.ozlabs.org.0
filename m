Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6FF8A8F93
	for <lists+openbmc@lfdr.de>; Thu, 18 Apr 2024 01:42:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JbP2WTgy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKcsC67QDz3cYV
	for <lists+openbmc@lfdr.de>; Thu, 18 Apr 2024 09:42:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=JbP2WTgy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKcrS5v7cz30PD;
	Thu, 18 Apr 2024 09:42:00 +1000 (AEST)
Received: from [192.168.68.112] (ppp14-2-127-66.adl-apt-pir-bras32.tpg.internode.on.net [14.2.127.66])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5185E20157;
	Thu, 18 Apr 2024 07:41:52 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1713397315;
	bh=d/AzyoJNXW+kEe+3Im15qH+BP+LWLSajKmHbYzbPun0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=JbP2WTgygM6dBAHFoxSdQ6T212Uf4v+Ybq4wDbS0DSrHZeSt7LdobuhADZU0LIOuu
	 hKJCcA+xcCQFvu9kiLAMB+u2aSjNCVCLl+/tYrIjdQNg/JfZ4oY8Z74kP1TVvrvdaE
	 sP5pD5es95wkSXN7dX1UMQXOz7Sl65UwHMJVNpKdXpIqU0l0qVa4Szo+/Q74adprb+
	 bZYKBXWOpB6sIVnjGSfwEAv3DOcV5CbxUAsMTiF8r7Gj/3CVHpPSRJC8ObCp6cvTVJ
	 l5RfLEroZqsEiE+dNjV2cUhX3vtTXJkQAwgyx2xjrMFuH+aCF9BNhMdwZ/r1mC11ZN
	 K3jtG3p2kqiOQ==
Message-ID: <7b0ef5c90138e8c1d1829de249a480709170141b.camel@codeconstruct.com.au>
Subject: Re: [PATCH] peci: aspeed: Clear clock_divider value before setting
 it
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Iwona Winiarska <iwona.winiarska@intel.com>, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Date: Thu, 18 Apr 2024 09:11:47 +0930
In-Reply-To: <20240417134849.5793-1-iwona.winiarska@intel.com>
References: <20240417134849.5793-1-iwona.winiarska@intel.com>
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
Cc: Billy Tsai <billy_tsai@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Iwona,

On Wed, 2024-04-17 at 15:48 +0200, Iwona Winiarska wrote:
> PECI clock divider is programmed on 10:8 bits of PECI Control register.
> Before setting a new value, clear bits read from hardware.
>=20
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>

I think it would be best to add a Fixes: tag and Cc: stable in
accordance with the stable tree rules. Are you happy to do so?

Andrew

