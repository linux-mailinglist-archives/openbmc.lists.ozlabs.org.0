Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBD54B1C19
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 03:17:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jvy1v0pXXz3bZC
	for <lists+openbmc@lfdr.de>; Fri, 11 Feb 2022 13:17:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=YXAUGt9D;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b35;
 helo=mail-yb1-xb35.google.com; envelope-from=gauravgandhi@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=YXAUGt9D; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvH630VhFz2yNv
 for <openbmc@lists.ozlabs.org>; Thu, 10 Feb 2022 11:03:52 +1100 (AEDT)
Received: by mail-yb1-xb35.google.com with SMTP id y6so10736072ybc.5
 for <openbmc@lists.ozlabs.org>; Wed, 09 Feb 2022 16:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZMpBS0TDGW/H24X/8kI4HLy6YpFjlJ4x4xg0MFEc8rs=;
 b=YXAUGt9Dm9As2JZdJwBQiTcgOFQJnzug3BexvmwF1No/AXv9/jBkKpGQbA9765fnYN
 roMUEnt6m51nW5mBYSiKSq0L344HSM0+JjTZKEF3sEGpZ+a3szkxSOyH6d0bECd+nROG
 i0CYYyxmKFhiXwe3YOElA4uTMqm8ei1nxBSYl+LMtDK71FAMZQLUJ1FDnznht/rT4szz
 YiWHjvpKC+450hA717bgwZGPDG56yeVeyM5vDOry/O1agTC6L/SKY9iPnQPBoIB6QPAC
 f3KfATvrq/+a+iTIX+ycxmo9Qd7zLfKYdXrXbQK7SJ+XDT2/lkzqipkH9Ta7oSfmoPFs
 b+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZMpBS0TDGW/H24X/8kI4HLy6YpFjlJ4x4xg0MFEc8rs=;
 b=ZwN4gWS00KghQmyBRW5wW+JBTwlP+FMx3o7HXOIY+v8I0h0HxRtGmWfB7X34N8lVPd
 bSQFjYkmhpMj68YbQK0SblIAe2+vM9SO6KWMadHqkWlen8nbZ8waw3S2B2l1HXdp6fAM
 KULn0XVGuc6CNAbgByYxXoPCRoHFF+uQefT2TPCGkq+d4ylMqiPV02JqRzgZBwGaB3MY
 Fncr1UgZav8ugQRPP40mzfGrh46OA1HpJifoFNpAF4IA64Z6ko/wdhvSTbd9QeVH6ik+
 Bw4ospqbMULFu2pHgCey4taQ0YIQZin6Wj7KMxsUR6FKKGzeDAz+iv8ySYPvjNfJGIva
 pZbw==
X-Gm-Message-State: AOAM5327cK8SbhBHlXIiVsnIhYL4NbC7r12f065kpD49lpmueA22gLm3
 3wy188dam27Ac0sklvgQgDifndydQFdMyBJCM8OoJKKuYZZspg==
X-Google-Smtp-Source: ABdhPJxF+GnpBl/wJVrJgixICHZeCPjWEKjRgdVtx1+nVXswDHBvQR/p8NAkY2ob3jQVBol9jrXByTt+HrhlfRtr0MU=
X-Received: by 2002:a81:ad1e:: with SMTP id l30mr4739488ywh.151.1644451429243; 
 Wed, 09 Feb 2022 16:03:49 -0800 (PST)
MIME-Version: 1.0
References: <CACxmPJNO=1yMa7dWvSAP1hHasWxCkvMmctBk1QFkjqZJdDNSAQ@mail.gmail.com>
 <28950C51-9A48-47BB-BB6F-5E580F0A4516@stwcx.xyz>
In-Reply-To: <28950C51-9A48-47BB-BB6F-5E580F0A4516@stwcx.xyz>
From: Gaurav Gandhi <gauravgandhi@google.com>
Date: Wed, 9 Feb 2022 16:03:38 -0800
Message-ID: <CACxmPJMfrWw=n4f=DxJA4Heh9UdDzrWjhBw2pNYxuZVUZ51cHw@mail.gmail.com>
Subject: Re: Use ObjectMapper in Dcmihandler for PowerCap interface
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000004aceea05d79eaf81"
X-Mailman-Approved-At: Fri, 11 Feb 2022 13:16:37 +1100
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
Cc: vernon.mauery@linux.intel.com, Ed Tanous <edtanous@google.com>,
 rushtotom@gmail.com, Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000004aceea05d79eaf81
