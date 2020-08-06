Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9AA23D6B2
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 08:08:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMdNP4T9QzDqcJ
	for <lists+openbmc@lfdr.de>; Thu,  6 Aug 2020 16:08:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=zbigniewku@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bo9w6b+8; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMdMb4MmczDqH5
 for <openbmc@lists.ozlabs.org>; Thu,  6 Aug 2020 16:08:06 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id t10so21626181plz.10
 for <openbmc@lists.ozlabs.org>; Wed, 05 Aug 2020 23:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/ucYskgPj33BidFRWCN/DSI05tXTj9NqYllKQ1kWso0=;
 b=bo9w6b+8t6lKZmdz7Zh3l+TzAMxuKA2Mu13ks4Ojjhq5RieDEJDUWAclFt9ZFf3fgK
 NTnHUtw9M+QTrHtIzBIeDzIhbg4EgPfLapVHLOL4dXpwGmb0As7UTZ+jw9XBdxC1K0ZA
 w5l/2q6cxL9dExwMgv5LDwnNP0MlnJEED5ShXkwv0hn3OnVNJmvxUMbJyNomsgIN5qm5
 LrkztvEYOJW2qdbNOUZId9If4FSaKXci2ISWlfH7/FHfAcaP7QcWD1FbLk032Q76bS6C
 88Mds9cz6hdhsvLLx2Nt6he0Woe2KdSbI8Pwu5e6s11V7zw+2mPlgGbvlJakfgJeLEqa
 OAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/ucYskgPj33BidFRWCN/DSI05tXTj9NqYllKQ1kWso0=;
 b=gPe9o94w2BEz8XW83tCyslCsiTGGTwu67QT60wprOWBAtgX/eizlmyTKN2DWLJ6B7y
 rMwWNZtZ4omQAYpnaCBf+3Y09hB94/kV+LsQx1fOOtjzVLiGn7zHYejp1PQTJkRQ6GGh
 Iz1BE9+KvL7ZlKEQG8zASkHqlLlmAtCJzYYhoXKXVRRS6BspYBjo75o2F7V9oMNMc4aJ
 1F3GC3ceJO8Fswu/rW47M0/yacnKNeHLIRu1ZD/nouFMMXa5G7zhvCjPPWFsRwnBqLUL
 5aNewF/LFZ+YjeuJcGruD+ycRIM64GhUQxsoGt3VSr4CK8rTzgewk6/4RD8PRvbeF/sC
 lxgA==
X-Gm-Message-State: AOAM533xEEvTqeSf9JUTzU1I2D31jjQOkCL81BRLMIM8rDnUGXpP08EP
 Y7HNDoQ0zYls0CES9R23xyPrqAPc0kxd04syvfY=
X-Google-Smtp-Source: ABdhPJw5jY9xoheGO1he3YCseDEHlZkzo0Tf65HpMt+agueZDstEf7gksJnFOHeYMiL7sgWJA7Qn2VLkuNq3ukURwp4=
X-Received: by 2002:a17:90a:4e89:: with SMTP id
 o9mr7282770pjh.178.1596694083448; 
 Wed, 05 Aug 2020 23:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
In-Reply-To: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
From: Zbyszek <zbigniewku@gmail.com>
Date: Thu, 6 Aug 2020 08:07:52 +0200
Message-ID: <CAB_SOc7r2jzNAdWixDMcgf33Tu-RVordrg4baB8Medo32shWJA@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: Jason Ling <jasonling@google.com>
Content-Type: multipart/alternative; boundary="000000000000a8b62405ac2f4f51"
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
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000a8b62405ac2f4f51
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Doing some code changes I encountered this comment in PSUSensor.
https://github.com/openbmc/dbus-sensors/blob/dfad1ffcf4d41d6b5c0fd578d1817c=
0540631e29/src/PSUSensorMain.cpp#L762
I didn't verify it but it looks like the mechanism for disabling the
selected sensor is already there.


czw., 6 sie 2020 o 01:43 Jason Ling <jasonling@google.com> napisa=C5=82(a):

> *Problem:*
> There is a use case where temp1_input should be omitted from being expose=
d
> to dbus.
> A concrete example is if you have a temp sensor with 10 channels but only
> want to expose 2..10.
>
> Currently dbus/hwmontemp doesn't allow this.
>
> *Solution:*
> In order to maintain backwards compatibility I am proposing an OmitList
> attribute that hwmontemp will attempt to retrieve.
> If the "Name"s of any temp sensor appears in the list, it will be skip
> sensor creation.
>
> I am proposing a list to support other use cases such as...
>
> * you're doing BMC development and for whatever reason want to temporaril=
y
> suppress a temperature and do some tests..you can add it to this list and
> then remove it instead of deleting and re-inserting.
>
> * lets you have non-contiguous temp sensors exposed (e.g temp2_input,
> temp5_input, temp7_input) . There is a better solution to this; but for n=
ow
> this enables this use-case.
>
> *etc..*
> It's a simple feature; plan to have something within O(hours).
>

--000000000000a8b62405ac2f4f51
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Doing some code changes I encountered this comment in=
 PSUSensor.</div><div dir=3D"ltr"><div><a href=3D"https://github.com/openbm=
c/dbus-sensors/blob/dfad1ffcf4d41d6b5c0fd578d1817c0540631e29/src/PSUSensorM=
ain.cpp#L762" target=3D"_blank">https://github.com/openbmc/dbus-sensors/blo=
b/dfad1ffcf4d41d6b5c0fd578d1817c0540631e29/src/PSUSensorMain.cpp#L762</a><b=
r></div><div>I didn&#39;t verify it but it looks like the mechanism for dis=
abling the selected sensor is already there.</div><div><br></div><div></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>czw., 6 sie 2020 o 01:43=C2=A0Jason Ling &lt;<a href=3D"mailto:jasonling@g=
oogle.com" target=3D"_blank">jasonling@google.com</a>&gt; napisa=C5=82(a):<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div><b>Problem:</b></div>There is a use case where temp1_input should be =
omitted from being exposed to dbus.<div>A concrete example is if you have a=
 temp sensor with 10 channels but only want to expose 2..10.</div><div><br>=
</div><div>Currently dbus/hwmontemp doesn&#39;t allow this.</div><div><br><=
/div><div><b>Solution:</b></div><div>In order to maintain backwards compati=
bility I am proposing an OmitList attribute that hwmontemp will attempt to =
retrieve.<br></div><div>If the &quot;Name&quot;s of any temp sensor appears=
 in the list, it will be skip sensor creation.</div><div><br></div><div>I a=
m proposing a list to support other use cases such as...</div><div><br></di=
v><div>* you&#39;re doing BMC development and for whatever reason want to t=
emporarily suppress=C2=A0a temperature and do some tests..you can add it to=
 this list and then remove it instead of deleting and re-inserting.<br></di=
v><div><br></div><div>* lets you have non-contiguous temp sensors exposed (=
e.g temp2_input, temp5_input, temp7_input) . There is a better solution to =
this; but for now this enables this use-case.</div><div><br></div><div><b>e=
tc..</b></div><div>It&#39;s a simple feature; plan to have something within=
 O(hours).</div></div>
</blockquote></div></div>

--000000000000a8b62405ac2f4f51--
