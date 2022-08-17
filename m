Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C310A597626
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 21:01:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7HRH5H3yz3bnj
	for <lists+openbmc@lfdr.de>; Thu, 18 Aug 2022 05:00:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YsnqBKpb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=nicholas.rivers1984@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YsnqBKpb;
	dkim-atps=neutral
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7HQs6Mhsz3bNj
	for <openbmc@lists.ozlabs.org>; Thu, 18 Aug 2022 05:00:37 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id z20so14422503ljq.3
        for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 12:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=uEHSn/B6OXrLtGy8xTyLvRrXyyvqjUGrn4iVPR6I+F4=;
        b=YsnqBKpb4S4Eo+Hyqfhp8on+fKxChAp8AX2fDY2UaURAS+GM7O5SNDsGfpi8UQ1n1p
         UhqbxJBPkuFwaAkfAbF9HqKljsUWjxgJUiJWslNb/ZjRn9JoSIvjF7fcqpN/h5mlLxob
         SWe7AH5tdvVUH4dikznyQAQfHXnzbTkjxFJ+qiM1gtw7RhRdfypsbhu+QpiM71BzVIzx
         BFENn8SXQunoa9nkZPKDUHE8UAdgyi2dFUG6oPa11eyRuS2l1HQ9P0qUvpdSEb3QS3ru
         UVQ6nCSvlAwQczEewhpomDPhxJMJzhTp6Yu0ImapHzc4I23HRQMfEMQTL0oQ1YDq89wB
         UK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=uEHSn/B6OXrLtGy8xTyLvRrXyyvqjUGrn4iVPR6I+F4=;
        b=wbhwiiAE3fwdwpF1Nd2lYIjcBqVU3enFGEfmJt5UNP05cAmFwmJ2hJF9rFx+lCwbRm
         JVWkoeeJjaOrGOFI7w+LKzCs3TfjUVSbDhuzPFzxA6hQznVdqoy4f+LccP56jZd6rKyd
         eRBElH75WoAVcSmXLdD/FLCZTEcwmIgwYr4c1Bjs2O43XSpxngWyWzoViBBKrRz5I+6z
         ZQ+uU4jnjv0JOPV0Y4ysCpSrvfahLPjzVkt247zow/uOZ9k5UUKiAxo33xd0W2CbVcqp
         WFAWtQTKVtazsbvTWbSUQqhJwuob1VPxT2o0YC5mFCm2uJ/MEFgxvWbCFWZqpPU1it7A
         4OQA==
X-Gm-Message-State: ACgBeo3RBUCIl7OAkuukxNFKs0jWrcK5JTJcgc8sORa9Fxz2CU0KNv1J
	LKYM2TtbFlmLI7n4w5no/xNBGBcqINdZgueibFM=
X-Google-Smtp-Source: AA6agR7fC4aIp21UjFjlDZIw8Hp/9dUXqG0w0g1kDj8QOkYWoNqPZjzemrOtbB3wxVQqiCyBDQup5UrgdlMOqi8ebY4=
X-Received: by 2002:a2e:9c8a:0:b0:25f:84fb:c98f with SMTP id
 x10-20020a2e9c8a000000b0025f84fbc98fmr8763265lji.478.1660762828518; Wed, 17
 Aug 2022 12:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAHzptbK3Aq=O9Frf9rRKJp2czqB=wg3D0d1yAq1ps85KGV=sZA@mail.gmail.com>
 <Yv053wgSmCsLmUpm@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <Yv053wgSmCsLmUpm@heinlein.stwcx.org.github.beta.tailscale.net>
From: Nick Rivers <nicholas.rivers1984@gmail.com>
Date: Wed, 17 Aug 2022 12:00:17 -0700
Message-ID: <CAHzptbKhTMmtDm8YAyAVXAgm_iVC=AK0WfS6cRa1We7ngHfVWg@mail.gmail.com>
Subject: Re: Why do Discord accounts that have sat idle for a while get
 removed from Discord: https://discord.gg/69Km47zH98?
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Aug 17, 2022 at 11:56 AM Patrick Williams <patrick@stwcx.xyz> wrote=
:
>
> On Wed, Aug 17, 2022 at 10:57:23AM -0700, Nick Rivers wrote:
> > Why do Discord accounts that have sat idle for a while get removed from
> > Discord: https://discord.gg/69Km47zH98 ?
> >
> > This doesn't seem in alignment with other community forums.
>
> I'll copy what I wrote on Discord about this earlier today as well:
> ---
> Those accounts are =E2=80=9Cremoved=E2=80=9D in the sense that they don=
=E2=80=99t show up on the
> active members list but nobody is kicked/banned.  You should be able to f=
ollow
> the permanent invite we have and reactivate.
>
> We=E2=80=99ve had a problem with people [accidentally] creating multiple =
accounts
> with the same name, which can make it difficult to @ the right person.  D=
iscord
> has an easy way to have the server prune anyone which hasn=E2=80=99t used=
 Discord in
> the last 30 days and I enabled that option, primarily as a way to prune t=
hose
> duplicate accounts.
> ---
>
> So, if you haven't opened the Discord application on any device in the
> last 30 days, there is a chance you will get pruned.  Just follow the
> link and you will get re-added.
>
> --
> Patrick Williams

And I responded with:
Thank you @stwcx for the explanation of the problem and why this is a
reasonable solution. Sorry to have troubled you with minutiae.

Again thank you Patrick!
