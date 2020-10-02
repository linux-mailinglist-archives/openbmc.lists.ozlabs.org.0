Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A817280C29
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 03:53:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C2Y1Z5gTrzDqcq
	for <lists+openbmc@lfdr.de>; Fri,  2 Oct 2020 11:53:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=suichen@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=keufmztz; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C2Y0f2nTYzDqck
 for <openbmc@lists.ozlabs.org>; Fri,  2 Oct 2020 11:52:47 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id y11so982587lfl.5
 for <openbmc@lists.ozlabs.org>; Thu, 01 Oct 2020 18:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tRv3+w2WAt5mrG0sV0rb+dch8F/Ngpzkdi+A/mUk3lU=;
 b=keufmztzVRtpGNdOSpgGGErVeqqVSSOOOv1gNBNyiO7Ig+ZtC5KrHA0f+ohHQI8yqB
 Oi8WNDisEdCwGHKNtQDchUdXoNW2lCqmKyXM9YTz3FgnnbG//YepkljPF4yNo+PZu/5Y
 GBWooXLgwinPK9pMSqH2d4EbZzJZHrwSIRI3b7f6Mq3E7HVBZDKZgtdQoXU8+3OnhLWM
 HxUzE43Ar6I5CBkGqcfCuyQjQibc12ET6+3FeweIF8QJMFJsclg0yAG3Hb6Qef1A7I/G
 J7sG531X1vVZT3ZPTSrwV8Yt14/N+3XKxMQ67y7p/0XB1xDWoWiJkTAyo82w6LPFiuSM
 UZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tRv3+w2WAt5mrG0sV0rb+dch8F/Ngpzkdi+A/mUk3lU=;
 b=lB9DDYaAQYmjJHNXpOq//qRLT0vIwvmgtBFvSDKMAzXPqlfm0lNC461DUl5B0uEj+p
 BToKhbILe5Ji7jnxP5mL0tBvppdGRFGkDf/WDXADkNEJgfY0SWhal1SEKXsUNROWEObm
 4r1UmmYRjr8fpxzeUxsc4r2sBT85uFleGVQWP1H8zw+5dp3I2RqUT/FeXE7qaXpwzCm4
 jVL8gd1QpBNPJ/+na5iRpKvoCGdCYGA6/ELqj0BbhIy8VCZS5fZIzv+lxsLiuYk6C5Cf
 4df+g+l53eDlM6561IL/Dprzcc1X10g8gRa2+PyCN6D4wQSxPezoiEUShgPoJr4NNPji
 J5MQ==
X-Gm-Message-State: AOAM532DTKejNhg77P8w06M87+CqRM2rZlspdN8AeUacjeprhKJqhHDJ
 PkhE5X536NPr25sPzUbG6phyTttMuiAt9u2ioZk61Q==
X-Google-Smtp-Source: ABdhPJwHs2Rij3CZ60/nk95nnWR9CATZhQAb6116I2XoWOQ07fUYu7g8155JepRQLn5QoOnpOonR/sXgUUaRfwMyMuA=
X-Received: by 2002:a19:910b:: with SMTP id t11mr3968193lfd.394.1601603558853; 
 Thu, 01 Oct 2020 18:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAJOps0sd-YFr5P+_N0i78pd9akBJS6DP99wugKvUDOGpXw2pcA@mail.gmail.com>
 <D355FA68-E163-4DA8-861E-7E9DB68F5EEB@fb.com>
In-Reply-To: <D355FA68-E163-4DA8-861E-7E9DB68F5EEB@fb.com>
From: Sui Chen <suichen@google.com>
Date: Thu, 1 Oct 2020 18:52:28 -0700
Message-ID: <CAJOps0uX9K25NgXpi3M45F=pvvW5Am+9R=wYTLN0SZ2vPUcX-A@mail.gmail.com>
Subject: Re: Request to create repository google-ipmi-bmc-health
To: Vijay Khemka <vijaykhemka@fb.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Vijay,

We can use whatever means that gets health monitoring done.
I have the following questions on how to merge the proposed IPMI
Blob-based implementation, google-ipmi-bmc-health (referred to as
"IPMI health blob") with phosphor-health-monitor. The intent of having
a separate "google-ipmi-bmc-health" was to avoid these questions:

