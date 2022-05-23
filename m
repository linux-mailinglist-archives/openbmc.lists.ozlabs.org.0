Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F409A5311E0
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 18:20:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6MxN5s0Zz3c7s
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 02:20:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Wol4l3CT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::429;
 helo=mail-wr1-x429.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=Wol4l3CT; dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6Mx15VGwz3bcv
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 02:19:49 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id u3so22140579wrg.3
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 09:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Acl0NiS/VKSQL4+m16ZHkuSRx/wko9BmHn3zznqsx/U=;
 b=Wol4l3CTR4aPrChEOecUWYMHcaym5SbP3J9yNap9VJY+TULV2MTtnr7iADzGijTw4N
 7wrXL0KBHqHcH6nMYj8D3raBhj1NTSGlfquMXbitaxcNXPnaMcFj7TYMU+Z3e67Ch1RX
 rtpgKruFC+LOY0YhzgjT51iNC75vRQH6cLQCWwph+qcooQcK3F+G1NJQ/n68N6/1+GtA
 1yYyjxYyfIxnrKPEVPQfh0xRfQb4QxuV6p7ma6sdavegpxBVFOV1KuaaDAdO2ZbRCpC4
 5E98iQmm9HTWkYHISrQtNY/4pcPtg5gvnfY5Ks9wuk6qaNjpZ+7AUAQF5v4rpIxFlFSg
 sZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Acl0NiS/VKSQL4+m16ZHkuSRx/wko9BmHn3zznqsx/U=;
 b=dL+tdYYsTEarzQPsNjpE+2BLqrls8VaQIyeeu4qGTDNSmUasurxn7euMaR/zgDdM46
 DThVd2QID/nkc5J5lrv4wyxGkm6IadSzfLTSZVwVrEaZZdNeyxtLpTj+fy7k1MCFyWL+
 t/0amttzH+RalgExKV0tZaboWvLTpi9+oQX60QuzjHHBxEmPpeTHvV38MMsXJinLjeKa
 UgosSiaDUzCTyV/U8IJu0w+i4CHYf45TCzJbgWNw6c48N1HYZtZipIwH0q/+BYJ2R/K5
 9Lbc7VH+MKGzfn9L7M4IkYG6SsxJ6O4Lqb22ho76mrZ/5iasn2Krz072E7BYHphYinBM
 qmLA==
X-Gm-Message-State: AOAM531Maxk7e58UPyNaoS9SH1WzirSjFkXBNEEVE5dUgaKC1t9/9rCN
 JnKm/UjyVQWAblRLwz/ntMZMQEkD62ERY9kUwHDa6Q==
X-Google-Smtp-Source: ABdhPJz1EYYfUFhl988lfhMp/rUC+okVxLc6nvT6BvLkYfqfH60sMlDciSqZhZYrlGShN0I4BPy5eyn7mIehu2znzMc=
X-Received: by 2002:a5d:4d07:0:b0:20e:5aa1:3acd with SMTP id
 z7-20020a5d4d07000000b0020e5aa13acdmr19815959wrt.186.1653322785942; Mon, 23
 May 2022 09:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm54UHU9s0bTq-AR9tJunoX2Wa9tQ0PH_zWJ2QrYdR3SRqcvg@mail.gmail.com>
In-Reply-To: <CAGm54UHU9s0bTq-AR9tJunoX2Wa9tQ0PH_zWJ2QrYdR3SRqcvg@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 23 May 2022 09:19:34 -0700
Message-ID: <CAH2-KxCOC4My0=hgQwjxedmnJ9+qewVkjv1SSCzPdGVfOAwBqA@mail.gmail.com>
Subject: Re: The incomplete result of mapper GetSubTree/Paths
To: Lei Yu <yulei.sh@bytedance.com>
Content-Type: multipart/alternative; boundary="0000000000005b84de05dfb0351d"
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000005b84de05dfb0351d
Content-Type: text/plain; charset="UTF-8"

On Thu, May 19, 2022 at 8:14 PM Lei Yu <yulei.sh@bytedance.com> wrote:

