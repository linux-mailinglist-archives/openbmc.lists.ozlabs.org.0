Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 378E09B3C9D
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2024 22:23:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcmZN2WH2z3bwX
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2024 08:22:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730150569;
	cv=none; b=csHBYcMKGpJmWAmojTN+A3U3jYzZQr6AiUHGB2hwf6Qv41+DsTmEaMmsGD8pl58EZvIMqYiSGyiRIT0ikhWw5IauKS+0hna+nAtLZbSChb7gEdbFgb1mHjrz6qgFJ7f0+HUtKBWfGnrXqFyl9B10MZH9H1SASruafsbwm4jWx68VZO562HahWGGV2e2T4jPsqBh629CpvNif/QwA6PJbroIT6M0YSf2axectNuKZDuPiCmVu+7V9GgqY9Veh4InoUN+80RcZ35rJCuvb1R0eFFHOWVvMinDOhik8swvjmkVE5vzfiIERWpJTWGaW0yplZHHg9FtPoENXiAUF7YKJTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730150569; c=relaxed/relaxed;
	bh=4LYF4JQUPCxk5AMwYLxyRIUO86FBaNeLFxEqS1MJNeI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gaDPj0QSFEAc29BO+IwqOa41JHei7mLWDMk4f73Mgzb9Q8vHL4ZLF+pHP5lI6U0SpH93cqesd6F7LD9p6fDx4NRutcCTC/b7GIpZUVQ8mPQNf5Zd+OxXcM/ID7a8/HpfEsnbOuQfOvGvmBeGKWUDCZ8E0J8VOXWkqEj7JlbtpF4oCxwbyamD+5Zg7XwiIBowOUSS4F+k6jjr1UMlo36YRE+ARNwLBy4do6OWNnSVZtiQLagWrDyiMznYnNhUkAqNZ3ZlIVAiuO9mvxrtJUrsjW4LJ4vzPziyL9fLGeAvdavOBjk799U/qoTjAM0cJGTiCaNsDtAX6OqXwBuT67yW2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=hhWhXp4s; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=richard.purdie@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=hhWhXp4s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=richard.purdie@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcmZF1M9gz2xX3
	for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2024 08:22:43 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43163667f0eso46157405e9.0
        for <openbmc@lists.ozlabs.org>; Mon, 28 Oct 2024 14:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730150560; x=1730755360; darn=lists.ozlabs.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4LYF4JQUPCxk5AMwYLxyRIUO86FBaNeLFxEqS1MJNeI=;
        b=hhWhXp4si2GwJlaLBWYzOGVwasq8x+SPf8SukMhDxzopJ5uMPtk2I2pLqZyybqZYou
         e2qZXU3BdZ9faWq2xWeq+5INyCc51Bf+kRVKn4hc0G8+DP9MEKnicakseICHlfjli9Ba
         eyWGgk20Ego88g4/qIU7GFUQBihlldp2gniWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730150560; x=1730755360;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4LYF4JQUPCxk5AMwYLxyRIUO86FBaNeLFxEqS1MJNeI=;
        b=unGy5yKSvUfmyiLdyD7HKrN4KWECkYqyveIURxUCfhAaRMTkZP1ZFfzsHj69VkV75I
         jlJcuN7eSOjGiTw9lqe7OQC2FbgS1nKM3d6VF4w5HEKaVgeZZPgr2U0cKZ4WL6Ktvq0p
         7EfklNnSAHtR7q137pBbiWnkgaWc89LE4vafxCa77Ugzd6WyesGFDglFkcqQL8teDDwG
         LWSL5PVrymZWkuet91KS+TbtElqokMgeV+BZjG8LRdzCMlYGTbVRND6UuHtbropc7Wg/
         3+x+ChHTg4mxFbo2KGtmMe7NQZZ5xO+tQTGAGi0Hu9mhxLxA4ry1QEa5mOXeRXcZNBg6
         FU4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX67bfrw65uUM8lS3+GXrQVjrbo8ag8bpilal1RTWb71+yEEw/poRUl1crU/xcUz2aQ9SLyD4t3@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwUZWo7f4JsmWWU1hHfmQENunAHOnoh7bEYYLhGrgLsPt+0xV0s
	pwLUAwDTf8mno0sHGMUT3OnHb9apL3AM5lbTcmqvZau0iGAauFwl1HumZFRV5YM=
