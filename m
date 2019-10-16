Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25005D98F4
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 20:16:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tgTS3wwXzDqN5
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 05:15:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12b;
 helo=mail-lf1-x12b.google.com; envelope-from=krellan@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="eD5JQNdH"; 
 dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tgQP42gTzDr4M
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 05:13:16 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id r2so18243118lfn.8
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 11:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2roevbRBHw54cV32ZGk6LIrhEWvTopW7l5l/WXr3B2U=;
 b=eD5JQNdHoK6C14xO85AvTMmYA+JkJt25nkn06u3h01/tT6RWe5dFSaDMQ+J1NC1V82
 17eA/zAiDxsgDfzJ5wGf1kQd7P84h+CKmkEARjfSyzfQpSQBq1fOvcqUoqIevXhDsQ1i
 RVZTGs07nDdbjQ+a/IJ2XVyMOhRcRzS1K8juBhCs1GLYBrLQPYzTTsE2eUYBhZ4ObKDy
 qf/amgif6s5Th4pUD4kIqzhk/CY7LCQ0ZfzgAg3Pg+CVrgXZJ/huGdE9Oka+P+O08wqH
 ZRlQmP0pNMpMg5ik9rsppyFDvT03i5il+TqTIxSb4sxDrpjoGv97i1sDSpQDpWs5kITb
 vcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2roevbRBHw54cV32ZGk6LIrhEWvTopW7l5l/WXr3B2U=;
 b=XYtXdJMJFu82tf3jpKFzwbBkGP6GjkRiovgrDoD1twoioiMcthJYRYvTXngk3+i3aE
 it1SsN803AVwp8p/cbMzrHcv1CtTkHqiDh/gSrdBk9PYucLdkbwZG6rV4Y+RPi/IN0UG
 TdFe0L2skz9FDkfx4L3QV/Ce1i6KVKxgCt3lzI2gtEyRR0T+2vNvJIDmdBpzg6hcFzyZ
 E+vYZQDE6ikJN/5+D3KK8+MkA8sCPrOdKkCLG71Imbcqki3Xk7rwbPCCcskjtri/07Eo
 yEyKAGQXrBWm4ptreGyZR4Dg4wjkmigLy7emutX4gqUESrsprhTjn4J1nCXDjRjZvWgT
 g3Ug==
X-Gm-Message-State: APjAAAXyAjT614FqFQ0XlBHRw3+fW75HAheOFj1QTZcFbKzyreQ/ruuU
 /+U+MI5GL+2A0939vLO7OQeJY6ORW4mwL83/48ocUm8l/Ig=
X-Google-Smtp-Source: APXvYqy47MfMnU2taokU3PTxsEtJjCIlwDJjiwkwD46p0GdGLqkFxMyT+JK4k1tMRHjugpiMSqJefnVk75z2L+VuSGg=
X-Received: by 2002:a19:f013:: with SMTP id p19mr4075942lfc.98.1571249591918; 
 Wed, 16 Oct 2019 11:13:11 -0700 (PDT)
MIME-Version: 1.0
From: Josh Lehan <krellan@google.com>
Date: Wed, 16 Oct 2019 11:13:01 -0700
Message-ID: <CANPkJS9muk9j6whELvOzsqx6-fko8LgpZCmx=aCwqf7Y4g1xWQ@mail.gmail.com>
Subject: Question about Gerrit push certificate indication
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000c808ad05950b0ded"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c808ad05950b0ded
Content-Type: text/plain; charset="UTF-8"

Hi there! I have a question about Gerrit for OpenBMC.

In Gerrit, when I look at a change that I'm the owner of, under the "Owner"
line of the left sidebar, there's now an orange question mark circle. The
mouseover text reads "This patch set was created without a push
certificate".

This started to happen over the last few days. Is this of any concern, or
not? Nothing is wrong with any change I've seen so far, everything still
seems to be working for me.

Thanks!
Josh

Josh Lehan | Software Engineer | krellan@google.com | +1 650-733-8941

--000000000000c808ad05950b0ded
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi there! I have a question about Gerrit for OpenBMC.<div>=
<br></div><div><div><div>In Gerrit, when I look at a change that I&#39;m th=
e owner of, under the &quot;Owner&quot; line of the left sidebar, there&#39=
;s now an orange question mark circle. The mouseover text reads &quot;This =
patch set was created without a push certificate&quot;.</div><div><br></div=
>This started to happen over the last few days. Is this of any concern, or =
not? Nothing is wrong with any change I&#39;ve seen so far, everything stil=
l seems to be working for me.</div><div><br></div><div>Thanks!</div><div>Jo=
sh</div><div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div =
style=3D"line-height:1.5em;padding-top:10px;margin-top:10px;color:rgb(85,85=
,85);font-family:sans-serif"><span style=3D"border-width:2px 0px 0px;border=
-style:solid;border-color:rgb(213,15,37);padding-top:2px;margin-top:2px">Jo=
sh Lehan=C2=A0|</span><span style=3D"border-width:2px 0px 0px;border-style:=
solid;border-color:rgb(51,105,232);padding-top:2px;margin-top:2px">=C2=A0So=
ftware Engineer=C2=A0|</span><span style=3D"border-width:2px 0px 0px;border=
-style:solid;border-color:rgb(0,153,57);padding-top:2px;margin-top:2px">=C2=
=A0<a href=3D"mailto:krellan@google.com" target=3D"_blank">krellan@google.c=
om</a>=C2=A0|</span><span style=3D"border-width:2px 0px 0px;border-style:so=
lid;border-color:rgb(238,178,17);padding-top:2px;margin-top:2px">=C2=A0+1 6=
50-733-8941</span></div><br></div></div></div></div></div></div></div>

--000000000000c808ad05950b0ded--
