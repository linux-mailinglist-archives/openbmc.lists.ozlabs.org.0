Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D822EB136
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 18:19:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9K415CPvzDqcW
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 04:19:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=vijaykhemkalinux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=A4HPYOHP; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9K333vwBzDqXN
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 04:18:34 +1100 (AEDT)
Received: by mail-lf1-x133.google.com with SMTP id o13so209842lfr.3
 for <openbmc@lists.ozlabs.org>; Tue, 05 Jan 2021 09:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I4Q/hXnmibxsiJblH5FMomq8SjVpF3e2hCA0d67AYcY=;
 b=A4HPYOHPSz6OWEzzkkjFC/ZuL45nXKzGQJbry+0BLkIQz36wpvK9KLI68yJ3pvL26l
 PqiO+JVUoR/z3fsG0ktfea6el4FNRBVjy3vSi03AtFFEI3KBeu7vgiShQmFvwIzw7Y4g
 GRrreW87RfS/Axe9MZT87B4KJaamxNvdSPoGT3CJsCKE41SlodC1mt+RaUyI5ItcpODe
 P/zRm/V3INUcKvjie8Ybpyy8yFjMS1iKG+N11rumN7l4iPZuBFyJtbG2OsR9zle+zw2c
 grEuPI514dv9eAUr+zznx5rcfyiLM/TXwB4PPxnguM9a3UZiWp0wg0pJaALcaVjTObcv
 R7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I4Q/hXnmibxsiJblH5FMomq8SjVpF3e2hCA0d67AYcY=;
 b=ao+AFdD33AAjmQvnp+hCuqLjJA3HpGCLw8739+WQVdZBOU8TvkwTf0IMbBwOV73AiU
 G/aB2Wma5pMiMAxJ4uvH+vX2ZxGXCL0uaHtn8YB+3k3bwzYDlr+2eIn1cR/u9SaCqnJ+
 Cq4qL6JIYnPJH00h9xRQw3epaOjReozO+OjRYYNvtIyKh62XHbd9RukUSmvmL3anQfvJ
 0aS5N7+cxxDnq/Amwf8ohN1ScVCE5RopLa2RgkjfjWlvtVai7xqx4O9rgiSr0rcPIr5r
 WDG+501hfKIZ6p8NjdKpiFrU5DXYhc4BNM+bAqLawoYWhQ+x7B4NVnIitxpFnQ/EX03I
 WQBg==
X-Gm-Message-State: AOAM5325TJbsZ+Kp1GVXsYJLGECRSUJfp3D4DlrdXor6vpNB8KVrhJw5
 deQ3nGk3bclwtFHg1vMrAQNZkYcuCom67eu0FAY=
X-Google-Smtp-Source: ABdhPJzjhfvGKNRb9oCVlW60hrN1lRXeKdx6X0RFuEbktn8ijDIpwcSfi95BAx3MwkYwl784iUWYDoGwtZRSIX2iXhQ=
X-Received: by 2002:a2e:92d6:: with SMTP id k22mr266511ljh.219.1609867107838; 
 Tue, 05 Jan 2021 09:18:27 -0800 (PST)
MIME-Version: 1.0
References: <7be00c72-db17-c751-470e-eb92f18f8bb3@linux.ibm.com>
 <CAJTGxZG36whmooeOvMcwkhj5aQtvr=s8QFCGXYNSX6Up6WMJhg@mail.gmail.com>
 <c4ced4dd-0b20-9c22-6dfe-99b22e51d0ab@linux.ibm.com>
 <X/R3XZNHmYpz74mu@heinlein>
 <ce14a5fa-eaeb-8c16-3ab2-7ef231b6c326@linux.ibm.com>
In-Reply-To: <ce14a5fa-eaeb-8c16-3ab2-7ef231b6c326@linux.ibm.com>
From: Vijay Khemka <vijaykhemkalinux@gmail.com>
Date: Tue, 5 Jan 2021 09:18:16 -0800
Message-ID: <CAJTGxZGj9YVLHVrJeW3vcDD1EkA+e44VxxrH9BkvH2mF03WEYg@mail.gmail.com>
Subject: Re: hardcoded median function in phosphor-virtual-sensor
To: Matt Spinler <mspinler@linux.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000192f8e05b82a652f"
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

