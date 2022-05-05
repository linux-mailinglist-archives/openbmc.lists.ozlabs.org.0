Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD3251BDF0
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 13:23:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvBC455Ccz3bqy
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 21:23:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QknI8z5j;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QknI8z5j; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvBBg1fBqz3bhF
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2022 21:22:50 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so3822046pjh.4
 for <openbmc@lists.ozlabs.org>; Thu, 05 May 2022 04:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wuCCOw3la46Rr+/Xh7I2hv3Rnh8Mr0QUR9K85T1OwaE=;
 b=QknI8z5jpAikSQb46ljln/LwzKaQ4vrwXC9MkwITnqw6kvpidTfmg2FTwFua9NiVM1
 P8xXAlTnEEsR9l4Ytym2izz9Oiu0VLZ586xAeF9ULD5fA82o56oGDp+q8xG83WkchmIs
 gSVeGICfh6i5YjBjD+B8Dq8UcyafSxSupqooaBqmzovpH0PMDHJzVTEA1PKq4O4uizw2
 5JLqynflU5V64NKbkVOvp1F/z1X0jGUAHvquZuj8cYQOKvzG9p3aT8JBVptd8k+NdSZW
 ed17zh2i8j+JQ5LIeCsiFRWzyni38kUBMM5jyyknsF+bXn5fQVnozwJdyOEn7kPdeIqt
 jYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wuCCOw3la46Rr+/Xh7I2hv3Rnh8Mr0QUR9K85T1OwaE=;
 b=STtBmkVpr/NBbX06gVricbhcR2nttPb/hG2Y3GU/RHZvMyBiB4fyC5Khht4bB4cHC4
 bSDLbBNG7OljXBGJkuwKUgniRa7Ge3nzP3ln57ulwUPp9YDehb+7HnShMWtK/e2AeotC
 aWEYEoULrEOv9UEiDCKECxfGNhJpPJeSwilB3Zzf8OjVFsvj7Y1SkJ2NounFfNEJQ8nN
 L3hZmXwT03TSGVIj/fw0IcqhHX45x+P7D76Ki8gqBZAMwpNizIa07bEi28wCGU0MHX7H
 dvnwsHjJanHJ0RU0g7QLjdggMPjHPY/K4eBGQ5RdMv7/qhs6lAdjAHl7aLfGlfYwqk8M
 RaHQ==
X-Gm-Message-State: AOAM533Qx1AqU20iwzJCumkdX59bmbLz+7wstg9U/U2Zys56vZlZactY
 +z/Gn3eRKwgmK263jv9X5mq8AYm64lCe3Z2u9Ag=
X-Google-Smtp-Source: ABdhPJwgOgPfYl5BzVmGCctqjb0FoF+lNcayH8mrKupZhzaBaKR9/sLbWZM7oU7QRy9JaAL8uzaYZDsi64Xwx7Bh1wU=
X-Received: by 2002:a17:903:2cf:b0:151:a932:f1f0 with SMTP id
 s15-20020a17090302cf00b00151a932f1f0mr27204127plk.130.1651749768047; Thu, 05
 May 2022 04:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAA7Tbctgg9YJPTRcYCwkucajTvk-AUNeHJ9_=MD5dpvxF5D0ZA@mail.gmail.com>
 <20220414004457.GA230974@mauery.jf.intel.com>
 <CAA7TbcsoBoRvcw_oNA4y_5WhV3z3KX73WMqACiXThJHtjmtUBg@mail.gmail.com>
 <20220422232456.GA661800@mauery.jf.intel.com>
 <CAA7Tbctpz6EgJcpYHtRAyWP98Y_hSMn+PCNYX0BKZ=c76sGByQ@mail.gmail.com>
 <CAA7Tbcu8o6epZ8yMTAPNaJii8K=wUAvo-T0WYUgFab6NtMEk9g@mail.gmail.com>
 <20220503230433.GA884273@mauery.jf.intel.com>
 <CAA7TbcuOnorMX_oGbZ15ou7gVyARqFrzvEx4AwRGLPguNB8Eig@mail.gmail.com>
 <20220504222543.GB884273@mauery.jf.intel.com>
In-Reply-To: <20220504222543.GB884273@mauery.jf.intel.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Thu, 5 May 2022 16:52:36 +0530
Message-ID: <CAA7TbcuAUptEPFaBTw3=42KizVFEEK5Con3r4j8euKQdmjHddw@mail.gmail.com>
Subject: Re: IPMI Restriction Mode
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Content-Type: multipart/alternative; boundary="0000000000002eafff05de41f67d"
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
 velumanit@hcl.com, velumani.hcl@gmail.com, deepak.kodihalli.83@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002eafff05de41f67d
Content-Type: text/plain; charset="UTF-8"

Thanks for your suggestions.

--Kumar.

On Thu, May 5, 2022 at 3:55 AM Vernon Mauery <vernon.mauery@linux.intel.com>
wrote:

