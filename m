Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAC617062E
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 18:35:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SNHS74PgzDqjW
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 04:35:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=drewmacrae@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ZZbl8Tdy; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SNGk3C6TzDqg6
 for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2020 04:34:45 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id h23so4050532ljc.8
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 09:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FSDU7m0Q6biQYO2tukj1Kv2OVZdsGoufjJNGGh9nXhE=;
 b=ZZbl8Tdy2PB15X+isxdJlU4IcS4KOOxxJS7B1/JbfMpgUZjkudlH+jOk1XCjEfg7Ta
 haiyuIblXfF1Upfl6r6RAPRJr1m2esv2befKqs+ySjmpEZIxVciAvJgQXpNPAZwlD4h6
 Cyhr2p01UqR1RhnkqxoZaYo2VwjHGk7RbD0fFpf48iAqZZHmMzl/mnry1MiS6GXOG5HA
 mzZH63P7snCHkOqIPpPImrvEfd4+xEaSIVd8BrE/eI/nXpse8ze6Mw79p75sRu4rhH6e
 BUEhQgVJ7PbeHVY+0y4QM+Hmxg5zNr5PP5sHLb4m9/RzR0yEapazEDSPQzjbOGqunX5o
 0h3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FSDU7m0Q6biQYO2tukj1Kv2OVZdsGoufjJNGGh9nXhE=;
 b=gHDmETU2J57hUlHTJ0z+IcidPnT0S63qq0++c9HWIpfM+tPt5/YsCWwzqgiuIe8d9c
 BxHegd5xbt5OjHCmKUFD7Oz/jJjEW4zON1VD2iitA0EeDwfHZ7GubVSD8lIFqK77sLm4
 Qw1rCxCOBu0J/yn2zAAydHOrgOb0fo7licSfhKrG/xPKhR8zGkWv4tece100ckyKI9Jd
 z2UZKraQ2QZDsiKSru0APW0jwsnQcviOPnchcL7lWVlliPpVj1fWXeGmnHpbQeI8bsSm
 6mIgZIfwnqcYm2yKHUDQx9b54Dq7PCeLTG9XaIAKXf78Jd3d696KWQWkNRWY+J10M3Ac
 tEyw==
X-Gm-Message-State: ANhLgQ3ljWkCx4qZ2CZUYct3aaVDSydLHQQdgOQDDzSxp7kdUFb5PNeX
 nzFbD2zKHsV9h+XyU9IE2eLcxG1mqn+yLqvGzCLbYw==
X-Google-Smtp-Source: ADFU+vujpHnj8H2rTvj/De8v1I8/WoNZGguNf7ImPMOzorFYT/K6BWjGgilQLvCBQT4mXyLemE3Bd3AUTQYOw43TgbQ=
X-Received: by 2002:a2e:3608:: with SMTP id d8mr48610lja.152.1582738478244;
 Wed, 26 Feb 2020 09:34:38 -0800 (PST)
MIME-Version: 1.0
References: <CANPkJS8pfmJF9fTk3GQE45g8xQfu_NaLyuhWK=_+=o3B6Hsh_A@mail.gmail.com>
 <9328787b-568d-a777-30c7-feb3b0ec631b@linux.intel.com>
In-Reply-To: <9328787b-568d-a777-30c7-feb3b0ec631b@linux.intel.com>
From: Andrew Macrae <drewmacrae@google.com>
Date: Wed, 26 Feb 2020 09:34:27 -0800
Message-ID: <CAAD+EBrbhpihUKzXZUqDgADV9voOXnB5rJku1Q25ReYJPiV75w@mail.gmail.com>
Subject: Re: dbus-sensors updateValue update hysteresis logic question
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000c62ce6059f7e04f7"
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
Cc: Josh Lehan <krellan@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c62ce6059f7e04f7
Content-Type: text/plain; charset="UTF-8"

>
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

If this is just for threshold comparison, would it make more sense to use a
more typical method of applying hysteresis?
To simplify the code could we implement something with no hidden state, and
only one bit of state like a schmitt trigger?

For clarification, could we say the threshold is violated when the value
rises above it, but the violation is only
resolved/cleared/no-longer-violated when the readings have fallen by an
additional hysteresis value below the threshold?

static bool overThreshold;
overThreshold = (reading>__threshold-overThreshold*__thresholdHysteresis)

by making the state observable we make it much easier to understand, test
and cover all the behavior.

On Wed, Feb 26, 2020 at 9:10 AM James Feist <james.feist@linux.intel.com>
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

--000000000000c62ce6059f7e04f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cl=
ass=3D"gmail-im" style=3D"color:rgb(80,0,80)">On 2/25/20 5:26 PM, Josh Leha=
n wrote:<br>&gt; Hi there! Question about updateValue(), in sensor.hpp file=
, in<br>&gt; dbus-sensors package.<br>&gt;<br>&gt; In updateValue(), it alw=
ays calls set_property() to update the stored<br>&gt; value to the new pass=
ed-in value, sending the new value on D-Bus.<br>&gt; However, it then tests=
 the hysteresis variable, to avoid a very small<br>&gt; change. It only upd=
ates the stored value if the change is significant<br>&gt; enough. This log=
ic in updateValue() seems strange to me. Wouldn&#39;t you<br>&gt; want to e=
ither do both of these operations at once, or none of them at all?<br><br><=
/span>This is to not trip thresholds if the change is small, so you don&#39=
;t jump<br>back and forth over thresholds. We still update the value on d-b=
us for<br>anyone reading the value to have the most recent value.<br></bloc=
kquote><div><br></div><div>If this is just for threshold comparison, would =
it make more sense to use a more typical method of applying hysteresis?</di=
v><div>To simplify the code could we implement something with no hidden sta=
te, and only one bit of state like a schmitt trigger?</div><div><br></div><=
div>For clarification, could we say the threshold is violated when the valu=
e rises above it, but the violation is only resolved/cleared/no-longer-viol=
ated when the readings have fallen by an additional=C2=A0hysteresis value b=
elow the threshold?</div><div><br></div><div>static bool overThreshold;</di=
v><div>overThreshold =3D (reading&gt;__threshold-overThreshold*__thresholdH=
ysteresis)</div><div><br></div><div>by making the state observable we make =
it much easier to understand, test and cover all the behavior.</div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed,=
 Feb 26, 2020 at 9:10 AM James Feist &lt;<a href=3D"mailto:james.feist@linu=
x.intel.com">james.feist@linux.intel.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">On 2/25/20 5:26 PM, Josh Lehan wrot=
e:<br>
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

--000000000000c62ce6059f7e04f7--
