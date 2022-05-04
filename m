Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 414AB51A6DB
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 18:58:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktjgq0mnrz3c7G
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 02:57:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RBsnVbPP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RBsnVbPP; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtjgN0LsJz3bc9
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2022 02:57:35 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id j6so1577541pfe.13
 for <openbmc@lists.ozlabs.org>; Wed, 04 May 2022 09:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RPW87wSe5u3seaXIeFa6IIiAIgd1sRJDAYFrZ+H0HAI=;
 b=RBsnVbPPhqoSUi2rgQ8OWjpim9NPyJDtrs0XsN156y89Ggt+jOKS0nJ9yiSLIRl+yM
 /Pyz7NLcyUgkZHb4tWAz/joQn9JJkQIkMpPkYncgvI6T1jmuIHfg6AEco2tNkQ9KQCV5
 6yb+NT/llAuE0jcyZd9tGBNQKZ0z+s38EdkJrjyfQaOsZaXwGR1GSiVi8DfjJl6i0rhy
 zGEm7S2kPC9L/6NCtCp+ySl+LUD9FikXmEVo+CeyHIXay+qU1N19JXE/l95cDJErpG0n
 Z47O9eyhJo7dsCOJvZiPv/6ywizxBPVVinMpSwK6zF4Nzy2jkgJsnpAJhkrZRrfoe5aj
 Zy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RPW87wSe5u3seaXIeFa6IIiAIgd1sRJDAYFrZ+H0HAI=;
 b=Y5ZeUQRt35Imc24HFkMXpSrWkcnIqOYV3+5XV/Kh0iEhQ1K311WXP3O7PSx9WL7fNn
 0xZWRFpFwf/0Fxd0uxKluREcJ2p7cDaRRny5TK7MAsWylOhLv2+QPrrY2LtvvwWXcrdC
 O1gPko4d/8Og4lxTPHF0jAYoJP2DIEpbUu+MNe9DF+Pmp8CmOdNCcR54ua090jylmQ+/
 kkGjWWFmjaoQxA7Jm/FI6Tl6gRmpn89KOG8WmOh6zhp1gh/JGwp9QmkhaoyRKMiPNVdB
 qR43BsTOx+bOwQEe/CyfuoVNv89aorJUFhvQLGb6UeRPm+YW2psgoFSkAbyMM/fcn8LV
 p7Cg==
X-Gm-Message-State: AOAM5326JiXepbYnZ45vmgQCei0UKpXeRPTAWRfEsoB21ClvksGwb38q
 ymI1V4wDN4tvnSwn2lvrxZKo5Vt2ofRzKX8bJyc=
X-Google-Smtp-Source: ABdhPJzuz/5ft/6lG2pqiinZvlCUgbfkMIkGpsbTvtdt3ijYA30LgLCh/VaWBd1wuOVLo8hs2f8X0O8kEh7Gi73Xfmk=
X-Received: by 2002:a62:5c3:0:b0:50d:4274:4e9d with SMTP id
 186-20020a6205c3000000b0050d42744e9dmr20939658pff.54.1651683451301; Wed, 04
 May 2022 09:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAA7Tbctgg9YJPTRcYCwkucajTvk-AUNeHJ9_=MD5dpvxF5D0ZA@mail.gmail.com>
 <20220414004457.GA230974@mauery.jf.intel.com>
 <CAA7TbcsoBoRvcw_oNA4y_5WhV3z3KX73WMqACiXThJHtjmtUBg@mail.gmail.com>
 <20220422232456.GA661800@mauery.jf.intel.com>
 <CAA7Tbctpz6EgJcpYHtRAyWP98Y_hSMn+PCNYX0BKZ=c76sGByQ@mail.gmail.com>
 <CAA7Tbcu8o6epZ8yMTAPNaJii8K=wUAvo-T0WYUgFab6NtMEk9g@mail.gmail.com>
 <20220503230433.GA884273@mauery.jf.intel.com>
In-Reply-To: <20220503230433.GA884273@mauery.jf.intel.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Wed, 4 May 2022 22:27:19 +0530
Message-ID: <CAA7TbcuOnorMX_oGbZ15ou7gVyARqFrzvEx4AwRGLPguNB8Eig@mail.gmail.com>
Subject: Re: IPMI Restriction Mode
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000065723b05de3285b5"
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

--00000000000065723b05de3285b5
Content-Type: text/plain; charset="UTF-8"

On Wed, May 4, 2022 at 4:34 AM Vernon Mauery <vernon.mauery@linux.intel.com>
wrote:

> On 03-May-2022 07:46 PM, Kumar Thangavel wrote:
> >Hi Vernon,
> >
> >     We may need to write our own custom filter for other channels as you
> >suggested.
> >     While implementing this, we need some clarifications.
> >
> >     1. How can we map channel Id's with settingsd restriction mode
> >dbus-objects ?
>
> Set up a restriction mode object for each channel? This is really up to
> your implementation.
>

    Ack.

>
> >     2. The Ipmb channel has multiple devices in our system, How can we
> >handle and apply this multiple Ipmb interfaces with
> >settingsd restriction mode dbus-objects ?
> >
> >     Please refer below link for multiple Ipmb channels for our system.
> >
>
> When ipmb channel commands come in, there is also rqSA set in the
> ipmi::Context. This should be unique per device. Will this work for you?
>
>     That also works. If we use rqSA, again we need to map this rqSA value
with phosphor-settingsd restriction mode dbus-objects name (
/xyz/openbmc_project/control/*host1*/restriction_mode) ?

Alternate logic we just think of
1. Using "hostIdx'' in ipmi::Contextwhich is unique(0, 1, 2 to N) for each
devices. we can map this with phosphor-settingsd restriction mode
dbus-objects name ?  We need to maintain order (0, 1, 2 to N-1) for hosts
and N for debug cards in all configs.
2. Can we read i*pmb-channels.json* entry in ipmid with name field as
"host1", "host2", "host3" "host4" and "debug_card" which should match the
settingsd dbus-object names. ? So that we can map the name field with
settings objects easily.

  Example :
  Ipmb-channels.json entry :

{ "name" : "*host1*"
"type": "ipmb",
"slave-path": "/dev/ipmb-1",
"bmc-addr": 32,
"remote-addr": 64,
"devIndex": 0
},
{ "name" : "*host2*"
"type": "ipmb",
"slave-path": "/dev/ipmb-3",
"bmc-addr": 32,
"remote-addr": 64,
"devIndex": 2
},

{ "name" : "*hostN*"
"type": "ipmb",
"slave-path": "/dev/ipmb-7",
"bmc-addr": 32,
"remote-addr": 64,
"devIndex": N
},
{ "name" : "*debug_card*"
"type": "ipmb",
"slave-path": "/dev/ipmb-13",
"bmc-addr": 32,
"remote-addr": 64,
"devIndex": 4
}
]

  Settingsd restriction mode objects :

  /xyz/openbmc_project/control/*debug_card*/restriction_mode
  /xyz/openbmc_project/control/*host1*/restriction_mode
  /xyz/openbmc_project/control/*host2*/restriction_mode
  /xyz/openbmc_project/control/*host3*/restriction_mode
  /xyz/openbmc_project/control/*host3*/restriction_mode

  Could you please provide your thoughts on this ?

  Thanks,
  Kumar.

