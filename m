Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48310484DA1
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 06:33:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTJ6z0rxsz2yZt
	for <lists+openbmc@lfdr.de>; Wed,  5 Jan 2022 16:33:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=8PpUC0zF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=8PpUC0zF; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTJ6W3By3z2xDV
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jan 2022 16:32:59 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id k18so43824834wrg.11
 for <openbmc@lists.ozlabs.org>; Tue, 04 Jan 2022 21:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gyKdpGefYFFOFD9kVS+oP2K2si5fUOgQ52v0uyd9pA8=;
 b=8PpUC0zFweopHzrULaOC3gVD+dSXrVl+H4G0c5mIiKWfbC66qZitkP8HPhwjWloGBd
 qu1WOfd7Q/2/FF72B3kkh+WOWUJKHIVP+J38XGI7SJ02oOkA25rl/1wvULdqEt+whOQN
 QKMJoRPoP5VeWa6i1wr3oLmfGDBLdsSxc4qUIGKY2476hNgxraPmv6Ecufb0KGDuScXn
 /SiJGxO8RJo7kZ9wxHmgmWGweM+vLCjJvgmuc3wLH2xIV542NwkPW3188VtSa8lH2+Nb
 Vlrd1QLpqfYC0Xp+jVmHSt3BPhGdAV+OSGBVYTmZdilwnYnk1aDA5iTi9VXsd73p/1Im
 BASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gyKdpGefYFFOFD9kVS+oP2K2si5fUOgQ52v0uyd9pA8=;
 b=Dal4yZKprjnqZqvSeprr8tFsm/YyXQ/SL5GbCrinPvkMmuL4EjHOZkYHU4+hrmCih4
 S9rg5+FD7tQIMu3ugSATWuBGLxGUzsmkSa35TcYnr1Woo3jvvdV1cWeh4wzWVhscgOCy
 +WAoPbDJ06/x8G/fjiqWdty//TWpDr1rVpnizcqqy1XOoPYhfy8E+85fnV0b7v60p9FF
 YkhgctIH4EVcmesGtTxEh9g8d7y4lJt71P5JLqXHxfvOvvowKPFxJfjUFK083A/pbJ5q
 lGWjH6lOOa5tEsriMP0CtPqFIInv3ReMJN3soNB3h/P+JlwcpYa0J/jy+IBawBVJ+/EL
 e0RA==
X-Gm-Message-State: AOAM532AIj3qjV3Qpd9VF/x+ohrRIjyyLmSG4Swe4xbi++DC02obbXQ1
 JFhuhjV5EvF6pQz+wWAXgigsy4qDzL06xWGPQEIjaw==
X-Google-Smtp-Source: ABdhPJxE5vBqctq502istUxJV2WKAH761fcAHe/HtCGUURQL+//adPXVuixTykX5RjKTx6DU2MpLaST80BYgsDaEzcA=
X-Received: by 2002:adf:c843:: with SMTP id e3mr45254548wrh.38.1641360771949; 
 Tue, 04 Jan 2022 21:32:51 -0800 (PST)
MIME-Version: 1.0
References: <20220105003718.19888-1-zev@bewilderbeest.net>
In-Reply-To: <20220105003718.19888-1-zev@bewilderbeest.net>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 5 Jan 2022 13:32:40 +0800
Message-ID: <CAGm54UF31f4CVzE6FtEVuZ+rkuy1thbMDiw3HrMNLtoeqvCKug@mail.gmail.com>
Subject: Re: [Phishing Risk] [External] [PATCH] ARM: dts: Fix OpenBMC flash
 layout label addresses
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Troy Lee <troy_lee@aspeedtech.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jan 5, 2022 at 8:37 AM Zev Weiss <zev@bewilderbeest.net> wrote:
>
> We've ended up with some inconsistencies between the addresses in the
> DT node labels and the actual offsets of the partitions; this brings
> them back in sync.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Fixes: 529022738c8e ("ARM: dts: Add OpenBMC flash layout")
> Fixes: 8dec60e7b8d0 ("ARM: dts: aspeed: Grow u-boot partition 64MiB OpenBMC flash layout")
> ---
>  arch/arm/boot/dts/openbmc-flash-layout-64.dtsi | 2 +-
>  arch/arm/boot/dts/openbmc-flash-layout.dtsi    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
> index 31f59de5190b..7af41361c480 100644
> --- a/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
> +++ b/arch/arm/boot/dts/openbmc-flash-layout-64.dtsi
> @@ -28,7 +28,7 @@ rofs@a00000 {
>                 label = "rofs";
>         };
>
> -       rwfs@6000000 {
> +       rwfs@2a00000 {
>                 reg = <0x2a00000 0x1600000>; // 22MB
>                 label = "rwfs";
>         };
> diff --git a/arch/arm/boot/dts/openbmc-flash-layout.dtsi b/arch/arm/boot/dts/openbmc-flash-layout.dtsi
> index 6c26524e93e1..b47e14063c38 100644
> --- a/arch/arm/boot/dts/openbmc-flash-layout.dtsi
> +++ b/arch/arm/boot/dts/openbmc-flash-layout.dtsi
> @@ -20,7 +20,7 @@ kernel@80000 {
>                 label = "kernel";
>         };
>
> -       rofs@c0000 {
> +       rofs@4c0000 {
>                 reg = <0x4c0000 0x1740000>;
>                 label = "rofs";
>         };
> --
> 2.34.1
>

Reviewed-by: Lei YU <yulei.sh@bytedance.com>

-- 
BRs,
Lei YU
