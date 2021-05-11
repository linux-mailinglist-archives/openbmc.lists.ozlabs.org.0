Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA62737B155
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 00:08:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfsVp4pkCz2ysp
	for <lists+openbmc@lfdr.de>; Wed, 12 May 2021 08:08:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PMK8Tvmr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::135;
 helo=mail-il1-x135.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PMK8Tvmr; dkim-atps=neutral
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfsVX6Fvrz2xvT
 for <openbmc@lists.ozlabs.org>; Wed, 12 May 2021 08:07:46 +1000 (AEST)
Received: by mail-il1-x135.google.com with SMTP id p15so18539779iln.3
 for <openbmc@lists.ozlabs.org>; Tue, 11 May 2021 15:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=rvn1IEGB2BarfPzSibp8H0GurJt7Dh35XGouRMwJ+us=;
 b=PMK8TvmrKDh89QvsXRlEbXLHC/6f+PEd7GsZFpsxXbJx3LCZCCDtLBGmYQsJmVLxTZ
 MbXX+PF9DePrvhM5c1/5pamubeGsYkupvhXqaz28uIsGFi+EeE//mcr++z+C471CGREe
 lsjSA774CO4xyGqpGWnJOX4gLLYH5HqIeF0htFapEtrsXq34jlHvRuv6Fb5brPTtXKqU
 7gUi+yVSuf4i352/4Fu04YILSDpB0pc6gcYtSUb5vpbn5BjzKszRopj4mgvd5sLfgCRc
 /iXeqZnOTQXGLTFQufuU24LMhkSaA9wwUrKcczZmYa3M6SYdbolxK3L418XuFIl1Gcr3
 f4NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=rvn1IEGB2BarfPzSibp8H0GurJt7Dh35XGouRMwJ+us=;
 b=mQowZ0eza79xF5EMURpD1gumLr+d5oDCNToTmxlp7YcTSIup549NL6Tdpu+zCQDPiW
 0jmSNJ2NfMtpeX34cFxGSZVkpTVrRwzbLv5oLmK/JlaayUrcN99FlN2LPQ+urmLmDmLv
 63sDVsu0oHlgyIh0h+fRQ2e5TzV4mCeghU6fjcmM2B4V5oYfJxF4vTH+NicPbVleECnT
 xfk6BI/2YU/JU0DSLPyP5v4hNssM+ijHVOCCCsfqlEDhmCWHKJJdyd/cWy/Gm+gsF6i0
 PE7bATBAI3nNwF8VhvWlHNVHCeuqxIvuyjmDQDYqjysdUjNoXFqo1qW+9lrj7z8gfwi3
 GQ2Q==
X-Gm-Message-State: AOAM530wgxF9EMYRTXcWyxqRhjzLbs0AFL8vRWM+XDnU7yJOGESvGYr6
 aGmlLaKK1DD0lE8tN1mie3vfhCTNaEM=
X-Google-Smtp-Source: ABdhPJz2LL3PhdPeBt3niaG8NHQLQcNmdL/BuF4fai9VTfjBb8+gda6Qzc8Sw0o8AdVteXknGnBFbg==
X-Received: by 2002:a05:6e02:1d90:: with SMTP id
 h16mr28437255ila.59.1620770862324; 
 Tue, 11 May 2021 15:07:42 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:a4:25f:a323:2fbb?
 ([2601:281:c001:2359:a4:25f:a323:2fbb])
 by smtp.gmail.com with ESMTPSA id k6sm8263850ior.28.2021.05.11.15.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 15:07:42 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Mike <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: mtools bitbake failure
Date: Tue, 11 May 2021 16:07:41 -0600
Message-Id: <7DA2F1E6-3F2A-44B3-BBB5-94C4B873EEBA@gmail.com>
References: <YJr+rFl5pV3HsDTN@heinlein>
In-Reply-To: <YJr+rFl5pV3HsDTN@heinlein>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: iPhone Mail (18D70)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



Sent from my iPhone

> On May 11, 2021, at 4:01 PM, Patrick Williams <patrick@stwcx.xyz> wrote:
>=20
> =EF=BB=BFOn Tue, May 11, 2021 at 03:55:42PM -0600, Mike wrote:
>> Perhaps tags 2.8 and 2.9 are too old? Both had this problem, but I don=E2=
=80=99t know which version of poky they use. My description above worked for=
 2.8
>=20
> Very few people work off tags and we do not have a committed support
> structure for them.  We barely can get people to raise their hand and
> say they compile for their machine when we go to release them...
>=20
> Unless you have a good reason to work off a tag, I would strongly
> encourage you to work off our master branch for all your development
> efforts.

Ok, my assumption of stability does not hold. Lesson learned.

Mike

>=20
> --=20
> Patrick Williams
