Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E4E26C534
	for <lists+openbmc@lfdr.de>; Wed, 16 Sep 2020 18:34:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bs5Kp3QSNzDqGZ
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 02:34:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=fhI4Ryyl; dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bs58n2KXVzDqX9
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 02:27:04 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id a2so5867943ybj.2
 for <openbmc@lists.ozlabs.org>; Wed, 16 Sep 2020 09:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=igJNmRlTmejMRUjyAFJcsEnbgZDQK5wiUxs8TAPoL2c=;
 b=fhI4RyylzsAV8FtBeQw2hkiX26SD8k0hADssfvj39vxtLLOq4yqJX8r9GfDf/eUK2i
 xxOeqv26yYS0Q6176NHl/7L/aaClGfj/2agsns18uwk4XZ1RB8HmV894bozJbyWRrAqx
 cM/oNX7XYc2WHueyWuC+6RlDMmsNiwjOUB0w/TBEBG8HEUtWx32tgM4QMsptK5riekPg
 lEmz2RmIfKivpWcajULyFuMjBcsuHQ+ce4H683/JvNoBS/I5oDObd+9W3iMU0oUPxKBZ
 et0H1+Hla8ocX7Ol57eMokb1YeFH3sGYea/JFoGWSsfTR143rG3WwpgiQwU4xuS+bRLB
 shmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=igJNmRlTmejMRUjyAFJcsEnbgZDQK5wiUxs8TAPoL2c=;
 b=n65Df3Imt9GnxJ6BYEt6aMRZf3jItcJoaGcH6EkkPOaCO+KaizzfcX5BhMbHCnVuaB
 a5aYV3AZ5rDJmuBAq22WonWEUTBP6ghRE0tBeeG680h+4M5FWf5SoXpx7QNG6tVnhAaF
 QMyhOFqepLHaH7fQiXrX6D9Cq8TAUEoA7Jmrs+gEucaTLdY6mWrj78onYMEFB4mL6A43
 fULfHv8rB6bjfVPHbECYz+MA9XiExiVcGwhFZ/FIBto1y+Mnt6MMdlup0rrAmH0Ru7z4
 xHJ1GLPSNXhsR4xG9zYLwRoSPeCBQqztibByGI9q9CQyaQtb2iSAul9NaMxup/FqGlkY
 57hg==
X-Gm-Message-State: AOAM532MuDllZ6hJCcK+nuQhBWXGu1XsOHuWbQAkZo6aM5fUxIX7rKeN
 +H5e4xuT4/nfkMUqGqVBQ4WzePybeqGySRh6hrXnTlapx34ceg==
X-Google-Smtp-Source: ABdhPJwOTuBvnLpLZtb5f1U5LIszH3l/BP2d5obsiiWYVGNcvDvuW8TF974t7ZY36nBZQABzdarK6yHMkeaNdomxoXA=
X-Received: by 2002:a25:55c5:: with SMTP id
 j188mr23245811ybb.417.1600273620484; 
 Wed, 16 Sep 2020 09:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
In-Reply-To: <C9C88F03-4715-444E-9B1A-3834995458EA@getmailspring.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 16 Sep 2020 09:26:50 -0700
Message-ID: <CACWQX83KnXz-+WB1xgMP4MAPfDGare_ZM=SAWrWzohhT--Jwrg@mail.gmail.com>
Subject: Re: Using bios-settings-mgr for setting hypervisor network attributes
To: manoj kiran <manojkiran.eda@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b15a3805af70bc02"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "james.feist@linux.intel.com" <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000b15a3805af70bc02
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 16, 2020 at 7:47 AM manoj kiran <manojkiran.eda@gmail.com>
wrote:

> Hi Ed & James,
>
> Till now IBM was using phosphor-settings infrastructure as back-end and
> uses Ethernet Schema for Hypervisor computer
> system(hypervisor_ethernet.hpp) for setting the IP address of hypervisor.
> And now we are planning to leverage the capabilities of
> bios-settings-mgr(backend) as well to set the hypervisor attributes.
>
> do you see any concerns here ?
>
> Thanks,
> Manoj
> [image: Sent from Mailspring]


None that I can think of (although I don't know much about
bios-settings-mgr).  Holding all the host data in one daemon seems like a
better way to do it than putting it in settings.

--000000000000b15a3805af70bc02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 16, 2020 at 7:47 AM manoj=
 kiran &lt;<a href=3D"mailto:manojkiran.eda@gmail.com">manojkiran.eda@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div>Hi Ed &amp; James,</div><br><div>Till now IBM was using phosphor-s=
ettings infrastructure as back-end and uses Ethernet Schema for Hypervisor =
computer system(hypervisor_ethernet.hpp) for setting the IP address of hype=
rvisor. And now we are planning to leverage the capabilities of bios-settin=
gs-mgr(backend) as well to set the hypervisor attributes.</div><br><div>do =
you see any concerns here ?</div><br><div>Thanks,</div><div>Manoj</div><img=
 alt=3D"Sent from Mailspring" width=3D"0" height=3D"0" style=3D"border: 0px=
; width: 0px; height: 0px;" src=3D"https://link.getmailspring.com/open/C9C8=
8F03-4715-444E-9B1A-3834995458EA@getmailspring.com?me=3Dcfe0c16b&amp;recipi=
ent=3DZWRAdGFub3VzLm5ldA%3D%3D"></blockquote><div><br></div><div>None that =
I can think of (although I don&#39;t know much about bios-settings-mgr).=C2=
=A0 Holding all the host data in one daemon seems like a better way to do i=
t than putting it in settings.</div></div></div>

--000000000000b15a3805af70bc02--
