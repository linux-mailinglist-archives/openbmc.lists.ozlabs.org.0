Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F03A6C43D8
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 08:11:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhKQN2sHlz3cdV
	for <lists+openbmc@lfdr.de>; Wed, 22 Mar 2023 18:11:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LfxsmvuC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LfxsmvuC;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhKPh3CVgz3cBk
	for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2023 18:10:46 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id z18so9978282pgj.13
        for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2023 00:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1679469043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1XfrWdE7yFJIKQJEKILn1i1+SWDJopZtnpjNgZoguE=;
        b=LfxsmvuCmxzs2aEPcSN5g7q/Cm2IBYAp/DbvGXi13MXNs7WqUZkkgxVGCxL0ECwAt4
         XZmndcNgQ3dGrPzEur37ov1F4TvhVWTWKGW8cyqEGGrsBQoBjxc0wLIubgok4zecUK66
         wykEv5rysm3QteLBUypxa+L6VybbA6O1um/hE51Xa5gfWkjY3Z6vI2mCWXOfbleJmDB0
         uSJhre8lvBHH8cAEwDvWsncdIaUKsMQ7Dd6bR+1tzq9gQCVpeBG27qwpfBSVQqwmJgEL
         WWBxYrj1h4+Ode3/1hOf0XnTDIPGqwS+D1Ny+Fg4mkORjTiAw4PBzPLmMkEl6u7WhUMk
         u2cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679469043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1XfrWdE7yFJIKQJEKILn1i1+SWDJopZtnpjNgZoguE=;
        b=hBotanBvtIlbdhs4bYo6VBAlS5JEt2+bkJz5oN2OrGZ+kTd/zvZ41+ABoK/CtkrDjf
         ltZ7w6umvpnvbeG3Kn0gR+7lXxied51BpT0LScoRuaECkhpkZJgXBq5LTNDBeC4kE8LS
         bmr0mbfa1d0gEZMlMmszQG6R4KYAIu7r0BlQgbjBLY5foI6P6bwHa0PHbHtJnCORuky7
         p8bCwdXggwMYjy4jruOR8I9cyHjuAxoF/CU6U+VOrJxdF802I3bZagHt00OMiyzZMbJy
         F6uN5AfzXNk2vUrL4MFzZDrZpoj7bo2znYVZ9/ephJv7XB7mRuTW+C4kYjRlQGQkGHG4
         d4AQ==
X-Gm-Message-State: AO0yUKWJki9RtUL/mN37dtlNwr5DsFF29pX0cqu8wKdybKA+uMONhA1b
	f1hOBdAsp54GRI2AiBr06P8EXhSLjH9fG9a65wJsnA==
X-Google-Smtp-Source: AK7set/P7IXM6437OmDptds4RQgdfMiUw1SBDAInakfS+28P2L72L6Fe/XSWxxEeiWFjWkOgtXIl+B2GMZItb9tiYw0=
X-Received: by 2002:a05:6a00:1791:b0:624:3ff:db10 with SMTP id
 s17-20020a056a00179100b0062403ffdb10mr1304173pfg.5.1679469043005; Wed, 22 Mar
 2023 00:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <07621845-19a4-0568-be0e-f556ba40b813@amd.com> <ZBmJpxTnEVVpfsz2@heinlein.taila677.ts.net>
 <255d7c9a-ce17-bbe1-7312-990d0221cf36@amd.com> <CAK7WosjjdVwNqSwkY2mxYhgAeKdwigtyLryTfJ9r6ShjfbRuCA@mail.gmail.com>
 <65515592-8f77-1c8f-731c-165fb833344b@amd.com>
