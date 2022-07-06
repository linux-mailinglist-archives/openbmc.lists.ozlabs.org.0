Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F74567B2F
	for <lists+openbmc@lfdr.de>; Wed,  6 Jul 2022 02:59:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ld1Q82FBwz3c1Z
	for <lists+openbmc@lfdr.de>; Wed,  6 Jul 2022 10:58:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=NxQi5nxi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=NxQi5nxi;
	dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ld1Ph53Cgz3bl7
	for <openbmc@lists.ozlabs.org>; Wed,  6 Jul 2022 10:58:30 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id bi22-20020a05600c3d9600b003a04de22ab6so8162985wmb.1
        for <openbmc@lists.ozlabs.org>; Tue, 05 Jul 2022 17:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s4bU9CDNdsbY+5NZcEQyjoEXHoCr3gmCqZXM7gBKLpQ=;
        b=NxQi5nxiF9m52yeHk+KvVDt5SXnPSnHAS8FXeg1x/15HuMsP2L8R9eLrTBcgIG/ymr
         t6kuPp2aXg35qjSdLxvGJgxuLglNqaql3sBw0cfmHhsCaE9L8fYo+XvqU9YdZ7c0XkoH
         noDoDHllOJ9A57WPFtpqfSoOS7Ds8RYL1mntk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s4bU9CDNdsbY+5NZcEQyjoEXHoCr3gmCqZXM7gBKLpQ=;
        b=XXAzzl5hrhqnj8rx3mIi4LQyWY92HuNEvQe8QzjdbEoIXVhsL7YFbvZlpbL0EEaJxf
         DmFqVMvdrLzykaQlGB6KtxELX0ROmvWeKAzi4cP9CgRfmdsqfP1MFbTbACfqUosJvXSq
         Z9k9ISpgkhJXDVTaGVDu4S3YmWa4qRIy0QYyj90kPf+3oW23rXV29xaX2kIvu6N227rL
         mHgGssyJ+UIL0U2/77au+xWxcgSPx5Xt1ZyichphcKZj1CeCA1G7711pdLLn3FIl3SBS
         QnwHOx+kyQLQNza8sIiIHgK2xcMYEbXW5BFsndt0uAG3AamvRdutOt6f4ncq3ICWP6oE
         vIog==
X-Gm-Message-State: AJIora+eVDCbpZW1DulptXd4/YAIOFSEYaatyJY85px9+wnaFLeT/2Ib
	ur0VPCObrKjvhWciYBNGZhNSDfJeE3P7MxtvD3U=
X-Google-Smtp-Source: AGRyM1sMPoRyxyw/X21IhjmqvDLkHsU7c8DRfam7sxUm06ZcOO5uHhxhpVtCE1d9WDqUjl9K81J99U/oC3qfNKyR4bM=
X-Received: by 2002:a05:600c:21c3:b0:3a0:3aad:7f30 with SMTP id
 x3-20020a05600c21c300b003a03aad7f30mr42399602wmj.190.1657069102524; Tue, 05
 Jul 2022 17:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220630200227.2292079-1-quic_jaehyoo@quicinc.com>
 <20220630200227.2292079-3-quic_jaehyoo@quicinc.com> <CACPK8Xf5KjQZMX=8NnVDGw=oXHB2OrhY-NY4=jDXMZU=0LMEAA@mail.gmail.com>
 <f3019478-1384-fb4c-3531-042dd123ca60@quicinc.com>
In-Reply-To: <f3019478-1384-fb4c-3531-042dd123ca60@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Jul 2022 00:58:10 +0000
Message-ID: <CACPK8XcUkLVzCpw2vVoBQ8nc8Uj9z1GOs30RJgzwy7nWATN_nw@mail.gmail.com>
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

