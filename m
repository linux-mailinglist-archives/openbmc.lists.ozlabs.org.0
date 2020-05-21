Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D03A61DD33C
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 18:45:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Sb8G35srzDqpr
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 02:45:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::133;
 helo=mail-il1-x133.google.com; envelope-from=suichen6@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WuOnhL2g; dkim-atps=neutral
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Sb7C63F4zDqf4
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 02:44:21 +1000 (AEST)
Received: by mail-il1-x133.google.com with SMTP id 18so7745829iln.9
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 09:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b5kJ0O/K7/OPMuJWt9IflhPuXK2DMMrfwEybyj4yqn8=;
 b=WuOnhL2glFLAHfZG998XQ7o0Y9bY8kOMsqheahmW/Ne8ZCHfhpyugiVo0QMYqhtGDY
 h3pH8mY7B33K56L2pQUGCUFmU/v8ZTN4uuDvxqM/J8SDjYP3koASWAmwUJHmppCDe5RZ
 f7yfa4W7aGNhZUGkM4razPedHYLytwE9OE7T9jrt4h760ohLSxEQ2w+VjpdpTHEj/d08
 bZQztDydQPUHm+omvWLga2sHNFqrovx3CypTaPJvcFiG/rx7iuBi49zVSAcKkBgLgEmA
 2/S91GWVDu2U2QiEFHPlcEhqv/LHx0/C1+WWLIXFnRa/3PzEVs4IN8UlnN6D0ftMvaNJ
 vXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b5kJ0O/K7/OPMuJWt9IflhPuXK2DMMrfwEybyj4yqn8=;
 b=HbKI0zZa9XLZupI4iq6KnzSm+y7rWHf26IpN5gfPNUBJhQmtIN9dNbXowH9eM2y+5f
 RmA1hAQVGoDKf55TKhiUAJLv1n/IJwDnu5fH5OvhaWhc+2M2He0wbXRGC4OXI9dEws/J
 t0rNGIp31eHVseFt6iJJ96+40TQXCvYbuwU5D+qsNIFTr0uBOaZCVp6KbdAFCQsVxDhZ
 9xbIr/WDwFEos+cPO5AoZAma6rX3IXUTv+x5bO0f9Ex0pS/kRxV5jLnmd66X9XH2Wf5k
 WZQhC68BPj3+llqYLSCbxZqeoebIDNdASpPUjViTVW6foT/E1n2X1VRfsYK996ljsXzz
 YlKg==
X-Gm-Message-State: AOAM531nmxE9+EkchpVPDqCI8/GVvgX+jtxFM5sjA2bhWj5aBSrlEUwd
 LHsmgSYjV/nGsg2zyDw9ZTYRrdAGbAiZS/QY77Z2TGxepc8=
X-Google-Smtp-Source: ABdhPJz0GAR+eIMRQlg3NI9q0zwGtiqtkWYCjAqzL/VOkXOvGdqDnmSFcQNENcUmKKfIfzufkGSLPvgLpAWq3Kzr6eg=
X-Received: by 2002:a92:cf0a:: with SMTP id c10mr9539823ilo.196.1590079457915; 
 Thu, 21 May 2020 09:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAFaEeaFTP9v1xZefxzoU9E6h7SpjfbxVrnnSRCmJfJ3QjWRqhA@mail.gmail.com>
 <20200514135723.GE1166713@heinlein>
 <3d6db63b-f670-4e01-94c3-425f93d89708@www.fastmail.com>
In-Reply-To: <3d6db63b-f670-4e01-94c3-425f93d89708@www.fastmail.com>
From: Sui Chen <suichen6@gmail.com>
Date: Thu, 21 May 2020 09:44:05 -0700
Message-ID: <CAFaEeaGs0GSiPp9mGVrSMB1brG19ttroPcK-x-p+BN3SnHrU4g@mail.gmail.com>
Subject: Re: An IPMI Request Visualization Tool
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Andrew and Patrick,

Thanks for your interest! I'm also using dbus-pcap to track certain
issues on the BMC recently, and would like to add support for all DBus
messages to the visualization tool, making it somewhat resemble a GUI
version of dbus-pcap.
The goal would be to be able to use this tool to investigate both DBus
and IPMI. The way I plan to use it would be more similar to how I use
GPUView (full-system timeline rather than inspecting individual
packets)

If you ask how this user interface might differ from the already
existing dbus visualizers such as bustle, my answer would be: it will
present information in a way that's more relevant to the BMC, putting
a bit more focus on BMC-specific DBus messages, such as HWMon and
RedFish DBus messages, to present information in a high signal-noise
ratio way.

If this makes sense to you, can I know what might be a better way to proceed:
1) Create a change in openbmc-tools? or,
2) Create a new repository under openbmc? or
3) Create a personal/organization-managed repository and create a pull request?

Thanks,
Sui


On Mon, May 18, 2020 at 6:38 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Thu, 14 May 2020, at 23:27, Patrick Williams wrote:
> > On Wed, May 13, 2020 at 03:38:47PM -0700, Sui Chen wrote:
> > > We're working on a GUI tool that allows the user to capture and visualize
> > > BMC IPMI requests.
> > >
> > > The tool accepts 2 kinds of inputs:
> > >  1) Load a DBus traffic dump file generated by dbus-monitor on the BMC
> > >  2) Capture IPMI requests on the BMC -- the tool connects to the BMC
> > > console by launching a program of the the user's choice (example: ssh or
> > > telnet), then starts "dbus-monitor" on the BMC and checks its outputs for DBus
> > > calls on the IPMI daemon and then draws the IPMI requests on the canvas
> > > accordingly.
> >
> > > A screenshot is attached to illustrate what it does:
> > > [image: scrnshot_compressed.png]
> >
> > Neat.  I wonder if we can use this to analyse dbus messages with high
> > amounts of latency (especially once that are infrequently latent) in
> > order to better target which processes we should move towards async
> > calls.
>
> For what it's worth I have a script for parsing D-Bus pcaps:
>
> https://github.com/openbmc/openbmc-tools/tree/master/amboar/obmc-scripts/dbus-pcap
>
> It's helped me tracked down unexpected latencies and other weird
> behaviours in the past.
>
> I've just pushed a change adding a README to introduce the capabilities
> and provide examples of usage and output:
>
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/32583
>
> Cheers,
>
> Andrew
