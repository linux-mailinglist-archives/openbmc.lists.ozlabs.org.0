Return-Path: <openbmc+bounces-1047-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B7BCC6FAF
	for <lists+openbmc@lfdr.de>; Wed, 17 Dec 2025 11:09:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWTzY1D9wz2ypm;
	Wed, 17 Dec 2025 21:09:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765966153;
	cv=none; b=Fl66sN3zwxPvWXb97QLfdorwMNOF4Yddh+STAA8fELxN9d2u6EQqLYEcCYhgKLjRyV/7NxJElxDogkqQ2sj9xMR+E3zs7vUdITSQa3eRvA4PyQ3lIpkorJJ2zOg6ZB40CJ4pC/gh4+0ExIth6sNZ5eJwofSJL/JZwxVZfUB9teOQB+zEQM/MCWzZp3uehik7pZk+zwTuezjx1VI7vdCJLfYXLEEIRKnZIxX7HDQKekBdMaxmx9mHGZoLkY2s+Ge3C86kaXQFsiTrN7aaZs/TtNvM0v51s8ATKH+BdV3ekO+/C7nWv1+OKyFFBbY+coYvacRNksWPUyc3ft5n5DqfqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765966153; c=relaxed/relaxed;
	bh=Sqyjw4dUjpV4zr1xHS0U3vPzCjV9G1Soe97AN69yRyY=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=VnekyvqOI4dsjK7j05wAQTSS+epwVayMiDTWs9jgebBfuaOeEszDNDW630SAtgXruFA8E52afNW1pldjaqDoGI24VYtahLY8z7HNBle+3SWgq6e6Wl3Yf/5Wd44fy3qck/Jhv3bWGaXIvDCVv9U57z6Vsy8VDNf/wVIafLzpgv7NZaw+LFIlCI0/HeeKuzYHW8TFVOc4IsjOB1k1Mw9x7IO4zxQataLkfocZXppZA74AQEC57A5KZoIlKd8BewuPMsw3eSJ3u++5L38He9+VJqCZqjkg5ZF6d5TLTJ6WnxuOlyLljLvRfQjDNntQ+FE3xnySCpCSCP2EHVCr3AS4/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=P8Bmw+zX; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=P8Bmw+zX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWTzX2bZnz2yng
	for <openbmc@lists.ozlabs.org>; Wed, 17 Dec 2025 21:09:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1765966150;
	bh=Sqyjw4dUjpV4zr1xHS0U3vPzCjV9G1Soe97AN69yRyY=;
	h=Subject:From:To:Cc:Date;
	b=P8Bmw+zX/zybrbiSE6qu3m6NwccFgIh91L3G08BXitfwHKWdlfuMC7V29p++XWDGj
	 OLhzowYiY2aV9TYJRP2cjsFbWdcRZMBHZyK//m+sojapgSE143hBayGerLKlUQ5Glb
	 7BroRzsPxKOuU4IhJepyQ853kCevvM5GVcRqPF4BsnKaD/dC86OKms6I0cLy3XV1WU
	 EBWerjrFYHLmQBqn4JqFzdDZ0oyuUIjhlms23Mk7Csf24scheCsxz8jXTdH+8ZOfue
	 Sl+3SYuCkEyeR6ObXwcuHFDTnppN90uZ5KlOlH7/GSU4mj9SJuRt6Mh+AFRJ/QcwAL
	 ImGIz2N2F/MFw==
Received: from [192.168.68.115] (unknown [180.150.112.216])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 736DC7DE46;
	Wed, 17 Dec 2025 18:09:08 +0800 (AWST)
Message-ID: <4ec04355da4aa5595297f31bdd190d4e2c1f4cb2.camel@codeconstruct.com.au>
Subject: openbmc/linux dev-6.18
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: openbmc <openbmc@lists.ozlabs.org>
Cc: Cosmo Chou <chou.cosmo@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
 Jeremy Kerr <jk@codeconstruct.com.au>, Leo Yang <Leo-Yang@quantatw.com>,
 Peter Yin	 <peteryin.openbmc@gmail.com>, "tomer.maimon"
 <tomer.maimon@nuvoton.com>,  Matt Johnston <matt@codeconstruct.com.au>, Tan
 Siewert <tan@siewert.io>
Date: Wed, 17 Dec 2025 20:39:07 +1030
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

Hi all,

Linux v6.18 is a new long-term stable release[1], and I've now pushed a
branch[2] and corresponding recipe patches[3] moving OpenBMC over to
it.

[1]: https://www.kernel.org/category/releases.html
[2]: https://github.com/openbmc/linux/tree/dev-6.18
[3]: https://gerrit.openbmc.org/q/topic:%22openbmc-linux-dev-6.18%22

The patch migration was done in two steps, first from v6.12 to v6.17,
and then from v6.17 to v6.18. The multi-step effort was mainly a means
to test my own process. If anyone's interested in what that looks like
I'm happy to talk through it with you.

The patches listed below were either dropped or modified, listed by
step.

Please test dev-6.18 on your platforms and report any issues.

Andrew

---

Dropped or modified migrating from v6.12 to v6.17:

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

Dropped or modified migrating from v6.17 to v6.18:

   Amit Sunil Dhamne (2):
         usb: typec: tcpm: unregister existing source caps before re-regist=
ration
         usb: typec: tcpm: fix use-after-free case in tcpm_register_source_=
caps
  =20
   Andrew Jeffery (2):
         ARM: dts: aspeed: Rework APB nodes
         Revert "ARM: dts: aspeed: Rework APB nodes"
  =20
   Greg Kroah-Hartman (1):
         usb: typec: fix up incorrectly backported "usb: typec: tcpm: unreg=
ister existing source caps before re-registration"
  =20
   Matt Johnston (1):
         mctp i3c: handle NULL header address
  =20
   Michael Grzeschik (1):
         usb: typec: tcpm: allow switching to mode accessory to mux properl=
y
  =20
   RD Babiera (1):
         usb: typec: tcpm: apply vbus before data bringup in tcpm_src_attac=
h
  =20
   Tan Siewert (1):
         ARM: dts: aspeed: e3c256d4i: convert NVMEM content to layout synta=
x
  =20
   Wensheng Wang (1):
         dt-bindings: hwmon: Add MPS mp2869,mp29608,mp29612,mp29816 and mp2=
9502
  =20

