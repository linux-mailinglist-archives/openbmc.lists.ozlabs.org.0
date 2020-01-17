Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D326140894
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 12:02:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zdRx20JdzDqdl
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 22:02:05 +1100 (AEDT)
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
 header.s=20161025 header.b=lLd40V7i; dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zdR26YgLzDqYM
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 22:01:17 +1100 (AEDT)
Received: by mail-io1-xd33.google.com with SMTP id k24so25498046ioc.4
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 03:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yhl3OedyzgIAbElRNIsfiAUKTv87+3pFpPivlfD60YY=;
 b=lLd40V7izbJ0DHDcKwU+PWm24LJgiNNX/rLiJmGkwwJQk0nfCzn4qd5lC6skf9RMae
 /dEDnMsHD4hLZM8c2UwmlHDGo3N0rHd/PdP4qH1t24Lxnlvdf9tuVicjsCcL0QKGgSaX
 T/W8bdOPZz+7RsLD4NqeTPkZr3cCCKQiBUYVSEJHbUSYxmBcwNW8xexspjLhto2U3ocu
 tYp9CxEeTXuvE7nJq13LCCG1euJjW+rt8jCZ4j/ltwbF08IydWVUlmFxYjzzvClvCFPE
 RSHl7OqcjIM/oYnfNnPScFlLushyhiWFv/T8QQ2n0u/WIf4j6oJBJP/sZp9SjNLdExqt
 vLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yhl3OedyzgIAbElRNIsfiAUKTv87+3pFpPivlfD60YY=;
 b=Kqz8eCGyiIvN5mNI1D8GF1t5cj8a9R7o5hm4B+EDH6LV7VguxnOq5zYMwtZMpWXto0
 fzPXn4hAfdyvb+w7mag1jMFGYkmT5GZx4eRioCyrL8tSh7moaoD/3LrUp0Xu+Shdxh8E
 2e+jZ5FHMhB3KWSxI+DVjwSQcagjI3ejm3C31D8YkE2XJjotpO81JG3JNccp0yU7AHb8
 Eg1duIGDpYsuk2vq5UUIBuLQ2kkkGNo/eCq7nTnnB7k23Qh1lh+LfZ74FJNMJtVGJqkb
 X4WSAPfjuhyF+IfoRYdablswEOyqxL5JCK+zRSSzHlLpQ7OitoZPW0FaMqzXcT8FYVzg
 OWXA==
X-Gm-Message-State: APjAAAVQBqQ5bsvOUBbL8lW3wB/RW3HkjRDeG9nh0dgo/hz/V+54iw/K
 nUKTwAyQf5SKFu37TZ3KJO5aKIJMN88uxDyhETI=
X-Google-Smtp-Source: APXvYqzF8LuPjdVXfjx9ZNdNyeQJ3GtZovSozaud17zP/EpnHF881s4evsbtMQacHBLGDIH5zHl5s9gq8/ibilh55ko=
X-Received: by 2002:a02:8482:: with SMTP id f2mr9733992jai.73.1579258874257;
 Fri, 17 Jan 2020 03:01:14 -0800 (PST)
MIME-Version: 1.0
References: <10cf015965644daf9cfae7421e9f4710@quantatw.com>
 <CAAMkS132O2MB4myFcwPo0NQNf=hzvLYXgqoLXOxCcJe6mqHEMQ@mail.gmail.com>
 <0ebd5d88a9ea46328db578849d4b061b@quantatw.com>
In-Reply-To: <0ebd5d88a9ea46328db578849d4b061b@quantatw.com>
From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
Date: Fri, 17 Jan 2020 16:31:45 +0530
Message-ID: <CAAMkS12VRBFU77D50z0z4MHDeSG6pdOwU2MeBPO0K7TG6arTvA@mail.gmail.com>
Subject: Re: Verify Privilege For Different Channels in openbmc-test-automation
To: =?UTF-8?B?VG9ueSBMZWUgKOadjuaWh+WvjCk=?= <Tony.Lee@quantatw.com>
Content-Type: multipart/alternative; boundary="000000000000356ea9059c53dc84"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000356ea9059c53dc84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That seem to be an issue. Can you also check output for below lan print
command? If that also is working, check with Richard regarding this problem=
.

