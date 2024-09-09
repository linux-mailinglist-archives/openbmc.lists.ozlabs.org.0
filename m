Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34458971E15
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2024 17:33:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2W7g1Sysz3cGw
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2024 01:33:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725895994;
	cv=none; b=DEmxmYjQMnMYGIETDwsT0kmiylgzJdZ+N7z4yhGWHaA8iEGiBGsUE4SSqF34Sr4Sb8h9tdJphMVnDCIP5/w9XEQVSdkF0boVwOM4rx/GJDUp8zUuc46+6am3JIZrpx6oAANkSsANmp0ZUMojsuM3fK8rS8tq3aNtxV3liQ3KrbiQUabXY1TeuTTrMWV2cHUqfcEcIiX2GZiizUb1rSmIhc4KF9VOuXYmw5nYpEGNp6/zq7Knfus22mg5ioxy9XPlQ91UJO2SajPkAGZMdSyTEk4zqQkM0OrgVp1oXkYVi9jeY8xcnoJs43YzPJf3CUmuDN4Fi8t7RissWQTxPpG3SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725895994; c=relaxed/relaxed;
	bh=mKgNezi0tUMtSyoil72bbtPqoLnJYkEuYnKM1+oFCew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DbtdGL5wPrY0LprYm4btZ/seADC6LShbXhYen0FuFbJLyLUH3VrzipdDddCYy1dvf5t3Tx6HE/8rMRTt+CnPfBult94k30x2+TnfjrZ8ut88EY/WBq7KQToRDADma7t6KEIK2uYuWeyBX9cW6fRaiZgGPg5iyCFknn8puk8BLvAaVW2Fw9Zl6o1U7QvcDcB2Llhd/JMHvp808+VEOpcLhEmLvrZD1WuOB1g/t7zJIeJqxzT7qg7/EC/iMWFblNgWyIdFGaFkHXB77qeKsr54UHQsgpYjSj9N7lB4ky/oNCj80uXTcJlJ63my+x1ehr2bUtmITJEWfcDZ6pm3dG8TuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tanous.net; dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=SH3QrGwN; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org) smtp.mailfrom=tanous.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=SH3QrGwN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2W7Y3xPdz2xLR
	for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2024 01:33:11 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7cb3db0932cso3473969a12.1
        for <openbmc@lists.ozlabs.org>; Mon, 09 Sep 2024 08:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20230601.gappssmtp.com; s=20230601; t=1725895988; x=1726500788; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKgNezi0tUMtSyoil72bbtPqoLnJYkEuYnKM1+oFCew=;
        b=SH3QrGwNO7jOMApqHngeOMwdwCHp1wKziu+M5Q52/kjuSLSbOLWpuANcQr7CMskAge
         IVkI3P/TM9Mm/efE3Gf5K60iU8XUtGXh5bZBpA3oo9GNtevdSIPhF9nB9NHd1soj9COv
         sBuwlaFmjK1rdULQesTTZfk6mglHDYuxwfuLfSYNxPAo2Tqz0nS47cKnwAYgWdqJYjJ4
         E2VRUDGl5oobMJfZpZNef9SPalLskaounVDDTTDvOPuVxedcEYFAgaNxNI8HolotMX9H
         kBNPTTgzTIrCrZ4bg6K07xCamx6cEPnErC4pBgTW/p0yO9RLtJiDnDBjLTBznCFWfC6w
         0EDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725895988; x=1726500788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKgNezi0tUMtSyoil72bbtPqoLnJYkEuYnKM1+oFCew=;
        b=LHzvqy4x6h9iSYaS6tfLtL2nIhn5kpUhNcoxmFIRtqEVA8rN0xP9jRZwjriHY5dJFf
         5ws24GtM5Pcwzh1TKt4LJQvxXVDKn2CvO8nQOIVadDmOJcy6zVxVjo/ljcXlL/LcQi71
         PEKenp/UOcI6o3oojU+hpwbrmaXlqB7Gh8S5LVRTfcxlxyh/2B448lwi6Jz2IOoRJYpn
         QsCLMsXjwwcY/bdY9YhP66185BR4kGItdQt5LrndZE9/U49ib4p4J41CCoXm/B7Hs3Zr
         YUnGbiSeTg3Nq38Ly1HrLqXrW4iaP0YgqZVOJCNzcVpSKgqP4W0osK6vkKPHr7rCcV/F
         Oq7g==
X-Gm-Message-State: AOJu0Yy8Tn62o0J+xfbrj8OZkTEFcI6b5nRjDE99Fi4CrLFZNmXMvBC1
	yTWePWpafEnBUqhs9T9DTlMBUe90pkhO3U6a96P7lFbxW1tL2F7ixYEzdgQDZ14rBidlrtm36Ho
	ya7lY8vNJboTpy6jZ9tiQn96k9j7yWsUOI7mKYXFtHvTaaJIA
X-Google-Smtp-Source: AGHT+IFASO9D24DGT7m2NsaMLFvqA62evmQzA2WotcnkvjeiN1rvR9XQYGyERjQBr2d0ZjISm48wTGcSBG4EydKtsTQ=
X-Received: by 2002:a17:90b:3d0:b0:2d3:bc5e:8452 with SMTP id
 98e67ed59e1d1-2dafd099bcemr8326255a91.32.1725895987814; Mon, 09 Sep 2024
 08:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <ZttaJPIq6-jKt4eu@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZttaJPIq6-jKt4eu@heinlein.vulture-banana.ts.net>
From: Ed Tanous <ed@tanous.net>
Date: Mon, 9 Sep 2024 08:32:57 -0700
Message-ID: <CACWQX81z2ghtwFU90n12DgfFDeecN9tfD1kP=966gAriroKshw@mail.gmail.com>
Subject: Re: TOF elections for 2024H2
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Sep 6, 2024 at 12:38=E2=80=AFPM Patrick Williams <patrick@stwcx.xyz=
> wrote:
>
> Hello everyone,
>
> It is that time again for TOF elections.  The current roll-call is
> available at:
>     https://github.com/openbmc/tof-election/blob/main/2024H2/rollcall.jso=
n
>
> For this half, we have 3 seats up for election.  Currently those are
> held by Andrew G., Ed, and Zev.  As Zev wrote earlier, he does not plan
> on rejoining.
>
> Nominations for those 3 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may be nominated.
>
> Nominations are due by Friday September 20th, 2024.  The election, if
> required, will be held immediately after with more details to follow.

I will nominate myself for reelection.

>
> As usual, disagreements with the rollcall results can be raised to the
> TOF.
>
> --
> Patrick Williams
