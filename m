Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D942477B487
	for <lists+openbmc@lfdr.de>; Mon, 14 Aug 2023 10:46:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=QdUK15GA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPSfr4cZ4z3cLV
	for <lists+openbmc@lfdr.de>; Mon, 14 Aug 2023 18:46:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=QdUK15GA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPSfG5mMrz2yVm
	for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2023 18:45:42 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bcfe28909so524509866b.3
        for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2023 01:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1692002738; x=1692607538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lF0+aVPX9FzETFy5GE5qyxC2Vzge1SRxFOG3xm/iMdQ=;
        b=QdUK15GAVEAP3/LggMVZJyLG5XA0fdql5PRZt98cTH7gY0SywH9txaS3pG4epapeJr
         /T/r4ChLblFs2SfdL4u5356hItL2YNIwOH+I7tt/IeNSaI4hgJw3noB2J9LIGdayFneZ
         b7lpgOXNM39ztde/Q2NJxZysnh8uWHIsF9loM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692002738; x=1692607538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lF0+aVPX9FzETFy5GE5qyxC2Vzge1SRxFOG3xm/iMdQ=;
        b=RC9TM7V6Eo9epLmax6gfHAWvoG1hmEd+s+2ivAA3u6aQXIEYHelU4QSSuTPCJLO0nV
         uuqy+96cwUbzafnnUY2HNsR2kQsVbSvHeKNDXs+p+TZ3+dNOtIbmUWEPupA5kQdO1WI0
         iRV0R4Sx9edoDkryb3b98nZBE6pZXDDqUvJULbYtInfktDzVUSKrodvUsfcNyjv0lNVy
         LjTyEooUzXASVqIUsxz30TaLGSeY1StsZovuLlhoB3BU7VlMsa2PnqiquxDiKTJ2OHS0
         J2me6gKY0yNAm62RBzUMUokLRy6JnnOluPS4JBVjh+BeChty0UAS8UwZ3L76Fns3GWMr
         7Gmg==
X-Gm-Message-State: AOJu0YzO2+lN2VtDY1hQdwTQ1/RvY88t55Wgh5kPs1n1saUIryc3VnkQ
	BxXTU7ylVLuZmpmxgZboUuFPXMLJhviq1y8+urw=
X-Google-Smtp-Source: AGHT+IHUeGAbrb6v1aGKa4Fz6B3dvW5XAov9SYvLGgzQWedLtqDBOXVYWM7uCN4ul4p6mbwV7vQJ7Vb0hNRTIfo4VLA=
X-Received: by 2002:a17:907:75f9:b0:99d:9b73:42f3 with SMTP id
 jz25-20020a17090775f900b0099d9b7342f3mr3487142ejc.54.1692002737736; Mon, 14
 Aug 2023 01:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <ZEwbPFW5p6jB0kLR@probook> <CACPK8XcONxSRa=5vq3uDxiAQww6ULVJr+OkQp3Q72MDLSJrBnQ@mail.gmail.com>
 <ZNll8LJYTNuolh9N@probook>
In-Reply-To: <ZNll8LJYTNuolh9N@probook>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Aug 2023 08:45:25 +0000
Message-ID: <CACPK8XeL4WN8J4VEikLqHadNptYvS=Ygx19XrTMLuvL0NSrOpg@mail.gmail.com>
Subject: Re: Upstreaming Nuvoton EMC (100 Mbit Ethernet MAC Controller) support
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: Avi Fishman <avifishman70@gmail.com>, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 13 Aug 2023 at 23:29, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.n=
et> wrote:
> > I have a npcm750 eval board that I can test it on, please cc me when
> > you post the patches.
>
> Unfortunately, I haven't been able to work on this project in quite a
> while, due to personal circumstances. I'm not sure when I'll be able to
> continue, but I still intend to do it.

No worries. Hope all is well. It will still be waiting when you next
have time to hack on it.

Cheers,

Joel
