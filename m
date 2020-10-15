Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D464628ED2C
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 08:46:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBfvy4h32zDqTy
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 17:46:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2d;
 helo=mail-io1-xd2d.google.com; envelope-from=artemsen@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SDIr5jeq; dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBfv76VxXzDqTR
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 17:46:10 +1100 (AEDT)
Received: by mail-io1-xd2d.google.com with SMTP id r4so3037523ioh.0
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 23:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XN5AovsJpQs63MzQyxZ+cuIQzt83lxuZcIgTj+QvK9A=;
 b=SDIr5jeqmthgeYVBaEcgqbQyDT9YC211KusGFKmH426gJZVwZeqZ7gfhJQyZLC1MTz
 NSrGPEt1upstLaATlCO4XWcoEurMa7OayzGeWu4avfAGbu/MLiTMHkuxujx3TjYRg5q0
 0x0okhfViUlKBnQ99jfJPv8KiDgiWuaULFs+ROgMGzXWUTXKpEWLgalN9s/m5EmiBrpx
 1sqj2H4rF5r4bE3YFVZERbIMC/J1ewaua2zf1iTTJo3IMdaNVcPastkWajt/0VkLdoXP
 tD+/AUZuESsFYwtjrWWnqGoploSftOTN5svDCM+Uk/Z09TPzoYW84wNNhmGEe1ebZnhr
 OGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XN5AovsJpQs63MzQyxZ+cuIQzt83lxuZcIgTj+QvK9A=;
 b=F1CmIy0grcUDe+Pyc+2j5OFLERfpO6mnjULstmFcN6TgvhiUlGOlfEXKky0NMIgwhc
 d910T7kCkjl+uB1dC+caQqs6R4D3ii+f8CFbkukgR3YcGTd4mOQDwtwj3/WzZPzzm73v
 e6WvRma36FNOa9iJyDcgbsNNwrfziysOQmqBdVDLoadiVVXgr/4pSW+/DwfDJroEJIAm
 iD0M4aArpi7yY2jb95A1JaWnilp0VFCEIVT+DZd+7DQV3xtMJsxnfWhuJbrH5hzhRKQH
 QTbOD+g2LEha1AfyXFigvLVlIb/RkAUseXCheRUSpA5ytK85bOT5KK2VqqdVdRRgeqaI
 BO2Q==
X-Gm-Message-State: AOAM532pKPsOFT1xpHtWkyZwRX3LC0Fbp7KclVsmGlCTE3C7KbanF+Dr
 eC5WCyIcVZ9xf4h84HyWxno1KV/eLgF4WxCrfDuKwhvdu40=
X-Google-Smtp-Source: ABdhPJy2zDC1xTHTniLNb4EswmBKPuTeoH4GIQV56pbyf+/dNs2Fza06OfGYDVdlviVWbljiYJ+ReqYFIlVduUcHpPM=
X-Received: by 2002:a02:a196:: with SMTP id n22mr2461013jah.104.1602744366130; 
 Wed, 14 Oct 2020 23:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <4b1c3d6cd2fb42a9b4ca166ac90f9ae9@quantatw.com>
In-Reply-To: <4b1c3d6cd2fb42a9b4ca166ac90f9ae9@quantatw.com>
From: Artem Senichev <artemsen@gmail.com>
Date: Thu, 15 Oct 2020 09:45:54 +0300
Message-ID: <CAHsrh9LOmMvT2Sgo2niSHbJ74b3yf_9UTiaqJxm9MhcXkpv8EA@mail.gmail.com>
Subject: Re: Modify Timestamp of phosphor-hostlogger
To: =?UTF-8?B?U3BlbmNlciBLdSAo5Y+k5LiW55GcKQ==?= <Spencer.Ku@quantatw.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Spencer,

I think it is a good idea.
We didn't have a service to handle these logs, so the short format was
due to the compact display output.

--
Best regards,
Artem Senichev

On Wed, Oct 14, 2020 at 1:36 PM Spencer Ku (=E5=8F=A4=E4=B8=96=E7=91=9C)
<Spencer.Ku@quantatw.com> wrote:
>
> Hi All,
>
> We have worked on a redfish URI that provides host log information, which=
 is based on obmc-console and phosphor-hostlogger. Now we can get host log =
and fill information into host log entry, but here we have a problem about =
timestamp.
>
>
>
> One of the log entry level =E2=80=9Ccreated time=E2=80=9D, need to follow=
 the time format like RFC3339, and for now, the host log only provides hour=
, minute, and second time info. We want to modify the timestamp to RFC3339 =
format to fit the log entry time format.
>
>
>
> Here is a sample host log with timestamp providing by phosphor-hostlogger=
:
>
> [ 00:00:31 ] >>> Log collection started at 1970-01-01 00:00:31
>
>
>
> After modified, the message will be liked:
>
> [ 1970-01-01T00:00:31+00:00 ] >>> Log collection started at 1970-01-01 00=
:00:31
>
>
>
> if the changes make sense, we will push the changes to upstream.
>
> Please let us know if there's any issue, thank you.
>
>
>
> Sincerely,
>
> Spencer
