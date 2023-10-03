Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 153787B621D
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 09:06:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=q5RDnAoE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S084P6xX9z3cJW
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 18:06:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=q5RDnAoE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S083n6p58z3c56
	for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2023 18:05:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 92B1DB816ED;
	Tue,  3 Oct 2023 07:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6FCC433C7;
	Tue,  3 Oct 2023 07:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696316736;
	bh=SjGX3jCFVdiNsB2r2BY7I5WgDYwtsa92FOhazxUr+iA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5RDnAoElwAkbKO9DyhYFDDRq/2FQ/6FvrGCb3609E2bA5ZZImlL7nuowYdxArol4
	 KiBG+BjZfxOa3JiS0vsz2+2B6w41FJMNsuLddxIFrZdRPdaFrlgMiXeZ1A8pvVSzYQ
	 PRSHteEYXDYP46qFLi7KbYhzvJYtX11EKOdevqHc=
Date: Tue, 3 Oct 2023 09:05:34 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH RESEND v3 0/3] usb: ChipIdea: add Nuvoton NPCM UDC support
Message-ID: <2023100342-unnerving-diaphragm-cf36@gregkh>
References: <20231002161350.64229-1-tmaimon77@gmail.com>
 <2023100323-reunite-upfront-8922@gregkh>
 <CAP6Zq1jHzRP1Ytzk8YXyR8ppAP=ZoPvPkYvC2yMRfTt5140zqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP6Zq1jHzRP1Ytzk8YXyR8ppAP=ZoPvPkYvC2yMRfTt5140zqw@mail.gmail.com>
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

On Tue, Oct 03, 2023 at 09:56:47AM +0300, Tomer Maimon wrote:
> Hi Greg,
> 
> Forgot to add in Acked-by: Peter Chen <peter.chen@kernel.org> in V3,
> Resend the patch set with the Ack.
> 
> Should I do it differently?

You need to tell me what the difference is, otherwise I would have no
clue what to do, what would you do if you had to review all of these and
try to figure out which ones to accept?

Please send this as a v4.

thanks,

greg k-h
