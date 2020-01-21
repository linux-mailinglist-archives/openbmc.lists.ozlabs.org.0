Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E18143681
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 06:22:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481xjm1DK2zDqNk
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 16:22:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d33;
 helo=mail-io1-xd33.google.com; envelope-from=rahulmaheshwari01@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kQ+MgUbp; dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481xj26wPYzDqLS
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jan 2020 16:21:26 +1100 (AEDT)
Received: by mail-io1-xd33.google.com with SMTP id t26so1460216ioi.13
 for <openbmc@lists.ozlabs.org>; Mon, 20 Jan 2020 21:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oh+DhfQki56RodSuTxYskZGmjVkIM9shlyOti/5spp4=;
 b=kQ+MgUbplOTK8geVfnlN6CA/cC+zW5SidNfEwDSD7P8KEXy1dmKI2KsnW4dugtOh7a
 jaKAU5TzP5Lnl44NQvF0/fiE7pEar0XTyfDmEwn/csCqjpW+H/LAcNzPn99fYh/La6Ut
 OhUrTbar47ojtD49u2oD5DbTu8bZymvTQfkfM+Z9WqzZUvGck5rqwjTmamOMkMvI0Z15
 5nIm+PP/+8eS+pS+KFqzo4DLvYtwOxvSKv/GnzfN5sU1fjlCOQoprC08DRZ0/wF9gQ3+
 6Ocrio05W/0xHkMWPqFDYW/iQb1+HerHFdUOisCuNzL/T4RIAtt1IKAy8wHpBFDyJUki
 4ipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oh+DhfQki56RodSuTxYskZGmjVkIM9shlyOti/5spp4=;
 b=nRcWJDXK3tm/Kv3BXkDD6vXWZoAVrcPixb0h6PHTTes2rcO95cs2+NJcZ/wmZ/QbLP
 7CjeW5xzSbQytHXx6kPdICSNXcxkJxw8a41VS6d72rfLBNh2z1Myl5jWkKJB+816YEvY
 vQmVP5HSMTE49jae4FCuKfLxKbd8o4eNiMaCbhnRJqmy8L8vppjGjQl4If7960/chu1/
 2dUnAxBEsAerJYYAZI0ZzPY7U2jDz4Sv4MP+TVRmv9wU2bf+Vb1eHdY2BGrD4DwzuGnF
 0afJAcSzTKlf4+w6lNQT6q9K2iRufasF+qB8QWy35w7biIqnoWag2Wd+OfQmhzAjb/BD
 vZew==
X-Gm-Message-State: APjAAAVItxA83NAZR7fNLDKXPVLHaAW0QlLBVFdI0gJvUbwLUj0EShwQ
 2ZfXS+FQ/cjE1kN7EA+DKcUlDuU5tDymJtj++4UGHkB/
X-Google-Smtp-Source: APXvYqxyCSXG5r4f+7wvIbqzc3ENR+nwa8oDPLBp9R1czwkDrzIKnbW+WwHWBTw6LCkBqmSM8jzmKfikR+zyUCK8ki0=
X-Received: by 2002:a6b:6118:: with SMTP id v24mr1808990iob.73.1579584083075; 
 Mon, 20 Jan 2020 21:21:23 -0800 (PST)
MIME-Version: 1.0
References: <10cf015965644daf9cfae7421e9f4710@quantatw.com>
 <CAAMkS132O2MB4myFcwPo0NQNf=hzvLYXgqoLXOxCcJe6mqHEMQ@mail.gmail.com>
 <0ebd5d88a9ea46328db578849d4b061b@quantatw.com>
 <CAAMkS12VRBFU77D50z0z4MHDeSG6pdOwU2MeBPO0K7TG6arTvA@mail.gmail.com>
 <d5f1c07fa629476798196f9490574c7c@quantatw.com>
 <5cb636bb-0d14-89c9-42b4-1d20d410ea82@linux.intel.com>
 <9f63a6b71e8a485bba08a1bedb1b922c@quantatw.com>
 <c7782b54-da11-953e-815c-8f5a3a6610fc@linux.intel.com>