--Vernon
>
> >
> https://github.com/openbmc/openbmc/blob/master/meta-facebook/recipes-phosphor/ipmi/phosphor-ipmi-ipmb/yosemitev2/ipmb-channels.json
> >
> >      Already we have "hostIdx'' in ipmi::Context struct, which represents
> >the data coming from which hosts. Even Though if we plan to use this
> >"hostIdx" ,  it is still not clear how we can map this "hostIdx'' with
> >settingsd restriction mode dbus-objects.
> >
> >   Otherwise, can we have some Schema(Rules) to follow the channel order
> >for this channel and devices(settingsd dbus-objects) mapping ?
> >    Ex:   First 4 or 6 channel is for host 1 - host4
> >             Next channel is for  Debug card,
> >             Rest of the channel is for other devices.
> >
> >   I think we need to maintain this order in settingsd config file and
> >ipmb-channels.json config file for this channel and device mapping.
> >
> >  Could you please provide your suggestion on this.
> >
> >Thanks,
> >Kumar.
> >
> >On Tue, Apr 26, 2022 at 9:25 PM Kumar Thangavel <
> >kumarthangavel.hcl@gmail.com> wrote:
> >
> >> Thanks for your response and suggestions.
> >>
> >> --Kumar.
> >>
> >> On Sat, Apr 23, 2022 at 4:55 AM Vernon Mauery <
> >> vernon.mauery@linux.intel.com> wrote:
> >>
> >>> On 18-Apr-2022 04:56 PM, Kumar Thangavel wrote:
> >>> >Thanks for the response and clarification.
> >>> >
> >>> >I will clarify my question here,
> >>> >
> >>> >IPMI restriction mode support has been added for host devices which
> >>> support
> >>> >IPMI.
> >>> >This restriction mode support can be enabled or disabled from the
> >>> >phosphor-settingsd configuration (.yaml) file.
> >>> >
> >>> >Please check the below link for .yaml file of phosphor-settingsd.
> >>> >
> >>> >
> >>>
> https://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/host-template.yaml#L61
> >>> >
> >>> >We wanted to add restriction mode support for other IPMI based devices
> >>> >(Debug card).
> >>> >Already phosphor-ipmi-host supports filters for all  IPMI commands
> which
> >>> >have ipmi::Context objects.
> >>> >So, How can we enable/disable this restriction mode support
> >>> >from phosphor-settings for other IPMI based devices(Debug card). ?
> >>>
> >>> I understand that currently only the host channel is using the
> >>> restriction mode. You want to add it for other channels. This has
> >>> already been done in the intel-ipmi-oem repo, if you want to take a
> look
> >>> at that. It allows a fine-grained mechanism for command filtering,
> based
> >>> on the channel and the restriction mode (although currently, I think
> the
> >>> restriction mode still only applies to the host channel).
> >>>
> >>> My point is that it is pretty easy to come up with a custom filter
> >>> mechanism that should suit you. There is even an option to disable the
> >>> built-in filter so you can supply your own.
> >>>
> >>> --Vernon
> >>>
> >>> >
> >>> >
> >>> >
> >>> >On Thu, Apr 14, 2022 at 6:15 AM Vernon Mauery <
> >>> vernon.mauery@linux.intel.com>
> >>> >wrote:
> >>> >
> >>> >> On 04-Apr-2022 12:49 PM, Kumar Thangavel wrote:
> >>> >> >Hi All,
> >>> >> >
> >>> >> >        IPMI Restriction mode support has been added for host
> machines
> >>> >> >which support IPMI.
> >>> >> >
> >>> >> >
> >>> >>
> >>>
> https://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/host-template.yaml#L61
> >>> >> >
> >>> >> >        How IPMI restriction mode support can be added for other
> than
> >>> host
> >>> >> >devices (IPMI based devices). Ex Debug card.  ?
> >>> >>
> >>> >> I am not exactly sure what you are asking for here. When you say
> other
> >>> >> devices, are you asking about restricting commands based on what
> >>> channel
> >>> >> they come in on?
> >>> >>
> >>> >> This is possible. A filter can filter on any criteria that is
> available
> >>> >> with the ipmi::Context object and the command. It can even extract
> >>> >> command data and take action there. I only say this if you are
> >>> >> interested in writing a new filter of your own.
> >>> >>
> >>> >> But if you want to see a filter that is already implemented that
> >>> >> restricts commands based on BMC state and incoming channel, you can
> >>> look
> >>> >> at the filtering done in the intel-ipmi-oem repo.
> >>> >>
> >>> >> If my guess at what you meant was wrong, please clarify and I will
> try
> >>> >> again.
> >>> >>
> >>> >> --Vernon
> >>> >>
> >>> >> >        Could you please provide any suggestions or any docs ?
> >>> >> >
> >>> >> >Thanks,
> >>> >> >Kumar.
> >>> >>
> >>>
> >>
>

