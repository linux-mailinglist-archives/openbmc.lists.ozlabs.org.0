Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4417B6107
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 08:51:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=dsB1b3Re;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S07lp1rGLz3cCM
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 17:51:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=dsB1b3Re;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S07lC5VPkz2xqp
	for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2023 17:51:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D0A1FB81763;
	Tue,  3 Oct 2023 06:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AF4C433C7;
	Tue,  3 Oct 2023 06:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696315873;
	bh=JlKz8TnjKZB3qADozNp3jxhS6lFpcAtZkkpuPxyVPAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dsB1b3ReOL2s0+k/5c4ftz8IQrp5C0DPi6B96/rPdrtzF3aEnfvABRIYnXQdo75un
	 ZmYp1Fq27VVjh63hY8aGkVZ7HwR/WmSLbpv6LqKiXgieOyZIgTafH2SJjQaHLvfEkw
	 8Dbt2E3vhlFM1x0uv3UdNqxol45aCztkCKx/Zk8w=
Date: Tue, 3 Oct 2023 08:50:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH RESEND v3 0/3] usb: ChipIdea: add Nuvoton NPCM UDC support
Message-ID: <2023100323-reunite-upfront-8922@gregkh>
References: <20231002161350.64229-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231002161350.64229-1-tmaimon77@gmail.com>
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
Cc: devicetree@vger.kernel.org, peng.fan@nxp.com, linux-usb@vger.kernel.org, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, peter.chen@kernel.org, xu.yang_2@nxp.com, j.neuschaefer@gmx.net, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 02, 2023 at 07:13:47PM +0300, Tomer Maimon wrote:
> This patch set add USB device controller for the NPCM Baseboard
> Management Controllers (BMC).
> 
> NPCM UDC driver is a part of the USB ChipIdea driver.
> 
> Adding CI_HDRC_FORCE_VBUS_ACTIVE_ALWAYS flag to modify the vbus_active
> parameter to active in case the ChipIdea USB IP role is device-only and
> there is no otgsc register.
> 
> BMC NPCM7XX and BMC NPCM8XX has ten identical NPCM UDC modules,
> 
> The NPCM UDC were tested on NPCM845 evaluation board.
> 
> Addressed comments from:
>  - Krzysztof Kozlowski : https://www.spinics.net/lists/kernel/msg4951321.html

Why is this a RESEND?

