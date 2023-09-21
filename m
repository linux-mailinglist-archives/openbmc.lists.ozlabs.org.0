Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 637B57A9151
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 05:35:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=IEW4L+i4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rrgyk1TdZz3cBs
	for <lists+openbmc@lfdr.de>; Thu, 21 Sep 2023 13:35:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=IEW4L+i4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=yulei.sh@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rrgy85KJVz2ytV
	for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2023 13:34:55 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6910ea9cddbso234622b3a.0
        for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 20:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1695267292; x=1695872092; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+tNrtuxoDcw7sFlDf3PfkFKReF64yReXC8ncUVVyo0=;
        b=IEW4L+i4wuvvNQqoNE3MmFVhcU7Up6iy2GNfOMuA/EFuqSIwKOBLpoiPd08DqqelA+
         XXUwpVRvdzALY6FJaEVmMFoexXjTFGgNUoUu4yvj7uMUd2pV2VtEC4LFChQaYCq0uFGs
         2y1qe86sXnA3/m+N4/pNvaXX3+0YvPOt2REfow1TVOZb6gmvNPrblMvn0L+zgVf6ZOE1
         tXKlBdsqcKx22aR2Jk+EVGU9CJHTutcOMIBLbzHJ9mujncQwEsuHqO/a30R4lgjo20XR
         Dkwt93uz5kdDYs16BRvPRyeSa5m0J+VTJ6Q6ln18cU1SWE7zU+CWySmHXhMZpKKACzfO
         9Ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695267292; x=1695872092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+tNrtuxoDcw7sFlDf3PfkFKReF64yReXC8ncUVVyo0=;
        b=DMhg9Iw/kT1AtGb4dOWc6a/ME4zF/4+VQVCq9QNaT4leikrc0+XBcnNmWgTTSeOAAb
         ksxMAqijZ02E+cg2ljL+iDmITAznWRe6+OklZqPPDbshB9ftMZH+n/i6+trnWIp9ZQ/t
         Sg0YY0bo7O1kD8gp1QlfIpOLz379Ex/JD+JwjyS1oWUBJTSOMFOJuzckT1xruTjMQoll
         DIshRRM/46S/Uc7OhR9JuTtNhnZ50d4zKBdusiHOmbvL9uskyay2M2y6tAtIEi0408EQ
         ydbkw7Plmp+gEo6fxcMWX6EHImbXcayjHIUbJ9I7G+Ztu4p71ONuhOT7/ZGygf4qIvf9
         xtFg==
X-Gm-Message-State: AOJu0YydhjP5rbhDZ4dB15nyWMTh0rYkjTXrJnd5OGJt5QxHnDQVBIou
	3knDDS0jtf9le98bBW+/9fhWPX3r+PNDJG1FzNZn1T1z274W+cb+NLs=
X-Google-Smtp-Source: AGHT+IGkdeI2prDDHW3ayCLZVaWCvE81CKI0UKkI0/RJ1b5UMEDwhNJYobFHZhAq3uhoXtKUPmf879vLnLINdXiHR3c=
X-Received: by 2002:a05:6a20:7288:b0:140:61f8:53f3 with SMTP id
 o8-20020a056a20728800b0014061f853f3mr4785521pzk.21.1695267292629; Wed, 20 Sep
 2023 20:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7WosgDEJN8gaLu+mC3W1xKAysdZY_pHTz46vqTpun69G0hfA@mail.gmail.com>
In-Reply-To: <CAK7WosgDEJN8gaLu+mC3W1xKAysdZY_pHTz46vqTpun69G0hfA@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 21 Sep 2023 11:34:41 +0800
Message-ID: <CAGm54UGr-ggVcee4NM8jv2C9-v+Q6-HAzsYZDSvGFHRwMwhfXQ@mail.gmail.com>
Subject: Re: Proposal: Removing redundant EpochTime interface from dump entry
To: dhruvaraj S <dhruvaraj@gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 21, 2023 at 11:23=E2=80=AFAM dhruvaraj S <dhruvaraj@gmail.com> =
wrote:
>
> Hi,
>
> In the current implementation, objects implementing the dump entry
> interface implement both xyz.openbmc_project.Common.Progress (for dump
> creation start time, end time, and status) and
> xyz.openbmc_project.Time.Epoch (for dump creation time, which is
> effectively the end time). This leads to a redundancy in specifying
> the dump creation end time.
>
> My proposed change updates the documentation of the interface,
> removing the reference to xyz.openbmc_project.Time.Epoch and adding a
> reference to xyz.openbmc_project.Common.Progress. This is to remove
> the need for updating the creation time in multiple locations.
>
> You can review the change here:
> https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/66680
>
> Please note that this change will have an impact on any applications
> that are currently reading the dump creation time from the EpochTime
> interface. These applications will need to be updated to read the
> creation time from the xyz.openbmc_project.Common.Progress interface
> instead.

Could you please list the impact applications in the openbmc organization?
And could you propose changes to the applications to use
`xyz.openbmc_project.Common.Progress` instead of
`xyz.openbmc_project.Time.Epoch`, so that we get a smooth transition?
Thanks!

--=20
BRs,
Lei YU
