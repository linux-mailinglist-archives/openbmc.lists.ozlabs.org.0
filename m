Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1692B557E
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 01:02:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZmNF5fJrzDqPj
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 11:02:37 +1100 (AEDT)
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
 header.s=20161025 header.b=jUxIfPiH; dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZmLV66j0zDqQx
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 11:01:05 +1100 (AEDT)
Received: by mail-lj1-x22d.google.com with SMTP id v20so22177685ljk.8
 for <openbmc@lists.ozlabs.org>; Mon, 16 Nov 2020 16:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cx3qf8nHtlpXf3laDHqIV/Wh004ug6iw9xl9YsSYKJ4=;
 b=jUxIfPiH66tdjM0BBrv0daf2EhExKiR0KWFECA4Y6MIBsoyf+uHvmipbEotcQ8g8i0
 SVs2KG7932ytpioMucuOwhQ/CJ/nsiOlQ806iHQUVm7vp2N9cm/GhSNHTghXGhZv8BKz
 jF43ZjHKA1ci5mVYSMNUC20dYeG33yCngD7WkUIHA0vS4AUSonlBXXzFVOQhwP9uZXJS
 qVE+9AFeF5ok362A7vCWteexiB+SUQwGb69PPmjcoSQqhkN3b1yO+JySX+fEIyg+uRht
 ncEjLWcOYQwNC/Mjs+Ngm0+QeYfgzeYj6a68Vi/yMVZON87eiU78VLmSwDjNOfQjjYuV
 q98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cx3qf8nHtlpXf3laDHqIV/Wh004ug6iw9xl9YsSYKJ4=;
 b=X+kHN/GBm2+dtQnkMut+VeXqQCpTVpMBXY2Ej2aKa5SWZjO9ekVoySTHTe2IfXm0Fs
 Ws+SaYb8uh8Mz8ByHYwPea8ZYrIszTa4i0rEV2y8GF7ekjN/QCywybbLmfirZJehdulH
 gNofYgqr/LvA+XyR1o38YH0wGnMdrrBw+ISemC5EhuzSTl+t9m4GPu5yA2HoX1fzyAdt
 2nXyzOo5DG/w4frjO1Vhz116zrUkPo4C5tYwm/r6qOifcPmkE1L5OgKSrDIIQqIk4RoE
 U/eVgEhiVGj2ymYL0mJQRVMHA6yfCL+SZQBX7pHv1NDMP0gk+4mzKkegBH/ovtyIZajZ
 1T8g==
X-Gm-Message-State: AOAM532qGMSJNcei4rC7kxKr7n6KqE4JWo3KD7iIgM6oRiN3c3Yt87Ui
 1+7RcqMS0mHUJSXLKfw8zNgYmrLOtm51LcOYF2iAhA==
X-Google-Smtp-Source: ABdhPJw/Tg8N+qOm+ZgOCJPmYrEFnrkPAF3rLz/GyPZ3N2F7PqddpnkX1mv0HwNy9MMY8ympIVUm+LdpbV8IZcnahew=
X-Received: by 2002:a05:651c:2c1:: with SMTP id
 f1mr656368ljo.192.1605571260442; 
 Mon, 16 Nov 2020 16:01:00 -0800 (PST)
MIME-Version: 1.0
References: <CAJOps0sd-YFr5P+_N0i78pd9akBJS6DP99wugKvUDOGpXw2pcA@mail.gmail.com>
 <D355FA68-E163-4DA8-861E-7E9DB68F5EEB@fb.com>
 <CAJOps0uX9K25NgXpi3M45F=pvvW5Am+9R=wYTLN0SZ2vPUcX-A@mail.gmail.com>
 <EF663847-4E98-4AC2-8A8C-E37B853C131F@fb.com>
 <CAJOps0tR5t4sJQX0-fhBJuKJSnQZJm12gWV9S0OYv4xWU7uzKQ@mail.gmail.com>
 <20201007014324.GG6152@heinlein>
 <CAJOps0tKN4ACB46hoNu1EeX4uaSZ_UeArzcZ=ehGA2sz0oT+aQ@mail.gmail.com>
 <BC4115A9-0587-4135-981E-38C086DDD3F9@fb.com>
 <CAPnigKn5cRVz3RuK-czkHVo2od1ZLpHCVgRu9q4OET-_nPwrWw@mail.gmail.com>
 <20201111121431.GI3614@heinlein>
