Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAFD3F0F9B
	for <lists+openbmc@lfdr.de>; Thu, 19 Aug 2021 02:49:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqmPd65fhz3bWw
	for <lists+openbmc@lfdr.de>; Thu, 19 Aug 2021 10:49:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=IZwluEE+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=jk@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=IZwluEE+; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqmPB3QFGz2yRK
 for <openbmc@lists.ozlabs.org>; Thu, 19 Aug 2021 10:49:17 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GqmP62Gz4z9sW8;
 Thu, 19 Aug 2021 10:49:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1629334154;
 bh=HSPHEsauq21KDtxPW7DTIWomUhjHRhqvbT07dP4Ns6o=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=IZwluEE+oaZNbEt+K6jfNftUwlGHQP1vpQ4mm9uUuyr2mZN0cmq6rc7js+mKeROgq
 qNYSAsNUyx8nuB+DsWt8DUYB0Whu5VPMylD0WMTP053gMfwh2L9kfv/YYJIs6TTm5o
 SM/VVJxcBvfSiU8p7P26SOC5rZBbn3AHahoObRQVCxsR7mRZKv0gI27aB3GHjsFGK9
 DLSFFqnIZQ0tnu2M+9OXZMkwjcZ9Px6nL6/xo9zhXPuU2DYs9S733w+lIZIoRjXtbq
 lRMBgm3tpS/LnIpRO3FinNBPKiOiD+V7rROYEApXIvp2nJ69NWNic6Fq20MpFkCmc0
 OAmU32jwIJ9Gg==
Message-ID: <e6ff536d22764e44ac9444c50bad41d4b4a1d8c1.camel@ozlabs.org>
Subject: Re: Security Working Group meeting - Wednesday September 18 - results
From: Jeremy Kerr <jk@ozlabs.org>
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
Date: Thu, 19 Aug 2021 08:49:11 +0800
In-Reply-To: <911133cc-791b-5cec-4de9-c2d9f85f7e82@linux.ibm.com>
References: <5dfb0b20-2c1b-8d6e-343d-2df228b3fdb3@linux.ibm.com>
 <911133cc-791b-5cec-4de9-c2d9f85f7e82@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi Joseph,

> 5 How to add session timeouts to host console?
> 
> DISCUSSION:
> 
> See the diagram in the README under 
> https://github.com/openbmc/obmc-console 
> <https://github.com/openbmc/obmc-console>.
> 
> We thought obmc-console-client was the right place to implement the 
> timeout mechanism.

OK, but that diagram doesn't really cover the detail you'd need to base
such a decision on; there's the ssh server between port 2222 and the
obmc-console-client program.

[obmc-console-client is just a *really* simple bridge between stdio and
a unix domain socket. It doesn't own the network socket, nor do any
authentication or authorisation]

We can definitely do an optional timeout in obmc-console-client, but I
want to make sure that's really what you want first.

Cheers,



Jeremy

