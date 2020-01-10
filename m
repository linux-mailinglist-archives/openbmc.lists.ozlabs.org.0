Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA6D136503
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 02:47:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47v5TX4pqpzDqc5
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 12:47:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=RSFzg8Hn; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47v5Sn5Px6zDqb1
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 12:47:03 +1100 (AEDT)
Received: by mail-ot1-x329.google.com with SMTP id r9so424582otp.13
 for <openbmc@lists.ozlabs.org>; Thu, 09 Jan 2020 17:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IU10xcYu+D53roW+T9yLSYSpKEhwEVe5v77sUQMQ2zs=;
 b=RSFzg8HnIia+DG3aOhgYzOuzLaja9yWdNwydwzm84+FpaXmvRyrt9Nmlf/R38RnZHV
 AWzlGdZvjBSD08X82L/xKIMJsfUzCwfOnXvocJvX1X6dWm8rurqDpLZkLmHLZ0bOKkBK
 fphN9i48TB+oYFT78J0oX7S9+RWsVbZaWBxg9OoBw7GJT3PZ69MMR32bxoxwKC16MjnX
 d67mFfZl0xeWLn44F6H4EmhetO3lU/M9awr+u/+czj5kFBkMtI90XUlWFBHgHVY+C1VU
 X1w0v4zMYQxgde6S1heAX0hWH+gxjwWOhQ3pn4SmqpNufcFfBOjiiuofboZXhJyNkD8x
 VRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IU10xcYu+D53roW+T9yLSYSpKEhwEVe5v77sUQMQ2zs=;
 b=CQ3vvUvRgOgkStZNuv1pEdFdWOtkrI5BEKL8Rw2nTgWUwhrlDDjXqxAMZ+GH1zg9O6
 h5oxMMwM/wT7+yWu7Zh0lULu81z8oKETkS0JhUIz8AULsHfHFCXNN1Xud2xRXfD6kg3G
 5oiD8aMPXXO8P7MrKcVL9Xat1Hu8yG0bpsRk6MMFDNKqmIyiWeIjkBAWwWqbsB2vfpqR
 Kij3jGZtfop/LRosu84OHMASXW0gKhCAKVGelyHweXuzkkt4QEfg+9sanFUJYGz4XIyd
 5lddgq0KPH2lxFYUvi2I1uqUW/2t+tDyyOvR8kh5qREKvg/czEgou/GVw4fIxNhu+gHI
 NLww==
X-Gm-Message-State: APjAAAW/SokT9pTXi8S0+bquDNNTZ0p9TbmBq2OYUrv0Zg6g4fgW5YkU
 X/VZtXxLvN1hHiTlHHJneTootDj+iiRP1pEi4ST5qg==
X-Google-Smtp-Source: APXvYqzGL1RHrcZfSXqyrWRBA4pSkJtI35biG9sbxxvCQJdvVFR5obxHZjyFQPXrb2xLxkE/wpBvjhdbTuFDSK7WW9k=
X-Received: by 2002:a05:6830:145:: with SMTP id
 j5mr622298otp.242.1578620819608; 
 Thu, 09 Jan 2020 17:46:59 -0800 (PST)
MIME-Version: 1.0
References: <CAA_a9xKmRHHx=vXvwTaO+0PRtFjLWQUAL1WnJH8XGBBzvExt2A@mail.gmail.com>
 <OF100509F8.6ECF782D-ON002584E9.004AC321-002584E9.0050DF26@notes.na.collabserv.com>
 <CAA_a9xJQsSjrcjq+=+uoPe4KCkUjWTgEp_cG-0E2FczP=PtBUg@mail.gmail.com>
 <d1069c71-108f-d5e0-f2fa-4af1048386e2@linux.intel.com>
 <CAA_a9xKG_qk5sBUZY6T5xH+XG_HQwLXVf2Jy0GXX0Ob+6R1rig@mail.gmail.com>
 <27eb67c0-c758-5b46-bb49-9eceec25bc4f@linux.intel.com>
 <CAA_a9xKa1VpvhfJVdvt_OqJ7in5Ntiowqmdpq_J1okYX8xq1yQ@mail.gmail.com>
In-Reply-To: <CAA_a9xKa1VpvhfJVdvt_OqJ7in5Ntiowqmdpq_J1okYX8xq1yQ@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Thu, 9 Jan 2020 17:46:48 -0800
Message-ID: <CAA_a9x+s5Gm4eS2q5it9o+PUoV9+EuyPS=RrWoHkq_15yB+2jQ@mail.gmail.com>
Subject: Re: Configuring device with I2C mux
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000308387059bbf4d00"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Kais Belgaied <belgaied@google.com>, Devjit Gopalpur <devjitg@google.com>,
 Peter Lundgren <peterlundgren@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000308387059bbf4d00
Content-Type: text/plain; charset="UTF-8"

Hi folks,

Thanks for your responses! We managed to configure them by setting up the
device tree, fixing the child buses to numbers related to the parent buses,
so that we could address them using simple arithmetic operations in JSON
config files.

- Alex Qiu


On Wed, Jan 8, 2020 at 10:06 AM Alex Qiu <xqiu@google.com> wrote:

