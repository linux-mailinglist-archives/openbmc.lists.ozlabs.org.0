Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC2E2A9028
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 08:20:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSBc94709zDrCt
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 18:20:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ncmvSxGB; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSBbQ3Q80zDr7N
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 18:19:25 +1100 (AEDT)
Received: by mail-qv1-xf41.google.com with SMTP id i17so59709qvp.11
 for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2020 23:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GjhBvPmpFzexwpMcxrXGRCGdXBo1sxRCLDU2zQ6Boxk=;
 b=ncmvSxGBzOI7E9zIdcFDGNAeiXAkEpTRX+mTTfVXAVm445zpxU0DM0sXamEoqaRF4o
 QLF8zWPJdg6kjLK2zl9tyuS5TpSGbHr0D+tXE3gAxaeUi9cHXOPUEHCcb2l7yyn+ueuD
 S7KTuxW/3fwSpzhucNYcxh4l5zROTELmW4rm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GjhBvPmpFzexwpMcxrXGRCGdXBo1sxRCLDU2zQ6Boxk=;
 b=I47y+YlNnEN9nWsVIi0Ff86pnMgYc3zT4MxLzodd48WtiPoBAzIqNYDXGrp4vBZ0+i
 0YVsyzCxPI5WLOmTcmMCUAAoA9HMZDnvmOgUEUg5x9mdj61rHgQiNP5k9K94StN4X1E9
 OPcN3/qxTD9qmThTxhvxDp/5e20J30k22lb9m8nCy6QZ4taar2ent8IzPPxdiEENwCvS
 J9EHFCbrKzb6vZpei1zKWSohLebO4N2ktDxTFtAHp2XZ8O40c016/Mpqw1FKjr1yoG48
 szeYWi4MHjsx0TiHE2LS/AVWHNWU5oH4FF3ckYrF6J7FsvHWPQUyu7O4PLrfVRUu/tKj
 12Bw==
X-Gm-Message-State: AOAM531r0siZZ1caEDhfFN1p3qZEnslkgk1/9d7dGdf6B7P83lhJ2Pw5
 lqIRkrmNNzjZhCshZo+FTl/z1OAfco1a5WVnUVY=
X-Google-Smtp-Source: ABdhPJzcnpK+EE40b06j+AmjoUmMSLw4pes8bii/CkJpxLLI5F86NI0JAm95eP4e0ApS5pmyDrejZi88nK5jb8StEKM=
X-Received: by 2002:ad4:5387:: with SMTP id i7mr372823qvv.43.1604647160842;
 Thu, 05 Nov 2020 23:19:20 -0800 (PST)
MIME-Version: 1.0
References: <6ce8b3c2e5bf49e8ae4c5668b02d4f08@TPEMBX05.compal.com>
In-Reply-To: <6ce8b3c2e5bf49e8ae4c5668b02d4f08@TPEMBX05.compal.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 6 Nov 2020 07:19:08 +0000
Message-ID: <CACPK8XesGoWPTaBGsU0d0LQdvoHoy_KthsjTweV1grbF9PCqwQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8]ARM: dts: aspeed: Add Compal liwu2 BMC
 machine
To: Willie_Thai@compal.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Willie,

On Fri, 6 Nov 2020 at 05:26, <Willie_Thai@compal.com> wrote:
>
> The liwu2 is a server platform developed by Compal with an ASPEED AST2500 BMC.

Please send your patch as the email body. The best way to do this is
to generate the patch with 'git format-patch' and send it with 'git
send-email'.

Cheers,

Joel

>
>
>
> Signed-off-by: Willie Thai <willie_thai@compal.com>
>
> ===============================================================================================================
> This message may contain information which is private, privileged or confidential of Compal Electronics, Inc.
> If you are not the intended recipient of this message, please notify the sender and destroy/delete the message.
> Any review, retransmission, dissemination or other use of, or taking of any action in reliance upon this information,
> by persons or entities other than the intended recipient is prohibited.
> ===============================================================================================================
