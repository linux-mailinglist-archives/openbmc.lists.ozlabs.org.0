Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D64B2518659
	for <lists+openbmc@lfdr.de>; Tue,  3 May 2022 16:16:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kt28858pWz3bgQ
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 00:16:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NalX7XG8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NalX7XG8; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kt27l3frNz2xKW
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2022 00:16:17 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id e5so3033658pgc.5
 for <openbmc@lists.ozlabs.org>; Tue, 03 May 2022 07:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dIpfz070LVRnkflNSJYmO4iegb2jZxnKWiHjwFQIItM=;
 b=NalX7XG8Y/G6b89/rRo17P0S5nvVUn7CnB+WBtkhHoXyaNRujoSyON8Dj7flzE71L2
 Zct0Dve11LIkV/9QqN0aes0/FScHWlFeCVtVZk1yzwpujgncEUHtAQGdedEiSl6C5YqF
 KwZGLmeBxBiGERet5kD6UqJK6P+k6dpb3sz0zN4EGJXT7QAPxmNCHCdKhIOm+47F4RAV
 zwMkDfOvepCnhNiSaWyrhYN0rQikFs3eGCNTE9+PjlGAGCitbmWKZ/d5D6+XPi5v9mAi
 VCHY3V/ZgV/JxnM2VqXEzk4iVMWMlkhCUTGr6XB4UzbbFX63kVvV+xmFAnRn4hE1AZQZ
 Oq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dIpfz070LVRnkflNSJYmO4iegb2jZxnKWiHjwFQIItM=;
 b=LrZDvHI/GKsCx6x32Dm8QlRu3jaCW8IfLjLcMWIwwaXswauw8d9nbKZFLOuCs/ZkhG
 ywiEz91Tg+f2t4drLqEwb+7Obdu0lEXGmwOvumnYnKKxw2jh/Upt1vzQeNxQmoyvKVV2
 zMQmCW/anYE+cdeHFJVV3zt8WF/5rGk3ob+XtPI7wqyJICU5h2HvDjATtivUuk/96aGk
 tobNCqkwed2muR/+3UUUNnRTu998x61jkXDNkXDF/okpcynO21eJ+nyT8SB5P2IaqdzF
 SrRJ1zpD1YCbl2aRU7SQFFnd5hXjlq4gobUy0R+muSBpePQ5DrNL8eEm2G2GuSQY2oxn
 DEgA==
X-Gm-Message-State: AOAM531N87K9Xz5t7bf0HjjkMNeVmDduJll3XjjP9jpKjqbRvqA0T5lT
 Kog3rHB/UvShk03exuW30LPjwm15Hx2uFnBDTYM=
X-Google-Smtp-Source: ABdhPJxWj1lovvT+XDKD+R4kTV77dYA0RlqCGNizq9PTkWjVphbz1264Av/LfjwOLBJStZ7gbdI+QIn/D3un4knYOHo=
X-Received: by 2002:a63:1114:0:b0:3aa:30b3:dd5f with SMTP id
 g20-20020a631114000000b003aa30b3dd5fmr13939546pgl.222.1651587374161; Tue, 03
 May 2022 07:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAA7Tbctgg9YJPTRcYCwkucajTvk-AUNeHJ9_=MD5dpvxF5D0ZA@mail.gmail.com>
 <20220414004457.GA230974@mauery.jf.intel.com>
 <CAA7TbcsoBoRvcw_oNA4y_5WhV3z3KX73WMqACiXThJHtjmtUBg@mail.gmail.com>
 <20220422232456.GA661800@mauery.jf.intel.com>
 <CAA7Tbctpz6EgJcpYHtRAyWP98Y_hSMn+PCNYX0BKZ=c76sGByQ@mail.gmail.com>
In-Reply-To: <CAA7Tbctpz6EgJcpYHtRAyWP98Y_hSMn+PCNYX0BKZ=c76sGByQ@mail.gmail.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Tue, 3 May 2022 19:46:02 +0530
Message-ID: <CAA7Tbcu8o6epZ8yMTAPNaJii8K=wUAvo-T0WYUgFab6NtMEk9g@mail.gmail.com>
Subject: Re: IPMI Restriction Mode
To: Vernon Mauery <vernon.mauery@linux.intel.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000c0a0cc05de1c2621"
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
Cc: anoo@us.ibm.com, velumanit@hcl.com, velumani.hcl@gmail.com,
 deepak.kodihalli.83@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c0a0cc05de1c2621
