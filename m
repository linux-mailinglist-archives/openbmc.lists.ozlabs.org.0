Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0BF480F0F
	for <lists+openbmc@lfdr.de>; Wed, 29 Dec 2021 03:55:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JNwxZ1dDcz307W
	for <lists+openbmc@lfdr.de>; Wed, 29 Dec 2021 13:55:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MPT3HLOQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MPT3HLOQ; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNwx76LNpz2yw1
 for <openbmc@lists.ozlabs.org>; Wed, 29 Dec 2021 13:54:49 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id be32so32739546oib.11
 for <openbmc@lists.ozlabs.org>; Tue, 28 Dec 2021 18:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=qz/iQUWewPgGteOnlHxNUc5Py5kByVnpgqel0XRoRJc=;
 b=MPT3HLOQI0sgSMiejxO0tGJRtkK0Qcgu1Ad3WWUrlHVLec7yXJjiyX4bbXgQCye4HK
 G8AROCoB1igVwOv2uauX+Q+LhpsH12JKHljduxGLS3vbG9ndT1aIKqDnQdD8jU9bE9am
 ySuILWTyOKkyHJHNtxjeBCVDH94IIwh0s5HmyEjictib/b13BLRWyXNO143tFZeW336H
 PqXEjjNJoXRGRfrMZG76ISHchMcBYpbwyQRhOjI06yM2pbewKk6ZXzndkkuMHDr/d1xs
 w1RkCnwWamTtrrTgX3CMx3iueKdDTuZErMp+P7Rh2jgOtI7y4QHGT9zqL2gNetmteMpR
 gJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=qz/iQUWewPgGteOnlHxNUc5Py5kByVnpgqel0XRoRJc=;
 b=nVlJmOnBFtspFoIS0UeiOdHqRMgNssHFqfEjpCuOeOJ1q2F5C6f7XWyZJdM4aTF0lq
 Y4LoQ9Hi349s/sMDxPz6sTcOV8jSlCi+Et4L3BsP25WBWZSnKsCFQolmi+LMHzgXP+Gy
 J4ZWlE4eKa9FO8P8ai84kwbMIBr8g+f9T6Kr+GEU185tNqq2VUt8BY+aiyj4ZwvopW+T
 pyyK8osTA2+gUVmnJv5LmAMj07YWXGF01yqY8XUeM7U7uB0aDp5qVDR1QFhkYlwlscpG
 uWgvstRqw8MNVPpMRx0XaMW0WhRi/myB17T3KXHee2KgBXHBtkFt756oqX0VJQUDlEbE
 UigQ==
X-Gm-Message-State: AOAM532Xm/JVp3AS56vZSPnFvGgfjBWFWaE12nPRcS4vH0yh0UXh9SGw
 kvsUS/aWB5usw79axtxvwASX9HnJUS4=
X-Google-Smtp-Source: ABdhPJxJdS/RwEYORsQjJVw9m7cpEpTfViirCXOtS9vFw1qeNi46sg6fYo0nnuLZ8WTY2klQE8jWZw==
X-Received: by 2002:aca:efc2:: with SMTP id
 n185mr18752395oih.102.1640746486522; 
 Tue, 28 Dec 2021 18:54:46 -0800 (PST)
Received: from smtpclient.apple ([2600:1700:19e0:3310:c78:c461:b21e:323b])
 by smtp.gmail.com with ESMTPSA id g7sm3390706oon.27.2021.12.28.18.54.45
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Dec 2021 18:54:46 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: openbmc gerrit, jenkins and opengrok infrastructure updates on
 Dec 28th
Date: Tue, 28 Dec 2021 20:54:45 -0600
References: <2D95E09C-F2D2-4595-98E9-4ABAB29E5FC9@gmail.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <2D95E09C-F2D2-4595-98E9-4ABAB29E5FC9@gmail.com>
Message-Id: <CC0ABE74-E2DB-4C5C-8E75-831C1C0D1C7C@gmail.com>
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



> On Dec 16, 2021, at 11:21 AM, Andrew Geissler <geissonator@gmail.com> =
wrote:
>=20
> OpenBMC'ers
>=20
> I=E2=80=99m going to plan on doing some OpenBMC infrastructure =
maintenance on Dec 28, 2021. This means gerrit, jenkins, and opengrok =
will all be down for a certain period of time. I=E2=80=99m not much of a =
system admin so I=E2=80=99m not going to provide much of a time table =
other then I=E2=80=99ll do it as fast as I can :). But probably best to =
count on not having these services from 8-5 US central time on that day.
>=20
> I=E2=80=99ll post to the #infrastructure channel in discord when I =
start and end.

Updates complete, let me know if you run into any issues via the =
#infrastructure channel in discord.

Jenkins was updated to 2.303.3
Gerrit was updated to 3.4.3
OpenGrok was updated to 1.7.25

>=20
> Andrew