--000000000000192f8e05b82a652f
Content-Type: text/plain; charset="UTF-8"

I have a basic question, what are we trying to achieve here.
1. Are we avoiding of using PVS here completely or
2. we don't want to define separate json config for PVS

because in my understanding PVS will work straight forward
if we define expression in PVS config file.

Regards
-Vijay

On Tue, Jan 5, 2021 at 7:58 AM Matt Spinler <mspinler@linux.ibm.com> wrote:

>
>
> On 1/5/2021 8:27 AM, Patrick Williams wrote:
> > On Mon, Jan 04, 2021 at 04:57:51PM -0600, Matt Spinler wrote:
> >> On 1/4/2021 2:54 PM, Vijay Khemka wrote:
> >>> On Mon, Jan 4, 2021 at 9:49 AM Matt Spinler <mspinler@linux.ibm.com
> >>> <mailto:mspinler@linux.ibm.com>> wrote:
> >>>
> >>>      I need a median of some sensor values, where this median sensor
> has
> >>>      threshold interfaces
> >>>      whose values must be defined in entity-manager.  Since exprtk
> >>>      expressions are not allowed in
> >>>      entity-manager, I cannot just port the PVS's JSON config into an
> >>>      entity-manager config.
> >>>
> >>> I missed this discussion but why can't we simply use virtual sensor as
> >>> expertk provides median function and we have threshold support for
> >>> each virtual sensor. Please help, if I am missing anything.
> >> If you're asking why can't we just have PVS get its exprtk expression to
> >> use from entity-manager, and encode the median there, it's because Ed
> >> doesn't want exprtk in entity-manager config files (I'll defer to him on
> >> the reasons).
> > As part of offline discussions on this I said that having a one-off EM
> > config for median to allow you to make progress is reasonable, but I
> > don't think having a bunch of one-offs is a viable long-term solution
> > for phosphor-virtual-sensors.  Basically we're kicking the can down the
> > road until we have a better understanding of what kinds of EM/PVS
> > configs we're going to need.
> >
> >> If you're asking now that the median function is hardcoded, why write
> it in
> >> C++ instead of exprtk, it's because the exprtk code would be so similar
> to
> >> C++ code (skip the bad values, put the sensors in a vector,  call
> >> nth_element)
> >> that writing it in exprtk doesn't really buy us anything, and using C++
> lets
> >> me skip making the symbol table.
> > I would certainly prefer we use the exprtk code here.  You should be
> > able to generate (at runtime) a exprtk expression from the EM config you
> > specified below.
> >
> > My rationale is:
> >      * Ed suggested that a long-term answer might be a few lookup tables
> >        / transformations from the EM configs to the PVS expressions.  I'm
> >        not fully bought into this yet but it seems like a reasonable
> >        direction to explore.
> >
> >      * You wrote "because the exprtk code would be so similar to the C++
> >        code", which is why you *should* do it in exprtk.  The rest of the
> >        PVS code is already this way so why something different and
> >        require dual maintanence?  If the exprtk-based support code is
> >        missing some of these features, lets add them because others will
> >        likely need them as well.
>
> See below.
>
> >>>      Instead, I will make a new entity-manager config that will have
> the
> >>>      component sensors
> >>>      along  with the thresholds to use, with a subtype of median,
> vaguely
> >>>      something like:
> >>>
> >>>      {
> >>>      Type: "VirtualSensor"
> >>>      Name: "MySensorName"
> >>>      Subtype: "Median"
> >>>      Sensors: [ "Sensor1", "Sensor2", .... ]
> >>>      ThresholdsWithHysteresis [ ]
> >>>      minInput: 0
> >>>      maxInput: 100
> >>>      }
> >>>
> > I would expect the 'exprtk' expression from your EM config to be
> > something like "median(Sensor1, Sensor2...)".  You should be able to
> > feed this into the existing virtual-sensor constructors and not have to
> > make the symbol table yourself.
>
> Every variable used by exprtk needs to be added to the symbol table
> first by the C++.
>
> Also, we need a slightly tweaked median of our 3 ambient temp sensors:
> 1) throw out values outside of minInput/maxInput
> 2) if there is an even number, because we threw out one, choose the
> higher value, and
>      don't do the average of the 2  that I believe an actual median
> would use.
> 3) if we threw out all 3 (very unlikely), use NaN as the sensor value.
>
> This is easy to do in C++ using std::nth_element, and basically looks
> the same in
> exprtk which is why I suggested just using C++ though I don't really
> care that much either way,
> but I don't see how we could upstream this as a true median().  In fact,
> since
> the underlying code would just use  nth_element anyway, I'm not even
> sure it would
> be accepted and is probably why there isn't already a median().
>
> Since I guess it could be argued this isn't a true median, maybe we
> shouldn't call it
> a median, which is fine, but we still need it.
>
> > Exprtk doesn't currently support a 'median' operator but it does support
> > 'avg'.  We should contribute this upstream and add as a patch in the
> > meantime.
> >
>
>

