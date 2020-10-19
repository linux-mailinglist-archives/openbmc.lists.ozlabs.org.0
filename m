Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E6C292D79
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 20:23:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFQ9w1VN7zDqWk
	for <lists+openbmc@lfdr.de>; Tue, 20 Oct 2020 05:23:32 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32;
 helo=mail-qv1-xf32.google.com; envelope-from=tbnguyen1985@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gituwTOT; dkim-atps=neutral
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFQ8t3VRyzDqby
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 05:22:38 +1100 (AEDT)
Received: by mail-qv1-xf32.google.com with SMTP id h11so276901qvq.7
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2020 11:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yY10BA12mAxWBhAaaRZbFOe2nchAHw3jXrAJ3foiQ1M=;
 b=gituwTOTpT4jYM9zq9AYw9CpW7pHDYzcu1+69+1Zu4LYgOtG+9Fn1NBS5yG57aj1px
 5CsV1q6oAXnWGir/EocBrmSHceDxfGy2cO+s8T7aE2hvSTsn5CCe+T9komBZpuxyB/RB
 7CmqDXp5J6JRgDJMsVCYNiJeVdPECjJaJi/Q6JyPQ8zrWAc6Gp85JB2M7iENrTuhVhMX
 YtMXM5C9hpcUxAmp9dwCtqwuymUJu4aDameimnyAAGveE6Oh+72dhvlBSgjvs75qtaMn
 N0R1LA0JLYAvwqp5jcqPpISX4VibEne+KcLFqacFmLc81bvQV0REwCHPDw36IKGwS4CT
 MJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yY10BA12mAxWBhAaaRZbFOe2nchAHw3jXrAJ3foiQ1M=;
 b=jXv8aQLR71v9lhx7N7jc3Gp/a78pLJdzTK12CEfl5wEmsbpay3FkHU4GJHxvbwFGMo
 9TWin4Cszrj0ro+zadwcRAtxF3ojQG324zhSXBxa8915hpT9Xln0JJrDdUQ3QxfwUfrg
 dZor8C980ZQIfOhjtOIdFZ/fzDC7KfTz+U0K4pf3DYCnry4b2miUkp7zViZKzPh8Hu3S
 vJpqA5H2UhAC3mDqHaCFBXSkZ4l4v/AeAc6MRzAJ7DMtrnseZPZ1vv3U+Q54u7ZkDblv
 AegP2x7oYr6FApOvWaZpcP4cu8LbGKCggkI9V8bi+/lpV9sQ7go370j26XMdWCVi099S
 r33Q==
X-Gm-Message-State: AOAM5312Ad9JUTTmF7KnkIiLQwhsA7PJ75cG3pddxdiuPJQ6xIvQctDs
 HiNJIqBBcgSMW51hNFdAelOksqrr98D03PxF8PpYm2OddJM=
X-Google-Smtp-Source: ABdhPJxx4l0pUYAuaogvTSQbtH7rSZ9ekUXcNaeJgjGzAjgihU5Hyxs4eIEWCTBjAMY8S3qRIjwbvDRK8+0uVYuOPkI=
X-Received: by 2002:ad4:4701:: with SMTP id k1mr1061022qvz.47.1603131754082;
 Mon, 19 Oct 2020 11:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
 <CACWQX833j+remiYr8qOdrZZ4z3L3D_GX0q6z4MPJDu8J4Nv+Pg@mail.gmail.com>
In-Reply-To: <CACWQX833j+remiYr8qOdrZZ4z3L3D_GX0q6z4MPJDu8J4Nv+Pg@mail.gmail.com>
From: Thu Ba Nguyen <tbnguyen1985@gmail.com>
Date: Tue, 20 Oct 2020 01:22:22 +0700
Message-ID: <CALioo36kortxuLPJQmc7xtDVN=jAxPNf481ovFkc2jQfYu8-rg@mail.gmail.com>
Subject: Re: Enable/Disable some sensors when Host On/Off
To: Ed Tanous <ed@tanous.net>
Content-Type: multipart/alternative; boundary="000000000000baf71205b20a32c5"
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

--000000000000baf71205b20a32c5
Content-Type: text/plain; charset="UTF-8"

Hi Ed Tanous,

Thanks for your info,
But in your platform we are using phosphor-hwmon to manage sensors.
We don't use entity-manager.
As I knew we can't use both entity-manager and phosphor-hwmon for one
project.

Regards
Thu Nguyen.

On Tue, Oct 20, 2020 at 12:31 AM Ed Tanous <ed@tanous.net> wrote:

> On Sun, Oct 18, 2020 at 7:00 AM Thu Ba Nguyen <tbnguyen1985@gmail.com>
> wrote:
> >
> > Do we have any options/solution to Enable/Disable some sensors when Host
> On/Off?
>
> I believe this is already supported in the entity-manager/dbus-sensors
> stack, with the "PowerState" parameter in the EM configuration;
>
> example:
>
> https://github.com/openbmc/entity-manager/blob/def29274907ef77187b02ae19d55bb9888413892/configurations/WFT%20Baseboard.json#L6
>
> There's also mitigations for the common thresholding issues, like a
> power state change coming in during the sensor read.
>

--000000000000baf71205b20a32c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Ed Tanous,</div><div><br></div><div>Thanks for you=
r info,=C2=A0</div><div>But in your platform we are using phosphor-hwmon to=
 manage sensors.</div><div>We don&#39;t use entity-manager.</div><div>As I =
knew we can&#39;t use both entity-manager and phosphor-hwmon for one projec=
t.</div><div><br></div><div>Regards</div><div>Thu Nguyen.</div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 20, 20=
20 at 12:31 AM Ed Tanous &lt;<a href=3D"mailto:ed@tanous.net">ed@tanous.net=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left=
-color:rgb(204,204,204);padding-left:1ex">On Sun, Oct 18, 2020 at 7:00 AM T=
hu Ba Nguyen &lt;<a href=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank=
">tbnguyen1985@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Do we have any options/solution to Enable/Disable some sensors when Ho=
st On/Off?<br>
<br>
I believe this is already supported in the entity-manager/dbus-sensors<br>
stack, with the &quot;PowerState&quot; parameter in the EM configuration;<b=
r>
<br>
example:<br>
<a href=3D"https://github.com/openbmc/entity-manager/blob/def29274907ef7718=
7b02ae19d55bb9888413892/configurations/WFT%20Baseboard.json#L6" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/openbmc/entity-manager/blob/de=
f29274907ef77187b02ae19d55bb9888413892/configurations/WFT%20Baseboard.json#=
L6</a><br>
<br>
There&#39;s also mitigations for the common thresholding issues, like a<br>
power state change coming in during the sensor read.<br>
</blockquote></div></div>

--000000000000baf71205b20a32c5--