> Hi James,
>
> I'll take a look at them. Thanks for pointing the related code out!
>
> - Alex Qiu
>
>
> On Wed, Jan 8, 2020 at 10:02 AM James Feist <james.feist@linux.intel.com>
> wrote:
>
>> On 1/8/20 9:54 AM, Alex Qiu wrote:
>> > Hi James,
>> >
>> > Yes, we have multiple devices sitting behind the mux, and they're
>> > onboard devices instead of standalone FRUs. The parent bus is described
>> > as the FRU for each PCIe card.
>> >
>> > After naming the mux channels, can these names be used somehow to
>> config
>> > I2C devices? For example, {"Bus": "$bus", "ChannelNames":
>> > ["C0", "C1", "C2", "C3"]} for the mux, and {"Bus": "$bus.C1"} for
>> > devices behind the mux on channel 1.
>>
>> This syntax doesn't exist today.. On all our systems things behind the
>> mux are again detectable, so we haven't hit this problem. Right now the
>> template replacement is purely based on the found device on d-bus. So
>> $bus is the bus property from the xyz.openbmc_project.FruDevice
>> interface, there's no way to trace that to a mux channel, as it's just a
>> d-bus property.
>>
>> The code you're looking for is here:
>>
>> https://github.com/openbmc/entity-manager/blob/01542d2af1b1f45335cc8813fffcd3ed07f22989/src/Utils.cpp#L144
>>
>>
>> Along with the channel identification logic here:
>>
>> https://github.com/openbmc/entity-manager/blob/01542d2af1b1f45335cc8813fffcd3ed07f22989/src/Overlay.cpp#L112
>>
>> You could probably add some special syntax to make this work. Luckily
>> this is the one part of entity-manager that is unit-tested, so that
>> should help you
>>
>> https://github.com/openbmc/entity-manager/blob/master/test/test_entity-manager.cpp
>>
>>
>> -James
>>
>>
>>
>>
>>

--000000000000308387059bbf4d00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi folks,</div><div><br></div><div>Thanks for your re=
sponses! We managed to configure them by setting up the device tree, fixing=
 the child buses to numbers related to the parent buses, so that we could a=
ddress them using simple arithmetic operations in JSON config files.</div><=
br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smart=
mail=3D"gmail_signature"><div dir=3D"ltr">- Alex Qiu</div></div></div><br><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Wed, Jan 8, 2020 at 10:06 AM Alex Qiu &lt;<a href=3D"mailto:xqiu@google.c=
om">xqiu@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr">Hi James,<div><br></div><div>I&#39;ll t=
ake a look at them. Thanks for pointing the related code out!</div><div><br=
 clear=3D"all"><div><div dir=3D"ltr"><div dir=3D"ltr">- Alex Qiu</div></div=
></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Wed, Jan 8, 2020 at 10:02 AM James Feist &lt;<a href=3D=
"mailto:james.feist@linux.intel.com" target=3D"_blank">james.feist@linux.in=
tel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On 1/8/20 9:54 AM, Alex Qiu wrote:<br>
&gt; Hi James,<br>
&gt; <br>
&gt; Yes, we have multiple devices sitting behind the mux, and they&#39;re =
<br>
&gt; onboard devices instead of standalone FRUs. The parent bus is describe=
d <br>
&gt; as the FRU for each PCIe card.<br>
&gt; <br>
&gt; After naming the mux channels, can these names be used somehow to conf=
ig <br>
&gt; I2C devices? For example, {&quot;Bus&quot;: &quot;$bus&quot;, &quot;Ch=
annelNames&quot;: <br>
&gt; [&quot;C0&quot;,=C2=A0&quot;C1&quot;,=C2=A0&quot;C2&quot;,=C2=A0&quot;=
C3&quot;]} for the mux, and {&quot;Bus&quot;: &quot;$bus.C1&quot;} for <br>
&gt; devices behind the mux on channel 1.<br>
<br>
This syntax doesn&#39;t exist today.. On all our systems things behind the =
<br>
mux are again detectable, so we haven&#39;t hit this problem. Right now the=
 <br>
template replacement is purely based on the found device on d-bus. So <br>
$bus is the bus property from the xyz.openbmc_project.FruDevice <br>
interface, there&#39;s no way to trace that to a mux channel, as it&#39;s j=
ust a <br>
d-bus property.<br>
<br>
The code you&#39;re looking for is here: <br>
<a href=3D"https://github.com/openbmc/entity-manager/blob/01542d2af1b1f4533=
5cc8813fffcd3ed07f22989/src/Utils.cpp#L144" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/openbmc/entity-manager/blob/01542d2af1b1f45335cc88=
13fffcd3ed07f22989/src/Utils.cpp#L144</a> <br>
<br>
<br>
Along with the channel identification logic here: <br>
<a href=3D"https://github.com/openbmc/entity-manager/blob/01542d2af1b1f4533=
5cc8813fffcd3ed07f22989/src/Overlay.cpp#L112" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/openbmc/entity-manager/blob/01542d2af1b1f45335cc=
8813fffcd3ed07f22989/src/Overlay.cpp#L112</a><br>
<br>
You could probably add some special syntax to make this work. Luckily <br>
this is the one part of entity-manager that is unit-tested, so that <br>
should help you <br>
<a href=3D"https://github.com/openbmc/entity-manager/blob/master/test/test_=
entity-manager.cpp" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/openbmc/entity-manager/blob/master/test/test_entity-manager.cpp</a><br>
<br>
<br>
-James<br>
<br>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000308387059bbf4d00--
