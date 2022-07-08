Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7585556B23F
	for <lists+openbmc@lfdr.de>; Fri,  8 Jul 2022 07:31:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfMMf21Rfz3c4l
	for <lists+openbmc@lfdr.de>; Fri,  8 Jul 2022 15:31:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=cdfW2/C9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=cdfW2/C9;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfMMH4SQpz3bs2
	for <openbmc@lists.ozlabs.org>; Fri,  8 Jul 2022 15:31:07 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id s1so29029056wra.9
        for <openbmc@lists.ozlabs.org>; Thu, 07 Jul 2022 22:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+miVc9QkZgCp/y5BlTQLSqqpW2HbB/Xtr8MxoTRYJPY=;
        b=cdfW2/C9CP6tX6pqOfP/XBcmdjBt0eotrVRFiYiLZtiG2XxeKuNgtt+sn9FlCICq1D
         Im0oHg+n+tim0gUdKE2pLUr54J18mmZRguPRpMDNV1eBOIXl7sMBoQ3TCPThjPLtNXYv
         ZwGKGdiAAaEGzaZjWZcGE+DrNidsGjUUI2d7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+miVc9QkZgCp/y5BlTQLSqqpW2HbB/Xtr8MxoTRYJPY=;
        b=RNY8ddH8uejV6IhozURhmIeAtL+w1DVzbEzDv4lxTdSh4+GxH4D8YicaUC/0N7N7pK
         8sQvh03LpjMr/7dXYFewiH+xQXCybE4BCNfZzPcGGH1DaOXBEemR0V5hJ28NWumYv3Vo
         /tym+x/G5qjyTOVUo0z5hzIqZvTSmg9uOAr5RhretZsxlCBFmBBX86kesYRVqX6UvzGP
         r1kMOQDK+zyQUQTUOKS6bjX8jvua0fXumzj6LVrZZ6l/CRDx9Z7+lClfeamP7yVn6wP8
         82IX6opawTP6Zeu6NvOb0Ffp2a/vuI3QE8xd+8i2w7HF/vl2Uxcguhy72QSa68Nn2e0b
         4R/g==
X-Gm-Message-State: AJIora82lY4lNB2nj+4Va0OBFczi6oOBQ18TIwdJjWZogziH4HbPKX+c
	j4f8SVir1jOAYxrLAui4wKJ3bz9tS9Kx8xsI89s=
X-Google-Smtp-Source: AGRyM1t444LkvgnpZLAzxKc38qAIieC0c9CSg2kaimgyQjuz1iX008p7JzPpZivm+U9FSQTdb6u7K8tBvbG9eew84Wk=
X-Received: by 2002:a05:6000:1446:b0:21d:2245:ab65 with SMTP id
 v6-20020a056000144600b0021d2245ab65mr1434014wrx.315.1657258264415; Thu, 07
 Jul 2022 22:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220630200227.2292079-1-quic_jaehyoo@quicinc.com>
 <20220630200227.2292079-3-quic_jaehyoo@quicinc.com> <CACPK8Xf5KjQZMX=8NnVDGw=oXHB2OrhY-NY4=jDXMZU=0LMEAA@mail.gmail.com>
 <f3019478-1384-fb4c-3531-042dd123ca60@quicinc.com> <CACPK8XcUkLVzCpw2vVoBQ8nc8Uj9z1GOs30RJgzwy7nWATN_nw@mail.gmail.com>
 <f5db80df-90b4-fa36-2f5d-71f33164e9d4@quicinc.com>
In-Reply-To: <f5db80df-90b4-fa36-2f5d-71f33164e9d4@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Jul 2022 05:30:52 +0000
Message-ID: <CACPK8XfcX8rnp-p9i2G0OdyU04WzUrgJA6Q0eWUKgQVY18Z7YQ@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 2/3] board:
 ast2600_qualcomm: add initial version of Qualcomm DC-SCM V1 board
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