> This email is to describe an issue in mapper that the
> GetSubTree/GetSubTreePaths could return incomplete results when it's
> doing introspect.
>
> Steps to reproduce the issue:
> 1. Configure phosphor-logging to get max 1000 entries. (with
> -Derror_info_cap=1000 meson option)
> 2. Create 1000 logging entries.
> 3. Call GetSubTreePaths and make sure it gets the correct 1000 entries:
>     # busctl call "xyz.openbmc_project.ObjectMapper"
> "/xyz/openbmc_project/object_mapper"
> "xyz.openbmc_project.ObjectMapper" GetSubTreePaths sias
> /xyz/openbmc_project/logging/entry 0 1
> xyz.openbmc_project.Logging.Entry | awk '{print $2;}'
>     1000
> 4. Restart logging service
>     # systemctl restart xyz.openbmc_project.Logging.service
> 5. After the service is restarted, call GetSubTreePaths for multiple
> times in the short time (e.g. within 10 seconds)
>     # busctl call "xyz.openbmc_project.ObjectMapper"
> "/xyz/openbmc_project/object_mapper"
> "xyz.openbmc_project.ObjectMapper" GetSubTreePaths sias
> /xyz/openbmc_project/loggiz.openbmc_project.Logging.Entry | awk
> '{print $2;}'
>     47
>     # busctl call "xyz.openbmc_project.ObjectMapper"
> "/xyz/openbmc_project/object_mapper"
> "xyz.openbmc_project.ObjectMapper" GetSubTreePaths sias
> /xyz/openbmc_project/loggiz.openbmc_project.Logging.Entry | awk
> '{print $2;}'
>     375
>     # busctl call "xyz.openbmc_project.ObjectMapper"
> "/xyz/openbmc_project/object_mapper"
> "xyz.openbmc_project.ObjectMapper" GetSubTreePaths sias
> /xyz/openbmc_project/loggiz.openbmc_project.Logging.Entry | awk
> '{print $2;}'
>     851
>     # busctl call "xyz.openbmc_project.ObjectMapper"
> "/xyz/openbmc_project/object_mapper"
> "xyz.openbmc_project.ObjectMapper" GetSubTreePaths sias
> /xyz/openbmc_project/loggiz.openbmc_project.Logging.Entry | awk
> '{print $2;}'
>     1000
>
> We can see that the result of GetSubTreePaths is increasing until it gets
> 1000.
> This actually happens when mapper is doing introspect of the logging
> service, and getting more and more objects.

The above "incomplete" behavior will impact the logic that depends on
> the result of GetSubTreePaths.
> E.g. in ipmid, the "cached SEL" feature depends on the reliable result
> of GetSubTreePath, to get the number of current logging entries.


I'm not really following why this is a problem, and sounds like a bug in
the cached SEL feature.  Dbus objects can get added or removed at any time,
including logging objects, if the cached sel feature isn't handling all the
added/removed signals as it should, that really should be fixed.  Can you
go into more detail about what this actually causes?  Is it that logging
objects are getting added out of order?


> If
> it's not correct, ipmid will not know the "missed" entries.
>

What is a "missed" entry in this context?


>
> The question is, should we make sure mapper returns the "stable"
> result in the above case?
>

I don't think so, at least, when it was built, it wasn't designed to return
atomically created results, but given that ANY object on dbus can be added
or removed at any time, it's not clear why this is a problem in the mapper
itself.


> When it's doing introspect of a service (e.g. nameOwnerChanged), it
> could throw if the service is not fully introspected, and only return
> the "correct" result after the service is fully introspected.


> If mapper could not guarantee the stable result, the service calling
> mapper will have to add more complex logic to make sure it gets the
> "full and correct" result.
>

I left comments on your code review as well, but please don't do this.
This is going to force retry code into EVERY service that relies on the
mapper, at EVERY mapper call site.  If the current behavior is truly a
problem, I would much rather the mapper support multi-versioned atomically
create copies of the dbus-map, and have the mapper expose the "reliable"
interface, rather than spreading that throughout the system.  For context,
bmcweb alone has dozens of call sites to the mapper that would need to be
fixed if it were made to be possible for it to fail in this way.


>
> --
> BRs,
> Lei YU
>