--000000000000192f8e05b82a652f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have a basic question, what are we trying to achieve=C2=
=A0here.<div>1. Are we avoiding of using PVS here completely or=C2=A0</div>=
<div>2. we don&#39;t want to define separate json config for PVS</div><div>=
<br></div><div>because in my understanding PVS will work straight forward</=
div><div>if we define expression in PVS config file.</div><div><br></div><d=
iv>Regards</div><div>-Vijay</div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 5, 2021 at 7:58 AM Matt Spinle=
r &lt;<a href=3D"mailto:mspinler@linux.ibm.com">mspinler@linux.ibm.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 1/5/2021 8:27 AM, Patrick Williams wrote:<br>
&gt; On Mon, Jan 04, 2021 at 04:57:51PM -0600, Matt Spinler wrote:<br>
&gt;&gt; On 1/4/2021 2:54 PM, Vijay Khemka wrote:<br>
&gt;&gt;&gt; On Mon, Jan 4, 2021 at 9:49 AM Matt Spinler &lt;<a href=3D"mai=
lto:mspinler@linux.ibm.com" target=3D"_blank">mspinler@linux.ibm.com</a><br=
>
&gt;&gt;&gt; &lt;mailto:<a href=3D"mailto:mspinler@linux.ibm.com" target=3D=
"_blank">mspinler@linux.ibm.com</a>&gt;&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 I need a median of some sensor values, whe=
re this median sensor has<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 threshold interfaces<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 whose values must be defined in entity-man=
ager.=C2=A0 Since exprtk<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 expressions are not allowed in<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 entity-manager, I cannot just port the PVS=
&#39;s JSON config into an<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 entity-manager config.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I missed this discussion but why can&#39;t we simply use virtu=
al sensor as<br>
&gt;&gt;&gt; expertk provides median function and we have threshold support=
 for<br>
&gt;&gt;&gt; each virtual sensor. Please help, if I am missing anything.<br=
>
&gt;&gt; If you&#39;re asking why can&#39;t we just have PVS get its exprtk=
 expression to<br>
