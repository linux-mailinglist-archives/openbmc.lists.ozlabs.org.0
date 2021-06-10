Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9778C3A312C
	for <lists+openbmc@lfdr.de>; Thu, 10 Jun 2021 18:44:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G18vV0kYqz30C1
	for <lists+openbmc@lfdr.de>; Fri, 11 Jun 2021 02:44:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=FM036RS8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=FM036RS8; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G18vD4GFjz2yWy
 for <openbmc@lists.ozlabs.org>; Fri, 11 Jun 2021 02:44:06 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id k5so4012006pjj.1
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jun 2021 09:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=876g3fXwTIAiHdwwJfrG6br5e6Z3gpQ25110MrJIWLU=;
 b=FM036RS8/xxJZ/UG3TXewATb+soMaz6/qC2eNJ1FeRPGEM5qT8uk8P/SQmd6i8puoW
 35l5Bo8G7RDcM8wfGGUtrv6E4Kjh+78FpEFMcp8yikbwLK1K0CaKx0EfZtmoKgImcMPu
 obM2NtNJ+koJKf38Kyaazp9iZcfwO75OFOFS9zvLMFEaxTNmrJGcyPtH6d8l9640u+wl
 7oYGU0wpwoVf5CsCJqYqcYGYqvLvheKFVrV6XXoJtJ/PJdzcUNoLJLeJzOzkMwqXiGJC
 exPhXAsZGMLy44iWEOFEY6x6/70jlUfu4L0uKUUy/9Wy29ny/igwQFDk208e9XRrjkRO
 EWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=876g3fXwTIAiHdwwJfrG6br5e6Z3gpQ25110MrJIWLU=;
 b=emh0W1J7tlU3WP42EPIvc8VppwjJcv1yaC0bklMNOzrBkwtWn/tn7VEMx8WOwwwqge
 P5e0cCJBwyYK9qxARta6XJbP9LXnaNk1u/fbkqGGros35qR9i6zZlk3hnUujCR4A5WUn
 Uhc468L0ZFOjDfLpDd9UxU+g0MLYR3AiQVWPkK8h0UNpKiBviddBctpNk0WG9PJdbhBF
 aW7XaRV4Tp0xpuMhnPkPb92oe0Myun/bxkfKAsjfHqMsm9WgFBh2JBzrdHEAPjkbeL+x
 5jiGJANadqJHW23CV3nvZakpbKO8+Ewg7rISGANjGl2+sEvHs/RhzrzU9bd8hOA7Cm7h
 i7og==
X-Gm-Message-State: AOAM532OhcFKWUuf2vPd+N/Jyfm+UrJ6np04Ww4tdXPPO0DZwKGJ/x2K
 5ruaANZmRMYrUx0DbXMTURppg1uC4QUfoO+cG4dHVDGrzRI=
X-Google-Smtp-Source: ABdhPJxajG9JXttCLt/zuafAQoAUqHcQ+hRzGBfyRRjfTGpUm1vRSkbQ/sJ8/rPWiTbBc85Tl6Hm0wT7TfBITmCmMQE=
X-Received: by 2002:a17:902:e891:b029:10e:8977:8d68 with SMTP id
 w17-20020a170902e891b029010e89778d68mr5560045plg.39.1623343443063; Thu, 10
 Jun 2021 09:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAHwn2Xkn5h2SJYHDriSgs2HYDv2WDMHqwOmaR5XAHaFFZjCLAg@mail.gmail.com>
In-Reply-To: <CAHwn2Xkn5h2SJYHDriSgs2HYDv2WDMHqwOmaR5XAHaFFZjCLAg@mail.gmail.com>
From: Willy Tu <wltu@google.com>
Date: Thu, 10 Jun 2021 09:43:51 -0700
Message-ID: <CAHwn2X=VQKLtvFz0-nterDA1n6jmT09GOK1m-=0-Law3hY_weg@mail.gmail.com>
Subject: Re: [Bmcweb/Redfish] Chassis Physical Connectivity Support on bmcweb
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000464c1e05c46c1958"
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
Cc: Jie Yang <jjy@google.com>, Ed Tanous <edtanous@google.com>,
 Derek Chan <dchanman@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000464c1e05c46c1958