In-Reply-To: <c7782b54-da11-953e-815c-8f5a3a6610fc@linux.intel.com>
From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Date: Tue, 21 Jan 2020 10:51:11 +0530
Message-ID: <CAAMkS13kJGWWroEkUnJB7Eec6DGWxUTZXM+4ajJpZi=ACkXyyA@mail.gmail.com>
Subject: Re: Verify Privilege For Different Channels in openbmc-test-automation
To: "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Content-Type: multipart/alternative; boundary="0000000000002a2b11059c9f94aa"
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
 =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002a2b11059c9f94aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Richard for correcting. Yes, there is a need to update this test
case.

Tony
We don't run this test case on our systems as we dont have dual channel
system. Can you fix this test case?

Thanks
Rahul

On Tue, Jan 21, 2020 at 10:29 AM Thomaiyar, Richard Marian <
richard.marian.thomaiyar@linux.intel.com> wrote:

> Hi Tony / Rahul,
>
> 1. sel info 1  (I don't think sel info can get channel number, as sel is
> not based on channel numbers)
>
> 2. user list can be queried through channel number i.e. "user list 1"
> will query user privileges as per channel number 1 and "user list 3"
> will query user privileges as per channel number 3. But it doesn't
> determine the incoming channel number.
>
> i.e. if a system is having 2 LAN Channels, then LAN channel privilege is
> based on the IP address of those channels
>
> say channel 1 is having IP x.y.z.1 & channel 3 is having IP x.y.z.3  and
> channel 3 is with NoAccess
>
> then executing following command will pass
>
> ipmitool -I lanplus -H x.y.z.1 -U root -P 0penBmc user list 1
>
> ipmitool -I lanplus -H x.y.z.1 -U root -P 0penBmc user list 3
>
> Following command execution will fail
>
> ipmitool -I lanplus -H x.y.z.3 -U root -P 0penBmc user list 1 --> will
> fail if channel 3 is with NoAccess privilege for user root
>
> ipmitool -I lanplus -H x.y.z.3 -U root -P 0penBmc user list 1 --> will
> fail if channel 3 is with NoAccess privilege for user root
>
> Please update the test case accordingly.
>
> Regards,
>
> Richard
>
> On 1/21/2020 8:39 AM, Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) wrote:
> >> Are you saying that with NoAcess for channel x, you are able to get th=
e
> IPMI
> >> response.
> > Yes.
> >
> >> please note: -H x.x.x.x  determines, which channel you are trying to
> >> communicate. Try the other IP address (because not sure, which channel
> is
> >> configured to what IP).
> > This is as I expected!
> > However, please look at the cases "Verify Administrator And No Access
> Privilege For Different Channels"
> > and "Verify Operator And User Privilege For Different Channels" in
> test_ipmi_user.robot.
> > For example: case "Verify Administrator And No Access Privilege For
> Different Channels" at the last two "Verify" steps:
> > '''
> > # Verify that user is able to run administrator level IPMI command with
> channel 1.
> > Verify IPMI Command  ${random_username}  ${valid_password}
> Administrator  1
> >
> > # Verify that user is unable to run IPMI command with channel 2.
> > Run IPMI Standard Command  sel info 2  expected_rc=3D${1}
> U=3D${random_username}  P=3D${valid_password}
> > '''
> >
> > In this case, first, there is only one IP address.
> > second, I can't find a description or SPEC about command like
> > "ipmitool -I lanplus -C 3 -p 623 -U YmRBwDUS -P 0penBmc1 -H x.x.x.x -L
> Administrator sel info 1"
> > which mean user is able to run IPMI command with channel 1.
> >
> > If the method for out-of-band communication using different channels is
> the same as you described,
> > do we need to fix these two cases?
> >
> >> Regards,
> >>
> >> Richard
> >>
>

