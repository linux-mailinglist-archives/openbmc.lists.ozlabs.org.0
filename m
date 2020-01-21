Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD17143F59
	for <lists+openbmc@lfdr.de>; Tue, 21 Jan 2020 15:23:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4829js3nPbzDqWn
	for <lists+openbmc@lfdr.de>; Wed, 22 Jan 2020 01:22:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=rahulmaheshwari01@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kN3jAX3h; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4829fF71rZzDqRs
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 01:19:47 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id n25so2447213lfl.0
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jan 2020 06:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rOHLtolIP10iKO9Favft6k5tcpmNf1fYJd7gdwH6Xlk=;
 b=kN3jAX3hJN1GI1JXoFfq9kc1qZnBq+DQIU+TLwHTa2T8f8cu8jXYsrNu86oGzYk0ra
 FKYHeTx5ErqtLBi5yVRHuP4PSgWTZEr+7HFblszO0BvXvZv26HqlU4J9Q2ju3CZWXHil
 6suHZTzXcWg/cYgsVD1beg66l6hD0cz+8+0NwfzdzD2Ri//xhOWqgmdYp90e4AZHCxvL
 llYVvosKaRz9bKxwPuGZ4SGIypv6Msf7oWy/i4OfM6JCHTCxxkeNarzWAEWUeA+ZsARm
 bXBzM0iSDpcr6hHAzZ311j3wa1v36dh0gomuIB2FFNbddAMOkFRHP3YurCEpa6+3H33B
 Uxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rOHLtolIP10iKO9Favft6k5tcpmNf1fYJd7gdwH6Xlk=;
 b=Owg0aCCirDDcf0XlcPgpeYq6jMxYeZF6a8aJTbFiG3BKQ6FgSnr3VJL49cGkb6yQrU
 4Uss/HKUWJsksrbtzL0MtU4qBW2cnu9f8nDqL/qEWSwfnOmnodm+vKqAUf/BWW+JcZtD
 Rt7Mlc6NfMFBDmhqWeoBv1ejoozewTSdPCv4nFy1a+9WAJWtl66imAf8M8fSehHzrZJl
 AQOFMhavcBzqlOcVnmtoE0qcPgwGMt4nWN1A8oRGpUODDl/I1ye/YQ9PEYSPFwnvuCRZ
 uq2d1ohWStX36hLxy77+xXTjjU+Q8eDRWe+89CtZc8POweBMtsyNgtUmfUPy8W8aBgT3
 QoQA==
X-Gm-Message-State: APjAAAUlfjg4SD0nfoGOW/u10Llg8nQMWgzFP4nGvvOQh+ZInx+mrdQO
 fc6ezp2wnE4eLmG13f9gtGJiupsk0lMgfKqVpg4=
X-Google-Smtp-Source: APXvYqwL9yMD4ln5h4uvgn2pby9VBMcRX76hLqjbZomQ15DB2KLQYd4egjNKBZn7C5VwzZtm/GxyPkretWdJZOh4QaY=
X-Received: by 2002:a19:5212:: with SMTP id m18mr2879607lfb.7.1579616383925;
 Tue, 21 Jan 2020 06:19:43 -0800 (PST)
MIME-Version: 1.0
References: <10cf015965644daf9cfae7421e9f4710@quantatw.com>
 <CAAMkS132O2MB4myFcwPo0NQNf=hzvLYXgqoLXOxCcJe6mqHEMQ@mail.gmail.com>
 <0ebd5d88a9ea46328db578849d4b061b@quantatw.com>
 <CAAMkS12VRBFU77D50z0z4MHDeSG6pdOwU2MeBPO0K7TG6arTvA@mail.gmail.com>
 <d5f1c07fa629476798196f9490574c7c@quantatw.com>
 <5cb636bb-0d14-89c9-42b4-1d20d410ea82@linux.intel.com>
 <9f63a6b71e8a485bba08a1bedb1b922c@quantatw.com>
 <c7782b54-da11-953e-815c-8f5a3a6610fc@linux.intel.com>
 <CAAMkS13kJGWWroEkUnJB7Eec6DGWxUTZXM+4ajJpZi=ACkXyyA@mail.gmail.com>
 <059fe82ae51c4e3bbf90f5045e8a9371@quantatw.com>
