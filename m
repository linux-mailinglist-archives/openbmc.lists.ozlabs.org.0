Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1BF629006
	for <lists+openbmc@lfdr.de>; Tue, 15 Nov 2022 03:49:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NB9cy696yz3cFZ
	for <lists+openbmc@lfdr.de>; Tue, 15 Nov 2022 13:49:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DwiJTqnt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2f; helo=mail-vk1-xa2f.google.com; envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DwiJTqnt;
	dkim-atps=neutral
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NB9cN1Rcfz30NN
	for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2022 13:49:07 +1100 (AEDT)
Received: by mail-vk1-xa2f.google.com with SMTP id r13so5948827vkf.2
        for <openbmc@lists.ozlabs.org>; Mon, 14 Nov 2022 18:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r30g9wacH6FKiUZOX/lwT0jUb2YsieehIeMCec9KMxs=;
        b=DwiJTqntgOHoMBPiP4OupkNfRkw/K4BFWAdqdph/0kI2m6ejViurK1oMiFNB70t6ej
         AdXt4BXixcPDKKIIRnTtSqHuL19kVNYNtUVQF8czfQQ5M7+78uUIa7zHHlwDjOyN69da
         XZ8FPVyZee/EZI3vTotmbCK6HfI5vScCpU+Lb0cBKaw+U7onHMpkhNPB7tfGfkBgCakf
         VThorGSBy3+7RyKpJSHTvV1iLg2M+Kz2mzuKggIi8kjHPngi/Xe5ldJNhXHuCRPy00EC
         Nk+ja5TWLc+JVxKQbr49FmH0NA1gI4XV/J4qsI7mh8y0XWHxuxtTT3c/7ZqTLWtIzUXq
         5iDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r30g9wacH6FKiUZOX/lwT0jUb2YsieehIeMCec9KMxs=;
        b=dYeSe8dQ2meX1Q5jJ/g50pvycIvN5Zvphxb16knB5TekX3WFurbmz2SzjZ9DkrIPSR
         vU2bG5I+VxaL+6/aMXHxWNJ0NsMyyoORn4cHDk9OPL70euzhauONxb3nJBpxokYVFgQb
         vyh0mhP5+nmj15gichzEdIbGQoJsr5YAx82sGk8nBP08ZH+2bX1jRI/AdEkfxBPPY74N
         /RVwSI/KZ9fUIBDwBQpJl8ELPNBL2ygNcPOgd3wELIjeSAkiHPDaPizZ7+RylqUYFIgs
         WwXuQ6w0h7e7UiagEReZknxTme+asfGCaq8DZR5GVfChU6gJFvnG7ULpGetTa6fCN8EZ
         oeIA==
X-Gm-Message-State: ANoB5pkhLxCGN/Pwfi0F02wzwolu6RXuDL3fQMfeSdpEBfdRLrJhKuMK
	A/RXvDE2UUj+ghEWwt1A+Gq0y/571p2AJEWWm/I=
X-Google-Smtp-Source: AA0mqf6YuaqR2WJbeE9dp4k5Opkxl2QmRmqkFpdW/b7wGzlYM1Ttnhknar/fhFOtIjynVSUeAGVv6d+FhBY5nFry+sA=
X-Received: by 2002:a05:6122:c8:b0:39e:b8b9:7a6a with SMTP id
 h8-20020a05612200c800b0039eb8b97a6amr7715609vkc.23.1668480542995; Mon, 14 Nov
 2022 18:49:02 -0800 (PST)
MIME-Version: 1.0
References: <73130EC5-5B2A-4E79-9AAD-88D26C61D71F@gmail.com>
 <3d8ca8ab-56a3-4ad7-8b34-d97f50ae0d81@app.fastmail.com> <29D5789F-0412-4B5F-AA56-356B6D458E23@gmail.com>
In-Reply-To: <29D5789F-0412-4B5F-AA56-356B6D458E23@gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 15 Nov 2022 10:48:51 +0800
Message-ID: <CAARXrt=Dp6DfznwF+61K25W-mSiUKnpqBz2v_2RiH=7GSXBbfQ@mail.gmail.com>
Subject: Re: obmc-op-control-power_git.bb refactoring
To: Andrew Geissler <geissonator@gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 15, 2022 at 3:49 AM Andrew Geissler <geissonator@gmail.com> wro=
te:
>
>
>
> > On Nov 10, 2022, at 5:41 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > On Fri, 11 Nov 2022, at 07:29, Andrew Geissler wrote:
> >>
> >> Here's what I'm thinking:
> >>
> >> Move these services to PSM and rename them as follows:
> >> - op-power-start@.service -> phosphor-power-start@.service
> >> - op-power-stop@.service -> phosphor-power-stop@.service
> >
> > This isn't terribly constructive but I feel like given s/op-/phosphor-/
> > results in names like 'phosphor-power*' it's going to be confusing with
> > respect to the existing phosphor-power subproject.
>
> Yeah, good point. We have another naming convention on some service
> files, =E2=80=9Cobmc=E2=80=9D, so I=E2=80=99ve put that up instead of =E2=
=80=9Cphosphor=E2=80=9D for the service
> files in question.
>
> Here=E2=80=99s all the reviews for anyone interested:
>   https://gerrit.openbmc.org/q/topic:op-power-control-ref
>
> Need to merge the phosphor-state-manager changes first and then
> I can officially put the openbmc/openbmc changes up for review.
>
> >
> > Not sure how to fix it though.
> >
> > Andrew

There are several situations for now:

* There are a set of `obmc-host-[start|stop|...]` and
`obmc-chassis-[poweron|poweroff|...]` targets
* Now we will have `phosphor-power-xxx` services as proposed by this change
* For intel-x86 systems, it removes all the host/chassis related
targets in meta-intel-openbmc/meta-common/recipes-core/systemd/obmc-targets=
.bbappend
* I am not sure how amd-x86 and arm systems handle the targets.


The targets and services are a bit confusing, especially for different syst=
ems.

Hopefully we could get a better naming convention so that we do know
which are generic and which are platform specific?
