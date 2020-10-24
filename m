Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF542979DD
	for <lists+openbmc@lfdr.de>; Sat, 24 Oct 2020 02:13:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CJ1m92zgHzDr22
	for <lists+openbmc@lfdr.de>; Sat, 24 Oct 2020 11:13:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32a;
 helo=mail-ot1-x32a.google.com; envelope-from=jasonling@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=fMGFAm+p; dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CJ1lG0hntzDr0f
 for <openbmc@lists.ozlabs.org>; Sat, 24 Oct 2020 11:12:47 +1100 (AEDT)
Received: by mail-ot1-x32a.google.com with SMTP id t15so2988550otk.0
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 17:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UHsXDZUpmbJ2u12RblHS8mrtqqhUtnSf5uOOKZoTh2o=;
 b=fMGFAm+pIvWxkiZi3Ftno0o8QUSB5SC+O/yJFadupWqXNoo5NiN9kd9DoUsVvjhiZ9
 1I/cMeT69mkXIlDjwD0YJVPILCSLR5RpUjpwgz4xwVsoXHdsJt7bUhDnXUc+eg+1slVs
 QPnPNbPpZJI3xFBSCi0HJK1aGmzh18LD2jfRED4Uoy8CdCp4WLwgomQ+5XoT5TNcMjxe
 5vri3i/Us8V3UPyL4gKJklFiZcjouZSieM4qoAlRcv7RCviW+BTT5oOpX+pSJamFTp2b
 HkcIrtdxkpXJSxTLplY/winZv4XkInv/z3GmnuqpskvBb6aDMJtqq1HrL6JGwANwYEz8
 PkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UHsXDZUpmbJ2u12RblHS8mrtqqhUtnSf5uOOKZoTh2o=;
 b=KyQ2Z0aePx+JHVMbWQibs/MPhzLgGy8/ud0qVivMPwgWNKoWpUlPdcxBvXdKE3fEtP
 rBctvQxida/2/lAiocQCw039w5quzsVNJKCEmb/EWQzH1zHRnJ7Y72RkhaV/yvnYG25J
 dTBOLyqZZMvyfj+o1guiJsE5CufHzZ5Z6QwDC4LN43ZkiZoOTqEBHkpJyTnE+IqCBfYA
 0kYRoh9uki4Od1+hCw5ImU/kG/7RJQW5GrQ5VUQnfIIOm7SHZX08MbzppuJOQHJpblTO
 wS78rLChudP6Ken3Lyq1panyZ4SkI8lU0hlZo9sqnH0wOkFv1WZ318wKz8dFfEwvBuIo
 0IDw==
X-Gm-Message-State: AOAM532QMriNQrrzUu0VkfIYL309tFDl8eFUBt5MRKEV2a0jPj9wUXCg
 IirquYIOQrXfTuJwzGhKITkFRUPfAslDwzotqdMycg==
X-Google-Smtp-Source: ABdhPJxHPo8RMUunckn/YQ2dZkhmsy99M/xe1WjcRaOikd9P3erZiK7CY28+oL0ZxbsdhauWrCM0mLQ5UtNOiWFntyY=
X-Received: by 2002:a9d:7cce:: with SMTP id r14mr1936322otn.204.1603498363250; 
 Fri, 23 Oct 2020 17:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notx2=coTNs25BX1GjL-LV0fZyS8-+5D0FLpi8td2=G1jsw@mail.gmail.com>
In-Reply-To: <CAO=notx2=coTNs25BX1GjL-LV0fZyS8-+5D0FLpi8td2=G1jsw@mail.gmail.com>
From: Jason Ling <jasonling@google.com>
Date: Fri, 23 Oct 2020 17:12:07 -0700
Message-ID: <CAHBbfcW7JX+3VdwJXDReVLvKQMxAHqGjbfh+aUrayyhoGjB-Rw@mail.gmail.com>
Subject: Re: failures in docker CI with libipmi
To: Patrick Venture <venture@google.com>
Content-Type: multipart/alternative; boundary="00000000000057604f05b25f8eec"
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

--00000000000057604f05b25f8eec
Content-Type: text/plain; charset="UTF-8"

I'm also experiencing CI failures.

One is exactly the same that Patrick mentioned, when building on PPC I also
see the

mv: cannot stat 'libipmi20.so.0.0.0U': No such file or directory


But another strange error I'm seeing is that phosphor-host-ipmid fails to
build during the CI for phosphor-ipmi-flash but *succeeds* when
building for the CI for phosphor-host-ipmid.

*Trigger the CI for phosphor-ipmi-flash by pushing a trivial patch (fails
building using the x86 container)*
Review
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ipmi-flash/+/37658
Jenkins Log
https://jenkins.openbmc.org/job/ci-repository/6823/consoleFull

*Trigger the CI for phosphor-host-ipmi by pushing another trivial patch
(succeeds building using the PPC container)*
Review
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/37657
Jenkins Log
https://jenkins.openbmc.org/job/ci-repository/6822/consoleFull

*Strangely enough the CI for phosphor-host-ipmi passes yet the CI for
phosphor-ipmi-flash fails*

--00000000000057604f05b25f8eec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m also experiencing CI failures.=C2=A0</div><di=
v><br></div><div>One is exactly the same that Patrick mentioned, when build=
ing on PPC I also see the=C2=A0</div><div><br></div><div>mv: cannot stat &#=
39;libipmi20.so.0.0.0U&#39;: No such file or directory</div><div><br></div>=
<div><br></div><div>But another strange error I&#39;m seeing is that phosph=
or-host-ipmid fails to build during the CI for phosphor-ipmi-flash but <b>s=
ucceeds</b>=C2=A0when building=C2=A0for the CI for phosphor-host-ipmid.</di=
v><div><br></div><div><b>Trigger the CI for phosphor-ipmi-flash by pushing =
a trivial patch (fails building using the x86 container)</b></div><div>Revi=
ew<br></div><div><a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/ph=
osphor-ipmi-flash/+/37658">https://gerrit.openbmc-project.xyz/c/openbmc/pho=
sphor-ipmi-flash/+/37658</a><br></div><div>Jenkins Log</div><div><a href=3D=
"https://jenkins.openbmc.org/job/ci-repository/6823/consoleFull">https://je=
nkins.openbmc.org/job/ci-repository/6823/consoleFull</a><br></div><div><br>=
</div><div><b>Trigger the CI for phosphor-host-ipmi by pushing another triv=
ial patch (succeeds building using the PPC container)</b></div><div>Review<=
/div><div><a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-=
host-ipmid/+/37657">https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-h=
ost-ipmid/+/37657</a><br></div><div>Jenkins Log</div><div><a href=3D"https:=
//jenkins.openbmc.org/job/ci-repository/6822/consoleFull">https://jenkins.o=
penbmc.org/job/ci-repository/6822/consoleFull</a><br></div><div><br></div><=
div><b><u>Strangely enough the CI for phosphor-host-ipmi passes yet the CI =
for phosphor-ipmi-flash fails</u></b></div><div><b><u><br></u></b></div><di=
v><br></div><div><br></div></div>

--00000000000057604f05b25f8eec--