--00000000000065723b05de3285b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, May 4, 2022 at 4:34 AM Vernon Mau=
ery &lt;<a href=3D"mailto:vernon.mauery@linux.intel.com">vernon.mauery@linu=
x.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 03-May-2022 07:46 PM, Kumar Thangavel wrote:<br>
&gt;Hi Vernon,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0We may need to write our own custom filter for othe=
r channels as you<br>
&gt;suggested.<br>
&gt;=C2=A0 =C2=A0 =C2=A0While implementing this, we need some clarification=
s.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A01. How can we map channel Id&#39;s with settingsd r=
estriction mode<br>
&gt;dbus-objects ?<br>
<br>
Set up a restriction mode object for each channel? This is really up to <br=
>
your implementation.<br></blockquote><div>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 A=
ck.=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A02. The Ipmb channel has multiple devices in our sys=
tem, How can we<br>
&gt;handle and apply this multiple Ipmb interfaces with<br>
&gt;settingsd restriction mode dbus-objects ?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Please refer below link for multiple Ipmb channels =
for our system.<br>
&gt;<br>
<br>
When ipmb channel commands come in, there is also rqSA set in the <br>
ipmi::Context. This should be unique per device. Will this work for you?<br=
>
<br></blockquote><div>=C2=A0 =C2=A0 That also works. If we use rqSA, again =
we need to map this rqSA value with phosphor-settingsd restriction mode dbu=
s-objects name ( /xyz/openbmc_project/control/<b>host1</b>/restriction_mode=
) ?=C2=A0<br>=C2=A0 =C2=A0=C2=A0<br>Alternate logic we just think of</div><=
div>1. Using &quot;hostIdx&#39;&#39; in=C2=A0ipmi::Contextwhich is unique(0=
, 1, 2 to N) for each devices. we can map this with phosphor-settingsd rest=
riction mode dbus-objects name ?=C2=A0 We need to=C2=A0maintain order (0, 1=
, 2 to N-1) for hosts and N for debug cards in all configs.</div><div>2. Ca=
n we read i<b>pmb-channels.json</b>=C2=A0entry in ipmid with name field as =
&quot;host1&quot;, &quot;host2&quot;, &quot;host3&quot; &quot;host4&quot; a=
nd &quot;debug_card&quot; which should match the settingsd dbus-object name=
s. ? So that we can map the name field with settings objects easily.<br><br=
>=C2=A0 Example :=C2=A0<br>=C2=A0 Ipmb-channels.json entry :</div><div>=C2=
=A0 =C2=A0</div><table class=3D"gmail-highlight gmail-tab-size gmail-js-fil=
e-line-container gmail-js-code-nav-container gmail-js-tagsearch-file" style=
=3D"border-spacing:0px;border-collapse:collapse;color:rgb(36,41,47);font-fa=
mily:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,Helvetica,Arial,=
sans-serif,&quot;Apple Color Emoji&quot;,&quot;Segoe UI Emoji&quot;;font-si=
ze:14px"><tbody style=3D"box-sizing:border-box"><tr style=3D"box-sizing:bor=
der-box"><td id=3D"gmail-L3" class=3D"gmail-blob-num gmail-js-line-number g=
mail-js-code-nav-line-number gmail-js-blob-rnum" style=3D"box-sizing:border=
-box;padding:0px 10px;width:50px;min-width:50px;font-family:ui-monospace,SF=
Mono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;=
,monospace;font-size:12px;line-height:20px;text-align:right;white-space:now=
rap;vertical-align:top"></td><td id=3D"gmail-LC3" class=3D"gmail-blob-code =
gmail-blob-code-inner gmail-js-file-line" style=3D"box-sizing:border-box;pa=
dding:0px 10px;line-height:20px;vertical-align:top;overflow:visible;font-fa=
mily:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;L=
iberation Mono&quot;,monospace;font-size:12px;white-space:pre">    {
      &quot;name&quot; : &quot;<b>host1</b>&quot;</td></tr><tr style=3D"box=
-sizing:border-box;background-color:transparent"><td id=3D"gmail-L4" class=
=3D"gmail-blob-num gmail-js-line-number gmail-js-code-nav-line-number gmail=
-js-blob-rnum" style=3D"box-sizing:border-box;padding:0px 10px;width:50px;m=
in-width:50px;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,M=
enlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;line-hei=
ght:20px;text-align:right;white-space:nowrap;vertical-align:top"></td><td i=
d=3D"gmail-LC4" class=3D"gmail-blob-code gmail-blob-code-inner gmail-js-fil=
e-line" style=3D"box-sizing:border-box;padding:0px 10px;line-height:20px;ve=
rtical-align:top;overflow:visible;font-family:ui-monospace,SFMono-Regular,&=
quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;fon=
t-size:12px;white-space:pre">      <span class=3D"gmail-pl-ent" style=3D"bo=
x-sizing:border-box">&quot;type&quot;</span>: <span class=3D"gmail-pl-s" st=
yle=3D"box-sizing:border-box"><span class=3D"gmail-pl-pds" style=3D"box-siz=
ing:border-box">&quot;</span>ipmb<span class=3D"gmail-pl-pds" style=3D"box-=
sizing:border-box">&quot;</span></span>,</td></tr><tr style=3D"box-sizing:b=
order-box"><td id=3D"gmail-L5" class=3D"gmail-blob-num gmail-js-line-number=
 gmail-js-code-nav-line-number gmail-js-blob-rnum" style=3D"box-sizing:bord=
er-box;padding:0px 10px;width:50px;min-width:50px;font-family:ui-monospace,=
SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quo=
t;,monospace;font-size:12px;line-height:20px;text-align:right;white-space:n=
owrap;vertical-align:top"></td><td id=3D"gmail-LC5" class=3D"gmail-blob-cod=
e gmail-blob-code-inner gmail-js-file-line" style=3D"box-sizing:border-box;=
padding:0px 10px;line-height:20px;vertical-align:top;overflow:visible;font-=
family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot=
;Liberation Mono&quot;,monospace;font-size:12px;white-space:pre">      <spa=
n class=3D"gmail-pl-ent" style=3D"box-sizing:border-box">&quot;slave-path&q=
uot;</span>: <span class=3D"gmail-pl-s" style=3D"box-sizing:border-box"><sp=
an class=3D"gmail-pl-pds" style=3D"box-sizing:border-box">&quot;</span>/dev=
/ipmb-1<span class=3D"gmail-pl-pds" style=3D"box-sizing:border-box">&quot;<=
/span></span>,</td></tr><tr style=3D"box-sizing:border-box;background-color=
:transparent"><td id=3D"gmail-L6" class=3D"gmail-blob-num gmail-js-line-num=
ber gmail-js-code-nav-line-number gmail-js-blob-rnum" style=3D"box-sizing:b=
order-box;padding:0px 10px;width:50px;min-width:50px;font-family:ui-monospa=
ce,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&=
quot;,monospace;font-size:12px;line-height:20px;text-align:right;white-spac=
e:nowrap;vertical-align:top"></td><td id=3D"gmail-LC6" class=3D"gmail-blob-=
code gmail-blob-code-inner gmail-js-file-line" style=3D"box-sizing:border-b=
ox;padding:0px 10px;line-height:20px;vertical-align:top;overflow:visible;fo=
nt-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&q=
uot;Liberation Mono&quot;,monospace;font-size:12px;white-space:pre">      <=
span class=3D"gmail-pl-ent" style=3D"box-sizing:border-box">&quot;bmc-addr&=
quot;</span>: <span class=3D"gmail-pl-c1" style=3D"box-sizing:border-box">3=
2</span>,</td></tr><tr style=3D"box-sizing:border-box"><td id=3D"gmail-L7" =
class=3D"gmail-blob-num gmail-js-line-number gmail-js-code-nav-line-number =
gmail-js-blob-rnum" style=3D"box-sizing:border-box;padding:0px 10px;width:5=
0px;min-width:50px;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&qu=
ot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;lin=
e-height:20px;text-align:right;white-space:nowrap;vertical-align:top"></td>=
<td id=3D"gmail-LC7" class=3D"gmail-blob-code gmail-blob-code-inner gmail-j=
s-file-line" style=3D"box-sizing:border-box;padding:0px 10px;line-height:20=
px;vertical-align:top;overflow:visible;font-family:ui-monospace,SFMono-Regu=
lar,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospac=
e;font-size:12px;white-space:pre">      <span class=3D"gmail-pl-ent" style=
=3D"box-sizing:border-box">&quot;remote-addr&quot;</span>: <span class=3D"g=
mail-pl-c1" style=3D"box-sizing:border-box">64</span>,</td></tr><tr style=
=3D"box-sizing:border-box;background-color:transparent"><td id=3D"gmail-L8"=
 class=3D"gmail-blob-num gmail-js-line-number gmail-js-code-nav-line-number=
 gmail-js-blob-rnum" style=3D"box-sizing:border-box;padding:0px 10px;width:=
