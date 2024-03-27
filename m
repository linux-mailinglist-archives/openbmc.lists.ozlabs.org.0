Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0826888EC95
	for <lists+openbmc@lfdr.de>; Wed, 27 Mar 2024 18:25:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hLqa/TTO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4YTh4qSDz3vc8
	for <lists+openbmc@lfdr.de>; Thu, 28 Mar 2024 04:25:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hLqa/TTO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4YT53Qn5z3c7s
	for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2024 04:24:56 +1100 (AEDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-221a4f9557dso63970fac.2
        for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2024 10:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711560290; x=1712165090; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rco7kH/tQ43cM6aspb9oQ9qBbcZzchy6zVX6Y0JA7/E=;
        b=hLqa/TTO96mKkDN+UbssuPZ4V1/H3IEZkxvWy50WZsplYg6t5Vi8uRZBaysBXNWkom
         QU2dhy+MGvoPT6bz6AJ/jm8wYf9Vl227wGGcygV9CZeu6McLggzCHtBNKkafT3CMhXRB
         /hzck4AWfJpf0AAHjehE9Pz03qHIqV7RAFnak97tVX+CU34aq4+B+RXW1kmj7M6nMdrh
         VSFjXlzNqT+iFXd5NUm9k8ZbnHXtkQAbfR3KOTl23JZStEagRjaDCY8OX2hQn5K/anWs
         JUs0YxVyw9m6l+Iqjs3C4JkfWPGk3wb296k/f8uiRMUdVFYedS6iEq7BCN3lkb4/6P/r
         xSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711560290; x=1712165090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rco7kH/tQ43cM6aspb9oQ9qBbcZzchy6zVX6Y0JA7/E=;
        b=xDYeNGAGkIUMlqVYAVZBCPi/Vv2vZGqeewbKZ/dEjH9WtRuTfRAtJj+pkw5uRpJT+A
         3RC4r4kW5onMTGqo35tQwWjcm9RAobJg5MUg3v50YgiKofyuzNIricoyxeGopEEsE4qQ
         OD1tYGYLMqjpBtVyYodRERiIvQRml79axgOSpJFLKXi/1xbMmTrt0aTPRQfb9KcCXki/
         5KwKoT/9G8iegcmzRP9B4U2RrB0f/RYVOPf1lf4t2qjOpG/MHWsBGKMRbWW+Sjdajkji
         ijC0pDhbTC+K0pM/qyd92XStRHcAUgiQzZ9e9OQTmTRxp/+1Adt1DfPSE2rHDO47OPu1
         cAUg==
X-Gm-Message-State: AOJu0YzTgA7W/yyoI3Do7pQGkezOLradeFHXSw3W0YwfbhucWdREMZ36
	2AqSESFN8z+3HOZzuo1V/PRNCyEPi1KLxbaeYNZ0eTlml6bYqYcWBOjdKSxwT24Agq/xHJFS2KB
	yiQwwPiW0kYqOr87W5mNWPlb0aZpWmSX2m/k=
X-Google-Smtp-Source: AGHT+IHS1X6/VwIzvnLnfxSQWcSnRD30CVq6sgHi8EDNBVu29gWzKO7R+npgf9mh6HkbP4gTGLZ34d25tZegXAgUs1s=
X-Received: by 2002:a05:6870:15d0:b0:222:826f:163e with SMTP id
 k16-20020a05687015d000b00222826f163emr362490oad.5.1711560290098; Wed, 27 Mar
 2024 10:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <TY2PR04MB3952B507D338A69F62D05C16F1809@TY2PR04MB3952.apcprd04.prod.outlook.com>
 <TY2PR04MB39521A0024591D9C23B23B98F11EA@TY2PR04MB3952.apcprd04.prod.outlook.com>
 <PSBPR04MB3941258592D6A0926435CB49F1A8A@PSBPR04MB3941.apcprd04.prod.outlook.com>
 <SEYPR04MB7755655B6B105B3BC7496484F1342@SEYPR04MB7755.apcprd04.prod.outlook.com>
In-Reply-To: <SEYPR04MB7755655B6B105B3BC7496484F1342@SEYPR04MB7755.apcprd04.prod.outlook.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 27 Mar 2024 12:24:34 -0500
Message-ID: <CALLMt=r1e9CWafBL4DUSJFa=OhoWux7u1qwkcpLOxRF8RTj30A@mail.gmail.com>
Subject: Re: Quantas CCLA Schedule A update 2024-03-27
To: =?UTF-8?B?TGl0enVuZyBDaGVuICjpmbPliKnnkK4p?= <Litzung.Chen@quantatw.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, =?UTF-8?B?Q29zbW8gQ2hvdSAo5ZGo5qW35Z+5KQ==?= <Cosmo.Chou@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Mar 27, 2024 at 5:20=E2=80=AFAM Litzung Chen (=E9=99=B3=E5=88=A9=E7=
=90=AE)
<Litzung.Chen@quantatw.com> wrote:
>
> Hi team,
> Please find the attached file for updated Schedule A of CCLA from Quanta.

Thanks for keeping the CLA updated, I've uploaded the doc to our google dri=
ve.

Please update https://gerrit.openbmc.org/admin/groups/5d22bf462b81a6e5a0951=
86146374c73672d2f52,members
for all new/removed users.

Andrew