--0000000000002a2b11059c9f94aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Richard for correcting. Yes, there is a need to upd=
ate this test case.=C2=A0<div><br></div><div>Tony</div><div>We don&#39;t ru=
n this test case on our systems as we dont have dual channel system. Can yo=
u fix this test case?</div><div><br></div><div>Thanks</div><div>Rahul</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, Jan 21, 2020 at 10:29 AM Thomaiyar, Richard Marian &lt;<a href=3D"m=
ailto:richard.marian.thomaiyar@linux.intel.com">richard.marian.thomaiyar@li=
nux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hi Tony / Rahul,<br>
<br>
1. sel info 1=C2=A0 (I don&#39;t think sel info can get channel number, as =
sel is <br>
not based on channel numbers)<br>
<br>
2. user list can be queried through channel number i.e. &quot;user list 1&q=
uot; <br>
will query user privileges as per channel number 1 and &quot;user list 3&qu=
ot; <br>
will query user privileges as per channel number 3. But it doesn&#39;t <br>
determine the incoming channel number.<br>
<br>
i.e. if a system is having 2 LAN Channels, then LAN channel privilege is <b=
r>
based on the IP address of those channels<br>
<br>
say channel 1 is having IP x.y.z.1 &amp; channel 3 is having IP x.y.z.3=C2=
=A0 and <br>
channel 3 is with NoAccess<br>
<br>
then executing following command will pass<br>
<br>
ipmitool -I lanplus -H x.y.z.1 -U root -P 0penBmc user list 1<br>
<br>
ipmitool -I lanplus -H x.y.z.1 -U root -P 0penBmc user list 3<br>
<br>
Following command execution will fail<br>
<br>
ipmitool -I lanplus -H x.y.z.3 -U root -P 0penBmc user list 1 --&gt; will <=
br>
fail if channel 3 is with NoAccess privilege for user root<br>
<br>
ipmitool -I lanplus -H x.y.z.3 -U root -P 0penBmc user list 1 --&gt; will <=
br>
fail if channel 3 is with NoAccess privilege for user root<br>
<br>
Please update the test case accordingly.<br>
<br>
Regards,<br>
<br>
Richard<br>
<br>
On 1/21/2020 8:39 AM, Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) wrote:<br>
&gt;&gt; Are you saying that with NoAcess for channel x, you are able to ge=
t the IPMI<br>
&gt;&gt; response.<br>
&gt; Yes.<br>
&gt;<br>
&gt;&gt; please note: -H x.x.x.x=C2=A0 determines, which channel you are tr=
ying to<br>
&gt;&gt; communicate. Try the other IP address (because not sure, which cha=
nnel is<br>
&gt;&gt; configured to what IP).<br>
&gt; This is as I expected!<br>
&gt; However, please look at the cases &quot;Verify Administrator And No Ac=
cess Privilege For Different Channels&quot;<br>
&gt; and &quot;Verify Operator And User Privilege For Different Channels&qu=
ot; in test_ipmi_user.robot.<br>
&gt; For example: case &quot;Verify Administrator And No Access Privilege F=
or Different Channels&quot; at the last two &quot;Verify&quot; steps:<br>
&gt; &#39;&#39;&#39;<br>
&gt; # Verify that user is able to run administrator level IPMI command wit=
h channel 1.<br>
&gt; Verify IPMI Command=C2=A0 ${random_username}=C2=A0 ${valid_password}=
=C2=A0 Administrator=C2=A0 1<br>
&gt;<br>
&gt; # Verify that user is unable to run IPMI command with channel 2.<br>
&gt; Run IPMI Standard Command=C2=A0 sel info 2=C2=A0 expected_rc=3D${1}=C2=
=A0 U=3D${random_username}=C2=A0 P=3D${valid_password}<br>
&gt; &#39;&#39;&#39;<br>
&gt;<br>
&gt; In this case, first, there is only one IP address.<br>
&gt; second, I can&#39;t find a description or SPEC about command like<br>
&gt; &quot;ipmitool -I lanplus -C 3 -p 623 -U YmRBwDUS -P 0penBmc1 -H x.x.x=
.x -L Administrator sel info 1&quot;<br>
&gt; which mean user is able to run IPMI command with channel 1.<br>
&gt;<br>
&gt; If the method for out-of-band communication using different channels i=
s the same as you described,<br>
&gt; do we need to fix these two cases?<br>
&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt;<br>
&gt;&gt; Richard<br>
&gt;&gt;<br>
</blockquote></div>

--0000000000002a2b11059c9f94aa--
