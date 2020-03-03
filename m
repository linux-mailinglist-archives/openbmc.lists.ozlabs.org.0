Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C0A176D73
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 04:05:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Whhh2G38zDqWs
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 14:05:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=krellan@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=bV7u63jK; dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WhgW0fQqzDqTk
 for <openbmc@lists.ozlabs.org>; Tue,  3 Mar 2020 14:04:21 +1100 (AEDT)
Received: by mail-lj1-x22c.google.com with SMTP id 195so1841632ljf.3
 for <openbmc@lists.ozlabs.org>; Mon, 02 Mar 2020 19:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C9Q2r5J/f7WUDv3mb229zjOfT3DANV8dlNmsndnYyKc=;
 b=bV7u63jKJFOTEpj1llMmy2AngMsETd6cneT7KGqdyC158RTpJWuoUkFPfRgNJ6XOv9
 Xvj0MhN34A0TlLuBMHICFyFH6NOhncEgg/uBDLFD0OYw1o2dmQWKv/3/f5HsKhTDIID8
 NYayxQ5w40HiZG7lfhpIs4rtxhXR+2FDhJRDaNlKNtGqbuOdZWn0JoiiA74NMU2c+q9l
 eQlIHTEKNPMeK4FGKBgl2klyfXDotwNy8Q8FylokJPWmP9YR47NbDMR5gdqIICP0sL/N
 7pya0iMJeHcGoP3dXfY13L4SvyyqaUfRRaH6Ucis3rnv7iDAxFja1Q6feXsTmp0fwPc+
 Yivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C9Q2r5J/f7WUDv3mb229zjOfT3DANV8dlNmsndnYyKc=;
 b=QCAvOqKpPfXrRVyG1ruzFiQvpEkgF8/w4nuECBXpj5yEACQhZeQE0o0VmRcwVlGRR8
 llO15SE2M1NlYTaFrPMyo+BmADs0Sl7lLZQhd6BYZtmL2Llxz5LjL7NiO5m1ze87uOAK
 /nkwmdEllaawK6IXrgAozbrOV62s0tnlU4+t16C1SrDuexCgHmJy7+K3zQh39/sEI4Jy
 KPBlhVN9Ml3orl6bmn6dYBo6JgUXCPOHWwTXbQUMmqeM4WlMMJuyybbI71iGC5W7W7PJ
 XXGFDUfWDN2/iIEl3ZYy4NxRwRgd10em+bEpHi3RcWH7vGt7v/9uEUvYYGONhpvkIMha
 hYZA==
X-Gm-Message-State: ANhLgQ0xdamCwgfc6Z+injUa5Cs4rjRtsUOudOpFSx35R1dODIKfrRul
 OxD6ggGaNddBHl7CF9mtol8iBPDXkrbu4exYDTVeLA==
X-Google-Smtp-Source: ADFU+vvL8oTGa8a27RUByEQGYi1P9TGZ1H76fRfeCouYB9iC+/jv2ACmKeoOWavhPZH7V7OI1o01MyyrxJY6Uvzh738=
X-Received: by 2002:a2e:9a0e:: with SMTP id o14mr1081053lji.63.1583204655246; 
 Mon, 02 Mar 2020 19:04:15 -0800 (PST)
MIME-Version: 1.0
References: <CANPkJS8pfmJF9fTk3GQE45g8xQfu_NaLyuhWK=_+=o3B6Hsh_A@mail.gmail.com>
 <9328787b-568d-a777-30c7-feb3b0ec631b@linux.intel.com>
In-Reply-To: <9328787b-568d-a777-30c7-feb3b0ec631b@linux.intel.com>
From: Josh Lehan <krellan@google.com>
Date: Mon, 2 Mar 2020 19:03:49 -0800
Message-ID: <CANPkJS8tvbT4X=Bhj63SgWV=p2RY69MF-e20LwuwB8FpnfrEJQ@mail.gmail.com>
Subject: Re: dbus-sensors updateValue update hysteresis logic question
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000015732e059fea8f3c"
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

--00000000000015732e059fea8f3c
Content-Type: text/plain; charset="UTF-8"

Thanks for your feedback. Here's the change I wrote. I see you responded
there already, thanks again, I'll still paste the URL for future reference:

https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/29890

Josh

Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8941



On Wed, Feb 26, 2020 at 9:09 AM James Feist <james.feist@linux.intel.com>
wrote:

