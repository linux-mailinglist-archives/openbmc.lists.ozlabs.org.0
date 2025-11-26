Return-Path: <openbmc+bounces-938-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE32C87938
	for <lists+openbmc@lfdr.de>; Wed, 26 Nov 2025 01:22:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGKyl67sfz304h;
	Wed, 26 Nov 2025 11:22:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764116575;
	cv=none; b=h7e1zdfJRvFSI7WwABPqgrpA1BIJbdnqrErym0F8rr9POU5bQ2SN4YqfbHFsQ81ke9J2PNxshoGDwQ+Uk7C5nDIJIFmC/+HOd7rqnfEUyDW4a3yeyPtvYW2xO6DKZ5w1Q3TVQ7WqbTjVy0I44u2Vsi/mU9/YEl1JSScYuHslZRAilSDT+hN/dyAKAPFrFSOLIpE5S0f+S5vskpwsUqA1lZk87XAdBeVuTRqVopTk2oIZC5Nbj5fTCVoiIIU/jyE91q+FSOaRWqHH227PARW3KHUgp5HoaRf/DhzKOuOlvUmDttwdR4enB0PAxW7mAMVB3jOdOxxS7475Se25PJS4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764116575; c=relaxed/relaxed;
	bh=a74Xg6fkualjUfvMajT3q1j5vLJwwgZGN28ZkfH5JFE=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YQ5Ae4wZHLzTr/GMlFnXKfbnN8fOsN1vz/IlZecPCoXTJz6c9UT5CKEv/tPARbOeLjrKfzH5h4HBWo8mJuDd3VGNegbmEmwayLroHSgutpW46ett+jDQlNF5cLE0LAnoveMs2qt7bbTgYFv3XOV7CMU63gKzFRbK6AmCI1UHs6swAvWbXo4ycbOUmpylxwkZ2LqLLWLRWm+41sYcvCikt90si1tdNAhcv8gj2Vrsb6edypiiDjCsBUORWz0NgRDWplB+x/zOlGWq98x4DA8BGqIO9/h9syEAVDOuqwrkAuDzefTiUmIRQq5TxXs0PgAZDr3y0enQnCeyIEBoxK2q/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=R2K5W13U; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=R2K5W13U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGKyk6SKzz301N
	for <openbmc@lists.ozlabs.org>; Wed, 26 Nov 2025 11:22:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1764116573;
	bh=a74Xg6fkualjUfvMajT3q1j5vLJwwgZGN28ZkfH5JFE=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=R2K5W13UcMwZ6yTTev3Y6LVu4SDFfJia9Os3uYeBMuwNFo7mCCRvNUAawMPKiaYHb
	 GcCQhYdZdLcVB96Do5qkIMoJhE+qwZXzYIaHJ4aBd0fNye07rh8xB5doSN4M/q5hkg
	 /qZWMneolVMJ6R6Znf/4iEt3UvqUyBlplmanWRuIanehX/SLEVQkqrtRE8FmkueYjS
	 WyZI6HNG2Sn+2XEbXG0OLx4d0++ePv8iWGh3qDS7s/pR3n0tuJ26wI5GkmouHwDhT/
	 07s4RcOl5e35/LOatmm42HVs8hFut2VZdkmPFgC/dXSQI6ANDO88wI2LENdBODzjHd
	 AMD4xK2TUsOoQ==
Received: from [192.168.68.115] (unknown [180.150.112.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4F87D64DF5;
	Wed, 26 Nov 2025 08:22:52 +0800 (AWST)
Message-ID: <127d5cd2b57bfd88402a27e5e03ac807d115c2cf.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot 0/2] aspeed: Add support for msx4
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>, joel@jms.id.au, 
	openbmc@lists.ozlabs.org
Date: Wed, 26 Nov 2025 10:52:51 +1030
In-Reply-To: <20251121-msx4-v1-0-fc0118b666c1@nvidia.com>
References: <20251121-msx4-v1-0-fc0118b666c1@nvidia.com>
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

On Fri, 2025-11-21 at 16:02 -0800, Marc Olberding wrote:
> Add a board file and dts for msx4. the board file is required
> as the BMC is strapped for ABR boot support, and this functionality
> isn't desired as support in linux is lacking.
>=20

Can you expand on this? What's missing?

>  In order to enable
> BMC boot reliably, a board file that disables the FMC_WDT2 is
> included.

Hmm. Can we do this without requiring a board file?


Andrew

