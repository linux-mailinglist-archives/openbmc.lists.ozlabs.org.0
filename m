Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CEE1B7D36
	for <lists+openbmc@lfdr.de>; Fri, 24 Apr 2020 19:46:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4981n94zsJzDqjN
	for <lists+openbmc@lfdr.de>; Sat, 25 Apr 2020 03:46:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=tucnRNcK; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4981mK30zSzDqjN
 for <openbmc@lists.ozlabs.org>; Sat, 25 Apr 2020 03:45:36 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id w145so8410185lff.3
 for <openbmc@lists.ozlabs.org>; Fri, 24 Apr 2020 10:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ly2ClnMfcqLu60NTaOq+0mbtBPHF/wLG0dNO0G0mLyc=;
 b=tucnRNcK7CyAs9l49kgZ17y4klmP2RDV0bBkVBb+hjWZOYxEC3vG1ycxlODGQFXvsW
 6LKytpFxN/Ocxe8msoMihtmHSdktKwNIWpl4U4oiyvc48nkbqhb4p0UsgKJe5HFSdKYY
 wJ3oKFfcoa+GZu+VAnUJ0ViKqcCUj9Wx0J5YncQJ9WCe82CYxdae3VT9XytqH8DlzfBm
 LJu6TUuiKrpZsNTgSSFQt6nLNdKmRQyBZgafteYL/QfIemIEHVljpButKIuw4GD99qks
 OznoGh1D1rQyoctP/JRMYmCSFo1swGLfWypW24G6R3cI4bN2GcS2CLsu/qigINe2ps7l
 5MQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ly2ClnMfcqLu60NTaOq+0mbtBPHF/wLG0dNO0G0mLyc=;
 b=cmNXuYVShLTgIiCZkPrv6Wlo8qlZSXXxI2+1mt8Z/lfuyTLoHDYn0qkfiks/5pLK/k
 3hUirXrBCWsBmPblY6bh5UxYyKLbSeJEUdRN7wk1T5V5CjK9kljhHFUfDdHCsku2y7PE
 uXmoIfQJSYel42Vs8sjTVWhEphSnHc0Pi8bwtGZXGnuqmHWQrHIW2QRLt1YnpzfOy8xI
 qp/heclxljsu8u1BOxAyMQ+4RAh+3Cjn0S7ZsIJV1z5BZzOXX/ZIP9Wkpw7ZWZmgY8CD
 e+TnokBRMa4S0E9mPh6H6MKRfQg9dXl8WelIZsYSeY54YLSAfs+AFnSLwFhPE4P/vm83
 clPQ==
X-Gm-Message-State: AGi0PuZh2sQFE97Zqvr/5/G9ifsYDWrPrmRmsJgwJ3vBqQjLQQO3B60Y
 HAVzE7KVRB6qNQwwk4g0754jgal9fV4rwOdUZF3hDg==
X-Google-Smtp-Source: APiQypJrFdFshx+yTSK8S9UiUVkDXEy1Vjik+pOQsxsGnZ5xNKRBkxmOw/kdUqZb3cw9inAtXC/wYqiUYepX4n8vTos=
X-Received: by 2002:a05:6512:242:: with SMTP id
 b2mr7202292lfo.92.1587750328506; 
 Fri, 24 Apr 2020 10:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <fd2978a9-bd4b-a8ba-67ac-94a8537a9fcf@linux.vnet.ibm.com>
 <20200424152120.GD26818@heinlein.lan.stwcx.xyz>
In-Reply-To: <20200424152120.GD26818@heinlein.lan.stwcx.xyz>
From: William Kennington <wak@google.com>
Date: Fri, 24 Apr 2020 10:45:17 -0700
Message-ID: <CAPnigKkaj5aU-3KXKsL_LxAdZg2pccXiQz0bPPb+h8RToBzotg@mail.gmail.com>
Subject: Re: Default Gateway for a system v/s Default gateway per Interface
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="0000000000005358a205a40ceee3"
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>,
 Johnathan Mantey <johnathanx.mantey@intel.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000005358a205a40ceee3
Content-Type: text/plain; charset="UTF-8"

Sounds good to me, we have needed this for a long time because the current
gateway configuration breaks our v6 stack with multiple NICs.

On Fri, Apr 24, 2020 at 8:21 AM Patrick Williams <patrick@stwcx.xyz> wrote:

> On Fri, Apr 24, 2020 at 08:36:26PM +0530, Ratan Gupta wrote:
> > ~~~~~~~~~~~~~
> > Kernel IP routing table
> > Destination     Gateway         Genmask         Flags   MSS Window  irtt
> > Iface
> > 0.0.0.0         19.168.2.1      0.0.0.0         UG        0 0          0
> > eth0
> > 0.0.0.0         10.10.10.1      0.0.0.0         UG        0 0          0
> > eth1
> > ~~~~~~~~~~~~~~
> >
> > Kernel will first try using the default gateway having higher metric
> > value and then fall back to the lower.
>
> I'm not seeing us with an interface to adjust the metric for an
> interface.  I think we need to add that at the same time?  Otherwise, I
> don't think we have a way to specify which interface outside-the-subnet
> should go (vs today we can set the default-gateway to the desired
> interface's gateway).
> --
> Patrick Williams
>

--0000000000005358a205a40ceee3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sounds good to me, we have needed this for a long time bec=
ause the current gateway configuration breaks our v6 stack with multiple NI=
Cs.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, Apr 24, 2020 at 8:21 AM Patrick Williams &lt;<a href=3D"mail=
to:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Fri, Apr 24, 2020 at 08:36:26PM +=
0530, Ratan Gupta wrote:<br>
&gt; ~~~~~~~~~~~~~<br>
&gt; Kernel IP routing table<br>
&gt; Destination=C2=A0=C2=A0=C2=A0=C2=A0 Gateway=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Genmask=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Flags=C2=A0=C2=A0 MSS Window=C2=A0 irtt <br>
&gt; Iface<br>
&gt; 0.0.0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 19.168.2.1=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.0.0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 <br>
&gt; eth0<br>
&gt; 0.0.0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.10.10.1=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.0.0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 <br>
&gt; eth1<br>
&gt; ~~~~~~~~~~~~~~<br>
&gt; <br>
&gt; Kernel will first try using the default gateway having higher metric <=
br>
&gt; value and then fall back to the lower.<br>
<br>
I&#39;m not seeing us with an interface to adjust the metric for an<br>
interface.=C2=A0 I think we need to add that at the same time?=C2=A0 Otherw=
ise, I<br>
don&#39;t think we have a way to specify which interface outside-the-subnet=
<br>
should go (vs today we can set the default-gateway to the desired<br>
interface&#39;s gateway).<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--0000000000005358a205a40ceee3--