> On 2/25/20 5:26 PM, Josh Lehan wrote:
> > Hi there! Question about updateValue(), in sensor.hpp file, in
> > dbus-sensors package.
> >
> > In updateValue(), it always calls set_property() to update the stored
> > value to the new passed-in value, sending the new value on D-Bus.
> > However, it then tests the hysteresis variable, to avoid a very small
> > change. It only updates the stored value if the change is significant
> > enough. This logic in updateValue() seems strange to me. Wouldn't you
> > want to either do both of these operations at once, or none of them at
> all?
>
> This is to not trip thresholds if the change is small, so you don't jump
> back and forth over thresholds. We still update the value on d-bus for
> anyone reading the value to have the most recent value.
>
> >
> > If D-Bus is updated but the stored value is not also updated, it would
> > cause them to get out of sync, over time. Think of a slowly changing
> > value, just under the hysteresis threshold, but with each new reading,
> > over time, it adds up to a substantial change. This would cause the
> > D-Bus value to be updated but the stored value to not be updated. Then,
> > if the sensor were to return to the value of the stored value, it would
> > falsely be seen as not an update.
>
> I believe it always compares to the stored value, so this wouldn't be
> possible, as eventually the reading will drift far enough away from the
> stored value that isn't being updated. If it isn't, it should be.
>
>
> >
> > Also, in the PSUSensor::handleResponse() function, it does a test for
> > equality before calling updateValue(). Shouldn't this test be done by
> > updateValue() itself? Interestingly, PSUSensor doesn't check for
> > hysteresis at all, so these are two different tests. I'm considering
> > refactoring it, to have updateValue() make the decision, so the decision
> > is all made in one place.
>
> Yes, this seems like a discrepancy. Not sure why PSU sensor didn't
> follow the existing logic.
>
>
> >
> > What's more, PSUSensor uses floating-point equality when testing for
> > equality. This is considered harmful, and in practice means that most
> > readings aren't considered equal, even when they effectively are, so
> > there's a lot of excess update traffic on the D-Bus, defeating most of
> > the hysteresis logic above.
> >
> > And, finally, the hysteresis variable is defined as ((max-min)*0.01)
> > which means that a value must be changed by 1/100 of full scale, in
> > order to be considered a change. This seems to be throwing away some
> > useful sensor resolution here. IPMI is "accurate" down to 1/255 of full
> > scale, so it would make sense to at least be as precise as that allows.
> > It might be more useful to lower the hysteresis threshold to 1/1000 of
> > full scale, which would give plenty of headroom.
>
> The value on d-bus is still updating at least for the sensors I'm aware
> of. This should only be used for the threshold comparison.
>
> >
> > Any thoughts on these points? Thanks for reading this.
> > Josh
> >
> > Josh Lehan | Software Engineer |krellan@google.com
> > <mailto:krellan@google.com> | +1 650-733-8941 <(650)%20733-8941>
> >
>

--00000000000015732e059fea8f3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for your feedback. Here&#39;s the change I wrote. I=
 see you responded there already, thanks again, I&#39;ll still paste the UR=
L for future reference:<div><div><br></div><div><a href=3D"https://gerrit.o=
penbmc-project.xyz/c/openbmc/dbus-sensors/+/29890">https://gerrit.openbmc-p=
roject.xyz/c/openbmc/dbus-sensors/+/29890</a></div><div><br></div><div>Josh=
<br></div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signa=
ture" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"=
ltr"><div style=3D"line-height:1.5em;padding-top:10px;margin-top:10px;color=
:rgb(85,85,85);font-family:sans-serif"><span style=3D"border-width:2px 0px =
0px;border-style:solid;border-color:rgb(213,15,37);padding-top:2px;margin-t=
op:2px">Josh Lehan=C2=A0|</span><span style=3D"border-width:2px 0px 0px;bor=
der-style:solid;border-color:rgb(51,105,232);padding-top:2px;margin-top:2px=
">=C2=A0Software Engineer=C2=A0|</span><span style=3D"border-width:2px 0px =
0px;border-style:solid;border-color:rgb(0,153,57);padding-top:2px;margin-to=
p:2px">=C2=A0<a href=3D"mailto:krellan@google.com" target=3D"_blank">krella=
n@google.com</a>=C2=A0|</span><span style=3D"border-width:2px 0px 0px;borde=
r-style:solid;border-color:rgb(238,178,17);padding-top:2px;margin-top:2px">=
=C2=A0+1 650-733-8941</span></div><br></div></div></div></div></div><br></d=
iv></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Wed, Feb 26, 2020 at 9:09 AM James Feist &lt;<a href=3D"mailto:=
james.feist@linux.intel.com">james.feist@linux.intel.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On 2/25/20 5:26 PM,=
 Josh Lehan wrote:<br>
