Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 921A0925331
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2024 07:55:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BTFs9GKY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDTXP6kRWz3d4F
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2024 15:55:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=BTFs9GKY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDTWs5ndXz30Vk
	for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2024 15:55:05 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-145-155.adl-adc-lon-bras33.tpg.internode.on.net [118.210.145.155])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7D52920135;
	Wed,  3 Jul 2024 13:55:00 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719986100;
	bh=/uFK/hhS3MwpJh6WIQcOfj9DbVXYD4lAR+pAdODaiiM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=BTFs9GKYxVMEui+Pyop3BuLk0dVddPdk7pBR+/rolRlj99xNQr+2EngT5l6YTVWzt
	 XqWFWIM6laiSf90aSEdFA1GKqE+GJxR0joYRyCV9Rv1SLmzucwR9gAuINdBq4RLu7/
	 FUMjnVQJZUJe7VQIFqOZcE5K0WrCAvDhtNQHZf20FQbD3IUz6bHMrUWAmasL7zNZAg
	 YgEb4t8sNF3ES7vWPVZ2rPR5x3SD+yPxKnJFUk5nxd6GP3D4kWggsKymLGDmAsQ3OS
	 7d5q9Y1lP5yN2Yrk24HTbMSv63FTtczR2pDAczvlmNoOf5J55Y+syuTf5djOMguznh
	 C6XfcvtIsRLow==
Message-ID: <470f236ad674c11290861bbc2854ba4f2b48a33d.camel@codeconstruct.com.au>
Subject: Re: [linux dev-6.6 v2 0/2] Add Nuvoton NPCM SGPIO feature
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
Date: Wed, 03 Jul 2024 15:24:59 +0930
In-Reply-To: <20240701093135.1554762-1-tmaimon77@gmail.com>
References: <20240701093135.1554762-1-tmaimon77@gmail.com>
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

On Mon, 2024-07-01 at 12:31 +0300, Tomer Maimon wrote:
> This SGPIO controller is for NUVOTON NPCM7xx and NPCM8xx SoC.
> Nuvoton NPCM SGPIO module is combine serial to parallel IC (HC595)
> and parallel to serial IC (HC165), and use APB3 clock to control it.
> This interface has 4 pins  (D_out , D_in, S_CLK, LDSH).
> NPCM7xx/NPCM8xx have two sgpio module each module can support up
> to 64 output pins,and up to 64 input pin, the pin is only for GPI or GPO.
>=20
> The NPCM SGPIO patchset is upstream to Linux vanilla.

Thanks, I've applied these to openbmc/linux dev-6.6.

andrew
