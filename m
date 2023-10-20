Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC667D7A45
	for <lists+openbmc@lfdr.de>; Thu, 26 Oct 2023 03:42:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NcwPSJ+4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SG7p53FYzz3cNj
	for <lists+openbmc@lfdr.de>; Thu, 26 Oct 2023 12:42:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NcwPSJ+4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2c; helo=mail-vk1-xa2c.google.com; envelope-from=abhilash.kollam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBYlF5dMTz3bhc
	for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2023 16:57:28 +1100 (AEDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-49d6bd360f8so172057e0c.2
        for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2023 22:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697781445; x=1698386245; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xxtSy0i87x+8J2TGPG2PAoA0qXFkUM2T/geMgabrWU0=;
        b=NcwPSJ+41biYIH+jQrLS9ZmNUj70HiDB1wQgu7NPHqH6Q7IUF+k0wPfFRBRvVXQ2Xm
         USJ7Qpep7aUA18sAETj0vWAcFF9HVzaVDpiudptK60xGervNWlDf0gfkV+XT7+FOrDdf
         f8gCqNzuOC4uuWH917uH80ho2lx98OU6fHMGFpZlSeJCMrQeL7HmhGBHDT8fA59QW4te
         CPxs7m8lbEW5N3f395BcI/LQKkm2mYaQGIk/JCy9+nuVIQ59+gRrwnov/EPEQuHrSCYl
         x87U2fPkdKrMp4LD8InNNGDf2sWcN+pb7Ha8gX2EZSGV2sHKfShjTIxI4x4kzM1XgS0X
         0l8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697781445; x=1698386245;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxtSy0i87x+8J2TGPG2PAoA0qXFkUM2T/geMgabrWU0=;
        b=nk7YJ0WtKFA7FiXDOQcdGBP2hXnLimWncUF4IVDQfdHch4yZpCmn7ovIDLjpPc+atD
         CWNRmloMvVN63NHNupgoRxKw7Q2a8xr+gbmiLYP84jqDV5Bpq54vu5O2hAXYxUAxqnB5
         sLKvOPRBa0nsIhlqomHAyz8Aq3EEJf2zljpGb0C5DmdNdEa5TQdXTcKJ+lEdvyKcdE7J
         mpTRmxf10nSnsqyVt/EXo6m7LPI8cYVDPjSOpB0LpIGiMOfDJm+vRJ7hBvO0pHL2v1sW
         xkAvPM2jlH8ofAoWQipkttmuZkw0CbLR82KcwBvOWpwjVpda1rGzH5lR1O+IZfv8MW1p
         QE5w==
X-Gm-Message-State: AOJu0YzSZwDvW023l8ALSpG4cXUPcR3GvznCkPFl0sKBFtMnIzWcYkAr
	OzMMVWDFsFMN66YI6pbzjfKLlQp56dA9kx3TZVdh/RRw1aqa/j/q
X-Google-Smtp-Source: AGHT+IEtel3Tiv0GOcy+GT6OGR8Q75eS1oyIjy9t+OtG6YFexaEvAu+3KFFPRSvAEKiVtRlyDjImhUmI+MyS8iLm3Wk=
X-Received: by 2002:a05:6122:a03:b0:490:e790:a15b with SMTP id
 3-20020a0561220a0300b00490e790a15bmr1021151vkn.10.1697781444972; Thu, 19 Oct
 2023 22:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
 <YJLXlNyk/c8IVf9e@heinlein> <0af0324d-c8a1-4ce8-80c3-f8f846cc930f@gmail.com>
 <ZR_9p11_v5wQAOKB@heinlein.vulture-banana.ts.net> <ub2mniaycgyvj6ujfwytknyvhrscnjgoewxjtvpgq37znlxszf@yzvbxgnre4iy>
 <2736a0cbaf79f00617a8e55a962eea505ac7a7ab.camel@codeconstruct.com.au>
 <dr2sdq6xt52ieidkgdit56uew5bgo2tedlk5e4uee3tobcez3x@t3mhaemftllv>
 <0a4277122b61695d802c25d089533d1bdefe64a8.camel@codeconstruct.com.au>
 <nsa67efkmr5y7v66ox4zcmrqz6h6jewbw47qarad4t32ubnaoh@ayzfcex6kpre>
 <762c3491-93df-4ac4-9a44-a3fb1b448936@gmail.com> <7xefpmuelqu2nv6iwkpaqqgeomdp7ru4uywejmqudeao7f5rbl@hqnhwttquefv>
 <3fbaa94e-391d-4d3a-95fb-259503e94dd3@gmail.com> <7be0e5989986a85748ba2af7e1ee0014a20d658b.camel@codeconstruct.com.au>
 <887cb532-a66a-488e-a238-04a67b1036cf@gmail.com>
In-Reply-To: <887cb532-a66a-488e-a238-04a67b1036cf@gmail.com>
From: Abhilash Kollam <abhilash.kollam@gmail.com>
Date: Fri, 20 Oct 2023 11:27:13 +0530
Message-ID: <CA+ST34Q+qEMZ6XEUP=i+QgRrb_SRgFiFmZAHLgj1Zc56KNeWrw@mail.gmail.com>
Subject: Re: D-bus model proposal for pay for access features - LicenseService
 at OpenBMC
To: Sunitha Harish <sunithaharish04@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000ef1dab06081f8b67"
X-Mailman-Approved-At: Thu, 26 Oct 2023 12:40:51 +1100
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
Cc: raviteja28031990@gmail.com, Ratan Gupta <ratankgupta31@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, gmills@linux.vnet.ibm.com, Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000ef1dab06081f8b67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

By upstreaming license-related code, I believe what we are trying is to
have a frequent rebase with the upstream code base. Right now we cannot
rebase the PLDM code because of it.  Can we separate the PLDM model for
license from main PLDM code base? Can we have redfish implementation for
License in bmcweb and upstream? If we can do both then we can keep the
majority of license-related code downstream. It does not hamper our
rebasing effort as well.

Please correct me if I am wrong.

On Fri, Oct 20, 2023 at 11:12=E2=80=AFAM Sunitha Harish <sunithaharish04@gm=
ail.com>
wrote:

>
> On 20-10-2023 10:36, Andrew Jeffery wrote:
> > On Thu, 2023-10-19 at 15:56 +0530, Sunitha Harish wrote:
> >> More over this new meta-oe work will turn out to be costly.
> > It's a bit of a tangent, but I have to ask: What's the basis for the
> > assertion that adding a recipe to meta-openembedded or some other
> > upstream layer will be costly? That's not at all my experience or
> > expectation.
> >
> > Andrew
> We are not planning to have a license SERVER at BMC, which will
> interpret and process the licenses. There is no usecase for us to do one
> in near future as well. Only need is to add a way at BMC which can
> enable user to upload the license by implementing the LicenseService
> schemas. Considering that, i mentioned that this will be costly for me.
>

--000000000000ef1dab06081f8b67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">





<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-kerning:auto;=
font-feature-settings:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:&quot;Helvetica Neue&quot;;color:rgb(0,0,0)">By upstrea=
ming license-related code, I believe what we are trying is to have a freque=
nt rebase with the upstream code base. Right now we cannot rebase the PLDM =
code because of it.<span class=3D"gmail-Apple-converted-space">=C2=A0 </spa=
n>Can we separate the PLDM model for license from main PLDM code base? Can =
we have redfish implementation for License in bmcweb and upstream? If we ca=
n do both then we can keep the majority of license-related code downstream.=
 It does not hamper our rebasing effort as well.<span class=3D"gmail-Apple-=
converted-space">=C2=A0</span></p>
<p class=3D"gmail-p1" style=3D"margin:0px;font-variant-numeric:normal;font-=
variant-east-asian:normal;font-variant-alternates:normal;font-kerning:auto;=
font-feature-settings:normal;font-stretch:normal;font-size:11px;line-height=
:normal;font-family:&quot;Helvetica Neue&quot;;color:rgb(0,0,0)">Please cor=
rect me if I am wrong.<span class=3D"gmail-Apple-converted-space">=C2=A0</s=
pan></p></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Fri, Oct 20, 2023 at 11:12=E2=80=AFAM Sunitha Harish &lt;<a href=
=3D"mailto:sunithaharish04@gmail.com">sunithaharish04@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 20-10-2023 10:36, Andrew Jeffery wrote:<br>
&gt; On Thu, 2023-10-19 at 15:56 +0530, Sunitha Harish wrote:<br>
&gt;&gt; More over this new meta-oe work will turn out to be costly.<br>
&gt; It&#39;s a bit of a tangent, but I have to ask: What&#39;s the basis f=
or the<br>
&gt; assertion that adding a recipe to meta-openembedded or some other<br>
&gt; upstream layer will be costly? That&#39;s not at all my experience or<=
br>
&gt; expectation.<br>
&gt;<br>
&gt; Andrew<br>
We are not planning to have a license SERVER at BMC, which will <br>
interpret and process the licenses. There is no usecase for us to do one <b=
r>
in near future as well. Only need is to add a way at BMC which can <br>
enable user to upload the license by implementing the LicenseService <br>
schemas. Considering that, i mentioned that this will be costly for me.<br>
</blockquote></div>

--000000000000ef1dab06081f8b67--
