Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A7E559687
	for <lists+openbmc@lfdr.de>; Fri, 24 Jun 2022 11:29:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTsJF2xtqz3cCF
	for <lists+openbmc@lfdr.de>; Fri, 24 Jun 2022 19:29:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Zc6Qvr54;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=ratankgupta31@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Zc6Qvr54;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTsH96qJ9z3bmr
	for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2022 19:28:03 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id cf14so2584054edb.8
        for <openbmc@lists.ozlabs.org>; Fri, 24 Jun 2022 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EKFeHrX7nM7VLvsB+AMf9QiUJfxjBQBbcH3a21sRzM4=;
        b=Zc6Qvr549dSIz4uiOEvouN+iztSB5+02+2H5q/WKzJnf+9DaXan77xoIj2rffCzjZJ
         hH8XQx4kXnRMZdx7ykpjR8tlHjBIhlm5mpgXSGq1S1sZnHqzrFdO2RIlB6pRS3/p4Xyz
         ueM+a/Ktf5pcVhZgGj44wWywYjPM/qiLYo24q6XTPOpgNEvy4qLwW3I4FkfLJtpFXk5j
         qT8IdFhBmz0po47+1arsr9DmqIr5ukLcp0t9NEr8KN8lGPPrYO+ALFh22b+056JlvvDv
         YF7DKLRgOENko/oOD3y9yBk7Sb+Q1OEY5kLGxnRNIlNYGal5Z8zp+K7O9QThI2RZ90lZ
         4ePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EKFeHrX7nM7VLvsB+AMf9QiUJfxjBQBbcH3a21sRzM4=;
        b=LJMAFac6dwsQzp+WL6Xl6+M2LYFilFResfw02qcMETnGNoOS/xrrxzt3lqx6YLREVx
         +QFro8nb1qY4tv/4zJGG5XnOc6t5syRQrB1Uw2iKkbW5vNKfp9gxI13YEIQmssWa3sCm
         eSkvTOCpJMSZSMpY/NP0EnjelppCHezh2tRFZy2Jk7+CwNs2OjPYU/HHCd2zbQjONmT3
         dG7NMITWhgJqdl60ZfR7VdOcCYlhesZgiCbGKXwntKlReuBYOcP77Bax8XT95r2aSPeN
         3tf3/zd2aaDjaJj54jFV7D9AflAMTI5mfMYiuLNoN5gaQGEZJPqxt13kPtEQFwdWFfiU
         J86w==
X-Gm-Message-State: AJIora9hq4GoZHfIhLtASOgsGKO75eVwMv4BIMmQiKMmsxds4YnU7o0i
	I4LLAW44mCYQKKDo5rWGqXTBKxYcCM20prui4cA=
X-Google-Smtp-Source: AGRyM1s9bbgFCmr1sLmJ7/go05F4YrtXGGMLlVcxRz3rD+FYKyHfD4UlySn2TCSOdxm+H3vS4jS5lILo6t3uxHBtuoc=
X-Received: by 2002:a05:6402:27cf:b0:435:dae6:26aa with SMTP id
 c15-20020a05640227cf00b00435dae626aamr7556516ede.323.1656062878636; Fri, 24
 Jun 2022 02:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <4ca4257d-58f1-abc7-a85e-34e9904d4602@linux.ibm.com>
 <bda71881-1a64-ad19-6fb1-fbb328975935@linux.ibm.com> <YrN6lkOgNMNCoJdM@heinlein.stwcx.org.github.beta.tailscale.net>
 <cd907039-8b9e-51b3-a672-c079f3e49233@linux.ibm.com> <YrOUpSSbSjvMkN+m@heinlein.stwcx.org.github.beta.tailscale.net>
 <a136f639-ce78-1958-b1d4-e00e7a81f792@linux.ibm.com>
In-Reply-To: <a136f639-ce78-1958-b1d4-e00e7a81f792@linux.ibm.com>
From: Ratan Gupta <ratankgupta31@gmail.com>
Date: Fri, 24 Jun 2022 14:57:47 +0530
Message-ID: <CAMhqiMoNftcFkRifr3E79O0PT0NCVA08Y=MMTJXe69A8j7C7Bw@mail.gmail.com>
Subject: Re: Security Working Group meeting - Wednesday June 22 - results -
 BMC-attached TPM
To: Joseph Reynolds <jrey@linux.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000009b5e4d05e22e2f34"
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