50px;min-width:50px;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&q=
uot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;li=
ne-height:20px;text-align:right;white-space:nowrap;vertical-align:top"></td=
><td id=3D"gmail-LC8" class=3D"gmail-blob-code gmail-blob-code-inner gmail-=
js-file-line" style=3D"box-sizing:border-box;padding:0px 10px;line-height:2=
0px;vertical-align:top;overflow:visible;font-family:ui-monospace,SFMono-Reg=
ular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospa=
ce;font-size:12px;white-space:pre">      <span class=3D"gmail-pl-ent" style=
=3D"box-sizing:border-box">&quot;devIndex&quot;</span>: <span class=3D"gmai=
l-pl-c1" style=3D"box-sizing:border-box">0</span></td></tr><tr style=3D"box=
-sizing:border-box"><td id=3D"gmail-L9" class=3D"gmail-blob-num gmail-js-li=
ne-number gmail-js-code-nav-line-number gmail-js-blob-rnum" style=3D"box-si=
zing:border-box;padding:0px 10px;width:50px;min-width:50px;font-family:ui-m=
onospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation=
 Mono&quot;,monospace;font-size:12px;line-height:20px;text-align:right;whit=
e-space:nowrap;vertical-align:top"></td><td id=3D"gmail-LC9" class=3D"gmail=
-blob-code gmail-blob-code-inner gmail-js-file-line" style=3D"box-sizing:bo=
rder-box;padding:0px 10px;line-height:20px;vertical-align:top;overflow:visi=
ble;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Conso=
las,&quot;Liberation Mono&quot;,monospace;font-size:12px;white-space:pre"> =
   },</td></tr><tr style=3D"box-sizing:border-box;background-color:transpar=
ent"><td id=3D"gmail-L10" class=3D"gmail-blob-num gmail-js-line-number gmai=
l-js-code-nav-line-number gmail-js-blob-rnum" style=3D"box-sizing:border-bo=
x;padding:0px 10px;width:50px;min-width:50px;font-family:ui-monospace,SFMon=
o-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,mo=
nospace;font-size:12px;line-height:20px;text-align:right;white-space:nowrap=
;vertical-align:top"></td><td id=3D"gmail-LC10" class=3D"gmail-blob-code gm=
ail-blob-code-inner gmail-js-file-line" style=3D"box-sizing:border-box;padd=
ing:0px 10px;line-height:20px;vertical-align:top;overflow:visible;font-fami=
ly:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Lib=
eration Mono&quot;,monospace;font-size:12px;white-space:pre">    {
      &quot;name&quot; : &quot;<b>host2</b>&quot;</td></tr><tr style=3D"box=
-sizing:border-box"><td id=3D"gmail-L11" class=3D"gmail-blob-num gmail-js-l=
ine-number gmail-js-code-nav-line-number gmail-js-blob-rnum" style=3D"box-s=
izing:border-box;padding:0px 10px;width:50px;min-width:50px;font-family:ui-=
monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberatio=
n Mono&quot;,monospace;font-size:12px;line-height:20px;text-align:right;whi=
te-space:nowrap;vertical-align:top"></td><td id=3D"gmail-LC11" class=3D"gma=
il-blob-code gmail-blob-code-inner gmail-js-file-line" style=3D"box-sizing:=
border-box;padding:0px 10px;line-height:20px;vertical-align:top;overflow:vi=
sible;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Con=
solas,&quot;Liberation Mono&quot;,monospace;font-size:12px;white-space:pre"=
>      <span class=3D"gmail-pl-ent" style=3D"box-sizing:border-box">&quot;t=
ype&quot;</span>: <span class=3D"gmail-pl-s" style=3D"box-sizing:border-box=
"><span class=3D"gmail-pl-pds" style=3D"box-sizing:border-box">&quot;</span=
>ipmb<span class=3D"gmail-pl-pds" style=3D"box-sizing:border-box">&quot;</s=
pan></span>,</td></tr><tr style=3D"box-sizing:border-box;background-color:t=
ransparent"><td id=3D"gmail-L12" class=3D"gmail-blob-num gmail-js-line-numb=
er gmail-js-code-nav-line-number gmail-js-blob-rnum" style=3D"box-sizing:bo=
rder-box;padding:0px 10px;width:50px;min-width:50px;font-family:ui-monospac=
e,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&q=
uot;,monospace;font-size:12px;line-height:20px;text-align:right;white-space=
:nowrap;vertical-align:top"></td><td id=3D"gmail-LC12" class=3D"gmail-blob-=
code gmail-blob-code-inner gmail-js-file-line" style=3D"box-sizing:border-b=
ox;padding:0px 10px;line-height:20px;vertical-align:top;overflow:visible;fo=
nt-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&q=
uot;Liberation Mono&quot;,monospace;font-size:12px;white-space:pre">      <=
span class=3D"gmail-pl-ent" style=3D"box-sizing:border-box">&quot;slave-pat=
h&quot;</span>: <span class=3D"gmail-pl-s" style=3D"box-sizing:border-box">=
<span class=3D"gmail-pl-pds" style=3D"box-sizing:border-box">&quot;</span>/=
dev/ipmb-3<span class=3D"gmail-pl-pds" style=3D"box-sizing:border-box">&quo=
t;</span></span>,</td></tr><tr style=3D"box-sizing:border-box"><td id=3D"gm=
ail-L13" class=3D"gmail-blob-num gmail-js-line-number gmail-js-code-nav-lin=
e-number gmail-js-blob-rnum" style=3D"box-sizing:border-box;padding:0px 10p=
x;width:50px;min-width:50px;font-family:ui-monospace,SFMono-Regular,&quot;S=
F Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size=
:12px;line-height:20px;text-align:right;white-space:nowrap;vertical-align:t=
op"></td><td id=3D"gmail-LC13" class=3D"gmail-blob-code gmail-blob-code-inn=
er gmail-js-file-line" style=3D"box-sizing:border-box;padding:0px 10px;line=
-height:20px;vertical-align:top;overflow:visible;font-family:ui-monospace,S=
FMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot=
;,monospace;font-size:12px;white-space:pre">      <span class=3D"gmail-pl-e=
nt" style=3D"box-sizing:border-box">&quot;bmc-addr&quot;</span>: <span clas=
s=3D"gmail-pl-c1" style=3D"box-sizing:border-box">32</span>,</td></tr><tr s=
tyle=3D"box-sizing:border-box;background-color:transparent"><td id=3D"gmail=
-L14" class=3D"gmail-blob-num gmail-js-line-number gmail-js-code-nav-line-n=
umber gmail-js-blob-rnum" style=3D"box-sizing:border-box;padding:0px 10px;w=
idth:50px;min-width:50px;font-family:ui-monospace,SFMono-Regular,&quot;SF M=
ono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12=
px;line-height:20px;text-align:right;white-space:nowrap;vertical-align:top"=
></td><td id=3D"gmail-LC14" class=3D"gmail-blob-code gmail-blob-code-inner =
gmail-js-file-line" style=3D"box-sizing:border-box;padding:0px 10px;line-he=
ight:20px;vertical-align:top;overflow:visible;font-family:ui-monospace,SFMo=
no-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,m=
onospace;font-size:12px;white-space:pre">      <span class=3D"gmail-pl-ent"=
 style=3D"box-sizing:border-box">&quot;remote-addr&quot;</span>: <span clas=
