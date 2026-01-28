Return-Path: <openbmc+bounces-1291-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPiaN9sJemkK2AEAu9opvQ
	(envelope-from <openbmc+bounces-1291-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Wed, 28 Jan 2026 14:06:35 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B87A2A1CF5
	for <lists+openbmc@lfdr.de>; Wed, 28 Jan 2026 14:06:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1Mwl2YQyz2xm3;
	Thu, 29 Jan 2026 00:06:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769605591;
	cv=none; b=Y/SZiUJMUn+gT1C40/nf7QGIpaBgiLaKl/ImZZVObVgdpeAFPgzO5dC4Q4yJvcYHI8PZDphMS21Y4WkI0Ld4im0TRfglVErPTKo3GRsYzk47icMVAEux8IXsuWB5qTe8QnyX3W/AA52dV/IWapHBq+BOGQ7jQU3FNzI1/8Lhl3/covlQOHpXkmLmcu2Jou99DvjcNVjUvD3zUl92W8sY+4rZDw9dLVchXjLBU3V962zFl+mCFFW6CeZObxXd98tBGjydnhIZY3YyXehiZ07Bo8YZ223UU9AbYLNz0U98aYO67sWoPTThCiPGZ/7LrQea8NpWNv2n1jac5VOt/SHGjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769605591; c=relaxed/relaxed;
	bh=97x7WwgT6x+N33UvCKr23GCP4mZ80klZJKZvCsojamY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ztjm6jhCTtMONc1oMSPzKuW7jx+BMh2IqasWvN9oirAQbYfxXyaYWWpcyw1l58Sq47GCSBQcbZTXl60YUVnVmAAMiDW4WLPAjqpakK3TkCsifMKeFdKL8ZGE4iWFWiPxMLDkhjtOWPNJRjwKkig0klNVUygW2ZLSpzWf+mFwi8ig58b2iU0dTt5BsAZYXBoc3mcx4V85qsYAFxF4qZ3nB2SCCk7b1j4qyzzyy0/Bnjvd4/pFmnu+oDWBKS40ZH/dbtdck7F+JTA8yaY2uPvzJMI5Q5FOO/hNPHK9zfykiwC8Nc9IXzPMZKd2ZhFof0gvKPaudBhlpzzmgR75NHtmMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MCsYeive; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MCsYeive;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1Mwk2HtKz2xjK;
	Thu, 29 Jan 2026 00:06:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C1D043703;
	Wed, 28 Jan 2026 13:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FC1C4CEF1;
	Wed, 28 Jan 2026 13:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769605588;
	bh=r1fZSr0IvTlpuB5HuW79n7uRT9PQV/E04hDgpki1sK4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=MCsYeiveMYPiB7ZQExQ9ogtkxyQWW3eRgEK86jrT+0LHPiEqT1AtRnyk2UbQ/9ip/
	 DAneno7wnREaFR8NlvLUh0VLtAGxu97Pxe8Docd99OuI9vdQfq78xTRLEwbTp18cWo
	 36kbAW6nCjAv49rcJS0/QhnlnhMKf6/GVCLX+hKGMiZOiF+bwlNMHwvhhd6lxP/YMM
	 5D7tVIGEs3B6QI+2q2VN2/q5Y2OBajeP+zdYZV6CU6dY5jlGXfhaCLrsXv+ZiFPnqi
	 hQcVMqc/qZhnv1ZUv6/3q/8arNGjjIyBXHS9RYx/ZB39v2LhA0Abdk/9x5PZlelNTE
	 lRMtuIXj5NEPQ==
From: Mark Brown <broonie@kernel.org>
To: clg@kaod.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com, pmenzel@molgen.mpg.de, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
In-Reply-To: <20260120123005.1392071-1-chin-ting_kuo@aspeedtech.com>
References: <20260120123005.1392071-1-chin-ting_kuo@aspeedtech.com>
Subject: Re: [PATCH v3 0/2] spi: aspeed: Improve handling of shared SPI
 controllers
Message-Id: <176960558580.1648911.5452842376187241181.b4-ty@kernel.org>
Date: Wed, 28 Jan 2026 13:06:25 +0000
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
X-Mailer: b4 0.15-dev-47773
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[openbmc];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1291-lists,openbmc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: B87A2A1CF5
X-Rspamd-Action: no action

On Tue, 20 Jan 2026 20:30:03 +0800, Chin-Ting Kuo wrote:
> This patch series improves handling of SPI controllers that are
> shared by spi-mem devices and other SPI peripherals.
> 
> The primary goal of this series is to support non-spi-mem devices in
> the ASPEED FMC/SPI controller driver. It also addresses an issue in
> the spi-mem framework observed when different types of SPI devices
> operate concurrently on the same controller, ensuring that spi-mem
> operations are properly serialized.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: spi-mem: Protect dirmap_create() with spi_mem_access_start/end
      commit: 53f826ff5e0e3ecb279862ca7cce1491b94bb017
[2/2] spi: aspeed: Add support for non-spi-mem devices
      commit: 04f7516ab70f7b82aae1d2830af2ee6f17f3fe98

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