Content-Type: text/plain; charset="UTF-8"

Related doc for the Chassis Inventory Connections:
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/41468

On Mon, Jun 7, 2021 at 6:22 PM Willy Tu <wltu@google.com> wrote:

> Hi all,
>
> I am thinking about adding better support for Physical Connectivity
> between Boards/Chassises in bmcweb. Since Inventory.Board is treated as a
> chassis, I want to have a way to better connect the different boards with
> the existing ContainedBy/Contains.
>
> I was thinking of using xyz.openbmc_project.Association to do it. Since
> it is a list with fixed order, we can use the first chassis it finds
> for ContainedBy and the rest for Contains. For the root Chassis, it will
> have itself as the first Chassis and then just not include it.
>
> Is this something we can work with? or do we need something more
> complicated to support chassis relationship?
>
> ----
>
> Another question that is kind of related.
> I am also thinking about using Physical Location for each Chassis.
> It is already using `xyz.openbmc_project.Inventory.Decorator.LocationCode`
> as the ServiceLabel
> https://github.com/openbmc/bmcweb/blob/90e97e1d26b78d899a543831a8051dacbbdde71a/redfish-core/lib/chassis.hpp#L295-L331
>
> With that in mind, I am wondering how LocationCode is configured with
> EntityManager? Since the number of FRUs is dynamic, there is no way to tell
> which location the FRU is connected to without a mapping. I am wondering
> how that can be done with Entity Manager.
>
> I was thinking of doing something like getEntityName
> <https://github.com/openbmc/google-ipmi-sys/blob/3b1b427c1fa4bcddcab1fc003410e5fa5d7a8334/handler.cpp#L235> in
> IPMI OEM handler which utilizes a json file for the mapping from entity
> instance to location. This is a simple way of doing it within
> EntityManager, but I am not sure if we want to do it this way.
>
> Maybe something related?
> https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/42971
>
> Best,
>
> Willy Tu
>

--000000000000464c1e05c46c1958
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Related doc for the Chassis Inventory Connections:<div><a =
href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/41468">https://=
gerrit.openbmc-project.xyz/c/openbmc/docs/+/41468</a><br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun =
7, 2021 at 6:22 PM Willy Tu &lt;<a href=3D"mailto:wltu@google.com">wltu@goo=
gle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr"><div><span style=3D"color:rgb(32,33,36);font-family=
:Roboto,sans-serif;font-size:14px;white-space:pre-wrap;background-color:rgb=
a(241,243,244,0.75)">Hi all,<br></span></div><div><span style=3D"color:rgb(=
32,33,36);font-family:Roboto,sans-serif;font-size:14px;white-space:pre-wrap=
;background-color:rgba(241,243,244,0.75)"><br></span></div><div><span style=
=3D"color:rgb(32,33,36);font-family:Roboto,sans-serif;font-size:14px;white-=
space:pre-wrap;background-color:rgba(241,243,244,0.75)">I am thinking about=
 adding better support for Physical Connectivity between Boards/Chassises i=
n bmcweb. Since Inventory.Board is treated as a chassis, I want to have a w=
ay to better connect the different boards with the existing ContainedBy/Con=
tains.</span></div><div><span style=3D"color:rgb(32,33,36);font-family:Robo=
to,sans-serif;font-size:14px;white-space:pre-wrap;background-color:rgba(241=
,243,244,0.75)"><br></span></div><div><span style=3D"color:rgb(32,33,36);fo=
nt-family:Roboto,sans-serif;font-size:14px;white-space:pre-wrap;background-=
color:rgba(241,243,244,0.75)">I was thinking of using </span>xyz.openbmc_pr=
oject.Association to do it. Since it is a list with fixed order, we can use=
 the first chassis it finds for=C2=A0ContainedBy and the rest for Contains.=
 For the root Chassis, it will have itself as the first Chassis and then ju=
