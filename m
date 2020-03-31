Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9CC19A003
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 22:38:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sLkf4XmJzDqxk
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 07:38:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::232;
 helo=mail-lj1-x232.google.com; envelope-from=wak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=F+N80Hxh; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sLjl60y7zDqVR
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 07:37:24 +1100 (AEDT)
Received: by mail-lj1-x232.google.com with SMTP id 19so23417512ljj.7
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 13:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5pQXer5A16Mu6b73P24AWTzJumT8r5E93v9M7gfIlEk=;
 b=F+N80HxhedgGjAl29Fd9hhxemSUbf0oCow/UGSH/WC/pwULpo6mmLZuPwrIFdOFsAu
 +bNBtLgzKSwRD76j8GFlCjlIPh+sdf9SK51AyYK6GKt2tEFFmlEE8cOiGMNM3xpb+bgn
 csnMRe4BI/3MegblZ2mrEzcNsbLoDO8HIYTWj5rHdfS6/e1YN7n7mTaPzKMbHnNkdtG3
 gYA6xVeQndoJ36Gu+k1iLmuVPf+ETjfnIlTtfT0AJoOmYrYxt8bqf4aLWdl094w9iW8l
 pePwRPz6E1mmHdyRdLH//RMSRRlD/EDAywxG/X3xuT9rzkCeIbxg3zcG8qvyllwJGVJF
 FEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5pQXer5A16Mu6b73P24AWTzJumT8r5E93v9M7gfIlEk=;
 b=nEeucBeQXw3IcuZ3/tYi7MsxLW9sstrpfJ8PiCTnmrzaw28GPCkRSHMwLY476pI2y+
 fSwphdsRUaGL6Q2CcSMdaO/MeiHstIKiWbMi7U8jnZzDC5CJx8sJr7xGQPbaY1+LOExs
 ePJaCEUNkQnQiuZ2yaA2h0MV6L1dkUrNWkxBE23NiohA7h5SL1Fi9KuYvAQdo0PDXwgh
 gOQMjAXV55uC/vG5WXaYxy6gNqRc4LLqJeLC++T7s9D1kgLJBxDLD+kgb6URJgZeviN/
 jANMumwx0Tu0eQENIC1GoIYHa7zgGes4YrHCTDq/wLHcN9UudMZoCsQQI193NodYdPKV
 oErw==
X-Gm-Message-State: AGi0PuYzAJC8fqLq7dNNQrQx0jpsPQIRu7pPbEVrv6UpaAe/An5EZ57O
 oGnLKDwYH9J9u57ocJoOjmaRvvq22YaWrPT4Ki6lPg==
X-Google-Smtp-Source: APiQypLlojolnZHpOC4SPDy1XG5IJFpb5Ak2wj6Jj7i6V5IriAFESQLa1nhSM9brTftEXskCvGeWLrgII7G9QF3chFM=
X-Received: by 2002:a2e:85c1:: with SMTP id h1mr5210150ljj.240.1585687038754; 
 Tue, 31 Mar 2020 13:37:18 -0700 (PDT)
MIME-Version: 1.0
References: <F69B446C-E70B-4B04-83A1-618A4F60E965@fb.com>
 <CADKL2t6nach67q57ca==uqHHEVCf=+F3PBOcQ1v0ZAazk6Yr+Q@mail.gmail.com>
 <4EA88F1E-3B2E-45FC-8135-0A91A4CF84D8@fb.com>
In-Reply-To: <4EA88F1E-3B2E-45FC-8135-0A91A4CF84D8@fb.com>
From: William Kennington <wak@google.com>
Date: Tue, 31 Mar 2020 13:37:07 -0700
Message-ID: <CAPnigKkwhidiMCxY9w6n=-s4gc9rk-Hnjz3YWiQPVX7r1dKCzA@mail.gmail.com>
Subject: Re: Chassis sled cycle
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="000000000000abe1c205a22c887a"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
 Benjamin Fair <benjaminfair@google.com>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000abe1c205a22c887a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The target is just that file. Platform specific services add themselves as
WantedBy. You shouldn't really need to worry about that part as triggering
the service will cause them to run.

