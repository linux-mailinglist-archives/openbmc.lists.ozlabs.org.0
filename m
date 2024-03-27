Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A99DD88D3D5
	for <lists+openbmc@lfdr.de>; Wed, 27 Mar 2024 02:46:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=SGSYReUx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V48fb3FMmz3d2x
	for <lists+openbmc@lfdr.de>; Wed, 27 Mar 2024 12:46:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=SGSYReUx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V48dv2LsYz3c9y;
	Wed, 27 Mar 2024 12:46:11 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-177-226.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.226])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DAF60200DB;
	Wed, 27 Mar 2024 09:46:06 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1711503969;
	bh=DoCy0+ib6v6kh81I+uYITM62RigPnYRn7LhIetEqj/4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=SGSYReUx514D/YQ+nPzoRDe+VNpX1+4bd0+sgkj+S9BxnYQlJr28SitJmyf9HXSqJ
	 cAoo3H4VX01C2Y3o+30J+cacOIZL7GNH7K7do9jakxF8Wi2Jb4UzYEB9ZvM2QElWtl
	 RUzUAJs8iYHs0R/SNA1sl705EPRdGDdEyibHkwGiit4xrNUq9th6c82i6VQP4If63g
	 oBuHZ0yU/zev3MWsWtPS/FNHMzEC5u0l98XjYTCpScNnxblbYKLCPnZaL9rdtpWYcV
	 GkAfxBA5I+XVq6crl/Qy3isW1Ua0niQHTmy4Ezgc+hNAXHVKLTWKxFcou6fgItDI4E
	 ITJTm7v27wWKw==
Message-ID: <eb4171d9c46dba2aabca90319028ee6be8c80d55.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 0/2] Add Reviewed-by and Acked-by tags
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kelly Hung <ppighouse@gmail.com>, robh+dt@kernel.org
Date: Wed, 27 Mar 2024 12:16:06 +1030
In-Reply-To: <20240326103549.2413515-1-Kelly_Hung@asus.com>
References: <20240326103549.2413515-1-Kelly_Hung@asus.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, kelly_hung@asus.com, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Kelly,

On Tue, 2024-03-26 at 18:35 +0800, Kelly Hung wrote:
> There are no changes to the Patch file, just the reviewed and acked tags =
are added.
> PATCH v5 has been merged into the next branch.

As others have said, please don't add tags that have not been
explicitly given for your patches.

Further, if a patch has been added to any upstream "next" branches it's
not necessary to resend the patches beyond that point, unless there are
errors that need correcting.

Joel had added an earlier revision of your patches to a branch of
candidate patches to upstream, and I've updated those in my own that
I'm maintaining while he's on leave. I'd also added your patches to the
OpenBMC kernel tree as a consequence, but you shouldn't apply tags to
your upstream patches that other people didn't provide you on that
basis.

As for the concerns reported by Rob's bot, I've got a series that
cleans up many of them. I'm working to find time to send them out.
Hopefully these help reduce the noise in the future.

Andrew

