Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA41E6DE6B1
	for <lists+openbmc@lfdr.de>; Tue, 11 Apr 2023 23:53:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Px02L4Tm2z3cMk
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 07:52:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PuUXBYIP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=PuUXBYIP;
	dkim-atps=neutral
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Px01m3vHZz3bgX
	for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2023 07:52:28 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id sh8so23924493ejc.10
        for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2023 14:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1681249939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ankaDXyjcPYSJ3FV8f04K6Ajffe5Zk3/MVnzcf6nVUk=;
        b=PuUXBYIP+aovIKHJnpb8pdpldNrbKO+xYyFl7TsS+sxlYIzohBFN9iSMPQBMComL5U
         0SuduFrC2DCij1Xg4kyEBwS4U2mAnSNEgbrgwQs+TTguTpcbuYXfLfVAvKWKzkn/paG+
         BZ7S8NaPQIVRaE2F3b4agn+ln249N6aHD4u9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681249939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ankaDXyjcPYSJ3FV8f04K6Ajffe5Zk3/MVnzcf6nVUk=;
        b=ZX7W5IfNuISM7H/VEBFq6G8VKMpJmcBHn0Td9tvJ3kOH9uEbypiTTAX6lr/dKp03wV
         bZdINnL9F49bbqE8B6ExkuV9mcqPb4VQsijA1Y9GMtREg7x5KJAhZxOI746t/YOgpd0p
         QFyKcNH39ozRu3az093c4jG71lDhMFUoRG6JnkXn3RVR7KewttnZ+uY154h1//pH4lhe
         HQPl9Wy6lnzpGGfxlBLeGkUXSWUwNzpWuvVgo5WvnNuEtF4oXejN5sHY6xEOGXwfSBF7
         KPlmhJKICnxR2Mcemu0zRK9NKqFQcyWa2fwcN+gPvt7PcsVtIpf8IOXw4Y4KJoxx1eue
         X2SA==
X-Gm-Message-State: AAQBX9cShSRAReO7gsc4vvmX7v0WCkif5beaYN42frdDBivPG7bE/Z9x
	Hml4K3UhiMvCsC2Ybgwmb3MWeDvI36MQ3brwtGg=
X-Google-Smtp-Source: AKy350ampS09HSMWHyFho/bxSAvJrVUkDryceYM80+cFrWQHvh+IJlEge66h3AuaJ+c4iDmEeuVtMr8oWVTFvfUOqaw=
X-Received: by 2002:a17:906:380c:b0:931:2bcd:ee00 with SMTP id
 v12-20020a170906380c00b009312bcdee00mr6233391ejc.15.1681249939383; Tue, 11
 Apr 2023 14:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <191F3605-11DF-4870-AB07-B4A31169B3D2@hpe.com> <CACPK8Xd2kGxq1sb7DKZ0qXoinYygk6WvPTVqy84kgznGrBPdOA@mail.gmail.com>
 <4044DFC4-7175-4E59-9A99-2EE355FF415D@hpe.com> <CACPK8Xdvcs2LTSdqWcEW-Ppp8NEf=xBkgAw8ytF8Vm=AAVENUA@mail.gmail.com>
 <DM4PR84MB1927024A45E10D117778C393889A9@DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <DM4PR84MB1927024A45E10D117778C393889A9@DM4PR84MB1927.NAMPRD84.PROD.OUTLOOK.COM>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 11 Apr 2023 21:52:06 +0000
Message-ID: <CACPK8XcwmWrJiS99AhWhPYUk0Xf4b+q4usNB-+45hf6iQD-=mA@mail.gmail.com>
Subject: Re: GXP support into OpenBMC kernel
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Verdun, Jean-Marie" <verdun@hpe.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 11 Apr 2023 at 15:04, Hawkins, Nick <nick.hawkins@hpe.com> wrote:
>
>
> > I've picked all of the GXP patches from mainline that were merged
> > after 6.1 that I could find. Take a look here, if it looks okay I'll
> > merge them into the openbmc tree:
>
> > https://github.com/shenki/linux/commits/dev-6.1
>
> Reviewed-by: Nick Hawkins <nick.hawkins@hpe.com>
>
> Hi Joel,
>
> This looks great! Thank you for doing this.

I've pushed that out now.

> On a side note just for your FYI:
> There is a planned slight modification to the fan driver that I will be
> sending up for review in upstream. We will be pulling its access to
> the fn2 registers and moving that check into GPIO. We also will
> hopefully be adding a way for a new GPIO driver to grab fan data
> from the fan driver.

Okay, good luck!

From here on in, whenever patches are ready for inclusion then please
send me a link to the mailing list submission, or to the upstream git
SHA.

The rule is anything being actively submitted for upstream inclusion
is able to be put in the openbmc tree. This means code that is ready
but hasn't made the merge window, or patches that are reviewed but the
upstream maintainer is slow to merge.

Cheers,

Joel