In-Reply-To: <20201111121431.GI3614@heinlein>
From: Sui Chen <suichen@google.com>
Date: Mon, 16 Nov 2020 16:00:47 -0800
Message-ID: <CAJOps0vS6+eiZSdL=w6Trb2K_rTj3Rb2TTyp5_n2=_YrjUgH_w@mail.gmail.com>
Subject: Re: Request to create repository google-ipmi-bmc-health
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>, William Kennington <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Nov 11, 2020 at 4:14 AM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Tue, Nov 10, 2020 at 10:38:55PM -0800, William Kennington wrote:
> > My 2c... We have plenty of blob handlers that have their own repos to keep
> > maintainership and purposes separate. The phosphor-ipmi-blobs
> > repository intends to provide a framework, not specific implementations.
>
> Thanks William for the background on phosphor-ipmi-blobs intentions.
>
> > On Tue, Nov 10, 2020 at 10:35 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
> > > <11/5/20, 3:55 PM, "Sui Chen" <suichen@google.com> wrote:
> > >     The "health monitoring IPMI Blob Handler" (that the request in the
> > >     first email in this thread was indended for) was a monolithic IPMI
> > >     blob handler; it used to both generate metrics and handle IPMI
> > >     requests.
> > >     In the last month, I had de-coupled these two functions so the IPMI
> > >     blob handler does not generate metrics but reads metrics from the
> > >     daemon in phosphor-health-monitor via DBus. In other words, the
> > > "monolithic"
> > >     handler has now become a thin layer. On the other hand,
> > >     phosphor-health-monitor will have to be significantly modified to
> > >     generate the metrics that are in a different format from what it's
> > >     generating right now, and Vijay and I are working on that. I had
> > > create a chain
> > >     of changes
> > > https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-health-monitor/+/37659
> > >     to illustrate what I intend to do.
> > >     As a result, there comes the question of where the IPMI blob handler
> > >     should live, and it appears I have the following choices:
> > >     1. in phosphor-health-monitor, or
> > >     2. some centralized location, along with many other IPMI blob
> > > handlers, or
> > >     3. as a separate, new repository, or
> > >     4. something else?
>
> Sui,
>
> Now that the design has been separated so that the majority of the
> metric implementation is in p-h-m and the protobuf-ipmi-specific parts
> just do light-weight dbus operations, it seems reasonable to me to
> create a new repository to hold that part.  That part seems fairly
> unique to what Google intends to do and I don't think we should burden
> the maintainers of another repository with that effort.
>
> I don't have a strong opinion on the IPMI blob handlers being all in one
> vs spread out in individual repositories, as long as those repositories
> are light-weight translations from the dbus APIs to the specific IPMI
> blob format.
>
> --
> Patrick Williams

Hello Patrick,

Thanks for your understanding for our request to create a new repository.

Our team had also met last Friday for a discussion on where the
implementation of the blob handler should go, and we also agreed it is
preferable to create a new repository compared to putting its
implementation in phosphor-health-monitor or phosphor-ipmi-blobs.

Now that the IPMI blob handler lives in its own separate repo, it
seems to me that the design does not have to be separated right now;
the new repo could, for now, hold the monolithic IPMI blob handler
where the metric implementation is entirely in the handler.

In the meantime, we will continue to work on the separated design
where the blob handler does light-weight dbus operations against the
daemon, starting from addressing the comments. This might take some
time but we are invested in its design proposal and we are determined
to finish implementing it.

If this plan sounds reasonable, can we request to create the
repository now? If the word "health" in the name is a concern, how
about "google-ipmi-bmc-metrics"?

Thanks!
Sui
