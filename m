Return-Path: <openbmc+bounces-1260-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPTaDP8NcGlyUwAAu9opvQ
	(envelope-from <openbmc+bounces-1260-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Wed, 21 Jan 2026 00:21:35 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B32754DB48
	for <lists+openbmc@lfdr.de>; Wed, 21 Jan 2026 00:21:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dwjy252MYz2xqL;
	Wed, 21 Jan 2026 10:21:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::1135" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768937980;
	cv=pass; b=Ts3WmMj9QzMUbNOWsM5Zbyaoubap8+3dr/cC4kvTbIT+OyKYoVdQtdcTNhgPjIl467pAnkTzd/BN7axe2BsrI+aXu7Y6mG3lI7lff2V/YwMAEPaSB/rpjBjxuu7oWDPI7u87dgx8urFf65rDcvm31I3wv8UIFsU1JxGkKCUEckNGHVDDrUQC/5NDu1c7R7abBkjRGQguy5Du2LrERqsvNfaSY22bgh9SuBOENH6urVtCneJi8QlpAl22rLd/iRjCupDBrSXQoNziBmMBZB9s6Rgoa7G2t14c1UgCaKtqVYaNvIJmLFdDJDEzYj6JCuJRgJkb79ZwJWv50n/Ef27flw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768937980; c=relaxed/relaxed;
	bh=C/zphfTB4X5kRLrKJxXPnRK/nQ2NI+GlC/4vHcLAb/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OWzdH0Mx3g76h2PuzHmDeU4ikKrDnKJ0gDXuXBNJiYN4MA/9hn192NpyeMblUufPoZmUCmwLP6Ys+CoPMq4h2zB+Xu6GJdqD8sZeWQ5yyl8JxZykJLdkSnGl0RcB1OG6kZfZIrh1hyjF3vIMnUGCLVFYcnSmBrxt1Xhgo1LWtLqm2lieRfSnFn+lMqzAqbWgihNxRS8JLBB98bIXNkBf+oJ+dWMEquebiSKaLaxQna11/0yrq0gpswvMYocgmsf9Wrcop/ttWxM8+oaY0sCUQ/KrCJNbWAyGka3+5pdr8+acY16Krl2tAh0JJIUgMaty7+klt06Gw2ZNozsNc4bJug==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lfprojects.org; dkim=pass (2048-bit key; unprotected) header.d=lfprojects-org.20230601.gappssmtp.com header.i=@lfprojects-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=CX3WtRwD; dkim-atps=neutral; spf=softfail (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=manager@lfprojects.org; receiver=lists.ozlabs.org) smtp.mailfrom=lfprojects.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lfprojects.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lfprojects-org.20230601.gappssmtp.com header.i=@lfprojects-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=CX3WtRwD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=lfprojects.org (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=manager@lfprojects.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dwd2225GPz2x9M
	for <openbmc@lists.ozlabs.org>; Wed, 21 Jan 2026 06:39:37 +1100 (AEDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-790b7b3e594so54902387b3.3
        for <openbmc@lists.ozlabs.org>; Tue, 20 Jan 2026 11:39:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768937974; cv=none;
        d=google.com; s=arc-20240605;
        b=CCI8Ydwtn6Zo7qGUrd4SoLQc5RZYUk/hLG2pY0l0840im7s8iM/EH2ze2a7tZsGw1r
         DhyIYLw4YlqFj2z54Ran82Ael2drM+uVjmW+DG7m0SI3u7exWWF0Q71XTPuhNh81h6pL
         FDvUODW1SteJg2RY/mYBM2X50wQIqrN3PirDxyVXN3DNBbgOv2Ti/U4eNAzMQxa6k9xj
         kB1zj9INmu7lbPs4LF6ngaRGYSMMEK8gX4kIpCpSrzAs4mN11qzaIBFRoZjR4OwepX6b
         PPk5WxGsm6Md391AsLavkmG/+UClcVbUgxdHoOEc4wXyTaCrxlfFgtikxgaxopthFSES
         fvRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=C/zphfTB4X5kRLrKJxXPnRK/nQ2NI+GlC/4vHcLAb/w=;
        fh=fqs75KMZsr7LK8dA4hTwPjqPKcLXNRA2vTqFHa08EIk=;
        b=Eo3yTjDY4mehPEsyIg1Q+gjpktVo8PbrAhr/Dxi1rI/qeivUa24PJNmFe0+oHMnBBY
         dTdM52YxGxrxVlZCb7JNQCGe4UItg6CEC9dBBxI3hwoKX4Iz1/VTiFZYfEZSEjhWUmYM
         youAvk1ApcpFrWXrvVVXJOjqK+q+XimXMzbz44HGhdm9ARhFQboMqSHrcbc3sgEYIdp/
         JUb8txWXWvR3UldQmaKv6z2RI+3RdiUTEVEGh78Ag2wcJyxdDx7sVlq8fGQD/DsvrQvq
         ka0IGsQCEeZCKC0JbuqEBP4sqsctJqVSTC0BOxzdhx5lWLm0ZW/Ji60WSjn+ZxiYL0FZ
         qo6Q==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lfprojects-org.20230601.gappssmtp.com; s=20230601; t=1768937974; x=1769542774; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C/zphfTB4X5kRLrKJxXPnRK/nQ2NI+GlC/4vHcLAb/w=;
        b=CX3WtRwD260xTE15NtY17VSA5N94r81sHeJogAASA8+udKTVN92xX7bAta5KE4ztw0
         vESlvLj6nuR9xDc2ARZzumGu4zo8lrfhl0VbKrh+sgn0lE7hKIHCviA4a+OwsJzRtKfe
         WQ6CFUjTtyVTrKXvNhsPTApHoF4kRdbwMhRW+f2SZzz7/TcoKoAeYzGKnwEa8mnA4wmj
         qCXlpz3zjz5J7W64MEqZeBFQAMYDHWiAw85TG9uYZyggy/AZZraNRBn6tiv8GnpYHWD3
         dzh+cvXZd9L3VGaZmsrod/a0+PaqcxZnDeQuZ+T4kJFjvnhlW8JzoshQUIuCBnkRnowA
         qpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768937974; x=1769542774;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/zphfTB4X5kRLrKJxXPnRK/nQ2NI+GlC/4vHcLAb/w=;
        b=CF7uTGU46D2CzC9L3LC1gNbH3bYqNRYIvRP2KCVxV1W9qjikzJMnKOg61WnN4SEXLV
         oUeluy0NTSIoX37/iYILCuf+seTaFySE0ZPjRYTH8P2DKdV1W07y/dKueztyIqAMTwaT
         PjfOil8DxrUavsjiN4JvN8aUw3u9nmOxF39i7E+kmZxSwem5IQvmyMzik6u1zvP2Mx5m
         ueis1wZjhgNmikCisovaC62FkHIO7cns6uFqZAaWM8XVhEJcTRr/OC5zknwbaq4ccFTG
         03PAsiUhbZ4/4+o3VlqlzRAtU158rmhauv8OUFuXKgfNDD2ImHhipDDMmKjQIuBPToJS
         p8Mg==
X-Gm-Message-State: AOJu0YzKcEp/FDTn6AWV/qq1bq2zWf80KkEfXbxT7ygo/eN5U1aQZmUC
	11CIHBRmYUkPdbDbKJ0WTw6Jz+IxV6W8BToaeF5qyyXcMwwHn67Ibm+qTIcpytsvGJ+bdI87c7d
	A22j4zsY+TGFsWSipNwi3ymfHcP9ZMMouUQVayRTVuw==
X-Gm-Gg: AZuq6aJXpW9ZcrjAiYLcm6hpgbsZic6HAD7Qmd/2Jekrx15JaJdFs8ggq3fMj3Vi+aN
	oUej9lBEeh3gwo6QphtCOCIucXXqPxyo4IAx4/5ThimsiRULkXzib+H3PI4/M3gu0+Wu/7kBOnR
	blwZFmAb8lPehqcEUu3GjSR01Ne7qWA2CMKZFzU7P2gcuIg/eDMHi5QuNgoPYCb+dhQNgmLZbyp
	knU0XcS3TC9z2W8gpvbkvnE49BP7ieYNTw/I00IYLl6IfTEBLdPy7JGByVMp01QUPzU1XE=
X-Received: by 2002:a05:690e:158a:20b0:644:60d9:865e with SMTP id
 956f58d0204a3-64916526709mr9722126d50.97.1768937973926; Tue, 20 Jan 2026
 11:39:33 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <CAC-r_nQqTUQfmGZYenvpJJHDQ499iDibAg0s2ymcERxfknXZjw@mail.gmail.com>
In-Reply-To: <CAC-r_nQqTUQfmGZYenvpJJHDQ499iDibAg0s2ymcERxfknXZjw@mail.gmail.com>
From: Mike Dolan <manager@lfprojects.org>
Date: Tue, 20 Jan 2026 14:39:22 -0500
X-Gm-Features: AZwV_QhMtVIQh4YzH7clMu0-oNPEZcaU-xJkURhNwDf-QmQknxcGHSAfUpDYLiE
Message-ID: <CALVHhedmzXx4-b9HG=RKf+KpKynjU1kE4DQy1n-SfR7gbqUjRQ@mail.gmail.com>
Subject: Re: TechDesign OpenBmc CCLA
To: alice.lim@design.tech
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="00000000000090d9780648d6f72b"
X-Spam-Status: No, score=1.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_SOFTFAIL,T_FILL_THIS_FORM_SHORT autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-1.60 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[lfprojects-org.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lfprojects.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:alice.lim@design.tech,m:openbmc@lists.ozlabs.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manager@lfprojects.org,openbmc@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-1260-lists,openbmc=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manager@lfprojects.org,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[lfprojects-org.20230601.gappssmtp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo,lfprojects-org.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: B32754DB48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--00000000000090d9780648d6f72b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alice, for our trade compliance purposes, we need to ask for
additional information about TechDesign House d.o.o Beograd.

First, can you provide an official address that is not a rental mailbox?

Second, we have additional questions we will need to review for trade
compliance. Please send the details below.

   - Legal company name
   - Business address
   - National/Tax ID number
   - List of owners and respective percentages
   - List of persons or entities (other than owners noted above) that
   control the activities, policies direction of the entity in question
   (whether by contract, position/office/board seat, or otherwise)


Thanks,

Mike


On Mon, Jan 19, 2026 at 10:10=E2=80=AFAM Alice Lim <alice.lim@design.tech> =
wrote:

> Dear OpenBMC team,
>
> Please find attached signed CLA from TechDesign House d.o.o Beograd.
> We are designing both hardware and software for the server equipment.
> Would love to contribute our findings to the OpenBMC community.
>
> Thank you,
> Alice Lim
>

--00000000000090d9780648d6f72b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Alice, for our trade compliance purposes, we need to ask f=
or additional=C2=A0information about TechDesign House d.o.o Beograd.=C2=A0<=
div><br></div><div>First, can you provide an official address that is not a=
 rental mailbox?=C2=A0</div><div><br></div><div>Second, we have additional =
questions we will need to review for trade compliance. Please send the deta=
ils below.</div><div><ul><li>Legal company name</li><li>Business address</l=
i><li>National/Tax ID number</li><li>List of owners and respective percenta=
ges</li><li>List of persons or entities (other than owners noted above) tha=
t control the activities, policies direction of the entity in question (whe=
ther by contract, position/office/board seat, or otherwise)</li></ul></div>=
<div><br></div><div>Thanks,</div><div><br></div><div>Mike</div><div><br></d=
iv></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, Jan 19, 2026 at 10:10=E2=80=AFAM Alice Lim=
 &lt;alice.lim@design.tech&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr">Dear OpenBMC team,<br><br>Please fin=
d attached signed CLA from TechDesign House d.o.o Beograd.<br>We are design=
ing both hardware and software for the server equipment.=C2=A0 Would love t=
o contribute our findings to the OpenBMC community.<br><br>Thank you,<br>Al=
ice Lim</div>
</blockquote></div>

--00000000000090d9780648d6f72b--

