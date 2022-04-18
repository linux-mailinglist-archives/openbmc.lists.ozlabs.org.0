Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 741C4504F5D
	for <lists+openbmc@lfdr.de>; Mon, 18 Apr 2022 13:26:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Khl532W0Lz2yp5
	for <lists+openbmc@lfdr.de>; Mon, 18 Apr 2022 21:26:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QSpsfbq9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a;
 helo=mail-ed1-x52a.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QSpsfbq9; dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Khl4b2TpGz2yXf
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2022 21:26:21 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id s25so16655334edi.13
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2022 04:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s3fxhgjs1qfz3rZFcySEMZVmQUpWcinrB0Myp3lrgSg=;
 b=QSpsfbq9dzD8+c4pWe/xCSzYZPo7zvmBAQeR2Kl72gfdTKBMVc55AqXd+qXdxq2uAy
 kQlB6ZsAP5s6VZ7LPXUFzSYCkLvPjnqwEJAszP0i3ZAVtTPY28Flc8IuL+yeobleaTyz
 FV9mbSCfTyffzTbAtQtHYMAV6z+pcmeR+sTa0QMYc4Nq1gjXB6wvI+5G00ngNM1U2wqv
 5PtbupEwPnU+4cj1iBdCn0ZVZ8i0CFiUGxdbiEpnyX0qAmUaeSYyht7TbD4QUeRkotqZ
 BMl16mJexbay2wsfHkLAU6uPBjrSB+W82oRWblSNlwewUj9hEVk9rJqnoV6NBs8f4MB+
 R0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s3fxhgjs1qfz3rZFcySEMZVmQUpWcinrB0Myp3lrgSg=;
 b=LWBLUjULU0MBALALTeXHl6L9VszJsWHnJN6VBxtzSQjP3c57PwTOVHnjJyoSS5lPXV
 iBkm43y0oi2UaDsv31T4QXg6Fcebf51UYl2RFtC/WrqYjX/qgNFWwm4z0pwTV89j+DFO
 kaQBV+zLh+WIgDNmhgfYbZsGIsUVUb73egd6aadcrVBgvyKipwqLKjIn7ncstNy+SARl
 hcl3ms8jIN1dps/snUUyZtPnHJWORmpl770WxtXk9itd4TeeteihQ7EJDfEWlJSSyyEQ
 vtYsy1kvPbIWei8QSn016OkpI80olXGRc0kOXalhxTNyhIiU17+96oqFhkyIg+QBsi2A
 BGbw==
X-Gm-Message-State: AOAM532QJ+EtK92AFNmRXQsggBd5o+BySltw+rh5ALmIfl61BqLP43I+
 2ti8Rt68WgX6QxaJiGJDKxLwPC9EQ+YvheV+YG8=
X-Google-Smtp-Source: ABdhPJwU3l+3y/FBT3DGA5D752ZZmjtAI0Foe9uBZJWevBPJ1pRMZbYI7mzCApHYVPHZnhBRh3B+B/eE8kqrreljHNE=
X-Received: by 2002:a05:6402:1941:b0:413:2b7e:676e with SMTP id
 f1-20020a056402194100b004132b7e676emr11954319edz.114.1650281176059; Mon, 18
 Apr 2022 04:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAA7Tbctgg9YJPTRcYCwkucajTvk-AUNeHJ9_=MD5dpvxF5D0ZA@mail.gmail.com>
 <20220414004457.GA230974@mauery.jf.intel.com>
In-Reply-To: <20220414004457.GA230974@mauery.jf.intel.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Mon, 18 Apr 2022 16:56:04 +0530
Message-ID: <CAA7TbcsoBoRvcw_oNA4y_5WhV3z3KX73WMqACiXThJHtjmtUBg@mail.gmail.com>
Subject: Re: IPMI Restriction Mode
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Content-Type: multipart/alternative; boundary="0000000000004752e405dcec078e"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, anoo@us.ibm.com,
 Amithash Prasad <amithash@fb.com>, deepak.kodihalli.83@gmail.com,
 velumani.hcl@gmail.com, velumanit@hcl.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000004752e405dcec078e
Content-Type: text/plain; charset="UTF-8"

Thanks for the response and clarification.

I will clarify my question here,

IPMI restriction mode support has been added for host devices which support
IPMI.
This restriction mode support can be enabled or disabled from the
phosphor-settingsd configuration (.yaml) file.

Please check the below link for .yaml file of phosphor-settingsd.

https://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/host-template.yaml#L61

