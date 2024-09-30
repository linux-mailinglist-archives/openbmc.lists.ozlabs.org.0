Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFC09899E8
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2024 06:49:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XH7sR4pqFz30gG
	for <lists+openbmc@lfdr.de>; Mon, 30 Sep 2024 14:49:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727671781;
	cv=none; b=SuQhYc8LYQJ6N9D79d87CjkcQXBJ11VJWOGJFPHjBRrOHZW60Anl62tF9HvY2PqFebbZ2BHqXWGWddBKV7KPG0lnuRMCucmfb06y5RRFueL4yy5yJ2snFVg/d0rHyR83LpEfFeBqXuhWmlomEPvWee8sWYx/Nqi1vLZ2mx+qqof667+zYojGYpSfORcuV3LGdHEjr8ar1QNe7tpMfRGVxOOgSnDgIOJset+ZP0ah/yS5kYiHeLuTGzrnCSFjFx6C8Osf5YeA3ek6bIu+y9a5GIxAImF7g8uZz+VgiIwubx+MKaYTt1Du9czbn6EoZVaz5uSGTS3lFthCxkbDoHbgDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727671781; c=relaxed/relaxed;
	bh=UD2DCO8YUlUfDsNi37YsXaQP4ORhuk+wrvj0M/8IxiE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UZ7Ut03xNsAHg6P1TpsjMx4JrUGxf9ca2lKc/x4W+Dh90XeuxPrfOiDigdCsWdOBeQBfVQCJTEwpXsf9kmTBCI3jHKhxJiZa5GGXcDENkTQ3q5p0tloDjk4N/DNzHMBCvr1TmS7sze9jZpt/MZnedT3B1AeLRGMAyRZI5mAsE7f3jSbRipNw49h+ufO8NceIOqCQ81kTk7SBaSk+PG5xVDFIrMxLlvyyDor7N0ioiSkNHGHKnUNbTPh2dEM6SZSdLMIREv4P1aB9yD23NM++BechAhElbQ33DKWSx1iGWsexr4bmgjAWxpbxae2TlnlHBZl+SN0MDp30t90sH0qjiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=dhBbApo8; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=dhBbApo8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XH7sK5qHRz2yK7
	for <openbmc@lists.ozlabs.org>; Mon, 30 Sep 2024 14:49:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727671781;
	bh=UD2DCO8YUlUfDsNi37YsXaQP4ORhuk+wrvj0M/8IxiE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dhBbApo884+w12iNss1QJd5QAyrd58r9xAbkl3VcUIhxURO4xEfXvf1oFpVozAvNb
	 zUjTGOkXN63SMoR/pNL2+xg6LIb7JVbHXIxEJwWBvHlnEzP3ZQG9Oq5Sn1IeE723bQ
	 q3RoA1lxjpAP/YV5BCr4ETg77LaSbeorCyU3LR8WlJsGFOONZKZdDRiIv9vKc5p8H+
	 r9iaoQNrBb8lxDtZt/uWtpC9UfX5nswuFtpGrsOYhb1DTsjVB4UR+3sO/jR3OL7Cmn
	 E+YtHGthPsfmLJXwZ3svLKshOlLZBYc200ApOMSYlwNAadL6K5GxWIowI6XX/wqkzU
	 FydY+CxFKlKxg==
Received: from [192.168.68.112] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C0A1B6511E;
	Mon, 30 Sep 2024 12:49:40 +0800 (AWST)
Message-ID: <a6c844509e9b8b7b38f40f1280d02e4e0e19d57f.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: nuvoton: Add UDC nodes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "William A. Kennington III" <william@wkennington.com>, Tomer Maimon
	 <tmaimon77@gmail.com>, Rob Herring <robh@kernel.org>
Date: Mon, 30 Sep 2024 14:19:39 +0930
In-Reply-To: <20240925093956.2449119-1-william@wkennington.com>
References: <20240925093956.2449119-1-william@wkennington.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2024-09-25 at 02:39 -0700, William A. Kennington III wrote:
> The driver support was already added but we are missing the nodes in our
> common devicetree. This enables npcm7xx platforms to enable the udc
> nodes and expose USB devices endpoints.
>=20
> Signed-off-by: William A. Kennington III <william@wkennington.com>

Tomer: I'll apply this for Joel to pick up if it looks good to you.

Thanks,

Andrew
