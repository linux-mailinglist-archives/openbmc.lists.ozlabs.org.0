Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CF42AF46
	for <lists+openbmc@lfdr.de>; Mon, 27 May 2019 09:16:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45C7YV6dSYzDqKM
	for <lists+openbmc@lfdr.de>; Mon, 27 May 2019 17:15:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=ojayanth@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RqWQI+2d"; 
 dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45C7Xz2kCVzDqH1
 for <openbmc@lists.ozlabs.org>; Mon, 27 May 2019 17:15:30 +1000 (AEST)
Received: by mail-ot1-x330.google.com with SMTP id t24so13932528otl.12
 for <openbmc@lists.ozlabs.org>; Mon, 27 May 2019 00:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FFHjDS3AJevWHuItqnPVRBMX/GERDvjZmuoD1g4PbnQ=;
 b=RqWQI+2dXGuqs/9Lr2/1BF5kV0etvAet5L2JzU+NU3Xh2PHGad0931ENFvQbYYpJEi
 LWDbelY8QkJA3f2DdIsbwFkywvSsy8tQXU/uDZeVW0RJ8rnEnYWz4aEp/vZ6jxWgbdKq
 epg7xRZ2Iuj+Ws669kHNNVAB4TfoD6+e8JOwq2aBkd4W6zLH6xtvrUTwWsXWIKhDQyJT
 RB/XDcLwGhCP7TD9zAKQ9/8H+YNM9kHAtw4jnuUFsdNLqzJ2bf0XNVV1xPH/Q1pHJ6R0
 YyrrQRQ3g5Bp1TCzB+CRwcN+jTWETG/VDrXxs8F1ui0v/wZZIQk4kc46si/0rJGb1kBi
 7k9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FFHjDS3AJevWHuItqnPVRBMX/GERDvjZmuoD1g4PbnQ=;
 b=g2LYONUo+5XuWoXYU0fS2ZVQwyOn+9dlI7SyyafJ7WuT1vnuBl9GSykY44sMqh5h9s
 B4FCOVCjoD7sWqkV70r8+dj88xtSs4tb8Exzj/bA9hColQCZUh/TMRCWsBfe2PCE5HQl
 9VVIGAOO9J5Ju50b0QZTZWoH7+LkBXw2ORRh3VY962HEntUN6QAvO0RI7CS8QzVRVcg6
 W2b27HBQSZkxpb/10vIzSh7qdjE+D9cO03WkBusI/jd7T6BL2j/U5E60lqSc0D61ucc6
 ERvIUrjcSTiFntP6q6GP1dIRDslE3+5u7iTDs/unr43H5rPu7VsIRV7UgnIB5dQiIpFG
 OIrw==
X-Gm-Message-State: APjAAAVwVsA80x1IAo9dxZMADZ5VIkOEzahfyVzw9UMOvK3QZtZzI4pX
 rKVOeBAwDBATpp+9wlQ6pmvfpbcoeJ7lv4xR9Ak=
X-Google-Smtp-Source: APXvYqytOnATXZEwfnjMl+E+eINnHgkwN0fAVB7/i5s3OQpTSHRZg1PHMdQasC1tha0vdF1vF4brPivQ6jSz3ELLttQ=
X-Received: by 2002:a9d:2f67:: with SMTP id h94mr43220738otb.85.1558941327123; 
 Mon, 27 May 2019 00:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <CACkAXSqktuOVy02_R9q4iWcTL=_v7iOrxoBOOCMb5xTAXnxREg@mail.gmail.com>
 <c8826cab-42d1-85d7-4eb0-50e79857a205@linux.vnet.ibm.com>
 <CALLMt=q+PHM09zDeM5hBGRm7sTmPF42QSo6fYB=CmL5DHP_rKg@mail.gmail.com>
In-Reply-To: <CALLMt=q+PHM09zDeM5hBGRm7sTmPF42QSo6fYB=CmL5DHP_rKg@mail.gmail.com>
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Mon, 27 May 2019 12:45:12 +0530
Message-ID: <CACkAXSpuVmMWXwzPxBYrw4ZUpKHAgw_KtKboR6iVGyEuyWpVcg@mail.gmail.com>
Subject: Re: Add support to debug unresponsive host
To: Andrew Geissler <geissonator@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000767e80589d950cc"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, bradleyb@fuzziesquirrel.com,
 artemsen@gmail.com, yugang.chen@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000000767e80589d950cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Design template Review is available here

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/21772