On Tue, Mar 31, 2020 at 1:33 PM Vijay Khemka <vijaykhemka@fb.com> wrote:

>
>
> =EF=BB=BFOn 3/31/20, 10:53 AM, "Benjamin Fair" <benjaminfair@google.com> =
wrote:
>
>     On Mon, 30 Mar 2020 at 13:00, Vijay Khemka <vijaykhemka@fb.com> wrote=
:
>     >
>     > Hi Jason,
>     >
>     > We have a requirement of Chassis sled cycle and it can be achieved
> by sending an i2c command to hotswap controller. Is there any plan to add
> this feature in x86-power-control. It should take i2c bus address from
> configuration file.
>     >
>     >
>     >
>     > Regards
>     >
>     > -Vijay
>
>     This feature is implemented on some systems using an IPMI OEM command=
:
>
> https://github.com/openbmc/google-ipmi-sys#delayedhardreset---subcommand-=
0x03
>
>     It currently just activates the systemd target
>     gbmc-psu-hardreset.target and lets you register services to do the
>     actual hotswap reset (usually by toggling a GPIO). Having a unified
>     solution in x86-power-control for this would be great!
>
> Ben, Can you please share content of
>
> https://github.com/openbmc/google-ipmi-sys/blob/master/gbmc-psu-hardreset=
.target
> as my assumption is each platform needs to provide this file but I
> couldn't find any platform
> using this. I only found reference in meta-quanta which is deleting this
> file. So please
> provide a reference to this file.
>
>
>

--000000000000abe1c205a22c887a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The target is just=C2=A0that file. Platform specific servi=
ces add themselves as WantedBy. You shouldn&#39;t really need to worry abou=
t that part as triggering the service will cause them to run.</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 31=
, 2020 at 1:33 PM Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com">vi=
jaykhemka@fb.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><br>
<br>
=EF=BB=BFOn 3/31/20, 10:53 AM, &quot;Benjamin Fair&quot; &lt;<a href=3D"mai=
lto:benjaminfair@google.com" target=3D"_blank">benjaminfair@google.com</a>&=
gt; wrote:<br>
<br>
=C2=A0 =C2=A0 On Mon, 30 Mar 2020 at 13:00, Vijay Khemka &lt;<a href=3D"mai=
lto:vijaykhemka@fb.com" target=3D"_blank">vijaykhemka@fb.com</a>&gt; wrote:=
<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; Hi Jason,<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; We have a requirement of Chassis sled cycle and it can b=
e achieved by sending an i2c command to hotswap controller. Is there any pl=
an to add this feature in x86-power-control. It should take i2c bus address=
 from configuration file.<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; Regards<br>
=C2=A0 =C2=A0 &gt;<br>
=C2=A0 =C2=A0 &gt; -Vijay<br>
<br>
=C2=A0 =C2=A0 This feature is implemented on some systems using an IPMI OEM=
 command:<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/openbmc/google-ipmi-sys#delayed=
hardreset---subcommand-0x03" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/openbmc/google-ipmi-sys#delayedhardreset---subcommand-0x03</a><br=
>
<br>
=C2=A0 =C2=A0 It currently just activates the systemd target<br>
=C2=A0 =C2=A0 gbmc-psu-hardreset.target and lets you register services to d=
o the<br>
=C2=A0 =C2=A0 actual hotswap reset (usually by toggling a GPIO). Having a u=
nified<br>
=C2=A0 =C2=A0 solution in x86-power-control for this would be great!<br>
<br>
Ben, Can you please share content of<br>
=C2=A0<a href=3D"https://github.com/openbmc/google-ipmi-sys/blob/master/gbm=
c-psu-hardreset.target" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/openbmc/google-ipmi-sys/blob/master/gbmc-psu-hardreset.target</a><br>
as my assumption is each platform needs to provide this file but I couldn&#=
39;t find any platform<br>
using this. I only found reference in meta-quanta which is deleting this fi=
le. So please<br>
provide a reference to this file.<br>
<br>
<br>
</blockquote></div>

--000000000000abe1c205a22c887a--
