Return-Path: <openbmc+bounces-905-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BC2C62982
	for <lists+openbmc@lfdr.de>; Mon, 17 Nov 2025 07:54:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d8z4K2vGgz2yv6;
	Mon, 17 Nov 2025 17:54:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763362449;
	cv=none; b=G0IU0/SbccrFih/09yXhEH8DSfMfvKT+lE7C2qRalr59UIR7keiPCdbbD1BM7a8sXM8K81prLAYbldSwGJ6KJLuprxY0RYw9e40o7EwG9y0sCUTY39wTJgap5Xrv2fUgYJOGWU2c8x4Poi9cA/x9JKePg06H2VSRozYDqSOCowe530otjRbjoeUiVgZcS59CYzmINa3snyGxTcAJbEMifpPhdlQFODTOj6hajzflMFpYb0WsvOLqfsWTWI7jZR6mJwVzAzl+ArsCqXCxTURv+6phnj7PyBqNogwCo28FdR12kRd3tuh6jQMiW+Zfbhut3ITm8xRRTSY+BM3PV+6Grw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763362449; c=relaxed/relaxed;
	bh=BsR5lVyygVCpUMEM5x+cFAv1MD7fVQHKyDa2lkaoAlI=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=M3ge7FCWG8BpmO71mVtgsnS9NSprUfDOvL1ev+Dx9ug2EYXk/6hIw7Pbg1XssAyei2mQOpN2HLMi/DqqmqzjfIqw11bOYDH4NxRNOPALf+fHi7PuOOJyXMTMhhtLsaGuMdEbXHQ2nu4zoD+CtzZiwYNLG1k9TfkTKmNX7PI4SI8HQNhy6PxMfYKq8k7tzirBOujmPS40zZmBsW9/9cwXkmz9qE7+kYyBMYW9LQ8IU0ropTkHa+8KlIeIMupLtrT1BR6lia453uP32CEoIlomdg4gnghFPsRnldnAN8yzrgLXkaoQT7TuduVc06hSjmOHM7bFTdATPAVTRdFuTTZVSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bcxh7hAS; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bcxh7hAS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d8z4J0rf7z2ynC
	for <openbmc@lists.ozlabs.org>; Mon, 17 Nov 2025 17:54:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763362446;
	bh=BsR5lVyygVCpUMEM5x+cFAv1MD7fVQHKyDa2lkaoAlI=;
	h=Subject:From:To:Cc:Date;
	b=bcxh7hAS37bzQcqTXcws3WT3z4QjAibtfd+dHxoKPRyEGtVpPcUjFU753imkTXNk6
	 hgK1ExgGhdswebWuXGAWQqnDQxnb66xeGKoTTfsxdDh9zOZcykzsMpmKKYv0KjTxbY
	 DC2i6+ClPwoYM6w5tFXS2rxU6QtO8y7Nu6qZ7rWWIgEMRogCODalW5sgW0eCzkE8H9
	 6UG+DCQsTXlBWOUsC/MBww1XdERVp/1HNXPJAPcUO69pH31vxgX1yMGkkyrD9bHoCx
	 1MllWaFb3kOL87EcArtNN6Cgi5V4XHfOHuoNugEepqwzJlSyXsQwe78/RHNhoDQISf
	 9I15zniws7T2A==
Received: from [192.168.68.115] (unknown [180.150.112.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1BE4B6477A;
	Mon, 17 Nov 2025 14:54:05 +0800 (AWST)
Message-ID: <93dc30c9e93d5d99dc75f0bce87459bf03755064.camel@codeconstruct.com.au>
Subject: Experimental openbmc/linux dev-6.17 branch
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: openbmc <openbmc@lists.ozlabs.org>
Cc: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Nov 2025 17:24:04 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
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

Hi everyone,

Just a quick note that I've put together an experimental dev-6.17
branch and pushed it to openbmc/linux. This is largely in preparation
for the next LTS release, whenever that comes.

At the time of this email I haven't done any further integration work.
However, for the record, here are the patches that were changed or
dropped with respect to dev-6.12:

   Amit Sunil Dhamne (1):
         usb: typec: tcpm: Add support for parsing pd-revision DT property
  =20
   Andrew Jeffery (2):
         soc: aspeed: lpc-snoop: Rearrange channel paths
         soc: aspeed: lpc-snoop: Lift channel config to const structs
  =20
   Breno Leitao (1):
         Revert "x86/bugs: Make spectre user default depend on MITIGATION_S=
PECTRE_V2" on v6.6 and older
  =20
   Cosmo Chou (1):
         dt-bindings: trivial-devices: add mps,mp5998
  =20
   Eddie James (3):
         leds: pca955x: Optimize probe led selection
         leds: pca955x: Add HW blink support
         leds: Ensure hardware blinking turns off when requested
  =20
   Jeremy Kerr (2):
         net: mctp: Add MCTP USB transport driver
         net: mctp: separate routing database from routing operations
  =20
   Leo Yang (1):
         hwmon: Add driver for TI INA233 Current and Power Monitor
  =20
   Peter Yin (1):
         dt-bindings: trivial-devices: add isil,isl69260
  =20
   Tomer Maimon (2):
         reset: npcm: register npcm8xx clock auxiliary bus device
         clk: npcm8xx: add clock controller
  =20
   Wensheng Wang (1):
         dt-bindings: hwmon: Add MPS mp2869,mp29608,mp29612,mp29816 and mp2=
9502

Cheers,

Andrew