> On 04-May-2022 10:27 PM, Kumar Thangavel wrote:
> >On Wed, May 4, 2022 at 4:34 AM Vernon Mauery <
> vernon.mauery@linux.intel.com>
> >wrote:
> >
> >> On 03-May-2022 07:46 PM, Kumar Thangavel wrote:
> >> >Hi Vernon,
> >> >
> >> >     We may need to write our own custom filter for other channels as
> you
> >> >suggested.
> >> >     While implementing this, we need some clarifications.
> >> >
> >> >     1. How can we map channel Id's with settingsd restriction mode
> >> >dbus-objects ?
> >>
> >> Set up a restriction mode object for each channel? This is really up to
> >> your implementation.
> >>
> >
> >    Ack.
> >
> >>
> >> >     2. The Ipmb channel has multiple devices in our system, How can we
> >> >handle and apply this multiple Ipmb interfaces with
> >> >settingsd restriction mode dbus-objects ?
> >> >
> >> >     Please refer below link for multiple Ipmb channels for our system.
> >> >
> >>
> >> When ipmb channel commands come in, there is also rqSA set in the
> >> ipmi::Context. This should be unique per device. Will this work for you?
> >>
> >>     That also works. If we use rqSA, again we need to map this rqSA
> value
> >with phosphor-settingsd restriction mode dbus-objects name (
> >/xyz/openbmc_project/control/*host1*/restriction_mode) ?
> >
> >Alternate logic we just think of
> >1. Using "hostIdx'' in ipmi::Contextwhich is unique(0, 1, 2 to N) for each
> >devices. we can map this with phosphor-settingsd restriction mode
> >dbus-objects name ?  We need to maintain order (0, 1, 2 to N-1) for hosts
> >and N for debug cards in all configs.
> >2. Can we read i*pmb-channels.json* entry in ipmid with name field as
> >"host1", "host2", "host3" "host4" and "debug_card" which should match the
> >settingsd dbus-object names. ? So that we can map the name field with
> >settings objects easily.
> >
> >  Example :
> >  Ipmb-channels.json entry :
> >
> >{ "name" : "*host1*"
> >"type": "ipmb",
> >"slave-path": "/dev/ipmb-1",
> >"bmc-addr": 32,
> >"remote-addr": 64,
> >"devIndex": 0
> >},
> >{ "name" : "*host2*"
> >"type": "ipmb",
> >"slave-path": "/dev/ipmb-3",
> >"bmc-addr": 32,
> >"remote-addr": 64,
> >"devIndex": 2
> >},
> >
> >{ "name" : "*hostN*"
> >"type": "ipmb",
> >"slave-path": "/dev/ipmb-7",
> >"bmc-addr": 32,
> >"remote-addr": 64,
> >"devIndex": N
> >},
> >{ "name" : "*debug_card*"
> >"type": "ipmb",
> >"slave-path": "/dev/ipmb-13",
> >"bmc-addr": 32,
> >"remote-addr": 64,
> >"devIndex": 4
> >}
> >]
> >
> >  Settingsd restriction mode objects :
> >
> >  /xyz/openbmc_project/control/*debug_card*/restriction_mode
> >  /xyz/openbmc_project/control/*host1*/restriction_mode
> >  /xyz/openbmc_project/control/*host2*/restriction_mode
> >  /xyz/openbmc_project/control/*host3*/restriction_mode
> >  /xyz/openbmc_project/control/*host3*/restriction_mode
> >
> >  Could you please provide your thoughts on this ?
>
> I think you can do all of this in your filter code. You can really do
> just about anything in there. You can have a setup function that gets
> called when the provider library is loaded and read the file and set up
> your map. Then when an IPMI function is called you can consult your map
> and filter however you want.
>
> Just be aware that your filter code will run on *every* IPMI call, so do
> your best to make it streamlined or it will impact performance.
>
> --Vernon
>
>

--0000000000002eafff05de41f67d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for your suggestions.<div><br></div><div>--Kumar.</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, May 5, 2022 at 3:55 AM Vernon Mauery &lt;<a href=3D"mailto:vern=
on.mauery@linux.intel.com">vernon.mauery@linux.intel.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On 04-May-2022 10:2=
7 PM, Kumar Thangavel wrote:<br>
&gt;On Wed, May 4, 2022 at 4:34 AM Vernon Mauery &lt;<a href=3D"mailto:vern=
on.mauery@linux.intel.com" target=3D"_blank">vernon.mauery@linux.intel.com<=
/a>&gt;<br>
&gt;wrote:<br>
&gt;<br>
&gt;&gt; On 03-May-2022 07:46 PM, Kumar Thangavel wrote:<br>
&gt;&gt; &gt;Hi Vernon,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0We may need to write our own custom filter=
 for other channels as you<br>
