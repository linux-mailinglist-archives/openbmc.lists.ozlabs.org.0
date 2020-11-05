Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E792A8B09
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 00:55:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CS0lR55NDzDrBj
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 10:55:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::233;
 helo=mail-lj1-x233.google.com; envelope-from=suichen@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=QQLCPex5; dkim-atps=neutral
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CS0kd03f0zDqby
 for <openbmc@lists.ozlabs.org>; Fri,  6 Nov 2020 10:55:01 +1100 (AEDT)
Received: by mail-lj1-x233.google.com with SMTP id t13so3419333ljk.12
 for <openbmc@lists.ozlabs.org>; Thu, 05 Nov 2020 15:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XDkJTe5DtbkzvJz+uzRzHV61Q/YpQ+23dDhFG3pDM0g=;
 b=QQLCPex54pwI0ckCtc3MgS7QfjbfHEcFC5QQ62si+mEcdPXjaHbzREdI+9fWpRWjYi
 WwpMQZj66NWecKl+mfZxOk2x+UH+LOEHmwf904wCcP171+rEAeCSHLjvd8uvKbFVNShp
 UT/xVCY/vmJ5reEyyxDbAjSfoPf/gg3ObZxJfn9SmGyMU+PgG9NV65bkBimxp9uGpWxs
 tveX18aXVUHlFww4vskZChAHyUlkLY92hR2owg05RQuCCbHvUAVd0CN0j95wZTy4ELZw
 mZkyev6f0bf7YDux0lsXZ7AHaFybnG2h5In+SSAuvLh/MMSDdxQQVnvjgRy7ncu9em4C
 uPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XDkJTe5DtbkzvJz+uzRzHV61Q/YpQ+23dDhFG3pDM0g=;
 b=GSF5hQMX9d3oD+v0cKSXxCguQAj0Qct6t4PR9aOLh38YR3UvfZSfMvkOSZlEEuYff7
 MHuJD6vhtiakORWC+ewnpdpm+WG1m5dVEng6tpPnkSU63XHGLK9D4RXLb7q5cB4xThEx
 iVN6Xd8jLGZIVEIa9vPR7nqWFI3M+fLaLHzf2NtIzizM1wmzsbRcKH2sq52f3WBQmGRM
 BxFbV7cuXU4IxuTOv06S2KrJqO2jeHwet3FQ3N4j4PdWCOYVQ2z0/pLRw66nB/dXlZUm
 PwSVMqYeySZGvZeDiL5AAgJEDMkL3ZWYOTEgnXGqLkaxDeQgyetKMH6WFzAsx+3UYnsk
 IhrA==
X-Gm-Message-State: AOAM531WDAKDU7Qyx/xegCZoeiiXOaFwOsTlEjcckb7YHJqnQCv7D8X8
 teV++Bulxbdgg8///Zj6NyICjbemvLs3nJRCfpUKiQ==
X-Google-Smtp-Source: ABdhPJxiWdjtNdAE1u8QCwQGy2Lbqmqi8in9mYnkjUiBH+9I+PXR4uILEcTHgAu7R5D9+bH0yCzshOdYTo9HEOen6+M=
X-Received: by 2002:a2e:85cb:: with SMTP id h11mr258480ljj.226.1604620495929; 
 Thu, 05 Nov 2020 15:54:55 -0800 (PST)
MIME-Version: 1.0
References: <CAJOps0sd-YFr5P+_N0i78pd9akBJS6DP99wugKvUDOGpXw2pcA@mail.gmail.com>
 <D355FA68-E163-4DA8-861E-7E9DB68F5EEB@fb.com>
 <CAJOps0uX9K25NgXpi3M45F=pvvW5Am+9R=wYTLN0SZ2vPUcX-A@mail.gmail.com>
 <EF663847-4E98-4AC2-8A8C-E37B853C131F@fb.com>
 <CAJOps0tR5t4sJQX0-fhBJuKJSnQZJm12gWV9S0OYv4xWU7uzKQ@mail.gmail.com>
 <20201007014324.GG6152@heinlein>
