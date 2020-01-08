Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1E7134A39
	for <lists+openbmc@lfdr.de>; Wed,  8 Jan 2020 19:09:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tHLy3FbDzDqRJ
	for <lists+openbmc@lfdr.de>; Thu,  9 Jan 2020 05:09:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EtA5SzGP"; 
 dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tHJ31G5xzDqQc
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jan 2020 05:06:42 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id c16so3467422oic.3
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jan 2020 10:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xtw3jEpgDI4TvmGB8gZBmN+sTBKKLeTbFlnUCbivlKQ=;
 b=EtA5SzGPZVvo61X72HzgyvgD3EyZ2/TllQwcM/QKLawbkq2aibwNwC7dlRQSML+cVa
 yz4BPwFG4ZIYjXUxb7u2IRNT95FUc6wFlwNLeauAr+tPbtTsDAsGtzd94E35uXQgU5sB
 zmzXAa5fIQ8MbozHjmbckkkAabAqwv3RofhYmgUIc3cj4j6XBJBSyVn8HglXEh0BNSm7
 61ysVuxNQssUiUg1Hf3IZwV48kYy/7GJG2zLxpM/XXpYclD+vF989WPpVknHN3s7eb07
 NfMJr8j8gK09T91EblFLrfzU69O/fmRUNjNfd2GidqwED3fxbYgjsdxkO9ChxXriCqfl
 0ZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xtw3jEpgDI4TvmGB8gZBmN+sTBKKLeTbFlnUCbivlKQ=;
 b=tJBMmKXTi4UXCcuU4gd2RySrdE0NgFxH+4X+YAdas3IgpKDxKyqMHPDgXJv3+CER31
 gygMTNwxGEZLjcHxWytgGN6bnQVwJDZFHN8k0sDwYhNJ7RXw0n5cB76GLwtBgOtWGgHI
 LDvMlqEkuSuLHMEW9rS9sRbs5pnpp8of81pNmJIYg0UGLJJR1Id/Rg2ByPvkARHmt3HU
 3tjodQ+W2c/+DqIsNjyrQZPkDvg1Ie5IUZJYhWPQlwuRIJrI5yjowD4vMZroqW6qNYzK
 34KWHV6W+WncFJeQ6zmwf7SsfGUt0zbJfc5Go4kfIIUKNYbc/7prHeeXFaFAa0kClgdz
 SlGQ==
X-Gm-Message-State: APjAAAVOUXJcpfO6qF4wF/RgmFJanZIkpBHSeeWsxfTo6Uj2uu+VNWtk
 I4cHqh5f8Pb/TxmeCAA760oFkOyNhrfJW54neNLYSg==
X-Google-Smtp-Source: APXvYqyt8GPD+/IIucqUXxOmWVunPP59YLNmSxuUxi0MFWqdECfqB+K9AZgZdM+s2mDII4/tIC1HP+WQjNYv8LIBBHo=
X-Received: by 2002:aca:f555:: with SMTP id t82mr4294757oih.103.1578506799122; 
 Wed, 08 Jan 2020 10:06:39 -0800 (PST)
MIME-Version: 1.0
References: <CAA_a9xKmRHHx=vXvwTaO+0PRtFjLWQUAL1WnJH8XGBBzvExt2A@mail.gmail.com>
 <OF100509F8.6ECF782D-ON002584E9.004AC321-002584E9.0050DF26@notes.na.collabserv.com>
 <CAA_a9xJQsSjrcjq+=+uoPe4KCkUjWTgEp_cG-0E2FczP=PtBUg@mail.gmail.com>
 <d1069c71-108f-d5e0-f2fa-4af1048386e2@linux.intel.com>
 <CAA_a9xKG_qk5sBUZY6T5xH+XG_HQwLXVf2Jy0GXX0Ob+6R1rig@mail.gmail.com>
 <27eb67c0-c758-5b46-bb49-9eceec25bc4f@linux.intel.com>
In-Reply-To: <27eb67c0-c758-5b46-bb49-9eceec25bc4f@linux.intel.com>
From: Alex Qiu <xqiu@google.com>
Date: Wed, 8 Jan 2020 10:06:28 -0800
Message-ID: <CAA_a9xKa1VpvhfJVdvt_OqJ7in5Ntiowqmdpq_J1okYX8xq1yQ@mail.gmail.com>
Subject: Re: Configuring device with I2C mux
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000009cd2a059ba4c189"
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

--00000000000009cd2a059ba4c189
Content-Type: text/plain; charset="UTF-8"

Hi James,

I'll take a look at them. Thanks for pointing the related code out!

- Alex Qiu


On Wed, Jan 8, 2020 at 10:02 AM James Feist <james.feist@linux.intel.com>
wrote:

> On 1/8/20 9:54 AM, Alex Qiu wrote:
> > Hi James,
> >
> > Yes, we have multiple devices sitting behind the mux, and they're
> > onboard devices instead of standalone FRUs. The parent bus is described
> > as the FRU for each PCIe card.
> >
> > After naming the mux channels, can these names be used somehow to config
> > I2C devices? For example, {"Bus": "$bus", "ChannelNames":
> > ["C0", "C1", "C2", "C3"]} for the mux, and {"Bus": "$bus.C1"} for
> > devices behind the mux on channel 1.
>
> This syntax doesn't exist today.. On all our systems things behind the
> mux are again detectable, so we haven't hit this problem. Right now the
> template replacement is purely based on the found device on d-bus. So
> $bus is the bus property from the xyz.openbmc_project.FruDevice
> interface, there's no way to trace that to a mux channel, as it's just a
> d-bus property.
>
> The code you're looking for is here:
>
> https://github.com/openbmc/entity-manager/blob/01542d2af1b1f45335cc8813fffcd3ed07f22989/src/Utils.cpp#L144
>
>
> Along with the channel identification logic here:
>
> https://github.com/openbmc/entity-manager/blob/01542d2af1b1f45335cc8813fffcd3ed07f22989/src/Overlay.cpp#L112
>
> You could probably add some special syntax to make this work. Luckily
> this is the one part of entity-manager that is unit-tested, so that
> should help you
>
> https://github.com/openbmc/entity-manager/blob/master/test/test_entity-manager.cpp
>
>
> -James
>
>
>
>
>

--00000000000009cd2a059ba4c189
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi James,<div><br></div><div>I&#39;ll take a look at them.=
 Thanks for pointing the related code out!</div><div><br clear=3D"all"><div=
><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signatu=
re"><div dir=3D"ltr">- Alex Qiu</div></div></div><br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 8, 2=
020 at 10:02 AM James Feist &lt;<a href=3D"mailto:james.feist@linux.intel.c=
om">james.feist@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 1/8/20 9:54 AM, Alex Qiu wrote:<br>
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

--00000000000009cd2a059ba4c189--
