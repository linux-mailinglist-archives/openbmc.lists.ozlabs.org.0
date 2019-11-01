Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 518BCEBC44
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 04:13:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4746hl67RJzF5Nb
	for <lists+openbmc@lfdr.de>; Fri,  1 Nov 2019 14:13:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4746ch0xpxzF5Qd
 for <openbmc@lists.ozlabs.org>; Fri,  1 Nov 2019 14:09:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="PVRmj1I0"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4746cg10fZz9sPj;
 Fri,  1 Nov 2019 14:09:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1572577795; bh=4u5DArLfvo4sHgVS7SnzCn5F4Yen9hhi4tctJCxMsmI=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=PVRmj1I0GY3BKsrQDFx+I65vb+9I7Oqj2OvgnBmIurOAwmcXWT5eUMHRV6bNOHti6
 +BOdxjDSVUsSnkhcIjtU+u3NCqS+15YTs3xl2NCb0SudVS5qExHz8mQrs9ot0XRVd2
 /pMwJAsl3Xk4R3BHVtLluZwBhagS0LxFeycfbleNt7on+GD3WnwjVYdrCnwaeV0Pkj
 JRRn2LHRydeoJx2MQksJpfVesCwzIEWXAhFbx7sZjzej1CNpE8pg+MqgmiIrcfcJ2l
 Ei5soN762g0xd8ZRCORQdbXWeUYVC9dsmGBwbf2zpjGNfb+jY552pxlPAehZzr44OQ
 KUKnDUBqpk8BA==
Message-ID: <6cf81782af1267d91ac2e7db9d21f9ed45b79ad0.camel@ozlabs.org>
Subject: Re: [PATCH linux dev-5.3 v2 1/8] fsi: aspeed: Implement byte and
 half word writes
From: Jeremy Kerr <jk@ozlabs.org>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date: Fri, 01 Nov 2019 11:09:50 +0800
In-Reply-To: <20191031053625.422-2-joel@jms.id.au>
References: <20191031053625.422-1-joel@jms.id.au>
 <20191031053625.422-2-joel@jms.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

> The driver did not previously support non-word size transfers. The
> fsi-i2c driver attempts accesses of this size, so we require it now.
> 
> This creates three functions for doing word, half word and byte
> writes. This was done to avoid having to decide which length the
> transfer was twice: both in aspeed_master_write to determine how much
> of the void * to copy, and again in opb_write to look up the opcode.

Looks good. I was wondering about doing only the writes in this format,
but then I saw patch 2/8 (would it make sense to combine these?).

Regardless:

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy

