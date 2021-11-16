Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0DC453A75
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 20:54:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Htxbc5YgFz2yPd
	for <lists+openbmc@lfdr.de>; Wed, 17 Nov 2021 06:54:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=krKUMcTj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22b;
 helo=mail-oi1-x22b.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=krKUMcTj; dkim-atps=neutral
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtxbC2SRcz2xLJ
 for <openbmc@lists.ozlabs.org>; Wed, 17 Nov 2021 06:54:13 +1100 (AEDT)
Received: by mail-oi1-x22b.google.com with SMTP id u74so920860oie.8
 for <openbmc@lists.ozlabs.org>; Tue, 16 Nov 2021 11:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=JwrN8XTuhFugG0tSBv8dAYpd8lTni7kRkZ8d5N3CwUM=;
 b=krKUMcTjbmgbj4kOTP94xYZM1shxO2ecozzmTsoL2Q18aF9k9rXhr+5KY+uRxhWQ6H
 P/6SfEplAMeTqpkbng1Fw/5SS2sD4u3oheg9nF8rr+hysYhxO5USd2ffGIy+pjhqfIIF
 1JzAoBl7/R0fWxE9dCCpUkvh1EX+PgaWuBkYuk9akGX4BMwCu3Kmj3vmYvmWinzoaelw
 tjfVDfJCu5xAD/Ory5icHygFx7VsCDEzwDkEoZk/0hikLMyNOeWmUF/OOP6gwOhC0ZPR
 XzEJxWgypMPnHdUBrMKmn7djpv223XTn2D0Kl+CBTbwrM08y6ezpw9nyXWIkO21gm1pe
 +Pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=JwrN8XTuhFugG0tSBv8dAYpd8lTni7kRkZ8d5N3CwUM=;
 b=Bs6VIdkRCi4VQW7D2TLH4kkGFHvDyeMdfGuyL+4ytP2pPvKqfmG1Bl0Gj1C0ogtxQw
 JJ32d3WKJD/NN3K8KtmVe+nG/HZK+cR7GU3uVz77wuye16RUtwPqJ+v91xIO5EzRljDa
 fTqx020lyT+uHRlTROvgpMTq+CHkPb8VRUsoKYx2S0rjiXfe7/KootqAE9S5JTGfXHSq
 BhRxLgXyTPh5x5KFIpwUYd0WylL9du5fLWyScsXZAFeZqpiX82qD+anFrmbDnDBpLygy
 1PR4Ip01733rjV557oKsdTZntRmqK9lTGb2yZXVir2krh61hjh9nPJvUcI9vL+QYeFbl
 ns9Q==
X-Gm-Message-State: AOAM533XcfFb2K5CwTyMD2JTJKjsEeq7a3Vyn0pAR2ULfj+APU3ADDr9
 yjs8GJfmKruI0vobYtVE6oE=
X-Google-Smtp-Source: ABdhPJy3k5LRqdiHoG3JduW8L95W/HVqO1Hbg3nXyrUGZvseJOWSNtEGpf7dHbCWIV1jgr/CfP++Dg==
X-Received: by 2002:aca:afc6:: with SMTP id y189mr29752304oie.46.1637092448482; 
 Tue, 16 Nov 2021 11:54:08 -0800 (PST)
Received: from smtpclient.apple ([2600:1700:19e0:3310:1c73:91ab:eff9:a23d])
 by smtp.gmail.com with ESMTPSA id r3sm3652430oti.51.2021.11.16.11.54.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Nov 2021 11:54:08 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: New server added to OpenBMC CI pool
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <20211116000358.GF14774@packtop>
Date: Tue, 16 Nov 2021 13:54:07 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <3252E5FD-67E4-4018-A9E6-1775710F818B@gmail.com>
References: <20211116000358.GF14774@packtop>
To: Zev Weiss <zweiss@equinix.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Edward Vielmetti <evielmetti@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Nov 15, 2021, at 6:03 PM, Zev Weiss <zweiss@equinix.com> wrote:
>=20
> Hi Andrew,
>=20
> A donated server from Equinix Metal is now online and has been added =
as
> a Jenkins node (builder_equinix_c0) in the OpenBMC CI pool.  This adds =
a
> decent chunk of capacity to the pool (it's a 24c/48t Epyc 7402P with
> 64GB of RAM and ~1.2TB of SSD) that should help increase our overall
> throughput on CI jobs.  We'll be providing any required support as
> needed to keep it running smoothly and usefully.

Thanks for the new jenkins node!

>=20
> With the additional hardware now available, it would be great if we
> could get e3c246d4i added to the list of platforms targeted by CI =
runs.

New system has been added to https://jenkins.openbmc.org/job/ci-openbmc/=20=

and other relevant daily jobs. This officially introduces the =
meta-asrock layer
into OpenBMC CI.

>=20
>=20
> Thanks!
>=20
> Zev