st not include it.</div><div><br></div><div>Is this something we can work w=
ith? or do we need something more complicated to support chassis relationsh=
ip?</div><div><span style=3D"color:rgb(32,33,36);font-family:Roboto,sans-se=
rif;font-size:14px;white-space:pre-wrap;background-color:rgba(241,243,244,0=
.75)"><br></span></div><div><span style=3D"color:rgb(32,33,36);font-family:=
Roboto,sans-serif;font-size:14px;white-space:pre-wrap;background-color:rgba=
(241,243,244,0.75)">----</span></div><div><span style=3D"color:rgb(32,33,36=
);font-family:Roboto,sans-serif;font-size:14px;white-space:pre-wrap;backgro=
und-color:rgba(241,243,244,0.75)"><br></span></div><div><span style=3D"colo=
r:rgb(32,33,36);font-family:Roboto,sans-serif;font-size:14px;white-space:pr=
e-wrap;background-color:rgba(241,243,244,0.75)">Another question that is ki=
nd of related.</span></div><span style=3D"color:rgb(32,33,36);font-family:R=
oboto,sans-serif;font-size:14px;white-space:pre-wrap;background-color:rgba(=
241,243,244,0.75)"><div>I am also thinking about using Physical Location fo=
r each Chassis.</div>It is already using `xyz.openbmc_project.Inventory.Dec=
orator.LocationCode` as the ServiceLabel <a href=3D"https://github.com/open=
bmc/bmcweb/blob/90e97e1d26b78d899a543831a8051dacbbdde71a/redfish-core/lib/c=
hassis.hpp#L295-L331" target=3D"_blank">https://github.com/openbmc/bmcweb/b=
lob/90e97e1d26b78d899a543831a8051dacbbdde71a/redfish-core/lib/chassis.hpp#L=
295-L331</a></span><br><div><span style=3D"color:rgb(32,33,36);font-family:=
Roboto,sans-serif;font-size:14px;white-space:pre-wrap;background-color:rgba=
(241,243,244,0.75)"><br></span></div><div><span style=3D"color:rgb(32,33,36=
);font-family:Roboto,sans-serif;font-size:14px;white-space:pre-wrap;backgro=
und-color:rgba(241,243,244,0.75)">With that in mind, I am wondering how </s=
pan>LocationCode is configured with EntityManager? Since the number of FRUs=
 is dynamic, there is no way to tell which location the FRU is connected to=
 without a mapping. I am wondering how that can be done with Entity Manager=
.</div><div><br></div><div>I was thinking of doing something=C2=A0like=C2=
=A0<a href=3D"https://github.com/openbmc/google-ipmi-sys/blob/3b1b427c1fa4b=
cddcab1fc003410e5fa5d7a8334/handler.cpp#L235" target=3D"_blank">getEntityNa=
me</a>=C2=A0in IPMI OEM handler which utilizes a json file for the mapping =
from entity instance to location. This is a simple way of doing it within E=
ntityManager, but I am not sure if we want to do it this way.</div><div><br=
></div><div>Maybe something related?</div><div><span style=3D"color:rgb(32,=
33,36);font-family:Roboto,sans-serif;font-size:14px;white-space:pre-wrap;ba=
ckground-color:rgba(241,243,244,0.75)"><a href=3D"https://gerrit.openbmc-pr=
oject.xyz/c/openbmc/entity-manager/+/42971" target=3D"_blank">https://gerri=
t.openbmc-project.xyz/c/openbmc/entity-manager/+/42971</a><br></span></div>=
<div><br></div><div>Best,</div><div><br></div><div>Willy Tu</div></div>
</blockquote></div>

--000000000000464c1e05c46c1958--