&gt;&gt; use from entity-manager, and encode the median there, it&#39;s bec=
ause Ed<br>
&gt;&gt; doesn&#39;t want exprtk in entity-manager config files (I&#39;ll d=
efer to him on<br>
&gt;&gt; the reasons).<br>
&gt; As part of offline discussions on this I said that having a one-off EM=
<br>
&gt; config for median to allow you to make progress is reasonable, but I<b=
r>
&gt; don&#39;t think having a bunch of one-offs is a viable long-term solut=
ion<br>
&gt; for phosphor-virtual-sensors.=C2=A0 Basically we&#39;re kicking the ca=
n down the<br>
&gt; road until we have a better understanding of what kinds of EM/PVS<br>
&gt; configs we&#39;re going to need.<br>
&gt;<br>
&gt;&gt; If you&#39;re asking now that the median function is hardcoded, wh=
y write it in<br>
&gt;&gt; C++ instead of exprtk, it&#39;s because the exprtk code would be s=
o similar to<br>
&gt;&gt; C++ code (skip the bad values, put the sensors in a vector,=C2=A0 =
call<br>
&gt;&gt; nth_element)<br>
&gt;&gt; that writing it in exprtk doesn&#39;t really buy us anything, and =
using C++ lets<br>
&gt;&gt; me skip making the symbol table.<br>
&gt; I would certainly prefer we use the exprtk code here.=C2=A0 You should=
 be<br>
&gt; able to generate (at runtime) a exprtk expression from the EM config y=
ou<br>
&gt; specified below.<br>
&gt;<br>
&gt; My rationale is:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * Ed suggested that a long-term answer might be a =
few lookup tables<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 / transformations from the EM configs to th=
e PVS expressions.=C2=A0 I&#39;m<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 not fully bought into this yet but it seems=
 like a reasonable<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 direction to explore.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 * You wrote &quot;because the exprtk code would be=
 so similar to the C++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 code&quot;, which is why you *should* do it=
 in exprtk.=C2=A0 The rest of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 PVS code is already this way so why somethi=
ng different and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 require dual maintanence?=C2=A0 If the expr=
tk-based support code is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 missing some of these features, lets add th=
em because others will<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 likely need them as well.<br>
<br>
See below.<br>
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Instead, I will make a new entity-manager =
config that will have the<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 component sensors<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 along=C2=A0 with the thresholds to use, wi=
th a subtype of median, vaguely<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 something like:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Type: &quot;VirtualSensor&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Name: &quot;MySensorName&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Subtype: &quot;Median&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 Sensors: [ &quot;Sensor1&quot;, &quot;Sens=
or2&quot;, .... ]<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ThresholdsWithHysteresis [ ]<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 minInput: 0<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 maxInput: 100<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;&gt;<br>
&gt; I would expect the &#39;exprtk&#39; expression from your EM config to =
be<br>
&gt; something like &quot;median(Sensor1, Sensor2...)&quot;.=C2=A0 You shou=
ld be able to<br>
&gt; feed this into the existing virtual-sensor constructors and not have t=
o<br>
&gt; make the symbol table yourself.<br>
<br>
Every variable used by exprtk needs to be added to the symbol table <br>
first by the C++.<br>
<br>
Also, we need a slightly tweaked median of our 3 ambient temp sensors:<br>
1) throw out values outside of minInput/maxInput<br>
2) if there is an even number, because we threw out one, choose the <br>
higher value, and<br>
=C2=A0=C2=A0=C2=A0=C2=A0 don&#39;t do the average of the 2=C2=A0 that I bel=
ieve an actual median <br>
would use.<br>
3) if we threw out all 3 (very unlikely), use NaN as the sensor value.<br>
<br>
This is easy to do in C++ using std::nth_element, and basically looks <br>
the same in<br>
exprtk which is why I suggested just using C++ though I don&#39;t really <b=
r>
care that much either way,<br>
but I don&#39;t see how we could upstream this as a true median().=C2=A0 In=
 fact, <br>
since<br>
the underlying code would just use=C2=A0 nth_element anyway, I&#39;m not ev=
en <br>
sure it would<br>
be accepted and is probably why there isn&#39;t already a median().<br>
<br>
Since I guess it could be argued this isn&#39;t a true median, maybe we <br=
>
shouldn&#39;t call it<br>
a median, which is fine, but we still need it.<br>
<br>
&gt; Exprtk doesn&#39;t currently support a &#39;median&#39; operator but i=
t does support<br>
&gt; &#39;avg&#39;.=C2=A0 We should contribute this upstream and add as a p=
atch in the<br>
&gt; meantime.<br>
&gt;<br>
<br>
</blockquote></div>

--000000000000192f8e05b82a652f--
