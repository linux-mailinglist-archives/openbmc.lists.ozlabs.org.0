Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D97953B0CBB
	for <lists+openbmc@lfdr.de>; Tue, 22 Jun 2021 20:20:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8ZSN3mn4z306r
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 04:20:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=F0gogOqI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d30;
 helo=mail-io1-xd30.google.com; envelope-from=benjaminfair@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=F0gogOqI; dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8ZS339V6z2xfd
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 04:19:45 +1000 (AEST)
Received: by mail-io1-xd30.google.com with SMTP id g22so243594iom.1
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jun 2021 11:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/5Pf9pJFlGaw6Z9LJ8CoY7EqYc0fiJ7xpjsuurn6wJQ=;
 b=F0gogOqIV6CwX0LqrDyO9/NCOCjkLgYu2Uj3l1059cTFoEJ3AAvt4HiI7IZwJCssIL
 ousQHMOjFJiLnlqJyNMnIjWI6OVC7j/OyPoFWXx5fjnGrmk9BYtf9VXvhW6xovIsWIQD
 g9QjoouQt5ohelMcoFhuDjD0y74Kk+XOkaa312N9PAxOWf4R5q7q8+nUqrxEZpaGfw53
 2ZsJAMGtEbpEwVahM5339NRXWBdd/mu/NbOKMbNPHcT3a978G8IyGCJyLFByVqUqGMRt
 Wmd80F6vVviWseCP73Vd1ZzBYK4feveRZFF1kPKS9ab3ardupqsWPsK8hCDU9c+pB/FH
 3dkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/5Pf9pJFlGaw6Z9LJ8CoY7EqYc0fiJ7xpjsuurn6wJQ=;
 b=cweI56IjMYEoRieW++3QusWKURXxOfqMwM7ZhgeMtUIELHe+UKql25MGlC5p1Dccuu
 TKdSm5X0Egn7o7pgmnDPoJ9KLadhnS0M3r9e0/3FFQ000KSoOO8wHlDvJ6JcVgNpDRgs
 ZjrIxNaLg8V8yQwuBZS7PclosW1AllHFM6AI6a4Eq8rvgfepJ9gGoiEIoSIrL+coXasT
 ULf1V6ECWOPs+RLXbObTsBuFuFreL1wRHeHC7XS1LgTCxTFVdzIrM3YRTs1rqczT0mq4
 iGaIUxkdPublHJqEcSU2FXrx2e3WjbuaJDwxijVRGe+3iNWs0tapA9FfvJLWmrLQI068
 WDfw==
X-Gm-Message-State: AOAM532k4bbk7wOwnGVklfWIXddwIoT7lFMCu9QU2egSuOM0D7VWUXJg
 x7AV+pBgmuwwc7r4t408rtkpIj1CNry3/gkECiASPA==
X-Google-Smtp-Source: ABdhPJxCB5ROOFZk1kfDNaJJz/PjxlWZav0ZthqAUaBxXNzoR1nwPjif1IJiBMhjKcOx6ke9S2phdZZARVh/st7KM8A=
X-Received: by 2002:a6b:5c0a:: with SMTP id z10mr3949420ioh.122.1624385980725; 
 Tue, 22 Jun 2021 11:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <SG2PR04MB3093DD642B1D80C03EFBAF91E1099@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB3093DD642B1D80C03EFBAF91E1099@SG2PR04MB3093.apcprd04.prod.outlook.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Tue, 22 Jun 2021 11:19:03 -0700
Message-ID: <CADKL2t7rCZ2QYBQfvybYtaoZdKDFoPnJzwr8td_4Qg_=gtv4MA@mail.gmail.com>
Subject: Re: Rsyslog using Redfish
To: Jayashree D <jayashree-d@hcl.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 22 Jun 2021 at 10:18, Jayashree D <jayashree-d@hcl.com> wrote:
>
> Classification: Public
>
>
>
> Hi Ben,
>
>
>
> I submitted the below patch in gerrit regarding rsyslog for my platform.
>
> meta-facebook: Add rsyslog for yosemitev2. (Ife76252d) =C2=B7 Gerrit Code=
 Review (openbmc-project.xyz)
>
>
>
> Also, there are few patches in gerrit for rsyslog which you have submitte=
d.
>
> https://gerrit.openbmc-project.xyz/q/topic:%22rsyslog-refactor%22+(status=
:open%20OR%20status:merged)
>
> Whether these patches will be enough to store the event logs in redfish ?
>
> or any other changes needs to be done for my platform.
>
>
>
> Thanks,
>
> Jayashree
>

Hi Jayashree,

I'm working on restructuring the rsyslog configs so that the Redfish
rsyslog actions can be installed from bmcweb and the IPMI ones from
phosphor-sel-logger. Once this is done, you'll be able to enable a
PACKAGECONFIG option instead of having to copy and paste the
rsyslog.conf file into your layer.

If you'd like to help with this refactoring, you can review the
changes in the rsyslog-refactor topic starting with this prerequisite:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-logging/+/44109

Thanks,
Benjamin