--0000000000009b5e4d05e22e2f34
Content-Type: text/plain; charset="UTF-8"

Hi Joseph,

Did you check the
https://redfish.dmtf.org/schemas/ComponentIntegrity.v1_1_0.json?

Regards
Ratan Gupta

On Fri, Jun 24, 2022 at 5:48 AM Joseph Reynolds <jrey@linux.ibm.com> wrote:

> On 6/22/22 5:16 PM, Patrick Williams wrote:
> > On Wed, Jun 22, 2022 at 04:23:41PM -0500, Joseph Reynolds wrote:
> >> On 6/22/22 3:24 PM, Patrick Williams wrote:
> >>> On Wed, Jun 22, 2022 at 01:20:48PM -0500, Joseph Reynolds wrote:
> >>>> On 6/22/22 10:19 AM, Joseph Reynolds wrote:
> >>>> 3 Measured boot
> >>>>       Enable network agents (like keylime server, possibly the host
> >>>>       system) to get measurements from TPM.  Note the measurements are
> >>>>       digitally signed by the TPM to ensure their integrity.
> >>> Is there any work going on to define some kind of measurement schema in
> >>> Redfish?  Last I knew this was absent.
> >> Thanks for the reminder.  I started a thread for this:
> >> https://redfishforum.com/thread/685/support-bmc-attached-tpm
> > Sounds good.
> >
> > You mentioned there the "TrustedModules" type.  It doesn't seem like
> > this exposes measurements currently?  Am I misunderstanding?  That seems
> > pretty important for our use case.
>
> Thanks.  I've edited/appended the post to clarify that we need to
> enhance the TrustedModule schema so we can GET the TPM's measurements.
>
> -Joseph
>
>

--0000000000009b5e4d05e22e2f34
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Joseph,<div><br></div><div>Did you che=
ck the=C2=A0<a href=3D"https://redfish.dmtf.org/schemas/ComponentIntegrity.=
v1_1_0.json">https://redfish.dmtf.org/schemas/ComponentIntegrity.v1_1_0.jso=
n</a>?=C2=A0</div><div><br></div><div>Regards</div><div>Ratan Gupta</div></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, Jun 24, 2022 at 5:48 AM Joseph Reynolds &lt;<a href=3D"mailto:j=
rey@linux.ibm.com">jrey@linux.ibm.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On 6/22/22 5:16 PM, Patrick Williams w=
rote:<br>
&gt; On Wed, Jun 22, 2022 at 04:23:41PM -0500, Joseph Reynolds wrote:<br>
&gt;&gt; On 6/22/22 3:24 PM, Patrick Williams wrote:<br>
&gt;&gt;&gt; On Wed, Jun 22, 2022 at 01:20:48PM -0500, Joseph Reynolds wrot=
e:<br>
&gt;&gt;&gt;&gt; On 6/22/22 10:19 AM, Joseph Reynolds wrote:<br>
&gt;&gt;&gt;&gt; 3 Measured boot<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Enable network agents (like keyl=
ime server, possibly the host<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0system) to get measurements from=
 TPM.=C2=A0 Note the measurements are<br>
&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0digitally signed by the TPM to e=
nsure their integrity.<br>
&gt;&gt;&gt; Is there any work going on to define some kind of measurement =
schema in<br>
&gt;&gt;&gt; Redfish?=C2=A0 Last I knew this was absent.<br>
&gt;&gt; Thanks for the reminder.=C2=A0 I started a thread for this:<br>
&gt;&gt; <a href=3D"https://redfishforum.com/thread/685/support-bmc-attache=
d-tpm" rel=3D"noreferrer" target=3D"_blank">https://redfishforum.com/thread=
/685/support-bmc-attached-tpm</a><br>
&gt; Sounds good.<br>
&gt;<br>
&gt; You mentioned there the &quot;TrustedModules&quot; type.=C2=A0 It does=
n&#39;t seem like<br>
&gt; this exposes measurements currently?=C2=A0 Am I misunderstanding?=C2=
=A0 That seems<br>
&gt; pretty important for our use case.<br>
<br>
Thanks.=C2=A0 I&#39;ve edited/appended the post to clarify that we need to =
<br>
enhance the TrustedModule schema so we can GET the TPM&#39;s measurements.<=
br>
<br>
-Joseph<br>
<br>
</blockquote></div>

--0000000000009b5e4d05e22e2f34--