s=3D"gmail-pl-c1" style=3D"box-sizing:border-box">64</span>,</td></tr><tr s=
tyle=3D"box-sizing:border-box"><td id=3D"gmail-L15" class=3D"gmail-blob-num=
 gmail-js-line-number gmail-js-code-nav-line-number gmail-js-blob-rnum" sty=
le=3D"box-sizing:border-box;padding:0px 10px;width:50px;min-width:50px;font=
-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quo=
t;Liberation Mono&quot;,monospace;font-size:12px;line-height:20px;text-alig=
n:right;white-space:nowrap;vertical-align:top"></td><td id=3D"gmail-LC15" c=
lass=3D"gmail-blob-code gmail-blob-code-inner gmail-js-file-line" style=3D"=
box-sizing:border-box;padding:0px 10px;line-height:20px;vertical-align:top;=
overflow:visible;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot=
;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;white=
-space:pre">      <span class=3D"gmail-pl-ent" style=3D"box-sizing:border-b=
ox">&quot;devIndex&quot;</span>: 2</td></tr><tr style=3D"box-sizing:border-=
box;background-color:transparent"><td id=3D"gmail-L16" class=3D"gmail-blob-=
num gmail-js-line-number gmail-js-code-nav-line-number gmail-js-blob-rnum" =
style=3D"box-sizing:border-box;padding:0px 10px;width:50px;min-width:50px;f=
ont-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&=
quot;Liberation Mono&quot;,monospace;font-size:12px;line-height:20px;text-a=
lign:right;white-space:nowrap;vertical-align:top"></td><td id=3D"gmail-LC16=
" class=3D"gmail-blob-code gmail-blob-code-inner gmail-js-file-line" style=
=3D"box-sizing:border-box;padding:0px 10px;line-height:20px;vertical-align:=
top;overflow:visible;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&=
quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;w=
hite-space:pre">    },</td></tr><tr style=3D"box-sizing:border-box"><td id=
=3D"gmail-L17" class=3D"gmail-blob-num gmail-js-line-number gmail-js-code-n=
av-line-number gmail-js-blob-rnum" style=3D"box-sizing:border-box;padding:0=
px 10px;width:50px;min-width:50px;font-family:ui-monospace,SFMono-Regular,&=
quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;fon=
t-size:12px;line-height:20px;text-align:right;white-space:nowrap;vertical-a=
lign:top"></td><td id=3D"gmail-LC17" class=3D"gmail-blob-code gmail-blob-co=
de-inner gmail-js-file-line" style=3D"box-sizing:border-box;padding:0px 10p=
x;line-height:20px;vertical-align:top;overflow:visible;font-family:ui-monos=
pace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mon=
o&quot;,monospace;font-size:12px;white-space:pre"><br></td></tr><tr style=
=3D"box-sizing:border-box;background-color:transparent"><td id=3D"gmail-L24=
" class=3D"gmail-blob-num gmail-js-line-number gmail-js-code-nav-line-numbe=
r gmail-js-blob-rnum" style=3D"box-sizing:border-box;padding:0px 10px;width=
:50px;min-width:50px;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&=
quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;l=
ine-height:20px;text-align:right;white-space:nowrap;vertical-align:top"></t=
d><td id=3D"gmail-LC24" class=3D"gmail-blob-code gmail-blob-code-inner gmai=
l-js-file-line" style=3D"box-sizing:border-box;padding:0px 10px;line-height=
:20px;vertical-align:top;overflow:visible;font-family:ui-monospace,SFMono-R=
egular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monos=
pace;font-size:12px;white-space:pre">    {
      &quot;name&quot; : &quot;<b>hostN</b>&quot;</td></tr><tr style=3D"box=
-sizing:border-box"><td id=3D"gmail-L25" class=3D"gmail-blob-num gmail-js-l=
ine-number gmail-js-code-nav-line-number gmail-js-blob-rnum" style=3D"box-s=
izing:border-box;padding:0px 10px;width:50px;min-width:50px;font-family:ui-=
monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberatio=
n Mono&quot;,monospace;font-size:12px;line-height:20px;text-align:right;whi=
te-space:nowrap;vertical-align:top"></td><td id=3D"gmail-LC25" class=3D"gma=
il-blob-code gmail-blob-code-inner gmail-js-file-line" style=3D"box-sizing:=
border-box;padding:0px 10px;line-height:20px;vertical-align:top;overflow:vi=
sible;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Con=
solas,&quot;Liberation Mono&quot;,monospace;font-size:12px;white-space:pre"=
>      <span class=3D"gmail-pl-ent" style=3D"box-sizing:border-box">&quot;t=
ype&quot;</span>: <span class=3D"gmail-pl-s" style=3D"box-sizing:border-box=
"><span class=3D"gmail-pl-pds" style=3D"box-sizing:border-box">&quot;</span=
>ipmb<span class=3D"gmail-pl-pds" style=3D"box-sizing:border-box">&quot;</s=
pan></span>,</td></tr><tr style=3D"box-sizing:border-box;background-color:t=
ransparent"><td id=3D"gmail-L26" class=3D"gmail-blob-num gmail-js-line-numb=
er gmail-js-code-nav-line-number gmail-js-blob-rnum" style=3D"box-sizing:bo=
rder-box;padding:0px 10px;width:50px;min-width:50px;font-family:ui-monospac=
e,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&q=
uot;,monospace;font-size:12px;line-height:20px;text-align:right;white-space=
:nowrap;vertical-align:top"></td><td id=3D"gmail-LC26" class=3D"gmail-blob-=
code gmail-blob-code-inner gmail-js-file-line" style=3D"box-sizing:border-b=
ox;padding:0px 10px;line-height:20px;vertical-align:top;overflow:visible;fo=
nt-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&q=
uot;Liberation Mono&quot;,monospace;font-size:12px;white-space:pre">      <=
span class=3D"gmail-pl-ent" style=3D"box-sizing:border-box">&quot;slave-pat=
h&quot;</span>: <span class=3D"gmail-pl-s" style=3D"box-sizing:border-box">=
<span class=3D"gmail-pl-pds" style=3D"box-sizing:border-box">&quot;</span>/=
dev/ipmb-7<span class=3D"gmail-pl-pds" style=3D"box-sizing:border-box">&quo=
t;</span></span>,</td></tr><tr style=3D"box-sizing:border-box"><td id=3D"gm=
ail-L27" class=3D"gmail-blob-num gmail-js-line-number gmail-js-code-nav-lin=
e-number gmail-js-blob-rnum" style=3D"box-sizing:border-box;padding:0px 10p=
x;width:50px;min-width:50px;font-family:ui-monospace,SFMono-Regular,&quot;S=
F Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size=
:12px;line-height:20px;text-align:right;white-space:nowrap;vertical-align:t=
op"></td><td id=3D"gmail-LC27" class=3D"gmail-blob-code gmail-blob-code-inn=
er gmail-js-file-line" style=3D"box-sizing:border-box;padding:0px 10px;line=
-height:20px;vertical-align:top;overflow:visible;font-family:ui-monospace,S=
FMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot=
;,monospace;font-size:12px;white-space:pre">      <span class=3D"gmail-pl-e=
nt" style=3D"box-sizing:border-box">&quot;bmc-addr&quot;</span>: <span clas=
s=3D"gmail-pl-c1" style=3D"box-sizing:border-box">32</span>,</td></tr><tr s=
tyle=3D"box-sizing:border-box;background-color:transparent"><td id=3D"gmail=
-L28" class=3D"gmail-blob-num gmail-js-line-number gmail-js-code-nav-line-n=
umber gmail-js-blob-rnum" style=3D"box-sizing:border-box;padding:0px 10px;w=
idth:50px;min-width:50px;font-family:ui-monospace,SFMono-Regular,&quot;SF M=
ono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12=
px;line-height:20px;text-align:right;white-space:nowrap;vertical-align:top"=
></td><td id=3D"gmail-LC28" class=3D"gmail-blob-code gmail-blob-code-inner =
gmail-js-file-line" style=3D"box-sizing:border-box;padding:0px 10px;line-he=
ight:20px;vertical-align:top;overflow:visible;font-family:ui-monospace,SFMo=
no-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,m=
onospace;font-size:12px;white-space:pre">      <span class=3D"gmail-pl-ent"=
 style=3D"box-sizing:border-box">&quot;remote-addr&quot;</span>: <span clas=