--0000000000005b84de05dfb0351d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 19, 2022 at 8:14 PM Lei Y=
u &lt;<a href=3D"mailto:yulei.sh@bytedance.com">yulei.sh@bytedance.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This =
email is to describe an issue in mapper that the<br>
GetSubTree/GetSubTreePaths could return incomplete results when it&#39;s<br=
>
doing introspect.<br>
<br>
Steps to reproduce the issue:<br>
1. Configure phosphor-logging to get max 1000 entries. (with<br>
-Derror_info_cap=3D1000 meson option)<br>
2. Create 1000 logging entries.<br>
3. Call GetSubTreePaths and make sure it gets the correct 1000 entries:<br>
=C2=A0 =C2=A0 # busctl call &quot;xyz.openbmc_project.ObjectMapper&quot;<br=
>
&quot;/xyz/openbmc_project/object_mapper&quot;<br>
&quot;xyz.openbmc_project.ObjectMapper&quot; GetSubTreePaths sias<br>
/xyz/openbmc_project/logging/entry 0 1<br>
xyz.openbmc_project.Logging.Entry | awk &#39;{print $2;}&#39;<br>
=C2=A0 =C2=A0 1000<br>
4. Restart logging service<br>
=C2=A0 =C2=A0 # systemctl restart xyz.openbmc_project.Logging.service<br>
5. After the service is restarted, call GetSubTreePaths for multiple<br>
times in the short time (e.g. within 10 seconds)<br>
=C2=A0 =C2=A0 # busctl call &quot;xyz.openbmc_project.ObjectMapper&quot;<br=
>
&quot;/xyz/openbmc_project/object_mapper&quot;<br>
&quot;xyz.openbmc_project.ObjectMapper&quot; GetSubTreePaths sias<br>
/xyz/openbmc_project/loggiz.openbmc_project.Logging.Entry | awk<br>
&#39;{print $2;}&#39;<br>
=C2=A0 =C2=A0 47<br>
=C2=A0 =C2=A0 # busctl call &quot;xyz.openbmc_project.ObjectMapper&quot;<br=
>
&quot;/xyz/openbmc_project/object_mapper&quot;<br>
&quot;xyz.openbmc_project.ObjectMapper&quot; GetSubTreePaths sias<br>
/xyz/openbmc_project/loggiz.openbmc_project.Logging.Entry | awk<br>
&#39;{print $2;}&#39;<br>
=C2=A0 =C2=A0 375<br>
=C2=A0 =C2=A0 # busctl call &quot;xyz.openbmc_project.ObjectMapper&quot;<br=
>
&quot;/xyz/openbmc_project/object_mapper&quot;<br>
&quot;xyz.openbmc_project.ObjectMapper&quot; GetSubTreePaths sias<br>
/xyz/openbmc_project/loggiz.openbmc_project.Logging.Entry | awk<br>
&#39;{print $2;}&#39;<br>
=C2=A0 =C2=A0 851<br>
=C2=A0 =C2=A0 # busctl call &quot;xyz.openbmc_project.ObjectMapper&quot;<br=
>
&quot;/xyz/openbmc_project/object_mapper&quot;<br>
&quot;xyz.openbmc_project.ObjectMapper&quot; GetSubTreePaths sias<br>
/xyz/openbmc_project/loggiz.openbmc_project.Logging.Entry | awk<br>
&#39;{print $2;}&#39;<br>
=C2=A0 =C2=A0 1000<br>
<br>
We can see that the result of GetSubTreePaths is increasing until it gets 1=
000.<br>
This actually happens when mapper is doing introspect of the logging<br>
service, and getting more and more objects.</blockquote><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
The above &quot;incomplete&quot; behavior will impact the logic that depend=
s on<br>
the result of GetSubTreePaths.<br>
E.g. in ipmid, the &quot;cached SEL&quot; feature depends on the reliable r=
esult<br>
of GetSubTreePath, to get the number of current logging entries.</blockquot=
e><div><br></div><div>I&#39;m not really following why this is a problem, a=
nd sounds like a bug in the cached SEL feature.=C2=A0 Dbus objects can get =
added or removed at any time, including logging objects, if the cached sel =
feature isn&#39;t handling all the added/removed signals as it should, that=
 really should be fixed.=C2=A0 Can you go into more detail about what this =
actually causes?=C2=A0 Is it that logging objects are getting added out of =
order?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"> If<br>
it&#39;s not correct, ipmid will not know the &quot;missed&quot; entries.<b=
r></blockquote><div><br></div><div>What is a &quot;missed&quot; entry in th=
is context?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
The question is, should we make sure mapper returns the &quot;stable&quot;<=
br>
result in the above case?<br></blockquote><div><br></div><div>I don&#39;t t=
hink so, at least, when it was built, it wasn&#39;t designed to return atom=
ically created results, but given that ANY object on dbus can be added or r=
emoved at any time, it&#39;s not clear why this is a problem in the mapper =
itself.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
When it&#39;s doing introspect of a service (e.g. nameOwnerChanged), it<br>
could throw if the service is not fully introspected, and only return<br>
the &quot;correct&quot; result after the service is fully introspected.=C2=
=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
If mapper could not guarantee the stable result, the service calling<br>
mapper will have to add more complex logic to make sure it gets the<br>
&quot;full and correct&quot; result.<br></blockquote><div><br></div><div><d=
iv>I left comments on your code review as well, but please don&#39;t do thi=
s.=C2=A0 This is going to force retry code into EVERY service that relies o=
n the mapper, at EVERY mapper call site.=C2=A0 If the current behavior is t=
ruly a problem, I would much rather the mapper support multi-versioned atom=
ically create copies of the dbus-map, and have the mapper expose the &quot;=
reliable&quot; interface, rather than spreading that throughout the system.=
=C2=A0 For context, bmcweb alone has dozens of call sites to the mapper tha=
t would need to be fixed if it were made to be possible for it to fail in t=
his way.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
-- <br>
BRs,<br>
Lei YU<br>
</blockquote></div></div>

--0000000000005b84de05dfb0351d--
