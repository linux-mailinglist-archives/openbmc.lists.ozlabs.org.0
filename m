Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BAF782EA
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 02:51:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xh3H0lnVzDqNQ
	for <lists+openbmc@lfdr.de>; Mon, 29 Jul 2019 10:51:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xh2k5GVCzDqHK;
 Mon, 29 Jul 2019 10:51:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="rtUj7L3U"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45xh2j4rRmz9s3l;
 Mon, 29 Jul 2019 10:51:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1564361486; bh=652Hf/VbFsflNSC0V7Gg3jJMtgzINm6u1DqrFg6kRNA=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=rtUj7L3Usq6ucao5TrCYy6OXFI1mRP9YI8D5UsR4f9/LD75FA9oKWjh7QlAAudlUo
 hvN+LAgK10ZR9ezJJX1BnE8Irp6uo8SMI4UoRTpw7UvC6bHHqT3bTXpx61TjqBnuFw
 Vby3hgDd90goq5QEEq6+ZNSAMJUNcsG3sX2I1qvfct/AIfpBqZYLKFH9YvIntdApi/
 piitDcoOHBoaXKr6jjZ3V4dPkYNxxPtFXr0yLw+dSe2sSEd9Ubi5WkCSTTafA0B35W
 6kbpeQJWlNcznAFgxDWHNZgWcbxO0mPMJ28oUoXn8LhilkZMm/FB8wXRzc88Snv6jT
 bHmBPUQjXTKSg==
Message-ID: <6b31627a8c5a2616c83783550517961b7ed8f3cb.camel@ozlabs.org>
Subject: Re: [PATCH] drivers/tty/serial/8250: Make Aspeed VUART SIRQ
 polarity configurable
From: Jeremy Kerr <jk@ozlabs.org>
To: Oskar Senft <osk@google.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Mon, 29 Jul 2019 08:51:23 +0800
In-Reply-To: <CABoTLcTSFvQruPRnoRPgiWjOXNDOCSnAXVesG7f1WAuLLLVSSg@mail.gmail.com>
References: <20190727134242.49847-1-osk@google.com>
 <9fb8c99449cebd68fb5975890dedaa06ce7808ae.camel@kernel.crashing.org>
 <CABoTLcRPXffZuKy-DTFUVKJQRydSzMDynYRgBbZ_470iVN1KnA@mail.gmail.com>
 <CABoTLcTSFvQruPRnoRPgiWjOXNDOCSnAXVesG7f1WAuLLLVSSg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Oskar,

> For LPC, the polarity should be set to 1, for eSPI the default of 0 is
> correct.

Would there ever be a case where different SIRQs need different
polarities? If not, we may want this to be global, rather than for each
device (the VUART being one...)

Cheers,


Jeremy

