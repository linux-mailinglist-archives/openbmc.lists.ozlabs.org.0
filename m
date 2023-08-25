Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B8A788187
	for <lists+openbmc@lfdr.de>; Fri, 25 Aug 2023 10:06:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Zht6stL2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXCFb1zdzz3cBV
	for <lists+openbmc@lfdr.de>; Fri, 25 Aug 2023 18:06:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Zht6stL2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com; envelope-from=yulei.sh@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXCDz6Bf8z308K
	for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2023 18:05:38 +1000 (AEST)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1cca7cf6e01so410195fac.0
        for <openbmc@lists.ozlabs.org>; Fri, 25 Aug 2023 01:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1692950730; x=1693555530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6t8GeqLweusrncq/PiPnYokKSRsES+U9OdCdlJvDVFc=;
        b=Zht6stL2KoYvTmDoPdT6rZEE0Cpohxw21Dd13S75HrHhBM6KcaXqia0lJWsq3l+Cxy
         TPF107pAc94S7vHAwiFkhr/1T17IR269DOO+hWP0947kgpf5m4gdyei3X0kQd741YvXD
         030jR6stowan6Q+LGTfHm21A35myoCMDcZrDv1LOXHI8agAVKVPm1/pu7sEhOgCYZcij
         2DxuRkSX/h6yiTE5PToAPv69B2/ZrRSxj9qxxaXAd44BKbYbF8VeeFZOGBH1q0qpleV/
         9K8ndziK4WeaqX/tTUwl+y9S52/7OproqA2056r3dM0/wsP1ubNEMvY5FJ24jqUquQvS
         jANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692950730; x=1693555530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6t8GeqLweusrncq/PiPnYokKSRsES+U9OdCdlJvDVFc=;
        b=beTineoDA7d1cKJ/VYpzdBoxtN5mM/XU+jS7DEH9WzHBu9Em3Jsjq4jLM+0UZboUgk
         C0Aai5FNQSAadPaaXDLnf2HIfLk9R0Y5M/+37/qLPpRr9KS2HE+UiwUy0f+xVu1aw7fq
         H/2G7ZkP90JyqW0BvQCvZwkowrLUGl4FZ64UM11n4awchT1aRiFk/vNC0b4RMVg+Mz+E
         0065MnKBVAPAG7ZO/te+AB91n4KfA5biA92c29ci2sOi84vqFCe8EGrOivKhwdx1ASnb
         0NBrEoGQvMRQ+EuWwXk4kloQCOQ5y2tnws313oPCqIHHkaqrOrgXmpOHJekm1AEoYisO
         KrIg==
X-Gm-Message-State: AOJu0YzYEygZkJPTm/Ad5tRyKtwJsZpY0uTHWKpFZkl56DlBbKeDjBQo
	krIBnuOohzsU9yt3tgxDX+Hwj8vVgl9afzWFGcRPhEkffnC1pxtD
X-Google-Smtp-Source: AGHT+IHzEx3andsKP2hyITocLj395VgZWUbILJiRoxOXXAoHO8b2cmEWV/pLiSHesMX4bLinM/Yi0v00pH5b7VSjRyg=
X-Received: by 2002:a05:6870:ac27:b0:1bf:54b9:800 with SMTP id
 kw39-20020a056870ac2700b001bf54b90800mr2300897oab.59.1692950729711; Fri, 25
 Aug 2023 01:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <ZFLepbxKKXVGAwRB@heinlein.vulture-banana.ts.net>
 <CAGm54UF=8EWwzC0ZONoYFjHV2RagGyNocX3Ob-ftaYACpG9n9Q@mail.gmail.com> <ZFgMJz51IVKzo5IJ@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZFgMJz51IVKzo5IJ@heinlein.vulture-banana.ts.net>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 25 Aug 2023 16:05:12 +0800
Message-ID: <CAGm54UHd5ukn_-n83Ud0RAZeLj_O+CxjXx74F8tKJyRj2j0s+Q@mail.gmail.com>
Subject: Re: sdbusplus updates (client-bindings and namespace)
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 8, 2023 at 4:38=E2=80=AFAM Patrick Williams <patrick@stwcx.xyz>=
 wrote:
>
> On Fri, May 05, 2023 at 05:09:53PM +0800, Lei Yu wrote:
> > On Thu, May 4, 2023 at 6:23=E2=80=AFAM Patrick Williams <patrick@stwcx.=
xyz> wrote:
>
> > >     Interface: xyz.openbmc_project.Object.Enable
> > >     Old Class: sdbusplus::xyz::openbmc_project::Object::server::Enabl=
e
> > >     New Class: sdbusplus::server::xyz::openbmc_project::object::Enabl=
e
> > >     Client Class: sdbusplus::client::xyz::openbmc_project::object::En=
able
> >
> > The previous class was using `Object` but now with the new namespace
> > it becomes `object`, is it intended about the upper-case `O` becoming
> > the lower-case `o`?
> > If yes, why the `Enable` still kept the upper-case `E`?
> > Do we have a rule that all the strings other than the last part should
> > be lower-case?
>
> Yes, this was intentional.
>
> The older namespace code did not apply an explicit style to the
> namespace or server but just used the portions of the interface name.
> We happen to name interfaces in UpperCamelCase.  With the `server` near
> the end, there was no name-identifier collision between:
>
>     * ...Foo -> ...::server::Foo
>     * ...Foo.Create -> ...::Foo::server::Create
>
> By putting the `server` near the beginning you end up with:
>
>     * ...Foo -> server::...::Foo
>     * ...Foo.Create -> server::...::Foo::Create
>

It's noticed that the `error.hpp` is kept and still uses the namespace like
`sdbusplus::xyz::openbmc_project::State::Host::Error::BMCNotReady`, instead=
 of
`sdbusplus::error::xyz::openbmc_project::state::host::BMCNotReady`.

Should we change the error namespace as well to keep consistency?

--=20
BRs,
Lei YU
