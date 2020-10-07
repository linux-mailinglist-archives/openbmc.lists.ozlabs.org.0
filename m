Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85593286058
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 15:40:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5wT71QyNzDqPK
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 00:40:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d2f;
 helo=mail-io1-xd2f.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dZFLnwFa; dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5wQx3Qy1zDqNV
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 00:38:48 +1100 (AEDT)
Received: by mail-io1-xd2f.google.com with SMTP id y20so2368119iod.5
 for <openbmc@lists.ozlabs.org>; Wed, 07 Oct 2020 06:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:mime-version:subject:from:in-reply-to
 :date:cc:message-id:references:to;
 bh=yD4l7OtpmIenKrfu8MT6mZTprr/0znq8f93A2EOO97c=;
 b=dZFLnwFakhIuDheycjwkPOi8FHwV8z9EIe2vC4wbDh0hhsCv5MY3UfvS81K5B2+S0A
 7eOV82ZZZRMps/g38ri7DqkRTj4Hb4hbntOx3hoFaL+ZsfbIibVyfJHr4AWpU4JyJCKb
 MKmmalkZpK27pUEpzRmdAEixOgAeZ7GDzP5DTYesFDZ8BGU9mmjvLrJZqWq5v/NZTTpj
 UX/HfQAWxxx9M/7AQjw6ohiL8jMILqMpeGtZQz7jlq/Cgh4BFkMHrreEih62jc1cTgPD
 xGW0/fi93VpIWJLaYbQkG8tNMRMlnmHj/gPEk11pRHzIDijgQYETSvT9s40KxbK++eF2
 i/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:mime-version:subject
 :from:in-reply-to:date:cc:message-id:references:to;
 bh=yD4l7OtpmIenKrfu8MT6mZTprr/0znq8f93A2EOO97c=;
 b=XL/7cC5aKPCRYimuQYCvqiUpL81iDtubV7KF3n+BLHAVo2oPNuid7utgojyt0QnmPy
 Z0Y2A2sGc7P6eQ8bSl9UEqcKgYkGKCmS2X1LQK9uYDhPExP4dw5ourXt3kEwwtIOkSbA
 z6/9ZGAdYjr/1fYvAsvMrsQWLV+fmCLPiEII772/zjQsGIorncjzrXy11DtmAaXtUT/K
 wmoXkok9rCg8f3HU7fwFh4vqwQCuoGWDBDtiFlH3crh6eMhBP2NOvvYHzlJqvBzEXr6v
 armlgL8eHudIzgnqIuFvfO7Tv8DxBElzBDMk7Xoo38iyo5RRHdoCrCRBvcnCHCnphkmS
 eGlg==
X-Gm-Message-State: AOAM533CfBuw+AxwGkQtlhmjF+anaRK3r6jjSe2mO+SjIJdkZgqw1vDA
 +DD3qSPnVtGwxkeLzl0P1JM=
X-Google-Smtp-Source: ABdhPJyankYgVcnLjno2KZ1bgCMhpB4ocDoczJAzjWF8RAl/WQQUBowApuoRGCiG0zZOtVDeuopkWQ==
X-Received: by 2002:a6b:fb0d:: with SMTP id h13mr2397121iog.12.1602077925159; 
 Wed, 07 Oct 2020 06:38:45 -0700 (PDT)
Received: from [192.168.1.145] (75-163-214-222.clsp.qwest.net.
 [75.163.214.222])
 by smtp.gmail.com with ESMTPSA id n138sm882368iod.40.2020.10.07.06.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 06:38:44 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: LTC2991 Driver request
From: Mike <proclivis@gmail.com>
In-Reply-To: <CABbLDjM5R6DaGz1PKtMHwTiA4z++8Vos6caTD_=Uumoys477uA@mail.gmail.com>
Date: Wed, 7 Oct 2020 07:38:42 -0600
Message-Id: <FD04349F-923A-4F14-A17B-12E7075DF2B2@gmail.com>
References: <CABbLDjM5R6DaGz1PKtMHwTiA4z++8Vos6caTD_=Uumoys477uA@mail.gmail.com>
To: Anony Mous <obmc.developers@gmail.com>
X-Mailer: iPhone Mail (17H35)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Anony,

This part is supported by my team at ADI. I can write a driver if necessary.=


I=E2=80=99ll take a look at the DS and similar drivers this morning and resp=
ond.

What is your timeframe?

Mike Jones



Sent from my iPhone

> On Oct 6, 2020, at 7:32 PM, Anony Mous <obmc.developers@gmail.com> wrote:
>=20
> =EF=BB=BF
> Does anyone have a driver for the Linear Technology LTC2991 Octal monitor c=
hip?
>=20
> Thank you!
>=20
