Return-Path: <openbmc+bounces-876-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13610C53C88
	for <lists+openbmc@lfdr.de>; Wed, 12 Nov 2025 18:49:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d69rl5JVxz2yv7;
	Thu, 13 Nov 2025 04:49:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762969767;
	cv=none; b=cVa8S2FGl6ZhK5pCpHfIN9gyRdfsOrExEXY1iD+xFl51bLYMkCyWc1Q6bjrVY/GC5tog0Q3i2PmSRB/1V5PL98nr+r0ylAxFdJ2XRFAo7/a2dNjs/NVCSLId0l/gzazFsv5A/Pq47D9ZPqIsuNiqV2Jq9m4aNlj1EkxNxtIJgA5ZFBtaw6ObS/8Qllo78o1jLJBTU5jzCY4Y1ogyk7pz09s617/ywDVsllE4d7tjiAp6SWUViJxbUCZpKFD2659alkhGkIzUk1kYp9q4tV8+NiiQRzWHxwyNd1NsY3q0WgIWHoUvK/ZGx6qCh6Fb2LCRlIBXWoT3DFntm7rL5J+IBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762969767; c=relaxed/relaxed;
	bh=mwtU70Cy49O/pIa3GDzWFPQYUVrM9gCUe3ErmW+AMdY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TLW1ypj1np1dHf8gM/def2yXATGIZFeO1VN65isuTRakYfZBVy2urbvYLgSQ0HIpfD5mD5ipSnWz2+6hPxuM8DGNLSclSS5aMpo6hkouftW55DhPXQlK0hkSOYXssaj7Zgx6bjv4q2JJrSFDSh3gpAMmFjrfJ/QfMgC8GskC/Nj3xggoFNXDWPS96fc927QvQBhrw4KPrkH4/h/iondHG5FQvfioBuLuRoiTSyWFPex5J8Tv9783+OqrAChe5vQb9SZlQY/J5bfh7itwCDvzBe6I+4yMlL75OsnYuS9gY01+Z26v+rOcqmC52wA6ibzCKgRNIjbtO+VW8lY4Om8iYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PzZ4hmIt; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PzZ4hmIt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d69rl0kpGz2yFT
	for <openbmc@lists.ozlabs.org>; Thu, 13 Nov 2025 04:49:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63C5742BA0;
	Wed, 12 Nov 2025 17:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EEC4C113D0;
	Wed, 12 Nov 2025 17:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762969764;
	bh=6vy0ElT/Q0TyjMx1ZDJ9J63lSlYEuag73UWY0ZaJ71M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PzZ4hmItEEPta7eH1rHr9//KQTJw84VoUQUd5m05JBz/dN8R5h59WxOKyx2Of+tlP
	 uL6uUlp/O67UIEqWe4gJ5npGt2G84hbxkwSyyr0WgH9XdCELBaVRcyw4CsV98e6eHF
	 3HJj9+Y8E1vLgMqsH2xzanocd8YQzGjhCqW1VkyZN4q5RxqUSnh+8GIbk/TaIehptT
	 kvmv40OZ5j9/q+enp2yURa5AewL44pyzin90v5bHRfycQxMpSwsEDXs7Su1sy0+COr
	 FCyS+EdV0tsDU+2XCx9sZXQzxjLeOFumV9/884zwyL3ydIAQJMfe3ceHduU1DbENYz
	 9hx/1Qm9+tIgg==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 avifishman70@gmail.com, tali.perry1@gmail.com, joel@jms.id.au, 
 venture@google.com, yuenn@google.com, benjaminfair@google.com, 
 andrew@codeconstruct.com.au, Tomer Maimon <tmaimon77@gmail.com>
Cc: openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251112150950.1680154-1-tmaimon77@gmail.com>
References: <20251112150950.1680154-1-tmaimon77@gmail.com>
Subject: Re: [PATCH v2] spi: dt-bindings: nuvoton,npcm-pspi: Convert to DT
 schema
Message-Id: <176296976083.48834.13469679974248275009.b4-ty@kernel.org>
Date: Wed, 12 Nov 2025 17:49:20 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-88d78
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 12 Nov 2025 17:09:50 +0200, Tomer Maimon wrote:
> Convert the Nuvoton NPCM PSPI binding to DT schema format.
> 
> Also update the binding to fix shortcoming:
>  * Drop clock-frequency property: it is never read in the NPCM PSPI
>    driver and has no effect.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: dt-bindings: nuvoton,npcm-pspi: Convert to DT schema
      commit: 1d562ba0aa7df81335bf96c02be77efe8d5bab87

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


