Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBC129624D
	for <lists+openbmc@lfdr.de>; Thu, 22 Oct 2020 18:01:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHBtW5mjtzDqvy
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 03:01:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::330;
 helo=mail-ot1-x330.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hl4lgaG3; dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHBsH4ZpZzDqnB
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 03:00:17 +1100 (AEDT)
Received: by mail-ot1-x330.google.com with SMTP id o14so1391633otj.6
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2020 09:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=uRA70A3alqcTP5IFJ4j+m/Tpm8g+8rYV59f71TeH4nA=;
 b=hl4lgaG39zgW6SHKNBcUXGxIWtuFEslVp40jN/WLmcaOBHrYeE4AHU5gzVO+yDqWQ0
 myAtldqevMJD33JFczt/I0nzOhPG+9JrUxlMfd0QDEL6M8eA4GLrJSFH1axkx0MOTt6M
 ShHPBswOwlClwbS5rwjvoX6tzaZ5h4IzwUrexcigvSBqkBZPp76pMkIZ4S57ucLGkYDe
 4nTHzDR1xcC0ynV7Q0Q93GWwdwmfEOkz1Py/xUwBHKM2ckIfZXgXDANDg3k9W8SCEJnJ
 RXv/HVgyzYn83nud4nNhYyvzGb6VQOeHdjU4f0hsRxCyBF7hlByoUB5ow2n8Yemw5i8w
 cETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=uRA70A3alqcTP5IFJ4j+m/Tpm8g+8rYV59f71TeH4nA=;
 b=Liz7f8K2jAAHAqqASq2dO9DZsNXoD4UF5/YqExV0/Ll8Si842fOc6aXt56ZIYrvtWT
 MepsWJGiX7h/wLqP0M+T6v5+OL/ZgSEmjzzItDrztTpWNFrqwt7v8E6VBM86Zfg6xlaO
 Y3N55dEr30km7KwWxydzntWQ8e4BGsZYzGAK8LTM2Vq7g/QsTDAgGb9keEtTmA9KdIZK
 up4wdtD5e2+TgT4sTB1tnHxHP8/vt2oRFe4oFLgjd1JMe0CVUnlw+1/AdZKBLWtMzSW9
 gKGogZjp4RxtJtx19Ycl/buUu+MsioMbwoNyr6kJiiCwAaT9Us7yNBVTiQRJjH16Cg9R
 OruA==
X-Gm-Message-State: AOAM533tv9l3xV7KFdghwpwwZW7lx9AhLUVLsHnkvsrDBc/e/d1cv0Kj
 4T2O16C4FimIMCrFaf79ybtQ0dj8kBJOyw==
X-Google-Smtp-Source: ABdhPJx3vssirqdiI+bZcuOA5I5w+A4SKTjfu5PnBAkERBVgHT/OOnFE38JVqA7orryb5loYYknB+g==
X-Received: by 2002:a9d:6b99:: with SMTP id b25mr2236278otq.60.1603382415665; 
 Thu, 22 Oct 2020 09:00:15 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
 by smtp.gmail.com with ESMTPSA id f18sm508588otp.10.2020.10.22.09.00.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Oct 2020 09:00:14 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: Critical BMC process failure recovery
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <20201020142846.GB5030@patrickw3-mbp.lan.stwcx.xyz>
Date: Thu, 22 Oct 2020 11:00:14 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <A7171080-B143-42AD-B235-951A06B247A4@gmail.com>
References: <C270F145-2236-4CA1-8D57-A63AB622A47C@gmail.com>
 <20201020142846.GB5030@patrickw3-mbp.lan.stwcx.xyz>
To: Patrick Williams <patrick@stwcx.xyz>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
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



> On Oct 20, 2020, at 9:28 AM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>=20
> Hi Andrew,
>=20
> I like the proposal to reuse what systemd already provides.  It does
> look like Lei pointed to some existing bbclass that could be enhanced
> for this purpose so that any recipe can simply 'inherit ...' and maybe
> set a variable to indicate that it is providing "critical services=E2=80=
=9D.

Yeah, looks like currently it opts in every service (except for a few =
special
cases). I like the idea of putting it on the individual service to
opt itself in. I=E2=80=99ve def seen what James mentions in his response
where you get in situations where the BMC is rebooting itself too
much due to non-critical services failing.

>=20
> On Mon, Oct 19, 2020 at 02:53:11PM -0500, Andrew Geissler wrote:
>> Greetings,
>>=20
>> I've started initial investigation into two IBM requirements:
>>=20
>> - Reboot the BMC if a "critical" process fails and can not recover
>> - Limit the amount of times the BMC reboots for recovery
>>  - Limit should be configurable, i.e. 3 resets within 5 minutes
>=20
> I like that it has a time bound on it here.  If the reset didn't have =
a
> time bound that would be a problem to me because it means that a slow
> memory leak could eventually get the BMCs into this state.
>=20
> Do you need to do anything in relationship with the WDT and failover
> settings there?  I'm thinking you'll need to do something to ensure =
that
> you don't swap flash banks between these resets.  Do you need to do N
> resets on one flash bank and then M on the other?

I=E2=80=99m hoping to keep the flash bank switch a separate discussion. =
The key
here is to not impact whatever design decision is made there.

We=E2=80=99re still going back and forth a bit on whether we want to =
continue
with that automatic flash bank switch design point. It sometimes causes
more confusion than it=E2=80=99s worth.

I know we did make this work with our Witherspoon system from
a watchdog perspective. We would reboot a certain amount of times
and swap flash banks after a certain limit was reached. I=E2=80=99m not=20=

sure how we did it though :)

>=20
> It seems that the most likely cause of N resets in a short time is =
some
> sort of flash corruption, BMC chip error, or a bug aggravated some =
RWFS
> setting.  None of these are particularly recovered by the reset but at
> least you know your in a bad situation at that point.

Yeah, I would really like some data on how often a reboot of the
BMC really does fix an issue. The focus for us should def be on
avoiding the reboot in the first place. But the reboot is our last
ditch effort.

>=20
>>  - If limit reached, display error to panel (if one available) and =
halt
>>    the BMC.
>=20
> And then what?  What is the remediation for this condition?  Are there
> any services, such as SSH, that will continue to run in this state?  I
> hope the only answer for remediation is physical access / power cycle.

I believe the best option (and what we=E2=80=99ve done historically) is =
to try and
put an error code on the panel and halt in u-boot, requiring physical
access / power cycle to recover.

>=20
> --=20
> Patrick Williams