X-Google-Smtp-Source: AGHT+IGvsaOq9QsiMn83D7TTZlYhj2L9UBtDkjuxdMW022OrwEcDfnBf2UpewniOGwAc8poVyMGhCw==
X-Received: by 2002:a05:600c:5118:b0:431:3a6d:b84a with SMTP id 5b1f17b1804b1-4319ac77f17mr70569505e9.4.1730150559638;
        Mon, 28 Oct 2024 14:22:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c845:97bd:952:5dc5? ([2001:8b0:aba:5f3c:c845:97bd:952:5dc5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935f7213sm122004865e9.32.2024.10.28.14.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 14:22:39 -0700 (PDT)
Message-ID: <2f7e0b23042cb5165000ffa4e55695e66fbac17a.camel@linuxfoundation.org>
Subject: Re: OpenBMC and the Yocto Project
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, openbmc@lists.ozlabs.org, 
 meganlovesopensource <meganlovesopensource@gmail.com>
Date: Mon, 28 Oct 2024 21:22:38 +0000
In-Reply-To: <9c048e8a161e59aece0acec324eeb48291abec8c.camel@codeconstruct.com.au>
References: 	<9939a99a8397f4473f21dd2931a6340ee552df68.camel@linuxfoundation.org>
	 <9c048e8a161e59aece0acec324eeb48291abec8c.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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

Hi Andrew,

Thanks for the reply!

On Fri, 2024-10-25 at 10:46 +1030, Andrew Jeffery wrote:
> On Tue, 2024-10-22 at 21:33 +0100, Richard Purdie wrote:
> > I know OpenBMC uses the Yocto Project and we occasionally see
> > patches
> > from you. Some of the companies involved are Yocto Project members.
> >=20
> > We're working on creating better information about who is using
> > Yocto
> > Project and thought that the BMC use case might make an interesting
> > example.
>=20
> Nice!
>=20
> > =C2=A0I looked through the openBMC docs but couldn't really work out
> > who the right people/group to talk to was about that.
> >=20
>=20
> Posting to the list is fine, though getting in touch with the current
> members of the Technical Oversight Forum is probably the answer to
> your question:
>=20
> https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.md
>=20
> ... we should probably put the email addresses of the members into
> that table.

I was hoping I could find who was interested and then dive into the
detail off list as it didn't seem like the usual kind of content for
this list.=C2=A0I've copied Megan who is working on this from the Yocto
Project side.

I'll use that list as a starting point if I don't hear from anyone
else, thanks. Worse case I can probably find the email addresses from
the archives or from git.

> > Is such a case study something the project would be interested in
> > and is there someone we could work with on that? It should be good
> > PR for both projects.
>=20
> I'm interested in it, at least :)

Great, thanks! :)

> > While I'm here I've also wondered how you're finding Yocto Project
> > and
> > if there is anything we need to discuss. We tend to assume things
> > must
> > be ok or you'd be talking to us but if that isn't the case, let us
> > know!
>=20
> I've Cc'ed Andrew Geissler and Patrick Williams who have been
> battling some turbulence with recent OE updates in OpenBMC.
>=20
> There's a series ending roughly at the patch below that's trying to
> deal with the fallout:
>=20
> https://gerrit.openbmc.org/c/openbmc/openbmc/+/75338


It looks like the new QA warnings/errors, which you're doing the right
thing in fixing and the WORKDIR/UNPACKDIR changes which are a bit
invasive unfortunately. Did you manage to get things working with those
or were there further issues? I'm afraid I don't really understand
gerrit, the UI makes my head hurt!

Cheers,

Richard





