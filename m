Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CB63898B6
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 23:41:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlmX42cSMz301W
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 07:41:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=bcrgcU8q;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32f;
 helo=mail-wm1-x32f.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=bcrgcU8q; dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlmWm1x6lz2yWy
 for <openbmc@lists.ozlabs.org>; Thu, 20 May 2021 07:40:49 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 z137-20020a1c7e8f0000b02901774f2a7dc4so4017481wmc.0
 for <openbmc@lists.ozlabs.org>; Wed, 19 May 2021 14:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t0UoVVa9v5WeAaHYc70rrXPYUepHqCyeVVKP+QZ7qqw=;
 b=bcrgcU8q/G2qyOaVVAyt9VSbjZmRGoiGTn2Yhfcz/W8eevlvjWzSG+/ehxM8vy/oLe
 pZZF2crf3B/bZAAqe+h74iZmiBaP0KVtfZtBIzy0XRdSQxcJ6GQ2m0johy4D4p3ISM0G
 3TbF6Y/btES07k+owvEfBiZLjsj/eKVHbIkgjEzAgcj2fPGGBbtr/Zt9ZsABXtCoGY+i
 HqhqM+mxdlv/2K8GYFu903jKIz/L6a2soUAPbN6uCFiaBWjlsBPIc+v0XKyEYinOd/+z
 zarVF59q9atJuUC0ZHwBUVdHqtd+Vsm90MJRj8LxY+CUaS5l+jTjQFauS/+GcyWvuQYQ
 bmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t0UoVVa9v5WeAaHYc70rrXPYUepHqCyeVVKP+QZ7qqw=;
 b=lyKUiyfxz6WLNLgfDXx4GgLYzkBs0iV8BRlJARFWhliF5V1GC7aJluVSeJGuoxMk9c
 moRKgzza15Jqjci6cYA5/IFhU98rH8aLxtQN1+0IqpRRhp0X/4S+cM1E7MQ7KWZIS1/c
 8Oa6dcV22HgImgqBNm8FcaxLInsUbyb8nv+cpL99TVmBsyl/y6j3xA1cmBofiZgO+GZp
 CaaW2FCwEWHq94P46omAGM2VeKqA0TGnJjQDKTdkBMviaGsPEJVrqyZgx9X/0QorYTik
 Jw80P7b21Cejlt2ywAGwbkyUTuK3wriaWduPRM/2jghRa8N4OOL4kyEt4WsYWRqh34kB
 N9iA==
X-Gm-Message-State: AOAM532scdJ8h6aUpI5+mGFy9mWHOLHRpamVwIXBxkt1O91u/09KOlUk
 8VDPkwDwSWYl3syTO/YphCMB6Ij43/yBaIu5RGMAEQ==
X-Google-Smtp-Source: ABdhPJzxzdvsN42EBqBA0jkMbQrvl1iBR31PRVQV7GIbePGan44lSUSWoN2EutmnWmv8yE2iJ4ztI5LJJcwCnQmyF+8=
X-Received: by 2002:a1c:7313:: with SMTP id d19mr689874wmb.14.1621460445689;
 Wed, 19 May 2021 14:40:45 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB33460E66D59FF4F2DF64CBDDB12B9@HK0PR04MB3346.apcprd04.prod.outlook.com>
 <CACWQX81Xnpmq7x5S2E=wnRfx=0ob_0zfchA7azks=voVqQ9-Rw@mail.gmail.com>
 <CAOLfGj6ApsbrU9YKvQ4N_VFHkC1jZJ3WPDuLo1KwwSoOCp7HGw@mail.gmail.com>
In-Reply-To: <CAOLfGj6ApsbrU9YKvQ4N_VFHkC1jZJ3WPDuLo1KwwSoOCp7HGw@mail.gmail.com>
From: Ed Tanous <edtanous@google.com>
Date: Wed, 19 May 2021 14:40:34 -0700
Message-ID: <CAH2-KxCEV-vJr0kM9DVa3n+V3nayh_Pq0WkGPahqDimqa6ghnA@mail.gmail.com>
Subject: Re: SimpleStorage proposals
To: Nan Zhou <nanzhou@google.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 =?UTF-8?B?SnVuLUxpbiBDaGVuICjpmbPkv4rpnJYp?= <Jun-Lin.Chen@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 19, 2021 at 2:27 PM Nan Zhou <nanzhou@google.com> wrote:
>
> Thanks for your reply, Ed!
>
>>
>> You've also omitted what properties you're trying to target.  Could
>> you walk through a little bit about what you're trying to accomplish
>> with this?  (beyond just "implement the redfish schemas).  Are you
>> trying to get smart data?  just inventory information?  Do you plan to
>> represent connections?
>
>
> As a first step, we are only going to implement three properties, Name, P=
resence, and PowerStatus. We don't plan to represent connections at the mom=
ent.

I'm assuming these will be the dbus properties names, as redfish
doesn't really have a presence property or a powerstatus property.
With that said, that seems reasonable to me to want to do, but we need
to make sure we're clear on how this differs from the existing Drive
interfaces.

>
> On Wed, May 19, 2021 at 1:43 PM Ed Tanous <ed@tanous.net> wrote:
>>
>> On Wed, May 19, 2021 at 12:57 AM Jun-Lin Chen (=E9=99=B3=E4=BF=8A=E9=9C=
=96)
>> <Jun-Lin.Chen@quantatw.com> wrote:
>> >
>> > Hi all,
>> >
>> >
>> >
>> > In order to implement the feature to view simple storage device status=
, such SATA HDD presence status.
>> >
>> > We propose to implement it on the Redfish SimpleStorage URI.
>> >
>> >
>> >
>> > As our proposal for Redfish SimpleStorage, https://gerrit.openbmc-proj=
ect.xyz/c/openbmc/docs/+/43352
>> >
>> > And an new daemon, https://gerrit.openbmc-project.xyz/c/openbmc/docs/+=
/43351
>> >
>> >
>> >
>> > There are two new dbus-interfaces to be proposed,
>> >
>> > xyz.openbmc_project.Inventory.Item.StorageDevice: here is an empty int=
erface just mark the dbus path that SimpleStorage Manager should collect.
>> >
>> > xyz.openbmc_project.Inventory.Item.SimpleStorage: it should have the p=
roperties redfish needs, and can be parser by bmcweb.
>>
>>
>> How does this differ from xyz.openbmc_project.Inventory.Item.Drive?
>> They look fairly similar;  We generally don't name dbus interfaces
>> after Redfish directly.  We should reuse what already exists where
>> possible, and only invent new things where needed.
>>
>> You've also omitted what properties you're trying to target.  Could
>> you walk through a little bit about what you're trying to accomplish
>> with this?  (beyond just "implement the redfish schemas).  Are you
>> trying to get smart data?  just inventory information?  Do you plan to
>> represent connections?
>>
>> >
>> >
>> >
>> > The details are in the proposal.
>> >
>> >
>> >
>> > Welcome and thank you for comments and suggestions
>> >
>> >
>> >
>> > Best regards,
>> >
>> > Jun-Lin Chen
>> >
>> >