s=3D"gmail-pl-c1" style=3D"box-sizing:border-box">64</span>,</td></tr><tr s=
tyle=3D"box-sizing:border-box"><td id=3D"gmail-L29" class=3D"gmail-blob-num=
 gmail-js-line-number gmail-js-code-nav-line-number gmail-js-blob-rnum" sty=
le=3D"box-sizing:border-box;padding:0px 10px;width:50px;min-width:50px;font=
-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quo=
t;Liberation Mono&quot;,monospace;font-size:12px;line-height:20px;text-alig=
n:right;white-space:nowrap;vertical-align:top"></td><td id=3D"gmail-LC29" c=
lass=3D"gmail-blob-code gmail-blob-code-inner gmail-js-file-line" style=3D"=
box-sizing:border-box;padding:0px 10px;line-height:20px;vertical-align:top;=
overflow:visible;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot=
;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;white=
-space:pre">      <span class=3D"gmail-pl-ent" style=3D"box-sizing:border-b=
ox">&quot;devIndex&quot;</span>: N</td></tr><tr style=3D"box-sizing:border-=
box;background-color:transparent"><td id=3D"gmail-L30" class=3D"gmail-blob-=
num gmail-js-line-number gmail-js-code-nav-line-number gmail-js-blob-rnum" =
style=3D"box-sizing:border-box;padding:0px 10px;width:50px;min-width:50px;f=
ont-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&=
quot;Liberation Mono&quot;,monospace;font-size:12px;line-height:20px;text-a=
lign:right;white-space:nowrap;vertical-align:top"></td><td id=3D"gmail-LC30=
" class=3D"gmail-blob-code gmail-blob-code-inner gmail-js-file-line" style=
=3D"box-sizing:border-box;padding:0px 10px;line-height:20px;vertical-align:=
top;overflow:visible;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&=
quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;w=
hite-space:pre">    },</td></tr><tr style=3D"box-sizing:border-box"><td id=
=3D"gmail-L31" class=3D"gmail-blob-num gmail-js-line-number gmail-js-code-n=
av-line-number gmail-js-blob-rnum" style=3D"box-sizing:border-box;padding:0=
px 10px;width:50px;min-width:50px;font-family:ui-monospace,SFMono-Regular,&=
quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;fon=
t-size:12px;line-height:20px;text-align:right;white-space:nowrap;vertical-a=
lign:top"></td><td id=3D"gmail-LC31" class=3D"gmail-blob-code gmail-blob-co=
de-inner gmail-js-file-line" style=3D"box-sizing:border-box;padding:0px 10p=
x;line-height:20px;vertical-align:top;overflow:visible;font-family:ui-monos=
pace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mon=
o&quot;,monospace;font-size:12px;white-space:pre">    {
      &quot;name&quot; : &quot;<b>debug_card</b>&quot;</td></tr><tr style=
=3D"box-sizing:border-box;background-color:transparent"><td id=3D"gmail-L32=
" class=3D"gmail-blob-num gmail-js-line-number gmail-js-code-nav-line-numbe=
r gmail-js-blob-rnum" style=3D"box-sizing:border-box;padding:0px 10px;width=
:50px;min-width:50px;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&=
quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;l=
ine-height:20px;text-align:right;white-space:nowrap;vertical-align:top"></t=
d><td id=3D"gmail-LC32" class=3D"gmail-blob-code gmail-blob-code-inner gmai=
l-js-file-line" style=3D"box-sizing:border-box;padding:0px 10px;line-height=
:20px;vertical-align:top;overflow:visible;font-family:ui-monospace,SFMono-R=
egular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monos=
pace;font-size:12px;white-space:pre">      <span class=3D"gmail-pl-ent" sty=
le=3D"box-sizing:border-box">&quot;type&quot;</span>: <span class=3D"gmail-=
pl-s" style=3D"box-sizing:border-box"><span class=3D"gmail-pl-pds" style=3D=
"box-sizing:border-box">&quot;</span>ipmb<span class=3D"gmail-pl-pds" style=
=3D"box-sizing:border-box">&quot;</span></span>,</td></tr><tr style=3D"box-=
sizing:border-box"><td id=3D"gmail-L33" class=3D"gmail-blob-num gmail-js-li=
ne-number gmail-js-code-nav-line-number gmail-js-blob-rnum" style=3D"box-si=
zing:border-box;padding:0px 10px;width:50px;min-width:50px;font-family:ui-m=
onospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation=
 Mono&quot;,monospace;font-size:12px;line-height:20px;text-align:right;whit=
