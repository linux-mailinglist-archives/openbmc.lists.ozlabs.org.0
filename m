Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8008C429C06
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 05:38:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HT1bc1Byzz2yWG
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 14:38:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pV0vgowJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=jebr@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=pV0vgowJ; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HT1bD4KLgz2xsy
 for <openbmc@lists.ozlabs.org>; Tue, 12 Oct 2021 14:38:14 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id j5so81976325lfg.8
 for <openbmc@lists.ozlabs.org>; Mon, 11 Oct 2021 20:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3MPhQcBEH3yc5SsPjM3URYGVcVFfrJiyX1RDO2lNl0w=;
 b=pV0vgowJGpNE3jyk/X5vXo7thyF6af9paTpT3o8Y+/nIhVv+cb9ALTi6hRYAmwIGcj
 f1ToP0BOLzrxGDwqUTaW94pMMuMVZzhC4Je0pqs74ZZRDEW1RkgtPOlSKAQ2Gv4AR3vP
 uL2K1pcwsafej1rHWgpoVywsdOF2e4RiYaLZ65SPrB3i2kDIAyTeFSRN/ID6goKozPtJ
 m6RKOxMJNK9dr3OpVSJ9yR8IEKIoK2vAQ28bBYN5zcCf7mildZ05YQZaF3QLdWNQOV+f
 Vj9hOOcnj9jKyvu3HW+9Rg4qcE2tqcBfIKlv6zuLY9Je4rf/riuqBzrMUyjQhJTzxeLo
 y9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3MPhQcBEH3yc5SsPjM3URYGVcVFfrJiyX1RDO2lNl0w=;
 b=r4F6luBKl8ap08HQUgi9C49nXUHGFVtJkopNIOvtntzvg+47mlTstdadmRtu2fAiBc
 YzNiH6fUkfN8ewi+mEKIGpM8S1X8oJ/nPCgfh7r6nrhAv9nU0IFex3ClIxG55GHFVH0v
 pwToic1gKSHjn8JMU0GvRUksMT612+QASTSfcQEDcewU5WgXkEMtKTTRwueSdWHg4z6z
 uFPkiSIVoFLRUgpr7FtTgXpYC0C7NCPELMfBmsIK2sknwX1QzhrVdAjTxgvfKooR9obN
 2+4njeYVJApXagiqZX4oDm32HSGY9AYEMXnnV3jDHG6EDmY+T6QunGZsx0hecuXihvmo
 avNA==
X-Gm-Message-State: AOAM5331ZKS/tC+YmbeWTc1Qqk+YuyWCq2SE9JBmeKPLA+yW9UNaqH9R
 wJCr4xyqGTmZHhfU7Z+jcT0vOgMZzdI+nOnejLUSJw==
X-Google-Smtp-Source: ABdhPJxhvcQ39x718ni8C73cmSgMmejpg9kY5NeAhApiD0gdNeoH6IeDDZ65cPZrM79fdc3rUjMCN7mgsrwOaiqasZM=
X-Received: by 2002:a2e:bc03:: with SMTP id b3mr26994361ljf.54.1634009884634; 
 Mon, 11 Oct 2021 20:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <PS2PR02MB35412394ABF3E0441D72627E90B69@PS2PR02MB3541.apcprd02.prod.outlook.com>
In-Reply-To: <PS2PR02MB35412394ABF3E0441D72627E90B69@PS2PR02MB3541.apcprd02.prod.outlook.com>
From: John Broadbent <jebr@google.com>
Date: Mon, 11 Oct 2021 20:37:53 -0700
Message-ID: <CAPw1Ef-s-eXPs-8KmHLUyRav0JTWLHRDdLKsGFaKTWmkoeiQzg@mail.gmail.com>
Subject: Re: Etag support in openbmc
To: "Mohammed.Habeeb ISV" <mohammed.habeeb@inventec.com>
Content-Type: multipart/alternative; boundary="000000000000bc3a6505ce1f9222"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000bc3a6505ce1f9222
Content-Type: text/plain; charset="UTF-8"

I don't think bmcweb support etags. I have never seen logic from them and
Ed made a comment about how bmcweb will have to support them in the future
here https://github.com/openbmc/webui-vue/issues/43#issue-728321615

But I defer to Ed, and Gunner.

Thank you
John Broadbent

On Mon, Oct 11, 2021 at 8:03 PM Mohammed.Habeeb ISV <
mohammed.habeeb@inventec.com> wrote:

> Hi
>
> Do we have the Etag support in OpenBMC? I see there is a mention of ETag
> in
> bmcweb file redfish-core/src / error_messages.cpp, however not sure if
> Etag is supported.
> Please let me know.
>
> Regards
>

--000000000000bc3a6505ce1f9222
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t think bmcweb support etags. I have never seen =
logic from them and Ed made a comment about how bmcweb will have to support=
 them in the=C2=A0future here=C2=A0<a href=3D"https://github.com/openbmc/we=
bui-vue/issues/43#issue-728321615">https://github.com/openbmc/webui-vue/iss=
ues/43#issue-728321615</a><div><br></div><div>But I defer to Ed, and Gunner=
.</div><div><br></div><div>Thank you</div><div>John Broadbent</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, =
Oct 11, 2021 at 8:03 PM Mohammed.Habeeb ISV &lt;<a href=3D"mailto:mohammed.=
habeeb@inventec.com">mohammed.habeeb@inventec.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hi <br>
<br>
Do we have the Etag support in OpenBMC? I see there is a mention of ETag in=
 <br>
bmcweb file redfish-core/src=C2=A0/=C2=A0error_messages.cpp, however not su=
re if Etag is supported.<br>
Please let me know.<br>
<br>
Regards<br>
</blockquote></div>

--000000000000bc3a6505ce1f9222--