Content-Type: text/plain; charset="UTF-8"

Hi Vernon,

     We may need to write our own custom filter for other channels as you
suggested.
     While implementing this, we need some clarifications.

     1. How can we map channel Id's with settingsd restriction mode
dbus-objects ?
     2. The Ipmb channel has multiple devices in our system, How can we
handle and apply this multiple Ipmb interfaces with
settingsd restriction mode dbus-objects ?

     Please refer below link for multiple Ipmb channels for our system.


https://github.com/openbmc/openbmc/blob/master/meta-facebook/recipes-phosphor/ipmi/phosphor-ipmi-ipmb/yosemitev2/ipmb-channels.json

      Already we have "hostIdx'' in ipmi::Context struct, which represents
the data coming from which hosts. Even Though if we plan to use this
"hostIdx" ,  it is still not clear how we can map this "hostIdx'' with
settingsd restriction mode dbus-objects.

   Otherwise, can we have some Schema(Rules) to follow the channel order
for this channel and devices(settingsd dbus-objects) mapping ?
    Ex:   First 4 or 6 channel is for host 1 - host4
             Next channel is for  Debug card,
             Rest of the channel is for other devices.

   I think we need to maintain this order in settingsd config file and
ipmb-channels.json config file for this channel and device mapping.

  Could you please provide your suggestion on this.

Thanks,
Kumar.

On Tue, Apr 26, 2022 at 9:25 PM Kumar Thangavel <
kumarthangavel.hcl@gmail.com> wrote:

> Thanks for your response and suggestions.
>
> --Kumar.
>
> On Sat, Apr 23, 2022 at 4:55 AM Vernon Mauery <
> vernon.mauery@linux.intel.com> wrote:
>
>> On 18-Apr-2022 04:56 PM, Kumar Thangavel wrote:
>> >Thanks for the response and clarification.
>> >
>> >I will clarify my question here,
>> >
>> >IPMI restriction mode support has been added for host devices which
>> support
>> >IPMI.
>> >This restriction mode support can be enabled or disabled from the
>> >phosphor-settingsd configuration (.yaml) file.
>> >
>> >Please check the below link for .yaml file of phosphor-settingsd.
>> >
>> >
>> https://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/host-template.yaml#L61
>> >
>> >We wanted to add restriction mode support for other IPMI based devices
>> >(Debug card).
>> >Already phosphor-ipmi-host supports filters for all  IPMI commands which
>> >have ipmi::Context objects.
>> >So, How can we enable/disable this restriction mode support
>> >from phosphor-settings for other IPMI based devices(Debug card). ?
>>
>> I understand that currently only the host channel is using the
>> restriction mode. You want to add it for other channels. This has
>> already been done in the intel-ipmi-oem repo, if you want to take a look
>> at that. It allows a fine-grained mechanism for command filtering, based
>> on the channel and the restriction mode (although currently, I think the
>> restriction mode still only applies to the host channel).
>>
>> My point is that it is pretty easy to come up with a custom filter
>> mechanism that should suit you. There is even an option to disable the
>> built-in filter so you can supply your own.
>>
>> --Vernon
>>
>> >
>> >
>> >
>> >On Thu, Apr 14, 2022 at 6:15 AM Vernon Mauery <
>> vernon.mauery@linux.intel.com>
>> >wrote:
>> >
>> >> On 04-Apr-2022 12:49 PM, Kumar Thangavel wrote:
>> >> >Hi All,
>> >> >
>> >> >        IPMI Restriction mode support has been added for host machines
>> >> >which support IPMI.
>> >> >
>> >> >
>> >>
>> https://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/host-template.yaml#L61
>> >> >
>> >> >        How IPMI restriction mode support can be added for other than
>> host
>> >> >devices (IPMI based devices). Ex Debug card.  ?
>> >>
>> >> I am not exactly sure what you are asking for here. When you say other
>> >> devices, are you asking about restricting commands based on what
>> channel
>> >> they come in on?
>> >>
>> >> This is possible. A filter can filter on any criteria that is available
>> >> with the ipmi::Context object and the command. It can even extract
>> >> command data and take action there. I only say this if you are
>> >> interested in writing a new filter of your own.
>> >>
>> >> But if you want to see a filter that is already implemented that
>> >> restricts commands based on BMC state and incoming channel, you can
>> look
>> >> at the filtering done in the intel-ipmi-oem repo.
>> >>
>> >> If my guess at what you meant was wrong, please clarify and I will try
>> >> again.
>> >>
>> >> --Vernon
>> >>
>> >> >        Could you please provide any suggestions or any docs ?
>> >> >
>> >> >Thanks,
>> >> >Kumar.
>> >>
>>
>