e-space:nowrap;vertical-align:top"></td><td id=3D"gmail-LC33" class=3D"gmai=
l-blob-code gmail-blob-code-inner gmail-js-file-line" style=3D"box-sizing:b=
order-box;padding:0px 10px;line-height:20px;vertical-align:top;overflow:vis=
ible;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Cons=
olas,&quot;Liberation Mono&quot;,monospace;font-size:12px;white-space:pre">=
      <span class=3D"gmail-pl-ent" style=3D"box-sizing:border-box">&quot;sl=
ave-path&quot;</span>: <span class=3D"gmail-pl-s" style=3D"box-sizing:borde=
r-box"><span class=3D"gmail-pl-pds" style=3D"box-sizing:border-box">&quot;<=
/span>/dev/ipmb-13<span class=3D"gmail-pl-pds" style=3D"box-sizing:border-b=
ox">&quot;</span></span>,</td></tr><tr style=3D"box-sizing:border-box;backg=
round-color:transparent"><td id=3D"gmail-L34" class=3D"gmail-blob-num gmail=
-js-line-number gmail-js-code-nav-line-number gmail-js-blob-rnum" style=3D"=
box-sizing:border-box;padding:0px 10px;width:50px;min-width:50px;font-famil=
y:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Libe=
ration Mono&quot;,monospace;font-size:12px;line-height:20px;text-align:righ=
t;white-space:nowrap;vertical-align:top"></td><td id=3D"gmail-LC34" class=
=3D"gmail-blob-code gmail-blob-code-inner gmail-js-file-line" style=3D"box-=
sizing:border-box;padding:0px 10px;line-height:20px;vertical-align:top;over=
flow:visible;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Me=
nlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;white-spa=
ce:pre">      <span class=3D"gmail-pl-ent" style=3D"box-sizing:border-box">=
&quot;bmc-addr&quot;</span>: <span class=3D"gmail-pl-c1" style=3D"box-sizin=
g:border-box">32</span>,</td></tr><tr style=3D"box-sizing:border-box"><td i=
d=3D"gmail-L35" class=3D"gmail-blob-num gmail-js-line-number gmail-js-code-=
nav-line-number gmail-js-blob-rnum" style=3D"box-sizing:border-box;padding:=
0px 10px;width:50px;min-width:50px;font-family:ui-monospace,SFMono-Regular,=
&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;fo=
nt-size:12px;line-height:20px;text-align:right;white-space:nowrap;vertical-=
align:top"></td><td id=3D"gmail-LC35" class=3D"gmail-blob-code gmail-blob-c=
ode-inner gmail-js-file-line" style=3D"box-sizing:border-box;padding:0px 10=
px;line-height:20px;vertical-align:top;overflow:visible;font-family:ui-mono=
space,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mo=
no&quot;,monospace;font-size:12px;white-space:pre">      <span class=3D"gma=
il-pl-ent" style=3D"box-sizing:border-box">&quot;remote-addr&quot;</span>: =
<span class=3D"gmail-pl-c1" style=3D"box-sizing:border-box">64</span>,</td>=
</tr><tr style=3D"box-sizing:border-box;background-color:transparent"><td i=
d=3D"gmail-L36" class=3D"gmail-blob-num gmail-js-line-number gmail-js-code-=
nav-line-number gmail-js-blob-rnum" style=3D"box-sizing:border-box;padding:=
0px 10px;width:50px;min-width:50px;font-family:ui-monospace,SFMono-Regular,=
&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;fo=
nt-size:12px;line-height:20px;text-align:right;white-space:nowrap;vertical-=
align:top"></td><td id=3D"gmail-LC36" class=3D"gmail-blob-code gmail-blob-c=
ode-inner gmail-js-file-line" style=3D"box-sizing:border-box;padding:0px 10=
px;line-height:20px;vertical-align:top;overflow:visible;font-family:ui-mono=
space,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberation Mo=
no&quot;,monospace;font-size:12px;white-space:pre">      <span class=3D"gma=
il-pl-ent" style=3D"box-sizing:border-box">&quot;devIndex&quot;</span>: <sp=
an class=3D"gmail-pl-c1" style=3D"box-sizing:border-box">4</span></td></tr>=
<tr style=3D"box-sizing:border-box"><td id=3D"gmail-L37" class=3D"gmail-blo=
b-num gmail-js-line-number gmail-js-code-nav-line-number gmail-js-blob-rnum=
" style=3D"box-sizing:border-box;padding:0px 10px;width:50px;min-width:50px=
;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas=
,&quot;Liberation Mono&quot;,monospace;font-size:12px;line-height:20px;text=
-align:right;white-space:nowrap;vertical-align:top"></td><td id=3D"gmail-LC=
37" class=3D"gmail-blob-code gmail-blob-code-inner gmail-js-file-line" styl=
e=3D"box-sizing:border-box;padding:0px 10px;line-height:20px;vertical-align=
:top;overflow:visible;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono=
&quot;,Menlo,Consolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;=
white-space:pre">    }</td></tr><tr style=3D"box-sizing:border-box;backgrou=
nd-color:transparent"><td id=3D"gmail-L38" class=3D"gmail-blob-num gmail-js=
-line-number gmail-js-code-nav-line-number gmail-js-blob-rnum" style=3D"box=
-sizing:border-box;padding:0px 10px;width:50px;min-width:50px;font-family:u=
i-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,Consolas,&quot;Liberat=
ion Mono&quot;,monospace;font-size:12px;line-height:20px;text-align:right;w=
hite-space:nowrap;vertical-align:top"></td><td id=3D"gmail-LC38" class=3D"g=
mail-blob-code gmail-blob-code-inner gmail-js-file-line" style=3D"box-sizin=
g:border-box;padding:0px 10px;line-height:20px;vertical-align:top;overflow:=
visible;font-family:ui-monospace,SFMono-Regular,&quot;SF Mono&quot;,Menlo,C=
onsolas,&quot;Liberation Mono&quot;,monospace;font-size:12px;white-space:pr=
e"> ]</td></tr></tbody></table><div>=C2=A0 =C2=A0</div><div>=C2=A0 Settings=
d=C2=A0restriction mode objects :</div><div><br></div><div>=C2=A0 /xyz/open=
bmc_project/control/<b>debug_card</b>/restriction_mode<br></div><div>=C2=A0=
 /xyz/openbmc_project/control/<b>host1</b>/restriction_mode</div><div>=C2=