On Wed, 6 Jul 2022 at 14:29, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> On 7/5/2022 5:58 PM, Joel Stanley wrote:
> > On Tue, 5 Jul 2022 at 14:28, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
> >>
> >> Hello Joel,
> >>
> >> On 7/4/2022 11:51 PM, Joel Stanley wrote:
> >>> On Thu, 30 Jun 2022 at 20:02, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
> >>>>
> >>>> Add initial version of Qualcomm DC-SCM V1 board to support Qualcomm
> >>>> specific options.
> >>>>
> >>>> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> >>>> ---
> >>>>    arch/arm/mach-aspeed/ast2600/Kconfig      |  8 ++++++
> >>>>    board/aspeed/ast2600_qualcomm/Kconfig     | 15 +++++++++++
> >>>>    board/aspeed/ast2600_qualcomm/Makefile    |  1 +
> >>>>    board/aspeed/ast2600_qualcomm/dc-scm-v1.c | 33 +++++++++++++++++++++++
> >>>>    4 files changed, 57 insertions(+)
> >>>>    create mode 100644 board/aspeed/ast2600_qualcomm/Kconfig
> >>>>    create mode 100644 board/aspeed/ast2600_qualcomm/Makefile
> >>>>    create mode 100644 board/aspeed/ast2600_qualcomm/dc-scm-v1.c
> >>>>
> >>>> diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
> >>>> index 46cc1ad1dbd9..252458846a84 100644
> >>>> --- a/arch/arm/mach-aspeed/ast2600/Kconfig
> >>>> +++ b/arch/arm/mach-aspeed/ast2600/Kconfig
> >>>> @@ -46,6 +46,13 @@ config TARGET_AST2600_INTEL
> >>>>             AST2600-INTEL is an Intel Eagle Stream CRB with
> >>>>             AST2600 as the BMC.
> >>>>
> >>>> +config TARGET_AST2600_QUALCOMM_DC_SCM_V1
> >>>> +       bool "AST2600_QUALCOMM_DC_SCM_V1"
> >>>> +       depends on ASPEED_AST2600
> >>>> +       help
> >>>> +         AST2600-QUALCOMM-DC-SCM-V1 is a Qualcomm DC-SCM V1 board which is
> >>>> +         equipped with AST2600.
> >>>> +
> >>>>    endchoice
> >>>>
> >>>>    source "board/aspeed/evb_ast2600/Kconfig"
> >>>> @@ -53,5 +60,6 @@ source "board/aspeed/fpga_ast2600/Kconfig"
> >>>>    source "board/aspeed/slt_ast2600/Kconfig"
> >>>>    source "board/aspeed/ast2600_ibm/Kconfig"
> >>>>    source "board/aspeed/ast2600_intel/Kconfig"
> >>>> +source "board/aspeed/ast2600_qualcomm/Kconfig"
> >>>>
> >>>>    endif
> >>>> diff --git a/board/aspeed/ast2600_qualcomm/Kconfig b/board/aspeed/ast2600_qualcomm/Kconfig
> >>>> new file mode 100644
> >>>> index 000000000000..3ede24c34dee
> >>>> --- /dev/null
> >>>> +++ b/board/aspeed/ast2600_qualcomm/Kconfig
> >>>> @@ -0,0 +1,15 @@
> >>>> +if TARGET_AST2600_QUALCOMM_DC_SCM_V1
> >>>> +
> >>>> +config SYS_BOARD
> >>>> +       default "ast2600_qualcomm"
> >>>> +
> >>>> +config SYS_VENDOR
> >>>> +       default "aspeed"
> >>>
> >>> Out of interest, how does u-boot handle this upstream? Does a board
> >>> made by company Y with a chip made by company X considered vendor X,
> >>> or vendor Y?
> >>
> >> This code is added into a sub-directory of 'board/aspeed' so the
> >> SYS_VENDOR must be set to 'aspeed'. If I set that to 'qcom', then
> >> builder will look for an Makefile under 'board/qcom' instead and it
> >> makes a failure. The same pattern is already used for ast2600_ibm and
> >> ast2600_intel.
> >
> > Yes, that is true, but it's not what I'm asking. There's momentum to
> > use the upstream tree for u-boot and I want to ensure any patches that
> > go in from now on are applicable upstream.
> >
> > Can you do a survey of the upstream tree and see what the pattern is?
> >
> > If it's to use the manufacturer
>
> Investigated the latest u-boot upstream that it uses manufacturer's sub
> folder instead of SoC vendor folder. For an example, RK3399 based Google
> 'gru' board was added to 'board/google' folder instead of
> 'board/rockchip'. Means that the current manufacturer board folders in
> 'board/aspeed' in openbmc u-boot tree also need to be refactored.
>
> I'll submit this change to 'board/qualcomm' in v2.

Okay. I'm not sure that makes it easier to maintain, but in the
interests of getting support upstream lets go with that.

>
> >>>> +int board_late_init(void)
> >>>
> >>> Do you need to include this if it's doing nothing?
> >>
> >> The defconfig has 'CONFIG_BOARD_LATE_INIT=y' so this function should be
> >> added as a dummy function otherwise it meets a build failure. This
> >> function will be filled by following commits later.
> >
> > Doesn't it make sense to not set CONFIG_BOARD_LATE_INIT=y if you don't need it?
> >
> > You can introduce it when you need it (or add the code that uses it
> > with this commit).
>
> Agree with you. I'll remove the config if it's not needed at this
> moment.
>
> >>>> Is there a reason you don't use the gpio driver?
> >>
> >> Forgot to reply on this comment. This function is called from
> >> board_early_init_f and gpio driver is not ready at that timing so
> >> it uses direct register access.
> >
> > Why not call it at a later boot stage, so the gpio driver is ready?
>
> To set the GPIO output as early as possible but the timing wouldn't much
> different so yes, I'll move the gpio init call to board_late_init using
> the gpio driver in v2.

Great!

>
> Thanks,
> Jae
>
> > Cheers,
> >
> > Joel
