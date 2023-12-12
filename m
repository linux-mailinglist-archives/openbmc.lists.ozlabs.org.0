Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF6B80E146
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 03:13:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JPM0qm1p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq2Fz1lXSz3bhc
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 13:13:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JPM0qm1p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq2FM4vZhz30Np
	for <openbmc@lists.ozlabs.org>; Tue, 12 Dec 2023 13:12:38 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a1e116f2072so1058046766b.0
        for <openbmc@lists.ozlabs.org>; Mon, 11 Dec 2023 18:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1702347150; x=1702951950; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h+wU57+ALtXnm4d/pbo7HJyJDvSp41woR8MJY1In6JE=;
        b=JPM0qm1p10K3jidQDf44Mf/OIQgDRucJ/z0Mz10dGpd4I+J/Yrb4kf32VGtWXlMlik
         zAsz07D8AfcAG8/5Vmt1mVy8kqOT4S958BdCjBeVRq7o07leZs72+TAkYFcJxSnhWk2r
         jLDRhtZe0axOZodBjCsx4kNwABWy67RnSRR8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702347150; x=1702951950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+wU57+ALtXnm4d/pbo7HJyJDvSp41woR8MJY1In6JE=;
        b=s3j2LsHITk0iBJ19kYDjmIbU/omG93v6ThQDoPG5G8ucIcG6dNS/1BN4m9MkCj0O5j
         2+Vjj0hVQ5wnxVQcLmbClfLv09wjiFU79fQ0oBzdBKX8SGlAT8qvmBwfQkiSAgmBhZ0d
         OnBltcCIiY8pjG2bBtthwwVqEXViXiGifyyUTAogJxjLaC1d1ILPWMJafgYuvCW8cfAT
         olxEnJRxzdHHCaejxwLfxme34AjjtaHVp47AmWWmiL4x7dOrifoc91qSaUbQmu+8IzKo
         7YMMhWWP2/elopzGmaSV+u/KC2KjmGLQQSfeKEJL2Df9WdCw1R/bEFGzO/eJxaprbQpa
         q+2g==
X-Gm-Message-State: AOJu0Yx3e4fM+9CtgAa/b0eHsigUNcexQ7ZDfd9y2oxzWGZ9cMu8AMeI
	yIjcEJWYa164m3R907nknJx12B6cxt9s++2wGrE=
X-Google-Smtp-Source: AGHT+IGjqndG35OnZA2KC5CBFAmhGnmXCszC6GPvHFDSXywi4lYy3+p0JeN80VSX7m84mJ+fYpxUxsUk5yMQMMfKnQU=
X-Received: by 2002:a17:907:6d05:b0:a1e:63ec:f0c5 with SMTP id
 sa5-20020a1709076d0500b00a1e63ecf0c5mr7235867ejc.40.1702347150250; Mon, 11
 Dec 2023 18:12:30 -0800 (PST)
MIME-Version: 1.0
References: <20231108082019.1601366-1-Delphine_CC_Chiu@Wiwynn.com>
 <CACPK8Xc4NM_F4tBrZZe08r1=RYoe72=DbZNWSaK3E1_i18zjYQ@mail.gmail.com>
 <CACPK8Xfb7pG6sTcx3_A8sPAgiC08A6Q8je0R+7c=eUYxuS601w@mail.gmail.com> <SG2PR04MB5543CB6774F6A5CC80501D94A1B1A@SG2PR04MB5543.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB5543CB6774F6A5CC80501D94A1B1A@SG2PR04MB5543.apcprd04.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 12 Dec 2023 12:42:18 +1030
Message-ID: <CACPK8XdGnc44AMtOWoz22BNw-JRG3sF+e9W8wQSt=1FajzvsRw@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.5 v4 0/2] LTC4286 and LTC4287 driver support
To: "Delphine_CC_Chiu/WYHQ/Wiwynn" <Delphine_CC_Chiu@wiwynn.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 15 Nov 2023 at 19:24, Delphine_CC_Chiu/WYHQ/Wiwynn
<Delphine_CC_Chiu@wiwynn.com> wrote:
>
> > -----Original Message-----
> > From: Joel Stanley <joel@jms.id.au>
> > Sent: Friday, November 10, 2023 10:35 AM
> > To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>;
> > Andrew Jeffery <andrew@codeconstruct.com.au>
> > Cc: patrick@stwcx.xyz; openbmc@lists.ozlabs.org
> > Subject: Re: [PATCH linux dev-6.5 v4 0/2] LTC4286 and LTC4287 driver support
> >
> >   Security Reminder: Please be aware that this email is sent by an external
> > sender.
> >
> > On Wed, 8 Nov 2023 at 21:51, Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > On Wed, 8 Nov 2023 at 18:50, Delphine CC Chiu
> > > <Delphine_CC_Chiu@wiwynn.com> wrote:
> > > >
> > > > v4 - Add LTC4286 and LTC4287 binding document
> > > >    - Add LTC4286 and LTC4287 driver
> > >
> > > This is v4, but the first version you've sent to the openbmc list. I
> > > can't see an upstream v4, and v3 has changes requested.
> > >
> > > It would be best if you finished getting review from Guneter, and then
> > > sent that version to the openbmc list for merging. Include a link to
> > > the upstream submission in your cover letter so we know what is going
> > > on.
> >
> > I didn't get a response from you.
> >
> > I did see you posted some more patches, both to the upstream list and to
> > openbmc. It's not helpful, please get your patches reviewed upstream and once
> > you've got them applied there, then send them to the openbmc list.
> >
> > Can you please respond to my mail if this makes sense and you agree.
>
> Sorry for not responding you.
> We agree with your suggestion.
> However, we have discussed with upstream back and forth.
> We almost complete this driver.
> Moreover, other projects in OpenBmc want to use this driver.
> But we are not sure about when this driver could be merged.
> So, we are wondering if there is any chance you can merge this driver first for OpenBmc use.

You need to make this case when sending the backport. Please include
that information in the cover letter, and make your case as to why we
should spend the extra development effort carrying the patch that is
still under review.

Currently you seem to send the patches to both the upstream list and
to openbmc at the same time, which does not work for me. I have some
new rules for getting the patches merged into openbmc:

1. Do not send them for backporting to the dev-6.6 branch until they
have been reviewed upstream. This means you have Reviewed-by or
Acked-by tags on at least a majority of the patches in a series before
you send them to the openbmc list.
2. Find reviewers for your upstream patches. Get other Facebook
employees, get other openbmc contributors to review your patches. A
good way to encourage others to review your patches is to first review
thiers.
3. When you do send the patches for backporting, include a
justification in the cover letter for why they should be backported.
For example: "These patches are merged upstream" or "the changes under
active review, but we wish to have them in the openbmc tree because it
has been ongoing for more than two weeks".

Your latest upstream patchset produces a large number of warnings when
I applied it to the 6.7-rc1 tree. This shows you are not compiling
your changes before submitting.

Please engage with me and the other developers on this issue so we can
help each other get the changes up to scratch and merged.

Cheers,

Joel