Content-Type: text/plain; charset="UTF-8"

Hi Everyone,

Currently in dcmihandler object path
<https://github.com/openbmc/phosphor-host-ipmid/blob/4cc61e0e99c9014d2e8d8b25ec52b71c3c4e405b/dcmihandler.cpp#L25>
 for PCAP_INTERFACE
<https://github.com/openbmc/phosphor-host-ipmid/blob/4cc61e0e99c9014d2e8d8b25ec52b71c3c4e405b/dcmihandler.cpp#L26>
is hardcoded to get settings service. It was discussed earlier in this
review
<https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/46157>
that
this needs to be more dynamic.

Currently I have 2 options to resolve this:

1. instead of getting a specific service
<https://github.com/openbmc/phosphor-host-ipmid/blob/4cc61e0e99c9014d2e8d8b25ec52b71c3c4e405b/dcmihandler.cpp#L74>
with
a hardcoded path, set/getPcap should call getAllDbusObjects
<https://github.com/openbmc/phosphor-host-ipmid/blob/4cc61e0e99c9014d2e8d8b25ec52b71c3c4e405b/libipmid/utils.cpp#L270>.
This will give an object tree and we have to iterate through all the
objects implementing the powercap interface. I am not sure if this is safe
to do so. Need input from the maintainers.

2. Another option is to add a compile time flag to select a path.

Please let me know what you think.
-
Thanks,
Gaurav

>

--0000000000004aceea05d79eaf81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Everyone,<br></div><div class=3D"gmail=
_quote"><div class=3D"gmail_attr"><br>Currently in dcmihandler=C2=A0<a href=
=3D"https://github.com/openbmc/phosphor-host-ipmid/blob/4cc61e0e99c9014d2e8=
d8b25ec52b71c3c4e405b/dcmihandler.cpp#L25" target=3D"_blank">object path</a=
>=C2=A0for=C2=A0<a href=3D"https://github.com/openbmc/phosphor-host-ipmid/b=
lob/4cc61e0e99c9014d2e8d8b25ec52b71c3c4e405b/dcmihandler.cpp#L26" target=3D=
"_blank">PCAP_INTERFACE</a>=C2=A0 is hardcoded to get settings service. It =
was discussed earlier in this=C2=A0<a href=3D"https://gerrit.openbmc-projec=
t.xyz/c/openbmc/phosphor-dbus-interfaces/+/46157" target=3D"_blank">review<=
/a>=C2=A0that this needs to be more dynamic.=C2=A0<br><br>Currently I have =
2 options to resolve this:<br><br>1. instead of getting a specific=C2=A0<a =
href=3D"https://github.com/openbmc/phosphor-host-ipmid/blob/4cc61e0e99c9014=
d2e8d8b25ec52b71c3c4e405b/dcmihandler.cpp#L74" target=3D"_blank">service</a=
>=C2=A0with a hardcoded path, set/getPcap should call=C2=A0<a href=3D"https=
://github.com/openbmc/phosphor-host-ipmid/blob/4cc61e0e99c9014d2e8d8b25ec52=
b71c3c4e405b/libipmid/utils.cpp#L270" target=3D"_blank">getAllDbusObjects</=
a>. This will give an object tree and we have to=C2=A0iterate through all t=
he objects implementing the powercap interface. I am not sure if this is sa=
fe to do so. Need input=C2=A0from the maintainers.<br><br>2. Another option=
 is to add a compile time flag to select a path.<br><br>Please let me know =
what you think.<br>-<br>Thanks,<br><div><div><div><div><div>Gaurav</div></d=
iv></div></div></div></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"auto"><blockquote type=3D"cite"><div dir=3D"ltr">
</div></blockquote></div></blockquote></div></div>

--0000000000004aceea05d79eaf81--
