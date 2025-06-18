Return-Path: <openbmc+bounces-249-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD506ADF27F
	for <lists+openbmc@lfdr.de>; Wed, 18 Jun 2025 18:22:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMpsf5sRzz2yKq;
	Thu, 19 Jun 2025 02:21:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750263717;
	cv=none; b=Hu6WX82s6CqQQEwKExMnia3/wYwdR2eYW8cZK/8h6w7ZBYenGjS6UqKoGrAFziLCo3EN/jj1ELmajoustLzE1eKETHl62SNOwmn8zl4pXqTxHi0MnJiJde0zF1iWWvE7OtjJOpogLTupNIalWxt7Pp2pX20Dchl8kP9aqQZTgaXestEC5V9jgtbJtffsfXegwV8C3q0ZPvriX8i4I3M4GG2yBtXbm5aGP9XzmBakDRD3RxAVtXd+pmqsuYz34OEAMWB58QkMwOaX+oxsYDrGs/nOysAR/9gJVYQEN6LegY4+zGTw/OitWUI4iUl0Y8aEdTWZyfREGi7c8hE6tOIKxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750263717; c=relaxed/relaxed;
	bh=520r5xNqLMTWFWOk16KTDmwIiJyJ6+G8wZQQxP1Uhuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L5L1xBJhwmnuDbUYYspe521NdDz0y4GucAfLDRoggEzJdVYhCbChfVs5SevuHtAtSgqkDYmdy/0Tve+tzMmVcGlfhY9Naf1B7F5UyA2bMxWVeoOTkbh3GLSmCCEnZCHVxkLBKZbUo6on8DtYhJ4wM/wnk/iYRdvkqInxoE41POWVLfu9dZYt+F/Uqvg+3FrmUyX7osgKfIJ35hp5u9A7ZDqEdmkjMh/uGOnAj7u5hMjhpU3UvFdv9Qqw9P2xiK9viPAPXPC22qGAFo9swUHAeH2BJ8MEtQlTICc7RfPIYv28Xa/JwOzRUrZHuwCYlA8vhL8tGSBIqCrWyeHFw1hl9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KQdZttsJ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KQdZttsJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMpsc0XWlz2xS0
	for <openbmc@lists.ozlabs.org>; Thu, 19 Jun 2025 02:21:55 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C5975C050D;
	Wed, 18 Jun 2025 16:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B415C4CEE7;
	Wed, 18 Jun 2025 16:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750263713;
	bh=xUvKBSuldPOnigx+hzuZCqKejVt7Z9jxo9NrGXELnA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQdZttsJukv/4wM4VVc7sFVswFh08WCU5NMTrU82y3RhOVfKRy2zj8lwZbwzcn8r4
	 3ta46oUnWfG8W8n+swtTtTbNd4tEPqvF703KPhTpH8Xj8XkJs7N6lXnZu1C/pSU4mi
	 f1CvBdnRB8T9PdysOJvF6dRddUoUwxdxgLSTKOItoNAj5HgxIffGmENKq5gpT6O+zO
	 1RmMfk5rYRcNHgYK8MrVD1OpCquIu2x5uSkd3GWRuxpf+1FABLE9poLkyoQstVIEaL
	 Jbt38/5IWld0vMwPCqCzfBCU5kQYhfzYxY4ubWek2Vma26WqZd21HO1Kx6z5a8bZ9Y
	 sxpDM7vhvVNyA==
Date: Wed, 18 Jun 2025 17:21:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org,
	linux-omap@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 01/12] gpio: mmio: use new GPIO line value setter
 callbacks
Message-ID: <95f63f24-2c8f-4f0b-89a9-ddf39a8f2e12@sirena.org.uk>
References: <20250610-gpiochip-set-rv-gpio-v1-0-3a9a3c1472ff@linaro.org>
 <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Se8mI+hslVIXz9hL"
Content-Disposition: inline
In-Reply-To: <20250610-gpiochip-set-rv-gpio-v1-1-3a9a3c1472ff@linaro.org>
X-Cookie: Drop in any mailbox.
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--Se8mI+hslVIXz9hL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 02:33:11PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.

I'm seeing boot failures on a UDOOq (an i.MX6 based board) in -next
today which bisect to this patch (in -next as b908d35d0003cc7).  We get
a NULL pointer dereference during boot while probing the poweroff driver
for the system:

