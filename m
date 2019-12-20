Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFFA128248
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 19:40:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fcyD6S65zDqsQ
	for <lists+openbmc@lfdr.de>; Sat, 21 Dec 2019 05:40:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bYXw20sS"; 
 dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fcxN6xCxzDqsR
 for <openbmc@lists.ozlabs.org>; Sat, 21 Dec 2019 05:40:08 +1100 (AEDT)
Received: by mail-ot1-x334.google.com with SMTP id 19so448430otz.3
 for <openbmc@lists.ozlabs.org>; Fri, 20 Dec 2019 10:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DMk00vjm2845qbnjwUCk1GsmiKJpJ8glZOC1Z0C2mpc=;
 b=bYXw20sSS5CG6AUuq9yBwiN9BtatA1z8q+SWN17b8SiZnhxMYa+HhpT4Ihgpe4XY2S
 26CieLCF6bvj/pazexP3olwAbQfkfzaRR+7GpgkDKPmDUR2jf26ZAgM5cba/gPZ5+b1V
 QAOumO64TlKucJ7CNziWAA9Y8HPTw29mAwQvvxTXBj4fr2jOgSk72NzrE/Qt3SMKL6qs
 S0IHS5eYOt5WeuBTHvou8FTJHVCY9k1GgwzGNSZws0HaxQVv+sLVFCjzy7Xiqkyx6Jik
 skqwAQx9YjJUMUTENy5yg6jIwBmh4oOTRAgDqkK17jZgR+b0JlgHTnBrkHWZFz6F4E8L
 f6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DMk00vjm2845qbnjwUCk1GsmiKJpJ8glZOC1Z0C2mpc=;
 b=qkOypjdBvnyyFpR0OKUSgorw3/lu4n50rs1sVHMT9Z5LgeD8na0qWmHzdpew2yfOMt
 y8rFpoVPb/kct8lvm9NME73M3lp4ThABeVCuyrvNemKu/LqNRQz7qglUPJT9gj1FeVlu
 +aZU/PtQVzdu3hgEW++EMR7HgAT7pTuzWoJhZi47a7OcglWH1mXtneXxWBfmRhBwcG/+
 lGvVhZzvbgF/PfPvX6DKPiUDBgYv3A2nY4kaJWun0xp7ae5wmTzkscwtKu9sFTpmYQA3
 TdS2zKUDvTedvSrf7M0Ph0YZDuz49hKDmJUTbcy92C01tyBCj/PImvj4/nfGeJVARByN
 vWGA==
X-Gm-Message-State: APjAAAXBad5HnzGhSl7H8y+ENUPDLWo+Mz9JLhclG5n5Ty4wEtrD+4WH
 EpIe355jh/SQESppb9EFd+oylAuskHOJJilvAv8=
X-Google-Smtp-Source: APXvYqx4nO3n3p7k/z8iQqUT5TPcdr42nLWUbij1MbsvqH4Afjm0ruWbCyY97zbAOkyZnI19FGPAILXh1pkXmZXcH/E=
X-Received: by 2002:a05:6830:3048:: with SMTP id
 p8mr930314otr.312.1576867205240; 
 Fri, 20 Dec 2019 10:40:05 -0800 (PST)
MIME-Version: 1.0
References: <2153c03a-fd09-fb67-7051-5e889e5d2f8b@linux.intel.com>
 <CAARXrt=wL7ZT=tGzP-DQTgEwiSZOfdQ4n1kvE5oa6HhyPV3UfQ@mail.gmail.com>
 <33a034df-8e29-681e-f83d-aa496f558d4f@linux.intel.com>
 <CAARXrtnL8-zpiL73E5E=q9=WcX_BDa31ZbcThBTNyMr1UF1HpQ@mail.gmail.com>
 <B8C11063-6338-4AC3-892C-701EF7ED077E@fuzziesquirrel.com>
In-Reply-To: <B8C11063-6338-4AC3-892C-701EF7ED077E@fuzziesquirrel.com>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Fri, 20 Dec 2019 12:39:29 -0600
Message-ID: <CAK_vbW1rTmUOLFJARd=OtWX8JVHGOJXA3rEHZ3wj8CpHOHZybQ@mail.gmail.com>
Subject: Re: Power Supply Cold Redundancy
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>, "Yang,
 Cheng C" <cheng.c.yang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 20, 2019 at 7:13 AM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
>
>
> > On Dec 19, 2019, at 10:15 PM, Lei YU <mine260309@gmail.com> wrote:
> >
> > On Fri, Dec 20, 2019 at 10:31 AM Yang, Cheng C
> > <cheng.c.yang@linux.intel.com> wrote:
> >>
> >> Originally, I also thought I may push my code to phosphor-power, but
> >> when I was trying to devtool modify phosphor-power, I found a error ha=
ppen
> >>
> >> ERROR: Nothing PROVIDES 'openpower-dbus-interfaces' (but
> >> /home/cyang29/openbmc-openbmc/meta-phosphor/recipes-phosphor/power/pho=
sphor-power_git.bb
> >> DEPENDS on or otherwise requires it).
> >>
> >> We do not use openpower-dbus-interfaces.
> >
> > Right, that is a problem, and the good news is that Matt is already mov=
ing
> > openpower-dbus-interfaces into phosphor-dbus-interfaces
> > (https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/=
+/27380),
> > so it will be no problem in future :)
>
> This ^ does help but I don=E2=80=99t think its the whole story.  It sound=
s like phosphor-power needs a meson option to turn off its dependency on or=
g.openpower dbus interfaces=E2=80=A6regardless of what repository is provid=
ing those.
>
> Going a step further - what are the org.openpower interfaces that phospho=
r-power depends on anyway?  Can they just be moved to xyz.openbmc_project?
>
> -brad

I am not looking to chase anyone away from phosphor-power, but I do
recall seeing some power supply related commits in x86-power-control,
which seems to be some intel related repository.
https://github.com/openbmc/x86-power-control/commits/master