We wanted to add restriction mode support for other IPMI based devices
(Debug card).
Already phosphor-ipmi-host supports filters for all  IPMI commands which
have ipmi::Context objects.
So, How can we enable/disable this restriction mode support
from phosphor-settings for other IPMI based devices(Debug card). ?


Thanks,
Kumar.



On Thu, Apr 14, 2022 at 6:15 AM Vernon Mauery <vernon.mauery@linux.intel.com>
wrote:

> On 04-Apr-2022 12:49 PM, Kumar Thangavel wrote:
> >Hi All,
> >
> >        IPMI Restriction mode support has been added for host machines
> >which support IPMI.
> >
> >
> https://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/host-template.yaml#L61
> >
> >        How IPMI restriction mode support can be added for other than host
> >devices (IPMI based devices). Ex Debug card.  ?
>
> I am not exactly sure what you are asking for here. When you say other
> devices, are you asking about restricting commands based on what channel
> they come in on?
>
> This is possible. A filter can filter on any criteria that is available
> with the ipmi::Context object and the command. It can even extract
> command data and take action there. I only say this if you are
> interested in writing a new filter of your own.
>
> But if you want to see a filter that is already implemented that
> restricts commands based on BMC state and incoming channel, you can look
> at the filtering done in the intel-ipmi-oem repo.
>
> If my guess at what you meant was wrong, please clarify and I will try
> again.
>
> --Vernon
>
> >        Could you please provide any suggestions or any docs ?
> >
> >Thanks,
> >Kumar.
>

--0000000000004752e405dcec078e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the response and clarification.=C2=A0<div><br>I=
 will clarify my question here,</div><div><br></div><div>IPMI restriction=
=C2=A0mode support has been added for host devices which support IPMI.</div=
><div>This restriction mode support can be enabled or disabled from the pho=
sphor-settingsd=C2=A0configuration (.yaml) file.<br><br>Please check the be=
low link for .yaml file of phosphor-settingsd.</div><div><br></div><div><a =
href=3D"https://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523=
acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-def=
aults/host-template.yaml#L61">https://github.com/openbmc/openbmc/blob/7298b=
2478ec25cc1814124af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings=
/phosphor-settings-defaults/host-template.yaml#L61</a><br></div><div><br></=
div><div>We wanted to add restriction=C2=A0mode support for other IPMI base=
d devices (Debug card).</div><div>Already phosphor-ipmi-host supports filte=
rs for all=C2=A0 IPMI commands which have ipmi::Context objects.=C2=A0</div=
><div>So, How can we enable/disable this restriction mode support from=C2=
=A0phosphor-settings=C2=A0for other IPMI based devices(Debug card). ?<br><b=
r><br>Thanks,</div><div>Kumar.</div><div><br><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 14, 2022=
 at 6:15 AM Vernon Mauery &lt;<a href=3D"mailto:vernon.mauery@linux.intel.c=
om">vernon.mauery@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 04-Apr-2022 12:49 PM, Kumar Thangavel w=
rote:<br>
&gt;Hi All,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMI Restriction mode support has been adde=
d for host machines<br>
&gt;which support IPMI.<br>
&gt;<br>
&gt;<a href=3D"https://github.com/openbmc/openbmc/blob/7298b2478ec25cc18141=
24af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-setti=
ngs-defaults/host-template.yaml#L61" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523acc4ffade=
05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/hos=
t-template.yaml#L61</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 How IPMI restriction mode support can be ad=
ded for other than host<br>
&gt;devices (IPMI based devices). Ex Debug card.=C2=A0 ?<br>
<br>
I am not exactly sure what you are asking for here. When you say other <br>
devices, are you asking about restricting commands based on what channel <b=
r>
they come in on?<br>
<br>
This is possible. A filter can filter on any criteria that is available <br=
>
with the ipmi::Context object and the command. It can even extract <br>
command data and take action there. I only say this if you are <br>
interested in writing a new filter of your own.<br>
<br>
But if you want to see a filter that is already implemented that <br>
restricts commands based on BMC state and incoming channel, you can look <b=
r>
at the filtering done in the intel-ipmi-oem repo.<br>
<br>
If my guess at what you meant was wrong, please clarify and I will try <br>
again.<br>
<br>
--Vernon<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Could you please provide any suggestions or=
 any docs ?<br>
&gt;<br>
&gt;Thanks,<br>
&gt;Kumar.<br>
</blockquote></div>

--0000000000004752e405dcec078e--