In-Reply-To: <65515592-8f77-1c8f-731c-165fb833344b@amd.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 22 Mar 2023 15:10:31 +0800
Message-ID: <CAGm54UG+S7gFkCaKJm_7PxOCDu0haZ4FWUxj716JBGVY-gaTFw@mail.gmail.com>
Subject: Re: [RFC] BMC RAS Feature
To: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Ed Tanous <ed@tanous.net>, Michael Shen <gpgpgp@google.com>, openbmc <openbmc@lists.ozlabs.org>, dhruvaraj S <dhruvaraj@gmail.com>, Brad Bishop <bradleyb@fuzziesquirrel.com>, Abinaya.Dhandapani@amd.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> > On Tue, 21 Mar 2023 at 20:38, Supreeth Venkatesh
> > <supreeth.venkatesh@amd.com> wrote:
> >
> >
> >     On 3/21/23 05:40, Patrick Williams wrote:
> >     > On Tue, Mar 21, 2023 at 12:14:45AM -0500, Supreeth Venkatesh wrot=
e:
> >     >
> >     >> #### Alternatives Considered
> >     >>
> >     >> In-band mechanisms using System Management Mode (SMM) exists.
> >     >>
> >     >> However, out of band method to gather RAS data is processor
> >     specific.
> >     >>
> >     > How does this compare with existing implementations in
> >     > phosphor-debug-collector.
> >     Thanks for your feedback. See below.
> >     > I believe there was some attempt to extend
> >     > P-D-C previously to handle Intel's crashdump behavior.
> >     Intel's crashdump interface uses com.intel.crashdump.
> >     We have implemented com.amd.crashdump based on that reference.
> >     However,
> >     can this be made generic?
> >
> >     PoC below:
> >
> >     busctl tree com.amd.crashdump
> >
> >     =E2=94=94=E2=94=80/com
> >        =E2=94=94=E2=94=80/com/amd
> >          =E2=94=94=E2=94=80/com/amd/crashdump
> >            =E2=94=9C=E2=94=80/com/amd/crashdump/0
> >            =E2=94=9C=E2=94=80/com/amd/crashdump/1
> >            =E2=94=9C=E2=94=80/com/amd/crashdump/2
> >            =E2=94=9C=E2=94=80/com/amd/crashdump/3
> >            =E2=94=9C=E2=94=80/com/amd/crashdump/4
> >            =E2=94=9C=E2=94=80/com/amd/crashdump/5
> >            =E2=94=9C=E2=94=80/com/amd/crashdump/6
> >            =E2=94=9C=E2=94=80/com/amd/crashdump/7
> >            =E2=94=9C=E2=94=80/com/amd/crashdump/8
> >            =E2=94=94=E2=94=80/com/amd/crashdump/9
> >
> >     > The repository
> >     > currently handles IBM's processors, I think, or maybe that is
> >     covered by
> >     > openpower-debug-collector.
> >     >
> >     > In any case, I think you should look at the existing D-Bus
> >     interfaces
> >     > (and associated Redfish implementation) of these repositories and
> >     > determine if you can use those approaches (or document why now).
> >     I could not find an existing D-Bus interface for RAS in
> >     xyz/openbmc_project/.
> >     It would be helpful if you could point me to it.
> >
> >
> > There is an interface for the dumps generated from the host, which can
> > be used for these kinds of dumps
> > https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xy=
z/openbmc_project/Dump/Entry/System.interface.yaml
> >
> > The fault log also provides similar dumps
> > https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xy=
z/openbmc_project/Dump/Entry/FaultLog.interface.yaml
> >
> ThanksDdhruvraj. The interface looks useful for the purpose. However,
> the current BMCWEB implementation references
> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/log_servic=
es.hpp
> [com.intel.crashdump]
> constexpr char const* crashdumpPath =3D "/com/intel/crashdump";
>
> constexpr char const* crashdumpInterface =3D "com.intel.crashdump";
> constexpr char const* crashdumpObject =3D "com.intel.crashdump";
>
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/=
openbmc_project/Dump/Entry/System.interface.yaml
> or
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/yaml/xyz/=
openbmc_project/Dump/Entry/FaultLog.interface.yaml
> is it exercised in Redfish logservices?

In our practice, a plugin `tools/dreport.d/plugins.d/acddump` is added
to copy the crashdump json file to the dump tarball.
The crashdump tool (Intel or AMD) could trigger a dump after the
crashdump is completed, and then we could get a dump entry containing
the crashdump.


--=20
BRs,
Lei YU
