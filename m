Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C949A223
	for <lists+openbmc@lfdr.de>; Thu, 22 Aug 2019 23:25:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DyJ45zsTzDrP4
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 07:25:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="HN5kvOaL"; 
 dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DyHS38w3zDqHq
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 07:25:24 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id w10so4415836pgj.7
 for <openbmc@lists.ozlabs.org>; Thu, 22 Aug 2019 14:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9e58I5AsOz4j+ZzRaF8EBaS3K3IGAWZ3Ff8M+Y9sT3w=;
 b=HN5kvOaLX38aeifoAokkWQg7Jj9QtchenlgHno7paClAOn5dqsao1/Rs0njheRtsum
 5muPkK7mHQQdBusasKUlOAcqEkdfP6j2EhtQ0za9+NP3Rwg6QBaa91dPgNuS+yFdiEZo
 u6CXj5qEo+4lk7iyNJWeA61Bz88buv8RDMCnWyfyhnALurCOfh3QOnj9WXnj1gbiqD+g
 l3ufj+E5B6YgqFX9wl86OZba8LafTGIsQWHonuVi3yJncs69VQ2LjmyEIK7SpwV39nuc
 FNQKLT1/UKYmZBIwl8Mepc30LudULZ26mFx9UshD8qwb43O9Kb7O/6Ri8gVOja/X9qFQ
 WOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9e58I5AsOz4j+ZzRaF8EBaS3K3IGAWZ3Ff8M+Y9sT3w=;
 b=DmyNDhJad1Nc7Ro7C31QM34jcdsl0NTUTejfsMCzVFSsnrfoTpFuXa6B8qxRsfOKoc
 SuLdB2uNudXlqvXyrJDJ+RETB22/GrQH98wTaeZTvRRI/ZbAPECuYM/5U0FAnMv9FzbE
 OWjyVy82pg6+0bKi+dj0bhxCf2eQqFmiMf4sXHyPFlBk7STnUGYddSYXgfK0iHR4j4SV
 E+jmQLllq9ylh4bH/bjU9yC12IJMgNRqUQCMwEAbTNYKOsdsTqtLJ4jSoMTW7gDCzsHC
 6Qa3lskDK11GQCNSQfdFVwJ0GF13DA3WLvWK3gVg5s94tweRdeKzGVywhqUtdcA5PXPf
 h+Hw==
X-Gm-Message-State: APjAAAXO2AOWMj1GDaKdDA19c73p+J//gWyjqUcLLf1bXLwYNW2EMWJs
 i55U+D+AJ/R74bdOHmmVqSBTzAID9+sNv4ov6lalvA==
X-Google-Smtp-Source: APXvYqxcKFsk3iGaJMvvVIbpY9h1IN/GDy1HBjj1TMQmajD7wH6QomBJ8azCrXWUw/0O+aF9ZI0arHfg7Wdt2NpKQiQ=
X-Received: by 2002:aa7:914e:: with SMTP id 14mr1394479pfi.136.1566509120164; 
 Thu, 22 Aug 2019 14:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz7QgiHq-B3Sw0F89YzxK__CuLvn+1DRwwYFoPK-3r5Aw@mail.gmail.com>
 <7990850C-3EDA-42AB-92D4-27DED95F9F53@fuzziesquirrel.com>
In-Reply-To: <7990850C-3EDA-42AB-92D4-27DED95F9F53@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 22 Aug 2019 14:25:08 -0700
Message-ID: <CAO=notx-2N6HjrujB0K6jZwVU_RoNL7kT50UtQaKqByuBUZhTw@mail.gmail.com>
Subject: Re: phosphor-ipmi-host sane entity map
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
Cc: Emily Shaffer <emilyshaffer@google.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Tom Joseph <tomjoseph@in.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 22, 2019 at 2:20 PM Brad Bishop <bradleyb@fuzziesquirrel.com> w=
rote:
>
> at 2:48 PM, Patrick Venture <venture@google.com> wrote:
>
> > With:
> > https://github.com/openbmc/meta-phosphor/commit/fe88ee4211c93f4ca4acba5=
ecec502aef17944ce#diff-0838b00f3d431ade72af266d179a3e70
> >
> > How did you derive the entity record?  I ask because I'm replacing
> > this with json:
> > https://gerrit.openbmc-project.xyz/c/openbmc/meta-phosphor/+/24552
> >
> > And wanted to know if I should use the file you dropped in, or leave it
> > empty?
>
> I assume I am the =E2=80=9Cyou=E2=80=9D here since I authored the commit =
you linked.  Are
> you talking about entity.yaml?  I didn=E2=80=99t actually change the orig=
inal
> content from Jaghathiswari I just patched it in-tree rather than using th=
e
> out of tree mechanism.

:D You are the "you", sorry for not making that clear.

Ok, so it's just an example version, nothing particularly critical.

I know right now if you drop in empty yaml files for the fruread and
sensor, it'll crash ipmid :D unrelated but related.

>
> -brad