--000000000000c0a0cc05de1c2621
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Vernon,<br><br>=C2=A0 =C2=A0 =C2=A0We may need to write=
 our own custom filter for other channels as you suggested.<div>=C2=A0 =C2=
=A0 =C2=A0While implementing this, we need some clarifications.<br></div><d=
iv>=C2=A0 =C2=A0 =C2=A0</div><div>=C2=A0 =C2=A0 =C2=A01. How can we map cha=
nnel Id&#39;s with settingsd=C2=A0restriction mode dbus-objects ?</div><div=
>=C2=A0 =C2=A0 =C2=A02. The Ipmb channel has multiple devices in our system=
, How can we handle and apply this multiple Ipmb interfaces with settingsd=
=C2=A0restriction=C2=A0mode dbus-objects ?<br><br></div><div>=C2=A0 =C2=A0 =
=C2=A0Please refer below link for multiple Ipmb channels for our system.<br=
><br></div><div>=C2=A0 =C2=A0=C2=A0<a href=3D"https://github.com/openbmc/op=
enbmc/blob/master/meta-facebook/recipes-phosphor/ipmi/phosphor-ipmi-ipmb/yo=
semitev2/ipmb-channels.json">https://github.com/openbmc/openbmc/blob/master=
/meta-facebook/recipes-phosphor/ipmi/phosphor-ipmi-ipmb/yosemitev2/ipmb-cha=
nnels.json</a></div><div>=C2=A0</div><div>=C2=A0 =C2=A0 =C2=A0 Already we h=
ave &quot;hostIdx&#39;&#39; in ipmi::Context struct, which represents the d=
ata coming from which hosts. Even Though if we plan to use this &quot;hostI=
dx&quot; ,=C2=A0=C2=A0it is still not clear how we can map this &quot;hostI=
dx&#39;&#39; with settingsd=C2=A0restriction mode dbus-objects.</div><div><=
br></div><div>=C2=A0 =C2=A0Otherwise, can we have some Schema(Rules) to fol=
low the channel order for this channel and devices(settingsd=C2=A0dbus-obje=
cts) mapping ?=C2=A0</div><div>=C2=A0 =C2=A0 Ex:=C2=A0 =C2=A0First 4 or 6 c=
hannel is for host 1 - host4</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0Next channel is for=C2=A0 Debug card,=C2=A0</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Rest of the channel is for other d=
evices.</div><div><br></div><div>=C2=A0 =C2=A0I think we need to maintain t=
his order in=C2=A0settingsd=C2=A0config file and ipmb-channels.json config =
file for this channel and device mapping.=C2=A0</div><div><br></div><div>=
=C2=A0 Could you please provide your suggestion on this.</div><div>=C2=A0=
=C2=A0</div><div>Thanks,</div><div>Kumar.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 26, 2022 at 9:25 PM Kumar T=
hangavel &lt;<a href=3D"mailto:kumarthangavel.hcl@gmail.com" target=3D"_bla=
nk">kumarthangavel.hcl@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">Thanks for your response =
and suggestions.<div><br></div><div>--Kumar.</div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 23, 2022 at 4=
:55 AM Vernon Mauery &lt;<a href=3D"mailto:vernon.mauery@linux.intel.com" t=
arget=3D"_blank">vernon.mauery@linux.intel.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On 18-Apr-2022 04:56 PM, Kuma=
r Thangavel wrote:<br>
&gt;Thanks for the response and clarification.<br>
&gt;<br>
&gt;I will clarify my question here,<br>
&gt;<br>
&gt;IPMI restriction mode support has been added for host devices which sup=
port<br>
&gt;IPMI.<br>
&gt;This restriction mode support can be enabled or disabled from the<br>
&gt;phosphor-settingsd configuration (.yaml) file.<br>
&gt;<br>
&gt;Please check the below link for .yaml file of phosphor-settingsd.<br>
&gt;<br>
&gt;<a href=3D"https://github.com/openbmc/openbmc/blob/7298b2478ec25cc18141=
24af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-setti=
ngs-defaults/host-template.yaml#L61" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523acc4ffade=
05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-defaults/hos=
t-template.yaml#L61</a><br>
&gt;<br>
&gt;We wanted to add restriction mode support for other IPMI based devices<=
br>
&gt;(Debug card).<br>
&gt;Already phosphor-ipmi-host supports filters for all=C2=A0 IPMI commands=
 which<br>