&gt;&gt; &gt;suggested.<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0While implementing this, we need some clar=
ifications.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A01. How can we map channel Id&#39;s with se=
ttingsd restriction mode<br>
&gt;&gt; &gt;dbus-objects ?<br>
&gt;&gt;<br>
&gt;&gt; Set up a restriction mode object for each channel? This is really =
up to<br>
&gt;&gt; your implementation.<br>
&gt;&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 Ack.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A02. The Ipmb channel has multiple devices i=
n our system, How can we<br>
&gt;&gt; &gt;handle and apply this multiple Ipmb interfaces with<br>
&gt;&gt; &gt;settingsd restriction mode dbus-objects ?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0Please refer below link for multiple Ipmb =
channels for our system.<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; When ipmb channel commands come in, there is also rqSA set in the<=
br>
&gt;&gt; ipmi::Context. This should be unique per device. Will this work fo=
r you?<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0That also works. If we use rqSA, again we need =
to map this rqSA value<br>
&gt;with phosphor-settingsd restriction mode dbus-objects name (<br>
&gt;/xyz/openbmc_project/control/*host1*/restriction_mode) ?<br>
&gt;<br>
&gt;Alternate logic we just think of<br>
&gt;1. Using &quot;hostIdx&#39;&#39; in ipmi::Contextwhich is unique(0, 1, =
2 to N) for each<br>
&gt;devices. we can map this with phosphor-settingsd restriction mode<br>
&gt;dbus-objects name ?=C2=A0 We need to maintain order (0, 1, 2 to N-1) fo=
r hosts<br>
&gt;and N for debug cards in all configs.<br>
&gt;2. Can we read i*pmb-channels.json* entry in ipmid with name field as<b=
r>
&gt;&quot;host1&quot;, &quot;host2&quot;, &quot;host3&quot; &quot;host4&quo=
t; and &quot;debug_card&quot; which should match the<br>
&gt;settingsd dbus-object names. ? So that we can map the name field with<b=
r>
&gt;settings objects easily.<br>
&gt;<br>
&gt;=C2=A0 Example :<br>
&gt;=C2=A0 Ipmb-channels.json entry :<br>
&gt;<br>
&gt;{ &quot;name&quot; : &quot;*host1*&quot;<br>
&gt;&quot;type&quot;: &quot;ipmb&quot;,<br>
&gt;&quot;slave-path&quot;: &quot;/dev/ipmb-1&quot;,<br>
&gt;&quot;bmc-addr&quot;: 32,<br>
&gt;&quot;remote-addr&quot;: 64,<br>
&gt;&quot;devIndex&quot;: 0<br>
&gt;},<br>
&gt;{ &quot;name&quot; : &quot;*host2*&quot;<br>
&gt;&quot;type&quot;: &quot;ipmb&quot;,<br>
&gt;&quot;slave-path&quot;: &quot;/dev/ipmb-3&quot;,<br>
&gt;&quot;bmc-addr&quot;: 32,<br>
&gt;&quot;remote-addr&quot;: 64,<br>
&gt;&quot;devIndex&quot;: 2<br>
&gt;},<br>
&gt;<br>
&gt;{ &quot;name&quot; : &quot;*hostN*&quot;<br>
&gt;&quot;type&quot;: &quot;ipmb&quot;,<br>
&gt;&quot;slave-path&quot;: &quot;/dev/ipmb-7&quot;,<br>
&gt;&quot;bmc-addr&quot;: 32,<br>
&gt;&quot;remote-addr&quot;: 64,<br>
&gt;&quot;devIndex&quot;: N<br>
&gt;},<br>
&gt;{ &quot;name&quot; : &quot;*debug_card*&quot;<br>
&gt;&quot;type&quot;: &quot;ipmb&quot;,<br>
&gt;&quot;slave-path&quot;: &quot;/dev/ipmb-13&quot;,<br>
&gt;&quot;bmc-addr&quot;: 32,<br>
&gt;&quot;remote-addr&quot;: 64,<br>
&gt;&quot;devIndex&quot;: 4<br>
&gt;}<br>
&gt;]<br>
&gt;<br>
&gt;=C2=A0 Settingsd restriction mode objects :<br>
&gt;<br>
&gt;=C2=A0 /xyz/openbmc_project/control/*debug_card*/restriction_mode<br>
&gt;=C2=A0 /xyz/openbmc_project/control/*host1*/restriction_mode<br>
&gt;=C2=A0 /xyz/openbmc_project/control/*host2*/restriction_mode<br>
&gt;=C2=A0 /xyz/openbmc_project/control/*host3*/restriction_mode<br>
&gt;=C2=A0 /xyz/openbmc_project/control/*host3*/restriction_mode<br>
&gt;<br>
&gt;=C2=A0 Could you please provide your thoughts on this ?<br>
<br>
I think you can do all of this in your filter code. You can really do <br>
just about anything in there. You can have a setup function that gets <br>
called when the provider library is loaded and read the file and set up <br=
>
your map. Then when an IPMI function is called you can consult your map <br=
>
and filter however you want.<br>
<br>
Just be aware that your filter code will run on *every* IPMI call, so do <b=
r>
your best to make it streamlined or it will impact performance.<br>
<br>
--Vernon<br>
<br>
</blockquote></div>

--0000000000002eafff05de41f67d--
