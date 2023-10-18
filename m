Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DABEF7CD381
	for <lists+openbmc@lfdr.de>; Wed, 18 Oct 2023 07:25:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Hv1CJ5bW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9K7627S1z3cCG
	for <lists+openbmc@lfdr.de>; Wed, 18 Oct 2023 16:25:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Hv1CJ5bW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=raviteja28031990@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9K6X45k6z2ys9
	for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2023 16:24:51 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6b1ef786b7fso4638673b3a.3
        for <openbmc@lists.ozlabs.org>; Tue, 17 Oct 2023 22:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697606688; x=1698211488; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PC2OQ6X3B5lfmoiSuAnu7SU7WA0WfdoHop0hbPSjc9A=;
        b=Hv1CJ5bW4ilDp++W3h9Da34+YzYcVnu9c0nTwbb8Xy7uY4dv5nI+hihZ+7bt7Vs7Z6
         4dBIsURyuPaKMgPhkOP8EAIdEOHZFMVGXUAx4EwWuC2LFtfz+75ooIfd5/dmwhit2FKx
         8bX//Y0II1QxWjh5Il6u9TRHl2UEMIx52Itb2GyYAyHpRB2v3I/UbkYkaNz8Q5EYkk/t
         RxNQKZbj6hcDLQZ2iUMOIO4EZ2q4+dbI2tVNfTO+RRaXqeeeyHTolCKi4N/Q5HBw2ySM
         NfsVAf5slqQ8YXNoYkze0HtvvARt62nnee2RQerClSf5JJQnTygtEegfqY7/dKi/ftLu
         djOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697606688; x=1698211488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PC2OQ6X3B5lfmoiSuAnu7SU7WA0WfdoHop0hbPSjc9A=;
        b=KVEPkVZNk1tCgOinx6kLhPkJJSPCiEkFbGVpIq8tOxoTOruwLNxJnIVuz1LTBuQX4b
         aOnzGn0/VVew64g7entCTIO9Hhhyb+e3g5ZBl9dIYJm47fuTbRzHKIaFdcA50bxUKao1
         +8h/tcKH5GeUqkoYHm1Bb3CSniKk8sjzDM0moBI1cKx4e44q7KYxjwpefkQ1KxCSbNsS
         Q6Bbi48SPgXir/6tT3lx1arPzcO6P43QJpEnyQkj6b/9DYgZOf9Ft9rvRQUFtYJDLYZU
         LpSdVuLdNfUEPJPRsiCXuMZgEfCnYzHlAk/YrW6SL3hQGLzjAncmMzE4ayWNANc7tfeR
         ZdLQ==
X-Gm-Message-State: AOJu0Yw42DoeA5KPAcyiuREk4Hmgrp2unWNnqANd4wn0+Gu2r3vd3eJ1
	pDG/ZF8iTnKzxfqRib5GpTop7ahiwW1fuVg4rorOj5fVTV6a5w==
X-Google-Smtp-Source: AGHT+IFDUZ2wxnJN1nov54CtGp1CPT/7v1Y6hfnTBKMJCzNgPmxsCWTOjpjAhCC4wN377xCGhuR+F+HseVrywALTMGc=
X-Received: by 2002:a05:6a21:798a:b0:16b:846a:11b1 with SMTP id
 bh10-20020a056a21798a00b0016b846a11b1mr3888742pzc.32.1697606687910; Tue, 17
 Oct 2023 22:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAM4DKZnvnb=XMvxVhrfE13vvb+braB6J2TOhKMRxm+T09u88Fg@mail.gmail.com>
 <c0dc4e1ff3904a9c8f34c951611d3992@yadro.com> <92860b17-b8b7-411d-a622-7952fd0660dd@gmail.com>
 <1c6a93eade954bfc8c90a186ef903b51@yadro.com>
In-Reply-To: <1c6a93eade954bfc8c90a186ef903b51@yadro.com>
From: raviteja bailapudi <raviteja28031990@gmail.com>
Date: Wed, 18 Oct 2023 10:54:36 +0530
Message-ID: <CAM4DKZ=Tj0ug5gPUat0ULtKeWYXnQbe6tiqnrrWqxwY+s_CPZA@mail.gmail.com>
Subject: Re: Add network RoutingPolicyRules at OpenBMC Networkd
To: Alexander Amelkin <a.amelkin@yadro.com>
Content-Type: multipart/alternative; boundary="00000000000099efb70607f6dbae"
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
Cc: Ratan Gupta <ratankgupta31@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Sunitha Harish <sunithaharish04@gmail.com>, "fercerpav@gmail.com" <fercerpav@gmail.com>, "johnathanx.mantey@intel.com" <johnathanx.mantey@intel.com>, "wak@google.com" <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000099efb70607f6dbae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander

Only one issue we have noticed by supporting per-interface specific gateway
is when same subnet IP addresses configured on both
eth0 and eth1 ethernet interfaces, otherwise don't see any BMC
configuration issues by supporting per-interface specific gateway.

I also agree that in production environments the BMC may not be connected
to the same network segment using multiple interfaces
but when a system with two physical interfaces is shipped, each interface
expected to have link-local IP by default to work independently.
instead of having workaround of disabling linkLocalAddressing on eth1
interface.

This proposal of configuring RoutePolicyRule going to fix the same subnet
IPaddrese configuration issue
for all types of addresses like static, DHCP and LinkLocal address
configuration and this is systemd community suggested solution.

 >With your proposal, as I understand it, you may be solving one part of
the =E2=80=9Cscoped addresses=E2=80=9D problem here, but the rest remains.
can you please mention specific BMC configuration problems which
remains here?

I believe adding per-interface specific needed for BMC

> > I believe this was done purposefully some years ago. @Ravi please share
> the details if you have the history.
>
> I you can provide any rationale for that, I=E2=80=99d be grateful. We=E2=
=80=99ve been
> having all sorts of trouble due to that for quite a long time.
>

Please find discussions  on supporting per-interface specific gateway here
https://github.com/openbmc/openbmc/issues/2671
https://github.com/openbmc/phosphor-networkd/issues/26

Thank you so much for your response

Thanks & Regards
Raviteja

--00000000000099efb70607f6dbae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Alexander</div><div dir=3D"ltr"><br></=
div><div dir=3D"ltr">Only one issue we have noticed by supporting per-inter=
face specific gateway is when same subnet IP addresses configured on both</=
div><div dir=3D"ltr">eth0 and eth1 ethernet interfaces, otherwise don&#39;t=
=C2=A0see any BMC configuration issues by supporting=C2=A0per-interface spe=
cific gateway.</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">I also agre=
e that in production environments the BMC may not be=C2=A0connected to the =
same network segment using multiple interfaces</div><div>but when a system =
with two physical interfaces is shipped, each interface expected to have li=
nk-local IP by default to work independently.<br></div><div>instead of havi=
ng workaround of disabling linkLocalAddressing on eth1 interface.</div><div=
><br></div><div>This proposal of configuring RoutePolicyRule going to fix t=
he same subnet IPaddrese configuration issue=C2=A0<br></div><div>for all ty=
pes of addresses like static, DHCP and LinkLocal address configuration and =
this is systemd community suggested solution.</div><div>=C2=A0<br></div><di=
v dir=3D"ltr"><div><span lang=3D"EN-US" style=3D"color:rgb(80,0,80)">=C2=A0=
&gt;</span>With your proposal, as I understand it, you may be solving one p=
art of the =E2=80=9Cscoped addresses=E2=80=9D problem here, but the rest re=
mains.</div><div>can you please mention specific BMC configuration problems=
 which remains=C2=A0here?</div><div><div></div></div><div><span style=3D"co=
lor:rgb(80,0,80)">=C2=A0 =C2=A0</span></div><div>I believe adding per-inter=
face specific needed for BMC=C2=A0</div></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);pad=
ding-left:1ex"><div class=3D"msg6388502251262151386"><div lang=3D"RU" style=
=3D"overflow-wrap: break-word;"><div class=3D"m_6388502251262151386WordSect=
ion1"><div><p><span lang=3D"EN-US">&gt; I believe this was done purposefull=
y some years ago. </span>
@Ravi please share the details if you have the history.<u></u><u></u></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I you can provide any rationale=
 for that, I=E2=80=99d be grateful. We=E2=80=99ve been having all sorts of =
trouble due to that for quite a long time.</span></p></div></div></div></di=
v></blockquote><div><br></div><div>Please find discussions =C2=A0on support=
ing per-interface specific gateway here<br></div><div><a href=3D"https://gi=
thub.com/openbmc/openbmc/issues/2671">https://github.com/openbmc/openbmc/is=
sues/2671</a><br></div><div><a href=3D"https://github.com/openbmc/phosphor-=
networkd/issues/26">https://github.com/openbmc/phosphor-networkd/issues/26<=
/a><br></div><div><br></div><div>Thank you so much for your response=C2=A0<=
/div><div><br></div><div>Thanks &amp; Regards</div><div>Raviteja</div><div>=
<br></div></div></div>

--00000000000099efb70607f6dbae--
