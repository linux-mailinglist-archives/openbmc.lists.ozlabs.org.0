Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64570477A74
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 18:21:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFJn61nf7z3c5l
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 04:21:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qloDR7dv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::236;
 helo=mail-oi1-x236.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qloDR7dv; dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFJmk1Bf8z2ynj
 for <openbmc@lists.ozlabs.org>; Fri, 17 Dec 2021 04:21:07 +1100 (AEDT)
Received: by mail-oi1-x236.google.com with SMTP id be32so37356360oib.11
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 09:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=urogQ56ZJjeQl75eMqfRQefKmu8woJYiJilFmB94dRU=;
 b=qloDR7dvgiatYywMucUQ/SLnVhUz8BfH/8LfvgsBhe5850KeYHRQT+7hekketSDUK2
 QJeNGYPfyHMevfHDxeayRpSTW2Se/GGjlXY/lhLF6jg5aLWwRjlx07N7K7iB2bDi4bvt
 JDXl35Nyf1cGV3b4dRCQvBpLOxNPVu/C/6q5zKyTkAyljjPNnEFm12ZCgpguxWQLvk/B
 PscEbZ0E2PlSi8coC75yJI5u1hRc9H/3YWauYgvZ6ieTi103ogT069sQ9SIKqBVDwT5e
 3kn+48Qs2EWHqf6kMJ7UqWCqMqCCGnlylHtMfdfPCRurwRB0uFtAncd9lzv7iBXK2QF/
 AyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=urogQ56ZJjeQl75eMqfRQefKmu8woJYiJilFmB94dRU=;
 b=mN6bR5HfP9U0hngOPe6rx/cI/JEe1qJBwa/Iy+qFrpitULm3cBg+/m7M4jprRNoX0H
 IAODLEIpOxo29l3o5BB3eaw62F9F6zVxkZmhCl8f33ERllAS4zKrNjf1keutCCQ9sjc6
 nctDyTlE7toq0Ye7dd5uhRIqfCXYqFwFA4Tj2qFykvbc6w6ejicIXLxr5AXag30NEEUZ
 08JKBT1LZkRJTAJQ1WCEKJsA0kvz0Y9TJfSCe1YsXHbP2kvBG+OQuY8shwowTrGYZTpr
 YoQogBAIr1BLUbOOzJxaDwsPFPR71FhUKxJ6Q9QjV1qamDYgeYeMU83amWb9jKPgNpLb
 mHpg==
X-Gm-Message-State: AOAM532qyBmpktq292Ao1+NpQXPB10h/uCAE8ELGSSJyq9eZJ3aDcOrx
 B653WfmveUU4YfauLF7jaFEEztcfcHo=
X-Google-Smtp-Source: ABdhPJwWjy57m+Z7q7vRhK6mmhalS5t1bbANoen2yj00Ugos3EbGRjZTOpvUhqOwB/M6Ed2Z7t2GtQ==
X-Received: by 2002:aca:280d:: with SMTP id 13mr5026388oix.61.1639675264425;
 Thu, 16 Dec 2021 09:21:04 -0800 (PST)
Received: from smtpclient.apple ([2600:1700:19e0:3310:b166:5de8:c429:196a])
 by smtp.gmail.com with ESMTPSA id n26sm1165707ooc.48.2021.12.16.09.21.03
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Dec 2021 09:21:03 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: openbmc gerrit, jenkins and opengrok infrastructure updates on Dec
 28th
Message-Id: <2D95E09C-F2D2-4595-98E9-4ABAB29E5FC9@gmail.com>
Date: Thu, 16 Dec 2021 11:21:03 -0600
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

OpenBMC'ers

I=E2=80=99m going to plan on doing some OpenBMC infrastructure =
maintenance on Dec 28, 2021. This means gerrit, jenkins, and opengrok =
will all be down for a certain period of time. I=E2=80=99m not much of a =
system admin so I=E2=80=99m not going to provide much of a time table =
other then I=E2=80=99ll do it as fast as I can :). But probably best to =
count on not having these services from 8-5 US central time on that day.

I=E2=80=99ll post to the #infrastructure channel in discord when I start =
and end.

Andrew=