In-Reply-To: <059fe82ae51c4e3bbf90f5045e8a9371@quantatw.com>
From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Date: Tue, 21 Jan 2020 19:49:33 +0530
Message-ID: <CAAMkS10CpkryFje4BTpFYKmiL44OAuxhG8tbZNPN2GSZr+8nFg@mail.gmail.com>
Subject: Re: Verify Privilege For Different Channels in openbmc-test-automation
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
Content-Type: multipart/alternative; boundary="000000000000720256059ca719f2"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000720256059ca719f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure. Thanks you.

On Tue, Jan 21, 2020 at 2:16 PM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <Ton=
y.Lee@quantatw.com>
wrote:

> I'm sorry, we also do not have dual channel system currently.
> Once we have, it will be tested and updated for these two test cases.
>
> From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
> Sent: Tuesday, January 21, 2020 1:21 PM
> To: Thomaiyar, Richard Marian <richard.marian.thomaiyar@linux.intel.com>
> Cc: Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <Tony.Lee@quantatw.com>; openb=
mc@lists.ozlabs.org
> Subject: Re: Verify Privilege For Different Channels in
> openbmc-test-automation
>
> Thanks Richard for correcting. Yes, there is a need to update this test
> case.
>
> Tony
> We don't run this test case on our systems as we dont have dual channel
> system. Can you fix this test case?
>
> Thanks
> Rahul
>
> On Tue, Jan 21, 2020 at 10:29 AM Thomaiyar, Richard Marian <mailto:
> richard.marian.thomaiyar@linux.intel.com> wrote:
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

--000000000000720256059ca719f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure. Thanks you.</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 21, 2020 at 2:16 PM Tony Lee =
(=E6=9D=8E=E6=96=87=E5=AF=8C) &lt;<a href=3D"mailto:Tony.Lee@quantatw.com">=
Tony.Lee@quantatw.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">I&#39;m sorry, we also do not have dual channel system=
 currently.<br>
Once we have, it will be tested and updated for these two test cases.<br>
<br>
From: Rahul Maheshwari &lt;<a href=3D"mailto:rahulmaheshwari01@gmail.com" t=
arget=3D"_blank">rahulmaheshwari01@gmail.com</a>&gt; <br>
Sent: Tuesday, January 21, 2020 1:21 PM<br>
To: Thomaiyar, Richard Marian &lt;<a href=3D"mailto:richard.marian.thomaiya=
r@linux.intel.com" target=3D"_blank">richard.marian.thomaiyar@linux.intel.c=
om</a>&gt;<br>
Cc: Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) &lt;<a href=3D"mailto:Tony.Lee@q=
uantatw.com" target=3D"_blank">Tony.Lee@quantatw.com</a>&gt;; <a href=3D"ma=
ilto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</=
a><br>
Subject: Re: Verify Privilege For Different Channels in openbmc-test-automa=
tion<br>
<br>
Thanks Richard for correcting. Yes, there is a need to update this test cas=
e.=C2=A0<br>
<br>
Tony<br>
We don&#39;t run this test case on our systems as we dont have dual channel=
 system. Can you fix this test case?<br>
<br>
Thanks<br>
Rahul<br>
<br>
On Tue, Jan 21, 2020 at 10:29 AM Thomaiyar, Richard Marian &lt;mailto:<a hr=
ef=3D"mailto:richard.marian.thomaiyar@linux.intel.com" target=3D"_blank">ri=
chard.marian.thomaiyar@linux.intel.com</a>&gt; wrote:<br>
Hi Tony / Rahul,<br>
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

--000000000000720256059ca719f2--
