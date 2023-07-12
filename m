Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2708755DFA
	for <lists+openbmc@lfdr.de>; Mon, 17 Jul 2023 10:12:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=BVmcnc4S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4FF15vL0z2yVn
	for <lists+openbmc@lfdr.de>; Mon, 17 Jul 2023 18:12:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=BVmcnc4S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=9elements.com (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=naresh.solanki@9elements.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1BHs11ZSz3bmQ
	for <openbmc@lists.ozlabs.org>; Wed, 12 Jul 2023 18:49:27 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7672303c831so620812585a.2
        for <openbmc@lists.ozlabs.org>; Wed, 12 Jul 2023 01:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1689151763; x=1691743763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6asCIJZfh89X/Pid3ai0oXZDotleMvJEDvS2yZNbiic=;
        b=BVmcnc4SJ4NNyAlLwbkYhFQsxpIE/2gt8dFBgtENtVwmo5KP/TuO9o+JVHkuWbAqRV
         rkOvgo+eB6VMX8332YE21U4AXOR1NPYhs/HJOrvrNl6zZtKqi82E0dIV8zuA9NWnEqJu
         1hlqBFuGx+tz8rmEG8cH77x8GEntkyjJX0qrV5Y9pJyxsPjpASMAJ7MHukrFv9TTa85W
         dOM+QqJSMSUf3LJozf/rjD/aOQFYdmK/16ZW9MyNLbjQWxh80tKUB81SFmTdWzDzAG0E
         3ilJ/ic+HknUn8rbAaMJQozGahvbyponRv0CfVi2dLsL7P2HEdqCdQCAwT/q+hTX0J+V
         hEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689151763; x=1691743763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6asCIJZfh89X/Pid3ai0oXZDotleMvJEDvS2yZNbiic=;
        b=RAD0WNfabRc12fUXxQJjLI3WFMZIGi0aOdaIo+GGjN/eW7MzllMgAyeMB6bqtEG2QF
         0yz2PLHCUqIMSxTMviRJF2IloPPlJIT+pizmhhuHXBBrnyH70veSadGRXOkd1ZCX/NkG
         Ln00hmkhZ52CZ/tbZn5znRex8ZIeRtusYD49GjRQWcL+ciLbQiii03XVSW0gWQHB66Uw
         2kO4eFf2gQlQT8yMJ/X/v2NE4oeO/Xz94BvDNTrTT7ZkfXIZjvN6IY9wCMK9cNPznby/
         ewohdlhsqx5FrNqkEEHHorVIEJZ8DTWxqNGZYGRTUf5nHClp3ZLqtb847D9cNWY/fSYy
         1P2g==
X-Gm-Message-State: ABy/qLbxtsoj9vrIT2KPHiyarhLqPuVN0xM57lpsVOdh091u2EAjzBd9
	rhPEeCqFcDg5RiLG7yaGKSu4JO8KPty8W5IYjx4qZg==
X-Google-Smtp-Source: APBJJlF72vy+DxMvN0aXWMy3infWehyApUye86ZMGblUGpIBDBNTDFaMkN4MymHVU2YOFBQEcRz7PWbxFRxdfoCgR7U=
X-Received: by 2002:ae9:d613:0:b0:765:381a:3487 with SMTP id
 r19-20020ae9d613000000b00765381a3487mr17442349qkk.57.1689151763171; Wed, 12
 Jul 2023 01:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230711160452.818914-1-Naresh.Solanki@9elements.com> <36752432-52e7-22e1-a2de-332749aa15a1@roeck-us.net>
In-Reply-To: <36752432-52e7-22e1-a2de-332749aa15a1@roeck-us.net>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Wed, 12 Jul 2023 10:49:11 +0200
Message-ID: <CABqG17gswZCgtc7ECZK=AJ8S3=QRQ_HW2ZmS=cLUSrq=63qOSQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] peci: Add Intel Sapphire Rapids support
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 17 Jul 2023 18:09:26 +1000
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, iwona.winiarska@intel.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Guenter,

On Tue, 11 Jul 2023 at 21:46, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/11/23 09:04, Naresh Solanki wrote:
> > Add support for detection of Intel Sapphire Rapids processor based on
> > CPU family & model.
> >
> > Sapphire Rapids Xeon processors with the family set to 6 and the
> > model set to INTEL_FAM6_SAPPHIRERAPIDS_X. The data field for this entry
> > is "spr".
> >
> > Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> > Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
>
> Please version your patches and provide change logs.
Yes, I missed that. Will be updated in the next patchset.
>
> Guenter
>
> > ---
> >   drivers/peci/cpu.c | 5 +++++
> >   1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
> > index de4a7b3e5966..3668a908d259 100644
> > --- a/drivers/peci/cpu.c
> > +++ b/drivers/peci/cpu.c
> > @@ -318,6 +318,11 @@ static const struct peci_device_id peci_cpu_device_ids[] = {
> >               .model  = INTEL_FAM6_ICELAKE_X,
> >               .data   = "icx",
> >       },
> > +     { /* Sapphire Rapids Xeon */
> > +             .family = 6,
> > +             .model  = INTEL_FAM6_SAPPHIRERAPIDS_X,
> > +             .data   = "spr",
> > +     },
> >       { /* Icelake Xeon D */
> >               .family = 6,
> >               .model  = INTEL_FAM6_ICELAKE_D,
> >
> > base-commit: 4dbbaf8fbdbd13adc80731b2452257857e4c2d8b
>

Regards,
Naresh
