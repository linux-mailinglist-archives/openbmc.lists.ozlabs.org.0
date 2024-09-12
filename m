Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E5B975FF5
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 06:18:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X441w4Ct3z3c9k
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 14:18:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726114721;
	cv=none; b=bqQNsAmL+kFdh++7UfzBHjSaIrSmCy/NpY14+rcJdM7yc4ilX6gVMqS6puLR9evFLECL+ADc6NqvOTScaJ+uKD6fAw4T4T2uQZlWbaGOEYl5Lqk1IZK+7RegGIio3MgJUGbUDPObg6fb1sYMFKQiq4S7rBEBRST8Kykmt719URz9nI8j0cBWOS+HwiIUvSFfZm0rxFZtO2V2FxnP+Lz2V+NoZKftyid7SVOwYCbQ85GNJapEMDjbaqWlg5dtPNgrqXKOoDOZTcdbTtwjlBFz4SZuUwMzDjZjY8aNXNi7aD9hGT5dRHNIb9gLHfHBoa9ZIdMb9FHJKfLotoPr15Ak0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726114721; c=relaxed/relaxed;
	bh=gCm97Psx/IRlwR8m9k57ef7fiGUsvCssu78ckJQ0cOM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CNkmKa3tMtUWwxn0470+wH6U+fSANx5KbOArVLSK3X50Xbs/nt2rCh+WiveQQ9ynXEj1D3YJuICD70uZqLvpBAT7W5udqoStnxtlzIFcBSN0HWbdc7u+KU3Hy5ZHfxrhTSvDTT30eWoe44qTtzYgJvSM7PImgOS1/wrl2hoIbS28siXuCwTgf8t7fgIgIAgW1+bMJJeQiq1XACsuX4oy7LhTzwnkJ2VVEQudMQqzS/wQm+oooWLsjTxIoP5sjSHL7M53FHevKqroKaPVrfP7fNQr4g6xH76BfJG/d0ooxh25MaHFvhyBExAAHtNNwMgwuLHqXMGzl5AQns/Cje4ffg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=c6xIN9Sx; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=c6xIN9Sx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X441s5Y3Jz2xlF
	for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2024 14:18:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726114719;
	bh=gCm97Psx/IRlwR8m9k57ef7fiGUsvCssu78ckJQ0cOM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=c6xIN9Sx2kJ9iYcVpWNKbVD4ihioQ+w5UAH8HLq4IO9kSikOj2ARhsUkSC4JTDMhS
	 SeTLRFQnwVBJ5euyP26MveY6DA26puDj/HOC3Y1x1xjtW0QW8x65QxcpNaNcFg/9th
	 UUsS5xjnhy6lI3NG7MiBOavRSCXeujYdL2Avt8TVu5WjPu2OlZfjpY5StE5bQUZ/ft
	 rDvo4x72NlQ+TDVobJju7yrN08cNE5tXmJxqLSgrPnn8Q2V8sZrzNblTfnxuZa0rnm
	 e+K2dUX1rmV59TjqAw0VWjWTWg7EwMKcaFKCBx9BUIjhKGAx6bTcRAcGjecQZAaucx
	 GGaLxOPV3BPFQ==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ED344650D6;
	Thu, 12 Sep 2024 12:18:37 +0800 (AWST)
Message-ID: <b5fa52d4707a15a137aaa9ea998a588f71d6d71a.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v4 0/3] Add NPCM8XX clock driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
Date: Thu, 12 Sep 2024 13:48:37 +0930
In-Reply-To: <20240828131029.3720213-1-tmaimon77@gmail.com>
References: <20240828131029.3720213-1-tmaimon77@gmail.com>
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
Cc: Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2024-08-28 at 16:10 +0300, Tomer Maimon wrote:
> This patchset adds clock support for the Nuvoton
> Arbel NPCM8XX Board Management controller (BMC) SoC family.
>=20
> The NPCM8xx clock controller is created using the auxiliary device framew=
ork
> and set up in the npcm reset driver since the NPCM8xx clock is using the
> same register region.
>=20
> This patchset based on NPCM8xx clock controller V27
> https://patchwork.kernel.org/project/linux-clk/cover/20240815150255.39962=
58-1-tmaimon77@gmail.com/
>=20
> This patchset was tested on the Arbel NPCM8XX evaluation board.
>=20
> Changes since version 3:
>  - Fixed exceed line length.

I've applied your v3 backport to align with Stephen's tag on v27
upstream. There were conflicts from trying to apply the upstream
patches directly, but I've inspected the delta and it wasn't anything
concerning.

Thanks.

Andrew


