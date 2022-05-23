Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 511FD5306C8
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 02:07:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L5yLV0t3Nz3089
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 10:06:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=imGrfDyW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=imGrfDyW; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L5yL40MNpz301F
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 10:06:33 +1000 (AEST)
Received: by mail-qt1-x836.google.com with SMTP id 11so9333147qtp.9
 for <openbmc@lists.ozlabs.org>; Sun, 22 May 2022 17:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=p/97n3l8HVNX112FxDHl+YKyu4Pfl7TQTjuiJjD6UCw=;
 b=imGrfDyW6xgzYpSYJ4muNpx1g/2h7q9nv3KKh4BsZqXYMbWDehP56EjbyFAUGfAF5N
 lT40B/Tsc5ANe0tVV7vqvZJl0EmRyT0/IWK48o3iqZ+sBE5I3i3s5mbzNeBUQxBpgP6T
 oKBpZ8hPnf4Y7j1XGcoPtEh3SGtf3nDru6ZnqXrsPHKY/ohXHKksRpbNX8TjRPqVCfmG
 YWG1+h5r/n+J9CuAMTtoKaYYEFHiPVihhYUI5JpW/W3CDyAigDHSLnHw2oCgFK/z6QO6
 wpvKlVtbLqUyldkK+3hmY+VEGfpd634C1OviEF7VhpRHiIzlXmVfIqN5Hk6a1MzNUG5Y
 ZC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=p/97n3l8HVNX112FxDHl+YKyu4Pfl7TQTjuiJjD6UCw=;
 b=JQD8DSQEPRdlhibjnFIsS5+FniywsD/7HqlmmRfLqewkILnmvt5lGOlosEMqIGtzR2
 c6zQfLPaBRExpoLXUOVMB1zGnl4FGtmV6navMqjawrAFeeVupgEL34ZxBMwXMvNJZClc
 meYiRrP5QAoMmES5BBYEChgdIWQA/eVj5utlIepZZehVRzDZB22NQamE1aS1KrgVS3pz
 DRWAMRqj3NhxeEYqgEIf8dKhdZEg5gJNTxQdZzp1qbD7PBHT8iuFyghMNIZ/0X+8k9zQ
 ybuUh65vd61UO/G+Zg83VD652ycQpFNLB8Ih+8E9qLkZr8xGSlOG9HFrxnQMsPOP81rI
 2UbA==
X-Gm-Message-State: AOAM5320cDQAJn094IMtOGGSF/CIsiWTvny3J5nZ7VVxgCIHEVGd+klW
 /TYJabWphxJIHD+9dQKDGxm56HU+dKU=
X-Google-Smtp-Source: ABdhPJxOYU1pGqUw/yNW+ifDlPC5WZnBiW/nQGXZ7QnYLpETCX8uxdNA05dlm4XObopU1xPrY3A1nw==
X-Received: by 2002:a05:622a:1cc:b0:2f3:e619:8088 with SMTP id
 t12-20020a05622a01cc00b002f3e6198088mr14730238qtw.261.1653264389928; 
 Sun, 22 May 2022 17:06:29 -0700 (PDT)
Received: from smtpclient.apple (pool-96-245-108-107.phlapa.fios.verizon.net.
 [96.245.108.107]) by smtp.gmail.com with ESMTPSA id
 cr26-20020a05622a429a00b002f935d30080sm1107357qtb.52.2022.05.22.17.06.28
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 22 May 2022 17:06:29 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Gerrit and Jenkins server transition May 20th (Today)
Date: Sun, 22 May 2022 20:06:28 -0400
References: <E6809659-C4B1-45FF-A19A-3DF59B598F2D@gmail.com>
 <3E12FF01-9770-4281-B3E5-33A62426FF1B@gmail.com>
To: openBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <3E12FF01-9770-4281-B3E5-33A62426FF1B@gmail.com>
Message-Id: <6B50C209-4CB6-40DD-B2A0-50B5B207598D@gmail.com>
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

ok, jenkins and gerrit are back up and fairly functional. Still a few =
kinks
to be worked out in the #infrastructure discord channel. Please report
any issues there or to me on the mailing list.

Autoassign of reviewers does not seem to be working in gerrit so
for now you=E2=80=99ll have to manually add reviewers to new reviews.

I need to work with the Linux Foundation to add a SPF record
for the gerrit.openbmc.org domain to help make the emails not
look like spam to people.

I=E2=80=99ll work on getting opengrok back up and going sometime this =
week.

During this maintenance window I moved the apps to a different server,
I upgraded gerrit and jenkins to the latest stable versions, and I
moved our gerrit server to the gerrit.openbmc.org domain. This way
we=E2=80=99ve now got gerrit, jenkins, and opengrok on the same domain.
The old gerrit domain should still work fine (I just redirect it to
the new domain)

Andrew

> On May 20, 2022, at 8:24 AM, Andrew Geissler <geissonator@gmail.com> =
wrote:
>=20
> Reminder that Gerrit and Jenkins will be down today for server
> transfer and upgrades.
>=20
> I=E2=80=99ll email the list when done. Gerrit may be up for periods of
> time as I test and get it working but no promises on any of
> the transactions done to it today being saved, so best to
> wait for the all-clear.
>=20
> Andrew
>=20
>> Begin forwarded message:
>>=20
>> From: Andrew Geissler <geissonator@gmail.com>
>> Subject: Gerrit and Jenkins server transition May 20th
>> Date: May 13, 2022 at 10:12:22 AM EDT
>> To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>>=20
>> Greetings,
>>=20
>> The current gerrit/jenkins/opengrok software is running on a bare =
metal server
>> which is reaching end of life (it was a great ~5 years).
>>=20
>> A new server has already been created and some basic testing has =
passed.
>> My tentative plan is to take gerrit/jenkins/opengrok offline next =
Friday,
>> May 20th, to do the swap to the new server. This would start around
>> 8:00am US Central time.
>>=20
>> As with all of these types of events, I have no idea how long it=E2=80=99=
s going
>> to take :)  So plan on no access Fri-Sun.
>>=20
>> I=E2=80=99ll send up a follow up email as we get closer and keep the =
Infrastructure
>> channel in discord updated.
>>=20
>> Andrew
>=20

