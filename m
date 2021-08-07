Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FE73E328E
	for <lists+openbmc@lfdr.de>; Sat,  7 Aug 2021 03:17:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GhPZz2t4Nz3bWc
	for <lists+openbmc@lfdr.de>; Sat,  7 Aug 2021 11:17:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YRI1emvd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YRI1emvd; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhPZh1lTtz309w
 for <openbmc@lists.ozlabs.org>; Sat,  7 Aug 2021 11:16:59 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id az7so11905123qkb.5
 for <openbmc@lists.ozlabs.org>; Fri, 06 Aug 2021 18:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hOhtY5qQm4lNFBZ6/evAORsn1EJl4UGlovMLqYOiki4=;
 b=YRI1emvdhEgXfNcT/jMgQnO/U/EH70jAqi/lg3i8nQpHxc1Q60851XMJ46BsIAPvi5
 ei9ONoB48Qaia/Pl6uT5GK/sC1+CvqNdDPCT3Me70LvHMkSWXY9fsVxsEuEFS7M521ua
 6q9tnpKp4ioER25KrEWcyxI58T0tgPgNzET3dzviUwPXNEaxrRWRGVSkFVGYFdUufFaq
 YZqjdBHco3HJ5U3zpdpUvGqhZn8xGTg21V0AZBu64XhWbggNYMfH6OCJluR3qeE0Rzpj
 gl2RctSR2T5H9lEJpMiqIDKSmDZnCJn2pmG0lr3dWgh49po4qOwdbsT9seZecjKBJq9I
 mNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hOhtY5qQm4lNFBZ6/evAORsn1EJl4UGlovMLqYOiki4=;
 b=tmU10nZ2DFXy/7ZNylY4mPvQGzeN8Lna8FxP3UxsLDPl23Vm9Y8Rt4N9+Mybi4Va3v
 4XYTdudrxKonfA6xKeqqRw8QE/qeaLa7fnsl7n93ZBduKuDl7iqkL9znPPNHSFVSleSf
 pxIAZ5DNfSn++b7I0fjM2WfyOtKOajhXcbGoyPh+WenO7qvu/q1t6DaZT3oaeFlQhJqo
 V5cw3z2mEONd5Ogtew5ewEul/2pnVwGtUhBr0A6pfbm7HYM6T7xN3bZkXdP3mQQVBA9G
 3wTsOML9fkrnMZXm1XaK/va/ZyIPN0NrZhBVgY5v8+gMGmMjc0zb8dihGOCUHDjGPD2+
 kNsA==
X-Gm-Message-State: AOAM5329UVSUSxl+NASq/Ti4pF1RAGkG+VINjDTJ4oNTRMgAwrHIMdAQ
 v6gt+V6Mi814vvsakPZXGupSMIEXIL9Vx4gjyFU=
X-Google-Smtp-Source: ABdhPJxy1LuuM6NU1lvJs+0ewRmy5Lr+obfyeK3SBqVUChiYlnbzGu4Pfa0jCeFDBAnEArq72uyw/Pvss8HMHVHIK0E=
X-Received: by 2002:a37:8242:: with SMTP id e63mr13182352qkd.294.1628299015308; 
 Fri, 06 Aug 2021 18:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <3403ce92-825e-cbfc-1e53-334765134df5@linux.intel.com>
 <YQ1YAd1SraK9el8x@heinlein>
In-Reply-To: <YQ1YAd1SraK9el8x@heinlein>
From: George Liu <liuxiwei1013@gmail.com>
Date: Sat, 7 Aug 2021 09:16:44 +0800
Message-ID: <CANFuQ7B8P-W1HfM=MoqC0beN75o5+yvEU44qC0X4hzachgj8Kg@mail.gmail.com>
Subject: Re: meta-security and DISTRO_FEATURES
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Bills, Jason M" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Aug 6, 2021 at 11:41 PM Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Fri, Aug 06, 2021 at 09:32:45AM -0600, Bills, Jason M wrote:
> > Hi All,
> >
> > I am getting a warning about meta-security when building:
> > WARNING: You have included the meta-security layer, but 'security' has
> > not been enabled in your DISTRO_FEATURES. Some bbappend files and
> > preferred version setting may not take effect. See the meta-security
> > README for details on enabling security support.
> >
> > I checked in the README and it recommends adding 'DISTRO_FEATURES_append
> > = " security"' to a config file to enable all the security features.
> >
> > I did a quick grep on our layers and don't see that added anywhere.
> > Does anyone know if this is something that we need or want to enable?
> > If so, should we enable it in a common layer or will each individual
> > layer decide whether to enable it?
>
> There is this pending commit to handle it at a meta-phosphor level.  I think
> we're just waiting on a minor spelling fix in the variable name upstream.
>
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/45322

Yup, We have pushed a new patch to fix it.
https://lists.openembedded.org/g/openembedded-devel/message/92437

>
> --
> Patrick Williams