[    0.443319] Unable to handle kernel NULL pointer dereference at virtual =
address 00000000 when execute
[    0.443330] [00000000] *pgd=3D00000000
[    0.443347] Internal error: Oops: 80000005 [#2] SMP ARM

=2E..

[    2.522761]  bgpio_dir_out_val_first from gpiod_direction_output_raw_com=
mit+0x194/0x390
[    2.533330]  gpiod_direction_output_raw_commit from gpiod_find_and_reque=
st+0x134/0x434
[    2.541276]  gpiod_find_and_request from gpiod_get_index+0x58/0x70
[    2.547482]  gpiod_get_index from devm_gpiod_get_index+0x10/0x78
[    2.553516]  devm_gpiod_get_index from gpio_poweroff_probe+0xe8/0x174
[    2.559990]  gpio_poweroff_probe from platform_probe+0x5c/0xb4

Full boot log:

    https://lava.sirena.org.uk/scheduler/job/1485011#L752

bisect log:

# bad: [6e5ab6fee68df8c40b338baeae6e269fa25a7e25] Add linux-next specific f=
iles for 20250618
# good: [94466168a05ed9aa92afdd54efcd89b3b227650d] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [3e1c01d06e1f52f78fe00ef26a9cf80dbb0a3115] regulator: rpi-panel-v2:=
 Add shutdown hook
# good: [d9f38d9824bfb1b046d2e720349d2f45959ab184] ASoC: tegra: AHUB: Remov=
e unneeded semicolon
# good: [dce4bc30f42d313b4dc5832316196411b7f07ad0] spi: spi-fsl-dspi: Rever=
t unintended dependency change in config SPI_FSL_DSPI
# good: [47972c1c3315672352f25c68f91dd88543541947] ASoC: Intel: Replace dep=
recated strcpy() with strscpy()
# good: [5eb8a0d7733d4cd32a776acf1d1aa1c7c01c8a14] ASoC: hdmi-codec: use SN=
D_JACK_AVOUT as jack status
# good: [bb8d8ba4715cb8f997d63d90ba935f6073595df5] ASoC: mediatek: mt8183-a=
fe-pcm: use local `dev` pointer in driver callbacks
# good: [8a5a5cecb79058b608e5562d8998123a3adb313c] ASoC: tas2781: Move the =
"include linux/debugfs.h" into tas2781.h
# good: [a4eb71ff98c4792f441f108910bd829da7a04092] regulator: rpi-panel-v2:=
 Fix missing OF dependency
# good: [6cafcc53eb5fffd9b9bdfde700bb9bad21e98ed3] spi: spi-mt65xx: Add sup=
port for MT6991 Dimensity 9400 SPI IPM
# good: [7e10d7242ea8a5947878880b912ffa5806520705] ASoC: ops: dynamically a=
llocate struct snd_ctl_elem_value
# good: [d6fa0ca959db8efd4462d7beef4bdc5568640fd0] regulator: rpi-panel-v2:=
 Add missing GPIOLIB dependency
# good: [d49305862fdc4d9ff1b1093b4ed7d8e0cb9971b4] regulator: rpi-panel-v2:=
 Add regulator for 7" Raspberry Pi 720x1280
# good: [6ba68e5aa9d5d15c8877a655db279fcfc0b38b04] ASoC: renesas: msiof: Co=
nvert to <linux/spi/sh_msiof.h>
# good: [1f5cdb6ab45e1c06ae0953609acbb52f8946b3e8] ASoC: codecs: Add suppor=
t for Richtek RTQ9124
# good: [c459262159f39e6e6336797feb975799344b749b] spi: spi-pci1xxxx: Add s=
upport for 25MHz Clock frequency in C0
# good: [548d770c330cd1027549947a6ea899c56b5bc4e4] regulator: pca9450: Add =
support for mode operations
# good: [03b778d1994827ea5cc971dbdfbb457bbb7bfa5d] ASOC: rockchip: Use help=
er function devm_clk_get_enabled()
# good: [267be32b0a7b70cc777f8a46f0904c92c0521d89] ASoC: remove component->=
id
# good: [111a2c8ab462d77d1519b71b46f13ae1b46920b4] ASoC: imx-card: Use help=
er function for_each_child_of_node_scoped()
# good: [f6f914893d478b7ba08e5c375de1ced16deb5e92] ASoC: dt-bindings: tas57=
xx: add tas5753 compatibility
# good: [9a30e332c36c52e92e5316b4a012d45284dedeb5] spi: spi-fsl-dspi: Enabl=
e support for S32G platforms
# good: [c95e925daa434ee1a40a86aec6476ce588e4bd77] ASoC: Intel: avs: Add rt=
5640 machine board
# good: [c8c4694ede7ed42d8d4db0e8927dea9839a3e248] regmap: kunit: Constify =
regmap_range_cfg array
# good: [e6e8897995a9e6028563ce36c27877e5478c8571] ASoC: qcom: sm8250: Add =
Fairphone 5 soundcard compatible
# good: [b9ecde0bcf6a99a3ff08496d4ba90a385ebbfd68] ASoC: codecs: wcd939x: A=
dd VDD_PX supply
# good: [ac209bde018fd320b79976657a44c23113181af6] ASoC: tas2781: Drop the =
unnecessary symbol imply
# good: [ece5d881004f041c2e1493436409dbcbea3ad5f8] ASoC: codecs: wcd939x: D=
rop unused 'struct wcd939x_priv' fields
# good: [7e17e80c3a7eb2734795f66ba946f933412d597f] Merge branch 'for-6.14/s=
tack-order' into for-next
git bisect start '6e5ab6fee68df8c40b338baeae6e269fa25a7e25' '94466168a05ed9=
aa92afdd54efcd89b3b227650d' '3e1c01d06e1f52f78fe00ef26a9cf80dbb0a3115' 'd9f=
38d9824bfb1b046d2e720349d2f45959ab184' 'dce4bc30f42d313b4dc5832316196411b7f=
07ad0' '47972c1c3315672352f25c68f91dd88543541947' '5eb8a0d7733d4cd32a776acf=
1d1aa1c7c01c8a14' 'bb8d8ba4715cb8f997d63d90ba935f6073595df5' '8a5a5cecb7905=
8b608e5562d8998123a3adb313c' 'a4eb71ff98c4792f441f108910bd829da7a04092' '6c=
afcc53eb5fffd9b9bdfde700bb9bad21e98ed3' '7e10d7242ea8a5947878880b912ffa5806=
520705' 'd6fa0ca959db8efd4462d7beef4bdc5568640fd0' 'd49305862fdc4d9ff1b1093=
b4ed7d8e0cb9971b4' '6ba68e5aa9d5d15c8877a655db279fcfc0b38b04' '1f5cdb6ab45e=
1c06ae0953609acbb52f8946b3e8' 'c459262159f39e6e6336797feb975799344b749b' '5=
48d770c330cd1027549947a6ea899c56b5bc4e4' '03b778d1994827ea5cc971dbdfbb457bb=
b7bfa5d' '267be32b0a7b70cc777f8a46f0904c92c0521d89' '111a2c8ab462d77d1519b7=
1b46f13ae1b46920b4' 'f6f914893d478b7ba08e5c375de1ced16deb5e92' '9a30e332c36=
c52e92e5316b4a012d45284dedeb5' 'c95e925daa434ee1a40a86aec6476ce588e4bd77' '=
c8c4694ede7ed42d8d4db0e8927dea9839a3e248' 'e6e8897995a9e6028563ce36c27877e5=
478c8571' 'b9ecde0bcf6a99a3ff08496d4ba90a385ebbfd68' 'ac209bde018fd320b7997=
6657a44c23113181af6' 'ece5d881004f041c2e1493436409dbcbea3ad5f8' '7e17e80c3a=
7eb2734795f66ba946f933412d597f'
# test job: [3e1c01d06e1f52f78fe00ef26a9cf80dbb0a3115] https://lava.sirena.=
org.uk/scheduler/job/1481662
# test job: [d9f38d9824bfb1b046d2e720349d2f45959ab184] https://lava.sirena.=
org.uk/scheduler/job/1481666
# test job: [dce4bc30f42d313b4dc5832316196411b7f07ad0] https://lava.sirena.=
org.uk/scheduler/job/1479434
# test job: [47972c1c3315672352f25c68f91dd88543541947] https://lava.sirena.=
org.uk/scheduler/job/1479486
# test job: [5eb8a0d7733d4cd32a776acf1d1aa1c7c01c8a14] https://lava.sirena.=
org.uk/scheduler/job/1474632
# test job: [bb8d8ba4715cb8f997d63d90ba935f6073595df5] https://lava.sirena.=
org.uk/scheduler/job/1472186
# test job: [8a5a5cecb79058b608e5562d8998123a3adb313c] https://lava.sirena.=
org.uk/scheduler/job/1471943
# test job: [a4eb71ff98c4792f441f108910bd829da7a04092] https://lava.sirena.=
org.uk/scheduler/job/1469028
# test job: [6cafcc53eb5fffd9b9bdfde700bb9bad21e98ed3] https://lava.sirena.=
org.uk/scheduler/job/1469031
# test job: [7e10d7242ea8a5947878880b912ffa5806520705] https://lava.sirena.=
org.uk/scheduler/job/1466093
# test job: [d6fa0ca959db8efd4462d7beef4bdc5568640fd0] https://lava.sirena.=
org.uk/scheduler/job/1464729
# test job: [d49305862fdc4d9ff1b1093b4ed7d8e0cb9971b4] https://lava.sirena.=
org.uk/scheduler/job/1463110
# test job: [6ba68e5aa9d5d15c8877a655db279fcfc0b38b04] https://lava.sirena.=
org.uk/scheduler/job/1463434
# test job: [1f5cdb6ab45e1c06ae0953609acbb52f8946b3e8] https://lava.sirena.=
org.uk/scheduler/job/1463022
# test job: [c459262159f39e6e6336797feb975799344b749b] https://lava.sirena.=
org.uk/scheduler/job/1461222
# test job: [548d770c330cd1027549947a6ea899c56b5bc4e4] https://lava.sirena.=
org.uk/scheduler/job/1460610
# test job: [03b778d1994827ea5cc971dbdfbb457bbb7bfa5d] https://lava.sirena.=
org.uk/scheduler/job/1461219
# test job: [267be32b0a7b70cc777f8a46f0904c92c0521d89] https://lava.sirena.=
org.uk/scheduler/job/1461158
# test job: [111a2c8ab462d77d1519b71b46f13ae1b46920b4] https://lava.sirena.=
org.uk/scheduler/job/1459889
# test job: [f6f914893d478b7ba08e5c375de1ced16deb5e92] https://lava.sirena.=
org.uk/scheduler/job/1460442
# test job: [9a30e332c36c52e92e5316b4a012d45284dedeb5] https://lava.sirena.=
org.uk/scheduler/job/1460919
# test job: [c95e925daa434ee1a40a86aec6476ce588e4bd77] https://lava.sirena.=
org.uk/scheduler/job/1461120
# test job: [c8c4694ede7ed42d8d4db0e8927dea9839a3e248] https://lava.sirena.=
org.uk/scheduler/job/1460230
# test job: [e6e8897995a9e6028563ce36c27877e5478c8571] https://lava.sirena.=
org.uk/scheduler/job/1460605
# test job: [b9ecde0bcf6a99a3ff08496d4ba90a385ebbfd68] https://lava.sirena.=
org.uk/scheduler/job/1460221
# test job: [ac209bde018fd320b79976657a44c23113181af6] https://lava.sirena.=
org.uk/scheduler/job/1460665
# test job: [ece5d881004f041c2e1493436409dbcbea3ad5f8] https://lava.sirena.=
org.uk/scheduler/job/1461108
# test job: [7e17e80c3a7eb2734795f66ba946f933412d597f] https://lava.sirena.=
org.uk/scheduler/job/1127031
# test job: [6e5ab6fee68df8c40b338baeae6e269fa25a7e25] https://lava.sirena.=
org.uk/scheduler/job/1485029
# bad: [6e5ab6fee68df8c40b338baeae6e269fa25a7e25] Add linux-next specific f=
iles for 20250618
git bisect bad 6e5ab6fee68df8c40b338baeae6e269fa25a7e25
# test job: [5f792b60601e6bf7a9fb037edfc565c3aae4c12d] https://lava.sirena.=
org.uk/scheduler/job/1485099
# good: [5f792b60601e6bf7a9fb037edfc565c3aae4c12d] Merge branch 'master' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git
git bisect good 5f792b60601e6bf7a9fb037edfc565c3aae4c12d
# test job: [4753f57fb1c41066519ab573a011801bf0553cbc] https://lava.sirena.=
org.uk/scheduler/job/1485186
# good: [4753f57fb1c41066519ab573a011801bf0553cbc] Merge branch 'drm-xe-nex=
t' of https://gitlab.freedesktop.org/drm/xe/kernel
git bisect good 4753f57fb1c41066519ab573a011801bf0553cbc
# test job: [b8dcd86b8eadb53eb153ba69434d93f954f4e2d8] https://lava.sirena.=
org.uk/scheduler/job/1485312
# good: [b8dcd86b8eadb53eb153ba69434d93f954f4e2d8] Merge branch 'driver-cor=
e-next' of git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver=
-core.git
git bisect good b8dcd86b8eadb53eb153ba69434d93f954f4e2d8
# test job: [86f5e3b87e543714db4274eaaac4fe877e1943b3] https://lava.sirena.=
org.uk/scheduler/job/1485356
# good: [86f5e3b87e543714db4274eaaac4fe877e1943b3] Merge branch 'for-next' =
of git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
git bisect good 86f5e3b87e543714db4274eaaac4fe877e1943b3
# test job: [6f73eec838ac00ec82b6808bf458cfead784cf21] https://lava.sirena.=
org.uk/scheduler/job/1485541
# bad: [6f73eec838ac00ec82b6808bf458cfead784cf21] Merge branch 'mhi-next' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git
git bisect bad 6f73eec838ac00ec82b6808bf458cfead784cf21
# test job: [3cbc2e700ace888f02a6059c9f865ef1a0743c29] https://lava.sirena.=
org.uk/scheduler/job/1485816
# bad: [3cbc2e700ace888f02a6059c9f865ef1a0743c29] Merge branch 'for-next' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git
git bisect bad 3cbc2e700ace888f02a6059c9f865ef1a0743c29
# test job: [aaec273c7b511a7826df09123a1fd6e4896c1bfd] https://lava.sirena.=
org.uk/scheduler/job/1486062
# bad: [aaec273c7b511a7826df09123a1fd6e4896c1bfd] gpio: nomadik: use new GP=
IO line value setter callbacks
git bisect bad aaec273c7b511a7826df09123a1fd6e4896c1bfd
# test job: [7b2c2f1eb3914f5214a5b2ae966d7d7bb0057582] https://lava.sirena.=
org.uk/scheduler/job/1486129
# good: [7b2c2f1eb3914f5214a5b2ae966d7d7bb0057582] gpio: Use dev_fwnode() w=
here applicable across drivers
git bisect good 7b2c2f1eb3914f5214a5b2ae966d7d7bb0057582
# test job: [d27746181905c256eced857f4b2c051ac44b0b45] https://lava.sirena.=
org.uk/scheduler/job/1486292
# bad: [d27746181905c256eced857f4b2c051ac44b0b45] gpio: mm-lantiq: use new =
GPIO line value setter callbacks
git bisect bad d27746181905c256eced857f4b2c051ac44b0b45
# test job: [367864935785382bab95f5e5a691535d28f5a21b] https://lava.sirena.=
org.uk/scheduler/job/1486339
# good: [367864935785382bab95f5e5a691535d28f5a21b] gpio: raspberrypi-exp: u=
se new GPIO line value setter callbacks
git bisect good 367864935785382bab95f5e5a691535d28f5a21b
# test job: [b908d35d0003cc75d4ebf7c24a61b07d34e7f5dc] https://lava.sirena.=
org.uk/scheduler/job/1486428
# bad: [b908d35d0003cc75d4ebf7c24a61b07d34e7f5dc] gpio: mmio: use new GPIO =
line value setter callbacks
git bisect bad b908d35d0003cc75d4ebf7c24a61b07d34e7f5dc
# test job: [d03b53c9139352b744ed007bf562bd35517bacff] https://lava.sirena.=
org.uk/scheduler/job/1486540
# good: [d03b53c9139352b744ed007bf562bd35517bacff] dt-bindings: gpio: gpio-=
xilinx: Mark clocks as required property
git bisect good d03b53c9139352b744ed007bf562bd35517bacff
# first bad commit: [b908d35d0003cc75d4ebf7c24a61b07d34e7f5dc] gpio: mmio: =
use new GPIO line value setter callbacks

--Se8mI+hslVIXz9hL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhS55kACgkQJNaLcl1U
h9CCdQf/TV2SaIkrUe80F2DZ/ZGbfMB7TRbBSIV18Kcyl8fnkBewFWPBDpB3zg21
rkwcXN5K+9gWUI9JOL8jaF7BcguP4pA9sKcTu+lKul1OOiLmEo79fBbdtyeka8NQ
khnfCcHHcUl1Dus3jVix/U3nUNq1YK8DgQlcwiJ8DstgaurRMWUZoqvnwCSeK/MM
/pjget8Y/SDvbxDEBCUD4MfkndJav6npWepBzIJgHmiuuPGBx3kGswoSec84WIUR
zC3eozsLnM57sqs49oRFMJdXKVEz2L4wPJbq+ZdTRRKNDTfg0QMWbYON74f7Gotm
0HW7SzGU1lngH1koTwUyBP15z9WRhQ==
=4SES
-----END PGP SIGNATURE-----

--Se8mI+hslVIXz9hL--

