Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EEB49022A
	for <lists+openbmc@lfdr.de>; Mon, 17 Jan 2022 07:55:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcjMz4Rymz2xD7
	for <lists+openbmc@lfdr.de>; Mon, 17 Jan 2022 17:55:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=nDB0GvUw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=nDB0GvUw; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcjMY5Wwfz2xBq
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jan 2022 17:55:03 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id d11so5579091qkj.12
 for <openbmc@lists.ozlabs.org>; Sun, 16 Jan 2022 22:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ctQEazSwV5U4oHFi3eEOBhBzb9/tA5feg3+nZegCIB8=;
 b=nDB0GvUwW9+4J1tZBiVPBtAd9WrXc3rzNc/naHhfpHTTOH9kDbgK1vP8CgbhNXuiJx
 D6YlhSDelWC8eB+EeDlIfqDwXnGvN6W5NLDtU4FNePD8wyrKsAmeIwxREOunpsbj04Gs
 PuycV6IKbv8dNAMYBpWK3kOd6vtO2CfFvsqGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ctQEazSwV5U4oHFi3eEOBhBzb9/tA5feg3+nZegCIB8=;
 b=fMITL6OKaMSHnIORPH3DuPZhRymeyONvb5VwIolWYFL0NVeQR7Jt95S7ZJgwsUZS0M
 1r6fYfveOs0Gdb3Odk5AeEogM2Bxm6W1tOWpJbJSx4LMUpsQQ5QAOf4dYZRu6vZ3LUIt
 h5Hs2PdR6HESAo3ROEovnWfFNM3Kkmmusg2eW4KZA6nBIJWVHk5h5xSyb7ssHWD8mlB4
 XNgC9+ZyD3IaDr1uH1CNkZjnIZPBdwGvp47j/R0VudZlrXCmpuGg/R4kKdwXdjN41Sn0
 mjaRxIsPJDT81CpMKlyAohZHGCdBs4LQuVmExBNGEzi4HzA1hEhcMzRqiGRKNbGIaqRS
 nwLA==
X-Gm-Message-State: AOAM5336BJK3V96ng063mAiuMJI61FVNlSukze/E1moP3eZUg7DIkMQI
 y4k68E6oeahBIxGSREEnSFpn1ROGlNDhBjtqhTGSRegnE2U=
X-Google-Smtp-Source: ABdhPJwtOIM9HgmolaCtWHco0P6I+2KWMIyr0QSg5dggxyR30UDt1Wm2fGq0bKbmSIZau3xjX/CqfGuBxQy46UZLzkU=
X-Received: by 2002:a37:a342:: with SMTP id m63mr11993099qke.347.1642402500377; 
 Sun, 16 Jan 2022 22:55:00 -0800 (PST)
MIME-Version: 1.0
References: <CAGpPFEFoTO-cUxvxEnoNQ3YoKBWRK+pOeyGzni6E5Da-=w+stA@mail.gmail.com>
 <CACPK8Xec1P8xF9t8Uj1Fg0YsX4v6Y6Gi=KkeZD70AoLPqZB=PA@mail.gmail.com>
 <YeHE3qPWS0LpmLIb@heinlein>
In-Reply-To: <YeHE3qPWS0LpmLIb@heinlein>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Jan 2022 06:54:48 +0000
Message-ID: <CACPK8XebyrX1jpiJxsvH7+kJxKYMWgbWG7GZYi9BU9qYJWHi6w@mail.gmail.com>
Subject: Re: Procedure for the send review on u-boot patch
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, velumanit@hcl.com,
 logananth hcl <logananth13.hcl@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 14 Jan 2022 at 18:45, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Thu, Jan 13, 2022 at 10:40:40PM +0000, Joel Stanley wrote:
> > Hello,
> >
> > On Thu, 13 Jan 2022 at 08:52, logananth hcl <logananth13.hcl@gmail.com> wrote:
> > >
> > > Hai All,
> > >
> > > In openbmc/u-boot repo(branch - v2016.07-aspeed-openbmc)
> > > https://github.com/openbmc/u-boot/tree/v2016.07-aspeed-openbmc
> > >
> > > I want to send a review on this particular branch in u-boot through upstream.
> > > Is there any specific procedure to upstream it,
> > > kindly provide your suggestions.
> >
> > I strongly recommend using the newer v2019.04 based branch for any new
> > system you're bringing up.
>
> It doesn't seem like anyone is using this branch for any Aspeed system though.

- Bytedance use it for g22a
- Yadro use it for the vegman series of machines
- inspur use it for the fp5280g2 (I learn this when grepping!)

$ git grep PREFERRED_PROVIDER_u-boot |grep u-boot-aspeed-sdk
meta-aspeed/conf/machine/include/aspeed.inc:PREFERRED_PROVIDER_u-boot:aspeed-g6
?= "u-boot-aspeed-sdk"
meta-bytedance/meta-g220a/conf/machine/g220a.conf:PREFERRED_PROVIDER_u-boot
= "u-boot-aspeed-sdk"
meta-inspur/meta-fp5280g2/conf/machine/fp5280g2.conf:PREFERRED_PROVIDER_u-boot
= "u-boot-aspeed-sdk"
meta-yadro/meta-vegman/conf/machine/include/vegman.inc:PREFERRED_PROVIDER_u-boot
= "u-boot-aspeed-sdk"

(I just noticed that others have pointed this out too).

>
> ```
> $ git grep "v2019.04"
> meta-aspeed/recipes-bsp/u-boot/u-boot-common-aspeed-sdk_2019.04.inc:PV = "v2019.04+git${SRCPV}"
> ```
>
> I think everyone doing AST2400/AST2500 work has been copying from existing
> systems and still pointing to the v2016.07 branch that we have working in the
> tree.

Where possible I review for this. If there's a way for gerrit to tell
me when a new machine is added I'd enforce it more often.

I've mentioned on the list before that I'd welcome a change that flips
the default to the new tree. That would require setting
PREFERRED_PROVIDER_u-boot for all existing aspeed 2400/2500 machines
that don't have it set, and then changing meta-aspeed.

>
> > However, if you insist on the older branch, you can send patches to
> > the list for it. Indicate in the subject that they are for the old
> > branch:
> >
> > git format-patch --subject-prefix "PATCH u-boot v2017.07-aspeed-openbmc"
>
> I think the question is two-fold:
>
> 1) How do we get the code into the tree that everyone is using? (Which you've
> answered)
>
> 2) What is the best way to get feedback from upstream on the proper way to do
> this?
>
> Is most of the Aspeed content fully upstream now?  I thought it wasn't and was
> still in yet another Aspeed U-Boot tree.

More of it is upstream. The 2600 patches are on list, and could go in
at any time. The 2400 support could be posted and merged too.

Aspeed are making progress there. I would encourage companies to help
get support merged by having someone work on it, or funding an expert
to do so.

Cheers,

Joel