On Thu, May 16, 2019 at 6:31 PM Andrew Geissler <geissonator@gmail.com>
wrote:

> On Thu, May 16, 2019 at 1:36 AM Deepak Kodihalli
> <dkodihal@linux.vnet.ibm.com> wrote:
> >
> > On 15/05/19 6:09 PM, Jayanth Othayoth wrote:
> > > ## Problem Description
> > > Issue #457:  Add support to debug unresponsive host.
> > >
> > > Scope: High level design direction to solve this problem,
> > >
> > > ## Background and References
> > > There are situation at customer places where OPAL/Linux goes
> > > unresponsive causing a system hang. And there is no way to figure out
> > > what went wrong with Linux kernel or OPAL. Looking for a way to trigg=
er
> > > a dump capture on Linux host so that we can capture the OS dump for
> post
> > > analysis.
> > >
> > > ## Proposed Design for POWER processor based systems:
> > > Get all Host CPUs in reset vector and Linux then has a mechanism to
> > > patch it into panic-kdump path to trigger dump capture. This will
> enable
> > > us to analyze and fix customer issue where we see Linux hang and
> > > unresponsive system.
> > >
> > > ### Redfish Schema used:
> > > * Reference: DSP2046 2018.3,
> > > * ComputerSystem 1.6.0 schema provides an action called
> > > #ComputerSystem.Reset=E2=80=9D, This action is used to reset the syst=
em.
> > > ResetType parameter is used  for indicating type of reset need to be
> > > performed. In this use case we can use =E2=80=9CNmi=E2=80=9D type
> > >      * Nmi: Generate a Diagnostic Interrupt (usually an NMI on x86
> > > systems) to cease normal operations, perform diagnostic actions and
> > > typically halt the system.
> > > * ### d-bus :
> > >
> > > Option 1:   Extending  the existing  d-bus interface  state.Host  nam=
e
> > > space (
> > >
> /openbmc/phosphor-dbus-interfaces/xyz/openbmc_project/State/Host.interfac=
e.yaml
> > > ) to support new RequestedHostTransition property called  =E2=80=9CNm=
i=E2=80=9D.
>  d-bus
> > > backend can internally invoke processor specific target to do Sreset(
> > > equivalent to x86 NMI) and associated  actions.
> >
> > I don't prefer this option, because this would mean adding host specifi=
c
> > code in phoshor-state-manager, which I think until now is host agnostic=
.
>
> Yeah, this was my main concern with tying it into phosphor-state-manager.
> The fact Redfish put it in with their other state related commands (which
> are implemented by phosphor-state-manager) is the only reason I'm a littl=
e
> wishy-washy here. We could just create a generic systemd target "host-nmi=
"
> or something and phosphor-state-manager could just call that to abstract
> any of the specifics, but it sill doesn't really feel like it fits to me.
>
> I think I prefer option 2, and then we can just map bmcweb to that API wh=
en
> the Redfish command comes in. Sounds like for ppc64 systems we can just
> use pdbg to issue the NMI.
>
> > So for that reason, Option 2 sounds better. There are some good
> > questions from Neeraj as well, so I would suggest adding this as a
> > design template on Gerrit to gather better feedback.
> >
> > Thanks,
> > Deepak
> >
> > > Option 2: Introducing new d-bus interface in the control.state
> namespace
> > > (
> > >
> /openbmc/phosphor-dbus-interfaces/xyz/openbmc_project/Control/Host/NMI.in=
terface.yaml)
> > > namespace and implement the new d-bus back-end for respective
> processor
> > > specific targets.
> >
>

--0000000000000767e80589d950cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Design template Review is available here<br></div><di=
v><br></div><div><a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/do=
cs/+/21772" target=3D"_blank">https://gerrit.openbmc-project.xyz/c/openbmc/=
docs/+/21772</a></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Thu, May 16, 2019 at 6:31 PM Andrew Geissler &lt;<=
a href=3D"mailto:geissonator@gmail.com" target=3D"_blank">geissonator@gmail=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Thu, May 16, 2019 at 1:36 AM Deepak Kodihalli<br>
&lt;<a href=3D"mailto:dkodihal@linux.vnet.ibm.com" target=3D"_blank">dkodih=
al@linux.vnet.ibm.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 15/05/19 6:09 PM, Jayanth Othayoth wrote:<br>
&gt; &gt; ## Problem Description<br>
&gt; &gt; Issue #457:=C2=A0 Add support to debug unresponsive host.<br>
&gt; &gt;<br>
&gt; &gt; Scope: High level design direction to solve this problem,<br>
&gt; &gt;<br>
&gt; &gt; ## Background and References<br>
&gt; &gt; There are situation at customer places where OPAL/Linux goes<br>
&gt; &gt; unresponsive causing a system hang. And there is no way to figure=
 out<br>
