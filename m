Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36952A31F4F
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2025 07:44:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yt81g2DFyz3cWb
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2025 17:44:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739342676;
	cv=none; b=kRKOvo+QVsEChqnuVWJgIftKIv4qXATn8I8FjQHBpZurpnAk/HqBBMjkyEwfq0FQXjeuOgrs8jLyqRpIKqW9ACpHVWHuMdFolkUR1h5lI0oqG1LOpg3gHewLY53IpbRX5hjcukUAv8Y3nKHPeUngPVTOp8PvhaJcATqBqW84MWibbEw0SuL+tq5Sm4tqsCwEbOYUWYGCw67DEzB0qMBiQbxB1lCZkwzMTpfL9xjV+UDmpi3u5BBCHYtEHuCN7EimdODkemWgG56q4r3RmMgnr2oc6qKZ+RlQYggjg6EJHDdN8Vs5qc1vxja7CwU6IdTts3PLIduRHBlqRb8xmztcjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739342676; c=relaxed/relaxed;
	bh=qCJf3RdMRIDtsyVFtsT7i6n1XVBxH7JnaQG1mSyRKT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uotrz/JVLbPGFI+gmAnMiemITYCQdXUDQ7E0otgzC9Ee7Qbj2g0cCHtn2XGlolUHkkBsMXTUD+WNARnfq2aWOprwLLBDfx4EiEz/EmhyxEsYHeDzww0TXQIk6xD2D/jHoIka3lULln3MNNlXJMN8gi7wJHCt9QhOZplmNI70TxSukoFfxag3GD++zwdl0zzP0rFTt9WJD4tbp158XUHw5gmtSXm3AEieFIcG1GJPa+J17NTd1oiWpcfTtMVzB/ubwIL5DP2zPUyAx8QvkI/OrrOVQkdtqWU+b+wiz5+WTq/TH3iC6IecIZahsgWCTpcLZFCjr+Mw/2k6jdrXj201LQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tfUXC0BL; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tfUXC0BL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yt81b4BHjz2yF4;
	Wed, 12 Feb 2025 17:44:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AF933A40FA2;
	Wed, 12 Feb 2025 06:42:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505EEC4CEDF;
	Wed, 12 Feb 2025 06:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739342672;
	bh=Sv9qNL+TN5TjV7dcAh3uCs0tMgt7UdZj63e5XWo0KJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tfUXC0BLirlUXBWTvvt0AJzcvF0lHh9wK8R5XaaS+Wl1kkpJ1p251RZ3KuZMnnY4H
	 hHF8g/BHY2ZqEwg9csC76QN/ORdw2gqcmxpwnGKXUNr7EfLik3ayZfaTyNrgtOMGeZ
	 fzH8JvLwuIsqof/UnySBYsbry++vdHDaZ0rj+ifOdJovO0mB6MaYCwdT37ZzMu/me9
	 jqVmmb+GaMwFC1+WfvFoUnehxg6umOkJp3dt7Dwzhm2OYDPWrkVF5t5g43esQPvnAF
	 WaI4tfXxlwkLNy1xuEfxlIuY0638gIUBdtffuu/kBnld5maDpljDOqAn5E4L1lx3nU
	 jhNIek9FoKY+w==
Date: Wed, 12 Feb 2025 07:44:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v5] media: dt-bindings: aspeed,video-engine: Convert to
 json schema
Message-ID: <20250212-copper-tortoise-from-hyperborea-8dddcc@krzk-bin>
References: <20250212014711.2181865-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250212014711.2181865-1-jammy_huang@aspeedtech.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, eajames@linux.ibm.com, linux-kernel@vger.kernel.org, joel@jms.id.au, krzk+dt@kernel.org, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 12, 2025 at 09:47:11AM +0800, Jammy Huang wrote:
> Convert aspeed-video.txt to yaml format.
> Update aspeed-video.txt to aspeed,video-engine.yaml in MAINTAINER file.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
>  v5:
>   - Don't put additional changes in this commit.

But it fails then, right? I asked for justification or separate commit,
depending on what is really hapenning here.

Are you sure you tested this? I am pretty confident it will fail :/.

Best regards,
Krzysztof