&gt; Hi there! Question about updateValue(), in sensor.hpp file, in <br>
&gt; dbus-sensors package.<br>
&gt; <br>
&gt; In updateValue(), it always calls set_property() to update the stored =
<br>
&gt; value to the new passed-in value, sending the new value on D-Bus. <br>
&gt; However, it then tests the hysteresis variable, to avoid a very small =
<br>
&gt; change. It only updates the stored value if the change is significant =
<br>
&gt; enough. This logic in updateValue() seems strange to me. Wouldn&#39;t =
you <br>
&gt; want to either do both of these operations at once, or none of them at=
 all?<br>
<br>
This is to not trip thresholds if the change is small, so you don&#39;t jum=
p <br>
back and forth over thresholds. We still update the value on d-bus for <br>
anyone reading the value to have the most recent value.<br>
<br>
&gt; <br>
&gt; If D-Bus is updated but the stored value is not also updated, it would=
 <br>
&gt; cause them to get out of sync, over time. Think of a slowly changing <=
br>
&gt; value, just under the hysteresis threshold, but with each new reading,=
 <br>
&gt; over time, it adds up to a substantial change. This would cause the <b=
r>
&gt; D-Bus value to be updated but the stored value to not be updated. Then=
, <br>
&gt; if the sensor were to return to the value of the stored value, it woul=
d <br>
&gt; falsely be seen as not an update.<br>
<br>
I believe it always compares to the stored value, so this wouldn&#39;t be <=
br>
possible, as eventually the reading will drift far enough away from the <br=
>
stored value that isn&#39;t being updated. If it isn&#39;t, it should be.<b=
r>
<br>
<br>
&gt; <br>
&gt; Also, in the PSUSensor::handleResponse() function, it does a test for =
<br>
&gt; equality before calling updateValue(). Shouldn&#39;t this test be done=
 by <br>
&gt; updateValue() itself? Interestingly, PSUSensor doesn&#39;t check for <=
br>
&gt; hysteresis at all, so these are two different tests. I&#39;m consideri=
ng <br>
&gt; refactoring it, to have updateValue() make the decision, so the decisi=
on <br>
&gt; is all made in one place.<br>
<br>
Yes, this seems like a discrepancy. Not sure why PSU sensor didn&#39;t <br>
follow the existing logic.<br>
<br>
<br>
&gt; <br>
&gt; What&#39;s more, PSUSensor uses floating-point equality when testing f=
or <br>
&gt; equality. This is considered harmful, and in practice means that most =
<br>
&gt; readings aren&#39;t considered equal, even when they effectively are, =
so <br>
&gt; there&#39;s a lot of excess update traffic on the D-Bus, defeating mos=
t of <br>
&gt; the hysteresis logic above.<br>
&gt; <br>
&gt; And, finally, the hysteresis variable is defined as ((max-min)*0.01) <=
br>
&gt; which means that a value must be changed by 1/100 of full scale, in <b=
r>
&gt; order to be considered a change. This seems to be throwing away some <=
br>
&gt; useful sensor resolution here. IPMI is &quot;accurate&quot; down to 1/=
255 of full <br>
&gt; scale, so it would make sense to at least be as precise as that allows=
. <br>
&gt; It might be more useful to lower the hysteresis threshold to 1/1000 of=
 <br>
&gt; full scale, which would give plenty of headroom.<br>
<br>
The value on d-bus is still updating at least for the sensors I&#39;m aware=
 <br>
of. This should only be used for the threshold comparison.<br>
<br>
&gt; <br>
&gt; Any thoughts on these points? Thanks for reading this.<br>
&gt; Josh<br>
&gt; <br>
&gt; Josh Lehan=C2=A0|=C2=A0Software Engineer=C2=A0|<a href=3D"mailto:krell=
an@google.com" target=3D"_blank">krellan@google.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:krellan@google.com" target=3D"_blank">kre=
llan@google.com</a>&gt;=C2=A0|=C2=A0<a href=3D"tel:(650)%20733-8941" value=
=3D"+16507338941" target=3D"_blank">+1 650-733-8941</a><br>
&gt; <br>
</blockquote></div>

--00000000000015732e059fea8f3c--