1) The IPMI health blob is a library, not a daemon, so after the IPMI
health blob is added, phosphor-health-monitor will have both a library
and a daemon. The user needs to have a way to configure it. What is
the recommended way of doing this configuration?

2) We are sending a protocol buffer through the IPMI interface to the
BMC, and the protocol buffer may be only used for the IPMI path and
not anywhere else. Would there be any concerns on the usage of a
protocol buffer here?

Other than these two things I think adding new metrics to
phosphor-health-monitor should be manageable. I can start by trying to
add the IPMI blob handler to phosphor-health-monitor; my first attempt
might not look very elegant, but if we find answers to the two
questions above, the merged result will look a lot better. Hopefully
we can find a solution that works well for everyone.

Thanks,
Sui

On Thu, Oct 1, 2020 at 12:06 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Hi Sui,
>
> =EF=BB=BFOn 9/30/20, 8:30 AM, "openbmc on behalf of Sui Chen" <openbmc-bo=
unces+vijaykhemka=3Dfb.com@lists.ozlabs.org on behalf of suichen@google.com=
> wrote:
>
>     Hello OpenBMC community,
>
>     We are working on an IPMI blob-based implementation of BMC health
>     monitoring. We currently have an internal working prototype version
>     and would like to upload it to this newly proposed repository,
>     openbmc/google-ipmi-bmc-health .
>
> In my opinion, we can enhance existing health-monitor and add your featur=
es.
>
>     We are aware of existing BMC health monitoring designs such as:
>     1. https://github.com/openbmc/phosphor-health-monitor and its
>     documentation https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__=
gerrit.openbmc-2Dproject.xyz_c_openbmc_docs_-2B_31957&d=3DDwIBaQ&c=3D5VD0RT=
tNlTh3ycd41b3MUw&r=3Dv9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&m=3DZ-_Rsu=
e1ZHBD_TgPw7EDIc8dh8E8o8dlUe8aKr7I5VA&s=3DHTKEM8tcIgwzwL4OQVP1Kcve6ZfnhSToh=
dwPmIrjwe4&e=3D
>     2. https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gerrit.open=
bmc-2Dproject.xyz_c_openbmc_docs_-2B_34766&d=3DDwIBaQ&c=3D5VD0RTtNlTh3ycd41=
b3MUw&r=3Dv9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&m=3DZ-_Rsue1ZHBD_TgPw=
7EDIc8dh8E8o8dlUe8aKr7I5VA&s=3DEcxSrU1PC6Akfy1FR0wo-5TC_QvMld9SDT7pJAh5QcM&=
e=3D
>
>     Main differences between this implementation and existing ones are:
>     - google-ipmi-bmc-health is implemented with the IPMI blob handler
>     framework and exists as an IPMI blob handler, while
>     phosphor-health-monitor runs as a daemon and exposes BMC health
>     metrics on DBus in the same manner sensors are exposed.
>
> Is this going to be a library or daemon, Same health-monitor daemon can
> Be enhanced to add these functionalities.
>
>     - This implementation does not check health metric values against
>     thresholds or perform actions when thresholds are crossed.
>
> If you don't define threshold in configuration file, health-monitor will
> also not monitor metrics defined.
>
>     - This implementation currently reports uptime, memory usage, free
>     disk space, CPU time consumed by processes, and file descriptor stats=
.
>
> Same can be added as extra metrics. That was the goal of this repo as to
> start with basic metrics and add more as required.
>
>     - This implementation does not read a configuration file yet. It
>     always reads the hard-coded set of health metrics listed above.
>
> We can enable or disable certain metrics through this configuration file.
>
>     - This implementation does not post-process sensor readings such as
>     compute the average CPU usage over a certain time window.
>
> Window size 1 can give latest data rather than averaged data.
>
>     As such, this implementation differs enough from existing ones such
>     that we believe we have enough reasons to have a separate repository
>     for it.
>
> I will strongly prefer to add all of the features in the existing repo.
>
>     Thanks!
>