&gt;have ipmi::Context objects.<br>
&gt;So, How can we enable/disable this restriction mode support<br>
&gt;from phosphor-settings for other IPMI based devices(Debug card). ?<br>
<br>
I understand that currently only the host channel is using the <br>
restriction mode. You want to add it for other channels. This has <br>
already been done in the intel-ipmi-oem repo, if you want to take a look <b=
r>
at that. It allows a fine-grained mechanism for command filtering, based <b=
r>
on the channel and the restriction mode (although currently, I think the <b=
r>
restriction mode still only applies to the host channel).<br>
<br>
My point is that it is pretty easy to come up with a custom filter <br>
mechanism that should suit you. There is even an option to disable the <br>
built-in filter so you can supply your own.<br>
<br>
--Vernon<br>
<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;On Thu, Apr 14, 2022 at 6:15 AM Vernon Mauery &lt;<a href=3D"mailto:ver=
non.mauery@linux.intel.com" target=3D"_blank">vernon.mauery@linux.intel.com=
</a>&gt;<br>
&gt;wrote:<br>
&gt;<br>
&gt;&gt; On 04-Apr-2022 12:49 PM, Kumar Thangavel wrote:<br>
&gt;&gt; &gt;Hi All,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMI Restriction mode support has =
been added for host machines<br>
&gt;&gt; &gt;which support IPMI.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; <a href=3D"https://github.com/openbmc/openbmc/blob/7298b2478ec25cc=
1814124af523acc4ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-=
settings-defaults/host-template.yaml#L61" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/openbmc/openbmc/blob/7298b2478ec25cc1814124af523acc4=
ffade05e6/meta-phosphor/recipes-phosphor/settings/phosphor-settings-default=
s/host-template.yaml#L61</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 How IPMI restriction mode support =
can be added for other than host<br>
&gt;&gt; &gt;devices (IPMI based devices). Ex Debug card.=C2=A0 ?<br>
&gt;&gt;<br>
&gt;&gt; I am not exactly sure what you are asking for here. When you say o=
ther<br>
&gt;&gt; devices, are you asking about restricting commands based on what c=
hannel<br>
&gt;&gt; they come in on?<br>
&gt;&gt;<br>
&gt;&gt; This is possible. A filter can filter on any criteria that is avai=
lable<br>
&gt;&gt; with the ipmi::Context object and the command. It can even extract=
<br>
&gt;&gt; command data and take action there. I only say this if you are<br>
&gt;&gt; interested in writing a new filter of your own.<br>
&gt;&gt;<br>
&gt;&gt; But if you want to see a filter that is already implemented that<b=
r>
&gt;&gt; restricts commands based on BMC state and incoming channel, you ca=
n look<br>
&gt;&gt; at the filtering done in the intel-ipmi-oem repo.<br>
&gt;&gt;<br>
&gt;&gt; If my guess at what you meant was wrong, please clarify and I will=
 try<br>
&gt;&gt; again.<br>
&gt;&gt;<br>
&gt;&gt; --Vernon<br>
&gt;&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Could you please provide any sugge=
stions or any docs ?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;Thanks,<br>
&gt;&gt; &gt;Kumar.<br>
&gt;&gt;<br>
</blockquote></div>
</blockquote></div>

--000000000000c0a0cc05de1c2621--