In-Reply-To: <20201007014324.GG6152@heinlein>
From: Sui Chen <suichen@google.com>
Date: Thu, 5 Nov 2020 15:54:43 -0800
Message-ID: <CAJOps0tKN4ACB46hoNu1EeX4uaSZ_UeArzcZ=ehGA2sz0oT+aQ@mail.gmail.com>
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
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 6, 2020 at 6:43 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Tue, Oct 06, 2020 at 03:57:30PM -0700, Sui Chen wrote:
> > On Fri, Oct 2, 2020 at 1:54 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
> > > If I understand correctly, protocol buffer will be used by daemon who
> > > Is responding to the IPMI request and connecting to this daemon via
> > > library call, then it is completely restricted for the use of protocol buffer.
> > > If you are passing protocol buffer to this daemon then we have to define
> > > some policy here.
> >
> > The Protocol buffer is only for serializing the data to be sent
> > outside of the BMC. It is not used for communication inside
> > phosphor-health-monitor and will not be passed to the daemon.
>
> Why isn't this part done from within an existing IPMI provider (ideally
> to me a google-ipmi-* repository at this time)?  I'm not especially keen
> on these details leaking out into other non-IPMI repositories.
>
> > >
> > >     Other than these two things I think adding new metrics to
> > >     phosphor-health-monitor should be manageable. I can start by trying to
> > >     add the IPMI blob handler to phosphor-health-monitor; my first attempt
> > >     might not look very elegant, but if we find answers to the two
> > >     questions above, the merged result will look a lot better. Hopefully
> > >     we can find a solution that works well for everyone.
> > >
> > > I am looking forward to your patches
> >
> > Please check out this WIP:
> > https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-health-monitor/+/37092
> >
> > This WIP currently just adds the IPMI blob-based code to
> > phosphor-health-monitor almost as-is.
> > It also shows what we already have now.
> >
> > There will be some work to merge the daemon and the blob handler in an
> > organic way, and I am open to discussion with you how to do that. The
> > first step I think I can do is to put the code for extracting the
> > metrics (metrics.cpp, blob/metric.cpp) into a single file and share
> > that between the daemon and the IPMI blob handler.
> >
> > Another issue I found is I am not using the latest sdbusplus so I have
> > to comment out the usage of ValueIface::Unit::Percent for now.
> >
> > To build this requires 1) adding a pkgconfig file to
> > phosphor-ipmi-blobs (before
> > https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-blobs/+/37133
> > gets merged) and 2) adding phosphor-ipmi-blobs and protobuf to DEPENDS
> > in phosphor-health-monitor's Bitbake recipe.
> >
> > Hope this WIP change illustrates our intention clearly.
> >
> > Thanks!
>
> --
> Patrick Williams


Hello Patrick and Vijay,

As far as I know, the only two "google-ipmi-*" repositories are 1)
google-ipmi-sys and 2) google-ipmi-i2c, and neither seem to be related
to the health monitoring task we're doing right now.
In my understanding one similar library is phosphor-pid-control; its
IPMI handler is also in the repository rather than in a separate
repository.

The "health monitoring IPMI Blob Handler" (that the request in the
first email in this thread was indended for) was a monolithic IPMI
blob handler; it used to both generate metrics and handle IPMI
requests.
In the last month, I had de-coupled these two functions so the IPMI
blob handler does not generate metrics but reads metrics from the
daemon in phosphor-health-monitor via DBus. In other words, the "monolithic"
handler has now become a thin layer. On the other hand,
phosphor-health-monitor will have to be significantly modified to
generate the metrics that are in a different format from what it's
generating right now, and Vijay and I are working on that. I had create a chain
of changes https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-health-monitor/+/37659
to illustrate what I intend to do.
As a result, there comes the question of where the IPMI blob handler
should live, and it appears I have the following choices:
1. in phosphor-health-monitor, or
2. some centralized location, along with many other IPMI blob handlers, or
3. as a separate, new repository, or
4. something else?

I am facing a confusing situation as to where I should put the IPMI
blob handler, due to conflicting opinions:
1. The maintainers of phosphor-ipmi-blobs told me it's not desirable
to put all IPMI blob handlers into the same place.
2. By reading this email thread, I had the impression that it's not a
good idea to create too many repositories either.
3. Because of #1 and #2, I felt we should put the IPMI blob handler
into phosphor-health-monitor itself, just like phosphor-pid-control
does.
4. In the last reply from Patrick it sounds it's a bad idea to put the
IPMI blob handler into phosphor-health-monitor because of IPMI details
leaking out into non-IPMI repositories.
5. Vijay seemed to prefer to have all IPMI blob handlers in one place
based on our discussion on IRC. However, according to #1 this is going
to face pushback. As such, I created all my changes in
phosphor-health-monitor for review and for showing my intent on how
the IPMI implementation is done.
6. Because of #4 and #5, it sounds like I can't put the IPMI blob handler into
phosphor-health-monitor either.
So now, there is no place I can place this handler, and I am now at a dead end.

I need to find a way out and would greatly appreciate it if we can
reach a consensus here so that BMC health monitoring can move forward.

Thanks!
