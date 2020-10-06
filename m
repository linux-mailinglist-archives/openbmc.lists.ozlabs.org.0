Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4590C2854CC
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 00:58:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5Xv75FXMzDqJ1
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 09:58:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22d;
 helo=mail-lj1-x22d.google.com; envelope-from=suichen@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=BU0uJjV3; dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5XtM5f9lzDqB9
 for <openbmc@lists.ozlabs.org>; Wed,  7 Oct 2020 09:57:46 +1100 (AEDT)
Received: by mail-lj1-x22d.google.com with SMTP id i2so36597ljg.4
 for <openbmc@lists.ozlabs.org>; Tue, 06 Oct 2020 15:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9jwerf0VVXEP70YLHyNooaWXxyPBGPdoAJgjoLV/4ng=;
 b=BU0uJjV3oGo+kWS81TxdnFcQnhKZ3f1OK4tq9g8UVsHe1Rx2DFVmoAEaCpyACAV05/
 2JaUp5daasIItTRvjGuEzEa3sXNF5nFzCG+m6Ida8ka1rtd2tVYuXLMZu/W2hiro+7aV
 LQgibzXzMy0w7SOc5OyJhppa44F/krfTP+8BVU6L24tgRLs55HBRJV6V3moW1YjVVg/Q
 WcAfcmGFjVbsP4hp3pM2LYtL+AGioN+695HIq/6CgjH9KZ7rqVgqxdbr3DkvdWk+EiZK
 LwxfgQYgiBijXjYpuSzb9YZJh/S9JmcJt7YcrSjnZwZa8KX9yCtvukkgIM04WAEsmi1o
 hLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9jwerf0VVXEP70YLHyNooaWXxyPBGPdoAJgjoLV/4ng=;
 b=feGmW01Oh8D2PYnlTPVHCddO6OX9ZitWZ35n3FqMFQJCX+ZAyHaOBzCdIZWoZ9Eub3
 bT0TGS4We3wE6sXJ/rHPB+dywpBRNisgkY5Hh8POijyt+RTbw+icFy1iJhbDt2nT8O7a
 HzTBYdzy2fl9G5e0oXWtXSVY1lSwrt8seJrcwI1FLVSstRprblRcd3967X1hYzh66Q9N
 7Gr5gi8Jggs/mhPPRGGZNoY7vTAD+nPlaSUMtBp8/SifdzgzgFwOn0L+n62+OIz3gZh+
 mnjjUzhQ28GoKbhxEuq0nZcox3wqbipx/szeRa4D1YfMtJpjAUC4iVi+e9VrzV6d5ytR
 5FhA==
X-Gm-Message-State: AOAM5331TTyJh9GmqAx5a1KBeXUF4+aduwlnW/E+k9BS+Z8as/2rr5J2
 AsG1VazooVHKW/8Xawc5QCeCcQPCA2Ackeg+67JCrw==
X-Google-Smtp-Source: ABdhPJxMHHUeztWg13p0IEgujQikrb4IJ6+yrcHI7NSvTNb9Cu2Yk9kGmhN9i2CuRzZOisQGlabXXQcuY11UTuMqGnY=
X-Received: by 2002:a2e:9d94:: with SMTP id c20mr85608ljj.445.1602025061275;
 Tue, 06 Oct 2020 15:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAJOps0sd-YFr5P+_N0i78pd9akBJS6DP99wugKvUDOGpXw2pcA@mail.gmail.com>
 <D355FA68-E163-4DA8-861E-7E9DB68F5EEB@fb.com>
 <CAJOps0uX9K25NgXpi3M45F=pvvW5Am+9R=wYTLN0SZ2vPUcX-A@mail.gmail.com>
 <EF663847-4E98-4AC2-8A8C-E37B853C131F@fb.com>
In-Reply-To: <EF663847-4E98-4AC2-8A8C-E37B853C131F@fb.com>
From: Sui Chen <suichen@google.com>
Date: Tue, 6 Oct 2020 15:57:30 -0700
Message-ID: <CAJOps0tR5t4sJQX0-fhBJuKJSnQZJm12gWV9S0OYv4xWU7uzKQ@mail.gmail.com>
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

On Fri, Oct 2, 2020 at 1:54 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Hi Sui,
>
> =EF=BB=BFOn 10/1/20, 6:52 PM, "Sui Chen" <suichen@google.com> wrote:
>
>     Hi Vijay,
>
>     We can use whatever means that gets health monitoring done.
>     I have the following questions on how to merge the proposed IPMI
>     Blob-based implementation, google-ipmi-bmc-health (referred to as
>     "IPMI health blob") with phosphor-health-monitor. The intent of havin=
g
>     a separate "google-ipmi-bmc-health" was to avoid these questions:
>
>     1) The IPMI health blob is a library, not a daemon, so after the IPMI
>     health blob is added, phosphor-health-monitor will have both a librar=
y
>     and a daemon. The user needs to have a way to configure it. What is
>     the recommended way of doing this configuration?
>
> Yes the same repo can generate library as well as daemon. Currently it is
> configuring 2 metrics cpu and memory, we can add another entry like
> IPMI blob and if it is there then only it will build ipmi blobs.
>
>     2) We are sending a protocol buffer through the IPMI interface to the
>     BMC, and the protocol buffer may be only used for the IPMI path and
>     not anywhere else. Would there be any concerns on the usage of a
>     protocol buffer here?
>
> If I understand correctly, protocol buffer will be used by daemon who
> Is responding to the IPMI request and connecting to this daemon via
> library call, then it is completely restricted for the use of protocol bu=
ffer.
> If you are passing protocol buffer to this daemon then we have to define
> some policy here.

The Protocol buffer is only for serializing the data to be sent
outside of the BMC. It is not used for communication inside
phosphor-health-monitor and will not be passed to the daemon.

>
>     Other than these two things I think adding new metrics to
>     phosphor-health-monitor should be manageable. I can start by trying t=
o
>     add the IPMI blob handler to phosphor-health-monitor; my first attemp=
t
>     might not look very elegant, but if we find answers to the two
>     questions above, the merged result will look a lot better. Hopefully
>     we can find a solution that works well for everyone.
>
> I am looking forward to your patches

Please check out this WIP:
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-health-monitor/+/3709=
2

This WIP currently just adds the IPMI blob-based code to
phosphor-health-monitor almost as-is.
It also shows what we already have now.

There will be some work to merge the daemon and the blob handler in an
organic way, and I am open to discussion with you how to do that. The
first step I think I can do is to put the code for extracting the
metrics (metrics.cpp, blob/metric.cpp) into a single file and share
that between the daemon and the IPMI blob handler.

Another issue I found is I am not using the latest sdbusplus so I have
to comment out the usage of ValueIface::Unit::Percent for now.

To build this requires 1) adding a pkgconfig file to
phosphor-ipmi-blobs (before
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-blobs/+/37133
gets merged) and 2) adding phosphor-ipmi-blobs and protobuf to DEPENDS
in phosphor-health-monitor's Bitbake recipe.

Hope this WIP change illustrates our intention clearly.

Thanks!
