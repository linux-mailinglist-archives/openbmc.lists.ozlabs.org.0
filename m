Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C22E56B23D
	for <lists+openbmc@lfdr.de>; Fri,  8 Jul 2022 07:30:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfMLT0yFQz3c3w
	for <lists+openbmc@lfdr.de>; Fri,  8 Jul 2022 15:30:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HE/euP8O;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=HE/euP8O;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfML46ttQz3bkC
	for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2022 15:30:03 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id o4so29029410wrh.3
        for <openbmc@lists.ozlabs.org>; Thu, 07 Jul 2022 22:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CNqTC3wlGD3BcjvFt5BXxRxT0dKknXugDsHQA9ycVj8=;
        b=HE/euP8OWA1ImR7r2Cf3ACk8Ynr4WG4SLrp7g/GdSk6+3QhWfphf6O9IBCWZs6AO4w
         anBQ6WXtkS8CU7p3vvYeybGteFaemeAo89Oz4DC50kH3/G4FbEWtgXkxBQVbPr2LBwwL
         kb5Wel/ITqInFINJ0IpDJNs3tCw8njztb7GEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CNqTC3wlGD3BcjvFt5BXxRxT0dKknXugDsHQA9ycVj8=;
        b=JK4UQ/50TfXaNZ59Q/9laLtfslv+FYduEDSVZFJQcPFBQGtXtjfzCaMvRZpW3iMZOe
         xDrNrpGBxnoNrgf7frD/Z1FrWiNefzm3KyQnPnUBRAxejZIo2QLZiWdbIYAPNI0y8ywR
         qc2ISw8MW8UKtTVciXPtEAp3fNBUQNPFxP4Uj/EJkvn+P7UrUM8Vc++nJ7/RYj9uy06Z
         fodUkjcBgb7u3zzk28W4pNaE8Wjw5xHPtGdO2a3FfWHU/m2/v3dx3Z99Jn6NAf0PPwT1
         wqQ36xuhMgEBhggsKZC/ALz0R+BUyoHk3MZFutGUwPudxugRkk/VQHO4a4m1tzW6cbiV
         6LLQ==
X-Gm-Message-State: AJIora/vDos9t3ipBD3k3lWq8OKASHTUk+H9Rcl3mnUYV7Bqddsv8cvL
	KJktL15TG0fiaTZhAV5hcZ5Y9XgOGg4U9sUzgNU=
X-Google-Smtp-Source: AGRyM1twZelGyhuOBbTCjXWHmMm42LZGsbwdAWIDEvGxMCRbaXsmyQZFKz8Nzn3majqqA229S8XMJtZvPlUHsMHY/VI=
X-Received: by 2002:a5d:588d:0:b0:21d:865c:54e9 with SMTP id
 n13-20020a5d588d000000b0021d865c54e9mr1454867wrf.3.1657258199519; Thu, 07 Jul
 2022 22:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220630200227.2292079-1-quic_jaehyoo@quicinc.com>
 <20220630200227.2292079-2-quic_jaehyoo@quicinc.com> <CACPK8XcJPs5vcs_+r=hmRX475CzfLo+LdofdAtrpoE5bnEbchg@mail.gmail.com>
 <8bbe2c65-e928-c40d-3ab1-9cbf41b5c3d8@quicinc.com> <CACPK8XcM578K41_3FHaFKTnq07pUowORjiW7_8gR=JW1NuzUcA@mail.gmail.com>
 <5bbe5b6b-0e12-e11c-9282-875f5bf66bc7@quicinc.com>
In-Reply-To: <5bbe5b6b-0e12-e11c-9282-875f5bf66bc7@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Jul 2022 05:29:46 +0000
Message-ID: <CACPK8Xekx3M6MTdecJxvJrkR5E_K77L5gRHgKdnOg1VMCDK8OA@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 1/3] configs: ast2600: add
 Qualcomm DC-SCM V1 defconfig
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Graeme Gregory <quic_ggregory@quicinc.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 6 Jul 2022 at 14:52, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> On 7/5/2022 6:02 PM, Joel Stanley wrote:

> > That's an option, but this would limit testing coverage, as we would
> > only build that configuration when doing an OpenBMC image build.
>
> To apply board specific configuration without regarding to the OpenBMC
> image build, we need to add a board specific defconfig so that u-boot
> standalone build itself can have the configuration, but looks like
> there is no case of any Aspeed BMC board defconfig other than Aspeed
> EVBs and OpenBMC reference defconfigs in the u-boot tree. I'll add
> minimized configuration overrides in the 'recipes-bsp' layer for this
> machine build for now.

That's a good plan. We could consider adding some bitbake machinery
for this, where the machine type can be specified and bitbake will set
that config option for you.