=A0=C2=A0/xyz/openbmc_project/control/<b>host2</b>/restriction_mode</div><d=
iv>=C2=A0 /xyz/openbmc_project/control/<b>host3</b>/restriction_mode<br></d=
iv><div>=C2=A0 /xyz/openbmc_project/control/<b>host3</b>/restriction_mode</=
div><div><br></div><div>=C2=A0 Could you please provide your thoughts on th=
is ?</div><div>=C2=A0=C2=A0<br>=C2=A0 Thanks,</div><div>=C2=A0 Kumar.</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
--Vernon<br>
<br>
&gt;<a href=3D"https://github.com/openbmc/openbmc/blob/master/meta-facebook=
/recipes-phosphor/ipmi/phosphor-ipmi-ipmb/yosemitev2/ipmb-channels.json" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/openbmc/blob/=
master/meta-facebook/recipes-phosphor/ipmi/phosphor-ipmi-ipmb/yosemitev2/ip=
mb-channels.json</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Already we have &quot;hostIdx&#39;&#39; in ipmi::C=
ontext struct, which represents<br>
&gt;the data coming from which hosts. Even Though if we plan to use this<br=
>
&gt;&quot;hostIdx&quot; ,=C2=A0 it is still not clear how we can map this &=
quot;hostIdx&#39;&#39; with<br>
&gt;settingsd restriction mode dbus-objects.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Otherwise, can we have some Schema(Rules) to follow the ch=
annel order<br>
&gt;for this channel and devices(settingsd dbus-objects) mapping ?<br>
&gt;=C2=A0 =C2=A0 Ex:=C2=A0 =C2=A0First 4 or 6 channel is for host 1 - host=
4<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Next channel is for=C2=
=A0 Debug card,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Rest of the channel is =
for other devices.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0I think we need to maintain this order in settingsd config=
 file and<br>
&gt;ipmb-channels.json config file for this channel and device mapping.<br>
&gt;<br>
&gt;=C2=A0 Could you please provide your suggestion on this.<br>
&gt;<br>
&gt;Thanks,<br>
&gt;Kumar.<br>
&gt;<br>
&gt;On Tue, Apr 26, 2022 at 9:25 PM Kumar Thangavel &lt;<br>
&gt;<a href=3D"mailto:kumarthangavel.hcl@gmail.com" target=3D"_blank">kumar=
thangavel.hcl@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Thanks for your response and suggestions.<br>
&gt;&gt;<br>
&gt;&gt; --Kumar.<br>
&gt;&gt;<br>
&gt;&gt; On Sat, Apr 23, 2022 at 4:55 AM Vernon Mauery &lt;<br>
&gt;&gt; <a href=3D"mailto:vernon.mauery@linux.intel.com" target=3D"_blank"=
>vernon.mauery@linux.intel.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; On 18-Apr-2022 04:56 PM, Kumar Thangavel wrote:<br>
&gt;&gt;&gt; &gt;Thanks for the response and clarification.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;I will clarify my question here,<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;IPMI restriction mode support has been added for host devi=
ces which<br>
&gt;&gt;&gt; support<br>
&gt;&gt;&gt; &gt;IPMI.<br>
&gt;&gt;&gt; &gt;This restriction mode support can be enabled or disabled f=
rom the<br>
&gt;&gt;&gt; &gt;phosphor-settingsd configuration (.yaml) file.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;Please check the below link for .yaml file of phosphor-set=
tingsd.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/openbmc/blob/7298b2478ec=
25cc1814124af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosp=
hor-settings-defaults/host-template.yaml#L61" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523=
acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-def=
aults/host-template.yaml#L61</a><br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;We wanted to add restriction mode support for other IPMI b=
ased devices<br>
&gt;&gt;&gt; &gt;(Debug card).<br>
&gt;&gt;&gt; &gt;Already phosphor-ipmi-host supports filters for all=C2=A0 =
IPMI commands which<br>
&gt;&gt;&gt; &gt;have ipmi::Context objects.<br>
&gt;&gt;&gt; &gt;So, How can we enable/disable this restriction mode suppor=
t<br>
&gt;&gt;&gt; &gt;from phosphor-settings for other IPMI based devices(Debug =
card). ?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I understand that currently only the host channel is using the=
<br>
&gt;&gt;&gt; restriction mode. You want to add it for other channels. This =
has<br>
&gt;&gt;&gt; already been done in the intel-ipmi-oem repo, if you want to t=
ake a look<br>
&gt;&gt;&gt; at that. It allows a fine-grained mechanism for command filter=
ing, based<br>
&gt;&gt;&gt; on the channel and the restriction mode (although currently, I=
 think the<br>
&gt;&gt;&gt; restriction mode still only applies to the host channel).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; My point is that it is pretty easy to come up with a custom fi=
lter<br>
&gt;&gt;&gt; mechanism that should suit you. There is even an option to dis=
able the<br>
&gt;&gt;&gt; built-in filter so you can supply your own.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --Vernon<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;On Thu, Apr 14, 2022 at 6:15 AM Vernon Mauery &lt;<br>
&gt;&gt;&gt; <a href=3D"mailto:vernon.mauery@linux.intel.com" target=3D"_bl=
ank">vernon.mauery@linux.intel.com</a>&gt;<br>
&gt;&gt;&gt; &gt;wrote:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; On 04-Apr-2022 12:49 PM, Kumar Thangavel wrote:<br>
&gt;&gt;&gt; &gt;&gt; &gt;Hi All,<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMI Restriction mode=
 support has been added for host machines<br>
&gt;&gt;&gt; &gt;&gt; &gt;which support IPMI.<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/openbmc/blob/7298b2478ec=
25cc1814124af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosp=
hor-settings-defaults/host-template.yaml#L61" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523=
acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-def=
aults/host-template.yaml#L61</a><br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 How IPMI restriction =
mode support can be added for other than<br>
&gt;&gt;&gt; host<br>
&gt;&gt;&gt; &gt;&gt; &gt;devices (IPMI based devices). Ex Debug card.=C2=
=A0 ?<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; I am not exactly sure what you are asking for here. W=
hen you say other<br>
&gt;&gt;&gt; &gt;&gt; devices, are you asking about restricting commands ba=
sed on what<br>
&gt;&gt;&gt; channel<br>
&gt;&gt;&gt; &gt;&gt; they come in on?<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; This is possible. A filter can filter on any criteria=
 that is available<br>
&gt;&gt;&gt; &gt;&gt; with the ipmi::Context object and the command. It can=
 even extract<br>
&gt;&gt;&gt; &gt;&gt; command data and take action there. I only say this i=
f you are<br>
&gt;&gt;&gt; &gt;&gt; interested in writing a new filter of your own.<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; But if you want to see a filter that is already imple=
mented that<br>
&gt;&gt;&gt; &gt;&gt; restricts commands based on BMC state and incoming ch=
annel, you can<br>
&gt;&gt;&gt; look<br>
&gt;&gt;&gt; &gt;&gt; at the filtering done in the intel-ipmi-oem repo.<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; If my guess at what you meant was wrong, please clari=
fy and I will try<br>
&gt;&gt;&gt; &gt;&gt; again.<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; --Vernon<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Could you please prov=
ide any suggestions or any docs ?<br>
&gt;&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;&gt; &gt;Thanks,<br>
&gt;&gt;&gt; &gt;&gt; &gt;Kumar.<br>
&gt;&gt;&gt; &gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
</blockquote></div></div>

--00000000000065723b05de3285b5--