On Tue, 5 Jul 2022 at 14:28, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> Hello Joel,
>
> On 7/4/2022 11:51 PM, Joel Stanley wrote:
> > On Thu, 30 Jun 2022 at 20:02, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
> >>
> >> Add initial version of Qualcomm DC-SCM V1 board to support Qualcomm
> >> specific options.
> >>
> >> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> >> ---
> >>   arch/arm/mach-aspeed/ast2600/Kconfig      |  8 ++++++
> >>   board/aspeed/ast2600_qualcomm/Kconfig     | 15 +++++++++++
> >>   board/aspeed/ast2600_qualcomm/Makefile    |  1 +
> >>   board/aspeed/ast2600_qualcomm/dc-scm-v1.c | 33 +++++++++++++++++++++++
> >>   4 files changed, 57 insertions(+)
> >>   create mode 100644 board/aspeed/ast2600_qualcomm/Kconfig
> >>   create mode 100644 board/aspeed/ast2600_qualcomm/Makefile
> >>   create mode 100644 board/aspeed/ast2600_qualcomm/dc-scm-v1.c
> >>
> >> diff --git a/arch/arm/mach-aspeed/ast2600/Kconfig b/arch/arm/mach-aspeed/ast2600/Kconfig
> >> index 46cc1ad1dbd9..252458846a84 100644
> >> --- a/arch/arm/mach-aspeed/ast2600/Kconfig
> >> +++ b/arch/arm/mach-aspeed/ast2600/Kconfig
> >> @@ -46,6 +46,13 @@ config TARGET_AST2600_INTEL
> >>            AST2600-INTEL is an Intel Eagle Stream CRB with
> >>            AST2600 as the BMC.
> >>
> >> +config TARGET_AST2600_QUALCOMM_DC_SCM_V1
> >> +       bool "AST2600_QUALCOMM_DC_SCM_V1"
> >> +       depends on ASPEED_AST2600
> >> +       help
> >> +         AST2600-QUALCOMM-DC-SCM-V1 is a Qualcomm DC-SCM V1 board which is
> >> +         equipped with AST2600.
> >> +
> >>   endchoice
> >>
> >>   source "board/aspeed/evb_ast2600/Kconfig"
> >> @@ -53,5 +60,6 @@ source "board/aspeed/fpga_ast2600/Kconfig"
> >>   source "board/aspeed/slt_ast2600/Kconfig"
> >>   source "board/aspeed/ast2600_ibm/Kconfig"
> >>   source "board/aspeed/ast2600_intel/Kconfig"
> >> +source "board/aspeed/ast2600_qualcomm/Kconfig"
> >>
> >>   endif
> >> diff --git a/board/aspeed/ast2600_qualcomm/Kconfig b/board/aspeed/ast2600_qualcomm/Kconfig
> >> new file mode 100644
> >> index 000000000000..3ede24c34dee
> >> --- /dev/null
> >> +++ b/board/aspeed/ast2600_qualcomm/Kconfig
> >> @@ -0,0 +1,15 @@
> >> +if TARGET_AST2600_QUALCOMM_DC_SCM_V1
> >> +
> >> +config SYS_BOARD
> >> +       default "ast2600_qualcomm"
> >> +
> >> +config SYS_VENDOR
> >> +       default "aspeed"
> >
> > Out of interest, how does u-boot handle this upstream? Does a board
> > made by company Y with a chip made by company X considered vendor X,
> > or vendor Y?
>
> This code is added into a sub-directory of 'board/aspeed' so the
> SYS_VENDOR must be set to 'aspeed'. If I set that to 'qcom', then
> builder will look for an Makefile under 'board/qcom' instead and it
> makes a failure. The same pattern is already used for ast2600_ibm and
> ast2600_intel.

Yes, that is true, but it's not what I'm asking. There's momentum to
use the upstream tree for u-boot and I want to ensure any patches that
go in from now on are applicable upstream.

Can you do a survey of the upstream tree and see what the pattern is?

If it's to use the manufacturer

> >> +int board_late_init(void)
> >
> > Do you need to include this if it's doing nothing?
>
> The defconfig has 'CONFIG_BOARD_LATE_INIT=y' so this function should be
> added as a dummy function otherwise it meets a build failure. This
> function will be filled by following commits later.

Doesn't it make sense to not set CONFIG_BOARD_LATE_INIT=y if you don't need it?

You can introduce it when you need it (or add the code that uses it
with this commit).

> >> Is there a reason you don't use the gpio driver?
>
> Forgot to reply on this comment. This function is called from
> board_early_init_f and gpio driver is not ready at that timing so
> it uses direct register access.

Why not call it at a later boot stage, so the gpio driver is ready?

Cheers,

Joel