ipmitool -I lanplus -C 3 -p 623 -U DD -P 0penBmc1 -H x.x.x.x lan print 1

On Fri, Jan 17, 2020 at 11:09 AM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <To=
ny.Lee@quantatw.com>
wrote:

> Got it. Another question, at the last two "Verify" steps.
> Can the user run out-of-band IPMI commands with the specified channel?
> (e.g ipmitool -I lanplus -C 3 -p 623 -U YmRBwDUS -P 0penBmc1 -H x.x.x.x -=
L
> Administrator sel info 1)
>
> Is there a description or SPEC about it? It doesn't work on my system.
> For example:
> I created a user name DD and gave it different privilege for different
> channels.
>
> ipmitool user list 1
> ID  Name             Callin  Link Auth  IPMI Msg   Channel Priv Limit
> 1   root             false   true       true       ADMINISTRATOR
> ...
> ...
> 6   DD               true    false      false      NO ACCESS
>
> ipmitool user list 2
> ID  Name             Callin  Link Auth  IPMI Msg   Channel Priv Limit
> 1   root             false   true       true       ADMINISTRATOR
> ...
> ...
> 6   DD               true    false      true       ADMINISTRATOR
>
> As expected, it should not work if user run out-of-band IPMI commands wit=
h
> the channel 1.
> Howerver it still work.
> $ipmitool -I lanplus -C 3 -p 623 -U DD -P 0penBmc1 -H x.x.x.x sel info 1
>
> SEL Information
> Version          : 1.5 (v1.5, v2 compliant)
> Entries          : 6
> Free Space       : 0 bytes
> Percent Used     : 100%
> Last Add Time    : 01/06/1970 00:13:18
> Last Del Time    : Not Available
> Overflow         : false
> Supported Cmds   : 'Reserve'
>
> Thanks
> Best Regards,
> Tony
>
> From: Rahul Maheshwari <rahulmaheshwari01@gmail.com>
> Sent: Thursday, January 16, 2020 7:15 PM
> To: Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <Tony.Lee@quantatw.com>
> Subject: Re: Verify Privilege For Different Channels in
> openbmc-test-automation
>
> Hi Tony
> These test cases are expected to fail if your system's BMC has only one
> LAN channel support. In case of your BMC has 2 LAN channel support, then
> these tests should pass.
>
> Thanks
> Rahul
>
> On Tue, Jan 14, 2020 at 2:52 PM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) <m=
ailto:
> Tony.Lee@quantatw.com> wrote:
> Hi Rahul,
>
> I meet with difficulties for the cases "Verify Administrator And No Acces=
s
> Privilege For Different Channels" and
> "Verify Operator And User Privilege For Different Channels" in
> test_ipmi_user.robot.
>
> Refer to https://github.com/openbmc/openbmc-test-automation/issues/1523
> According to Richard's comment: "Channel command privilege are working as
> per the channel (but at this point of time this differentiation can't be
> made due to architecture limitations, but ok to write test case and mark =
it
> as failed, rather than skipping the same)"
>
> Are these two cases be expected to fail?
>
> Thanks
> Best Regards,
> Tony
>

