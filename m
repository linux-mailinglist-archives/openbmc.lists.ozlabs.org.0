Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E8E59D01B
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 06:36:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBbzC22mtz3c3N
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 14:36:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=luWM6ek5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=luWM6ek5;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBbym3m2kz2xJ5
	for <openbmc@lists.ozlabs.org>; Tue, 23 Aug 2022 14:36:14 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id d16so10239662wrr.3
        for <openbmc@lists.ozlabs.org>; Mon, 22 Aug 2022 21:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=cEgOCI8EbnJ97VHfcV7h6VBYNuO8xsuYEpeTw5J1wrU=;
        b=luWM6ek5Pfl9nzDrAgMSnFgXfmUQTKsA1rdkitLC7OrkKhOs62MsUF1zmAeeM+G/S7
         R5rIUCl382e63PZ/9U+hMcf+IT6BUeyRFL36PuG4x3FVmmTwYnl6VfeGbJP1La94BgUY
         D1kovSZHD8OtLMR6WIA70Ma1yTQuz7+3oiWtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=cEgOCI8EbnJ97VHfcV7h6VBYNuO8xsuYEpeTw5J1wrU=;
        b=1HSorBtmXGAxCpfwbMMxBGS7TwmOPs2EURpcDETPHHabUHVOvCvl0iV2+mIF/q6km6
         4D4/zJWpQ7mhlztcABQ6DCbFfw5Sv5nb9o0zLWPbQIG7xEmhjNHqgV+eDqcR9hgeaBH5
         ATRD/byk4RLlX41s4N4jSTfB8A6mqelzjD/DDr/5OlkOUyOU36OIvmRUU97lEAEV1H+/
         XpzH6twWg8mypxaUN5D3dHelxVDZjNlQPLPH0cYL6RY4jFLx/Pmq5UAc0eDhvClplTvB
         xgQBvg5AJl6tg1ceDVC/PWjhYTKa1MPfbAxeXsgs3ddqk5vQ7kfCH+y7szNn5+V33/Pz
         eTiQ==
X-Gm-Message-State: ACgBeo2/v4sZv2y5yf4eIPgWe5OB2F68Xb2LWbhrL/83kVA5fq8Q/jmP
	0kXhn1H8U+eXeOgvfZM6mgW2q/IsRXJ+BY29kuw=
X-Google-Smtp-Source: AA6agR46skeBLMWqRoWnwJEcFFU0ThkeIQJ0ez3lk5TnRshO1JJv9TEI8Bi+kwE/MqOhaHQqoVl3TU8EBx68no6xX+Q=
X-Received: by 2002:a5d:6484:0:b0:225:55d8:d528 with SMTP id
 o4-20020a5d6484000000b0022555d8d528mr4850210wri.3.1661229365199; Mon, 22 Aug
 2022 21:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8Xe4ijKWnURT4T9em2pUqifNdkZUfg0dd5osATYnqqutSw@mail.gmail.com>
 <7c9df7e6-3ad4-e9bc-278d-ff32ae945023@linux.microsoft.com>
In-Reply-To: <7c9df7e6-3ad4-e9bc-278d-ff32ae945023@linux.microsoft.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 23 Aug 2022 04:35:52 +0000
Message-ID: <CACPK8XefOyAdfoJ3G1ae3=sWmdZWRY-30+=697+5NsNGL9XiEg@mail.gmail.com>
Subject: Re: Removing machines using old u-boot tree
To: Dhananjay Phadke <dphadke@linux.microsoft.com>
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

On Tue, 23 Aug 2022 at 04:18, Dhananjay Phadke
<dphadke@linux.microsoft.com> wrote:
>
> On 8/22/2022 6:13 PM, Joel Stanley wrote:
> > Hello machine maintainers,
> >
> > The following (see end of email) OpenBMC machines are using the old
> > v2016.07 u-boot fork. I would like to see machines updated to use the
> > new fork so we can reduce the maintenance burden of u-boot.
> >
> > We have two options: move to the newer u-boot fork, or retiring
> > (removing) systems that lack the maintenance effort to stay up to
> > date.
> >
> > The v2019.04 u-boot fork supports both NCSI and direct-PHY network
> > configurations. For most systems the steps required to update are:
> >
>
> 2019.04 is still old to sustain with backports, e.g. files in common/
> were moved around in upstream u-boot.

Yes I agree.

> Looks like much of Aspeed stuff (other than ast2400 and spi driver) has
> been upstreamed already. When can openbmc switch to modern upstream tag,
> say v2022.07 and stage anything not upstream on top of it in u-boot
> mirror?

That's a great point. The project's goal is to move to a branch based
on the latest tag (or even using upstream directly, one day).

There's enough support upstream for booting a direct-phy attached
device on the 2500 and 2600. We lack:

 - NCSI integration (patches from myself on the list and reviewed)
 - SPI flash driver (patches from Chin-Ting on list)
 - eMMC booting support for the 2600 (I made some changes recently,
but they are not sufficient)
 - 2400 support

I have a WIP tree here with the pending patches:
https://github.com/shenki/u-boot/commits/aspeed-queue

With the NCSI and SPI changes merged, we could support the 2500
platforms with upstream.

Once eMMC booting support is merged, we could support 2600.

There are some other requirements beyond booting. For instance, the
IBM P10 ast2600 machines require the otp command for manufacturing. I
suspect there are other hidden requirements that we will need to shake
out.

I welcome efforts from anyone willing to help reduce our delta to upstream.

Cheers,

Joel
