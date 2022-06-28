Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 996DD55BE30
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 06:31:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXBWK5WCCz3blL
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 14:31:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=N5Rlb6rH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=N5Rlb6rH;
	dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXBVt4QSpz3bc9
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 14:31:17 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so6795223wmb.5
        for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2022 21:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l9SaGECP310wKRiRqNLSXpEUnfLgLKcO2n/5HnF2MW8=;
        b=N5Rlb6rHeuVCtlCw0Wp8REhO+Xpnp1dCJsiDcF2fdEN2L0CDcQimOUz+fBgSFu/Z6Y
         x5Y8mbBaN6oXOHlBipdm/ORAI7/ugZZaerbYgxe4g76CStroMXfglAMthY/27pLvJyfT
         mSjmcsWHQyraN9lZwDH+L34kqwMGNp6+pyB0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l9SaGECP310wKRiRqNLSXpEUnfLgLKcO2n/5HnF2MW8=;
        b=Anxrz3NOMFMoozaEfd3Vxa3+7liu0nwcrS1PbH7zPoAIZgKHztVgyR/O4NwWvFhduo
         E+mr4bJyLBsM11St4ZAg0O8S/5KbRduZ9FFnSiJbu232acBYCYUbOGOwkKF6t4xnIBo5
         Z95tuCRWGtJ4Tak0qF1Np1l0JcjlGabWudnXWf2whpHmQrcIw2U64o+6jWMsIJU/9KSn
         J0fDcNsyAJpLDSSw4M34FfhmyD5EoefOF9VuUVKSTyP6HZBh26vzMxv4Mpeu/AkMe5T5
         k3FLgr9IUL2efAQ1GhYVLcDhORkMDMRW+sGVH40e05Vw+XeWXJB6JUF62RUW5fngKMcU
         bw7w==
X-Gm-Message-State: AJIora8oYqoCcwkCcKtRt6Cv06lfUAULJM7dCm7CiU4C/rjkEU68fwe1
	oEexINsg3ta2pnIxE4KGkTcMChs9ZyOGloyebr8=
X-Google-Smtp-Source: AGRyM1uT2CITEMVNidND0Af0trVklKvyonPOKKZb9kq1P8slPQD44zNWhmxMGKvsU9FdMYe75JSyJ/XgizLV2/9FKbk=
X-Received: by 2002:a1c:4e19:0:b0:3a0:43e0:3591 with SMTP id
 g25-20020a1c4e19000000b003a043e03591mr16040673wmh.10.1656390671617; Mon, 27
 Jun 2022 21:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220628031343.21097-1-potin.lai.pt@gmail.com>
In-Reply-To: <20220628031343.21097-1-potin.lai.pt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 28 Jun 2022 04:30:59 +0000
Message-ID: <CACPK8Xfdj2s_NHq_5KpvvMoFg17dbYpzezgzWmNEV1hD83MujQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15 0/4] Update Facebook Bletchley BMC DTS
To: Potin Lai <potin.lai.pt@gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Potin Lai <potin.lai@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jun 2022 at 03:15, Potin Lai <potin.lai.pt@gmail.com> wrote:
>
> Hi Joel,
>
> Could you help review this patch series and backport to linux-aspeed dev-5.15?
> Thank you.

Sure. I took the ones you posted on the upstream list as they have
Patrick's r-b.

I've applied them to dev-5.15.

Cheers,

Joel

>
> LINK: https://lore.kernel.org/all/20220613095150.21917-1-potin.lai.pt@gmail.com/
>
> Potin Lai (4):
>   ARM: dts: aspeed: bletchley: change LED sys_log_id to active low
>   ARM: dts: aspeed: bletchley: disable GPIOV2 pull-down
>   ARM: dts: aspeed: bletchley: bind presence-sledX pins via gpio-keys
>   ARM: dts: aspeed: bletchley: update fusb302 nodes
>
>  .../dts/aspeed-bmc-facebook-bletchley.dts     | 197 +++++++++++++-----
>  1 file changed, 148 insertions(+), 49 deletions(-)
>
> --
> 2.17.1
>
