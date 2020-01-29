Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B298114D262
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 22:20:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487GbQ1qsyzDqVC
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 08:20:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::92e;
 helo=mail-ua1-x92e.google.com; envelope-from=yuenn@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=EqDAhMDg; dkim-atps=neutral
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487GZj2rfCzDqPv
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 08:19:18 +1100 (AEDT)
Received: by mail-ua1-x92e.google.com with SMTP id u17so303172uap.9
 for <openbmc@lists.ozlabs.org>; Wed, 29 Jan 2020 13:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Aff8MRe4RgUQCZsc5MCxci6iMDnZgwTdOWtYZB4ETdw=;
 b=EqDAhMDgjMX0oi7oDvW66RLy0gWjj6C3orniAAlccUgsjJgffqG1HQGYCYvDjSY7zk
 faGPJOjNr3SRQoANKzbIaKHPXmwjboYnpQQHgHDyy1NRSiq4I9hpiUTMYnxn7EWvWPSy
 A8vxSkcaPu6b7SsklBOBzaeXtNiKV+rg1X4G9ZKzL08mVi2hNRSjG+g9QpeqOgpysKRY
 KMn9TyZcjUcRsaWsvWm8ghr7lNxGxyzTiOJxOndTVmQjsvvi5+3Y4Z+wMzZy627c/r8P
 WSAMXJ23SxqOSfHqdS1MCr5SZpujNctQNfsOQnblCM8kTbikRVE6a4ulLs3cMBiMMD4K
 ONXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Aff8MRe4RgUQCZsc5MCxci6iMDnZgwTdOWtYZB4ETdw=;
 b=WDID3EvNxP0njXiP+lfuQjyzI1eKLRqtGrZeMbRihgskHkHI6kZyr14OFY0LAAPpcO
 ROftEdlCLi1SIBJ5onXCf/3HX4AQrkbXXXsEOegp20nGvZQswQuXjApOrmzlIr6HBTXu
 j9FISZRk0cKguJEfb+9eSjo1xTR+5BX9yJjEC2fmUT8Jy80VWv3KhjMt+UsrNkNNmKus
 XkznvnLws9PAZREwgAAHYkZm2jfMBvU+yJTOUYdbU6Ke7thLMAavuj8mKBMAc5ZNteeN
 h/2Jj3aBleIUfqH5R8N0fpHT4Vf27Gae7sdgEFLpdy5vLyYL7LQQLBxFsBRnKn5JwFrf
 IJ/Q==
X-Gm-Message-State: APjAAAVk8M7MO9WY80qJylktKjurJDVJLiV9+xPMF8RQifs46YtOM3LU
 uDamr7JM39fPcesIE0WbgNco5T5yOA3Ojp9qJxdiiw==
X-Google-Smtp-Source: APXvYqyPoMrk4BjLWl0nbyMSeEKRlm3ZOoNCBlHrV7wdtNfiBQVifwvCiP51rYnQtmwLyP/Hj9U1N/DokbmJxOe5kZY=
X-Received: by 2002:ab0:724c:: with SMTP id d12mr610252uap.0.1580332755088;
 Wed, 29 Jan 2020 13:19:15 -0800 (PST)
MIME-Version: 1.0
References: <CAJoAoZm41PYLana6j99ZvBgzkB+T-Ww4_gJC24=esecA48HV3Q@mail.gmail.com>
 <eb25580d-ca7e-6b2c-1171-3193e87544a0@linux.vnet.ibm.com>
In-Reply-To: <eb25580d-ca7e-6b2c-1171-3193e87544a0@linux.vnet.ibm.com>
From: Nancy Yuen <yuenn@google.com>
Date: Wed, 29 Jan 2020 13:18:39 -0800
Message-ID: <CADfYTpGFUbWahmoxyknxy6Ayh8mA-f_WN-+yhNb6MqBfUgbbRw@mail.gmail.com>
Subject: Re: Farewell & Best Wishes
To: Gunnar Mills <gmills@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000007ed6c7059d4de4a2"
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
Cc: Emily Shaffer <emilyshaffer@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000007ed6c7059d4de4a2
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 28, 2020 at 8:28 AM Gunnar Mills <gmills@linux.vnet.ibm.com>
wrote:

>
> On 1/27/2020 8:37 PM, Emily Shaffer wrote:
>
> All,
>
> While I've very much enjoyed my time working with this community, it's
> time for me to step down as comaintainer on the various IPMI projects. I'll
> be fully devoting my time to hacking Git, these days. :)
>
> Sometime this week I'll be sending changes to remove me from the
> appropriate MAINTAINERS files. If there is something that you still need
> from me - a review, an opinion, whatever - please let me know and I can
> take care of it. I'll continue to peek into my review queue this week and
> next week; after that, I won't be gone forever, but I won't be able to
> grant approvals on Gerrit.
>
> I expect I'll still be reachable all the usual ways - this email,
> Freenode, LinkedIn, whatever - I won't be disappearing or changing
> employers, just focusing my time elsewhere.
>
> Thank you all very much for the extraordinary learning experience I've had
> working with this project and incredible group of people. I wish everyone
> success in the future and look forward to OpenBMC as the norm in
> datacenters and home workstations.
>
> Great working with you Emily!
> Thanks for all your work and leadership on the project!
> Don't be a stranger. :)
>
> Gunnar
>
>
> Yours,
> Emily
>
>
Thanks for all your contributions!  Sad to see you go.

Nancy

--0000000000007ed6c7059d4de4a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 28, 2020 at 8:28 AM Gunna=
r Mills &lt;<a href=3D"mailto:gmills@linux.vnet.ibm.com">gmills@linux.vnet.=
ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
 =20
   =20
 =20
  <div>
    <p><br>
    </p>
    <div>On 1/27/2020 8:37 PM, Emily Shaffer
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">All,
        <div><br>
        </div>
        <div>While I&#39;ve very much enjoyed my time working with this
          community, it&#39;s time for me to step down as comaintainer on
          the various IPMI projects. I&#39;ll be fully devoting my time to
          hacking Git, these days. :)<br>
          <br>
          Sometime this week I&#39;ll be sending changes to remove me from
          the appropriate MAINTAINERS files. If there is something that
          you still need from me - a review, an opinion, whatever -
          please let me know and I can take care of it. I&#39;ll continue t=
o
          peek into my review queue this week and next week; after that,
          I won&#39;t be gone forever, but I won&#39;t be able to grant
          approvals on Gerrit.</div>
        <div><br>
        </div>
        <div>I expect I&#39;ll still be reachable all the usual ways - this
          email, Freenode, LinkedIn, whatever - I won&#39;t be disappearing
          or changing employers, just focusing my time elsewhere.</div>
        <div><br>
        </div>
        <div>Thank you all very much for the extraordinary learning
          experience I&#39;ve had working with this project and incredible
          group of people. I wish everyone success in the future and
          look forward to OpenBMC as the norm in datacenters and home
          workstations.<br>
          <br>
        </div>
      </div>
    </blockquote>
    <p>Great working with you Emily! <br>
      Thanks for all your work and leadership on the project!<br>
      Don&#39;t be a stranger. :) <br>
      <br>
      Gunnar<br>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>Yours,<br clear=3D"all">
          <div>
            <div dir=3D"ltr">Emily</div></div></div></div></blockquote></di=
v></blockquote><div><br></div><div>Thanks for all your contributions!=C2=A0=
 Sad to see you go.</div><div><br></div><div>Nancy=C2=A0</div></div></div>

--0000000000007ed6c7059d4de4a2--