&gt; &gt; what went wrong with Linux kernel or OPAL. Looking for a way to t=
rigger<br>
&gt; &gt; a dump capture on Linux host so that we can capture the OS dump f=
or post<br>
&gt; &gt; analysis.<br>
&gt; &gt;<br>
&gt; &gt; ## Proposed Design for POWER processor based systems:<br>
&gt; &gt; Get all Host CPUs in reset vector and Linux then has a mechanism =
to<br>
&gt; &gt; patch it into panic-kdump path to trigger dump capture. This will=
 enable<br>
&gt; &gt; us to analyze and fix customer issue where we see Linux hang and<=
br>
&gt; &gt; unresponsive system.<br>
&gt; &gt;<br>
&gt; &gt; ### Redfish Schema used:<br>
&gt; &gt; * Reference: DSP2046 2018.3,<br>
&gt; &gt; * ComputerSystem 1.6.0 schema provides an action called<br>
&gt; &gt; #ComputerSystem.Reset=E2=80=9D, This action is used to reset the =
system.<br>
&gt; &gt; ResetType parameter is used=C2=A0 for indicating type of reset ne=
ed to be<br>
&gt; &gt; performed. In this use case we can use =E2=80=9CNmi=E2=80=9D type=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 * Nmi: Generate a Diagnostic Interrupt (usual=
ly an NMI on x86<br>
&gt; &gt; systems) to cease normal operations, perform diagnostic actions a=
nd<br>
&gt; &gt; typically halt the system.<br>
&gt; &gt; * ### d-bus :<br>
&gt; &gt;<br>
&gt; &gt; Option 1:=C2=A0 =C2=A0Extending=C2=A0 the existing=C2=A0 d-bus in=
terface=C2=A0 state.Host=C2=A0 name<br>
&gt; &gt; space (<br>
&gt; &gt; /openbmc/phosphor-dbus-interfaces/xyz/openbmc_project/State/Host.=
interface.yaml<br>
&gt; &gt; ) to support new RequestedHostTransition property called=C2=A0 =
=E2=80=9CNmi=E2=80=9D.=C2=A0 =C2=A0d-bus<br>
&gt; &gt; backend can internally invoke processor specific target to do Sre=
set(<br>
&gt; &gt; equivalent to x86 NMI) and associated=C2=A0 actions.<br>
&gt;<br>
&gt; I don&#39;t prefer this option, because this would mean adding host sp=
ecific<br>
&gt; code in phoshor-state-manager, which I think until now is host agnosti=
c.<br>
<br>
Yeah, this was my main concern with tying it into phosphor-state-manager.<b=
r>
The fact Redfish put it in with their other state related commands (which<b=
r>
are implemented by phosphor-state-manager) is the only reason I&#39;m a lit=
tle<br>
wishy-washy here. We could just create a generic systemd target &quot;host-=
nmi&quot;<br>
or something and phosphor-state-manager could just call that to abstract<br=
>
any of the specifics, but it sill doesn&#39;t really feel like it fits to m=
e.<br>
<br>
I think I prefer option 2, and then we can just map bmcweb to that API when=
<br>
the Redfish command comes in. Sounds like for ppc64 systems we can just<br>
use pdbg to issue the NMI.<br>
<br>
&gt; So for that reason, Option 2 sounds better. There are some good<br>
&gt; questions from Neeraj as well, so I would suggest adding this as a<br>
&gt; design template on Gerrit to gather better feedback.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Deepak<br>
&gt;<br>
&gt; &gt; Option 2: Introducing new d-bus interface in the control.state na=
mespace<br>
&gt; &gt; (<br>
&gt; &gt; /openbmc/phosphor-dbus-interfaces/xyz/openbmc_project/Control/Hos=
t/NMI.interface.yaml)<br>
&gt; &gt; namespace and implement the new d-bus back-end for respective=C2=
=A0 processor<br>
&gt; &gt; specific targets.<br>
&gt;<br>
</blockquote></div>

--0000000000000767e80589d950cc--