--000000000000356ea9059c53dc84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">That seem to be an issue. Can you also check output for be=
low lan print command? If that also is working, check with Richard regardin=
g this problem.<div><br></div><div>ipmitool -I lanplus -C 3 -p 623 -U DD -P=
 0penBmc1 -H x.x.x.x lan print 1<br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 17, 2020 at 11:09 AM =
Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) &lt;<a href=3D"mailto:Tony.Lee@quant=
atw.com">Tony.Lee@quantatw.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Got it. Another question, at the last two &qu=
ot;Verify&quot; steps. <br>
Can the user run out-of-band IPMI commands with the specified channel?<br>
(e.g ipmitool -I lanplus -C 3 -p 623 -U YmRBwDUS -P 0penBmc1 -H x.x.x.x -L =
Administrator sel info 1)<br>
<br>
Is there a description or SPEC about it? It doesn&#39;t work on my system.<=
br>
For example:<br>
I created a user name DD and gave it different privilege for different chan=
nels.<br>
<br>
ipmitool user list 1<br>
ID=C2=A0 Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Callin=C2=A0 L=
ink Auth=C2=A0 IPMI Msg=C2=A0 =C2=A0Channel Priv Limit<br>
1=C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0false=C2=
=A0 =C2=A0true=C2=A0 =C2=A0 =C2=A0 =C2=A0true=C2=A0 =C2=A0 =C2=A0 =C2=A0ADM=
INISTRATOR<br>
...<br>
...<br>
6=C2=A0 =C2=A0DD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0true=
=C2=A0 =C2=A0 false=C2=A0 =C2=A0 =C2=A0 false=C2=A0 =C2=A0 =C2=A0 NO ACCESS=
<br>
<br>
ipmitool user list 2<br>
ID=C2=A0 Name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Callin=C2=A0 L=
ink Auth=C2=A0 IPMI Msg=C2=A0 =C2=A0Channel Priv Limit<br>
1=C2=A0 =C2=A0root=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0false=C2=
=A0 =C2=A0true=C2=A0 =C2=A0 =C2=A0 =C2=A0true=C2=A0 =C2=A0 =C2=A0 =C2=A0ADM=
INISTRATOR<br>
...<br>
...<br>
6=C2=A0 =C2=A0DD=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0true=
=C2=A0 =C2=A0 false=C2=A0 =C2=A0 =C2=A0 true=C2=A0 =C2=A0 =C2=A0 =C2=A0ADMI=
NISTRATOR<br>
<br>
As expected, it should not work if user run out-of-band IPMI commands with =
the channel 1.<br>
Howerver it still work.<br>
$ipmitool -I lanplus -C 3 -p 623 -U DD -P 0penBmc1 -H x.x.x.x sel info 1<br=
>
<br>
SEL Information<br>
Version=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 1.5 (v1.5, v2 compliant)<br>
Entries=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : 6<br>
Free Space=C2=A0 =C2=A0 =C2=A0 =C2=A0: 0 bytes <br>
Percent Used=C2=A0 =C2=A0 =C2=A0: 100%<br>
Last Add Time=C2=A0 =C2=A0 : 01/06/1970 00:13:18<br>
Last Del Time=C2=A0 =C2=A0 : Not Available<br>
Overflow=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: false<br>
Supported Cmds=C2=A0 =C2=A0: &#39;Reserve&#39;<br>
<br>
Thanks<br>
Best Regards,<br>
Tony<br>
<br>
From: Rahul Maheshwari &lt;<a href=3D"mailto:rahulmaheshwari01@gmail.com" t=
arget=3D"_blank">rahulmaheshwari01@gmail.com</a>&gt; <br>
Sent: Thursday, January 16, 2020 7:15 PM<br>
To: Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) &lt;<a href=3D"mailto:Tony.Lee@q=
uantatw.com" target=3D"_blank">Tony.Lee@quantatw.com</a>&gt;<br>
Subject: Re: Verify Privilege For Different Channels in openbmc-test-automa=
tion<br>
<br>
Hi Tony<br>
These=C2=A0test cases are expected to fail if your system&#39;s BMC has onl=
y one LAN channel support. In case of your BMC has 2 LAN channel support, t=
hen these tests should pass.<br>
<br>
Thanks<br>
Rahul<br>
<br>
On Tue, Jan 14, 2020 at 2:52 PM Tony Lee (=E6=9D=8E=E6=96=87=E5=AF=8C) &lt;=
mailto:<a href=3D"mailto:Tony.Lee@quantatw.com" target=3D"_blank">Tony.Lee@=
quantatw.com</a>&gt; wrote:<br>
Hi Rahul,<br>
<br>
I meet with difficulties for the cases &quot;Verify Administrator And No Ac=
cess Privilege For Different Channels&quot; and<br>
&quot;Verify Operator And User Privilege For Different Channels&quot; in te=
st_ipmi_user.robot.<br>
<br>
Refer to <a href=3D"https://github.com/openbmc/openbmc-test-automation/issu=
es/1523" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/op=
enbmc-test-automation/issues/1523</a><br>
According to Richard&#39;s comment: &quot;Channel command privilege are wor=
king as per the channel (but at this point of time this differentiation can=
&#39;t be made due to architecture limitations, but ok to write test case a=
nd mark it as failed, rather than skipping the same)&quot;<br>
<br>
Are these two cases be expected to fail?<br>
<br>
Thanks<br>
Best Regards,<br>
Tony<br>
</blockquote></div>

--000000000000356ea9059c53dc84--
