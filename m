Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA70D926D1A
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2024 03:27:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=iaygZwp9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDzXM0t2Lz3fRp
	for <lists+openbmc@lfdr.de>; Thu,  4 Jul 2024 11:27:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=iaygZwp9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDzWm3svbz2y8r
	for <openbmc@lists.ozlabs.org>; Thu,  4 Jul 2024 11:26:43 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-145-155.adl-adc-lon-bras33.tpg.internode.on.net [118.210.145.155])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2FAB3200E9;
	Thu,  4 Jul 2024 09:26:41 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1720056402;
	bh=HrqVGtOn4ZbOqJ1LA0RblbnOVw1k4ZKoO6m4WW9dkkc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iaygZwp9wwkQpNKKXzmySmFY9cL9qLAv0ew3RkqKJBgF2zOhgW5sz3yhsRC3vGIG4
	 5oclnpy9AFcCkojNmhezp8qD1uHsAaQ0mQ9aOgR072h82oiyOPYUbS/sR6fVYYVf8Y
	 S2ZL50s1Gl6K3BbZ3BG+vNYsFguFvI4S5yjITatuOVnNdW4gO2TfpgTA25DK6+lOD/
	 gRGRwUlrl7a531XszZywGjmmD5LNYFYvmfHBnmAwZ/A+sGFgnBSkSOlXHxTQiFgOX7
	 /bTw/2+QJwuGynDYZmXhUKcjxGUYxQGQjbnwtkkygWnfVs/dyg3NUvfHfxlD49hJ+w
	 J1VcRYTiRQJYA==
Message-ID: <ab750cc7c5d6ad10a1f425b47b7a4113a9243709.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v1 4/6] arm64: dts: modify clock property in
 modules node
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 04 Jul 2024 10:56:40 +0930
In-Reply-To: <CAP6Zq1hu1yBq+EzAQo=ghpAF1dnWDR-uxS4Lkq_KuDMNtPwJ_w@mail.gmail.com>
References: <20240701071048.751863-1-tmaimon77@gmail.com>
	 <20240701071048.751863-5-tmaimon77@gmail.com>
	 <102bf57ba6144ebed65e62d0818eb21dfdf1f24f.camel@codeconstruct.com.au>
	 <13f82a26a526a33ce4a182a4da9e7a302a79d124.camel@codeconstruct.com.au>
	 <CAP6Zq1gOHB=qmr9T4UjFvDsbKdYEHAeBhsXomM34C2=fONjf8g@mail.gmail.com>
	 <CAP6Zq1hu1yBq+EzAQo=ghpAF1dnWDR-uxS4Lkq_KuDMNtPwJ_w@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2024-07-03 at 12:09 +0300, Tomer Maimon wrote:
> Hi Andrew,
>=20
> One more question, for this change the clock node should be removed.
>=20
> I am afraid that removing the clock node could cause an ABI break, not?

Possibly it could break other devicetrees, depending on how they're
constructed.

I'm hesitant to merge these patches to the OpenBMC tree without them
being accepted upstream because of the potential for further breaks
down the track. The situation is already too murky for my taste, and
I'd prefer we keep things to a single break with whatever's accepted
upstream.

I recognise that's probably frustrating for you, but I think it focuses
the effort in the right area (getting the changes merged upstream).

I'm not sure how you best get Stephen's attention though.

Andrew
