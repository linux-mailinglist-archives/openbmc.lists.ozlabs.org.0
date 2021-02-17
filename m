Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A026231E024
	for <lists+openbmc@lfdr.de>; Wed, 17 Feb 2021 21:24:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dgq7r55rPz3cSN
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 07:24:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20150623.gappssmtp.com header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=As+gy4EJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=As+gy4EJ; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dgq7d0bBjz30JL
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 07:24:26 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id u75so282041ybi.10
 for <openbmc@lists.ozlabs.org>; Wed, 17 Feb 2021 12:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8oLzAC02Gkm/Fh2MDIzbaSva17t7bqRY1qprrdRJxkM=;
 b=As+gy4EJwiv68Qd+FujQX41JiHWpIiYmHDicUnOE38l+fM985cVgsZYckrRkoUrJlF
 Yfb0qGrRxp3prCBdsdEyFgJ0VpKMKsjE+Ztxx+VUP5Ezz9L6RIsh5JgngBabWkYKWOgr
 A1M/jj4ST3Xc6u0uLL4Tcm0cl0Z+mwy/RNcf3EySTl9iiWrVfUKB+vLHs5mw1bG5pl4k
 L1mFmypeKxbzeZe3H168BA7A3e2BQOyoS0HoQN6BU3ADbXvVhKgG6wc2BaOPjjdil3nT
 wMqX2fNcS7P0bjstIxEIF2SrjkT9JJ2ywC5Emgfsms2EI6/sCh8PoBarXyAYw6NAPK5b
 CVfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8oLzAC02Gkm/Fh2MDIzbaSva17t7bqRY1qprrdRJxkM=;
 b=gJI7+gf5KBQnrKTF2PAqS8/DlubY0NrcXp1NLRZVYE08ACOpJGBugelV6s1XO12eTg
 S7WwF+bhbcUfDK/C0yZbBhNzzXHbjuk0l5SZnXK9/MqG4gYHftMut/HkA3+qciy9tTwz
 bNAFnQ885S74/9K72X/MLzK3jz/JYb2nxrBmvUzQeOJGlaRWL95JBIASEd1AZoswcmz1
 elwRVvDisTQHFG57/xQYbusZifldmc+7nCHG22C6HRr6J7JPEErLtDUcSdkDXw1ymhPc
 RjqAPuo2J0gdmvZQe7z/QnVjcp83r6qrHEaCj8wCOdkgogVjhSgAsAO87qerVKJtdQwg
 w7sg==
X-Gm-Message-State: AOAM530Qr/6eI8MYgcwdhkFgFtld7ttFHiW5yQm0XRWoD6oHXfiLQj64
 1bWebKahrLRwEr/H+qVZLgl0TzscxzfWqE6rrFC+qQ==
X-Google-Smtp-Source: ABdhPJztqB96mDha+uvK3lAA1vZjRj+yvKkjxw/ITXxGrvbPqf+QMmYRVA6tV9oUsvIBduVbqaDFq/17ZUdZTYM8pQ8=
X-Received: by 2002:a25:8687:: with SMTP id z7mr1535565ybk.209.1613593462715; 
 Wed, 17 Feb 2021 12:24:22 -0800 (PST)
MIME-Version: 1.0
References: <SG2PR02MB2796B5FB2DB9AAAE2594BA1E858B9@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <SG2PR02MB27961D3A938C94341747757C858A9@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <CACWQX807_KpeTHnMqPMt8E+h_ggMpKy0_Jr82HPV+oRushXdXw@mail.gmail.com>
 <SG2PR02MB2796736A2D3DCEB0AC9AEC9985869@SG2PR02MB2796.apcprd02.prod.outlook.com>
In-Reply-To: <SG2PR02MB2796736A2D3DCEB0AC9AEC9985869@SG2PR02MB2796.apcprd02.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 17 Feb 2021 12:24:11 -0800
Message-ID: <CACWQX80r9dYEGbwftH32Sc6fRmDLHeYg24tdO+8hME9V_bDDCg@mail.gmail.com>
Subject: Re: Redfish v1/Systems/system/EthernetInterfaces
To: "Udupa.Ashwini ISV" <udupa.ashwini@inventec.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 17, 2021 at 12:13 PM Udupa.Ashwini ISV
<udupa.ashwini@inventec.com> wrote:
>
> Hi Ed,
>
>
>
> Its Inventec platform.
>
> https://github.com/openbmc/openbmc/tree/master/meta-inventec
>
> I just wanted to know how to implement /redfish/v1/Systems/system/Etherne=
tInterfaces.

Excellent, that helps.  I originally misread, and thought the
interface was missing on the platform, not that you were trying to add
it to redfish.

>
>
>
> Regards,
>
> Ashwini

Please don't top post.

>
>
>
> From: Ed Tanous <ed@tanous.net>
> Sent: Saturday, February 13, 2021 10:18 AM
> To: Udupa.Ashwini ISV <udupa.ashwini@inventec.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Redfish v1/Systems/system/EthernetInterfaces
>
>
>
>
>
>
>
> On Sat, Feb 13, 2021 at 10:11 AM Udupa.Ashwini ISV <udupa.ashwini@invente=
c.com> wrote:
>
>
>
> Hi,
>
>
>
> I am new to OpenBmc and Redfish.
>
> I saw in bmcweb/Redfish.md, that below Redfish is targeted for OpenBmc:

This doc is really old, and was originally written as an initial stab
at what interfaces we should write.  Unfortunately, when it got
converted into a "here's the interfaces we support today" doc, that
path didn't get scrubbed.  We don't have an implementation of it
today.  I can get a review open to update the doc.

>
> /redfish/v1/Systems/system/EthernetInterfaces
>
>
>
> But, in redfish-core/lib/systems.hpp, I don=E2=80=99t see EthernetInterfa=
ces and I don=E2=80=99t see it on my server Redfish too.

Today, we don't have this implemented because we don't really have a
path to get that information from the host.  Doing that would require
either an in-band application running on the main processor to send
new ip addresses to the bmc, or an NCSI, MCTP, or PLDM connection
directly to the NIC that supported getting that level of information.
Both of which likely require a new daemon to expose those APIs to
debug.

We do have /redfish/v1/Systems/hypervisor/EthernetInterfaces today.
We'd ideally want to follow very closely to what that does, expose a
new path on DBus that implements the
xyz.openbmc_project.Network.EthernetInterface interface, and grab the
data from it.

>
>
>
> What upstream system are you trying this on?  If your platform isn=E2=80=
=99t upstream, can you point at the code review where you=E2=80=99re adding=
 it?
>
>
>
> If you don=E2=80=99t have either, take note that it=E2=80=99s really diff=
icult to help debug or make suggestions for platforms that we can=E2=80=99t=
 see the code for.
>
>
>
> Its only present in Managers/bmc/EthernetInterfaces.
>
>
>
> How do I add Systems/system/EthernetInterfaces Redfish support? What chan=
ges do I need to make?
>
>
>
> Regards,
>
> Ashwini
>
>
>
> --
>
> -Ed
